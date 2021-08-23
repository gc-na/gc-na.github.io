---
layout: post
title: 베릴로그란? Verilog code에서 반도체가 만들어지는 과정, 용어 핵심 정리 什么是 Verilog？ 用 Verilog 代码制作半导体的过程，关键术语
subtitle: What is Verilog? How to make a semiconductor from Verilog RTL code.
tags: [ASIC, Synopsys, extension, 디지털논리회로]
comments: true
---

입문자라면, 이전에 썼던 글인 ASIC Design Flow를 확인하시길 권합니다. https://gc-na.github.io/asic_flow/

Digital 세상에서 logic은 0과 1으로 구분합니다. 예전엔 5V가 넘으면 1, 아니라면 0. 이런 식으로. 저전력 시대가 오면서 이 임계값은 계속 내려가고 있습니다.
우리가 '모든 입력에 1이 들어올 때에만 출력에 1이 나와'라는 기능을 만들면 Logic입니다. 이 Logic으로 전체 회로도를 그린게 Gtech입니다.
이 Logic을 바탕으로, 실제적인(회로의 크기도 있고, 전달되는 속도도 있겠죠.) 회로로 만들면 Gate가 됩니다. 이 Gate로 전체 회로도를 그린게 Gate level netlist입니다.

'모든 입력에 1이 들어올 때에만 출력에 1이 나와' 같은 간단한 회로는 쉽지만, 스탑워치를 만든다던지.. 조금만 로직이 길어지면, 디지털 회로도를 만들기 매우 힘들어집니다.
그래서 '~할 때는 xx기능을 해줘'에서 ~와 xx만 채우면 회로를 프로그래밍할 수 있는 언어인 HDL(Hardware Decription Language)가 나왔습니다.
이 HDL을 이용하여 코드를 작성하면 _*_.v(Verilog HDL 확장자), _*_.vhd(VHDL 확장자)가 나옵니다

우리는 이 과정을 Design Comiler 같은 합성툴(Synthesis tool)을 사용해서 이 HDL 파일을 Gate level로 합성할 수 있습니다. 그러기위해 우리가 어떤 Gate, cell을 쓸것인지, 그 cell에 대한 정보들이 필요해요.

Standard cell - AND, INV 같은 디지털 회로 구성에 필요한 기본 셀입니다.
Macro cell (IP cell) - 스탠다드 셀에 없는 셀입니다. 특별한 기능을 추가하고싶을 때는 직접 이 셀 라이브러리를 만들거나 IP(Interlecutal Property) 회사에서 구매해옵니다.
Macro cell은 두가지 종류가 있습니다.
Soft Macro - RTL Level로 되어있는 셀입니다. 세세한 수정이 쉽지만, RTL만 되어 있기 때문에 나중에 작업해줄 것들이 많습니다.
Hard Macro - Hardware level로 된 셀으로, RTL부터 배치배선까지 끝난 셀입니다. 그냥 가져와서 내 회로와 연결만 하면 됩니다. 하지만, 세세한 수정이 어렵습니다.
magnet cell - 고정 배치 셀

ACS - Automated Chip Synthesis입니다. 자동 칩 합서인데, 상위 레벨로 가면 긴 실행시간과 램 부족 문제가 있습니다.

Analog 분야는 Cadence가 주도권을 쥐었지만, Digital 분야는 Synopsys가 주도권을 잡고 있습니다.
회사마다 다른 tool을 쓰지만, 대부분은 Synopsys의 툴을 쓰고, 이 툴에서 나온 프로그램들은 다른 프로그램과 호환이 안되는 경우가 많습니다.

milkyway - synopsys tool에서 쓰는 다양한 정보가 담긴 Database format입니다.


여기까지가... 제가 synopsys의 툴을 사용하면서, 공통적으로 겹치는 개념들이라고 생각해서 정리했습니다.
다음은 디자인하우스의 대략적인 팀 업무입니다.

PI - STA
PD - P&R
PV - LVS(Layout vs Schematic)과 DRC(Design Rule Check). 여기서 DRC는 최소 길이, 메탈 정보 등을 나타내지만... 다른 DRC(Design Rule Constraints)는 technology file에 들어있는 max transition, max fanout, max capacitence, minimum capacitence, cell degradation이니 혼동을 조심하세요.
