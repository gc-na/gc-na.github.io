---
layout: post
title: SoC 검증에서 DFT란. BIST BIT JTAG SCAN, DFT engineer 0.1v
subtitle: What is a DFT in VLSI?
tags: [SoC, ASIC, DFT, Verification]
comments: true
---

DFT는 반도체 Manufacturing Test의 일부입니다.
DFT(Design for test)는 설계를 테스트 하는 검증 방법입니다.
모바일 AP의 경우에 인풋이 거의 1000개 정도 있습니다. 이 1000개에 모든 경우의 수를 넣기는 시간적으로 어렵습니다. 그리고 공정이 끝나고 외부 장비를 사용하면 매우 비용 부담이 큽니다.
공정 이전 단계에서 결점(Flaw) 결함(Fault, Fault != Error)을 검출하기 위해 DFT를 합니다.(시간, 돈, 인력 모든게 다 경제적입니다.)
DFT는 보통 회로에 테스트 회로를 앞단에 연결해서 검증합니다.

로직에 문제를 주면 Logic Fault, Delay나 동작속도(Operating speed)에 영향을 주면 physical fault입니다.
Fault model에서 Logic design의 경우,
- Short / Open stuck fault
- Single / Multiple Stuck Fault SF란, 어떤 선의 값이 어떤 값으로 고정되는 것입니다. 인풋 A에 1을 주든 0을 주든 인풋 A의 와이어에 0의 값으로 고정된다면 s-a-0로 표기합니다.
- Bridge fault (다른 로직의 와이어와 연결 됨. 이건 별로 체크 안하고, 위의 2개 많이 체크함.)
- Transition Fault
physical design의 경우, gain의 변경이나, 이전 state에 영향을 받거나.. 로직디자인보다 훨씬 복잡합니다.


Fault Coverage가 이 DFT의 핵심입니다.
FC는 전체에서 검사한 비율을 봅니다. 이 검사한 비율이 반도체 수율이 되는건 아니고, 검사하지 못한 부분은 결함이 있는지 확인하지 못한 부분입니다.
이 FC가 각 회사별 기준값 이상 나와야 다음 단계로 갈 수 있습니다.

많이 쓰는 기법인 SCAN은 1️⃣추가 로직과 인아웃풋을 달고, 2️⃣플립플롭들에 선을 체인처럼 한줄로 연결하고, 3️⃣테스트벡터를 입력하는 방식입니다.
![SCAN](https://i2.wp.com/semiengineering.com/wp-content/uploads/2015/02/scan-test.jpg)
stuck fault등을 체크할 수 있는 기법 중 하나에요. LSSD SCAN이 많이 쓰입니다.

Logic BIST (Built In Self Test) / BIT (Built In Test)
![BIST](https://mblogthumb-phinf.pstatic.net/MjAxODA4MTFfNjgg/MDAxNTMzOTk3ODQ2Nzg1._C8kl7XMUiydvKXHibv7FOFEtWUX1Oxfrsw1_h5JgK0g.KLNN2hkzRhWMaYPtdnDAuVdHJMEgaG_3_Qy5IJeEI8Yg.PNG.zzbksk/BIST.png?type=w2)
자체 테스트 회로를 추가해 로직이 제대로 동작하고 있는지 확인하는 방법입니다.
SCAN으로 하면, Chain을 다 통과해야해서 좀 느려지는데, BIST는 SCAN에비해 시간 지연률이 낮습니다. 하지만 추가회로때문에 면적이 커집니다. (SCAN과 함께 쓰이기도 합니다.)

Boundary SCAN은 BIST와 비슷한데, 내부에 같이 있는게 아니라, 외부에서 IC간의 연결, 회로동작을 테스트합니다.
JTAG은 제조 후 PCB 기판을 테스트하고 설계를 검증하는 방법입니다.

제 직무는 아니라서 잘은 모르지만, 제가 보기에 DFT 엔지니어라 하면,SCAN/BIST/JTAG 확인을 하고, 요즘은 Power Simulation도 해서 IR Drop (패턴 보고)을 하는 직무로 볼 수 있는 것 같습니다.
