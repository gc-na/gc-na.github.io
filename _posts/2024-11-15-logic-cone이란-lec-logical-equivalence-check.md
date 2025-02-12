---
published: true
---
## Logic cone이란? : LEC, Logical Equivalence Check

Logic cone은 Gate Level VLSI 설계에서 "출력 신호가 입력 신호에 의존하는 회로 요소들의 집합"을 말합니다.

기본적으로, 로직 콘은 하나 이상의 출력 노드와 그 출력에 영향을 미치는 모든 입력 노드로 구성됩니다.

​

RTL 설계를 하고 나서도, Synthesis, DFT, Place and Route, Timing/Functional Engineering Change Order 등 다양한 작업을 통해서 회로가 변경되기 때문에, 각 스텝마다 LEC 작업이 필요합니다.

회로의 입력 부분이 출력 부분에 어떻게 영향을 미치는지를 알아야하므로, 어떻게 컴퓨터에게 알려줄 수 있는지도 필요한 고민인 것이죠. 그 방법으로 Logic cone이 쓰이는 것입니다. 

​

​

예를들어 Behavior RTL Code 같은 경우, 정말 논리 회로만 들어있는 상태의 Code이고,

Foundary의 PDK를 입히는 Synthesis 작업을 하면 Code 내용이 바뀌고,

P&R을 하면 Layout을 하면서 CTS도 하고~ Physical 관련 Cell이 들어가면서 또 Code가 바뀌고,

PV, Timing, Power ECO를 하면 또 Code가 바뀝니다.

![0](/assets/img/223573952233/0.png)

​

근데 EDA Tool의 버그로? 아니면 스크립트 실수로, RTL에서 예상한 논리 동작을 안한다면... 반도체가 벽돌이 될 수도 있겠죠.

​

![1](/assets/img/223573952233/1.png)

http://tech.tdzire.com/formal-verification-basics/​

각 로직 콘은 특정 기능을 수행하기 위해 논리적으로 연결된 게이트들로 이루어져 있으며, 이는 회로 설계의 최적화와 오류 검출에 필수적이입니다.

​

우리가 FEV(Front-End Verification) 기법에 대한 자세히 보기 전에, "동등성(equivalence)"이 무엇을 의미하는지 정의하는 것이 중요합니다.

(1) 일반적인 의미에서, 우리는 LEC를 key points의 집합을 선택함으로써 정의합니다.

(2) 이 키 포인트들은 비교되는 두 모델에서 동일한 입력 자극이 주어졌을 때 논리적으로 동일하다고 예상되는 지점들입니다.

(3) 그런 다음 FEV는 입력 키 포인트가 동일한 값을 받는다고 가정하고,

(4) 두 모델에서 내부 및 출력 키 포인트를 구동하는 로직 콘(logic cones)이 동등할 것이라는 것을 검증하는 것으로 구성됩니다.

​

사용되는 LEC 기법에 따라, 가장 일반적으로 포함되는 키 포인트들은 다음과 같습니다:

• Primary inputs

• Primary outputs 

• State elements (latches and flip-flops) 

• Blackboxes 

• Cut points

![2](/assets/img/223573952233/2.png)

Equivalence Checking, ScienceDirect Microelectronics Journal, 2008이 기본 개념에서 파생된 몇 가지 주요 equivalence 개념이 있으며, 현재의 전자 설계 자동화(EDA) 도구에서 일반적으로 사용됩니다:

(1) combinational equivalence

(2) sequential equivalence

(3) transactional equivalence

​

Combinational Equivalence

combinational equivalence은 EDA 산업에서 가장 전통적인 FEV 기법입니다.

이 기법을 사용하여 RTL에서 게이트 레벨 넷리스트(gate-level netlists)를 비교하는 것이 일반적입니다. RTL에서 광범위한 검증이 이루어지는데, 이는 Simulation과 Formal Property Verification을 포함합니다. 이 LEC가 검증되었다는 주장을 정당화하는 데 필요합니다.

​

combinational equivalence은 Sequential Cell(latch 또는 flop)이 Reference Design에서 Implementation Design으로 특정 Sequential segment에 해당하는 Sequential 일치 모델을 위해 사용되는 주요 FEV 기법입니다. 이 모드에서, 두 디자인이 서로 상응하는 상태들 사이의 모든 조합 논리가 논리적으로 동등할 때, 두 디자인은 동등하다고 논리적으로 알려줄 수 있습니다.

즉, 두 모델의 상태 요소 간에는 1:1 대응 논리식이 있습니다. 두 model에서 Sequential segment pair의 LEC가 검사될 때마다, 도구는 해당 상태 요소의 fan-in cones에서 모든 시점에서 동일한 값을 포함할 것이라는 가정을 사용합니다.

이것이 큰 제한처럼 보일 수 있지만, 이는 Synopsys의 Logic Synthesis 기술과 함께 발전했다는 히스토리를 이해하면 당연해보입니다.

​

즉, 대부분의 RTL  to Netlist를 Synthesis하는 EDA Tool들도 LEC를 보장하여 넷리스트의 각 상태 요소가 RTL의 상태 요소와 일치하도록 합니다. 이 방법을 사용하는 FEV 도구는 Boolean식을 분석하기만 하면 되며, 시간에 따른 값의 변화를 고려할 필요가 없이 논리만 Static하게 검증하면 됩니다.

​

예시

표에 나타나 있듯이, Key point들은 input-output interface와 내부 상태 요소로 구성됩니다. 비교의 주요 지점은 상태 요소 {F1, F3} 및 {F2, F4}와 출력 out입니다. 내부 및 출력 키 포인트가 두 모델에서 논리적으로 동등한 조합을 가지고 있음을 보여줄 수 있는 한, 우리는 모델이 동등하다고 말할 수 있습니다.

​

![3](/assets/img/223573952233/3.png)

Equivalence Checking, ScienceDirect Microelectronics Journal, 2008​

대강 요약하면, LEC는

(1) Logic cone을 갖고 비교해야 할 Candidate들을 맞추고,

(2) Reference와 Implementation의 Candidate를 align하고

(3) 이걸 갖고 boolean으로 비교함.

​

앞으로 LEC advance에 대해 보겠습니다. UPF 디자인이나.. Retiming 등을 통해 Logic cone이 Reference design과 Test design이 바뀐 경우 LEC가 어떻게 할까?

 해시태그 : 