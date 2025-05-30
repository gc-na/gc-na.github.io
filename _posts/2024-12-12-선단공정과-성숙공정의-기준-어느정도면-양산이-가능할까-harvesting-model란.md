---
published: true
---
## 선단공정과 성숙공정의 기준 + 어느정도면 양산이 가능할까? Harvesting model란?

공학은 과학보다 한가지 변수를 더 고려합니다. "수익성"입니다.

"반도체의 양산은 수익성이 있는가"에 따라 결정됩니다.

​

2024년 현재 반도체 미세공정은 어디까지 왔을까요?

3nm? 2nm? 1.8nm?  

0.7nm까지 왔습니다.

벨기에의 IMEC에서 CFET 기반으로 0.7nm 공정 반도체의 동작을 시연했습니다.

![0](/assets/img/223613047920/0.png)

​

왜 여전히 스마트폰에 3nm 반도체 공정이 사용될까요?

새로운 반도체 공정을 양산에 도입할 때, 가장 중요한 고려 요소는 "생산 비용 대비 수익성"입니다.

반도체 제조 공정은 "초기 연구개발"과 "생산 설비"에 막대한 비용이 투입되기 때문에, 양산을 위해서는 수익을 창출할 수 있는지를 판단하는 것이 핵심입니다.

​

Chip을 만들었을 때 "Wafer 상에서 몇 개의 Chip이 정상이냐"가 중요하고, 이게 수율 지표로 남습니다.

그래서, 아래 같은 공학기술들이 연구됩니다.

반도체 공정 설계를 작게 하는 기술

반도체 공정 설계에서 실제 반도체와 최대한 비슷하게 모델링하는 기술

반도체 칩을 작게 설계하는 기술 (과거에 선호 됨. 최근에는 병렬적인 Neural Network 처리가 필요하여, Performance와 Trade-off 때문에 우선순위가 내려옴.)

반도체 칩에 많은 외부 요소들을 인식하여 검증하는 기술

반도체 공정설계에서 부족한 실리콘 모델링을 회로 설계에서 커버하는 기술

칩에서 일부가 죽어도, 동작 자체는 가능하게 하는 기술

실제 반도체의 물리적 특성을 묘사시키는 기술들

-> 이후 포스팅에서 각 요소에 대해 하나씩 다뤄볼 예정입니다.

​

연구개발비와 생산설비를 어느정도로 잡았느냐, 외부 보조금을 얼마를 받는지에 따라 ROI는 다르지만,

통념상으로 선단공정의 양산 가능 수율을 "60%", 성숙 공정의 기준을 "90%"정도로 보고 있습니다.

그러나 CES라고 불리는 소비자 제품... 예를들어 주방가전, 청소기, 스마트폰, 컴퓨터의 가격이 올라도 팔리는 형태이고, 반도체 칩 가격도 더 높일 수 있게 되었습니다. 이에따라 좀 더 수율이 낮아도 양산이 가능해졌습니다.

​

대한민국에서 정말 오래된 빵인데, "삼립 크림빵"을 아시나요? 국내 최초의 양산형 크림빵입니다.

![1](/assets/img/223613047920/1.png)

![2](/assets/img/223613047920/2.png)

빵도 공정수율이라는게 존재 할 것이고, 시대가 지나면서 운영 생산성은 더 높아졌을겁니다.

그런데 빵 값은 계속 떨어졌을까요? 아뇨. 빵 값은 계속 우상향 했습니다.. 경쟁사들도 같이 가격을 올렸구요. 이 빵을 먹고 내가 배 부르고, 이 에너지로 일 할 힘이 있으면 사 먹는겁니다. 맛이 다른 빵에 비해 심심하니, 삼림 크림빵의 인기는 점점 떨어지겠지만, 꾸준히 사먹는 사람이 있구요.

​

파운드리 비즈니스도 비슷합니다. 가격이 우상향 합니다. 그리고 이 공정으로 가치 있는 제품을 만들 수 있으면, 이 공정이 오래된 공정이더라도 고객이 유지되거나 새로 생깁니다.

[수익성] 선단공정 vs 성숙공정

선단공정(최신 공정 예: 3nm, 4nm, 5nm)과 성숙공정(Legacy 공정 예: 45nm, 90nm, 130nm)은 각각의 시장과 생산 단계에 따라 수익성 측면에서 장단점을 가지고 있습니다.

​

높은 수익 잠재력:

3nm 또는 2nm와 같은 선단공정은 AI, HPC, AP Chip 등 고성능 응용 분야에서 사용됩니다.

이러한 공정에서 생산된 웨이퍼는 프리미엄 가격을 받을 수 있으며, tsmc와 SAMSUNG과 최첨단 칩에 붙는 프리미엄을 통해 높은 수익을 창출합니다.

intel에서는 EUV 장비를 통해 1.8nm 공정의 반도체 양산을 준비하고 있습니다.

​

선진 공정의 수익이 많은가? OFC!!!!

tsmc 1Q24

![3](/assets/img/223613047920/3.png)

Source: https://www.anandtech.com/show/21359/tsmc-posts-q124-results-3nm-revenue-share-drops-steeply-but-hpc-share-rises![4](/assets/img/223613047920/4.png)

Source: https://www.anandtech.com/show/21359/tsmc-posts-q124-results-3nm-revenue-share-drops-steeply-but-hpc-share-rises​

​

초기 수율과 수익성 낮음:

선단공정의 초기 수율은 보통 낮습니다.

파운드리의 비즈니스는 웨이퍼에서 많은 칩이 정상으로 나와야 이익률이 높아지는 구조입니다.

계속 다양한 설계를 주문 받고, 거기서 나온 불량 칩을 확인하고, 공정 설계 모델링과 차이점을 분석하고, 그 값을 다음 모델링에 교정하고, 공정장비의 변수 값들을 조정하면서 수율을 조금씩 조금씩 높여가는 비즈니스입니다.

tsmc가 업력이 길기에 당연히 이런 모델링에 대해 노하우가 더 쌓여있고, 초기 모델링 자체도 잘 합니다. 더 중요한 "주문 받는 반도체의 종류와 양이 많기 때문에", 초기 모델링이 잘못되었더라도, 양산 과정 동안에 실리콘과 모델링 사이의 Calibrartion도 여러번 할 수 있습니다. 파운드리 비즈니스에서는, 대량 주문을 받는 쪽이 훨씬 유리합니다.

Silicon과 SPICE 모델링의 Correlation도 매우 높아야하고, SPICE와 Design Kit 간의 Correlation도 매우 높아야합니다. 그냥 Setup/Hold time margin 크게 주고 회로 설계한다면, 미세공정의 반도체를 사용하는 RoI가 안 나옵니다.

EUV(극자외선) 리소그래피와 같은 고급 장비의 비용은 초기 수익성을 더욱 낮추는 요인이 됩니다. 그리고 선단공정 개발시, 훨씬 많은 자사 연구비용이 필요하고, 이 외에도 반도체 장비회사와 EDA 벤더들에 사용해야 하는 비용이 큽니다.

Fabless들이라고 해서 모든 반도체를 설계하지 않습니다.​ 핵심 설계만 합니다. 예를들어 PCIe, USB, Ethernet 등의 범용 설계는 IP Vendor 제공합니다. 그리고 이런 IP들이 실리콘 수준에서 검증되고 IP Hardening 까지 마쳐야합니다. USB만 해도 스펙이 엄청나게 많습니다. 어떤 파운드리에서는 선단 공정에서 USB IP 종류가 3개도 안 되는데, 어떤 파운드리에서는 동일 공정에서 USB IP 종류만 수십개입니다. 이런 것들을 넓혀놔야합니다.

선단 공정이라고 하면, 성숙공정에서 장비만 갈아 끼우는게 아니라, 보통은 팹 자체를 새로 건설해야합니다. 반도체 장비들의 반도체 제조 환경 스펙이 다릅니다.

​

일부 파운드리에서는 이런 것들을 다 스킵하고, 정부 보조금을 통해 양산을 이어나가는 경우도 있습니다.

중국을 보면, 대부분의 파운드리 회사는 14nm 이하 공정부터 ASML의 EUV 장비를 공정에 도입하여 수율을 높였는데, 미국으로부터 수출 규제가 있는 중국은 DUV 장비를 사용해야합니다.

이런 경우에 당장의 수익성은 부족하지만, 공정과 설계기술 개선으로 계속 양산 수율을 높여갈 가능성은 있습니다.

![5](/assets/img/223613047920/5.png)

​

장기 수익성: 칩 당 순이익과 공정수율 간 상관관계 분석

선진공정

Chip 생산성이 성숙공정에 비해 낮지만, 어느정도 공정 수율이 안정화 되어 양산 가능한 수익률 창출이 가능합니다.

선단공정은 고성능을 요구하는 시장에서 매우 수익성이 높아집니다​.

AI 및 소비자 전자기기와 같은 고성능이 요구되는 시장에서는 이러한 공정의 높은 제조 비용을 프리미엄 가격으로 상쇄할 수 있습니다. 이에 따라 선단공정의 수익성은 지속적으로 유지될 수 있습니다. 

시간이 지나면서 생산이 안정되고 수율이 개선되면, 선단공정의 장기 수익성은 점점 증가합니다. 수율이 최적화되면 기업들은 초기 투자 비용을 회수할 수 있습니다.

​

성숙공정

수율이 90% 이상에 도달하여 Chip 생산성이 매우 높습니다. 28nm, 40nm 같은 공정들은 오랜 시간 동안 최적화되어 매우 안정적인 생산 라인을 구축하고 있습니다. 이러한 공정에 사용되는 장비는 이미 감가상각이 완료되어 중고로 사거나 새 제품을 추가할 때 비용 부담이 적습니다.

성숙공정은 IoT, 디스플레이, 가전, 자동차 반도체(자율주행 반도체와 인포테인먼트 시스템은 주로 선진공정을 사용함) 같은 좀 더 저렴하게 판매되는 응용분야에 적합합니다. 생산 비용이 낮고 수율이 높아, 칩 가격이 낮아도 안정적인 수익성을 보장합니다. 높은 수율을 제공하지만, 칩 자체의 가격이 상대적으로 낮아 칩의 가격 선단공정에 비해 작습니다. 성숙공정은 비용 효율성과 대량 생산에 중점을 둔 안정적인 수익 사업에서 더 적합합니다​

​

그래서,

(1) 수율을 높아야 팹리스들이 파운드리를 선택하고,

(2) 수율이 높아야 파운드리 수익률이 높고,

(3) 파운드리에 주문량이 많아야, 설계에서 모델링과 실제 실리콘의 특성을 일치시키는 실험의 기회가 많아집니다.

​

![6](/assets/img/223613047920/6.png)

Source: https://newsroom.lamresearch.com/Improving-Semiconductor-Yield-Using-Large-Area-Analysis?blog=true​

Harvesting model이란?

반도체 제조에서 Yield 혹은 수율은 제조 공정이 끝난 후 Testing 단계에서 정상적으로 동작하는 Chip(또는 Die)의 비율을 의미합니다. 수율을 예측하고 최적화하는 여러 방법 중, Harvesting 모델은 널리 사용되는 방법 중 하나입니다.

​

수율은 측정 대상에 따라 몇 가지로 나뉩니다.

일단, 웨이퍼마다 어떤 웨이퍼에서 만들어진 칩들은 수율이 잘 나오고, 어떤 LOT number에서 나온 칩들은 수율이 잘 나오고... 이런 특성들이 있다는 것을 기억하고 시작하겠습니다.

웨이퍼 수율 (Y_W): 테스트를 통과한 웨이퍼의 비율

다이 수율 (Y_D): 웨이퍼에서 만들어진 다이들 중에서 정상적으로 동작하는 다이의 비율

칩 수율 (Y_C): 패키징 후 테스트를 통과한 개별 칩의 비율

가장 간단한 경우, 수율은 다음과 같이 계산됩니다:

![7](/assets/img/223613047920/7.png)

하지만 실제로는 훨씬 복잡합니다. 제조 공정 중 발생하는 결함은 다이의 크기나 기술 노드에 따라 영향을 미칠 수 있습니다.

​

Harvesting model 의 종류로, Poisson and Binomial Models, Murphy, Seeds and Bose-Einstein Models 등이 있습니다.

가장 많이 쓰이는 것은 Poisson model과 Murphy model입니다.

​

반도체 수율에서 Poisson model이란?

D0가 제곱 센티미터당 결함이고 A가 제곱 센티미터 단위의 다이 면적이라고 가정하면, 

λ0 = D0⨉A가 됩니다. 다이가 작동하려면 결함이 0이어야 합니다.

따라서 다이 수율 DY는 P(k=0)이고 간단한 지수 함수로 모델링 됩니다.

![8](/assets/img/223613047920/8.png)

![9](/assets/img/223613047920/9.png)

​

​

1제곱센티미터 칩에서,

D0=0.4/cm2를 가정하면 다이 수율은 67%

D0=0.1/cm2를 가정하면 다이 수율은 90%

​

Reference: 

https://www.viksnewsletter.com/p/how-foundries-calculate-die-yield

[How Foundries Calculate Die Yield](https://www.viksnewsletter.com/p/how-foundries-calculate-die-yield) : Understanding the metric that Intel used to abandon a whole technology node.

수율에 영향을 미치는 요소

수율 손실에 영향을 미치는 주요 요소는 다음과 같습니다:

단위 면적당 결함 수 (DPU): 결함은 오염물, 설계 결함, 장비 문제 등에서 발생할 수 있습니다.

다이 면적 (A_D): 다이 크기가 클수록 결함 발생 확률이 높습니다.

공정 성숙도: 최첨단 공정은 성숙한 공정에 비해 초기 수율이 낮을 수 있습니다.

설계 복잡성: 복잡한 설계는 결함 발생 가능성을 증가시킵니다.

​

​

​

​

결론

단기 수익성: 첨단 공정은 효율적인 PPA(Performance, Power, Area)를 갖습니다. 그렇기 때문에 저전력, 고성능이 필요한 첨단 응용 분야에 사용됩니다. 반면에 낮은 수율과 높은 비용 덕분에 프리미엄이 붙을 수 있고, 칩 당 가격이 높습니다.

그리고 수율이 안정되면서 수익성이 높아지는 구조.

장기 수익성: 선단공정은 초기에는 수익성이 낮을 수 있지만, 수율이 개선되고 고성능 칩에 대한 시장 수요가 지속되면 장기적으로 더 큰 수익성을 기대할 수 있습니다.

높은 수율을 만들려면, 공정의 정확성도 중요하고, 많은 주문을 통해 경험을 쌓으면서 설계에서의 모델링 값과 실제 반도체 특성이 일치해야한다.

수율 계산으로 Poisson model, Murphy model이 자주 사용된다.

​

​

아래 영상 꼭 보시는 것을 추천합니다. EDA 회사가 꿈꾸는 "수율 향상을 위한 종합 솔루션"을 알 수 있습니다.

https://www.youtube.com/watch?v=Kv6f1wnc148

[![Silicon Lifecycle Management (SLM) -- Synopsys](https://i.ytimg.com/vi/Kv6f1wnc148/hqdefault.jpg)](https://www.youtube.com/watch?v=Kv6f1wnc148)

설명 : February 25, 2021 -- Wouldn’t it be great if we could keep on analyzing our IC designs once they are in the field? After all, simulation and lab measurements...

​

https://youtu.be/1YJvWdAxsPs?si=XbXdj4ZYYWRCkHT-

[![Driving to Entitlement Yield in Foundry and TI Fabs with Synopsys Yield Explorer | Synopsys](https://i.ytimg.com/vi/1YJvWdAxsPs/hqdefault.jpg)](https://youtu.be/1YJvWdAxsPs?si=XbXdj4ZYYWRCkHT-)

설명 : Synopsys Yield Explorer (YE) has been used extensively by the Embedded Processing (EP) team at Texas Instruments. YE has been instrumental in identifying the...

​

​

Reference:

https://images.samsung.com/is/content/samsung/assets/global/ir/docs/2024_2Q_conference_eng.pdf

https://www.anandtech.com/show/21359/tsmc-posts-q124-results-3nm-revenue-share-drops-steeply-but-hpc-share-rises

https://www.mckinsey.com/industries/semiconductors/our-insights/whats-next-for-semiconductor-profits-and-value-creation

[What’s next for semiconductor profits and value creation?](https://www.mckinsey.com/industries/semiconductors/our-insights/whats-next-for-semiconductor-profits-and-value-creation) : Semiconductor profits have been strong over the past few years. Could recent industry developments stall their progress?

https://www.bcg.com/publications/2023/navigating-the-semiconductor-manufacturing-costs

[Navigating the Costly Economics of Chip Making](https://www.bcg.com/publications/2023/navigating-the-semiconductor-manufacturing-costs) : Semiconductor fabs have become increasingly complex in recent years, making them more expensive to build. But the right combination of incentives and support can help companies bring down costs.

​

파운드리 비즈니스에 대해 저보다 더 잘 아시는 분들이 많을텐데, 이 대화의 장을 열기 위해 이 글을 써봅니다.

댓글로 더 자세한 이야기가 듣고싶습니다!

 해시태그 : 