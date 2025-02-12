---
published: true
---
## Robustness Analysis란? DFR이란?

​

Robustness Analysis란?

외부 변동 요인에서, 제품 성능에 미치는 영향을 분석하는 프로세스입니다.

이는 반도체 칩 설계 할 때에도 쓰이고, 인공위성을 설계할 때에도 쓰이더라구요.

![0](/assets/img/223397439644/0.png)

​

반도체 설계에서는 RA(Robustness Analysis)란 Process variation, Voltage variation, Temperator variation 등의 변동 요인이 설계 성능에 미치는 영향을 분석하는 프로세스를 말합니다.

최신 공정에서는 이러한 변동성이 점점 커지고 있어, 설계의 안정성과 신뢰성 확보가 큰 목적입니다.

- 반도체는 수명이 있습니다. 반도체는 동작 할 때 열을 내고,

- 열을 포함한 다양한 외부 환경조건들이 반도체를 노화시킵니다.

-> 이러면, 반도체가 언젠간 고장이 나겠죠.

말이야 쉬운데,

(1) 내 자율주행 자동차가 운전 중에 고장이 났다면?

(2) 인공장기 및 의료기기에 들어가는 반도체가 갑자기 고장났다면?

(3) 보안 소프트웨어 회사가 클라우드를 활용하여 데이터센터를 이용하는데, 갑자기 돌던 Job을 담당하는 그래픽카드가 고장났다면?

​

![1](/assets/img/223397439644/1.png)

​

Robustness Analysis에 대한 연구는 옛날옛적부터 있었지만, 산업 현장에선 Device level에서 주로 봤고, Chip level에서 보게된건 최근에야 많은 지원이 들어오고 산업에서 쓰이는 추세입니다.

Robustness Analysis는 기존의 Design 및 Verification에 사용되는 EDA Tool에 추가됩니다.

이 기능이 과거에는 연구가 되었으나 산업에 사용되지 않았던 다양한 이유가 있는데,

​

현실세계에서 발생하는 외부 환경요인들이 너무 다양하고 이것을 정량화하기 어려운 점이 있습니다.

요즘은 이런 정량화 안되는 데이터는 "Machine Learning"으로 통계적 분석을 처리하니, 설계 단계에서부터 반도체 칩 노화에 대한 분석을 할 수 있게 되었습니다.

그래서 이 견고성 분석은 다양한 변동 조건에서의 성능 분포를 "통계적으로 분석"합니다. 간단한 모델링이야 할 수 있지만, 어떤 완벽한 수식이 있는게 아니에요. 이를 통해 설계의 취약점을 파악하고, 변동에 대한 내성을 높일 수 있습니다.

​

Robustness Analysis를 요약하면,

외부 환경은 반도체 물리적 특성에 영향을 준다.

영향을 받은 칩은 느려지거나 빨라지고, 전압도 떨어지거나 오른다.

시뮬레이션 EDA Tool + 통계 분석 EDA Tool -> Sensitivity analysis -> Reliability 결과 출력!

![2](/assets/img/223397439644/2.png)

이렇게되면,

(1) 이 Chip 혹은 이 Device이 어느정도 전압 변동까지 버틸 수 있구나?

통계분석 Tool이 Design의 전체 회로도를 분석하고, Voltage drop에 가장 취약한 부분을 찾고,

이 부분에 대해서 Voltage sweep을 해나가면서 어느정도까지 설계가 버틸 수 있는지 찾는거죠.

​

(2) 지금 이 Chip으로 만들 수 있는 Max frequency가 이정도구나?

위와 마찬가지로, 같은 방식으로 가장 취약한 부분을 찾고 max frequency를 올려나가는겁니다.

​

(3) 기존에는 Hard IP의 aging reliability 에 대한 Margin을 어떤 특정 값을 줬는데, 이 값보다 더 정확하게 값을 줄 수 있게되죠.

(SRAM 설계해보신 분들은 아시겠지만, End Of Life 혹은 Aging Reliablity에 대한 마진이 꽤 큽니다.)

​

(4) 어느정도 세월이 흘렀을 때 Chip 수명이 죽는지 통계적으로 예상 가능.

​

​

DFR이란?

![3](/assets/img/223397439644/3.png)

DFR이란 Design For Reliability 혹은 Design For Robustness 입니다. DFT라고 불리는 Design For Testability처럼, Mission mode에 직접 영향을 주진 않지만 제품 수율 및 신뢰성 확보를 위해 사용하는 설계 방법론입니다.

Ansys, Synopsys, SIEMENS EDA Tool 들을 보면 아래처럼 설명을 하네요.

​

좀 더 쓰고싶지만, 쓰다보면 글이 너무 길어질 것 같아 여기까지만 씁니다.

​

아래 링크에 EDA회사들이 소개하는 RA가 있으니 참조하십시오~!

​

Failure Mode and Effects Analysis (FMEA), Fault Tree Analysis (FTA), Physics of Failure (PoF) analysis, and Accelerated Life Testing (ALT) 이런 단어들이 쓰이는데, DFT에서 쓰이는 용어랑 비슷해보입니다.

https://www.ansys.com/blog/the-what-why-when-who-and-how-of-design-for-reliability

[What Is Design for Reliability (DfR)? | Ansys Blog](https://www.ansys.com/blog/the-what-why-when-who-and-how-of-design-for-reliability) : Design for reliability (DFR) helps engineers ensure a product or system performs a specific function within an environment over an expected lifetime.

https://www.synopsys.com/glossary/what-is-robustness-analysis.html

[What is Robustness Analysis? – How it Works | Synopsys](https://www.synopsys.com/glossary/what-is-robustness-analysis.html) : Robustness Analysis is the process of analyzing a design’s performance in the presence of variation effects such as voltage, process, and temperature. It provides additional statistical metrics to measure the performance complimenting Static Timing Analysis and enables chip’s immunity to variation a...

​

https://www.cadence.com/en_US/home/explore/robustness-analysis.html

[Robustness Analysis](https://www.cadence.com/en_US/home/explore/robustness-analysis.html) : Learn how robustness analysis works and how Cadence helps you perform this type of analysis to significantly improve your designs.

​

 해시태그 : 