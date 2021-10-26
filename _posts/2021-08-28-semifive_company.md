---
layout: post
title: SiFive, 세미파이브 회사 하는 일, RISC-V 什么是 SEMIFIVE、SIFIVE 公司？
subtitle: What is SEMIFIVE, SIFIVE company?
tags: [SEMIFIVE, SIFIVE, RISC-V]
comments: true
---

RISC-V는 __오픈소스__ ISA (Instruction Set Architecture)입니다. core를 만들기 위한 명령어 집합입니다.
비슷한 회사로는 ARM이 있습니다. 애플이 M1 Core를 설계할 때 ARM의 아키텍쳐를 사용했죠.

RISC-V는 2010년에 버클리대학에서 [Krste교수님](https://en.wikipedia.org/wiki/Krste_Asanovi%C4%87 "교수:Krste Asanovic"), 박사과정:이윤섭, Andrew Waterman 박사 연구 개발을 시작했습니다.
이 세명이 2015년에 미국에서 SiFive로 창업을 하고, 한달 후 재단을 만들었습니다.
![foundation](/assets/img/foundation.PNG)

SiFive는 RISC-V ISA 연구개발을 통해 Chip License, ISA를 만드는 회사이고, MCU의 Chip이나 보드 또한 개발하고있습니다.

한국에는 2018년 10월에 SiFive Korea로 들어섰고, 현재는 SEMIFIVE의 이름으로 독자적으로 운영되고 있습니다. 주업무는 ARM / RISC-V 커스텀 반도체 설계인데, 세미파이브의 자회사 '세솔반도체'는 삼성파운드리의 디자인 솔루션 파트너입니다. RISC-V 칩 공정을 삼성전자가 할 수 있다는 것에 중요한 의의가 있습니다. (세미파이브는 RISC-V뿐만 아니라 ARM core 설계 또한 하고있습니다.) 대표님이 젊고, MIT에서 CPU 설계로 석박사,BCG에서의 경험도 있어서... 일반적인 MBA루트의 경영자와 다를거란 기대감도 있습니다.

21년 10월 26일 추가, 실은 면접 중에 먼저 들은 사실인데, 세미파이브는 기업가치 4000억 인정 받고 시리즈 B 투자 될 것으로 보인다네요.  
http://www.investchosun.com/site/data/html_dir/2021/10/22/2021102280187.html

이 회사들의 최고지분을 갖고 있는 재단의 경우, 스위스에 있습니다. 미중무역분쟁으로 중국이 퀄컴의 Chip이나 ARM 아키텍쳐 사용이 제한되니, 중국에서는 RISC-V에 엄청난 투자를 하고있습니다. 물론, 미국에서도 핫하구요.

중국에서는 StarFive, SiFive China의 이름으로 RISC-V License, R&D(edge computing, AI, 5G)를 하고있습니다.

2020 11월 기준, SiFive는 시리즈E 투자를 받아 $600M 기업가치를 인정받았는데, 2021년 6월 인텔은 $2B에 인수를 제안했고, RISC-V 7나도 공정 파운드리 서비스를 확대했습니다.

﻿

ARM의 경우는 Cortex-A, Cortex-R, Cortex-M으로 세 분야를 나누고 있는데,
RISC-V 역시, U cores, S cores, E cores로 나누고 있습니다. E core는 기존의 임베디드(가전장치 등)의 MCU에 들어가는 코어이고, S core는 IoT, AI, deep learning, edge computing에 들어가는 코어, U core는 Data center, Linux 등 고사양 작업용 칩입니다.


ARM이 기술도 좋고, 역사도 긴데 RISC-V가 경쟁자가 될 수 있는 이유는 __오픈소스__ 이기 때문입니다.
과거엔 미세공정으로 제품 성능을 올렸지만, 공정 한계에 오면서 설계의 중요성이 대두되었고, 한 칩을 범용적으로 쓸 때의 효율보다, 전용 칩(e.g. 추론용 칩, 수집용 칩)을 만드는 것이 좋다는 결론이 나왔습니다.
근데 ARM Core로 설계를 하면 숙련된 수십명의 엔지니어가 있는 상태에서 라이센스 비용으로 수십억이 필요한데, 
RISC-V는 오픈소스라서 무료이고, 오픈소스라서 배울 수도 있고, 숙련된 엔지니어를 찾기 비교적 쉬워질거라는 전망 때문에 경쟁자가 되고있습니다. 또, 오픈소스라서 성장세가 높구요.

저도 아직 RISC-V구조를 공부한지 얼마 안되서, 좀 더 공부해서 정보를 공유해보겠습니다.
