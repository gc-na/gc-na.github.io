---
published: true
---
## EDA Tool(Synthesis, Place and Route)은 어떤식으로 회로 설계 최적화(Optimization)을 할까? 양산을 위한 반도체 설계

양산을 하려면, ASIC이라는 반도체를 만들어야 합니다.

설계회사에서 RTL이라는 파일로 시작해서 GDS라는 파일로 끝납니다. 이 과정을 RTL2GDS라고 합니다.

이 GDS를 공장에 전달하면, 공장은 Design Rule Check를 하고, 마스크를 만듭니다. 설계회사들은 이 마무리 단계를 Tape out이라고 합니다.

​

ASIC Flow는 Architecture Design -> RTL Design -> Logic Synthesis ->  Place & Route -> Signoff 이런식으로 진행을 합니다.

최적화되지 않은 아키텍쳐 설계로 기능 동작만 구현하고, Logic synthesis와 Place & Route를 해봤자 Signoff를 넘어갈 수 없습니다.

![0](/assets/img/223291201073/0.png)

EDA Tool은 그냥 RTL Code를 GDS Code로 바꿔주는 Code2Code Tool일 뿐입니다.

1) RTL 디자인이 Physical에 대한 고려가 안 되어있으면

2) 공정 라이브러리의 Variation이 너무 크면

3) SDC와 UPF 설계가 잘못 되어있으면

4) EDA Tool Script를 잘못 줬으면"

​

> 쓰레기 Input을 넣으면, 정제된 쓰레기가 output으로 나오는거에요.

출처 : No Site

​

EDA Tool이 안 좋으면, 최고의 code를 넣어도 좀 덜 정제된 code가 나오는거구요.

EDA Tool optimization bug는 정말 드물어요. 지금까지 전세계의 디지털 Chip 대부분이 Design compiler로 구현되었습니다. 엄청나게 영리한 툴은 아니지만, 다양한 문제를 많이 고려한 툴입니다.

![1](/assets/img/223291201073/1.png)

군맹무상어지간한 문제는 "1~4 중에 하나이고, 각 전문가들이 1~4번에 각각 분담해서 분석하고, 어떤 세부문제가 있는지" 파악하면 끝납니다.

그래서 전문가가 중요하고, 이 반도체 설계 업계에서 경력에 대한 대우가 좋고, 양산 칩 경력자들이 고연봉을 받는 이유입니다.

​

칩 양산을 할거라면, 아키텍쳐 설계, RTL2GDS, SW 온보딩까지 모든 과정을 경험해보는게 좋고,

최소한 EDA Tool회사에서 제공하는 "Verilog coding style"에 대한 교육부터, EDA Tool에 대한 교육을 다 받아보는 것이 좋습니다.

이 교육은 IDEC과 Tool vendor가 협업하여, 대한민국 국민이라면 무료로 제공하구요.

​

아무튼! 제가 드리고싶은 말씀은, EDA Tool에서 결과가 안 좋게 나왔다? "1~4중에 무엇이 문제인지를 보면 된다."입니다.

​

제가 이 글에서 소개하는 방법은 여러분이 것을 해야한다~ 이런게 아니라, (여러분들은 변수 몇 개만 선언하면 복잡한 optimization 과정이 자동으로 수행됩니다.)

EDA Tool이 Optimization을 어떤식으로 수행하는지! 입니다.

​

Optimization methods

저는 학부 때부터 Synopsys Tool로 Compile과 P&R을 해봤고, 업계에서 가장 높은 점유율을 가진 Tool이고.. 가장 기본은 Design Compiler(이하 DC)니까, DC를 기준으로 설명하겠습니다. 오랜만에 학교와 synopsys에서 받은 Student guide 책을 펴네요.

​

제가 볼 것은, 모든 EDA Tool이 전부 다 갖고 있고, 교과서에서도 나오는 기본적인 Optmiziation 기법입니다.

​

얘기했던것처럼, EDA Tool은 Code2Code Tool입니다.

Verilog RTL Code를 여러분들이 주신 Variables, attributes and constraints와 Foundry technology file을 갖고, "technology-specific circuit code"로 바꿔주는 것이에요.

DC를 좀 더 자세히 보면, Translation, Mapping and Optimization이라는 부분이 있고, 이 글은 Optimization 위주로 볼 생각입니다.

![2](/assets/img/223291201073/2.png)

DC의 guide를 보면 가장 먼저 등장하는게, "cost function"을 기준으로 최적화 알고리즘을 만들었다고 되어있습니다.

​

1. Cost function = Design Rule Constraints + Optimization constraints

- DRC의 우선순위가 가장 높습니다. (Transition, Fanout, Capacitance)의 우선 순위가 더 높습니다. 자세한건, 제가 이전에 쓴 Liberty 관련 글에 대해 보시면 됩니다. Design Rule Violation이 있으면 Foundry가 보증을 안 해줍니다! 칩 공정 자체를 거부 할 수도 있습니다.

- 한 컴포넌트의 Cost를 줄이면서 더 중요한 Cost를 증가시키면 적용하지 않고, 한 컴포넌트의 비용을 줄이면서 전체 컴포넌트의 비용을 줄이면 적용을 합니다.

​

2. Adder라고 하더라도, RCA로 설계하냐 CSA로 설계하냐에 따라 PPA가 달라지니, 이 Trade-off가 있겠죠?

기본적으로는 Delay -> Area -> Power 순서로 Optimization 합니다.

![3](/assets/img/223291201073/3.png)

![4](/assets/img/223291201073/4.png)

DC의 compile에서는 맨 처음에 Logic optimization을 한다고 했는데,

RTL Code를 analyze & elaborate하여 GTECH Level로 만들고(Translation), Technology mapping을 하기 전에 Boolean level에서 DC가 Optimization을 진행합니다.

![5](/assets/img/223291201073/5.png)

그러고 나서, Foundry가 제공한 Technology file(대부분 Liberty라는 Library 파일)을 갖고 PPA를 고려해서 어떤 ref_name의 cell을 사용하여 Optimization 할건지 결정합니다.

![6](/assets/img/223291201073/6.png)

이제 Gate-Level-Neltist가 되었습니다.

​

기본적은 Optimization은 여기까지 했고, 이제 Gate-level에서 어떤식으로 Optimization을 하는지 살펴보겠습니다.

중요한점은, 여기 있는 Step들이 자동으로 알아서 뚝딱 진행되는게 아닙니다.

여러분들이 EDA Tool script에 Variable, attribute, constraints를 주셔야합니다

![7](/assets/img/223291201073/7.png)

​

​

Automatic Area Ungrouping

![8](/assets/img/223291201073/8.png)

RTL 설계 할 때 module별로 각각 설계를 하고, Top에서 compile을 합니다.

DC도 기본적으로 이 module boundary를 유지를 합니다. 근데 만약에 ungroup option을 true로 해주면,

TOP에서 봤을 때 optimization 가능한 부분이 있을 경우 module hierarchy 경계를 제거하고, glue logic들을 merge합니다.

-> 근데 이 과정에 Cell 이름도 바뀌다보니까, SDC 재사용도 어렵고, Debugging 할 때 이 Cell이 왜 들어간건지? 내가 만든 Cell은 어디로 붙었는지? 찾기가 좀 까다로워집니다.

​

High-level Optimization Datapath Optimization

ALU나 Adder의 경우 사이즈가 엄청 큰데, 이게 엄청 많이 사용 되는 경우 Area와 Power 부담이 있을겁니다.

어떻게해야 Resource sharing/depending을 할 것인지?? 이런 것들입니다.

FSM 만들 때 case문을 사용할텐데, case문 내에 각 State마다 덧셈, 곱셈 마구 사용하면 진짜 엄청나게 큰 FSM이 나오게 되고, 이게 Verification level에선 검증이 안 되다가 Physical Design level에서 문제가 됩니다.

​

이런 설계를 애초에 안 하는게 좋지만, 해야하면 Sharing을 해야하니까 이런 method를 만들어둔겁니다.

​

​

Multiplexer Optimization and Mapping

MUX Tree 구조로 할건지? 아니면 하나의 Multiplexer로 할건지?

![9](/assets/img/223291201073/9.png)

![10](/assets/img/223291201073/10.png)

Finite state machine optimization

FSM의 State 최적화를 해줍니다. 필요 없는 State는 제거 할 수도 있구요.

​

Sequential Mapping

DC의 Designware로 mapping을 하면, RTL code의 Sequential cell은 SEQGEN으로 mapping됩니다.

이 과정에 최대공약수 등을 고려해서, datapath optimization을 진행합니다.

​

Auto-uniquification

RTL Code에서 하나만 만든 Datapath이더라도, 이 Datapath가 엄청나게 많은 곳에 쓰인다면.. 문제가 생깁니다.

Logic level에서는 Timing에 대한 고려를 안 하지만, Physical Level에선 output load 값을 고려해야하고,

Load가 많아진다면 이 근방에 Place 할 수 있는 자리가 없어진다는겁니다. 그렇게되면 Routing Congestion 때문에 SI 이슈도 발생하구요.

​

그래서 DC가 data path를 cloning해서 각 load에 넣어주는 방법입니다.

​

Implement Synthetic

Verilog에는 HDL operators라고 불리는 +, * 같은 산술연산문이 있죠. 이런것들은 DC가 PPA optimization 고려해서 Liberty에 어떤 ref_name의 cell로 mapping할건지 결정합니다.

​

여기까지가 DC에서 기본적으로 진행하는 Optimization들입니다.

여기서 어떤 것들이 "Timing critical path"인지 여기서 function을 계산해보고 다음 단계로 넘어갑니다.

​

지금까지는 1st compile 동안 Logic 위주로 Timing optimization을 했습니다.

이제 Timing Result를 기준으로 Optimization을 진행합니다.

Timing-deiven Combinational Optimization

여기서부터 다양한 기법들이 있고, 몇가지만 더 소개해보겠습니다.

​

Retime

![11](/assets/img/223291201073/11.png)

위 그림 같은 개념입니다. Timing Result를 기준으로, combinational cell을 Sequential cell 앞뒤를 오가면서 넣어주는거죠.

​

만약에, retime을 이상적으로 constriants를 줄 수 있다고 하면, combiantional cell 뭉치를 앞에 두고, 뒷단에 pipeline 뭉치 register를 넣어주면.

DC가 알아서 Pipeline register 사이 사이에 combinational cell들을 넣어줄 수도 있습니다.

근데 이상적으로 cosntraints 주기가 매우 어렵고, 차라리 RTL Level에서 Pipeline 잘 만드는게 더 쉽기 때문에 이렇게는 안합니다.

​

그리고 Logical Equivalance Check에서 Logic cone이 Register의 input pin이라서... 고려해줘야하는 사항이 더 생기는 문제도 있습니다.

​

Delay optimization & Critical Path Resynthesis

이러고 나서도 Timing violation이 남아있는 경우, 그부분에 대해 RTL Level부터 다시 합성을 진행하며 최적의 케이스를 찾습니다.

​

Boundary optimization

![12](/assets/img/223291201073/12.png)

​

Remove output floating registers

​

​

Shift register에 대한 SCAN Insertion 방지

![13](/assets/img/223291201073/13.png)

​

​

upsizing load isolation splitting

![14](/assets/img/223291201073/14.png)

Size 큰 Cell이 일반적으로 output transition 값이 작기 때문에,

(Fanin이 적고 fanout이 많은경우 좋음. 왜냐하면 사이즈가 커지면 Cell의 capacitance 값도 커지게되고, 그러면 이 Cell의 앞단 cell이 볼 때는 Load capacitance 값이 커짐. 그래서 fanin이 많거나, fanout이 적은경우에는 위 방법을 비추천함.)

​

split과 load isolation도 비슷한 방법으로 DRC Fix + Timing Fix를 합니다.

​

 해시태그 : 