---
layout: post
title: DFT, MBIST 하는 이유. 미세공정
subtitle: #DFT #MBIST
tags: [DFT, MBIST]
comments: true
---

미세공정에선 contamination과 EUV가 가장 제어하기 힘들고 수율을 떨어뜨리는 큰 요인이다.

말을 어렵게 썼는데,

​

contamination은

1) 반도체가 그려지는 웨이퍼가 만들어지는 과정에서... 실리콘을 녹이고 굳히는 과정에 이물질이 들어가면(분자 하나라도!!) 그 부분에서 물리, 화학적 성질이 달라진다. 그러면 그 자리에 있는 칩은 불량이 날 가능성이 높다.

2) 실리콘을 녹이고 잉곳을 만드는 과정에 균일하게 녹고 섞이고 굳지 않으면 결정 구조가 달라질 수 있다. 이러면 전기적 특성이 달라진다.

3) 웨이퍼 위에 칩이 그려지는 과정은 빛을 이용하는데, 이 과정에 먼지 한톨이라도 들어가면 그 부분은 먼지에 가려져서 칩에는 그려지지 않을 것이다. 그러면 또 칩에 불량이 난다!

​

EUV는 Extreme UltraViolet이라고 하는데, 말 그대로 극 자외선입니다. 30년 전에도 이론적으로는 있었는데, 현재 28nm, 14nm, 5nm 이렇게 미세공정으로 내려오니 EUV라는걸 씁니다.

1) 미세공정이기 때문에 선폭이 매우 짧습니다.

2) 미세공정 EUV를 할 수 있는 회사가 네덜란드의 ASML 밖에 없습니다. Foundry에서 EUV만을 위한 공장을 따로 지어주기도 합니다.

3) contamination처럼, EUV 또한.. 광원(Source)을 순수하게 만드는 것이 중요합니다.

4) EUV는 공기중에선 1cm이상 직진시키기도 힘듬. 진공환경 필요. 완전한 진공을 만드는 것은 어렵기에, 대기압의 10만분의 1 정도로 제어하고 있음.

5) EUV 과정에선 웨이퍼 제조 공정에서 주의할 것과 비슷한게 많은데 더 까다롭다고 보면 됨. 예를들어 온도가 EUV 공정 환경 온도가 0.1도가 높다고 하면, 웨이퍼는 0.1도 오른만큼 칩이 팽창되어 있을 것이고.. 제대로 그려지지 않을 것임.

6) EUV는 광원을 쏘면, 반사경을 통해 빛이 반사되고, 빛이 웨이퍼에 스캔이 되는데, 스캔을 하면서 저진동/관성제어를 할 수 있어야 웨이퍼를 칩으로 꽉 꽉 채울 수 있다.

사실 EUV는 전공이 아니라 잘 모르는데, ASML Facebook에 엄청 자세히 한국어로 써주셔서 즐겨봄 ㅎ

​

​

​

​

서론이 길었는데, 위 조건들을 못 지키면 설계를 잘 해놔도 불량품이 생산된다.

2022년 3월 기준 Samsung이 생산하는 Qualcomm의 Snapdragon 8 Gen 1(5nm 공정)은 수율이 35%에 불과하다.

https://m.gsmarena.com/samsung_claims_that_yields_from_its_5_nm_foundries_are_improving-news-53627.php


 
Samsung claims that yields from its 5 nm foundries are improving
Those foundries are making chips like the Snapdragon 8 Gen 1, but are seeing low yield rates.

m.gsmarena.com

반도체는 의료기에도 들어가고 자율주행 자동차에도 들어간다. 이런 칩들은 수율 검증이 꼼꼼히 진행되어야 한다.

(요즘 그래서 Foundry에서 Automotive...로 시작하는 컨소시엄들이 많다.)

​

그러나, 음료 자판기처럼 반도체 칩의 인풋은 몇 개 없다. 이 몇 개의 인풋을 가지고, 한 칩에 수십 수백억개의 트랜지스터로 이뤄져있고, 이 칩 수 천만 개를 검증해야 한다. 그것도 아주 빨리!

 

​

테스트 회로를 연결하면 당연히 Chip의 input port와 output port만 control 할 수 있다. 그리고 chip size 때문에 제어할 수 있는 port는 많지 않을 것이다.

그러면 ! 내부 회로를 검증하기가 매우 까다로울 것이다. 이걸 하기 위해서 하는 방법이 있다.

DFT, 그러니까 Design For Test.

​

DFT는 사실 한가지 방법만 있는게 아니고, 다양한 방법이 있다. 대표적으로 SCAN, BIST가 있다.

​

SCAN은 내부 logic들에 추가적인 Flip Flop을 연결해서 SCAN mode가 활성화 되었을 때 내부의 각 logic들에 input 값을 직접 주도록 설계하는 방법이다. Logic마다 Flip-flop으로 두르기 때문에 PPA 측면에서 매우 나쁘다. SCAN은 보통.. 이 값의 경우의 수가 많고 복잡한 경우에 쓰인다. (비메모리 반도체)

![ba](/assets/img/semi331.png)  

D Flip flop에 SCAN logic을 추가하면 위 사진처럼 만들어진다.

Tc가 0일 때는 Data input이 Flip flop에 들어가지만, Tc가 1일 때에는 SCAN input이 들어간다.


![ba](/assets/img/semi332.png)  

이걸 왜 넣어주냐고?

아까 위에서 쓴 것처럼, 이런 Di pin은 외부에서 직접 제어 할 수 없다. 그래서 이런 Scan Multiplexer를 Chain처럼 엮어서 외부에서 값을 넣어줄 수 있도록 한다.

SCAN Chain엮는 법에 따라 다른데, input port - mux1 - mux2 - mux3 - mux4 -output port 형식으로 있다고 할 때

test 값을 Scan input에서 0-0-1-1로 넣어준다고 하면, 첫 clock에는 mux1에만 0이, 두번째 클럭에는 mux2에 0 mux1에 0, 셋째 클럭에는 mux 3에 0 mux2에 0 mux1에 1.. 이런식으로 줄줄이 소세지처럼 들어간다. 


SCAN로직을 이런식으로 각 로직들에 다 넣어주므로, chip의 Power, Performance, Area에 대한 과부화가 매우 커진다.

하지만.. 위에 썼던 것처럼 미세공정에서 수율 50% 넘기도 매우 힘들다. 그래서 위 같은 Logic이 필요하다. 양산용이 아니고, 칩 몇개만 테스트용으로 만드는 경우에는 본 과정을 생략하기도 한다.

​

​

​

​

BIST는 Built In Self Test의 약자인데, 말 그대로 스스로 테스트를 할 수 있는 회로를 넣는 방법이다. BIST도 추가 logic을 내부에 삽입한다. Memory 같은 경우, Logic이 단순해서 Test vector도 단순하다. 그러면 ATE만으로도 할 수 있을 것 같지만, 외부 기계에서 칩에 

​

DFT를 하면, 내부에 테스트를 위한 회로를 추가적으로 삽입하기 때문에 PPA(Power Performance Area)가 나빠진다. 그치만.. 이거 없으면 양품인지 불량인지 파악하기가 매우 힘들어진다.

​

Test를 전문으로 하는 회사나 팀에서는 Test cost가 돈+시간에 직결되기 때문에 ATE cost reductuin + Test setup 안정화 + Test Time Reduction에 몰두한다.

​

​

http://www.koreatest.or.kr/sub02/data/%C0%FC%C1%D8%BF%EC.pdf

​

​

​

https://www.edaboard.com/threads/whats-the-difference-between-dft-and-bist.17362/
