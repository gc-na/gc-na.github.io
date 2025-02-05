---
published: true
---
## VLSI CAD와 AI, 인공지능의 반도체 설계. Not 인공지능 반도체

우선 저는 EDA 회사에서 엔지니어로 일하고 있습니다.

기술적으로 자세히 쓰지 않을 것입니다.

산업 동향 + 핵심 개념만 이 글에서 다루고, 논문을 같이 남기겠습니다.

​

VLSI 산업 현황

VLSI 산업은 반도체 회로의 미세화에 맞춰 거기에 맞춰 새로운 물리적 설계를 해왔습니다.

문제는 반도체 공정을 더이상 물리적으로 미세하게 만들기가 어려워졌다는 점입니다.

반면에 사람들은 자율주행을 원하고, 더 저렴하게, 더 빠르게 세상을 만들고싶어하죠.

그런데 반도체 성능은 이것을 맞춰 줄 수 없는 것이 문제인거구요.

![0](/assets/img/223421941601/0.png)

요약을 하면,

파운드리가 만든 공정 설계 키트 (매년 업데이트. 계속 고성능, 저전력화)

팹리스에서는 이 키트로 칩 설계

SW회사들은 이 팹리스에서 만든 칩을 사용함.

​

그런데 공정 기술 미세화에 한계가 오면서, 더이상 성능 개선이 어려워짐.

기존에는 그래픽카드로 인공지능을 학습시켰지만,

인공지능 전용 반도체 같은 "전용 반도체"들이 나오고,

IT Big tech 기업들은 자신들 SW에 전용으로 쓸 반도체를 전용으로 설계하여 완전히 맞춤화된 반도체를 만들고 있는게 현대 추세.

​

그만큼 "전용 반도체 설계" 기술이 중요해졌습니다.

앞으로 반도체 성능 개선을 하려면, "전용 반도체 설계"와 "첨단 패키징"이 가장 유망.

재료공학적인 방법이나, 공정 노드 축소가 가능하다면 더 좋겠으나, 이런 것들은 아직 수율과 양산 단가가 안 맞음.

​

​

![1](/assets/img/223421941601/1.png)

EDA Tool은 SW를 통해 전자 회로 설계를 자동화하는 분야.

EDA, VLSI CAD 등으로 불립니다.

업계 선도 기업은 Synopsys, Cadence, SIEMENS 정도.

![2](/assets/img/223421941601/2.png)

​

​

AI & VLSI CAD

전통적으로 EDA 툴은 주로 Rule based Algorithm과 Heuristic algorithm을 사용해 왔으며, 인간 전문가의 노하우, 수학적 분석에 크게 의존해왔습니다. 이러한 방식은 현대 IC 설계의 복잡성 증가와 첨단 공정기술에 따른 제약 조건 강화로 인해 점점 그 한계에 부딪히고 있습니다. Time to Market을 둔화시키는 문제죠.

​

AI를 EDA 플로우의 다양한 단계에 원활하게 통합함으로써,

최적화된 아키텍처 탐색

현재 RTL에서 이후에 발생 할 수 있는 이슈 탐색

현재 구조에서의 Timing Critical path 및 Test coverage

최적의 물리 설계

설계 검증

설계 자동화, 최적화

​

https://www.youtube.com/watch?v=gSBYf25bWyo

[![Chip floorplanning with deep reinforcement learning](https://i.ytimg.com/vi/gSBYf25bWyo/hqdefault.jpg)](https://www.youtube.com/watch?v=gSBYf25bWyo)

설명 : Learn about a deep reinforcement learning method that can generate superhuman chip layouts in under six hours, rather than weeks or months of human effort. T...

위 Tensorflow영상에 나오는 Azalia 박사님 논문 중 VLSI CAD 관련 논문이 많으니, 참고하세요~

http://azaliamirhoseini.com/

[Azalia Mirhoseini](http://azaliamirhoseini.com/) : Azalia Mirhoseini Home Research Teaching Speaking Awards Media Contact -------------------> Azalia Mirhoseini I am an Assistant Professor in the Computer Science Department at Stanford University. My research interest is in developing capable, reliable, and efficient AI systems for solving high-imp...

​

기존 설계들의 거대한 저장소에서 학습하고 딥러닝 신경망을 활용하여 특정 설계 제약 조건과 목표에 맞춰 최적화된 레이아웃, 논리 회로, 나아가 전체 SoC(System-on-Chip) 아키텍처까지 자동으로 생성할 수 있게 되었습니다. 이를 통해 제품 출시 시간을 단축하고 혁신을 촉진할 수 있습니다.

​

https://research.google/blog/chip-design-with-deep-reinforcement-learning/

[Chip Design with Deep Reinforcement Learning](https://research.google/blog/chip-design-with-deep-reinforcement-learning/) : Posted by Anna Goldie, Senior Software Engineer and Azalia Mirhoseini, Senior Research Scientist, Google Research, Brain Team Update, June 9, 202...

EDA 라이센스와 컴퓨팅파워가 엄청나게 필요하다보니, 학계와 산업계에 꽤나 큰 거리가 있습니다.

실제 회사에서도 이 컴퓨팅과 EDA 비용이 비싸니까 아껴쓰면서 칩 만드는데, 연구실에서는 많이 쓰기 어렵죠.

연구실이나 SW회사의 팀 수준에서 EDA에 AI를 융합한다면,

최적의 Floorplan

최적의 Physical Design

설계에서 Timing과 DRC에 대한 최적 Cell 및 Weak point 찾기

Liberty에 있는 Cell을 최적으로 interpolation 하기

이 정도 수준의 논문이 많이 있는 것 같습니다.

![3](/assets/img/223421941601/3.png)

EDA 회사에서 하고 있는 연구는 제가 말씀 드리긴 어렵고,

AI EDA 이런식으로 Youtube만 보셔도 아시겠지만, 정말 세세하게 많이 하고 있습니다.

​

​

아래 논문이 그렇게 길지 않고, 현대 AI & EDA에 대해 잘 설명 되어있습니다.

https://www.sciencedirect.com/science/article/abs/pii/S0167926023000901

[AI/ML algorithms and applications in VLSI design and technology](https://www.sciencedirect.com/science/article/abs/pii/S0167926023000901) : An evident challenge ahead for the integrated circuit (IC) industry is the investigation and development of methods to reduce the design complexity en…

​

논문 내용을 제가 짧게 요약하면,

반도체 설계 과정에는 아래처럼 다양한 설계 단계가 있습니다.

이 각각의 단계에 인공지능이 사용되는 추세.

![4](/assets/img/223421941601/4.png)

논리 합성(Logic Synthesis)에서의 기계학습(ML)

논리 합성은 EDA 플로우의 주요 단계로,  Verilog, VHDL 등으로 HDL 설계되어있는 RTL Code를 Gate Level Netlist로 변환하는 과정입니다.

그러니까 RTL 설계를 Translation하고, Mapping하고 Optimizaition하는게 Logic Synthesis인데, 이것을 AI가 하는 것이죠.

그런데 이런게 수학적으로 항상 동일한 시간복잡도로 딱 떨어지는 문제들이 아니에요.

![5](/assets/img/223421941601/5.png)

그래서 이런 것들을 지키려면 통계학적 접근이 필요한데, 강화학습은 논리 최적화 및 기술 매핑 단계에서 설계 공간을 효율적으로 탐색하는 데 활용될 수 있습니다.

결론은, ML은 이 과정을 회로의 지연시간, 전력 소비, 면적과 같은 품질 메트릭을 더 높은 정확도로 예측하는 ML 모델을 구축할 수 있습니다.(기존의 Rule Based, 휴리스틱 알고리즘 대비.)

​

​

물리 설계(Physical Design)에서의 강화학습(RL)

IC의 물리 설계 단계는 매우 복잡한 조합 최적화 문제로 가득합니다. 강화학습 기법은 이러한 어려움을 해결하는 데 큰 기여를 할 수 있습니다.

예를 들어 Floor Planning과 Place and Routing 과정에서 RL을 통해 최적의 Wire Length, Routing Congestion, Timing violation 등의 다양한 목표를 달성하기 위해 반복적으로 배치를 개선해 나갑니다.

​

관련된 내용으로 프로젝트 하신 분이 있어서, 아래에 링크 남깁니다.

https://makinarocks.github.io/ASIC-Floorplan-Automation-Part-1/

[주문형 반도체 (ASIC) Floorplan 자동화 - Part I](https://makinarocks.github.io/ASIC-Floorplan-Automation-Part-1/) : MakinaRocks의 COP(Combinatorial Optimization Problem) 팀에서는 주문형 반도체(Application Specific Integrated Circuit, ASIC)에서의 소자 배치를 자동화하는 Floorplan Automation 프로젝트를 진행하고 있습니다. 저희는 총 2부에 걸쳐 진행한 Floorplan Automation 프로젝트에 대해서 소개하고자 합니다. 이번 포스팅에서는 산업에서 Floorplan Automation이 산업에서 어떠한 의미를 갖는지, COP 팀이 현재 해결하고 있는 문...

https://makinarocks.github.io/ASIC-Floorplan-Automation-Part-2/

[주문형 반도체 (ASIC) Floorplan 자동화 - Part II](https://makinarocks.github.io/ASIC-Floorplan-Automation-Part-2/) : MakinaRocks Tech Blog

https://makinarocks.github.io/ASIC-Floorplan-Automation-Part-3/

[주문형 반도체 (ASIC) Floorplan 자동화 - Part III](https://makinarocks.github.io/ASIC-Floorplan-Automation-Part-3/) : Related to 강화학습, 산업의 난제에 도전하다! - ASIC 반도체 설계 (Floorplan) 자동화 (Naver Deview 21 발표 영상) ASIC-Chip-Placement 1부 ASIC-Chip-Placement 2부

​

또한 RL은 클록 트리 합성(CTS)과 같은 중요한 EDA 작업을 최적화하는 데에도 활용될 수 있습니다. 다양한 CTS 파라미터를 탐색하고 최종 클록 네트워크의 스큐, 전력 소비 등을 기반으로 보상을 받음으로써 점차 개선된 CTS 솔루션을 만들어 내면 되는 방식이겠죠? 구현은 쉽지 않지만.

​

이 외에도 "Rule base"로 하기 어렵고, "통계적" 설계가 필요한 경우에 대해 인공지능이 더 효과적으로 쓰일 수 있습니다.

![6](/assets/img/223421941601/6.png)

​

어쨌든 Chip 설계라는게,

1. 어떤 SW를 최적화되어 구동 할 수 있는 아키텍쳐 구성 및 RTL Code를 만들고,

2. 공정사에서 특성화한 Liberty code로 Mapping하여 Physical Data가 담긴 GDS2 code로 바꿔서 공정사에 다시 전달하고

3. 공정사는 이 GDS2를 갖고 마스크를 만든 다음 반도체 N대 공정을 한 뒤

4. ATPG 엔지니어로부터 칩 테스트 벡터 코드를 전달 받고 ATE 장비에 넣어 Chip testing을 하고,

5. 그다음 나온 칩에 SW 테스팅 및 OS 온보딩해서 부팅시키고

잘 돌면 이제 시장에 나갈 준비를 하는거죠.

​

EDA와 AI에서 핵심지표: 전력, 성능, 면적(PPA) 추정을 위한 신경망

​

PPA 메트릭은 IC 설계의 핵심 품질 지표입니다. 설계 초기 단계에서 이를 정확히 예측할 수 있다면 후속 최적화 작업에 큰 도움이 됩니다. 신경망 기반 모델은 RTL 코드, 게이트 수준 네트리스트 또는 물리적 레이아웃으로부터 PPA를 직접 추정할 수 있는 능력을 보여주고 있습니다.

​

예를 들어 특정 연구에서는 특정 신경망(?NN)을 활용하여 배치 후 라우팅 패턴으로부터 타이밍 위반을 예측 할 수 있다~ 수율 예측을 할 수 있다~ IR Drop을 방지 할 수 있다~ Area reduction을 할 수 있다~

이런 연구도 있고, 그래프 신경망(GNN)을 적용하여 Netlist Toplogy와 Liberty 정보로부터 전력 소비를 추정하는 모델을 개발했다~ 3x3 Liberty를 ML을 통해 16x16 table Liberty로 만들었다~ 이런내용입니다.

​

PPA가 결국 EDA에서 핵심 결과값이 되는거고, DRC나 runtime reduction도 있습니다.

​

​

EDA에 AI를 적용하기 쉽지 않은 이유

우선 EDA에 AI가 적용되는 것은 시간/돈 문제입니다. 이미 여기에 많은 연구가 들어오고 있고, 인공지능으로 설계한 칩들도 나오고 있어요.

https://news.synopsys.com/2021-11-29-Synopsys-Expands-Use-of-AI-to-Optimize-Samsungs-Latest-Mobile-Designs

[Synopsys Expands Use of AI to Optimize Samsung's Latest Mobile Designs](https://news.synopsys.com/2021-11-29-Synopsys-Expands-Use-of-AI-to-Optimize-Samsungs-Latest-Mobile-Designs) : Highlights of this announcement: Synopsys' groundbreaking AI-based system (DSO.ai) autonomously achieved highest frequency and lowest power consumption for Samsung's advanced mobile designs DSO.ai...

그런데 이런게 쉽지 않은 이유가,

​

A. 데이터 부족 및 품질 문제

AI 모델을 성공적으로 개발하고 구축하기 위해서는 방대한 양의 높은 품질의 데이터가 필수적입니다. 하지만 VLSI 설계 분야에서는 이러한 고품질 데이터를 확보하는 데 어려움이 있습니다. 대부분의 IC 설계 데이터는 반도체 기업의 소유이며, 보안 및 기밀유지 문제로 인해 외부 공개가 제한적입니다. 

​

B. 해석 가능성과 신뢰성

AI 모델, 특히 딥러닝 모델은 종종 블랙박스로 비유됩니다. 모델의 내부 작동 원리와 의사결정 과정이 복잡하여 설명하기 어렵기 때문입니다. 그리고 인공지능은 아닌걸 맞는것처럼.. 말하는 경우가 많습니다. 모델의 예측 결과를 그대로 신뢰하기는 어렵고, 이걸 양산까지 가기 쉽지 않습니다.

​

또한 모델의 견고성과 일관성도 중요한 문제입니다. AI 모델이 예측 불가능하거나 일관성 없는 결과를 내놓는다면 이는 설계 프로세스 전반에 혼란을 가져올 수 있습니다. 따라서 모델의 견고성과 안정성을 보장하는 기법과 엄격한 테스트가 필요합니다. 

​

C. 복잡성

2023년에 Apple 맥북에 들어가는 반도체 칩 M3 기본 모델이 25Biliion개의 트랜지스터가 들어갑니다. M3 Max는 더 많구요. 250억개입니다. 이거 인공지능이 다 학습하고 추론하기가 쉽지 않습니다.

![7](/assets/img/223421941601/7.png)

또한 VLSI 설계는 복잡한 EDA 툴과 방법론의 체계를 거쳐야 하는 까다로운 프로세스입니다. 단계가 너무 많아요. 그리고 각 단계마다 각 EDA 회사들이 얽혀져있습니다. 수많은 상업용 및 커스텀 EDA 툴, 스크립트, 라이브러리 등이 포함되어 있습니다.

이러한 기존 EDA 환경에 전체적인 AI 기술을 통합하는 것은 결코 쉽지 않습니다.

​

여기에 제 개인적인 생각을 몇 줄 더 써보면,

아무튼 EDA도 인공지능이 필요하긴 한데, 구현이 쉽지 않은 상태이고, 현재 활용하고 있는 곳은 아래 3가지.

- EDA 대기업

- SW 회사

- 오픈소스 EDA from 대학교 연구실

​

1. 반도체라는 것은 각국 대통령들이 큰 관심을 갖고 있을 만큼 중요한 기술.

2. 현재는 EDA 3사를 중심으로 VLSI CAD가 발전하고 있지만,

3. 중국이 반도체 설꼐 자립을 위해 RISC-V에 대폭 투자한 것처럼,

EDA 자립을 위해 Open source EDA로 언젠간 이동 할 수도 있겠다는 생각이 듭니다.

 해시태그 : 