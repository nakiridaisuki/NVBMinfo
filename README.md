# NVIDIA HPC Benchmark 硬體相容性測試
我們親愛的 NVIDIA 在 HPC Benchmark 的官方文件那叫一個殘缺不全，以至於隨便下載一個容器映像檔下來後，能不能跑都要靠通靈，遂製作了這些表。  
NVIDIA 的 GPU 每代的架構所對應的計算能力 CC 都不同，如果當前硬體的 CC 低於編譯的 CC 版本，那大概率是無法正確執行。   
本紀錄用 `cuobjdump -lelf <exec>` 來檢查每個版本的 image 中， Benchmark 執行檔當時編譯時所選擇的計算架構。   
如果該版本的執行檔中並沒有你當前的硬體所對應的 CC，而且實際嘗試後也無法正常運行，那就別浪費時間直接換低版本吧。  

## NVIDIA SM Generation List
計算架構與 CC 的參考對應表
| Architecture | Compute Capability | Examples |
| --- | --- | --- |
| Blackwell | sm_100,sm_101,sm_120 | Upcoming GPUs |
| Hopper | sm_90,sm_90a | H100, H200 |
| Ada_Lovelace | sm_89 | RTX 50 Series |
| Ampere | sm_80,sm_86,sm_87 | RTX 30 Series, A100, A6000 |
| Turing | sm_70,sm_72,sm_75 | RTX 20 Series, GTX 16 Series, Quadro RTX |
| Volta | sm_70,sm_72 | V100, some Xavier devices |
| Pascal | sm_60,sm_61,sm_62 | GTX 10 Series |
| Maxwell | sm_50,sm_52,sm_53 | GTX 900 Series, RTX 900M Series |
| Kepler | sm_30,sm_35,sm_37 | GTX 700 Series, GTX 600 Series |
| Fermi | sm_20 | GeForce 500 Series |
> Generate by Google AI at 2025
> You had better to search yourself.

## 雙精度浮點測試 HPL
|version     |sm_52   |sm_60   |sm_70   |sm_80   |sm_89   |sm_90   |sm_100  |sm_100a |sm_101  |sm_101a |sm_120  |
|:---:       |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |
|20.10-hpl   |        |O       |O       |O       |        |        |        |        |        |        |        |
|21.4-hpl    |        |O       |O       |O       |        |        |        |        |        |        |        |
|23.3        |O       |        |        |O       |        |O       |        |        |        |        |        |
|23.5        |O       |        |        |O       |        |O       |        |        |        |        |        |
|23.10       |O       |        |        |O       |        |O       |        |        |        |        |        |
|24.03       |        |        |        |O       |        |O       |        |        |        |        |        |
|24.06       |        |        |        |O       |        |O       |        |        |        |        |        |
|24.09       |        |        |        |O       |        |O       |        |        |        |        |        |
|25.02       |        |        |        |O       |        |O       |O       |        |        |        |        |
|25.04       |        |        |        |O       |        |O       |O       |O       |O       |O       |O       |
|25.09       |        |        |        |O       |O       |O       |O       |O       |O       |O       |O       |

## 雙精度頻寬測試 HPCG
|version     |sm_50   |sm_60   |sm_61   |sm_70   |sm_75   |sm_80   |sm_86   |sm_90   |sm_100  |sm_100a |
|:---:       |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |:---:   |
|20.10-hpcg  |        |O       |        |O       |        |O       |        |        |        |        |
|21.4-hpcg   |        |O       |        |O       |        |O       |        |        |        |        |
|23.3        |O       |O       |O       |O       |O       |O       |O       |O       |        |        |
|23.5        |O       |O       |O       |O       |O       |O       |O       |O       |        |        |
|23.10       |O       |O       |O       |O       |O       |O       |O       |O       |        |        |
|24.03       |O       |O       |O       |O       |O       |O       |O       |O       |        |        |
|24.06       |        |        |        |        |        |O       |        |O       |        |        |
|24.09       |        |        |        |        |        |O       |        |O       |        |        |
|25.02       |        |        |        |        |        |O       |        |O       |        |O       |
|25.04       |        |        |        |        |        |O       |        |O       |        |O       |
|25.09       |        |        |        |        |        |O       |        |O       |O       |        |

## 混合精度浮點測試 HPL-MxP & HPL_AI
### xhpl_ai
|version     |sm_60   |sm_70   |sm_80   |sm_90   |
|:---:       |:---:   |:---:   |:---:   |:---:   |
|20.10-hpl   |O       |O       |O       |        |
|21.4-hpl    |        |O       |        |        |
|23.3        |        |O       |O       |O       |
|23.5        |        |O       |O       |O       |

### xhpl_mxp
|version     |sm_80   |sm_90   |sm_100a |
|:---:       |:---:   |:---:   |:---:   |
|23.10       |O       |O       |        |
|24.03       |O       |O       |        |
|24.06       |O       |O       |        |
|24.09       |O       |O       |        |
|25.02       |O       |O       |O       |
|25.04       |O       |O       |O       |
|25.09       |O       |O       |O       |

## 參考
[nvidia hpc benchmark](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/hpc-benchmarks?version=25.09)  
[cuobjdump](https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html#cuobjdump)  
[compute capability](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#compute-capabilities)  
Google AI Studio Gemini 2.5 Pro  
