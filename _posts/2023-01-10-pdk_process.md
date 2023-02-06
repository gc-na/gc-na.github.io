---
layout: post
title: PDK란? process design kit in vlsi
subtitle: #PDK #SoC #ASIC
tags: [PDK, SoC, ASIC]
comments: true
---

ASIC 개발을 할 때, 아래처럼 시작을 합니다.

아이디어 수립

제품 스펙 결정

PDK 수령 및 MTO 날짜 결정

​

PDK는 Foundry에서 Designer에게 전달하는 기본적인 Design Kit입니다.

30년 전에는 PDK에 대한 개념도 없었고 SPICE로 만든 Behavior Model 과 unit Square 당 R.C 값 정도만 가지고 회로 설계를 하였습니다.

DSM으로 진입하며, 설계도와 Chip간 괴리가 커지게 되었습니다.

이를 보완하기 위해 설계 엔지니어 <-> 공정 엔지니어 간 회의를 통해 주고받던 data 들이 정리가 되어 외부 고객들에게 제공 되었습니다.

![ba](/assets/img/2023020714.PNG)  

위 그림에는 PDK Flow가 설명되어있는데, DSM으로 들어가면서 과정들이 조금 더 추가되었습니다만... 위 과정과 거의 같습니다. 그리고 제가 Foundry engineer가 아니라, 자세한 과정을 쓰긴 어렵네요... 학교에서 배운게 전부여서..ㅎㅎ

​

통상 각 공정 1개당 1개의 PDK 가 만들어지고, 설계자들이 알아야 하는 기본적인 공정에 대한 정보 그리고 Library, Memory까지도 포함되어 있기도 합니다.

PDK의 스펙이 좋아 Timing을 잘 맞출 수 있는지 + PDK와 실제 칩 큰 차이가 없는지 + IP와 document 수준 등에 따라 설계 난이도가 결정됩니다.

​

그런데 Fabless마다, Design house마다 PDK를 갖고 설계하는는 EDA Tool과 Tool version이 천차만별입니다.

공정사에서는 최대한 많은 툴과 버전에서 PDK 검증을 하고, startup, 학교, design house에서도 접근 할 수 있도록 Tool을 제공해주기도 합니다. (최신버전 EDA Tool들을 이용하려면 몇십억원 필요하기에.)

​

Foundry에 소자공정개발, 설계 지원팀으로 가면 PDK 개발, Library Character등 하게 될텐데.. Cadence 사의 Virtuoso 강의가 IDEC에서 종종 열리고 있습니다.

​

아래는 PDK를 이용해 RTL을 Logical & Physical synthesis한 후, Test하는 과정이 나와있습니다.

![ba](/assets/img/2023020715.PNG)
