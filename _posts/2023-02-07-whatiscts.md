---
layout: post
title: CTS란, Clock Tree Synthesis란
subtitle: #CTS #P&R #ASIC
tags: [Physical Design]
comments: true
---


Clock Tree Synthesis(CTS)는 Digital 설계에서 Chip 전체에 걸쳐 클록 신호를 알맞게 분배하는 단계입니다.

​

기능 설계인 RTL 설계

->

Logic level에서 실질적인 Physical Contraint 적용한 Logical synthesis

->

Logical synthesis 바탕으로 실제 물리적 위치에 배치 배선을 한 P&R

->

그리고 CTS

​

각 Sequential cell Group은 하나의 클럭을 갖고 동시에 동작하게 됩니다.

그런데  Clock Source에서 각 Flip flop의 거리는 다 각각 달라서.. 'source ~ Flip flop의 Clock pin'까지 도착하는 시간이 달라지는데요. 

Clock path에서 발생하는 지연시간을 'Latency'라고 부르고, Clock path간 Latency 차이를 Skew라고 부릅니다.

Chip 동작을 위해 필요한 timing 제약 사항들을 맞추기 어렵고.. Timing violation이 발생하게 됩니다.

​

참고로 CTS의 종착역인 Flipflop의 Clock pin을 Sink point, Sink pin이라고 부릅니다.

 

EDA Tool vendor마다 다 CTS tool이 있는데, 저는 학교 때 Synopsys ICC1, ICC2로 공부했습니다.

![ba](/assets/img/2023020718.png)  

이걸 위해서 Source ~ clock pin 사이에 Inverter 쌍을 삽입하여 Delay를 조정합니다.

결국, CTS의 기본적인 목적은  'PPA와 설계 요구사항을 충족하며, 각각 다른 위치에 있는 모든 Flip flop들이 하나처럼 동작하도록' 하는게 기본 목적입니다.

(기본 목적이라고 한 이유는, CTS에서 일부러 skew를 만들어서 유용하게 쓰는 경우가 있거든요.)

​

​

Clock Tree Syntehssis라고 불리는 이유가 XTAL 또는 PLL 같은 Clock source pin / port에서 시작하여 각 Sequential cell의 Clock pin들로 나뭇가지들쳐럼 뻗어나거든요.

반도체 칩에는 엄청나게 많은 Sequential cell들이 배치되기 때문에 CTS가 어떻게 되냐에 따라 chip의 PPA 조건하냐 못 만족하냐가 됩니다.

​

​

​

이러한 문제를 극복하기 위해 CTS 알고리즘은 수년에 걸쳐 더 발전된 최적화 기술을 포함하도록 발전했습니다. 예를 들어, PVT, OCV, SI 등이 있습니다.. 말로는 쉬운데, 이걸 다 적절히 적용하는게 어렵더라구요. 물론 기계학습을 이용한 방법도 있습니다.

​

​

1.

반도체에서 Clock Frequency는 Performance / Power 측면에서 주요 제한 요소 중 하나입니다.

Clock Frequency가 높을 수록, Chip이 1 / 0 switching 되는 속도가 빨라지고.. Switching power가 늘게 되거든요.

높은 Frequency에서 Low-power를 위해.. 필요한 부분만 Switching이 되도록 Clock gate cell들을 넣습니다.

그러나 Clock Tree의 복잡성을 증가시키고 CTS 프로세스를 더욱 어렵게 만들 수도 있습니다. 그러므로.. Logical Synthesis 할 때 CTS를 어떻게 해야할지 미리 감을 잡아놔야합니다.

​

​

​

2.

Clock tree에는 보통 Inverter 쌍이 사용됩니다.

버퍼를 써도 될 것 같은데 왜 Inverter 쌍을 사용하나?

: CMOS의 동작원리를 알면 쉬운데요.. PMOS와 NMOS의 동작 속도가 다릅니다... 좀 더 유식하게 말하면 Beta ratio 때문이고.. 쉽게 풀어 말하면,

버퍼가 0 -> 1로 switching 되는 시간,

1 -> 0로 switching 되는 시간이 다릅니다.

버퍼는 1 -> 0으로 swithcing 하는 시간이, 0 -> 1으로 switching 하는 시간보다 빠릅니다.

Clock Tree에는 한 라인에 수십 개의 셀이 들어가는데, 이 셀이 다 버퍼로 만들어지면.. 이런 지연 시간이 쌓이게되어

1 -> 0은 엄청 빨리 되고, 0 -> 1은 엄청 느리게되어 timing constraint을 만족시키기 어렵습니다.

​

반면에 인버터는 무조건 반전하기 때문에 이런 Beta ratio 문제가 없습니다.

​

​

​

​

​

CTS를 잘 해야한다... 말은 쉬운데요.

CTS가 잘 안된다면?

​

Setup time은 Capture Path(DRT) - Launch path (DAT) 잖아요?

근데 Launch path에는 Clock이 엄청 늦게 들어오고, Capture path에는 clock이 엄청 빨리 들어오는 경우가 있겠죠?

Pre STA(Logical Synthesis)에서 Timing 아무리 잘 맞춰놨어도 Post에서 Timing Violation이 크게 발생합니다.

​

그런거 개수가 많으면, CTS를 새로해야겠지만, 적은 경우엔

Sync clock인 경우.. Capture pin에 연결된 clock path에 기존 연결을 떼어버리고, Launch pin에 연결된 clock path를 Capture pin에 연결시켜 Timing을 만족 시키는 방법이 있겠습니다.

​

아니면 User가 INV pair를 삽입하거나 제거하는 수도 있겠네요.

또다른 궁금증이나 잘못된 정보, 꿀팁은 댓글로 남겨주세요
