---
layout: post
title: 병렬처리 방법론. 멀티 코어, 멀티 프로세스, 멀티 쓰레드 기법 개념 정리
subtitle: #Parallel #Hardware #Computer
tags: [Parallel, 병렬 컴퓨팅, 병럴처리, Computer architecture]
comments: true
---

STA란(Static Timing Analysis, 정적 시간 분석) : 같은 오실레이터에서 나와 startpoint와 endpoint의 짝이 맞는 디지털 디자인에 대하여, 기능을 제외하고 시간에 대한 formal 검증, 수학적 검증을 수행하는 것.  
기능상 문제가 없지만, 타이밍이 안맞으면 뭐가 문젠데? -> metastable state이라고 불리는.. 어떤 값이 출력으로 나올지 모름.  
왜 기능 검증을 안하는가? -> 동시에 모든 검증을 하면 너무 느려지므로.  
  
PrimeTime이란, STA를 할 수 있는 EDA tool.  

STA를 하기 위해 필요한 것.  
SPEF(Standard Parasitic Exchange Format) : Net, Cell의 RC값 정보. (P&R이후에 나온다.)  
SDF(Standard Delay Format) : Parastics에서 나온 RC값을 딜레이로 계산한 정보  
e.g. IOPATH delay, INTERCONNECT delay, SETUP timing check, HOLD timing check. 날짜, 벤더, PVT조건 등..  
Gate-level netlist : RTL 합성 이후 나온 파일.  
e.g. .v, .vhdl
Libraries : RTL에 사용된 셀에 대한 정보  
e.g. cb13fs120_tsmc_max  
Design Constraints : 설계 제약 조건  
e.g. create_clock, set_input_delay, set_output_delay  
  
PrimeTime FLow
1. 디자인 설정  
Design, libraries 불러와서 링크하고, search, link path 알려주고, wire, port load 등 써주고, Parasitic 값 불러옴.  
2. 제약 사항 입력  
클록주기, 파형, 레이턴시, 인아웃풋 딜레이 등 넣어줌.
create_clock, set_input_delay, set_output_delay, set_clock_latency 등 제약사항 써줌.
3. 분석, 보고, 저장  
$check_timing
$report_timing #클록 정보, 각 셀들의 딜레이, DAT, DRT, 셋업홀드 여부, slack(worst case) 등을 볼 수 있음.
$report_analysis_coverage #타이밍 분석에 대한 검사율과 violation 비율
https://vlsi-backend-adventure.com/images/sta/timingreport.jpg
4. 디버그  

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

Prime time이 STA 하는법  
라이브러리에는 cell의 slew가 명시되어있습니다. PBA(Path Based Analysis)와 GBA(Graph Based Analysis)가 있는데, 

https://vlsi-backend-adventure.com/images/sta/timingreport.jpg

PT를 하면서, 궁금한게 있으면?  
$printvar #숫자 나옴.  
$help #command 찾아줌  
$man #command 설명  
  







