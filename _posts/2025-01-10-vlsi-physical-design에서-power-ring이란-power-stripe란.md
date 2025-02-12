---
published: true
---
## VLSI Physical Design에서 Power Ring이란? Power Stripe란?

반도체 설계에서 전원 공급 네트워크(PDN, Power Delivery Network)는 칩의 안정성과 성능을 보장하는 데 매우 중요한 역할을 합니다.

​

그중에서도 Power Ring과 Power Stripe는 효율적인 전력 분배와 신뢰성 있는 전원 공급을 위해, 회로의 Physical Design 단계에서 반드시 고려해야 할 핵심 요소입니다.

---

Power Ring이란?

PAD에서 시그널 받고, 

Power Ring은 칩의 외곽을 따라 형성된 전원(VDD)과 접지(Ground) 배선 구조입니다. 일반적으로 두 개의 링 형태로 존재하며, 하나는 전원을, 다른 하나는 Ground를 담당합니다.

Power Ring은 칩 내부의 전력망(Power Grid)과 외부 패키지 혹은 Bond Pad를 연결하는 매개체 역할을 합니다.

![0](/assets/img/223691757441/0.png)

위 그림 하나 갖고 설명할건데, 그 이유는 주입식으로 머리에 넣기 위해?

이 글 하나 읽으면, 최소한 용어 자체는 다 익히시게 될겁니다.

​

전력 전달 네트워크(PDN)에서 PAD, Power Ring, Power Stripe, Rail, Trunk는 서로 협력하여 칩 내부의 전원 공급을 안정적으로 구현하는 핵심 구성 요소입니다.

---

1. 전력 전달 네트워크의 계층적 구조

칩의 전원 공급은 계층적으로 구성됩니다. 이 계층 구조는 전력 전달을 더 효율적으로 설계하고 관리하기 위함입니다.

PAD: 외부 전원을 수신하여 칩으로 전달하는 시작점.

Power Ring: 칩 Boundary 쪽에 배치되어 전원을 균일하게 분배.

Trunk: Power Ring과 Power Stripe 사이를 연결

Power Stripe: 칩 내부 블록으로 전력을 세부 분배.

Rail: 각 회로의 셀 단위로 전력을 공급.

---

2. 구성 요소 간의 역할과 관계

(1) PAD란?

역할: 외부 패키지(BGA, Flip-Chip, Bond pad, Bump 등)에서 들어오는 전원을 칩 내부로 전달.

연결: PAD는 패키지 핀이나 Bump와 연결되며, 칩 내부에서는 Power Ring과 직접 연결됩니다.

전원 흐름: Chip package → PAD → Power Ring

![1](/assets/img/223691757441/1.png)

---

(2) Power Ring란?

역할: PAD에서 들어온 전원을 칩 외곽에 균일하게 분배. Power Stripe와 Trunk를 통해 내부로 전달합니다.

구조: 칩 외곽에 형성된 전원(Ring VDD)과 접지(Ring GND)로 이루어집니다. 공정마다 다른데, 주로 특정된 메탈 레이어가 사용됩니다.

전원 흐름: PAD → Power Ring → Trunk​

![2](/assets/img/223691757441/2.png)

---

(3) Trunk

역할: Power Ring에서 내부로 전력을 전달하는 주요 전력 경로. Power Stripe로 분배하기 전, 여러 Power Stripe를 연결하는 대규모 라인입니다.

구조: 칩의 주요 영역을 가로지르는 굵은 금속 라인으로 설계.

사용 사례: 특히 전류 소모가 많은 고성능 회로(Core, PLL 등)에 안정적으로 전력을 공급.

전원 흐름: Power Ring → Trunk → Power Stripe​

![3](/assets/img/223691757441/3.png)

---

(4) Power Stripe

역할: Trunk에서 받은 전력을 내부 회로 블록에 세부적으로 전달.

구조: 칩 내부에 걸쳐 일정 간격으로 배치된 가로, 세로 형태로 이루어진 Metal line

특징:  Grid 구조로 배치되어 전류 경로를 다중화. 여러 금속 층을 통해 IR Drop 최소화. 전류 밀도를 분산시켜 과열 방지.

전원 흐름: Trunk → Power Stripe → Rail

![4](/assets/img/223691757441/4.png)

---

(5) Rail

역할: Power Stripe에서 전력을 받아, 셀(Cell) 단위로 전력을 공급.

구조: Cell의 Power pin에 Routing 될 Metal line. 각각의 셀이 VDD와 GND를 공급받을 수 있도록 설계된다.

특징: Rail은 Standard Cell Pitch에 맞춰 최적화되며, VDD/GND 라인을 번갈아 배치하는 구조를 가진다.

전원 흐름: Power Stripe → Rail → Cell 내부 회로

![5](/assets/img/223691757441/5.png)

​

​

생각해보면, Inverter든 어떤 Cell들이든, Layout을 열어보면,

이런 VDD, VSS 라인이 Rail이 되는거고, 이게 동일한 Y좌표 상으로 배치되는 것입니다. 이런 정보가 P&R Tool에서는 LEF 같은 파일에 들어있습니다.

![6](/assets/img/223691757441/6.png)

![7](/assets/img/223691757441/7.png)

​

그래서, Place 후 Legalization 하고나면, 아래처럼 특정 Y-axis 값들에서만 cell들이 배치되게 됩니다.

![8](/assets/img/223691757441/8.png)

​

더 하고 싶은 이야기는 많지만, 간단히 말하면,

(1) PAD, Power Ring, Trunk, Power Stripe, Rail 설계를 할 때에 다양한 최적화 방법이 있다.

(2) Standard cell간 Y-axis 거리는 늘 일정하게 유지되는데, X-axis 거리는 약간 차이가 있다.

​

그래서 (1)을 고려하는 Chip design methodology가 있고, (2)를 고려하는 Circuit design methodology가 있다.

(1)은 검색하면 Google에 많이 나오고, (2)의 경우에는 삼성과 Intel 논문이 많이 나와있다. 이런것들을 다 고려하여, 실제 반도체와 시뮬레이션 간 괴리를 줄여나가고 있음.

 해시태그 : 