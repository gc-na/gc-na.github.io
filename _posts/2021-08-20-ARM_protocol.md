---
layout: post
title: AMBA protocol란? 암바 프로토콜 핵심 정리 AHB, ACE, APB, AXI, CHI
subtitle: What is AMBA protocol?
tags: [ASIC, SoC, AMBA, ARM, AHB, APB, AXI, CHI, ACE]
comments: true
---

프로세서, 주변장치, 메모리를 설계했다면 그 다음 차례는 회로간의 연결입니다. 이 연결을 규약(Protocol)한게 AMBA입니다.
AMBA는 ARM社의 Advanced Microcontroller Bus Architecture Protocol입니다.(굳이 직역하면 ARM사에서 규정하고 약속한 회로 연결 방법론)
Bus는 데이터나 메모리의 움직임을 결정하고, 클럭이 들어오면 동작합니다. Master는 읽기/쓰기를 Slave단에 허락하고, Slave는 이 명령에 맞게 실행됩니다.
여러개의 MASTER와 SLAVE가 얽히고 섥혀있어, SoC의 BUS에서 병목현상이 많이 발생해서, 이 부분은 각 모듈들에 라우터를 달아 연결한 형태인 'NoC'로 최적화를 합니다.(이 부분은 Network topology를 다뤄야해서, 나중에 NoC는 따로 다루겠습니다.)
AMBA는 SoC에서 고성능 16/32bit MCU, 신호처리 프로세서, 주변장치의 설계 표준입니다. (문서가 오픈 되어 있음. 로열티 없음.)
AMBA Bus Protocol은 저전력, 다중 마스터 지원, 높은 modularity(굳이 번역하자면, 교체나 업그레이드가 쉽다고 생각하면 됩니다.)의 장점을 갖고 있습니다.

AMBA의 종류는 AMBA5, 4, 3, 2, 그냥 AMBA가 있습니다. 다 각자의 장점이 있어서, 모든 프로토콜 다 쓰입니다.
AMBA Protocol은 첫번째 버전으로, Advanced System Bus (ASB)와 Advanced Peripheral Bus (APB)가 있습니다.
![APB](/assets/img/APB.png)
- APB (Advanced Peripehral Bus) : 주변장치를 제어 할 수 있음. 단순함. 낮은 주파수, 저전력이고, 저속이고 대량의 주변장치를 제어할 때 쓰입니다. Sel input이 1이고, clk가 rising edge거나 enalbe이 1일때 Write합니다.(저전력에서 자주 써요.)
- ASB (Advanced System Bus) : APB보다 전력, 주파수가 높고 고속, 파이프라인, 다수의 버스 마스터, 데이터 모았다가 연속 전송 기능.(ASB는 양방향 버스구조라서, 이후에 다중 버스로 바뀐 AHB가 쓰이게됩니다..)


AMBA2
![System](https://slidetodoc.com/presentation_image_h/9ecb09502a122820e0a277770a9d9232/image-5.jpg)
- AHB (Advanced High-performance Bus) : ASB의 업그레이드 버전이라고 생각하면 됩니다. ASB의 기능을 포함하고, ASB는 양방향 버스여서 병목현상이 발생했지만, 버스를 여러개로 나누어서 데이터 교환이 더 빠르게 일어납니다. 어떤 Bus의 Master를 써야하는지 중재해주는 Arbitor(중재기)가 있어요. 또, 각 신호의 주소를 해독하는 단일 디코더가 필요해요. 마스터와 슬레이브는 16개 까지만 권장됩니다.)
(AHB는 자동차의 ECU(Engine Control Unit), 아두이노 보드, 전투기 항전 등 Cortex-M, ARM7, ARM9 프로세서의 프로토콜로 정말 많이 쓰입니다.)
(하지만 고속 장치와 저속의 장치들이 다수 있으면, 고속 장치가 저속장치를 기다리느라 느려지는 문제 때문에 다중 장치 사용시에는 AMBA3의 AXI를 사용합니다.)
![AHB](https://www.researchgate.net/profile/Steve-Schneider/publication/221004353/figure/fig5/AS:305484520280080@1449844593902/An-example-AHB-system-with-one-master-and-one-slave.png)
-AHB 과정-
(1) Master가 Arbiter에게 HBUSREQ 신호 입력
(2) Arbiter는 버스를 써도 되면 HGRANT에 신호 입력
(3) Master는 Arbiter에게 HLOCKx 신호 입력.
BUS사용중에 다른 Master가 HBUSREQ신호를 입력하면, Arbiter의 Policy에 따라 Priority가 높은 Master에게 Bus 사용 허가.
(4) HGRANT 받은 Master는 접근하고자 하는 Slave의 주소를 HADDR를 통해 Decoder로 전송. (Address phase)
(5) Decoder가 HSELx 신호를 해독후, 해당 Slave에 날려줍니다. (Address phase)
(6) Slave 동작
(7) Write하겠다는 HWRITE(1이면 WRITE, 0이면 READ) 신호를 1으로 Slave에 전송 (Data phase)
(8) Slave는 데이터 전송 준비되면 HREADY(1이면 READY, 0이면 WAIT)신호를 입력 (Data phase)
(9) HWDATA에 data 전송 (Data phase)

AHB는 4개의 전송형태를 갖습니다. HTRANS [1:0]
00 - IDLE : Master가 전달할 Data가 없다고 알리는 상태.
01 - BUSY : 전송 중간에 다음 Cycle로 넘어갈 수 없을 때 시간 연장이 필요하여 IDLE 상태로 놓는 것.
10 - NONSEQ : 단일, 혹은 Burst 전송의 시작
11 - SEQ : Burst 전송시 전 값과 연달아 전송

- ASB (Advanced System Bus)
- APB (Advanced Peripheral Bus)

AHB는 4개의 반응형태를 갖습니다. HRESP [1:0]
00 - OKEY : 정상
01 - ERROR : 오류
10 - RETRY : 재시도
11 - SPLIT : 하다가 멈췄지만, 재시작 가능. 어디서 끝났는지 기억을 함.

AHB는 8개의 Burst 형태를 갖고, WRAP이냐 INCR이냐로 나뉩니다. HBURST [2:0]
INCR는 개수에 맞춰서 모아서 전송하는 형태이고,
WRAP은 개수도 맞추고, Address Boundry도 맞춰서 전송합니다. 뭔말이냐면, 내가 10~20 address boundry를 갖는다면, 20의 다음 주소로는 10이 오게됩니다.

![Bridge](https://t1.daumcdn.net/cfile/tistory/143F30124B233B1C6D)
SoC가 하나의 프로토콜로 구성되는건 아니고, 저속으로 해도 되는 부분은 저전력의 프로토콜을 쓰고, 고속으로 해야하는 부분은 고속 프로토콜을 사용합니다. A 프로토콜에서 B 프로토콜로 넘어가기 전에 속도(프로토콜)을 바꿔주는 곳이 Bridge입니다.


AMBA3
- AHB-Lite : 단일 Master. 그래서 Arbitor나 Grant가 없습니다. 단순함.
- AXI (Advanced eXtensible Interface) : 채널(Slave단의 WRITE DATA CHANNEL, WRITE ADDRESS CHANNEL, WRITE RESPOSE CHANNEL / Master단의 READ DATA CHANNEL, READ ADDRESS CHANNEL) 도입으로 독립하여 작동하여 다수의 저속, 고속 장치가 함께 있더라도, AHB보다 더 빠르게 정보를 전달할 수 있다.
AXI처럼 채널이 나누어진 Protocol은 DATA, CONTROL INFORMATION을 전송하기 위해 Handshake라는 과정이 필요해요.
신호를 입력하는 쪽이 Source가 부르고, 받는 쪽을 Destination이라고 불러요. Master만 신호를 보낸다고 오해할 수 있는데, Slave 또한 신호를 보낼 수 있습니다.
Source가 준비되면, Valid 신호가 1이 됩니다. Destination이 준비되면 Ready가 1이 됩니다.
(아이폰 4S, 아이패드2, Galaxy S3의 AP에 쓰였어요. Cortex A-9 아키텍쳐의 프로토콜입니다.)
- APB (Advanced Peripheral Bus)
- ATB (Advanced Trace Bus)


AMBA4, 5부터는 제가 자세히 다루고싶은 내용이라 나중에 AMBA4, 5는 따로 설명해드리고, 이 글에선 간단히 정리하겠습니다.
우선 ARM 홈페이지(https://developer.arm.com/architectures/system-architectures/amba)에서 나온 핵심 프로토콜은 아래와 같습니다.
![APB](/assets/img/arm_amba.PNG)
무료라는게 눈에 띄네요. 그리고 기업에서도 보통 개발자에게 위 5개 프로토콜에 대한 이해만 요구합니다.

AMBA4
- ACE (AXI Coherency Extensions) widely used on the latest ARM Cortex-A processors including Cortex-A7 and Cortex-A15
(갤럭시 S4, S5의 저가형 모델에 A7 아키텍쳐에. 갤럭시 노트3, 크롬북 등에 A15아키텍쳐에 ACE protocol이 쓰였습니다.) 
- ACE-Lite (AXI Coherency Extensions Lite)
- AXI (Advanced Extensible Interface 4)
- AXI-Lite (Advanced Extensible Interface 4 Lite)
- AXI-Stream (Advanced Extensible Interface 4 Stream)
- ATB (Advanced Trace Bus)
- APB (Advanced Peripheral Bus)

AMBA5
- ACE (AXI Coherency Extensions 5)
- AXI (Advanced Extensible Interface 5)
- AXI-Lite (Advanced Extensible Interface Lite)
- AHB (Advanced High-performance Bus (AHB5, AHB-Lite)
- CHI (Coherent Hub Interface (CHI)
(갤럭시 S21의 A55나 갤럭시 노트10에 들어간 A76 아키텍쳐에 CHI 프로토콜이 쓰였습니다.)
- DTI (Distributed Translation Interface (DTI)
- GFB (Generic Flash Bus (GFB)


 이 글은 ARM Userguide, ARM Developer website를 참고해 작성했습니다.
