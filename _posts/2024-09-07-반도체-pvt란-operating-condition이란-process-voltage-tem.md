---
published: true
---
## 반도체 PVT란? Operating condition이란? Process, Voltage, Temerature Variation in VLSI / ASIC

우리가 사용하는 반도체 트랜지스터는 보통 두가지 이유 때문에 사용합니다.

Switching 기능

Amplifing 기능

그리고, "반도체가 무엇인가?"를 생각하면,

3. 도체와 부도체 사이... 어딘가.

4. Energe band gap이 적당히 좁아서, 약한 외부 에너지를 통해 제어 할 수 있는 물질입니다.

​

이 PVT는 4번에도 연관이 있고, 설계에도 공정에도 관계가 있습니다.

학교에서 Semiconductor device 강의 들을 때, 이런 공식들을 자주 마주합니다.

​

MOSFET Model

![0](/assets/img/223376459380/0.png)

좀 더 선진 공정에선 이런 식들을 볼 것이고.. 더 선진 공정에선 더 복잡한 식들을 보겠죠?

![1](/assets/img/223376459380/1.png)

![2](/assets/img/223376459380/2.png)

어쨌든 이런 것들이 모든 환경에서 위 변수들로 동작하는 것은 아닙니다.

위 공식은 신이 내려주신 공식이 아니구요. 과학자들과 공학자들이 "설계하고, 실험하고, 교정하고" 이것을 엄청나게 반복해 만든 식입니다.

​

반도체 동작 환경

![3](/assets/img/223376459380/3.png)

ref: Disorder induced interface states and their influence on the AI/Ge nanowires Schottky devices위 그림처럼 온도와 전압에 따라 전류와 저항 값이 변하는 것을 볼 수 있습니다.

그리고, "반도체제조공정"이 항상 완벽히 균일한 것이 아니라,

똑같은 기계가 똑같은 반도체 웨이퍼를 구워도..

-> 중앙부에 있는 칩들은 설계한 것대로 잘 만들어졌는데, 테두리에 있는 칩들은 실제 예상한 동작보다 더 느리게 동작 할 수 있습니다.

![4](/assets/img/223376459380/4.png)

좀 더 깊숙히 들여다보면, 반도체를 설계 할 때 이런 PMOS+NMOS구조로 되어있는 "CMOS"를 자주 사용하는데요.

칩 속에 엄청나게 많은 CMOS들의 동작 특성을 분석해보니, "어떤 CMOS의 PMOS는 빠르고, 어떤 CMOS의 NMOS는 느리고"... 이런 것들이 파악이 됩니다.

어떤 쪽은 EUV로 패턴 그릴 때 너무 얇게 그려졌거나, 너무 두껍게 그려지거나... 이온 주입이 너무 강하게 되었거나 덜 되었거나.. 이런 이유들로요.

​

그래서 MOS 둘 다 빠르면 Fast Fast Corner, 둘 다 느리면 Slow Slow Corner 이런식으로 부르는거죠.

![5](/assets/img/223376459380/5.png)

그래서 반도체 엔지니어들이 생각해보니까,

​

우리, "특정 온도변동 + 특정 전압변동 + 특정 공전변동"에서 동작하는 반도체를 만들자! 한겁니다.

이런식으로요.

- Process: FF, SS corner

- Voltage: 0.45V ~ 0.55V 

- Temperature: 125도 ~ -40도

(참고로, MOSFET 구조.. MOSFET 공정.. MOSFET 재료.. 다양한 요인에 따라 이 PVT에 대한 I-V Curve도 다름.)

​

MOSFET 공식에 위 조건을 대입하면,

Timing worst corner와 Power estimation을 찾을 수 있습니다. 이런 정보들로 Chip 설계도 하죠.

- 반도체 동작 속도가 너무 빠르면, Timing path의 Endpoint가 준비되기 전에 Start point의 Data가 도착하고,

- 너무 느리면, Endpoint에서 데이터가 필요한데 아직도 Startpoint의 데이터가 도착하지 않겠죠.

(자세한건 Setup / hold time 참고.)

​

그래서, 이런 코너들의 꼭지점을 모아서 모델링하고,

이 코너(반도체 동작 환경)에서 모두 동작해야,

![6](/assets/img/223376459380/6.png)

- Process: FF, SS corner

- Voltage: 0.45V ~ 0.55V 

- Temperature: 125도 ~ -40도

이 환경에서 동작을 하는 것이죠.

​

그런데 위 그림처럼 정육각형 모양 아니구요....

그리고 동작환경에 PVT만 보는게 아니구요....

그러다보니 모양이...

![7](/assets/img/223376459380/7.png)

​

​

공정 설계 엔지니어들은 이런 정보들을 PDK에 담아 회로설계 엔지니어에게 전달하고, 

회로 설계 엔지니어는 PDK 속 Liberty 파일에서 이런 정보들을 토대로 설계하고 GDS를 Fab에 전달하고,

Fab은 GDS를 통해 마스크를 제조하고, 마스크를 토대로 칩을 만들고, 테스팅 팀에 전달합니다.

동시에, 회로설계 엔지니어들이 "양품 판정을 하는 테스트 벡터"를 테스팅 팀에 전달해서 칩 테스트를 하죠.

![8](/assets/img/223376459380/8.png)

논리 회로상에서 문제가 없다고 하더라도,

칩의 배선이 너무 얇게 공정이 되었다던가 / 한쪽에 hot spot이 생겼다던가,

이런 이슈들로 Chip 동작 특성에 영향을 주면... 칩의 I-V Curve도 바뀌고, 전체적인 특성이 바뀌겠죠? 그러면 Timing에도 영향을 줄 것이구요.

-> 결론적으로, 우리가 만든 PVT Corner의 동작조건에 들어오지 않은 칩이 만들어지게 되는 것입니다.

공정 난이도가 매우 높기 때문에, "Design For Manufactoring" 같은 설계 방법론을 잘 이용해서 높은 수율을 만들어내는 설계를 해내야, 제조 단가를 낮출 수 있습니다. (그냥 기능 설계만 하는게 아니라요. 그래서 선진공정에서 양산 많이 해본 엔지니어들이 대우를 받습니다.)

![9](/assets/img/223376459380/9.png)

A Tutorial on Delay Fault Testing, Janak H. Patel, University of Illinois이런걸 Transition delay fault라고 부릅니다.

결국 이런 요인들로 Defect chip이 나오는거고, 수율을 떨어뜨리게 됩니다.

​

반도체 칩 속에 수백억개의 트랜지스터가 있을텐데, 이런거 하나만 잘못 제조공정되면 Chip을 버려야 할까요?

설계를 잘 해서, 코어 하나 죽어도.. 하나 disable 시키고 나머지 core로 동작시키게 할 수 있으면, 그렇게 하면 됩니다.

이것도 설계자 역량이구요.

![10](/assets/img/223376459380/10.png)

​

글 쓰다가 삼천포로 샜는데, 아무튼~~ PVT가 진~짜 중요하다!

 해시태그 : 