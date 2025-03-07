---
published: true
---
## Retiming register란?

반도체 설계에서 가장 중요한 것은 PPA(Power, Performance, Area)와 경제성입니다.

Performance spec을 달성하려면 Path delay를 최소화해야합니다.

(1) 최적의 논리 회로 설계

(2) 물리적인 Cell, Routing Delay를 사용하는 PDK 사용

(3) 최적의 물리 회로 설계

(1)~(3)을 최적으로설계하는 것이 관건입니다.

여기서 최적의 물리회로란, 최소한의 Clock Period, 최고의 Clock Frequency를! 결국 Setup time 최적화를 해야하는겁니다.

​

Retiming이란?

Sequential cell의 한 쪽에 있는 Positive slack을 활용하여 다른 쪽의 Negative slack을 해결하는 기법이 Register Retiming 기법이라고 보시면됩니다.

Logic Synthesis, Physical Synthesis EDA Tool에서 사용 가능합니다. 물론 RTL Level에서도 가능이야 하겠지만, EDA 툴에서 자동으로 해줍니다.

​

![8](/assets/img/223513975129/8.png)

https://www.eetimes.com/how-to-use-register-retiming-to-optimize-your-fpga-designs/위 회로를 보면, 결국 Current top design에 대한 In/Out의 로직은 동일한데,

내부 로직에 대한 변화가 생기게 되는 것입니다.

EDA 툴의 알고리즘도 똑같습니다. Negative slack이랑 Positive slack 인접된 Cell 찾고, 이거 밀고 당기고..

​

Register를 밀고 당기는 과정을 Retiming이라고 보시면 됩니다.

​

Logical Equivalence Check를 할 때 이런 로직 변화가 생긴다는 것을 고려시켜줘야합니다.

그리고 DV입장에서도 이런것들은.. 기존에 RTL레벨에서 검증했던것과 차이가 생기기 때문에 체크 할 내용이 하나 더 생기게 되는 부분이구요.

 해시태그 : 