---
layout: post
title: Synopsys 파일 확장자. cb13fs120_tsmc_max란?
subtitle: Synopsys file extension
tags: [ASIC, Synopsys, extension]
comments: true
---

Synopsys EDA tool을 사용하면서 긴가민가 했던 것들을 정리했습니다.

![Synopsys](/assets/img/synopsys-vector-logo-small.png)

cb13fs120_tsmc_max - tsmc 130nm 공정 라이브러리. Student LAB에선 다 이거 썼다. 130nm는 아무공정 회사나 하는거 아닌가 했는데, tsmc가 작은 breakdown voltage로 잘 잡는다네요. (이 라이브러리 궁금해서 구글링 계속 했는데, 안 나와서 중국어 번체로 구글링해서 찾음;;;;)

_*_.v - verilog RTL source file. DC나 ICC에서는 Gate level netlist로 쓴다.

_*_.ddc - synopsys internal database format. Design compiler에서 Write를 하면, ddc파일 형태로 포맷이 나옵니다. ddc는 RTL code, Top design 적용이 된 로직(Gtech, 부울식으로 풀린) 포맷입니다. ddc를 안하고 매번 베릴로그 파일을 읽고, top design 적용하고, 연결하고, Gtech으로 적용하면 많은 시간이 소요되어 이 포맷을 사용합니다. 

_*_.svf - 자동 셋업 파일. 보통은 이 파일로 default setup을 지정합니다. Formality 할 때 필요한 파일입니다.

_*_.spef - standard parasitic exchange format. P&R하면 나오는데, 여기에 RC값 들어있어서 이 딜레이를 갖고 STA 할 때 쓴다.

_*_.sdf - standard delay format. spef파일을 딜레이로 변환해서(아마도 엘모어딜레이) 딜레이로 갖고있다. 그래서 실행속도가 spef보다 빠르다.

_*_.tcl - synopsys 툴을 실행할 때 내가 원하는 설정으로 실행하도록 정의한 파일 (본래 tcl은 Tool command language라고, 하나의 언어입니다.)

_*_.sdc - Synopsys Design Constraints입니다. (이것도 TCL이 Base입니다.) 파일에는 sdc 버전, 유닛, 제약조건 등이 들어있습니다.

_*_.lib - Technology library source file. Vendor에서 주는 셀 정보가 있습니다.(어떤 셀을 사용할 수 있고, 어떤 셀의 이름 area와 delay 등 정보가 담겨있습니다.)

_*_.db - Technology library (_*_.lib이 synopsys tool에 의해 compile 된 형태)

여기서 앞에 p가 붙으면 physical library(Layout, R, C값 정보가 담김.)고, s가 붙으면 symbol library(Library cell을 표현하는 Graphic 등의 정보가 담김.)입니다.

_*_.map - mapping file

_*_.def – Design Exchange Format. 디자인을 Milkyway Format으로 저장합니다.

_*_.lef - Library Exchange Format. 라이브러리의 스탠다드셀을 Milkyway Format으로 저장합니다.

_*_.rpt – Design reports들이 자동으로 이 파일에 저장됩니다.

_*_.tf – Vendor Technology File. 각 메탈 레이어들의 물리적, 전기적 특성 정보가 들어있습니다. route, DRC 할 때 필요합니다.

_*_.itf – Interconnect Technology File. 메탈의 두께와 물리적 속성, 도체 간의 폭, 도체의 크기, 저항 값 등이 들어있습니다. 이거로 TLU, TLU plus file 만듭니다.

_*_.tluplus - metal의 단위 길이당 R, C값 정보가 담깁니다. Net delay 계산이 쓰입니다.

Milkyway Database란, Design 할 때 필요한, Power, Ground, Clock, Cell, Wire.....등등 많은 데이터들이 저장되어있는 데이터베이스입니다.
