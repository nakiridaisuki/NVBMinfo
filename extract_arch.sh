#!/bin/bash
set -e

DATA_DIR=./datas
RESULT_DIR=./processed
TYPES=$(cat $HOME/NVBMinfo/all_types)

rm -rf $RESULT_DIR
mkdir -pv $RESULT_DIR

for type in $TYPES; do
    echo $DATA_DIR/$type
    ids=$(ls -1 $DATA_DIR/$type | sort -V -)
    for file_id in $ids; do
        sort -t "_" -k 2n -k 2 $DATA_DIR/$type/$file_id | \
        awk -F"." -v file_id=$file_id '
            BEGIN { printf "%s", file_id; }
            !seen[$(NF-1)]++ { printf ",%s", $(NF-1) }
            END { print "" }' >> $RESULT_DIR/$type
    done
    all_sms=$(awk -F"," ' { for(i=2; i<=NF; i++) { if(!seen[$i]++) print $i } } ' $RESULT_DIR/$type |
    sort -t"_" -k 2n -k 2 |
    awk ' { printf "%s ", $0 } ')

    awk -F"," -v table_head="$all_sms" -v type=$type '
        BEGIN { 
            print "## " type
            printf "|%-12s|", "version"; 
            split(table_head, sms, " "); 
            for(i=1; i<=length(sms); i++) printf "%-8s|", sms[i];
            print ""
            for(i=0; i<=length(sms); i++) printf (i ? "%-8s|" : "|%-12s|"), ":---:";
            print ""
        }
        {
            printf "|%-12s|", $1;
            for(j=1; j<=length(sms); j++){
                finded = 0
                for(i=2; i<=NF; i++)
                    if($i == sms[j]){
                        printf "%-8s|", "O";
                        finded = 1;
                        break;
                    }
                if(!finded) printf "%-8s|", "";
            }
            print "";
        }
        END { print "" }' $RESULT_DIR/$type >> $RESULT_DIR/tables
done