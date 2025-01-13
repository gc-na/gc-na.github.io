## 엔지니어가 정리하는 2024 반도체 테마 총정리 2나노, 온디바이스, UCIe, 테라비트, RISC-V Serdes, CXL, HBM

반도체 업종 종사하시는 분들은 다들 아시겠지만, 2024년부터 2나노 공정 양산이 시작됩니다.

올해에 tsmc N2, intel 18A 공정이 발표 될 예정입니다. tsmc는 N3E와 함께 N2 공정도 순조롭게 개발되고 있다고합니다.

![0](./asset/0.png)

2nm 공정

예전에 얘기드렸던대로, 미세공정에서 가장 많은 시간이 걸리는 부분은 마스크에 빛을 쪼이는 "노광 공정"입니다. 아무리 다른 공정에서 효율성을 높였다고 해도, EUV 장비 없으면 2nm 하기 힘듭니다. 노광에서 다 밀릴겁니다.

중국이 7nm 공정까지 DUV를 했다하더라도, 캐논이 스탬핑 공정을 만들었다고 하더라도, 2nm 공정 하려면 ASML의 EUV 장비 필요합니다.

​

![1](./asset/1.png)

패키징 기술과 UCIe

![2](./asset/2.png)

![3](./asset/3.png)

과거엔 휴대폰이든 CCTV든 반도체 칩은 비교적 단순했습니다. 왜냐하면, 우리가 예전엔 폰으로 복잡한 작업을 하지 않았어요.

그런데 지금은 초고화질 동영상도 봐야하고, Computer Vision (스마트폰 사진 보정 App, CCTV에서 얼굴 인식 시스템),  휴대폰에서 고화질 영상도 실시간으로 봐야합니다.

-> 이게 그냥 되는게 아니라, 많은 Pixel의 그래픽을 빠르게 처리 할 수 있어야해요. 그러면 반도체가 더 병렬적으로 처리 할 수 있어야하고, 크기가 커지게 됩니다.

칩이 커지게되면, 칩에 불량이 생길 가능성이 높습니다. 그래서 칩 크기를 자잘하게 쪼개고, 패키징을 잘 붙이는게 중요합니다.

​

​

온디바이스

2024년부터는 "On device AI" 온디바이스 엣지형 반도체가 대세가 됩니다.

2023년까지는

사용자들이 데이터를 입력하면, 그 데이터가 기업의 데이터센터에 가고, 데이터센터에서 처리한 데이터를 사용자에게 보냈습니다.

못 느끼셨겠지만, 번역기, 아이폰의 시리 같은 것들이 다 이런식으로 동작을 합니다.

![4](./asset/4.png)

앞으로 온디바이스 AI가 되면, 디바이스 안에서 처리가 되기 때문에 사용자 입장에선 훨씬 빠르게 처리된다고 느낄 수 있습니다.

온디바이스 AI가 탑재되고, 응용프로그램이 개발된다면... 스마트안경에서는 실시간으로 AI가 알려줄 수도 있고, 스마트이어폰에서는 실시간으로 외국어를 한국어로 번역해줄 수도 있습니다.

​

​

테라비트 이더넷

에서는 대기 시간을 줄이기 위해 기술이 어떻게 더 빠른 데이터 도관을 필요로 하는지, 에지에서 무엇이 바뀌고 있는지, 그리고 그 이유를 설명합니다.

자동차의 LPDDR 플래시에서는 자동차 설계의 새로운 영역 컨트롤러와 이를 수용하기 위해 메모리 아키텍처를 전환해야 하는 이유를 자세히 설명합니다.

​

​

Network on Chip (NoC)

에서는 NoC 영역을 축소하고 보안을 개선하며 출시 시간을 단축하는 방법을 살펴봅니다.

Die-To-Die Security는 이기종 통합이 보안에 미치는 영향, 멀티 테넌트 데이터 센터에 어떤 위험이 있는지, 미션 크리티컬 및 안전이 중요한 시장에서 칩의 예상 수명이 늘어남에 따라 어떤 일이 발생하는지 자세히 알아봅니다.

센서 및 감지에 대한 새로운 접근 방식은 복잡한 전력 관리, 레이더, 증가하는 지능, 그리고 향후 사용될 장소와 방법을 포함하는 센서에 대한 새로운 시장을 다룹니다.

테스트에 보안 추가에서는 장치가 노후화되면 어떤 일이 발생하는지, 구성 가능한 보안 분석을 내장하라는 요구가 있는 이유, 그리고 이 새로운 기술을 사용하여 사용자에게 사이버 공격을 경고하는 방법을 설명합니다.

우주용 칩 설계에서는 엄청난 온도 변화와 방사성 입자 증가로 인해 단일 이벤트 장애, 과도 현상, 기능 중단 및 래치업이 발생할 수 있는 방법과 문제가 발생한 후 문제를 해결하는 데 필요한 사항에 대해 설명합니다.

시스템 및 디자인

​

​

RISC-V

영국의 ARM의 점유율을 빼앗으며 올라오고 있는 미국의 오픈소스 하드웨어 설계.

아이러니하게도, 미국이 만들고 오픈소스로 공개했는데 가장 많이 사용하는 것은 중국.

오픈소스로 설계 IP를 공유해놓았다보니.. 중국 + 전세계 학교 + 스타트업을 중심으로 엄청나게 빠른 성장 중.

오픈소스 플랫폼 Github에 RISC-V로 Tape out 된 많은 CPU들이 공개되어있다.

​

AI와 EDA

AI가 EDA에 쓰인건 거의 10년 가까이 되었고, 양산 Chip에서도 AI가 사용이 되고 있다.

![5](./asset/5.png)

그러나 2022년까지는 일부 Chip들이 AI의 도움을 받았다면, 2024년 기점으로 대부분의 반도체가 AI의 도움을 받을 것으로 예상 됨. 현재 EDA에서 회로 설계 최적화, ATPG, Library Characterization, STA, DFM 등 엄청나게 많은 분야에 AI가 함께하고 있다.

​

Serdes, HBM과 CXL

이거는 2023년의 대세 이어 갈 듯.

HBM, CXL도 여전히 느리다고 더 빠른거 필요하다는 세상인데.. 그나마 이게 제일 대역폭이 높아서 ㅜㅜ

 해시태그 : #High-NA EUV