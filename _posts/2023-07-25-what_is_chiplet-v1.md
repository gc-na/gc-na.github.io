---
layout: post
title: Chiplet이란 무엇인가? 반도체 설계 엔지니어 시점에서
subtitle: #Chiplet #SiC
tags: Chiplet
comments: true
---

Heterogeneous Integration란 "개별적으로 제조된 구성요소를 패키지 단계에서 통합"하는 것을 의미합니다.

얼마전까지 SoC(System on a Chip)이 대세였는데,

요즘은 SiP(System in Package)가 대세가 되고 있습니다.

​

미세공정에서는 공정 수율 문제가 빈번하게 일어납니다. 반도체 칩에서 한 부분이라도 공정 결함이 생기면 정상 칩으로 쓰기 어렵습니다.

근데 요즘 같이 SoC 같은 시대엔, 칩 사이즈가 매우 큽니다. 하나의 칩으로 만들어진 칩을 Monoly라고 부르는데요.

Chiplet은 전통적인 Monoly chip과 몇 가지 점에서 다릅니다.

​

Monoly은 모든 구성 요소가 하나의 칩에 통합된 단일 실리콘으로 제조됩니다.이 방법은 모든 구성 요소를 동일한 공정과 재료를 사용하여 제조해야 하기 때문에 제한적일 수 있으며 칩에 결함이 있을 경우 전체 칩이 폐기되거나 다운그레이드될 수 있습니다.

​

![](https://postfiles.pstatic.net/MjAyMzA2MjZfMTIx/MDAxNjg3NzEzODQ3NDE0.ZRqGtqeqYeBzIFeb1jkhkRxcfg0bpaNHWCd70FnsCh4g.tFdbxh3-VaOmWbtGDQDkES1DS7iERuGiTV6YKV_52Ycg.PNG.gc_na/image.png?type=w966)

​

얘기드린 것처럼, 미세공정에선 결함이 발생하기 쉬운데, Monoly chip은 각 칩 사이즈가 크기 때문에, 작은 칩보다 결함을 가질 확률이 큽니다.

그래서 동일 기능을 하는 중복하여 설계하고, 1번 SRAM에 공정결함이 있으면, 2번 메모리를 사용하게... 이런 Repair 기법도 있고,

CPU 4개중에 1개가 죽고 n개가 살면, 1개는 사용하지 않고 n개의 코어로 돌게 하도록 설계기법이 있습니다.

어떤 코어는 1.0GHz로는 동작을 안하고, 0.9GHz로 동작을 한다... 그러면 이런것도 싸게 팔아 버리는거죠.

그래서 이런 Design For Test 기술이 양산에서 매우 중요하게 작용됩니다.

​

위와 같은 방법으로 공정결함 있는 칩들을 최대한 살려서 칩 가격을 최소화하는데요. 그래도 5nm, 4nm, 3nm, 이정도 수준의 미세공정으로 내려오면.. 이런 기법을 사용하여도 수율 문제 때문에 정상 칩이 얼마 안 나옵니다. 이런 것 때문에 미세공정 반도체가 금 값이 됩니다.

​

Chiplet은 큰 Chip을 구성하는 처리 모듈의 일부분입니다. Monoly chip에선 Quad core를 하나의 Chip에서 4개를 다 설계하고 제조했다면,

Chiplet은 Core를 1개씩 설계하고 1개씩 제조하는거죠. 그리고 양품 4개를 하나로 패키징 하는거구요.

이러한 기술은 설계의 유연성 향상, 성능 향상, 비용 절감 등 많은 이점을 제공합니다.

​

기존 Monoly Chip 대비 Chiplet의 장점 :

1. 수율 개선

2. Monoly Chip의 경우, 한 Chip을 모두 똑같은 공정으로 설계해야합니다. 예를들어, DRAM Controller와 CPU, NPU만 3nm로 설계하고, 나머진 14nm공정을 쓰고싶다? -> 이러면 어쩔수없이 다 3nm로 하던가 다 14nm로 설계+공정해야합니다.

그런데 Chiplet의 경우엔, 필요에 맞게 각각 설계 공정하고, 패키징 레벨에서 연결하면 됩니다.

3. Monoly Chip은 배치배선을 평면상에서만 하는데, 3D Pakaging은 수직으로 쌓기 때문에, 하나의 Chip에서만드는 것보다 오히려 모듈간 거리가 더 짧을 수도 있습니다. (아래 그림 참고)

![](https://postfiles.pstatic.net/MjAyMzA2MjZfMTA4/MDAxNjg3NzEzNzM4MTA3.67nUCg6LtnyyFCNg5kzQ1zZhCvsoi53S9S-0YxB7l80g.STPC6atjPmYPCj0NjbwfC8-PJQpT4Ix6M2w5qijLEU4g.PNG.gc_na/image.png?type=w966)

​

기존 Monoly Chip 대비 Chiplet의 단점 :

1. 설계 난이도: 설계자는 서로 다른 칩셋이 서로 호환되는지 검증해야합니다. 그리고 2023년 현재 monoly chip 관련 설계자동화 툴은 정말 많지만, 지금 Chiplet에서 설계는... 많은 부분들이 수작업입니다. 그리고 칩 간 인터페이스 로직에 연구개발이 필요합니다.

2. 전력 소비, 성능, 면적: Monoly chip보단 다 안 좋습니다. (그렇지만 monoly chip은 PPA가 더 좋다고 해도, 수율 때문에 양산이 어려움.)

3. 패키징 비용이 증가합니다.

​

​

Chiplet의 동향 및 종류 :

2.5D 및 3D Packaging은 동일한 패키지 내에서 여러 IC를 1개의 Chip에서 통합할 수 있는 최신 패키징 기술입니다. 차이점은 IC가 패키지 내에 어떤식으로 배치되느냐 입니다.

2.5D : 두 개 이상의 반도체 칩을 Silicon interposer에 나란히 배치하여 매우 높은 die-to-die interconnect density를 달성합니다.

3D : 두 개 이상의 반도체 칩을 수직적으로도 쌓아서 통합합니다. 더 가깝기에, Performance, Power, Area가 2.5D보다 더 좋습니다. 더 어렵지만..

​

​

이미 Chiplet 기술을 사용하여 만들어진 Chip들이 나오고있습니다.

![](https://postfiles.pstatic.net/MjAyMzA2MjZfMjgw/MDAxNjg3NzE0NjYxMjQ1.qjjn9gFgv8tI8Ra-fgM0HgcNrJ1L-dTuaGCMe_CZb1og.OgyTJ4_kpag7Jd4wjobTRT8jZK0k4z_iKAxS_eWxsuog.PNG.gc_na/image.png?type=w966)

​

사실 Chiplet의 컨셉 자체는 어렵지 않고, 이미 30년 전에도 나왔던 컨셉입니다. 다만 TSV로 안했고... 패키징이 어렵고.... 그냥 공정 스케일링이 가능했기에 칩렛을 안 썼던거죠.

무어의법칙이 깨지고, 데나드스케일링, 암달의법칙 등.... 다중 모듈 다중 칩에서, 통합된 SoC로. 하나의 SoC에서 SiP로 넘어가고 있습니다.

수율 문제 없이 스케일링이 계속 가능하다면 계속 SoC를 쓰겠지만, 그렇지 않을거라고 봅니다. 그래서 SiP로 시장 전체가 움직일거라고 봐요.

​

다음 포스팅은 UCIe (Universal Chiplet Interconnect Express)가 될 것 같습니다. UCIe는 칩렛간 인터페이스에 대한 설계 스탠다드입니다.
