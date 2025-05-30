---
published: true
---
## High NA EUV란? Numerical Aperture란? ASML TWINSCAN EXE: 5000

> 2nm보다 더 낮은 공정으로 칩을 만들려면 어떻게 해야할까?

출처 : No Site

​

최첨단 반도체 Foundry들은 올해부터 첫 번째 프로토타입의 High NA (0.55NA) EUV 장비

즉, 네덜란드 ASML 사의 TWINSCAN EXE:5000 에 접근할 수 있게 되었습니다.

https://youtu.be/3PCtf1ONYMU?si=sP1W35se1X3OoWWg

[![Intel Receives ASML’s First High NA EUV system](https://i.ytimg.com/vi/3PCtf1ONYMU/hqdefault.jpg)](https://youtu.be/3PCtf1ONYMU?si=sP1W35se1X3OoWWg)

설명 : #Intel Oregon welcomes the delivery of a key component of #ASML’s first TWINSCAN EXE:5000 system – an extreme ultraviolet (#EUV) high-volume production syste...

위 장비를 통해 만들어진 칩은 2025년에서 2026년 정도에 소비자들에게 전달 될 것으로 예상됩니다.

1대당 가격은 3~4억달러. 5천억원정도로 예상됩니다. 이마저도 생산대수가 한정적이라, 미국에만 가장 먼저 인도었습니다.

​

거두절미하고, ASML의 Public 자료를 보시죠.

![0](/assets/img/223579699747/0.png)

Reference: ASMLASML의 자료에 따르면, EUV공정은7~2nm에서 낮은 process complexity를 보이고,

High NA EUV(0.55NA)는 2~1nm 공정에서 안정적인 것으로 예상하고 있습니다.

​

중국에서는 DUV로 7nm 반도체 양산을 하고 있는데, 수율이 어떨련지...

​

https://www.youtube.com/watch?v=_-qMRcntUIk

[![EUV 2.0. 옹스트롬시대를 여는 차세대 노광기술 High-NA EUV에 대해 [제작지원]](https://i.ytimg.com/vi/_-qMRcntUIk/hqdefault.jpg)](https://www.youtube.com/watch?v=_-qMRcntUIk)

설명 : 오늘 영상은 글로벌 반도체 장비기업 ASML에서 제작지원을 해주셨는데요. 채널 운영에 도움을 주셔서 감사합니다. ASML이 만들어 가는 반도체 기술 발전의 이야기들 앞으로도 응원하도록 하겠습니다. 구독자 여러분들께도 감사의 말씀 전합니다. 올 한해도 구독자님들 덕에 채널 운영해 나...

​

NA란? Numerical Aperture란?

HIGH NA EUV에서 NA는 Numerical Aperture(개구수)의 약자입니다. NA는 렌즈의 집광 능력을 나타내는 수치로, 렌즈의 크기와 관련이 있습니다.

NA 값이 클수록 더 작은 패턴을 그릴 수 있습니다. 이는 반도체 제조에서 매우 중요한 요소입니다.

​

반도체 공정에서 Resolution, 해상도(R)는 다음 공식으로 표현됩니다.

R = K1 × λ / NA

​

- R: 해상력

- K1: 공정상수

- λ: 파장

- NA: 개구수

​

![1](/assets/img/223579699747/1.png)

Reference: ASML​

​

​

노광 공정을 비용적으로 생산 할 수 있는 핵심 기술은, ASML과 ZEISS 그리고 imec가 갖고 있다고 볼 수 있습니다.

Overlay accuracy

OPC (Optical proximity correction)

Source

Seed

Optics

Lens anamorphicity

Stitching

reduced DOF (Depth of Focus)

EPE (Edge Placement Errors)

Multi patterning

Advanced resist and underlayer materials

Photomasks

Metrology techniques

Anamorphic imaging strategies

Integrated patterning

Etch techniques

​

![2](/assets/img/223579699747/2.png)

![3](/assets/img/223579699747/3.png)

​

ASML과 imec의 발표에 따르면, 최근 첫 번째 웨이퍼에서

"10nm 및 16nm width의 Line/Area(즉, 20nm 및 32nm pitch)를 각각 Metal-Oxide Resist(MORs)와 Chemitry Amplifer Resists(CARs)를 노출하여 성공. 이제 프로토타입 스캐너 및 인프라가 준비되었고, 2025-2026년 내에 대량 제조에 적용될 것으로 예상된다."

​

EUV light wavelength: 13.5nm

Resolution: 8nm

Projection optics: 0.55NA

Wafers per hour: >=185wph

![4](/assets/img/223579699747/4.png)

High NA EUV는 14A 세대 logic chips의 양산에서 처음 도입될 예정이며 메모리 반도체에서는 D0a DRAM에서 도입될 예정입니다. 24nm pitch의 metal lines/spaces (M0/M2)를 단일 노출로 패터닝할 계획인데... 인텔의 상황이 좋지 않아 어떨지 모르겠네요.

​

궁극적으로는 18nm pitch를 목표로 하며, 이를 통해 수율을 개선하고 사이클 타임을 단축할 뿐만 아니라, 기존의 멀티 패터닝 0.33NA EUV 방식에 비해 CO2 배출량을 줄일 가능성도 있습니다. 결국 complementary FET (CFET)-기반 칩의 복잡한 구조를 패터닝하는 데 중요한 기술로 자리잡을 것으로 예상됩니다.

​

High NA EUV는 단일 노출로 스토리지 노드 착륙 패드(storage node landing pads)와 비트 라인 주변(bit line periphery)을 이미징할 것으로 예상된다. D0a 2D-DRAM 기술 세대가 첫 번째 기회가 될 것이며, 이때 28nm의 center-to-center pitch가 요구될 것.

​

https://www.youtube.com/watch?v=YKnWaXc_sHI&t=79s

[![반도체 EUV 'High NA' 기술 원리를 알아봅시다 ①](https://i.ytimg.com/vi/YKnWaXc_sHI/hqdefault.jpg)](https://www.youtube.com/watch?v=YKnWaXc_sHI&t=79s)

설명 : 반도체 EUV 'High NA' 기술 원리를 알아봅시다 ①#EUV #HighNA #ASML[반도체 EUV 'High NA' 기술 원리를 알아봅시다 ②] 영상 링크https://youtu.be/ZBC7bkc3WyQ00:35 EUV-IUCC 한양대학교 EUV 산업협력센터 소개02:36...

https://www.youtube.com/watch?v=ZBC7bkc3WyQ&t=1s

[![반도체 EUV 'High NA' 기술 원리를 알아봅시다 ②](https://i.ytimg.com/vi/ZBC7bkc3WyQ/hqdefault.jpg)](https://www.youtube.com/watch?v=ZBC7bkc3WyQ&t=1s)

설명 : 반도체 EUV 'High NA' 기술 원리를 알아봅시다 ②#EUV #ASML #펠리클00:05 ASML과 TSMC가 펠리클을 만들 수 있는 이유01:21 펠리클의 개발 현황06:59 펠리클 소재와 그래핀09:05 멀티패터닝11:03 인텔의 High-NA 도입과 13:28 ASML에...

새 EUV 장비 들어오면, 새로운 TCAD... 새로운 디바이스 모델링... 새로운 Liberty 모델.. 새로운 Variation 분석 방법들 나오게 될 것.

 해시태그 : 