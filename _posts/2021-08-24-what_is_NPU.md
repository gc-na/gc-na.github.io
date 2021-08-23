---
layout: post
title: NPU란? AI accelerator란? TPU, Neural engine
subtitle: What is a NPU?
tags: [NPU, AI accelorator]
comments: true
---

NPU(Neural Processing Unit, 신경망 처리장치) NPU는 인공지능의 핵심이라고 할 수 있는 딥러닝(Deep Learning) 알고리즘 연산에 최적화된 프로세서입니다.
AI accelerator, TPU 다양하게 불리는데, 머신러닝, 딥러닝을 빠르게 해주는 장치라고 생각하면 쉽습니다. ~~IEEE라던가 누가 용어를 딱 정해줬으면 좋겠어요. ~~
생소한 이름과 다르게, 우리가 쓰는 아이폰과 테슬라 자동차 안에 아주 큰 부분을 맡고있습니다.
NPU는 Apple의 M1에 있는 Neural engine으로 가장 잘 알려져있어요.
(Alibaba의 Ali-NPU, Amazon의 AWS Inferentia, Arm의 ML Processor, Baidu의 Kunlun, Google의 TPU, Intel의 NNP, Nvidia의 NVDLA, Tesla의 FSD Chip 등..)
한국에는 아래 산학연, 정부가 2020년부터 NPU를 개발하고있습니다.
서버(5개 과제) - SK텔레콤 컨소시엄 - SK텔레콤(총괄/주관), 퓨리오사AI(주관), 서울대(주관), 오픈엣지(주관), 딥엑스, 알파솔루션즈, 에이직랜드, SK하이닉스, TSS, 고려대, 서울과학기술대, 한양대, 포항공대, KAIST, KETI
모바일(3개 과제) - 텔레칩스 컨소시엄 - 텔레칩스(총괄/주관), ETRI(주관), 네패스(주관), 오픈엣지, 에이직랜드, 서울대, 서울과학기술대, 이화여대, 충북대, 한양대, KETI
엣지(4개 과제) - 넥스트칩 컨소시엄 - 넥스트칩(총괄/주관), ETRI(주관), 오픈엣지(주관), 딥엑스(주관), 라온피플, 리트빅, 세미파이브, 아크릴, 옥타코, 경희대, 대구대, 서울대, 충북대, 한양대, KAIST, KETI
공통(1개 과제) - ETRI 컨소시엄 - ETRI(주관), KAIST

사실 Tesla와 Apple을 제외하면, NPU로 실적을 내고 있는 회사는 거의 없는데요. 아직은 자체 NPU보다는, GPU에 의존하고 있습니다.
Nvidia는 자사 그래픽카드에 Tensor core를 넣어서, HPC, AI 가속화 기능을 하고 있습니다. 아직은 괜찮은 NPU가 없어서 머신러닝에는 GPU를 사용하고 있어요.
TPU, Tensor core 등에 들어가는 Tensor는 벡터(크기와 방향) 계산을 컴퓨터로 쉽게 계산하기위해 행렬로 나타냅니다. 보통 Tensor란 3차원 이상의 행렬을 말해요. 

2020년 Apple이 발표한 M1 SoC Chip의 다이.
![M1](https://images.anandtech.com/doci/16226/M1_575px.png)
Ref:https://www.anandtech.com/show/16226/apple-silicon-m1-a14-deep-dive

참고로, 위 사진에서 CPU는     - CPU : 4x Firestorm core + 4x Icestorm core입니다.
Firestorm : https://dougallj.github.io/applecpu/firestorm.html
Icestorm : https://dougallj.github.io/applecpu/icestorm.html

자, 이제 NPU가 뭔지는 알았어요. 근데 우리는 머신러닝 같은거 안하는데, 왜 우리 그래픽카드, 맥북에 그걸 넣는거죠?
우리가 iOS Siri를 부르는 경우에 우리 목소리를 분석할 때에 쓰여요. NPU는 GPU나 CPU보다 훨씬 저전력이고, 빠르고, 작다는 장점 때문에 NPU가 쓰이고있습니다.
