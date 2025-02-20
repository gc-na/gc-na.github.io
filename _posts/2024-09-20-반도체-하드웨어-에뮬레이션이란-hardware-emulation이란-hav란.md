---
published: true
---
## 반도체 하드웨어 에뮬레이션이란? Hardware Emulation이란? HAV란?

우선 에뮬레이션이라는 것이 무엇인지 간단히 보고 글을 시작하겠습니다.

![0](/assets/img/223390076920/0.png)

​

하드웨어 에뮬레이션이란?

![1](/assets/img/223390076920/1.png)

Hardware emulation은 HAV라고도 불리는데요. 회로 설계 분야에서 검증에 사용되는 기술입니다. 아직 실리콘으로 제조공정되지 않은 상태에서 엔지니어가 소프트웨어 기반 환경이나 에뮬레이터로 알려진 전용 하드웨어 플랫폼에서 "하드웨어 설계의 동작을 미리(?) 검증.. 그러니까 반도체 하드웨어를 에뮬레이션할 수 있게 해줍니다.

위 그림이 HAV를 가장 잘 설명했다고 봅니다.

​

이 디지털 논리회로의 설계 코드가 나중에 실리콘으로 나올때까지 너무 시간도 오래걸리고 비싸니까, 특수 하드웨어가 그 안에서 Chip이 있는것처럼 미리 돌아가 보는겁니다.

그러면 FPGA로 하면 되는거 아니냐?경우에 따라 FPGA로 해도 됩니다. 

- 근데 엄청나게 큰 작업을 해야한다

- 더 빨리 병렬적으로 결과를 보고싶다

- 셋업타임을 더 제한해서 결과를 보고싶다.

- 컴파일 / 디버그에 도움을 받고싶다... 이런 것들이 쌓이면 HAV로 가는거구요.

​

HAV 장비도 그렇고 EDA Tool도 그렇고 매우 비싸다보니, Mass Production 들어가는 큰 규모 Chip들이 주로 HAV에서 사용됩니다. 예를들어 엔비디아 Chip 시리즈들이요.

* 참고로 산업용 FPGA는 1억원이 넘는 것들도 많이 있는데, HAV장비는 15억원 넘는 것들도 많습니다.

​

​

![2](/assets/img/223390076920/2.png)

ref: SIEMENS EDAHAV의 전체 Verification에는 Simulation, Emulation, Virtual Prototyping, Unit Test, System-integirity test등이 있습니다.

설계의 기능을 최대한 모방하기 위해 소프트웨어 모델에 의존하는 기존 시뮬레이션과 달리, 하드웨어 에뮬레이션은 "특수한" 하드웨어를 활용하여 대상 하드웨어의 동작을 실시간에 가까운 속도로 에뮬레이션합니다.

​

아래는 10년 전, NVIDIA의 Emulation Lab입니다.

![3](/assets/img/223390076920/3.png)

​

그렇게 해서, 비용이 많이 드는 제작 및 생산 단계로 진행하기 전에.. "설계의 기능적 정확성, 타이밍 특성 및 전반적인 성능"을 미리 검증할 수 있는 정확하고 효율적인 방법론이라고 보시면 됩니다.

​

주로 많이 사용되는 Tool으로는 Synopsys의 Zebu, SIEMENS사의 Veloce, Cadence의 Palladium이 있습니다.

![4](/assets/img/223390076920/4.png)

​

 엔지니어는 RTL이나 다른 추상적인 레벨에서부터 하드웨어를 에뮬레이션함으로써, 실리콘에서 발생 할 수 있는  오류를 초기 단계부터 감지하고 디버깅하여 비용이 많이 드는 Silicon-respin 작업과 Tape-out 일정 지연의 위험을 최소화할 수 있으며, 미리 성능 및 파워도 예상할 수 있습니다.

​

예를들어, DFT Engineer들은 엄청나게 많은 회로 수정을 하고... 그들이 만든 회로 수정에서 Logical Equivalance Check를 Success하였다고 하더라도 의심은 남아있고,

Swithcing activity, IR-drop issue로 칩에 과부하가 올까봐 항상 걱정하죠.

이런 것들도 Hardware Emulation에서 어느정도 검출이 됩니다. UPF도 지원을 하구요.

​

​

HAV 부분이 계속 뜨고 있는 이유는 자율주행, AI 부분이 큰 것 같습니다.

![5](/assets/img/223390076920/5.png)

Emulation board Market shareSilicon-respin은 끔찍하고,

Silicon이 나오기 전에 이 회로에 대한 검증과 Proto-type은 해보고싶은데 FPGA로는 한계가 있으며,

요즘 나오는 VLSI / AI Chip 사이즈는 엄청나게 크고,

자율주행 등 사용되는 응용 분야가 매우 안전 규격이 까다로우며,

미세공정에서 Process variation도 커지고 비용도 커지니.... HAV 중요성은 계속 커지고 있습니다.

 해시태그 : 