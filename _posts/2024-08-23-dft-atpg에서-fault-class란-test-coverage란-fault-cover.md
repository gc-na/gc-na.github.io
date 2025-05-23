---
published: true
---
## DFT ATPG에서 Fault class란? Test coverage란? Fault coverage란? 계산식

ATPG에서는 다양한 Fault들이 있습니다.

Fault 중에 일부는 Design 특성상 검증 될 수 없는 Fault도 있고, 직접적으론 검증이 되지 않으나 간접적으로 검증이 되는 Fault들도 있습니다.

​

참고로 이 글을 이해하시려면, DFT와 ATPG에 대한 글을 읽고 오셔야 이해가 됩니다!

![0](/assets/img/223350462437/0.png)

Coverage란?

DFT에서 Coverage를 쉽게 설명하면, 이 DFT 설계가 얼마나 많은 Fault를 찾아낼 수 있는가 입니다.

우리가 설계한 반도체들을 자율주행으로도 쓸거고, 의료용으로도 쓸거고 방산용으로도 쓸건데,

미세공정에서는 반도체 제조 공정 과정 사이에 엄청나게 다양한 이유들로 Fault들이 발생하죠.

​

라고 보시면 됩니다. 실제 양산 과제에서 Coverage를 도출하는 방법은 조금 더 복잡한 식으로 되어있습니다.

​

Chipmaker 입장에서는 이 Fault을 모두 찾아낼 목표로 설계하는게 목표라서, 80%, 85%, 90%, 98%, 99%, 99.5% 이런식으로 스펙을 정합니다.

Clock frequency만 스펙으로 정하는게 아니고, "이 Chip이 어느정도 Test 혹은 Fault Coverage를 갖고 모두 검증하는데 어느정도 시간이 필요한지"를 정하는 것도 필요합니다.

​

Coverage는 보통 Synopsys TestMAX 같은 ATPG용 EDA Tool로 출력 할 수 있습니다.

말씀드렸던 것처럼, Detect 될 수 있는 Fault, 못 검출하는 Fault 등이 있고.. 이 값들로써 Test coverage를 출력합니다.

여기서 Test coverage 도달을 못하면.. DRC 확인 정도 해보고.. Test point도 넣어보고.. 설계 수정도하고... 그러는거죠.

![1](/assets/img/223350462437/1.png)

Fault의 model에는 대표적으로 Stuck-at Fault, Transition Delay Fault, Bridge Fault 등이 있습니다. 이 글에서 자세히 다루진 않을겁니다.

​

그래서, Coverage에서는 두가지 컨셉이 나오는데요.

Fault Coverage와 Test Coverage입니다.

이 글의 핵심은 Coverage를 어떻게 계산하는가입니다.

​

그래서 계산식을 정말 간단히 간략하게 줄이면,

발견 할 수 있는 Fault(DT, Detected Fault)가 분자가 됩니다.

​

Fault Coverage란, DT/발생 할 수 있는 Fault 수

Test Coverage란, DT/테스트 할 수 있는 Fault 수

​

각 Fault model마다, 각 Foundary사마다, 각 Fabless사마다 각 목적에 따라 Target으로 하는 coverage 값이 다릅니다.

​

Fault Class란?

Fault들에 대한 분석을 잘 해보니, Undetectable Fault인줄 알았는데 간접적으로 Test 하는 방법들도 있고, 이런 알고리즘으로 만든 Fault들을 이용해서 더 실제적인 현대의 ATPG Coverage를 만들 수 있게 되었습니다.

결국 Coverage 공식에 몇개의 변수들이 추가됩니다.

이런 변수들을 Fault Class라고 부릅니다.

​

자세히 나타내면 이런 식인데, EDA Tool 회사마다 표기하는 명칭이 조금 다릅니다. Category정도는 똑같구요.

​

DT: Detected Fault

DS（detected by simulation)

DI（detected by implication

이거는 D-Algorithm처럼 ATPG Algorithm으로 찾아낼 수 있는 Fault들입니다.

​

사실 DT, PT, UD, AU, ND 정도 의미만 알고, 이것들이 왜 발생하는지, 어떻게 해결하는지 정도만 알아도 ATPG에 대해 대화하는 정도는 문제 없습니다.

​

아래 자료는 National Taiwan University의 강의인데, DFT 개념을 잡기 아주 좋은 강의라서 공유 드립니다.

https://www.youtube.com/watch?v=zfrb5rV63EA&ab_channel=%E6%9D%8E%E5%BB%BA%E6%A8%A1

[![7 4 Combinational ATPG, D-algorithm](https://i.ytimg.com/vi/zfrb5rV63EA/hqdefault.jpg)](https://www.youtube.com/watch?v=zfrb5rV63EA&ab_channel=%E6%9D%8E%E5%BB%BA%E6%A8%A1)

설명 : These course materials are from National Taiwan University

결론은 아래 공식처럼 Test / Fault Coverage를 출력 할 수 있습니다.

Test Coverage = { 𝐷𝑇 + (𝑃𝑇 ∗ 𝑝𝑜𝑠𝑑𝑒𝑡_𝑐𝑟𝑒𝑑𝑖𝑡) } / { 𝑎𝑙𝑙 𝑓𝑎𝑢𝑙𝑡𝑠 − (𝑈𝐷 + (𝐴𝑈 ∗ 𝑎𝑢_𝑐𝑟𝑒𝑑𝑖𝑡)) }

Fault Coverage = { 𝐷𝑇 + (𝑃𝑇 ∗ 𝑝𝑜𝑠𝑑𝑒𝑡_𝑐𝑟𝑒𝑑𝑖𝑡) } / { 𝑎𝑙𝑙 𝑓𝑎𝑢𝑙𝑡𝑠 }

​

​

 해시태그 : 