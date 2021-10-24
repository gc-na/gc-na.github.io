---
layout: post
title: STA란, PrimeTime 개념 정리
subtitle: What is a STA and PrimeTime
tags: [STA, PrimeTime, DRT, DAT, SDF, SPEF]
comments: true
---

STA란(Static Timing Analysis, 정적 시간 분석) : 같은 오실레이터에서 나와 startpoint와 endpoint의 짝이 맞는 디지털 디자인에 대하여, 기능을 제외하고 시간에 대한 formal 검증, 수학적 검증을 수행하는 것.  
기능상 문제가 없지만, 타이밍이 안맞으면 뭐가 문젠데? -> metastable state이라고 불리는.. 어떤 값이 출력으로 나올지 모름.  
왜 기능 검증을 안하는가? -> 동시에 모든 검증을 하면 너무 느려지므로.  
  
PrimeTime이란, STA를 할 수 있는 EDA tool.  

STA를 하기 위해 필요한 것.  
1. Back Anotation File
(1) SPEF(Standard Parasitic Exchange Format) : Net, Cell의 RC값 정보. (P&R이후에 나온다.)  
(2) SDF(Standard Delay Format) : Parastics에서 나온 RC값을 딜레이로 계산한 정보. StarRC를 통해 딜레이를 추출한다. 아마 엘모어딜레이 쓸듯(뇌피셜)  
e.g. IOPATH delay, INTERCONNECT delay, SETUP timing check, HOLD timing check. 날짜, 벤더, PVT조건 등..  
![sdf_spef](/assets/img/spef_sdf.png)
https://en.wikipedia.org/wiki/Standard_Parasitic_Exchange_Format#*CONN_Section  

참고로, spef파일 내에 conn은 net와 pin의 연결정보, cap은 커패시턴스, res는 저항 값을 의미합니다.

2. Gate-level netlist : RTL 합성 이후 나온 파일.  
e.g. .v, .vhdl  
3. Libraries(Technology Cells) : RTL에 사용된 셀에 대한 정보  
e.g. cb13fs120_tsmc_max  
![library](/assets/img/library_file.png)

4. Design Constraints (Tcl로 작성된) : 설계 제약 조건  
e.g. create_clock, set_input_delay, set_output_delay  
+ 부수적으로 Script file. 없이도 할 수 있지만, 꼭 만들어서 하기를 권장한다. 실수를 줄이기 위해.  
  
PrimeTime FLow
1. 디자인 설정  
Design, libraries 불러와서 링크하고, Top level 디자인 설정하고, search, link path 알려주고, wire, port load 등 써주고, Parasitic 값 불러옴.  
$read_verilog
$link_design ORCA  
$set search_path  
$lappend link_path  
2. 제약 사항 입력  
클록주기, 파형, 레이턴시, 인아웃풋 딜레이 등 넣어줌.
create_clock, set_input_delay, set_output_delay, set_clock_latency 등 제약사항 써줌.
![constraints](/assets/img/constraints.png)  
참고로 위 파일은 제가 Synopsys DC Lab할 때 만든 con file입니당

3. 분석, 보고, 저장  
$check_timing #제약 조건이 잘 들어갔는지 확인.
$report_timing #클록 정보, 각 셀들의 딜레이, DAT, DRT, 셋업홀드 여부, slack(worst case) 등을 볼 수 있음.
$report_analysis_coverage #타이밍 분석에 대한 검사율과 violation 비율
$set timing_update_status_level high #어디서 timing update가 일어났는지 확인
![report1](/assets/img/report_timing.png)  
![report2](/assets/img/report_analysis_coverage.png)  

4. 디버그  

STA에 들어가기 전에 마음가짐(?) : 스크립트의 중요성  
(1) 칩을 실수 없이 만들어야하고, (2) 많은 경우에서 충분히 의미있는 검증이 수행되어야 한다.  
Tape-out 직전에는 할 일은 많은데, 정신적으로는 지쳐있다.  
우리는 우리를 믿어서는 않고, (1) 검증된 스크립트를 통해 자동으로 디자인 (2) 다양한 조건에서 놓치지 말고 자동으로 시뮬레이션을 수행해야 한다.  
디자인을 불러오든, 제약 조건을 불러오든, 검증을 불러오든, 항상 스크립트로 구현하는 습관을 들여야한다.  

타이밍 체크에 필요한 개념  
Launch edge : FF1의 Active edge
Caputre edge : FF2의 Active edge
DRT : FF2가 FF1의 출력을 받기 위해서 도착해야하는 최대 시간
DAT : FF1의 출력이 FF2의 input에 도착하는데 걸리는 시간
Slack : Violation이 일어나지 않는 마진.
Setup time : active clock edge __이전에__ 데이터가 안정적으로 유지되어야할 최소 유지시간. Slack=DRT-DAT  
앞 블록과 뒷 블록의 스큐 값이 크면(FF1에서 데이터를 보내는게 오래걸리는데, FF2에서 일찍 FF1의 데이터를 받으려한다면), Setup Violation이 일어날 수 있다.  
Hold time : active clock edge __이후에__ 데이터가 안정적으로 유지되어야할 최소 유지시간 Slack=DAT-DRT  
앞 블록과 뒷 블록의 스큐 값이 작으면(FF2가 늦게서야 데이터를 보내기 시작했는데, 금방 FF1에서 FF2로 데이터가 도착한다면), Holdtime Violation이 일어날 수 있다.  
Start point : FF의 Clk핀, input port
End point : Clk핀을 제외한 모든 입력핀, output port
Primetime이 시간을 측정하는 한 path : FF1의 clk 핀에서 FF2의 입력핀. 이렇게 한 쌍의 핀이 하나의 path로 인정.
Slew, Transition : 데이터가 바뀌는데 걸리는 delay. 엄밀하게 말하면, 데이터가 10%에서 90%까지(혹은 20%에서 80%)까지 변화하는데 걸리는 시간  
Timing arc : input pin이 다른 핀의 데이터 변화에 영향을 끼치는데 걸리는 지연 시간  
Unate cell : 입력핀 하나만 바뀌어도 출력이 변하는 셀  
Black Box : cell 내에 timing arc가 빠져서 정확한 STA를 할 수 없는 셀. $set link_create_black_boxes false로 생성 막을 수 있음.


PT를 하면서, 궁금한게 있으면?  
$printvar #숫자 나옴.  
$help #command 찾아줌  
$man #command 설명  
  
클럭의 종류  
Synchronous clock : 한 클럭에 의해 launch되고 다른 클럭에 의해 capture   
Asynchronous clock : 상호 타이밍 관계가 없다면, PT는 타이밍 체크를 안함  
Generated clock : 소스클럭에서 곱해지거나 나눠져서 나온 클럭이고 레이턴시가 없다. Input, Output delay들의 참조로 쓰인다.  
Virtual clock  : 실제 디자인의 핀, 포트에 연결되지 않았는데, 타이밍 검증을 하기위해 가상적으로 넣어주는 클럭  
디자인 내 클럭의 수 보는법 : $sizeof_collection \[all_clocks\]
정의된 모든 클럭의 포트 보는법 : $rpt_clock_ports $get_clock_ports




