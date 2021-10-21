---
layout: post
title: 클럭 분주기, 4비트 업 카운터, 7세그먼트 디코더 베릴로그 코드
subtitle: feat.졸업 전 디지털공학 복습
tags: [Clock divider, 4bit up counter, 7 segment decoder]
comments: true
---


Clock divider 클럭 분주기 (1MHz to 1Khz)  
1MHz에서 1KHz로 나누면 1/1000이다. 근데 클럭이 1000번 뛰면, 0~1000이니까 1001번이 된다. 그래서 1 빼주고 999로 나누면 된다.  
<script src="https://gist.github.com/gc-na/1be003eb4494658f59aa0d4aa8709f54.js"></script>  
![clock_divider](/assets/img/clock_divider.png)  

4bit Up counter. 0 -> 1 -> 2 -> ... -> A -> B -> ... -> F -> 0(오버플로우) -> 1 ->... 순으로 이어진다. 4bit라서, 0000->0001->0010->..->1111->0000으로 오버플로우 되는 것이다.  
<script src="https://gist.github.com/gc-na/3db8e1ab206b07487fbb02813fa4ac1d.js"></script>  
![4bit_up_counter](/assets/img/clock_divider.png)  
 

7 Segment Decoder
<script src="https://gist.github.com/gc-na/24aa7a7a10582df9e1d059e42c03f7a5.js"></script>  
![7segment](/assets/img/7segment.png)  
