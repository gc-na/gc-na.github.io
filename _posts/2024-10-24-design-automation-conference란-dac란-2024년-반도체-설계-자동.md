---
published: true
---
## Design Automation Conference란? DAC란? + 2024년 반도체 설계 자동화 동향

그동안 IEEE와 Arxiv 논문만 소개한 것 같아, DAC에 대해 소개해보려고 합니다.

DAC(Design Automation Conference)는 반도체 설계 자동화 분야에서 가장 권위 있는 학술대회 중 하나입니다.

NVIDIA, Samsung, Intel 등 세계적인 반도체 기업이 참여합니다.

그렇기 때문에 VLSI 설계에 대해 각 회사들이 어떤 연구를 하고 있는지 같이 볼 수 있죠.

![3](/assets/img/223468066786/3.png)

![4](/assets/img/223468066786/4.png)

60년 동안 DAC의 5분 정리 영상인데, 시간 되면 함 보시죠 ㅎㅎ

https://youtu.be/qGwMsJgVeJs?si=6S8Yi_PTZPJkjgDk

[![Celebrate 60 Years of the Design Automation Conference (DAC)](https://i.ytimg.com/vi/qGwMsJgVeJs/hqdefault.jpg)](https://youtu.be/qGwMsJgVeJs?si=6S8Yi_PTZPJkjgDk)

설명 : Learn how DAC has influenced the semiconductor ecosystem over the last 60 years.

최근 인공지능, 특히 딥러닝 기술의 비약적인 발전으로 VLSI 설계 자동화 분야에도 큰 변화의 바람이 불고 있습니다. 다음과 같은 주제들이 활발히 논의되고 있습니다.

​

https://61dac.conference-program.com/

[Full Program](https://61dac.conference-program.com/) : Full Program Full Program · Contributors · Organizations · More… Powered by Linklings

6월에 발표하는 내용들이고, 요약하면 아래와 같습니다.

![5](/assets/img/223468066786/5.png)

1. Machine Learning 기반 회로 설계, 검증 최적화

전통적인 VLSI 설계 최적화 문제에 기계 학습 기법을 적용하여 더 나은 솔루션을 찾는 연구.

특히 강화학습 등의 기법이 Physical Design 분야에서 많이 쓰이는듯.

1.1 양자화, 희소성, 압축 등을 활용한 모델 경량화

회로설계에 사용되는 딥러닝 모델의 높은 연산 복잡도를 줄이기 위한 다양한 경량화 기법들이 발표되었습니다. 가중치 및 활성화 값의 양자화, 모델 가중치 행렬의 희소성 활용, 모델 압축 등의 기술

1.2 모델 및 데이터 구조 최적화

모델 내 연산 패턴과 데이터 구조를 분석하여 이를 효율적으로 맵핑하는 기법들에 대한 연구

​

2.Generative AI를 활용한 RTL 코드 생성

최근 주목받고 있는 대규모 언어모델과 같은 생성형 AI 기술을 활용하여 디지털 논리 회로 코드를 자동으로 생성하는 연구.

​

3. 인공 신경망 모델 가속화를 위한 하드웨어 최적화 방법론

딥러닝 모델의 고성능 실행을 위한 전용 하드웨어 가속기 설계에 관한 연구들이 다수 소개되었습니다. 특히 저전력, 고효율의 하드웨어 최적화 기법들이 중점적으로 다루어졌습니다.

​

4. 뉴로모픽 컴퓨팅

인공지능과 사물인터넷(IoT) 기술의 발전에 따라 에지 디바이스에서의 실시간 인텔리전스 구현 필요성이 높아지고 있습니다. DAC 2024에서는 뉴로모픽 컴퓨팅과 에지 인텔리전스를 위한 회로 및 아키텍처 설계 연구들이 주목받았습니다. 낮은 전력과 면적 제약 하에서 높은 에너지 효율을 달성하는 것이 주요 과제입니다.

​

5. 퀀텀 컴퓨팅 회로

차세대 컴퓨팅 패러다임으로 주목받고 있는 퀀텀 컴퓨팅 분야에서도 다양한 연구 결과들이 발표되었습니다.

퀀텀 비트 및 게이트 회로 설계, 오류 정정 기법, 퀀텀 가속기 아키텍처 등에 관한 연구.

​

6. 프로세싱-인-메모리(PIM) 및 인-메모리 컴퓨팅

데이터 이동 병목 현상을 해결하기 위한 PIM과 인-메모리 컴퓨팅 기술에 대한 연구도 활발히 이루어지고 있습니다.

​

7. 이종 통합 및 재구성 가능 아키텍처  

다양한 기능의 IP를 통합하는 SoC 설계와 더불어, 서로 다른 공정으로 만들어진 다이를 패키지 수준에서 통합하는 치플릿 기반 이종 통합에 대한 관심도 높아지고 있습니다. 이와 관련된 설계 방법론과 EDA 도구 기술 발표.

​

8. 보안 및 안전성 이슈

하드웨어 보안 위협과 대응 기술

Hardware trust, reverse engineering attack, sub channel analysis..

자율주행 및 안전 필수 시스템의 안전성 보장

​

![6](/assets/img/223468066786/6.png)

​

앞으로 시간 있을 때 최신 논문들을 가볍게 읽어보고 블로그에서 공유하려고 합니다.

DAC 외에도 VLSI 분야의 최신 연구 동향을 파악할 수 있는 주요 학회와 리소스들이 있습니다.

Arxiv 논문들은 반도체 레벨보다는 소프트웨어 레벨이 많구요.

​

1. ICCAD (International Conference on Computer-Aided Design)

   - DAC와 함께 VLSI CAD/EDA 분야에서 가장 권위 있는 학술대회

   - 회로 설계, 물리 설계, 검증, 테스트 등 다양한 주제 다룸

​

2. IEEE Transactions/Journal 

   - IEEE Transactions on CAD 

   - IEEE Transactions on Computers

   - IEEE Journal on Emerging and Selected Topics in Circuits and Systems

​

3. 주요 반도체 회사 세미나 및 키노트

Synopsys SNUG

Samsung SAFE

...

​

이외에도 특정 분야 심포지엄, 워크샵, 기술 표준화 단체 활동 등을 통해 연구 동향을 파악할 수 있습니다. ㅎㅎ

 해시태그 : 