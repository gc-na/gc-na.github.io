---
layout: post
title: SDC란? Standard Design Constraint란, Standard Design Constraint란 VLSI, Verilog, 반도체 설계
subtitle: #Lowpower #Multibit #DSM
tags: [DFT, MBIST. Multibit]
comments: true
---


![ba](/assets/img/2023020716.png)  

우리가 CPU를 사든 그래픽카드를 사든 Memory를 사든 거기에는 성능값으로 clock speed(clock frequency)가 나와 있습니다.

컴퓨터의 모든 명령은 매 clock마다 수행이 됩니다.

​

여러분이 제 블로그를 열 때도 컴퓨터/휴대폰 속에서 수많은 명령어 연산들이 이뤄지는데요.

그 명령어 연산들이 반도체의 동작을 세세하게 명령합니다.

​

반도체의 동작들은 clock을 기준으로 동작됩니다.

어떤 반도체는 0->1이 되는 순간 동작하는 반도체가 있고, 어떤 반도체는 1->0이 되는 순간 동작하는 반도체도 있어요.

​
![ba](/assets/img/2023020717.png)  


아무튼,

1. 프로그램은 반도체에 명령을 준다.

2. 반도체는 clock을 기준으로 동작한다.

3. clock이 빠를 수록, 반도체는 빠르게 동작 -> 프로그램이 빠르게 동작한다.



기능에 대한 설계는 Verilog라는 언어로 만든 Design을 통해 만들게 됩니다.

​

SDC는 Synopsys Design contraint라고도 불리고, Standard Design Constraint라고도 불리는데요.

Constrant! 제약사항입니다. 실질적인 제약사항을 주는거에요.

SDF나 SDC로 제약사항들을 알려주지 않으면, 제약사항 없이 시뮬레이션이 됩니다.

​

반도체에는 실제 동작 하기위해 걸리는 지연시간이 있는데, 이걸 무시하고 그냥 clock speed를 막 올리면, 반도체 오동작이 야기됩니다.(더 알아보고싶으시면, setup time violation에 대해 검색해보세요.)

​

Clock speed가 반도체 성능의 대표적 지표이기 때문에 반도체 회사에서는 clock speed를 최대한 높이기 위해 노력하고, 이 목표값을 맞추기위해 엔지니어들이 고생합니다.

반도체 설계를 하고나서, 이 설계가 실제 칩에서 동작을 할 수 있는지 알기위해 실제적인 제약사항을 SDC를 통해 줍니다.

​

SDC에는 그래서 아래 같은 내용들이 들어있어요.

Clock 정보 정의

입 출력 지연시간 정보 정의

Timing 검증을 하지 않아도 되거나, 여유를 주고 해도 되는 부분 정의

특정 pin/port에 값 강제 입력

여러 Timing path들이 존재하는데, 그것에 대한 Group 설정

등이 있습니다. 

​

​

기능 정보만 들어있는 Verilog RTL을 갖고 논리합성(Logical Synthesis)을 진행하려면 이 SDC파일이 필요합니다.

Synthesis Tool은 제약사항을 최대한 만족하는 Netlist를 만들게 됩니다.

​

P&R할 때에도 동일한 SDC를 사용하여 Physical netlist를 만들게 됩니다.

ATPG를 진행 할 때에는 SDC가 필수는 아니지만, SDC를 주고 ATPG 진행하면 Simulation에서 발생 할 수 있는 mismatch를 줄일 수 있습니다.

Timing이 실제로 문제가 없는지,,, Sign-off를 하려면 STA Tool로 Sigh-off를 해야하는데 여기에도 SDC가 필요합니다.

그리고 Tape out 직전, 마지막 Dynamic Timing analysis를 하려면, SDF를 출력해야하는데 여기에도 SDC가 필요합니다.

​

하나의 SDC로 합성부터 끝까지 사용되기 때문에, 처음에 잘못된 SDC를 사용하면 끝까지 고생하게 됩니다.

잘못 작성된 SDC로, 검증에선 문제가 없었는데 실제 Chip 나왔을 때 구동이 안 될 수도 있습니다.

​

RTL도 완벽하게 만들어야 하고, SDC도 완벽하게 만들어야.. Chip 동작에 문제가 없고.. 목표 성능을 이룰 수 있는지.. 없는지.. 빨리 알 수 있습니다. 목표 성능을 이룰 수 없으면, Spec down을 하던지 RTL 수정을 하던지 해야합니다.

​

궁금한 것 댓글 남겨주세요.

