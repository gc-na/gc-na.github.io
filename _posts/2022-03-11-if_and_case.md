---
layout: post
title: Verilog HDL에서 조건 연산자간의 쓰임새 차이
subtitle: What's the difference between if, case and '?'?
tags: [BA, NBA, Verilog, RTL, VerilogHDL]
comments: true
---

학부에서 Verilog를 배울 때, if문만 썼다. 왜냐? 보기 편하니까.

​

근데 나중에 synopsys 교육을 듣고,,,,, verilog coding style을 배우면서 ternary operator, case문의 중요성에 대해서 듣게 되었다.

​

if문을 사용하면 아래의 회로가 생긴다.


![Monster job](/assets/img/efhivbek.png)

case문도 마찬가지이다. 입력이 10개면 10to1 mux가 생기는 것이다!

​

기능적으로 똑같은데, case문 사용 이유 -> 코드 작성 시간을 빠르게 해줌.

ternary operator 사용 이유 -> case문 쓸 때는 일반적으로, 0과 1에 대해서만 조건식을 쓴다. 그런데,, 가끔씩 x값이 들어 올 때가 있는데, output이 같은 bit는 정상출력하고, 그렇지 않은 부분은 x 처리하여 내보낸다. 3항연산자는 x의 처리를 알아서 해준다! 또, z를 출력해야하는 경우가 있는데, 그것도 이 3상연산자로 사용이 가능한다. 그리고 조건이 간단할 때엔, if/case 문들 중에서 가장 짧게 처리 할 수 있다.

​

assgin C = B ? A : 1'bz; 라는 코드가 있다면, 아래처럼 합성된다.


​

![Monster job](/assets/img/ggewrgjnjkerq.png)
​

1'bz를 안쓰고 다른거 쓰면 3상연산자도 mux가 합성되긴 함.
