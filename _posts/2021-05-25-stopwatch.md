---
layout: post
title: Verilog RTL coding으로 Stopwatch 설계하는법 베릴로그 스톱워치 스탑워치 코드 如何使用 Verilog RTL 编码设计秒表 Verilog 秒表代码
subtitle: Operator is only supported when the second operand is a power of 2
tags: [ASIC, Verilog, HDL, 半导体]
comments: true
---
Stopwatch code는 아래에서 다운로드 받을 수 있습니다.
https://github.com/gc-na/rtl_stop_watch

스탑워치의 기본 기능부터 생각해보겠습니다.
1. 시작을 하면, 시간이 흘러가야함.
2. Stop을 누르면 시간이 멈춰야함.
3. Record를 누르면 현재 시간이 기록되어야함.
4.시간은 시, 분, 초임.  60초가 되면 1분으로, 60분이 되면 1시간으로 전환.
5.Reset 버튼을 누르면 시간이 0으로 초기화 되어야함.

우선,  위와 같은 방식으로 코드를 작성하면, 아래와 같은 방식으로 프로그램을 작성할 것입니다.
<script src="https://gist.github.com/gc-na/269d8a789df2e5ceca0aab82253e0af3.js"></script>
클럭이 들어올 때마다 1초씩 증가하고, 리셋이 되면 시간이 초기화되고, 스탑을 누르면 시간 증가가 멈춥니다.
시, 분 개념이 없을 때는 if문이 2개 뿐이라서, 실제 회로를 설계할 때에 MUX가 2개만 있는 간단한 회로가 만들어집니다.

그러나 아래와 같이 시, 분, 초의 개념을 넣는다면
60초가 된다면, 60분이 된다면, xx시(본 코드에서는 12시간을 스탑워치의 최대시간으로 설정했습니다.)가 된다면 내 값은 0이 되고, 올림 수가 발생합니다.
그러면 초, 분, 시니까 총 3개의 if문이 추가가 되죠.

MUX의 수를 최소화해보고싶어서 이런저런 코드를 작성해보다가 이런 방식을 생각해봤습니다.(사진에는 minute단에 누락이 있습니다.)
클럭이 들어올때마다
real_time=real_time+1;
hour=real_time 
minute=(real_time/60)-(hour*60);
sec=real_time%60;
결론은 이 코드는 안됩니다.
<script src="https://gist.github.com/gc-na/1687bf231e4afb9c585ca0f1546a3c23.js"></script>

Operator is only supported when the second operand is a power of 2 와 같은 오류가 나타납니다.
내용은.... 2^n의 연산만 연산자에 쓸 수 있다는 거에요.(비트연산만으로 할 수 있는 계산식만 가능해요.)
그래서 60, 3600같은 수를 연산하고싶으면 전용 연산 블락(가산기, 감산기, 곱셈기, 나눗셈기 등을)을 만들어줘야합니다!
