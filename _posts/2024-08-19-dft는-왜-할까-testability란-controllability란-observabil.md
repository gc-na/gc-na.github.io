---
published: true
---
## DFT는 왜 할까? Testability란? Controllability란? Observability란?

VLSI에서 불리는 DFT는 Design For Testability입니다.

​

제조된 칩의 테스트를 효율적으로 하기 위해 회로 설계 분야에서 사용되는 일련의 기술 및 방법론입니다.

![0](/assets/img/223325810928/0.png)

이름처럼, design for.. TESTABILITY입니다!!

​

Chip Test란?

1. 칩 공정을 하면

2. 아래 같은 ATE 장비에 각 Chip의 Input port, output port 연결하고

3. Input 값들을 넣었을 때 설계적으로 의도했던 Output 값이 나왔는지? 안 나왔는지를 비교해서 Chip의 Pass/Fail을 걸러내는 겁니다.

![1](/assets/img/223325810928/1.png)

여기서 보는건 "칩 공정 중 발생한 결함이 있어 칩이 Fail"인 것인지?를 보는겁니다. 설계 이슈가 아니라, 공정에서 발생한 결함이 있는지요!

​

​

DFT를 안 한다면?

그냥 Logic 설계를 하고,

칩 공정 후, 이 칩을 실제 Software onboarding도 하고~ 거기서 프로그램도 돌려보면서 Chip을 테스트 할 수 있어요.

그러나, 몇가지 문제가 생깁니다.

Function test vector: 실제 Application 동작과 동일한 I/O Vector를 ATE 장비에 입력

Function test vector라는 것 크기가 엄청나게 크기 때문에, 이거를 서버향이나 AI향 반도체에 사용하면 하루 종일 테스트해도, 칩 하나 테스트를 못 할 수도 있어요. 그러면 칩 가격적인 문제가 발생합니다.

Function test vector로 정말 Chip의 모든 부분을 검사 했을까? Application이 바뀌고 Vector가 바뀌어도 과연 이 Chip이 통과가 될까? 

위와 같은 문제들이 생기니, Testability를 높여야한다는 겁니다. (UVM에서 얘기하는 Function coverage와 다름.)

​

칩 내부에 있는 각 단위소자(아직은 주로 Gate Level)를 직접 Control 할 수 있게하고, Observe 할 수 있게 만드는게 DFT라고 보시면 됩니다.

- Summary.1: DFT를 왜 하냐? Testability를 높이려고 + 미세공정에서 점점 더 수율이 떨어지니, 이를 검증 할 수 있어야 하니까.

- Summary.2: Testability라는게 뭐냐? 각 단위 소자에 대해 "내가 원하는 값을 넣을 수 있는지, Controlability"와 "내가 원하는 내부 소자의 값을 측정 할 수 있는지 Observability"입니다.

- Summary.3: 주로 평가지표는 Test coverage입니다. DFT로 칩을 어느정도 검증 할 수 있는지? 이게 핵심입니다. DFT를 했고, Chip testing에서도 Pass를 했어도, Test coverage가 낮으면... 이 Pass된 Chip을 신뢰 할 수 없어요.

![2](/assets/img/223325810928/2.png)

Test Coverage가 문제면, Test mode에서 IO 값을 Muxing하고, 칩 밖으로 빼면 끝이잖아?? 이런 관점으로 접근하면 Logical하게는 맞는데,

Physical 상으로 문제가 됩니다.

1) Chip PAD 수도 늘어나고,

2) Routing Congestion도 커지고,

3) Muxing하면서 Chip size도 커지고,

이러다보면 Performance issue, Power issue, Area issue들이 발생하죠.

그래서 잘못된 DFT를 하면, 배꼽이 배만큼 커질 수 있습니다.

​

또, Test vector의 크기도 중요합니다. 빨리 Chip test를 해야 Packaging도 얼른 할 수 있구요. 그래야 양산 가능하고.

​

근데 여기까지 왔는데도, 아직 이해가 안 될 수 있으니.. Test Point에 대해서 보겠습니다.

Test Point Insertion

Test Point Insertion은 Chip의 Test coverage를 높일 수 있는 방법론 중 하나인데요.

​

이해를 위해 예시를 들어보겠습니다.

가정1. 아래 같은 OR Gate가 있다.

가정2. A input에는 항상 1이라는 값이 나온다.

![3](/assets/img/223325810928/3.png)

설계적으로는 항상 out이 값은 1이 되겠죠? -> 사용자가 out 값을 0, 1 모든 value를 만들 수 없으니 Uncontrollable한 것이고,

그러면, B의 값이 0인지? 1인지? 이런걸 관측 수 없습니다. -> 이 부분이 그러면 Unobservable한 것입니다.

결론적으로, 칩 공정 결함으로 이 OR Input pin에 항상 0이 입력되도록 설계가 되었더라도, 이 부분은 테스트벡터상에서 만들 수 없기 때문에, 검증 할 수 없게 되는거죠.

​

그러면 어떻게 하냐? 어쩔 수 없어요. Muxing이나, AND, NAND같은 Test Point를 위한 로직을 추가로 넣어야 합니다.

이런 Gate level 소자 같은 경우에는 output에 Muxing을 하거나, NAND, AND Gate를 추가로 달아주거나.. 하는거죠.

SRAM이나 Hard IP 같은 경우엔 아래처럼 Shadow logic, Shadow wrapper들을 넣는거구요.

![4](/assets/img/223325810928/4.png)

​

​

EDA Tool이 많이 발전함에 따라, 대부분의 DFT에선 DFT Engineer들이 TCL Scripting을 바탕으로 설계할 뿐, HDL을 직접 설계 할 필요는 없습니다. DRC도 TP도 많은 부분이 Autofix 되도록 툴을 만들었으니까요.

​

EDA Tool은 주로 Synopsys의 DFT 관련 Tool 혹은 SIEMENS의 Tessent tool들이 유명합니다.

시장은 Synopsys가 아직 크긴한데, SIEMENS에서 AE 지원도 아주 많고.. Testing에 큰 투자를 하다보니, DFT Tool은 지멘스의 선호도가 매우 높습니다. Automotive, HPC 등 시장에서 마켓쉐어를 높여오고 있습니다.

​

Synopsys는 설계 IP 시장이 1위이고, 이 DFT를 오래 해왔고, Synthesis tool에서도 1위 점유율이니,

이 Synopsys 설계 IP들은 Synopsys Tool로 DFT 하면 결과가 비교적 쉽게 잘 나옵니다. 근데 SIEMENS DFT Tool으로 Synopsys IP를 DFT를 하면,  Coverage 도달을 위해 Manually 수정해줘야 할 부분이 많을 수도 있습니다.

​

이후 포스팅에서 각 회사의 DFT 관련 툴에 대해 더 살펴보겠습니다.

 해시태그 : 