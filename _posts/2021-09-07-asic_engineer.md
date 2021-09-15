---
layout: post
title: 
subtitle: #FPGA #ASIC #SoC #ASSP #DIFFERENCE #差异
tags: [FPGA, ASIC, SoC, ASSP]
comments: true
---

ASIC SoC Verification Engineer가 되기 위해서 무슨 능력이 필요할까? + 나는 뭐했을까? (feat.TMI)

이론 : Digital Engineering, VLSI Design, Data Structure, Computer Algorithm, Computer Achitecture, SoC Design & Structure, Embeded System Design

프로젝트 경험 : Sub-module ~ System 개발 경험 (Stop watch / 8bit MCU / ARM의 Cortex-M3를 Altera툴에 코딩하여 Digilet社의 LED, FND, Buzzer, Switch가 있는 FPGA Board인 BASYS2로 구현 경험. // 웹, 서버, 안드로이드 앱, Atmega128, Arduino 프로젝트 경험 있고, 납땜, 오실로스코프 사용 당연히 가능.

사용 환경 : Github, Linux, C/C++/System C, Verilog HDL, tcl, vim, Design Compiler(DCT, DCG), VCS, DFT Compiler, TetraMAX, Verdi, PrimeTime Spyglass, Formality, ICC1, ICC2 // Kotlin, R, Python도 공부했음. 개발환경은 vim이랑 pycharm

흥미, 쉬는날 하는 것 : 쉬는날에도 관심있는 부분을 깃헙 블로그에 정리중. 유튜브에 공부한 걸 올리고 있음. 본인 스마트폰의 유튜브 켜면 알고리즘 때문에 첫화면에 VLSI 강의하는 영어하는 인도 교수님 늘 나옴.  

나만의 장점 : EDA tool 교육 수료 / 학과 10%이내 성적 / 미술관 백화점 호텔 등 알바 경력 多 계약기간 초과하여 출근 했고, 계속 남아달라는 말 들었음. / 수업마다 항상 교탁 앞 1열 사수 / 운동 계속 해와서 체력 좋음. 항상 첫인상에 운동하냐는 말 들음.

나만의 단점 : 예를들어 AMBA의 AXI에는 Channel이 있어서 Handshake라는 과정이 필요하며... 이런 것들은 알겠는데, 이론으로만 배운게 전부임. 근데 직접 해보지 않으면 좀 의구심이 남는 성격이라 이런걸 못해봐서 아쉬움.

언어 : 영어 대화 자신 있음. 대학교에서 영어성적 다 A/A+. 그리고 학교에서 방학 원어민 특강 등으로 하는 영어수업에 6달 정도 한 경험 있음.(Essay 쓰는거랑 Hinglish에는 익숙해지는 중), 중국어 공부 중 


DFT Implementation
  - SCAN insertion / ATPG / Scan Simulation (Test Compiler / TetraMax)
  - BIST/BIRA Insertion & Simulation : Tessent MBIST / JTAG / IJTAG
  - SDC Creation & Clean
  - Spyglass LINT/SDC/DFT Check
  - Equivalence Check : Formality/Conformal
  - LDRC : Logic Design Rule Check (Spyglass_LDRC)
  - Timing Closure : cross-talk/noise/mttv/setup/hold fix (Prime_Time, Physical-aware ECO)
  - Low Power Design : UPF Creation & Low power Rule Check(VC_LP)
  - Multi-voltage, Multi power domain, Power-gating, Clock-gating.
  - Power Analysis : Vectored / Vectorless (PTPX)


Bus protocol (AMBA, NoC 등) 이해


DFT 전문성 보유
  - Top level DFT Architecture 설계 경험자
  - HPDF DFT 경험자 (Top/Block level)
  - ATE Vector setup 및 Yield 개선 업무 경험자
  - IJTAG(IEEE1687) 경험자 (Tessent tool 이용)

Hierarchical implementation Flow 경험자 - 하위모듈에서 A라는 로직을 만들면 상위모듈에서 A모듈을 인스턴스 해서 쓸 수 있음. 이걸 이용해서 업무 분담도 하고, 디자인 최적화도 할 수 있는 능력
SEC 14nm 이하 공정 경험자 - SEC란, Samsung Electronics Co의 약자
CPU (ARM Cortex Series, RISC-V 등) 1.0 GHz 이상 Hardening 경험 - Cortex-M,-A, RISC-V 등 프로세서의 개발 경험
DVFS implementation 경험. (Dynamic Voltage Frequency Scailing) - DVFS란, 작업에 대한 필요 클럭만 줘서 저전력하는 것
HSI IP Hardening 경험자 (LPDDR4 PHY / PCIe PHY / Ethernet PHY / SerDes PHY) - HSI란, (High-Speed Serial SynchronousProtocol). PHY란, physical cell의 약자.
설계 자동화 platform 개발 경험자 - EDA tool, script, 프로그래밍 언어 사용 경험
High-frequency Bus 구현 경험자 - AMBA 3,4,5에 대한 경험
