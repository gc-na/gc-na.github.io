---
published: true
---
## [반도체 설계 / 검증] Routing congestion의 Estimation과 Optimization 이해하기

VLSI 칩 설계에서 중추적인 어려움 중 하나는 Routing Congestion에 대한 관리입니다.

Routing은 각 입출력 Port들을 연결하는 Metal을 그려놓는 단계입니다. 그렇기 때문에, Place 이후에, 회로 설계 후반부에 일어나는 단계입니다.

​

아래 그림은 Cell placement 및 Legalize까지 완료된 Die의 Layout입니다.

![0](/assets/img/223698396680/0.png)

ECE6133 Physical Design Automation of VLSI Systems Prof. Sung Kyu Lim School of Electrical and Computer Engineering Georgia Institute of Technology이렇게 배치된 Cell들을 Metal으로 연결을 해줍니다.

여기 Metal의 각각 색깔이 다른데, 각 특성이 다른 Metal들을 사용하였기 때문입니다.

![1](/assets/img/223698396680/1.png)

ECE6133 Physical Design Automation of VLSI Systems Prof. Sung Kyu Lim School of Electrical and Computer Engineering Georgia Institute of Technology이렇게 Rouitng된 Net들이 어느정도 가까우면, 직접 선과 선이 연결이 되어있지 않더라도, 인접한 Net이 전자기학적 현상으로 건너뛰어 다른 Net들에 영향을 줍니다. 이것을 Crosstalk이라고 합니다.

![2](/assets/img/223698396680/2.png)

그래서 이런 Crosstalk에는 공격자(Aggressor)와 피해자(Victim)이 존재합니다.

​

위쪽 Net이랑 아래쪽 Net이랑 실제로는 연결이 안 되어있는데, 전자기학적인 현상들으로 인해 연결되어있는 것처럼 보이는 현상입니다. 마치 작은 capacitor가 연결된 것처럼요.

그래서 이것을 "Coupling capacitor"라고 합니다.

![3](/assets/img/223698396680/3.png)

​

예를들어 아래 그림을 보면, B에서는 원래 signal이 0에서 고정되어 있어야 하는데, A의 신호 변화가 B에 신호 변화를 만드는 것을 보여줍니다.

여기서 B가 이렇게 살짝 튀는 것을 Glitch noise나 Bump noise라고 하구요. 튀게되는 높이를 Bump height, 폭을 Bump width라고 부릅니다.

​

![4](/assets/img/223698396680/4.png)

위 그림은 B가 0인 상태인데, 예를들어 B가 High-to-Low로 가는 Transition 일 때를 가정해봅시다.

​

그러면 아래 그림 처럼, 신호 Transition time이 더 느리게 발생하는 것을 볼 수 있습니다.

이것을 Crosstalk Delta delay라고 부릅니다.

우리는 Noise가 회로의 기능적 문제를 발생시킬 수 있다(수율에 이상을 줄 수 있다.)는 것을 알게 되었습니다.

![5](/assets/img/223698396680/5.png)

신호가 원래 있어야 할 곳보다 높거나 낮은 곳으로 가기 때문에 Above Low, Below High noise 이렇게 부르기도 하구요.

Below low, Above high도 있긴한데, 이것들보다는 회로 기능적 문제에 직접적인 영향을 주는 AL과 BH를 더 집중적으로 봅니다.

![6](/assets/img/223698396680/6.png)

![7](/assets/img/223698396680/7.png)

그래서 이런거 어떻게 해결을 해야하냐?

![8](/assets/img/223698396680/8.png)

Cap 값을 낮추거나(Net 간 거리를 띄워놓거나), Aggressor current를 낮추거나, Victim의 Drive strength를 높이면 됩니다.

[가능하다면, Net 간의 거리를 뛰우는게 좋습니다. Aggressor보다 Victim이 강해지면, 이제 Victim이 Aggressor가 되는 상황이 나오기 때문입니다. 그리고 Noise가 발생하는 경우에는 Buffer를 넣을 자리도 없는 경우가 다반사입니다.]

​

![9](/assets/img/223698396680/9.png)

EDA Tool은 Noise 값에 대한 계산을 위처럼 계산을 합니다. Library 내에 "Noise" 정보들이 들어있고, 이 범위를 넘어서면 Glitch로 계산을 하는거죠.

​

EDA Tool에도 Noise를 잘 최적화하지 못하는 경우가 있습니다.

이러한 이유는

(1) Chip 설계 초반 단계에서 Noise에 대한 고려가 부족했고

(2) 현재 Place 된 Cell 위치로는 어떻게 Routing을 수정하든 인접하는 부분들이 많이 발생하거나

(3) Cell 위치를 옮기면 Timing이 다 틀어져서 Optimization이 끝도 없이 일어날 것이 뻔하기 때문입니다.

그래서, Floorplan부터 이런 것들을 잘 고려하고, Placement 단계부터 congestion에 대한 estimation을 계속 해야합니다.

​

Routing congestion란?

Routing Congestion은 Chip 내에서 특정 Region의 Routing resource가 수요가 공급을 초과하는 현상입니다. 이는 Noise bump 발생, Crosstalk delta delay 발생, Noise power consumption 발생.

Congestion는 Design의 회로의 Yield 및 Reliability에 직접적인 영향을 미칩니다.

![10](/assets/img/223698396680/10.png)

Enhancing VLSI Design Efficiency: Tackling Congestion and Shorts with Practical Approaches and PnR Tool (ICC2)By Ishu Shukla, eInfochips, an Arrow companyRouting Congestion Estimation란?

Floorplan 단계에서 

초기 Routing 단계에서 Congestion을 예측하는 것은 설계 최적화의 핵심입니다. Hard Macro의 사이가 너무 좁거나, Hard macro와 Interface 되는 부분들에 공간이 넉넉하지 않으면, 이 곳에는 Routing resource가 많지 않을 것이라는 점을 미리 염두해둬야합니다.

​

Placement 단계에서 

Placement 단계에서는 특정 Region에 cell이 얼마나 몰려있고, pin들이 얼마나 몰려있는지를 알 수 있습니다. 그러면 여기에 얼마나 많은 Net들이 있을지? 최소 Wire length는 어떨지 estimation 할 수 있습니다. 

총 와이어 길이, 핀 밀도 및 영역 당 핀의 수 등을 분석하여, 각 영역의 예상 혼잡도를 계산합니다.

​

Routing 단계에서

과거 설계 데이터를 활용한 통계적 분석을 통해 혼잡도를 예측하며, 이는 라우팅 전략 수립을 하는 방법도 있습니다.

Fast global routing 기법을 사용하여 실시간으로 혼잡도를 예측하고, 이를 기반으로 라우팅 경로를 ripping, re-routing하는 방법도 있고.. Global Routing(GR) 이후에 Detail Routing(DR)단게에서 세부 조정.

여기서 다양한 알고리즘들이 존재합니다.

​

아, 그리고 Timing 여유가 있어서 Routing congestion은 발생하지만~ Timing은 MET 했다고 해도 Silicon이 죽을 수도 있습니다.

Congestion 발생하는 부분들에서 열이 너무 많이 발생해서 SCAN Shift 같은 Signal vector probability가 높은 때에 칩이 죽어버리는 Reliability 이들이 있는거죠.

​

미래 전망

Routing congestion은 VLSI 설계에서 Transitior들이 더 작고 많아지면서 점점 엄청나게 복잡해지고 있습니다.

EDA (VLSI CAD)에서 핫한 분야이기도 하고, Chip 설계 분야에서도 이 부분에 문제가 있어서 Silicon re-spin 가는 경우들도 있습니다.

​

Signoff 단계에서 정확히 계산하기 + P&R 단계에서 Routing congestion 잘 고려해하기... 매우 어렵습니다.

​

매우 정확해야하고 + 빠른 시간 안에 시장에 출시되어야 하는데, NVIDIA의 H200 같은 경우에도, Transitor count가 80B. 그러니까 800억개입니다. 800억개의 Device에 대한 물성을 다 고려해서 엄청나게 좁은 Clock period 안에 넣고, 이것들에 대해 모든 최악의 경우의 수를 찾아내 통과하는지 확인을 해야하기 때문입니다.

​

SPICE engineer분들은 알겠지만, 1개 Stage에 대한 Noise 분석도 시간이 꽤 걸리는데, 어떻게 이런 Chip 단위 Noise를 분석 할 수 있을까 대단하지 않나요?

![11](/assets/img/223698396680/11.png)

그리고, 매 공정마다 새로 고려해줘야하는 Transitor 특성들이 있어서, 칩 스케일링이 끝나지 않는 한..

Noise는 계속 반도체인의 과제가 될 것 같습니다.

​

영혼을 팔아서라도 우리나라 반도체 PPA와 Yield를 높이고싶군요. 

 해시태그 : 