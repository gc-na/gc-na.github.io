---
layout: post
title: 디지털 공학 정리. 카르노맵, 부울식 정리, 밀리 무어 차이, 동기식 비동기식 D Flip flop, NAND NOR 변환, 카운터 설계
subtitle: feat.졸업 전 디지털공학 복습
tags: [디지털 논리 회로, Digital, Moore, Synchronous]
comments: true
---

학기가 끝나기 전에 배웠던 전공 복습 중.  
자료구조나 알고리즘 같은 건 눈으로만 다시 봤고, VLSI는 이전에 몇번 포스팅 했고, 디지털 공학을 커밋하기로 결정.  
언어들은 사실 command가 잘 기억 안나는데, 프로그래밍은 할 줄 알고, 가끔 스택오버플로우 탐독하니 괜찮을듯.

디지털 공학 문제 풀려고 하니까... 뭘 써야하는지는 기억이 나는데, 어떻게 하는지 기억이 안남.

카르노맵, 부울식 정리, 밀리 무어 차이, 씽크와 어씽크 개념, 낸드, 노아로 게이트 일원화

1. 카르노맵
진리표를 만들고, 거기서 붙어있는 것 2^N개씩 묶어서 식으로 나타낸다.  
구글에 karnaugh map solver이라고 검색하면 알아서 묶어주고 부울식 만들어주는 툴 들이 많다.

2. 부울식 정리
![boolean](/assets/img/equatns.gif)  
위 식만 있으면 다 할 수 있다! 근데, 몇가지는 사실 잘 눈에 안 보임.  
구글에 boolean algebra라고 검색하면 알아서 간략화 시켜주는 툴들이 있다. 그치만 한 문제만 풀어보자.  

![q1](/assets/img/gfdagasdfasf.png)  
여기서 끝이라고 생각했는데,,,, 답이 이게 아니다. 풀이가 없어서 이거 갖고 10분 고민했다.  
위 정리의 분배법칙(?)을 이용한다.  

![q2](/assets/img/KakaoTalk_Photo_2021-10-18-14-40-51.jpeg)  


3. NAND, NOR 게이트들만 이용하여 변환하기  
NAND, NOR 변환은 이런 방법으로 변환할 수 있다.  
![q2](/assets/img/KakaoTalk_Photo_2021-10-18-14-44-51.png)  

Q1. F(x,y,z) = x'y + yz' + xz를 NAND로 나타내라.  
Q2. F(x,y,z) = (x+y)(y'+z)(x'+z')를 NOR로 나타내라.  
![q3](/assets/img/KakaoTalk_Photo_2021-10-18-14-46-49.jpeg)  

4. FSM Finite State Machine. 밀리머신 무어머신 차이점, 베릴로그 만들기.
무어회로 : 입력값이 현재 상태에 반영되고, 출력은 상태값에서 나옴.  
밀리회로 : 입력값이 현재 상태에 반영되고, 출력은 현재상태와 입력값 두개가 연산되어 나옴.  
밀리로 하면 설계가 복잡해져서 무어를 많이 쓰는 것 같다. 간단한 무어 회로를 설계해보겠습니다.  

플로우는 다음과 같습니다. 
![sitck_diagram](/assets/img/reset_idle.png)
   
<script src="https://gist.github.com/gc-na/fe390b7f3bf8dbd00f34062dbe5a8c40.js"></script>  

Synopsys VCS(ver : 03.2020)로 확인한 파형  
![moore_wave](/assets/img/moorewave.png)  


5. 동기식, 비동기식 개념.
asynchronous : 비동기식. 리셋이 작동하려면, reset이 active edge(posedge로 설정했다면 0->1, negedge로 설정했다면 1->0)  
synchronous : 동기식. 예를들어 리셋이 작동하려면, clk의 active edge가 발생한 상황에 reset이 1이어야됨.  

비동기식 D flip flop, 동기식 flip flop, Preset 포함, 테스트벤치까지!
<script src="https://gist.github.com/gc-na/ddcce39918fbebf446b082eba477bb06.js"></script>  
<script src="https://gist.github.com/gc-na/9f09cb08134f9e7e44b7ff41a0205d22.js"></script>  
  
6. 카운터  
2^n진 카운터는 그냥 넣어주면 된다. 알아서 비트 따라 올라가고 오버플로우되면 0으로 간다.  
2^n진 카운터가 아니라면, if문을 써주면 된다.  
<script src="https://gist.github.com/gc-na/28dec7ec98f42e6d9fdef047b89ffada.js"></script>
