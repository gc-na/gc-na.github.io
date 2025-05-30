---
published: true
---
## [자동차반도체, Automotive] ISO 26262와 ASIL란? (Automotive Safety Integrity Level)

2010년~2020년까지의 반도체가 가장 많이 사용된 응용 분야는 "모바일"기기입니다. 세계에서 가장 큰 시가총액을 가진 기업도 Apple이고, iPhone에 납품되는 반도체도 엄청나게 많습니다.

​

다음으로 주목되는 응용분야는 "오토모티브(Automotive)"라고 불리는 자동차 시장입니다.

자율주행을 중심으로 엄청나게 복잡한 자동차 전자장치가 예상됩니다.

​

특히, 운전자가 없는 무인택시가 예상이 됩니다.

![2](/assets/img/223313878255/2.png)

1) 사람들이 자동차에서 운전을 할 필요가 없으니, 이 시간 동안 "일하고, 쉬고, 놀 것"입니다.

2) 무인택시는 인건비가 필요 없고, 하루 종일 스스로 일 할 것입니다.

그렇다는 말은, 택시비가 엄청나게 저렴해지겠죠.

​

-> 그런데, 자동차의 동작 환경은 매우 추울 수도, 매우 뜨거울 수도, 매우 오랫동안 운행 할 수도 있습니다. 공장에서 출고 할 때는 멀쩡했던 반도체가 사용자에게서 사용 되는 과정 중 결함이 발생한다면??????

> 자율주행은 사람의 목숨을 쥐락펴락 할 수 있는데, 어떤식으로 반도체 기능 검증 할 것인가?

출처 : No Site

이게 Automotive 반도체와 기존 반도체들과 큰 차이점 중 하나라고 보시면 됩니다.

​

![3](/assets/img/223313878255/3.png)

ISO 26262란, 자동차 전장 산업에서 가장 중심이 되는 위험성평가 표준은 ISO 26262입니다.

ISO 26262는 자동차에 탑재되는 전자 시스템의 오류로 인한 사고방지를 위해 ISO에서 제정한 자동차 기능 안전 국제 규격입니다.

DFT에서는 ISO 26262에서 ASIL에 중점을 맞추는데요. 

자동차 산업 제품의 안전을 보장하는 프로세스를 정의하는 표준입니다.

![4](/assets/img/223313878255/4.png)

​

ISO 26262는 비슷비슷한 용어가 많은데(Fault, Error, Failure), 한국어로는 같은 단어이지만 영어로는 위험도의 크기가 좀 다릅니다.

그래서, 일단 이 Vocabulary먼저 보시는게 좋을 것 같습니다. 자주 나오는 단어 중 하나인 H&R은 Harzardous & Risk입니다.

![5](/assets/img/223313878255/5.png)

ASIL란,

ASIL(자동차 안전 무결성 수준)은 ISO 26262에서 정의한 위험 분류 시스템입니다. 

ASIL 위험성평가는 Severity, Probability of Exposure, Controllability로 구성됩니다.

![6](/assets/img/223313878255/6.png)

숫자가 높을 수록 심각도/제어난이도가 높습니다.

이 심각도, 제어난이도를 표로 도식화 해서 아래처럼 나타냅니다.

![7](/assets/img/223313878255/7.png)

이걸 갖고 ASIL-A, ASIL-B ASIL-C, ASIL-D 이런식으로 나타냅니다. ASIL-D가 가장 위험하면서 제어난이도도 높은 큰 약점이 될 수 있는 부분입니다.

레벨은 A~D까지 있고, 가장 높은 레벨은 D입니다.

![8](/assets/img/223313878255/8.png)

​

Key-on: 자동차 켤 때 반도체 시스템 결함 테스팅

Runtime: 자동차 운전 도중에 반도체 시스템 결함 테스팅

Key-off: 자동차 끌 때 반도체 시스템 결함 테스팅

​

쓸게 더 많지만, 일단 ISO26262, ASIL만 보려했으니 여기까지만~~

 해시태그 : 