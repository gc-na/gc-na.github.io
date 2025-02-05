---
published: true
---
## Glitch Power란?

Glitch라는 단어는 한국어로 작은 문제입니다. 근데 한국어로는 defect도 결함이고, fault도 결함이고, error도 결함이라, 이거 구분이 안 됩니다. 그냥 Glitch라고 외우시면 됩니다.

![0](/assets/img/223396147476/0.png)

Glitch는 Software에서도 부르고, Hardware에서도 부르는데,

저희가 볼 부분은 "반도체 설계"에서의 Glitch입니다.

​

Glitch란?

Glitch란 회로에서,

논리회로 설계 수준에서 보이지 않는 신호 전환이 실제 물리적인 환경에서 발생하는 것을 의미합니다.

주로 경로 내 신호 타이밍 불균형으로 Race Condition에 의해 발생합니다. 이러한 Glitch로 인해 소모되는 전력을 Glitch Power라고 합니다.

​

실제 반도체가 구동되는 물리적 환경에서는

- 전자기학적 원인들도 있고,

- 각각의 트랜지스터들에게는 각각에는 전기가 흐르는데  걸리는 필요한 시간이 있고, 배선의 길이가 완전히 똑같지 않다는 이유도 있고,

- 똑같은 장비에서 똑같은 Metal을 그려도, 어떤 Metal은 빠르고.. 어떤 Metal은 느린.. 이런 공정상 이슈들이 있습니다.

![1](/assets/img/223396147476/1.png)

위 그림을 보시면 이해가 가실텐데요.

OR Gate에 A와 A'라는 값이 항상 입력되게 되어있죠. 그러면 논리회로 세상에서는 항상 값이 1이 출력되어야 할 것 같지만,

실제 물리적 회로 세상에서는 Inverter를 구동하는데에 걸리는 시간이 걸리고... 결국 찰나의 시간동안 F에는 0이라는 값이 출력됩니다.

​

이렇게되면, 논리회로를 잘 설계했어도, 물리회로의 특성을 고려하지 않은 점 때문에 Chip이 정상작동하지 않을 것입니다.

​

위에서 본 예시는 Static Hazard라고 부르고, 아래 같은 회로에서 발생하는 것을 Dynamic hazard라고 부릅니다.

![2](/assets/img/223396147476/2.png)

아래처럼 전자기학적 원인으로, 실제적으로 선이 연결되어있지 않아도,

연결이 된 것처럼 만들어지는 가상의 "Coupling Cap" 때문에 시그널이 영향 받는 경우를 Crosstalk Glitch라고 부릅니다.

![3](/assets/img/223396147476/3.png)

​

Glitch Power란,

Glitch Power는 Glitch로 인해 소비되는 전력을 의미합니다.

Switching Power 혹은 Dynamic Power라고 불리는 전력 소모는, 아래 공식처럼 모델링 됩니다.

![4](/assets/img/223396147476/4.png)

Glitch가 회로 동작 자체에 영향을 주지 않더라도, Power소모에 영향을 줄 수 있게되는 것입니다.

특히 인공지능 반도체의 경우, 엄청나게 많은 조합회로들이 있는데, 이런것들이 다 Switching된다고 생각하면.. Power 소모가 너무 커서 IR Drop이나 EM Issue로 Chip 동작을 안 할 수도 있습니다.

​

그래서 이런 것들은 EDA Tool을 이용하여, Glitch에 대한 제약조건들을 선언하고, 어떤 Cell들이 Glitch에서 강인하고 약한지 알려주고, Glitch가 발생 할 수 있는 논리회로에는 Glitch에 강인한 Circuit을 선택하도록 하고, 회로 설계 마지막 단계에선 Glitch에 대한 분석까지 해야합니다.

​

Multiple Instance Modules (MIM)

![5](/assets/img/223396147476/5.png)

​

​

AI 반도체, 즉 인공지능 반도체는 보통 MIM형태로 설계합니다. 효율적인 연산로직을 하나 설계하고, 이걸 Modulization하여 TOP에서 여러개의 Module을 불러와서 사용하고, 실제 Software는 여러 Module을 통해 병렬적으로 연산되는 것을 보는 것이죠.

어쨌든, 모듈 아키텍처로 인해 엄청나게 많은 중복 회로들이 있습니다.

AI 알고리즘이 하드웨어에서 실행될 때 수행되는 엄청난 수의 연산으로 인해 글리치 전력은 전체 전력 소비 측면에서 중요한 고려 사항이 되었습니다. 글리치 Power가 전체 전력의 40%까지 영향을 줬다는 논문을 본 적 있습니다. 

​

그렇기 때문에 설계 주기 초기에, 이상적으로는 시스템 수준 또는 RTL 수준에서 글리치에 대해 가능한 최상의 마이크로 아키텍처를 파악하는 것이 매우 중요합니다.

왜냐하면, 일반적으로 BEOL과 FEOL까지 검증 할 수 있는 Post-Layout Gate Level Simulation 및  Full-Chip STA는 칩 설계 마지막에 진행되고, 엄청나게 긴 시간을 요구합니다.

​

ECO로 수술은 해볼 수 있겠으나, "인간적이지 않은 수준의 너무 많고 불규칙한 업무"가 됩니다.

수행하기에는 너무 늦습니다. 따라서 설계 주기 초기에 지연 인식 및 글리치 인식 벡터 생성과 함께 글리치 전력 분석 솔루션을 마련하는 것이 중요합니다. RTL Level에서는 Synopsys의 PrimePower로 Glitch 분석을 할 수 있습니다.

​

그리고 이상적으로 만들어진 Process Design Kit의 경우, 각 Standard Cell 및 Hard IP에 Glitch 정보가 포함되어있습니다. 어떤 Cell이 빠르지만 Glitch엔 약하고.. 이런 정보들이요.

 해시태그 : 