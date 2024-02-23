---
layout: post
title: STA란, PrimeTime 개념 정리
subtitle: What is a STA and PrimeTime
tags: [STA, PrimeTime, DRT, DAT, SDF, SPEF]
comments: true
---

STA란(Static Timing Analysis, 정적 시간 분석) : Static 상태를 가정하고, timing path들의 Timing analysis 하는 것.

아래에서 각 용어에 대해 자세히 설명할건데, synopsys의 설명을 먼저 보길 바람

https://www.synopsys.com/glossary/what-is-static-timing-analysis.html

**Timing path란?** Startpoint에서 Endpoint까지 delay path이다.

Synopsys의 설명을 보면 아래처럼 대강 정리 할 수 있다.

Startpoint를 예시로 들면, 디자인의 Input port 혹은 Sequential cell의 Output pin.

Endpoint는 디자인의 Output port 혹은 Sequential cell의 Input Pin

(참고로 Port는 Current design의 입출력이다. Pin은 Sub-design의 입출력이니까 헷갈리지 말자.)

STA는 startpoint와 endpoint의 짝을 맞춰, 기능을 제외하고 시간에 대한 formal 검증(수학적 검증)을 수행하는 것이다.

기능상 문제가 없지만, 타이밍이 안맞으면 뭐가 문젠데? -> metastable state이라고 불리는.... 상황이 될 수도 있음.

![M1](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Metastability_D-Flipflops.svg/1920px-Metastability_D-Flipflops.svg.png)
1. 왜 기능 검증을 안하는가? -> 동시에 모든 검증을 빠르게 할 수 있으면 좋겠지만, 최근 SoC의 사이즈가 엄청나게 커지고있다. Billion 단위의 Transistor들이 엄청나게 나오고 있다. 앞으로는 더 커질것이고.

2. Static은 알겠는데, DTA도 있나? -> 있음. ASIC에선 대표적으로 Synopsys의 VCS로 할 수 있다.

3. STA라는걸 왜 하는지, 왜 효율적인지 아직도 모르겠는데?

(1) 일단 칩이 매우 크다는 점을 가정해야 함. DTA로 하면, Chip의 Input port에 signal을 1->0, 0->1등으로 흔들면 전체 칩에 모두 propagation이 되는데, 이 과정에 엄청난 Memory 소모와 Runtime 소모가 필요.

(2) Chip을 Timing path 단위로 나눴다고 보면 된다. -> 그러면 아까 synopsys에서 봤던 그림처럼, Flipflop ~ Combinational cell ~ Flipflop 이런식으로 꽤나 단순해진다.

(3) 이제 이 Timing path의 Input pin을 1->0, 0->1으로 값을 계속 switching 시키고, 가장 worst한 결과를 뽑으면 된다. 어떻게 timing 계산하는지 궁금하면, setup time, hold time에 대해 찾아 볼 것.

다시 돌아와서, DTA는 Chip test를 하려면 input port에 있는 값을 흔들어야 하는데, Chip 어딘가에 있는 특정 Flipflop의 pin에 있는 값을 1->0으로 만들려면.. Chip의 Input을 어떤 식으로 값을 인가해야할지 이런 Vector geneartion에 대한 고민도 필요해짐.

이런 종합적인 점들 때문에 STA를 쓴다고 이해하고 PrimeTime user guide를 보면 시작에 도움이 될 듯함.
  
PrimeTime이란, STA를 할 수 있는 Industry Golden standard EDA tool이다. Cadence에는 Tempus라는 Tool이 있고, 무료 EDA로 OpenSTA도 있다.

STA를 하기 위해 필요한 것(?) 사실 필수적인 파일이 있고.. 이 파일이 있어야 정확한 STA. 그러니까 Tape-out이 가능하고.. Sign-off가 가능한 파일이 있다.
1. Back Anotation File.
(1) SPEF(Standard Parasitic Exchange Format) : Net, Cell의 RC값 정보. (P&R 이후, RC Extraction step에서 한다. StarRC라는 Tool을 사용한다.)  
(2) SDF(Standard Delay Format) : PrimeTime으로 출력한다. PT로 SPEF를 읽으면 RC값을 Elmore delay 등으로 계산을 하는데, SDF에서는 delay 자체를 저장한다. SDF는 IEEE Standard이다.
e.g. IOPATH delay, INTERCONNECT delay, SETUP timing check, HOLD timing check. 날짜, 벤더, PVT조건 등..  들어있다.
![sdf_spef](/assets/img/spef_sdf.png)
https://en.wikipedia.org/wiki/Standard_Parasitic_Exchange_Format#*CONN_Section  

참고로, spef파일 내에 conn은 net와 pin의 연결정보, cap은 커패시턴스, res는 저항 값을 의미합니다.

2. Gate-level netlist : 합성 혹은 P&R 후에 나온 디자인 파일.
e.g. .v, .vhdl 같은건데, 사실 확장자 자체는 상관 없다.

4. Libraries(Technology Cells) : RTL에 사용된 셀에 대한 정보. 크기, 전력, 노이즈, 딜레이 등 정보들이 담겨있다. 이 파일은 IEEE Standard는 아니고, Synopsys가 만들고 공개한 규격임. 대부분이 이 규격을 그대로 사용한다. Liberty라고도 불리고, 압축 포맷은 주로 .db 형태로 저장한다. 이 파일은 TCAD, HSPICE, PrimeLib를 거쳐 만들어진다. 이 파일에 Delay, Power, Noise, Area, Function 등 다양한 정보들이 담겨있다. 이 Liberty에 대해 알고 시작해야 앞으로 Physical design 및 Physical Implementation에 쉬워질 것임.
e.g. cb13fs120_tsmc_max  
![library](/assets/img/library_file.png)

6. Design Constraints (Tcl로 작성된) : 설계 제약 조건  
e.g. create_clock, set_input_delay, set_output_delay  
+ 부수적으로 Script file. 없이도 할 수 있지만, 꼭 만들어서 하기를 권장한다. 실수를 줄이기 위해.

사실 UPF도 있고, 다양한 파일들이 있긴한데, 정말 꼭 필요한것들만 추려보면 위와 같다.
  
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

타이밍 체크에 필요한 개념(?)
Launch edge : FF1의 Active edge
Caputre edge : FF2의 Active edge
DRT : FF2가 FF1의 출력을 받기 위해서 도착해야하는 최대 시간
DAT : FF1의 출력이 FF2의 input에 도착하는데 걸리는 시간
Slack : Violation이 일어나지 않는 마진을 주로 이렇게 부르는데, Negative slack으로 특정해서 부르는게 좋음.
Setup time : active clock edge __이전에__ 데이터가 안정적으로 유지되어야할 최소 유지시간. Slack=DRT-DAT   있다.  
Hold time : active clock edge __이후에__ 데이터가 안정적으로 유지되어야할 최소 유지시간 Slack=DAT-DRT  
Slew, Transition : 데이터가 바뀌는데 걸리는 delay. 엄밀하게 말하면, 데이터가 10%에서 90%까지(혹은 20%에서 80%)까지 변화하는데 걸리는 시간  
Timing arc : input pin이 다른 핀의 데이터 변화에 영향을 끼치는데 걸리는 지연 시간  
Unate cell : 입력핀 하나만 바뀌어도 출력이 변하는 셀  

![report1](/assets/img/bps.jpeg)

STA라는게 사실 Timing 검증 뿐만 아니라, Power 검증, Noise 검증, Area 검증 등 다양한 Analysis를 할 수 있고, Chip Tapeout 설계 중간 단계와 마지막 단계.. Sign-off단계에 사용되기 때문에 매우 중요함.

Chip은 점점 미세화가 되고 있고, 공정 수율도 떨어지다보니, 여러가지 Variation을 고려해서 Chip 검증을 해야하며... 계속 timing과 power 개선된 Chip을 만들려면 좀 더 마진을 줄여나가며 검증 할 방법을 찾아야 함.
