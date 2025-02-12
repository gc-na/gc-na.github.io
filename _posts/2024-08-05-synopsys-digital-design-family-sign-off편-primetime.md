---
published: true
---
## Synopsys Digital Design Family: Sign off편. PrimeTime란? PrimePower란? PrimeLib란? PrimeClosure란?

EDA Tool의 핵심은,

- 최고의 PPA 효율

- 짧은 TAT

- 얼마나 실제 칩으로 증명 되었는가 입니다.

​

저는 Synopsys EDA tool은 거의 다 켜보긴 한 것 같습니다. PrimeTime은 지난 몇 년간 24/7 썼고(본인 생각엔 Synopsys에서 제일 잘 만든 툴이 PT인 것 같아요. 빠르고 정확하고, UI도 편하고, 명령어도 직관적이고 PT라는 Product 쓸 때마다 감사합니다.🖤), 나머지 Tool은 Flow에 맞춰서 그때그때 사용했구요.

​

그래서! PrimeTime family가 속해있는 synopsys Signoff 제품들을 소개해보려고 합니다. EDA에서 광고협찬 받아보고싶네요.

​

Synopsys가 스펙으로 공개해놓은 Datasheet, whitepaper로 아래 글 작성했습니다.

https://www.synopsys.com/implementation-and-signoff/signoff.html

[Synopsys Design Signoff](https://www.synopsys.com/implementation-and-signoff/signoff.html) : Synopsys design signoff is a set of golden tools including PrimeTime, PrimePower & StarRC, that must be run before chip tapeout.

Tool 스펙 + 제 생각이 이 글이라고 보심 됩니다.

![0](/assets/img/223293777047/0.png)

![1](/assets/img/223293777047/1.png)

Signoff란?

집적 회로의 자동화된 설계에서 Sign-off Check는 Mask가 Tape out 되기 전에 검사해야 하는 일련의 검증 단계를 통칭하는 이름입니다.

각 Flow 별 담당 엔지니어가 통과 Sign을 줘야 다음 단계로 넘어갈 수 있는거죠.

반도체는 설계부터 공정까지 수십억원 ~ 수조원까지 드는데요. 그렇기 때문에 가장 중요한 것은 "Signoff"라고 생각합니다.

​

EDA Tool 중 일부가 "Golden"으로 불립니다. Golden으로 불릴 수 있는 기준이 명확히는 없습니다. 그러나, 특정 EDA Tool이 성공한 Tape out 소식이 많이 들리고, 업계 점유율이 높은 경우 Golden으로 불리는 것 같습니다. (하나만 1등이면 Golden이라고 불리지 않고, 거의 모든면이 1등인 경우.)

​

대부분의 반도체 설계 대기업은 각 설계 Flow에서 Golden EDA Tool을 사용합니다.

(Synopsys 및 Cadence와 같은 주요 벤더의 EDA 1인 라이센스 비용이 Tool 하나가 수억원 내외이니, 작은 팹리스들은 하나의 EDA Vendor와 만 계약하여 EDA 비용을 최소화하기도 합니다.)

​

Foundry가 EDA와 협력하여,  Recommend EDA Tool, Version, 필수 제약조건, 스크립트 등이 포함된 ReferenceManual을 Fabless에게 제공합니다.

​

ASIC: RTL2GDS

FPGA: RTL2Timingclosure

​

Signoff Product Overview

PrimeTime Suite: PrimeTime은 Timing closure & ECO의 Golden Signoff Tool 입니다. STA&ECO 뿐만 아니라, 다양한 기능을 담는 PT Family라고 보면 됩니다. 아래에서 자세히 설명합니다.

기본적인 STA&ECO를 효율적으로 처리 할 수 있도록, Multi-core STA (Static Timing Analysis), DMSA (Distributed Multi Scenario Analysis, OCV, AOCV, POCV, Physical aware ECO, signal integrity, power and variation-aware analysis, Composite Current Source (CCS) modeling 등을 지원합니다. Synopsys에서 잘 나가는 Tool 중 하나인 PrimeSim™ HSPICE® 기술이 PT에서도 포함되어있어, 정확한 Signoff analysis를 돕습니다.

​

STA Tool은 PT가 시장을 꽉 잡고 있습니다. 아래 쓴거 분량이 좀 많습니다. white paper를 기준으로 작성했습니다. 근데 Skip 할만한 Feature가 없어요. 다 너무 잘 쓰고 있는 기능이라서요. 완전 핵심 기능만 보실거면 굵은 글씨만 보시면 됩니다.

https://www.synopsys.com/content/dam/synopsys

​

1.PrimeTime Suite Family 구성:

PrimeTime SI: Crosstalk delay and signal integrity analysis

![2](/assets/img/223293777047/2.png)

Parasitics & CCS를 갖고 SPICE급 정확도로 Delay 계산.

Core static timing analysis

Multi-mode Multi-corner (MMMC) analysis

Distributed Multi Scenario Analysis (DMSA)

IR Drop analysis

Galaxy Constraint Analyzer : SDC consistency checking

Hyperscale

Advanced On-chip variation (AOCV)

Extracted Timing Models (ETM)

UPF & SMVA

Graphical User Interface (GUI) enabling timing analysis and visualization using schematics, histograms, tables, and tree graphs.

Session save and restore

​

PrimeTime ADV: 미세공정에서 Pessimism을 줄이는 STA, Physical aware ECO 지원

Physically-aware ECO guidance for timing, DRC and power recovery

Parametric on-chip variation (POCV) & LVF 지원

Distributed hierarchical analysis

Derate based Multi-Input Switching support

​

PrimeTime ADVP: ADV처럼, 미세공정에서 Pessimism을 줄이는 STA&ECO Skill들이 들어있고, 여기서부터 ML이 포함됨

Wire, Via variation, and Layout proximity effects

Enhanced POCV

Advanced Multi-Input Switching support

Machine Learning based Power recovery and PBA

Simultaneous Multi-voltage Analysis with DVFS

Routability aware ECO with support for 6/5nm rules

PrimeTime PX

​

PrimeSim HSPICE: HSPICE 자체가 하나의 Tool이라 여기 다 담긴 어려울듯. 어쨌든 HSPICE 기능 중 일부를 PT Suite에서 사용 가능하다..

CCS Modeling

Path-base STA와 ML PBA

OCV Modeling

Variation aware analysis

​

2. PrimeClosure: 업계 최초의 AI 기반 골든 사인오프 ECO 클로저 솔루션

PrimeTime STA와 FusionCompiler를 통합해, RTL-to-GDSII Flow가 통합하여.. TAT를 줄인게 특징입니다.

![3](/assets/img/223293777047/3.png)

​

​

3. PrimeShield: PrimeTime STA 기반, 업계 최초 머신 러닝 기반 Design Robustness 솔루션

미세공정으로 가면서, PVT Variation이 증가하고 있습니다. 

Design Robustness를 효과적으로 개선하여, (머신러닝 기반으로, Path, Design Level에서 병목 현상을 빠르게 식별하고 최적화) 과도한 Pessimism으로 STA하는 것을 방지하여 PPA와 TAT를 높입니다.

![4](/assets/img/223293777047/4.png)

Prime Shield은 설계를 최적화하기 위해, 아래 2가지 Method를 사용합니다.

1. Variation Robustness Analysis(VRA): 설계의 모든 셀을 고려하여 각 셀이 얼마나 많은 변동을 가질 수 있는지 평가합니다.

2. Design Variation Analysis(DVA): PVT variation이 큰 Cell을 선별하고, Critical path에 이 Cell이 있는지 식별해냅니다.

-> 두 분석 모두 해당하는 Weak Cell을 찾고, trade-off 없이 PPA 최적화를 할 수 있도록 하는 것을 목표로  합니다.

​

​

4. PrimeLib: Unified Library Characterization and Validation

Synopsys가 개발한 대표 Golden Tool이 PrimeTime과 HSPICE입니다. PrimeTime에 사용하는 Liberty는 HSPICE에서 출력됩니다. Liberty도 Synopsys가 만든 오픈소스 포맷이구요.

HSPICE가 정교한건 이미 예전부터 정평이 나있었고, 미세공정에선 체크해야하는 항목이 많아서 하드웨어 리소스 문제가 큽니다.  이걸 Machine Learning+QA+etc 기능으로 TAT도 줄이고, 하드웨어 리소스 사용량도 줄인게 핵심이죠.

![5](/assets/img/223293777047/5.png)

![6](/assets/img/223293777047/6.png)

SmartScaling based multi-PVT characterization to instantly generate libraries and reduce significantly the overall characterization required for multiple PVT corners

Single captive license bundles everything required for cell library characterization, QA and simulator

Simple multi-core licensing enables easy adaptation to constantly changing characterization workload requirements

Embedded gold reference SPICE engines for best accuracy and Integrated signoff library validation tuned to produce PrimeTime sign-off quality libraries

Innovative technologies provide high characterization throughput

ML-based high-sigma char w/ HSPICE® AVA

Faster LVF runtime using new ML models and key technologies

Cell reliability characterization to capture impacts of device model degradation over time (aging) and electro-migration (EM)

ML-based augmented sensitivity database to enable faster time-to-market for an updated PDK

Comprehensive QA features for library validation and SPICE correlation

Unified GUI for library database management system, job processing, and monitoring, compare and validate libraries—one GUI to visualize it all

Library characterization environment encryption support enables IP providers to deliver re-characterization kits

Machine learning-based algorithms enable accurate modeling of non-Gaussian distribution at ultra-low voltage corners

​

​

PrimePower, Library compiler도 작성해야하는데, 좀 많아서... 나중에 추가할게요.

 해시태그 : 