| [中文](./README.md) | [English](./README_en.md) |
> Translated by Gemini 2.5 Pro
# NVIDIA HPC Benchmark Hardware Compatibility Test
Our beloved NVIDIA's official documentation for its HPC Benchmarks is notoriously incomplete and fragmented, to the point where it's a crapshoot whether a randomly downloaded container image will even run. That's why these tables were made.

Each generation of NVIDIA GPU architecture has a different corresponding Compute Capability (CC). If your hardware's CC is lower than the CC version the benchmark was compiled for, it will most likely fail to run correctly.

If a given executable doesn't include the CC for your hardware, and you've confirmed after trying that it won't run, don't waste your time—just switch to an older version.

## What is this?
When compiling CUDA code, you need to tell the nvcc compiler which GPU architecture(s) to build the binary for. This is done using flags like `-gencode, -arch, and -code`.

For a given Compute Capability—for instance, CC 7.0 for the V100 GPU—the corresponding compilation target is sm_70.

This document uses the command `cuobjdump -lelf <exec>` to inspect the benchmark executable within each version's image and determine which compute architectures it was compiled for.

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

## HPL (Double-Precision Floating-Point Test)
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

## HPCG (Double-Precision Performance Test)
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

## HPL-MxP & HPL-AI (Mixed-Precision Floating-Point Tests)
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
