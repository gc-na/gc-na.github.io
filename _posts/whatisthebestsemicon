---
layout: post
title: 가장 좋은 반도체 설계에 대한 내 생각 정리. (HPC, Low power)
subtitle: #HPC #Lowpower
tags: [HPC, Lowpower]
comments: true
---



﻿
*주관대로 쓴 내용입니다.


검색 노출을 위해 제목은 '가장 좋은 반도체' 라고 썼지만, '가장 좋은 논리 회로'라고 말하고 싶다.

현대 기술력으로 '논리 회로'로 쓸 수 있는 가장 좋은 소자가 반도체라서 반도체를 쓰는 것이다.


예를들어 생명 공학이 더 발전하면, 다른 바이오 소자를 디지털 논리 회로로 사용 할 수도 있다.

트랜지스터의 재료가 실리콘이 유기화합물으로 대체된다 하더라도 디지털 논리회로 설계 하던 사람들은 계속 설계 일 할 것 같다.



성공한 반도체 설계??

반도체 설계를 실제로 해보면 알겠지만, 일정 맞춰서 Tape-out하고, Chip에 Bug 없으면 반은 성공이다.

고객은 좋은 chip을 최대한 빨리 받고싶어하고, Tape-out 날짜를 맞추기가 매우 까다롭고 Tape out(공정사에 설계도 전달)을 하려면 엄청난 검증(야근)이 필요하기 때문에... Tape out + Bug 없으면 반은 성공이다.


양산 과제가 아니라, 실험 프로젝트라면 MPW로 올려야 할텐데,

삼성 파운드리에선 MPW가 1년에 몇 번 없다. 그래서 MPW 기간 못 맞추면... 몇 달을 기다려야 할 지 모름.

삼성 파운드리 MPW 셔틀은 고객이 시간과 비용을 절약하면서 제품을 효율적이고 안전하게 검증할 수 있는 방법입니다.

semiconductor.samsung.com



성공한 반도체 사이에서, 가장 좋은 반도체는 무엇일까?

이건 때에 따라 달라질 수 있는 답변인데, 아래 항목을 만족하면 된다.


반도체 Area가 작을 수록 좋다

: Chip이 작아야 Wafer 안에 많은 Chip을 그릴 수 있고, 그러면 Chip 당 단가가 내려간다! 그리고 반도체 Chip이 작다는건, 소형 Device에 사용하기 적합해진다.

아주 옛날에는 반도체로 할 수 있는 application이 제한적이다 보니, Chip size가 가장 중요했다고 한다.


Chip size를 줄이려면, '동작, 동작 조건, 성능'을 제한해야 한다.

동작과 동작 조건을 줄여야 필요한 Logic의 수가 줄어들고,

성능을 제한해야 Timing violation 없이 큰 fanin, fanout을 사용 할 수 있다.



반도체 Performance가 빠를 수록 좋다.

: 반도체의 Performance에서 중심은 Clock Frequency이다.



대표사진 삭제
사진 설명을 입력하세요.

Frequency가 높을 수록 반도체 성능이 높아진다.

위에 보이는 i5는 Intel의 대표 CPU인데, 기본 클럭은 2.9GHz, 최대 클럭은 4.3GHz이다. 1GHz면, 1ns(nano는 10^-9)이다.

Clock Frequency를 높이려면,

순차회로 사이에 조합회로가 거의 없고, 별로 없는 조합회로의 transition 속도가 빨라야 하며, 순차회로 간 물리적인 거리 또한 짧아야한다. (Elmore's delay)

Moore's law와 Dennard scaling이 지켜지던 때에는 공정 발전만 되면 Clock Frequency를 계속 올릴 수 있던 때가 있었다. 하지만 2000년대 초에 saturation이 오기 시작했다.


2000년대 초부터 Intel에서는 Multi-core, Multi-thread. 병렬처리 기술이 적용 된 하드웨어들을 발표하였다.

하지만, 코어와 쓰레드가 무한하다고 하더라도, 직렬 프로세스는 병렬처리로 빠르게 처리 할 수 없기 때문에 2010년대부터 saturation이 왔다.







나는 블랙베리를 줄곧 써오다가 아이폰X로 기기변경을 했다.


아이폰X를 쓰고 느낀 점은 아래와 같다.

"이정도 성능이면 죽을 때까지 쓸 수 있겠다"

"겨울에 배터리 왜이렇게 빨리 닳아???"

"게임 할 때 왜이리 버벅거리지???"


반도체 Power 소모가 낮을 수록 좋다.

: 반도체의 Power는 동적 전력과 정적 전력의 합으로 구해진다.

문턱 전압이 높을 수록 동작 속도는 느려지고, 정적 전력 소모량도 내려간다.

clock frequency를 낮출 수록 동적 전력은 내려간다.


그래서, 필요한 로직에 필요한 signal만 넣어주는.. Power/Clock gating, DVFS, Level shifter 설계가 쓰인다.

아니면, Big-Little 구조처럼 한 Chip 안에 고성능이 필요 할 때 쓰는 processor와 평상시에 쓰이는 processor를 둘 다 넣고 둘 중 택일하여 쓰도록 하는 설계도 있다.


2022년 출시된 iPhone14 Pro의 A16 processor Gate count는 160억개이다. 이 160억개 중 어떤 부분이 Power gating이 필요하고.. clock gating이 필요하고... 이런걸 사람이 하나 하나 다 보면서 하진 할 수는 없기에 EDA Tool을 이용해 Script를 작성하여 만든다.(그래서 어렵다.)


SystemVerilog, UVM 등으로 Function simulation 할 때 사용하는 Input Vector로 chip 내부의 Internal switching 정보가 담긴 FSDB를 출력한다.

FSDB를 보면, 어떤 Cell이 transition이 많이 일어나는지.. 어떤 Cell 묶음이 같이 Transtion이 일어나는지.. 등 정보를 알 수 있기 때문에, 이 FSDB를 합성, P&R 단계에서 더 최적화를 진행 할 수 있다.

﻿
