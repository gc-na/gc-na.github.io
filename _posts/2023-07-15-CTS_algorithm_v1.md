---
layout: post
title: Clock Tree Synthesis(CTS)의 기본 알고리즘, H-Tree, Fishbone, Mesh, Low Power CTS
subtitle: #CTS
tags: CTS
comments: true
---



하나의 Chip에는 수십만, 수십억 개의 Flip-Flop이 있습니다.

1.이 Flip flop을 Triggering 시키는 신호는 clock입니다.

2.Logic Design에서는 앞단의 Flip flop이 뒷단에 flip flop에 data를 넘겨주는식으로 설계를 합니다.

3.근데 이 Chip을 실제 웨이퍼에 그릴 Physical layout을 하면, 각 Flip-Flop의 clock pin과 Clock Source와 각각 거리가 달라집니다. Flip flop이 Trigger가 전부 다른 타이밍에 일어나게 됩니다.

clock source에서 신호를 출력할 때 clock pin에서 입력 받는 시간을 Clock Latency라고 부릅니다.

3번에 말한것처럼 각 Flip flop은 각기 다른 Clock Latency를 갖습니다. 각 Flip flop간 clock latency의 차이를 Clock skew라고 부릅니다.

​

동일 Clock domain에서 발생하는 Maximum skew를 Global skew, 하나의 Timing path에서 발생하는 Maximum skew를 Local skew라고 부릅니다.





<img title="" src="../assets/img/0715/1.png" alt="b1" width="511">

​이런 문제 때문에 아래 그림처럼 Clock source ~ Clock pin 사이에 Timing Delay를 의도적으로 줘서, Logical Design simulation 때처럼 각 Flip flop에 clock이 동시에 들어갈 수 있도록 만들어줍니다..

![b1](../assets/img/0715/2.png)

CTS는 개념은 이런거고, IC Compiler 같은 CTS Tool이 어떤 알고리즘을 쓰는지 보고싶잖아요. 근데 찾아보니... 각 Tool이 어떤 알고리즘을 쓰는지 명확히는 알 수 없으나, CTS의 대표적인 H-Tree, Fish-bone으로 대강 감을 잡을 수 있을 것 같아 가져왔습니다.

1. H-tree 알고리즘

2. fishbone 알고리즘

3. Mesh 알고리즘 등이 있습니다.

![b1](../assets/img/0715/3.png)

CTS는 아래 그림처럼 RTL 설계 -> Logical Synthesis 후..... 가장 마지막에 하는 설계 작업이라고 보시면 됩니다.

DEF(Detailed placement database)파일과 Target Skew, 어떤 delay cell을 사용할건지, DRC 목표는 어느정도로 잡을건지 정보가 필요합니다.

​

CTS의 단계는 아래처럼 구성됩니다.

1. Candidate & Budgetting : Clock Source와 Flip flop의 Clock pin 사이 물리적 요소들을 계산하여 타이밍 견적을 대략적으로 만듭니다.

2. Global routing : Clock Source ~ Flip flop pin 간 최적 경로를 찾아 Routing을 해줍니다.

3. Clock Tree Construction: Clock Source ~ Each Flip flop pin을 Tree-Level Structure로 연결합니다.

4. Clock Tree Balancing: CTS는 클럭 신호의 지연을 최소화하고, 모든 플립플롭이 동일한 시간에 클럭 신호를 수신할 수 있도록 조정합니다. 이를 위해 클럭 트리의 레벨에 따라 버퍼를 추가하거나 버퍼를 삽입하여 신호의 전파 속도를 조절합니다.

5. Evaluation : Global Skew, Local Skew를 계산하며 적당한 CTS Quality가 나올 때까지 Buffering를 삽입합니다.

![b1](../assets/img/0715/4.png)



과거엔 CTS Tool이 따로 있는게 아니라, 사람이 직접 CTS를 했지만, 현재는 EDA Tool이 어느정도 CTS 퀄리티를 만들어주기 때문에, 사람이 직접 CTS를 하는 경우는 없고... 대신에 CTS가 잘 되기 위한 여러가지 기법들을 사용합니다.

Pre-CTS 단계에서 아무리 타이밍을 잘 맞춰놔도 CTS에서 Timing이 크게 틀어지면 아키텍쳐 설계부터 다시 해야 할 수도 있습니다.

​

VLSI 설계에서 CTS Quality를 높이기가 어려운 이유는,

1. 실제 Cell은 실제 동작 할 때 Process에 대한 varation, Temperature에 대한 variation, Voltage에 대한 Variation이 있습니다. 이런 변수들은 Max timing에선 Max로 worse하게 보고.. Min timing에선 Min으로 worse하게 계산하는 값들이기에, 이런 변수들이 쌓이면 Timing을 충족시키기 어렵습니다. CTS Cell을 최소한으로 넣어야합니다.

2. CTS Cell이 최소한으로 들어가는 대신, 라우팅이 길어진다면 Noise 문제에 취약해집니다.

3. 라우팅이 짧아진다면 Congestion 문제와 Short 문제가 생깁니다...

이런 것들 때문에 Floor plan을 잘해놔야 CTS Quality 높이기가 수월해집니다.

​

Advance CTS 기술에 대한 논문에 대해 찾아보면, Low power 관련 CTS 기술들이 나와있습니다. 시간 날 때 읽어보고 Low-Power CTS에 대해도 다뤄보려고 하는데, 어쨌든 기본은 이렇습니다.

- Buffer의 개수를 최소화 할 수 있도록 설계 / Place, Clock Routing 수정

- Clock skew를 Gating cell을 통해, 필요한 경우에만 Signal이 Swithcing되도록 합니다.

- Clock Tree와 Flip flop pin과의 거리를 짧게함.

-> RTL 설계 / Floor planning / skew group들을 user manual로 Special care 필요한 항목들을 잘 정의해야 함.
