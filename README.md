# NVIDIA HPC Benchmark 硬體相容性測試
我們親愛的 NVIDIA 在 HPC Benchmark 的官方文件那叫一個殘缺不全，以至於隨便下載一個容器映像檔下來後，能不能跑都要靠通靈，遂製作了這些表。  
NVIDIA 的 GPU 每代的架構所對應的計算能力 CC 都不同，如果當前硬體的 CC 低於編譯的 CC 版本，那大概率是無法正確執行。   
如果該版本的執行檔中並沒有你當前的硬體所對應的 CC，而且實際嘗試後也無法正常運行，那就別浪費時間直接換低版本吧。  

## 這是甚麼
在編譯 CUDA 程式碼時，需要告訴 nvcc 要為哪個顯卡架構編譯二進制檔案，也就是 `-gencode, -arch, -code` 等選項。  
對於一個計算能力，假設是 V100 的 7.0，那編譯時的代號就會是 sm_70。  
本紀錄用 `cuobjdump -lelf <exec>` 來檢查每個版本的 image 中， Benchmark 執行檔當時編譯時所選擇的計算架構。  

## NVIDIA SM Generation List
| Architecture | Compute Capability | Examples |
| :--- | :--- | :--- |
| **Fermi** | 2.0, 2.1 | **GeForce:** GTX 400/500 series <br> **Tesla:** C20xx, M20xx |
| **Kepler** | 3.0, 3.5, 3.7 | **GeForce:** GTX 600/700 series, Titan series <br> **Tesla:** K series (e.g., K80, K40) |
| **Maxwell** | 5.0, 5.2 | **GeForce:** GTX 900 series <br> **Tesla:** M series (e.g., M60, M40) |
| **Pascal** | 6.0, 6.1 | **GeForce:** GTX 10 series <br> **Tesla:** P series (e.g., P100, P40) |
| **Volta** | 7.0 | **GeForce:** NVIDIA TITAN V <br> **Tesla:** V series (e.g., V100) |
| **Turing** | 7.5 | **GeForce:** RTX 20 series, GTX 16 series <br> **Tesla:** T series (e.g., T4) |
| **Ampere** | 8.0, 8.6 | **GeForce:** RTX 30 series <br> **Datacenter:** A series (e.g., A100) |
| **Ada Lovelace**| 8.9 | **GeForce:** RTX 40 series <br> **Datacenter:** L series (e.g., L40, L4) |
| **Hopper** | 9.0 | **Datacenter:** H series (e.g., H100, H200) <br> *(No GeForce cards)* |
| **Blackwell** | 10.0, 12.0 | **GeForce:** RTX 50 series <br> **Datacenter:** B series (e.g., B200, B100) |

[From wiki](https://en.wikipedia.org/wiki/CUDA#GPUs_supported)

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
