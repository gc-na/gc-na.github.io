---
published: true
---
## Unate cell이란?

디지털 설계, 특히 설계 자동화 분야에서 중요한 Unate cell에 대해 알아보려고 합니다.

디지털 회로 설계는 사실 대부분의 작업이 Input code를 Output code로 만드는 Code2Code 작업입니다.

중요한 것은 컴퓨터에게 내가 무엇을 원하는지 알려주는 것에죠.

​

Unate Cell이란?

Unate cell은 "입력 값의 변화에 따른, 출력 값의 논리적인 특성"을 단순하게 표현하는 방법입니다.

Logic synthesis, Design For Testability, Automatic Test Pattern Generation EDA Tool을 만들 때 이것을 유용하게 사용합니다.

STA, DFT, DV 등 매우 다양하게요.

​

우선 Edge의 개념을 먼저 알아야 합니다.

아래 그림만 보셔도 아실 것 같은데, 0->1은 rising edge, 1->0은 falling edge입니다.

![0](/assets/img/223529720992/0.png)

![1](/assets/img/223529720992/1.png)

​

Unate cell에는 아래 같은 세가지 Unate cell이 있습니다.

Positive Unate cell: 입력 Edge와 출력 Edge가 동일하거나, 변화를 주지 않음

Negative Unate cell: 입력 Edge와 출력 Edge이 반대이거나, 변화를 주지 않음.

Non Unate cell: 입력Edge와 출력Edge과 동일한 경우도 있고, 반대로 되는 경우도 있어, Unate 특성을 갖지 않음.

​

Positive Unate를 예로 들기 위해,

예를들어 2-input AND Gate를 예로들어보면, 

![2](/assets/img/223529720992/2.png)

(1) A, B 둘 다 0일 때 출력은 0

(2) A가 0->1로 transition되어도 출력은 그대로 0

(3) A가 1인 상태에서, B도 0->1로 transition되면 출력은 0->1로 똑같이 입력 엣지 모양을 가져갑니다.

(4) 여기서 A가 1인상태에서 B가 1->0으로 transition되면 출력은 마찬가지로 1->0으로 똑같이 입력 모양을 따라가구요.

(5) B가 0인 상태에서 A도 1->0으로  가도, 출력은 그대로 0으로 유지됩니다.

Buffer, AND, OR 다 positive unate cell입니다.

​

Negative unate cell은 "입력 엣지의 반대로 가거나, 그대로 유지되는 논리 특성"입니다.

Inverter가 대표적인 Negative unte cell입니다. 입력의 반대 엣지로 출력이 나옵니다.

​

NAND Gate로 예를 간단히 보면,

![3](/assets/img/223529720992/3.png)

(1) A,B가 둘 다 1인 상태를 가정합니다. 출력은 0입니다.

(2) B가 1인 상태에서 A를 1->0으로 바꾸면, 출력은 0->1로, 입력 엣지의 반대로 출력 엣지가 나옵니다.

(3) A가 0인 상태에서 B를 1->0으로 바꿔도, 출력은 그대로 0으로 유지됩니다.

INVERTER, NAND, NOR 같은 회로가 대표적인 Negative unate cell입니다.

​

​

​

반면, XOR 게이트는 대표적인 non unate cell입니다

![4](/assets/img/223529720992/4.png)

간단히 봐도 그렇죠?

A=0, B=0에서 출력은 0

A는0이고, B만 0->1 스위칭하면 출력은 0->1

​

A=1이고, B=0에서 출력은 1

A=1이고, B만 0->1 스위칭하면 출력은 1->0

​

하나의 특성을 딱 갖지 않는 Cell입니다.

​

 해시태그 : 