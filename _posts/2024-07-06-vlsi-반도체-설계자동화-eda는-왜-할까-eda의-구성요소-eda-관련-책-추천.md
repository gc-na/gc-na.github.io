---
published: true
---
## VLSI, 반도체, 설계자동화, EDA는 왜 할까? EDA의 구성요소 + EDA 관련 책 추천!

EDA(Electronic Design Automation)에 대해서 써보려고 합니다. 이 글에선 EDA를 왜 쓸까?에 대해서만 다루고, 앞으로 EDA 전반에 대해 다룰 예정입니다.

참고한 서적은 아래 서적입니다.

​

EDA는 말 그대로, "전자 설계 자동화"입니다.

![0](/assets/img/223247732451/0.png)

주로 위 책을 참고할거고~~ 내용이 없는 경우, 아래 책을 참고하고 있습니다.

![1](/assets/img/223247732451/1.png)

![2](/assets/img/223247732451/2.png)

​

전자 레벨에서 소프트웨어까지 단숨에 설명을 해보고, EDA에 대해 다시 알아보겠습니다.

​

반도체는 Band & Bond Theory.. 여러가지 물리/화학적 이유로 "전자기학적 현상"이 발생하는데요.

전자기학적 현상 중 "스위치와 증폭"기능이 있기 때문에.. 반도체를 사용합니다. (나무로 만든 트랜지스터도 있고, 여러가지 소재로 만든 트랜지스터가 있는데, 현대에 인간이 만든 트랜지스터 중 가장 가성비가 뛰어난 것은 실리콘으로 만든 반도체입니다.)

![3](/assets/img/223247732451/3.png)

![4](/assets/img/223247732451/4.png)

과학자들이 전자기학적 요소를 발견했습니다.

이것을 소자화한게 FET이라고 불리는 트랜지스터들입니다.

​

Input signal의 제어에 따라, Output signal이 정해지는 소자입니다.

이 소자는 트랜지스터라고 불리고, 가장 널리 쓰이는 트랜지스터는 MOSFET입니다.

![5](/assets/img/223247732451/5.png)

사람이 하는 대부분의 로직 설계는,

"A 혹은 B가 1이면 Out은 1이 나오도록 설계" (OR Gate)

"A, B가 1일 때 Out은 1이 나오도록 설계." (AND Gate)

이런 설계입니다. 이런 기본적인 회로 소자들을 Gate고 불립니다.

​

![6](/assets/img/223247732451/6.png)

​

Foundry에서는 주로 이 Gate를 기준으로 Fabless 고객들에게 "설계시 확인해야하는 Device parameter들이 담긴 Design Kit"전달을 합니다.

Foundry의 경쟁력 중 하나가, "얼마나 다양성이 있는 DK를 전달하는가"입니다.

​

속도가 아주 빠르지만, Power 소모도 아주 큰 AND Gate

속도가 빠르지만, Power 소모도 큰 AND Gate

속도가 중간이고, Power 소모도 중간인 AND Gate

...

이런식으로, 하나의 논리소자도 다양한 parameter를 가진 각각의 Gate로 만들어서 Design Kit에 넣어줘야... 설계자의 선택 폭이 넓어지죠.

![7](/assets/img/223247732451/7.png)

​

팹리스로 넘어와서,

디지털 설계의 본격적인 시작은 아래처럼 HDL, Verilog라고 불리는 RTL 설계를 합니다.

![8](/assets/img/223247732451/8.png)

과목 중 "디지털 논리 회로 설계"라는 과목이 있는 것처럼,

정말 "논리 수준에서 설계"입니다.

실제 반도체 칩은 아까 얘기했던 것처럼

1)다양한 종류의 AND Gate가 있고,

2)크기도 다르며, 실제적인 위치 배치도 해줘야 합니다.

-> 2010년 이후 나오는 반도체 칩들은 한 칩에 수백억개의 Transistor가 있습니다. 이거 사람이 일일이 골라주고, 배치하지 않아요

-> 그리고 반도체 회로가 간단하면, 검증도 사람이 진리표와 파형도 그리겠지만, 현대의 반도체는 너무 복잡하죠.

​

설계도, 검증도... 트랜지스터 하나 단위로 보면 별거 아닌데, 너무 규모가 커져서 어렵다는게 문제입니다.

그래서 EDA라는 방법론을 통해 문제를 Dynamic Programming 혹은 Divide & Conquer 하는거죠.

​

앞으로 볼 EDA 내용은 아래 순서를 따를 예정입니다. 그런데 바로 Synthesis로 들어갈 것은 아니고, 소프트웨어+수학적인 이야기를 먼저 할 예정입니다.

![9](/assets/img/223247732451/9.png)

​

Computer science + Digital engineering + Mathematics + VLSI Knowledge = EDA.

EDA는 대규모화된 회로를 효율적으로 설계/검증하기 위해 쓴다. 이 정도만 기억해두시면 됩니다.

​

 해시태그 : 