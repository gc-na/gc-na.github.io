---
layout: post
title: CDC란, RDC란, Lint란. Clock Domain Crossing, Reset Domain Crossing in vlsi
subtitle: #Spyglass #Method
tags: [CDC, RDC, Lint, metastable sate]
comments: true
---

한 클럭으로만 하는 single clock system에선 cdc를 고려할 필요가 없습니다.  

![Single_clock_domain](/assets/img/single-clock-domain.webp)  

CDC(Clock Domain Crossing) - 시스템 내의 서로 다른 reset이 교차될 때 데이터를 교환하는 방법입니다.  
예를 들어 A시스템은 느린 50MHz 클럭에서 실행될 수 있는 반면, B시스템에선 빠른 클럭이 필요해서 GHz 범위의 클럭에서 작동된다고 합시다.  
이러한 서로 다른 Clock domain 간에 데이터를 교환하려면, Clock Crossing 사이에 동기화시킬 로직을 배치해야합니다.  
FF1과 FF2에 다른 주파수로 클럭이 들어오면, FF1와 FF2의 액티브엣지 타이밍이 계속 변해서 특정한 순간에 Violation이 일어날 수 있습니다.  

![clock_domain_crossing](/assets/img/Clock-Domain-Crossing-Path.webp)  

RDC(Reset Domain Crossing) - 시스템 내의 서로 다른 reset이 교차될 때 데이터를 교환하는 방법입니다.  

![reset_domain_crossing](/assets/img/Reset-Domain-Crossing-1.png)  

Lint는 잠재적으로 Post simulation vs Pre simulation의 불일치로 이어질 수 있는 코딩 스타일에 대해 RTL 소스 코드를 확인하는 검증방법입니다.  

이 3가지 방법은 Synopsys Spyglass를 통해서 검증할 수 있습니다.
