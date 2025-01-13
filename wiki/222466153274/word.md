## ASIC 반도체 설계 순서 ASIC design flow ASIC半导体设计时序流程

ASIC 반도체 설계 흐름은 크게 아래와 같이 구성됩니다.

견적서 제공 -> 기능 설계 -> 검증 -> 배선 배치 -> 공정회사로..

​

좀 더 자세하게 들어가면,

​

1. 시장조사, 설계 사양 설정 Specification

2. 어떤 논리식으로 구성할 것인지 설정 Architecture Design

- High level - 모듈간의 Interface 정의. BUS를 어떻게 연결할건지, 어떤 Protocol을 사용할 것인지 정의

- Low level - Specification에 대해 어떤 로직을 어떻게해서 쓸지 정의. 

3. 이 논리식을 하드웨어 언어로 코딩 및 검증 RTL Coding & Verification

- 회로에 가장 큰 영향을 끼치는 구간. 위 과정에서 만든 문서를 통해 RTL Coding을 함. Verilog HDL이나 VHDL이라는 하드웨어 언어 사용. 

- 고전적 RTL Synthesis 대신에, High Level Synthesis를 하면 칩 설계를 빨리 할 수 있으나, 고전 방법이 칩의 결과가 더 좋음.

4. HDL언어를 논리소자(Gate) 수준(Gate level netlist) 합성. Synthesis

- Synthesis의 과정은 하드웨어 언어를 하드웨어로 번역(Translation), 회로를 그리고 Mapping, 최적화 Optimization 하는 과정이다. 

6. 기능 검증을 할 수 있도록 임의의 입력값 생성 ATPG(Automatic Test Pattern Generator), 테스트용 회로를 설계해서 검증 DFT(Design For Testability)

- 오류값이 논리에 영향을 주면, 논리 결함(Logic Fault). 지연시간이나 작동시간에 영향을 주면 물리적 결함(physical Fault).

7. 제 때 잘 입출력이 잘 되는지 검증하는 정적 시간 검증 STA(Static Timing Analysis)

- 회로에 제 때 입출력이 안되면 원하는 출력이 안 나옴. 나중에 Violation에 대해 따로 다루겠습니다.

8. 구현기능이 설계 기능과 같은지 검증. 동등성 검사(Equivilant check) Formal Verification

여기까지가 설계 회사에서 Physical Implemetaion Team PI팀의 업무입니다.

아래부턴 설계 회사의 Physical Design PD팀 혹은 Design House의 업무입니다.

PD팀은 PI팀에서 온 디자인 세팅작업을 합니다. (Setup)

Setup에는 NDM(New Data Model), tlu(메탈의 저항, 커패시턴스 값), tech file(디자인에 대한 기술문), DK(Design Kit, 설계의 형태)

9. 배치 계획 Floor plan

- 기본 회로(Standard Cell)은 자동 배치되지만, 직접 만들거나 타 회사에서 IP(Intelectual property)로 사온 셀은 수동으로 배치해야 합니다. 이 수동으로 배치해야하는 셀은 Macro Cell이라고 부르는데, 배치 배선까지 다 된 매크로는 하드 매크로(Hard Macro)이고 RTL만 작성된 매크로는 소프트매크로(Soft Macro)라고 부릅니다.

10. 입력 전압을 어떻게 넣어줄지 설정. Power plan

- tlu파일에서 메탈의 저항, 커패시턴스 값을 확인하여 Ring과 Strap에 적용시킵니다.

배치 배선을 Place & Route (P&R)이라고 부릅니다.

11. 배치 Place

- 셀들을 배치 배선합니다. 여기서 MTTV(Max TransiTion Violations, 한 로직에서 다른 로직으로 전송하는 경우에 기준 시간을 초과하는 것)을 주의해야합니다. 또, NDR(Non Default Rules)를 지키며 최적화를 작업을 합니다.

12. CTS(Clock Tree Synthesis)

- 입력동기신호(Clock)을 각 로직 단에 보내면, 다 신호를 받는 시간이 다른데, 이 안에 Buffer(지연기능하는 소자)를 넣어 속도 균형을 맞춰줌.

13. Psyn

- 다시 최적화 작업을 합니다. 여기서 90%를 초과해서 입력하면 필수적인 셀들을 제거할 수도 있습니다.

14. NDR(Non Defualt Rules)를 고려하며 배선. Route

15. 마지막 검증. Sign off verification

- 회로 단락(Short), Transition time(값이 바뀌는데 걸리는 시간)등을 확인.

​

​

FPGA도 설계는 ASIC 설계보다 검증이 적습니다. 대량 생산을하고 수정이 불가능한 ASIC의 설계 검증이 더 복잡합니다.

 해시태그 : 