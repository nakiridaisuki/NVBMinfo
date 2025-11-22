#!/bin/bash

RESULT=./result
XHPL_DIR=execs
xhpls=$(ls -1 $XHPL_DIR/*)

rm $RESULT

for xhpl in $xhpls; do
    echo ${xhpl/$XHPL_DIR\/}: | tee -a $RESULT
    cuobjdump -lelf $xhpl | tee -a $RESULT
    echo -e ' ' | tee -a $RESULT
done