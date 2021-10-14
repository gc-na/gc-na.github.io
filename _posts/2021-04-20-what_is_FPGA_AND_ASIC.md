---
layout: post
title: FPGA, ASIC 차이, SoC, NoC, ASSP 등 개념 핵심 정리 (주문형 반도체 / 범용반도체 / 특수용도 반도체) FPGA、ASIC区别、SoC、NoC、ASSP等概念核心总结（定制半导体/通用半导体/专用半导体）
subtitle: #FPGA #ASIC #SoC #ASSP #DIFFERENCE #差异
tags: [FPGA, ASIC, SoC, ASSP]
comments: true
---

![M1](https://www.apple.com/newsroom/images/product/mac/standard/Apple_new-m1-chip-graphic_11102020_big.jpg.large.jpg)

2020년 애플에서 자체 SoC로 개발한 M1 Chip을 탑재한 맥 제품들을 발표했습니다.

기존 제품과 다른 점이... 빠르고! 오래가고! 가볍다!라는 장점이 있는데, 단점으로는 맥북을 받고나서는 사용자가 메모리 추가를 못한다는 점이에요.


SoC는 System on Chip입니다. 한 칩에 다 올려!


- 우리가 사용한 기존의 PC, 노트북은 Non SoC입니다. 우리가 PC를 살 때에는 CPU 고르고, RAM 고르고, SSD 골라서 조립을 했죠!

- SoC는~ 이런 것들(제어장치, 연산장치 등)을 한 칩에 구성한거에요. 그래서 전체 크기가 더 작아지고, 이동 거리가 짧아지니 더 빨라지고 전력 효율도 좋아졌어요.

- SoC가 Non SoC보다 빠르고, 전력 효율이 좋고, 가볍다는 장점들 때문에 애플을 시작으로 반도체 시장 전체가 SoC로 가고 있어요.

- NoC는 SoC의 일종입니다. 디지털 회로에서는 데이터 교환을 위해 길이 필요한데, 이를 BUS라고 합니다. 칩이 집적화된 SoC의 경우에는, BUS 병목현상이 일어납니다. 컴퓨터의 네트워크인 인터넷처럼, 칩내 모듈마다 라우터를 달아주고, 각 라우터들이 연결된 형태로 칩이 만들어집니다. SoC에도 저전력이 중요하지만, NoC에서는 더 중요하게 여기는 부분입니다.


SoC 안에는 다양한 전자회로로 구성되요. "입력 2개 모두 1이 들어올 때에만 출력에 1을 보내줘. " 이런 기능을 만들고싶다면, SoC 안에 그런 논리회로가 구현되어야 작동을 합니다.

​

이런 SoC를 만들 때는 현대에 가장 핫한 두가지 방법이 있어요. FPGA와 ASIC입니다.

​

![M2](https://cryptoage.com/images/Mining3/TOPmining/apple_m1_hashrate_randomx.jpg)


FPGA는 Field Programmable Gate Array입니다. 계속 칩의 기능을 바꿀 수 있는 칩!

- FPGA에는 다양한 회로들이 빽빽하게 들어가있어요. 우리가 프로그래밍해서 칩에 넣어주면, 그 프로그램대로 칩의 내부가 변경됩니다.

- FPGA는 비싸요. 수정이 자주 필요한 작업에 적합하기 때문에 신기술이 필요한 분야에 많이 쓰여요. (AI, 방산, 우주산업 등)

​

![M3](https://upload.wikimedia.org/wikipedia/commons/f/f9/%EC%95%8C%ED%85%8C%EB%9D%BC_%EC%82%AC%EC%9D%B4%ED%81%B4%EB%A1%A02_FPGA.jpg)

ASIC은 application specific integrated circuit에요. 맞춤형으로 쓸 수 있는 주문형 반도체입니다.

​

ASIC은 우리가 원하는 소자와 기능만 담아서 만든 Chip이에요.

- ASIC은 FPGA보다 싸고, 빠르고, 전력 효율이 더 좋아요.

- ASIC은 chip이 완성되면 수정이 힘들어요. 그래서 ASIC을 만들 때에는 철저하게 검증을 해야해요. 즉, 초기비용이 많이 들어요.

- 기존에는 cpu회사, D램 회사, SSD 회사, 통신 회사가 다 분리되어있는데, 이런 ASIC Chip을 만들려면, 모든 회사의 기술력과 기술 인력이 한 곳에 집중 되어야한다. (그래서 돈 많은 애플이 PC시장에 SoC를 시작 할 수 있었던거구요. 전문가들은 한국도 회사들이 M&A를 통해 통일된 ASIC 회사로 발전해야한다고 말하고있습니다.)

​

Full custom ASIC, 완전 주문형 반도체는 이 Chip 내부 회로(cell과 gate라고 불리는 논리 소자들) 다 최적화를 한 ASIC입니다. Semicustom ASIC은 내부 최적화는 안된거에요! 

​

여기까지가 최근에 가장 핫한 내용인 FPGA와 ASIC이고, 아래는 과거부터 지금까지 많이 쓰이는 반도체에 대해서 이야기할거에요.


![M1 SoC](/assets/img/m1CHIP.png)

ASIC처럼 Chip 내부에 회로는 완성되어있지만, 다양한 상황 및 기능에 쓰이는 반도체는 '범용 반도체'라고 불려요.

범용 반도체는 완전 범용과 부분 범용 반도체로 나눠져요.

​

범용 반도체는 General Purpose IC에요.

밥솥의 연산제어장치(MCU)는 세탁기나 에어컨에도 쓰일 수 있어요.  가전제품 만드는 회사는 '세탁기용 제어장치, 에어컨용 제어장치' 이런식으로 따로 설계 할 필요 없이, 시중에 파는 MCU를 사와서 쓰면 됩니다.

​

ASSP는 Application Speccific Standard Product에요. (국내에선 특별용도 반도체라고 불려요.) ASSP는 ASIC을 표준화했다고 생각하시면 됩니다. .

ASSP를 설명하기 위해 예시를 들겠습니다.

디지털은 1과 0으로 표현되는데요. 우리가 듣는 음악의 mp3파일은 1과 0의 조합을 압축한 형태에요. 1이나 0이 들어올 수 있는 한 칸의 크기를 1비트라고 하는데, 128kbps음악의 경우엔 1초당 100만 비트 이상의 정보가 들어오게됩니다. 이 디지털 값을 아날로그 형태로 바꿔주는걸 DAC(Digital to Analog Converter)라는 회로가 해요. 이 DAC는 스마트폰에도, 컴퓨터에도, 태블릿에도 들어가요. 스마트폰 속 5G 통신 칩도 ASSP의 좋은 예입니다.

- 표준화된 형식을 처리하는 표준화된 반도체

- 표준화되어 범용 반도체처럼 다양한 곳에 쓰이긴 하지만, 범용 반도체는 mp3파일처럼 표준화된 형태가 없습니다.

​

​

​

​

​

특징만 정리하면,

FPGA - 계속 프로그래밍 수정이 가능하다. 비교적 느리고 전력이 더 들고, 비싸다.

ASIC (주문형 반도체) - 가장 효율적이고 (빠르고 가볍고 저전력) 대량생산시 저렴하다. 초기비용이 많이 든다.

General Purpose IC (범용 반도체) - 이곳 저곳에 쓸 수 있다. 초고성능이 필요한 분야에서는 안 씀.

ASSP (특별용도 반도체) - 표준화를 해서 이곳 저곳에 쓸 수 있게 만들었다.
