---
layout: post
title: SoC 검증에서 DFT란. BIST BIT JTAG SCAN BIRA
subtitle: What is a DFT in VLSI?
tags: [SoC, ASIC, DFT, Verification]
comments: true
---

DFT는 반도체의 효율적으로 결함 검사를 하여(FC, Fault Coverage를 높여), 불량률(DPPM, Defect Parts Per Million)을 낮추기 위한, Manufacturing Test의 일부입니다.
DFT(Design for test)는 Logic의 논리적 결함, 물리적 결함(아래에서 설명)을 찾기위해 "내부에" 테스트 회로를 추가하는 방법입니다.
(그냥 단순히, '로직에 모든 경우의 수를 넣으면 되는거 아니야?'라고 생각할 수 있는데, 64비트만해도 경우의 수가 1800경입니다. 모바일 AP의 경우에 인풋이 거의 1000개 정도 있습니다. 이 1000개에 모든 경우의 수를 넣기는 시간적으로 어렵습니다. 그리고 공정이 끝나고 외부 장비를 사용하면 매우 비용 부담이 크기 때문에, 내부에 회로를 넣어서 효율적으로 테스트합니다.)

공정 이전 단계에서 결점(Flaw) 결함(Fault, Fault != Error)을 검출하기 위해 DFT를 합니다. DFT는 보통 회로에 테스트 회로를 앞단에 MUX와 D F/F가 합성된 회로를 연결해서 검증합니다.
Fault Coverage, __FC__ 는 전체에서 검사한 비율을 봅니다. 이 검사한 비율이 반도체 수율이 되는건 아니고, 검사하지 못한 부분은 결함이 있는지 확인하지 못한 부분입니다.
이 FC가 각 회사별 기준값 이상 나와야 다음 단계로 갈 수 있습니다.


DFT가 찾는 결함이 무엇인지 알아보겠습니다.
로직에 문제를 주면 Logic Fault. 동작속도(Delay, Operating speed)에 영향을 주면 물리적 결함입니다.
Fault model에서 Logic design의 경우,
- Short / Open stuck fault
Stuck Fault란, 어떤 선의 값이 어떤 값으로 고정되는 것입니다. 인풋 A에 1을 주든 0을 주든 인풋 A의 와이어에 0의 값으로 고정된다면 s-a-0로 표기합니다.
- Single / Multiple Stuck Fault
- Bridge fault (다른 로직의 와이어와 연결 됨. 이것과 아래의 항목은 별로 체크 안하고, 위의 두 항목 많이 체크함.)
- Transition Fault

Combination Logic은 비교적 테스트하기 간단한데, Sequential Logic은 이전 state에 영향을 받기 때문에 더 복잡합니다.
그래서 Sequential Logic test를 단순화하는 SCAN이라는 방법이 쓰입니다.(특히 LSSD SCAN이 많이 쓰입니다.
__SCAN__ 은 1️⃣추가 로직과 인아웃풋을 달고, 2️⃣플립플롭들에 선을 __체인처럼 한줄로 연결하고,(SCAN Chain이라고 불림.)__ 3️⃣테스트벡터를 입력하는 방식입니다.
그러면 이전 state 값이 명확해집니다. 그러면 테스트벡터를 넣어서 Stuck at fault 같은 문제를 찾아냅니다.
![SCAN](https://i2.wp.com/semiengineering.com/wp-content/uploads/2015/02/scan-test.jpg)
(이 과정이 어렵지만 DFT EDA tool에서 알아서 하기 때문에 고민할게 없는데, Sequential Logic들의 각기 다른 클럭에서 동기된다면 복잡해집니다.)

보통 DFT라고 한다면, 3가지로 나뉩니다. Boundry SCAN, ATPG, MBIST.

Boundry SCAN(IEEE-1149.1 1990 JTAG, Joint Test Action Group)은 앞서 말한 SCAN과 원리는 같습니다.
In/Output 모두 연결해서 Tab controller를 사용해 칩, 칩간의 연결을 테스트할 수 있는 국제적으로 표준화된 방법입니다.
https://www.electronics-notes.com/articles/test-methods/boundary-scan-jtag-ieee1149/what-is-boundary-scan-jtag.php
https://www.youtube.com/watch?v=TlWlLeC5BUs&ab_channel=EEVblog


Logic BIST (Built In Self Test) / BIT (Built In Test)
![BIST](https://mblogthumb-phinf.pstatic.net/MjAxODA4MTFfNjgg/MDAxNTMzOTk3ODQ2Nzg1._C8kl7XMUiydvKXHibv7FOFEtWUX1Oxfrsw1_h5JgK0g.KLNN2hkzRhWMaYPtdnDAuVdHJMEgaG_3_Qy5IJeEI8Yg.PNG.zzbksk/BIST.png?type=w2)
자체 테스트 회로를 추가해서 테스트 패턴을 스스로 생성하고 로직이 제대로 동작하고 있는지 확인하는 방법입니다.
SCAN으로 하면, Chain을 다 통과해야해서 좀 느려지는데, BIST는 SCAN에비해 딜레이가 적지만, 추가회로때문에 면적이 커집니다. (SCAN과 함께 쓰이기도 합니다.)

BIST로 Fault Check를 하고,
__BIRA(Built-In Redundancy Analysis)__ 는고장난 정보를 이용하여 여분의 메모리에 어떻게 재배치 할 것인지 판단합니다.
__(BISR : Built-In Self-Repair)__ 는 사용자가 Fault 주소로 데이터를 읽거나 쓰기를 할 때, 재배치 정보를 이용하여 여분의 정상 메모리로 대체합니다. (고장난 기능을 여분으로 고쳐줍니다.)

DFT 엔지니어라 하면, SCAN/BIST/JTAG 등으로 결함을 찾을 수 있게하고, Power Simulation으로 IR Drop (패턴 보고)을 하는 직무로 볼 수 있습니다.
