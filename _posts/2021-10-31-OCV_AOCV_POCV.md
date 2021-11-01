---
layout: post
title: OCV, AOCV, POCV, PVT, CRP, CRPR란? On Chip Variation
subtitle: What is an OCV, AOCV, POCV and PVT in vlsi?
tags: [STA, Primetime, OCV, process]
comments: true
---

반도체의 속도는 PVT Operating Condition의 영향을 받습니다.

Process가 짧고, Voltage 높고, Temperature가 낮을 수록 빠르게 구동될 수 있습니다.

설계자들은 이것을 고려해서, Process가 길고, Voltage가 낮고, Temerature가 높은.. 최악의 환경(Worst Case)에서 구동되는 반도체를 만들고자 노력합니다. (Worst case에서 동작해야 다양한 상황에서 동작할 수 있기 때문에.)

PVT를 고려하는 이유는, 칩 외부의 환경 변화에서도 칩이 동작하기 위함.

OCV(On Chip Variation)를 고려하는 이유는, 칩 내부의 환경 변화(?, 공정에서 생긴 다이간의 차이 때문에)에서도 칩이 동작하기 위함입니다.

어쨌든 반도체 설계사에서는 이것들을 STA(Static Time Analysis) 단계에서, 환경 변화에 대한 마진 딜레이를 갖도록 염두해야됩니다.

![pvt vs delay](/assets/img/pvtvsdelay.jpg)

반도체를 설계의 마무리. sign off까지 되면, .gds(Graphical Design System) file형태로 공정사에게 전달됩니다.

규암에서 실리콘을 정제하고, 실리콘을 원통형태로 만들고, 다이아몬드 와이어로 원통을 얇게 잘라서 얇은 피자 같은 판을 만드는데, 이 판을 Wafer라고 부릅니다.

![wafer_pizza](/assets/img/KakaoTalk_Photo_2021-10-29-17-03-16 001.jpeg)

반도체 설계자가 설계한 반도체를, [공정 과정](https://gc-na.github.io/semiconductorprocess/ "반도체 8대 공정?")을 거쳐서 웨이퍼 위에 수십 수백개의 칩(다이)을 만듭니다.

![die](/assets/img/die.png)

허나 애초에 웨이퍼의 모든 부분이 완벽하게 균일하지 않고, 공정 중 미세한 오차가 생깁니다. 그래서 다이마다 전기적 성질이 달라집니다.

![wafer](/assets/img/wafer.png)

OCV에는 Sytematic Variation(Global variation)과 Non-Sytematic Variation(Local varaiation, Random Variation)을 고려합니다. 둘 다 공정상에서 생기는 문제인데, 

Systematic Variation - Optical Proximity Corrections (OPC) or Chemical Mechanical Policing (CMP)

Non-systematic Variation - Random Dopant Fluctuation (RDF), Line Edge Roughness (LER) or due to Oxide Thickness Variations (OTV)

이 있습니다. 공정을 자세히 볼 것은 아니니까, Sytematic은 예측 가능한 반면에 Non-systematic은 예측이 어렵다는 것입니다.

![Varation](https://1.bp.blogspot.com/-F6JiqR94Qys/Xw6rbWMQh4I/AAAAAAAAbcY/pbOkPVf3ib0ZJZjWjKJbjU0qYFzLo3f3gCLcBGAsYHQ/s1505/variations.png)

처음 OCV를 고려할 때는, 간단한 증감요소(derating factor)를 사용했습니다.

PrimeTime 툴에서는 set_timing_derate 커맨드를 사용해서 지정할 수 있습니다.

근데 이렇게 OCV로 하면, 실질적인 오차와 차이가 너무 커지게 됩니다.

예를들어 버퍼의 딜레이가 10ps인데, derating은 20%라고 합시다. 10개의 버퍼면, 이상적인 경우에 100ps가 걸릴 것이고, derating factor에 따라 80~120ps라는 것인데, 너무 마진을 크게 잡는다는 것이죠.

그래서 기존의 OCV는 90nm까지 쓰이고, AOCV(Advanced On Chip Varaition)으로 넘어가게 됩니다.

![sta_factor](/assets/img/pt_derating_factor.png)

AOCV에서는 Cell의 Path depth와 distance를 derating factor로 지정합니다.

path depth란, 지나는 Cell의 수입니다.

![path_depth](https://1.bp.blogspot.com/-8Ds-yziI-SA/XxM4eM5XPII/AAAAAAAAbhs/51jQ5KtSOSoMO6lPFU1nCNx0A90n8hXwACLcBGAsYHQ/w640-h218/pathDepth.png)

distance는 Net와 Cell의 경계를 기준으로 한 범위 입니다.

![distance](https://1.bp.blogspot.com/-O-yKzhD8onM/XxM0dCzASGI/AAAAAAAAbhg/rUvvGhYDBQM6-thljy206ynReWfhlEeOgCLcBGAsYHQ/w640-h218/distance.png)

path depth가 증가하면, Non-Systematic Variation이 상쇄되서 derate 값을 낮춰도 됩니다.

distance가 증가하면, Systematic Variation이 증가해서 derate의 값을 높여줘야합니다.

아래 표에서 depth와 distance에 따른 derate 값이 나타나 있습니다. (참고로, 버퍼셀 3개를 넘는 것과 or셀 3개를 넘는 것은 타이밍과 derate가 다릅니다.)

AOCV에서는 Clock analysis mode, Clock and data analysis mode가 있습니다.

AOCV는 depth와 distance를 기반으로 derate 값을 정하는데, 이것도 40nm부터는 정확도가 낮아서 새로운 기법을 사용합니다.

POCV(Parametric On chip Variation)입니다.

![table](/assets/img/aocv2Dtable.png)

아래는 Synopsys의 Prime time에서 제공하는 AOCV design flow입니다.

![flow](/assets/img/ptAOCVFlow.png)

POCV는 Cell의 delay로 계산이 됩니다. 그 delay는 아래 식을 통해서 구합니다.  

Delay of a cell = Nominal delay (µ)  ±  (C * Nominal delay) * N  
or  
Delay of a cell = Nominal delay (µ)  ± Variation  
        
C = POCV coefficient이고, POCV coefficient file에 있습니다.  

![flow](/assets/img/cvalue.png)

N = Number of standard deviation이고, Library Variation Format (LVF) 파일 안에 있습니다.  

![flow](/assets/img/value2.png)

아래는 Synopsys의 PrimeTime에서 제공하는 POCV design flow입니다.

![flow](/assets/img/pocvPTflow.png)


OCV(OCV, AOCV, POCV)를 수행하면 생기는 의심이 있습니다.

한 path내에 어떤 때에는 매우 작은 delay가 걸릴 때가 있고, 큰 delay가 걸릴 수 있는데(한 path에는 한 경우에 한가지 delay만 가질 수 있음.), 이런 차이가 생겨도 회로가 정상적으로 동작 할 것인가?

이에 대해 CRP(Common Recovergence Pessimism)라고 부릅니다. 이것을 제거하는 과정은 CRPR(remove)라고 합니다.

![111](/assets/img/crpr.png)

![111](/assets/img/111.png)

![111](/assets/img/222.png)

![111](/assets/img/333.png)

![111](/assets/img/444.png)
