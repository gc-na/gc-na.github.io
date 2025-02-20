---
published: true
---
## DFT: Wrapper Chain이란? INTEST란? EXTEST란? IEEE1500란? 대형 Chip을 위한 SoC 테스트 기법

대표적인 DFT 기법은 SCAN Methodology입니다.

DFT와 SCAN에 대해 알고 오셔야 이 글을 이해하실 수 있습니다.

​

IEEE1500이란?

- IEEE Std 1500™은 임베디드 설계 블록에 대한 독립적인 모듈식 테스트 개발 및 테스트 애플리케이션을 위한 확장 가능한 아키텍처를 정의하고 이러한 코어를 둘러싼 외부 로직을 테스트할 수 있도록 지원합니다.

- Module level test는 일반적으로 메모리와 같은 임베디드 블록과 사전 설계된 Integration 불가능한 임베디드 IP Core에 대한 Requirements입니다. 

- IEEE 1500 아키텍처는 큰 설계를 관리하기 쉬운 크기의 작은 블록으로 분할하고 하나의 시스템 온 칩(SoC) 설계에서 다음 설계로 재사용되는 블록에 대한 테스트 재사용을 용이하게 하는 데에도 사용할 수 있습니다.

참고로 다양한 IP에서 Wrapper를 위해 IEEE 1450.6 (Core Test Language, CTL)로 구현을 해놓았습니다.

![0](/assets/img/223350612231/0.png)

​

SCAN 설계 과정을 요약하면,

모든 D Flip Flop이 SD Flip flop으로 변환되고 (scan insertion)

모든 SDFF들이 SCAN Chain 형태로 이어지고 (scan stitching)

-> 스캔 체인 네트워크로 연결되어 있는 SCAN Testing 가능한 디자인으로 디자인을 변환하는 것입니다.

​

근데 AI Chip들은 엄청나게  복잡하고, Flip flop count도 엄청나게 많습니다.

그래서 "계층 설계"를 하죠. DFT도 마찬가지입니다. DFT도 디자인 크기 때문에 Hierarchical DFT를 합니다. (크기 때문에 / 전력 소비 때문에 / 체인 복잡성 때문에...)

​

이 글에서 Hierarchical DFT 구현을 위한 대표 방법론인 SCAN Wrapper를 소개해보고자 합니다.

​

Wrapper Chain이란?

Warpper Chain은 Logically boundary cell들을 둘러싸는 모양의 Chain입니다.

아래는 DFT에서 SCAN Logic에 값이 Shifting 되는 과정입니다.

​

(1) 4개의 Flipflop에 4개의 Input value를 넣었을 때, 평균 toggle ratio가 (3+3+3+2)/4 = 2.75입니다. 50%넘는 Toggle ratio가 나와요.

![1](/assets/img/223350612231/1.png)

근데 실제 "Chip의 기능 동작(Mission mode)"에서는 Clock/Power Gating도 있고, 여러가지 저전력 설계 기술을 넣어놨기 때문에 Toggle ratio가 SCAN Shift보다 훨씬 낮은 값으로 들어갑니다.

Mission mode에서는 동작을 했는데, Shift mode에서는 toggle ratio가 높아서 Dynamic power에 대한 문제가 발생하고, DFT를 하려다가 칩을 오히려 파괴시킬 수 있는 상황도 발생 할 수 있습니다.

(2) IP 같은 경우엔, 사실 DFT Engineer들이 모든 IP를 전부 다 세세히 이해하기 힘들어요. 그런데 모든 IP를 한번에 엮는다? 이거 디버깅이 쉽지 않을 수도 있습니다.

(3) Chip level에서 flatten하게 SCAN을 엮으면, Synthesis level에서 Optimization 결과는 좋을 수도 있어요. 그러나 SCAN과 ATPG 및 Simulation의 Runtime이 결코 짧지 않을겁니다.

(4) 1,2,3 같은 것만 생각하면.. 아예 각 계층 설계의 DFT 관련 I/O를 Chip PAD에 직접 연결하는 방법도 고려 할 수 있겠지만 이것들은 Chip 제조 공정 비용을 올리는 문제가 됩니다.

​

Wrapper Chain은 Core의 Boundary를 둘러싼 SCAN Flip flop에 의해 형성됩니다.

이 Wrapper mode는 IEEE 버전에 따라 다양한 config가 있지만, 이 글에선 핵심 파트인 INTEST Mode와 EXTEST Mode만 살펴보려고 합니다.

​

How it helps testing?

많은 Wrapping core가 SoC에 통합된 경우,

특정 타임에는 어떤 블록에 대해 SCAN Testing을 할 것이고, 어떤 Block들을 SCAN shifting에서 제외 할 것인지 정할 수 있습니다.

​

Wrapper Cell은 아래처럼 생겼습니다.

![2](/assets/img/223350612231/2.png)

![3](/assets/img/223350612231/3.png)

위와 같은 Wrapper cell이 아래처럼 구성되는겁니다.

이런 Wrapper cell이 단일 Core level에선 아래처럼 구성이 되고,

![4](/assets/img/223350612231/4.png)

Chip level에서 여러가지 wrapping core를 Intergration하면 아래와 같은 그림이 되는겁니다.

![5](/assets/img/223350612231/5.png)

INTEST Mode: Core internal test mode

Input Wrapper Chain은 내부 로직으로 데이터를 시작하고,

Output Wrapper Chain은 내부 로직에서 데이터를 캡처합니다.

​

External data는 격리되어있습니다.

그로써, Input 및 Core block은 Shift mode에 있고, Output 및 코어 셀은 캡처가 허용됩니다.

![6](/assets/img/223350612231/6.png)

EXTEST Mode: Core Extest mode

Output Wrapper chain은 외부 로직으로 데이터를 실행하고 입력 래퍼 체인은 외부 로직에서 데이터를 캡처합니다.

출력 Wrapper cell은 shift 모드에 있고, 코어와 입력 셀은 캡처할 수 있습니다.

![7](/assets/img/223350612231/7.png)

이외에도 SAFE Mode, Parrallel execute mode 등이 있습니다.

그리고 위 Wrapper를 구동시키려면 SPF/STIL이라는 포맷으로 파일을 생성해줘야 Pattern generation, Simulation, ATE Testing도 되는거구요.

 해시태그 : 