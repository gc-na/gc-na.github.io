---
published: true
---
## CMOS2.0이란?, IMEC, - Dense pitch Cu hybrid bonding- Cu Hybrid bonding- dielectric bonding, Chiplet

이번 포스팅에선 CMOS 2.0에 대해 알아보겠습니다.

​

기술 혁신의 속도가 점점 빨라지면서 전자 기기에 대한 요구가 그 어느 때보다 다양하고 복잡한 시대로 접어들었습니다.

현대 전자제품의 기반이 되는 CMOS 반도체 기술을 중심으로 성장해왔습니다. 이 CMOS 반도체는 무어의법칙을 따라 2년마다 2배씩 집적도가 높아지며 발전해왔는데요.

![0](/assets/img/223327960421/0.png)

1) 5nm, 4nm, 3nm 시대에 오면서... 이 가능은 한데, 이 공정의 수율이 너무 낮아 양산을 하면 대다수가 불량 칩이고, 이렇게 되면 결국 "미세공정의 비용 문제"가 발생합니다.

2) 어느순간 갑자기 AI가 일반인들에게 직접 보급되었습니다. 기업은 서로 더 좋은 AI를 만들고 싶은데, 이게 이론적으론 가능한데... 이 컴퓨팅을 받쳐줄 반도체가 없습니다.

3) AI 반도체의 전력 소모가 너무 큽니다.

https://youtu.be/AGIwLrxnCVA?si=A0MpO8rs1jTW6Qqy

[![챗GPT 전기요금만 1조원 든다 (리벨리온 박성현 대표)](https://i.ytimg.com/vi/AGIwLrxnCVA/hqdefault.jpg)](https://youtu.be/AGIwLrxnCVA?si=A0MpO8rs1jTW6Qqy)

설명 : 👉중국 전문가 이철 박사의 섬뜩한 경고. “달라진 중국 달라질 중국” https://apps.3protv.com/3pro/home/lecture/159👉3분만에 글로 읽는 삼프로TV 하이라이트. https://contents.premium.naver.com/backbri...

-> 결국, CMOS에 혁신이 필요한 때가 되었습니다. 성능도 높이고, 전력도 낮출 방법이 필요합니다.

좀 더 쉽게말하면,

SW시장에서 반도체에 요구하는 것은, "시간당 처리량을 높여야하고, 전력당 처리량도 높여야한다."

반도체 공정엔지니어들은, "미세공정 할 수는 있는데, 수율과 장비 수급 문제 때문에 가격이 너무 비쌉니다."

​

결국 CMOS 2.0으로 갑니다. 제가 imec에서 스터디한 CMOS 2.0를 소개드립니다.

​

CMOS 2.0란,

CMOS 2.0은 여러 개의 3D 적층 레이어를 트랜지스터 레벨에 적용하는 것입니다. 3D라는 컨셉 자체는 HBM이나 3D Packaging과 비슷하지만, 칩레벨이 아닌, FET Level에서 쌓는거죠.

![1](/assets/img/223327960421/1.png)

​

지금 연구되고 있는 CMOS 2.0의 핵심을 좀 더 살펴보면, (앞으로 더 나올 것임. 추후 포스팅에서 계속하겠습니다.)

- Dense pitch Cu hybrid bonding

- Cu Hybrid bonding

- dielectric bonding

- Chiplet integration

- wafer back-side processing

같은 새로운 고급 2.5D 및 3D interconnect 기술을 활용합니다.

​

CMOS 2.0을 사용하면 단거리 interconnect에는 low-capacitance, low-drive transistors를, 장거리 interconnect에는 high-drive transistors를 별도의 레이어에 사용하고, 

이런 방식으로, 공정 미세화가 둔화되어 같은 공정 레벨이더라도, 더 좋은 Performance, Power를 갖게 만드는거죠.

​

이러한 변화는 쉽지 않을 것입니다. EDA 툴이 급격하게 진화해야 하고(어쩌면 기존의 EDA에 사용되는 입력 파일 양식으론 충분하지 않을거라는 생각이 듭니다.), 파티셔닝의 복잡성을 해결해야 하며, 열 관리에 대해 다시 생각해야 합니다.

​

이후 포스팅에서 CMOS 2.0의 핵심 기술에 대해 살펴보겠습니다.

 해시태그 : 