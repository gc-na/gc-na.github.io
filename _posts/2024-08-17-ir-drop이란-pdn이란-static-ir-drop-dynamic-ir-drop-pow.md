---
published: true
---
## IR Drop이란? PDN이란? Static IR Drop, Dynamic IR Drop, Power Integrity

반도체 Chip의 Power supply는 회로  전체에 Power domain(VDD와 VSS. 그러니까 High signal과 Low signal) metal layer(Vdd 및 Vss)를 통해 균일하게 분산되어 있습니다.

​

디지털 회로에서 인버터는 아래처럼 나타냅니다. 이 인버터를 디지털 엔지니어들이 조합해서 Chip 설계를 합니다.

![0](/assets/img/223322494576/0.png)

![1](/assets/img/223322494576/1.png)

이 인버터는 공정 회사에서 아날로그 엔지니어들이 설계 및 제조를 합니다.

인버터의 설계는 아래처럼 그립니다. 이 인버터에 Power supplier (VDD, VSS)의 Port가 있죠.

![2](/assets/img/223322494576/2.png)

다시 Chip 설계로 돌아와서, 디지털 칩 설계에서도, Chip 설계에서 Power plan이라는 단계가 있습니다.

여기서부터 패드, 링, 스트랩, 레일, 매쉬 깔고. 이걸 PDN (Power Distributed Network)라고 부릅니다.

​

![3](/assets/img/223322494576/3.png)

이 시그널들을 각 인버터 등 Cell들에 연결을 해주는거죠.

​

간단한 회로를 그려보면,

![4](/assets/img/223322494576/4.png)

1) 위 그림에선 인버터가 마지막 Power supplier가 있는 쪽입니다.

2) Metal layer에는 저항이 있습니다.

3) 이 메탈 레이어가 매우 길다면, 저항은 매우 크겠고, 그러면 이쪽 흐르는 전압이 낮아지겠죠?

출력부 전압을 구해보면, V_out = VDD - I*R일겁니다. R이 매우 크다면, V_out은 0입니다. 간단하죠?

->

(1) 디지털 회로 설계 할 때 1이라는 값이 나오도록 Logically design 했는데, Physical power issue로 인해 Metal layer가 너무 길어졌고... 그렇게 되면 실제 출력은 0이라는 값이 출력 될 수 있습니다.

​

두번째 경우로, 전압이 High signal이긴하지만, 비교적 낮은 전압으로 떨어졌다고 합시다.

(2) 그리고 위 그림의 Output port 다음에 다른 Combinational cell으로 연결된다고 합시다. Voltage가 낮으면, Flip flop에서 High signal로 인식 할 수 있는 voltage까지 채워지는데에 더 오랜시간이 걸립니다. 그러면 반도체 회로가 Physical timing issue로 Setup time violation 발생하고 이것도 Chip 동작이 제대로 안 될 수도 있습니다.

​

아무튼 IR Drop이라는 것은 이런겁니다. 전압원과 멀어지며 저항성분들에 의해 전압이 떨어지는거죠.

![5](/assets/img/223322494576/5.png)

IR Drop에는 Dynami IR Drop, Static IR Drop이 있습니다.

- Static IR drop은 기본적으로 칩 전체에서의 평균적인 IR Drop을 정의하고,

- Dynamic IR Drop은 Vector를 입력해서, Vector 값에 따라 IR Drop을 정의합니다. Swithcing activity에 영향을 받죠.

​

​

그래서 Power integrity 분석에서는 Margin 값 안에서 V, I, R 값이 지켜지도록 PV 단계에서 검증을 하구요. 주로

반도체 산업에서 Golden standard tool은 RedHawk입니다.

https://www.ansys.com/products/semiconductors/ansys-redhawk-sc

[Ansys RedHawk-SC | SoC Power Integrity & Reliability Software](https://www.ansys.com/products/semiconductors/ansys-redhawk-sc) : Ansys RedHawk-SC is the industry standard for power integrity and reliability signoff for ICs. Analyze full-chip IR drop, electromigration, and thermal reliability.

![6](/assets/img/223322494576/6.png)

IR Drop analysis는 타이밍 검증처럼, 요구 값이랑 실제 값이랑 비교하는 code2code 분석입니다.

2볼트에서 작동해야 하고 양쪽의 허용 오차가 0.4볼트인 경우, 해당 설계의 전원 핀(Vdd)과 접지 핀(Vss)의 전압이 1.6볼트에 미치지 않도록 해야 하는데, 이 상황에서 허용 가능한 IR 강하는 0.4볼트입니다. 즉, 이 맥락에서 설계는 설계의 타이밍과 기능에 영향을 주지 않는 최대 0.4V 강하를 허용할 수 있습니다. 이 IR 강하를 분석하는 과정을 IR Drop analysis라고 합니다. Digital logic backend engineer (Physical engineer)들이 담당합니다.

​

​

참고: De-cap cell 늘리기, Power stran 수, 폭 늘려서 IR Drop 해결하는 방법.

​

https://www.ansys.com/blog/minimizing-ir-drop-in-integrated-circuit-design

[Steps to Minimize IR Drop in Integrated Circuit Design | Ansys](https://www.ansys.com/blog/minimizing-ir-drop-in-integrated-circuit-design) : Learn about IR drop in integrated circuit design, including the types of IR drop and steps to minimize it to improve the performance of your chips.

​

​

미세공정에서 더 정확한 STA를 위해 IR Drop analysis 출력파일도 STA에서 import해서 검증을 할 수도 있습니다.

이후 포스트에선 Electromigration에 대해 다뤄보겠습니다.

 해시태그 : 