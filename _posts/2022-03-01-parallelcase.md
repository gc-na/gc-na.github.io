---
layout: post
title: Verilog parallel case란? infer_mux란?
subtitle: What is a synopsys parallel case in vlsi?
tags: [verilog]
comments: true
---

1비트 짜리 신호 In_A, IN_B, In_C, In_D가 있다고 가정하겠습니다. 아래 코드를 먼저 보겠습니다.

case (Sel)

    In_A : Data_Out = Out_A;

    In_B : Data_Out = Out_B;

    In_C : Data_Out = Out_C;

    In_D : Data_Out = Out_D;

endcase

​

Sel이 들어올 때, In_A만 1이고, 나머지는 0이라면 Data_Out에는 A가 출력된다.

그러나 In_A, In_B, In_C, In_D 모두 1이라면?

우선순위 선택 회로가 추가적으로 생겨서, In_A, B, C, D중 하나만 활성화가 된다. 즉, HDL에 작성하지 않은... 설계자의 의도가 들어가지 않은 로직이 추가된다.

​

설계자가, 이 로직에는  반드시 In_A, B, C, D중 하나만 1이 된다고 알고 있다면, 아래와 같은 코드를 작성 할 수 있다. 

case (Sel) // synopsys parallel_case

    In_A : Data_Out = Out_A;

    In_B : Data_Out = Out_B;

    In_C : Data_Out = Out_C;

    In_D : Data_Out = Out_D;

endcase

​

위처럼 작성시, 

Synopsys사의 Synthesis tool에선 우선순위 선택 회로가 합성되지 않는다.

​

Simulation Tool에선 위 코드의 //synopsys parallel_case를 주석처리하여 우선순위 선택 회로를 생성하고, Synthesis Tool에선 함수처럼 취급하여, 우선순위로직을 작성하지 않는다.

Simulation과 Synthesis의 불일치, 즉 Pre-synthesis와 Post-synthesis간 mismatch가 존재 할 수 있다.

​

​

​

​

조건문은 어떤식으로 회로가 설계 되는지 아시나요?

if(sel) { Data out = Data_in}

else { Data_out = ~Data_in}

같은 문이 있을 경우,

MUX가 생깁니다. Data_in과 ~Data_in이 MUX의 각 입력이 되고, sel은 신호 제어 선이 됩니다. 

기본적으로, 조건문 if 하나 거치려면 mux 하나를 통과해야합니다.

​

​

​

즉, 조건 8개가 있는 if문이나 case문을 통과하려면 8개의 2to1 MUX를 통과해야합니다.

하지만 이것은 크기도 많이 차지하고, 타이밍도 늦습니다.

​

​

아래와 같은 코드를 작성해주면,

case (Sel) // synopsys infer_mux

    3'b000 : Data_Out = A;

    3'b001 : Data_Out = B;

    3'b010 : Data_Out = C;

    3'b011 : Data_Out = D;

    3'b100 : Data_Out = E;

    3'b101 : Data_Out = F;

    3'b110 : Data_Out = G;

    3'b111 : Data_Out = H;

endcase

​

8to1 mux가 생성됩니다. 예를들어 101이 들어오면 8to1 MUX 1개만 통과하고 끝냅니다.

​

'그러면, 조건문 쓸 때는 항상 infer_mux 써주면 되나?' 라고 생각할 수 있는데, 아닙니다.

​

​

아래 같은 코드가 있다고 가정합시다.

always @ (In_1, In_2)

begin

     case ({In_1, In_2})

           2'b00 : Data_Out = In_1;

           2'b01 : Data_Out = In_2;

           2'b10 : Data_Out = In_1 & In_2;

           2'b11 : Data_Out = In_1 | In_2;

     endcase

end

​

1. infer_mux를 써준 경우 :

(1) 00일 때는 In_1이 바로 4to1 mux의 Input으로 들아갑니다.

(2) 01일 때는 In_2가 바로 4to1 mux의 Input으로 들아갑니다.

(3) 10일 때는 AND를 타고 4to1 mux에 들어갑니다.

(4) 11일 때는 OR게이트를 타고 4to1 mux에 들어갑니다.

즉, 4to1 mux, and, or 게이트가 필요합니다.

​

​

2. infer_mux를 안 써준 경우 :

(1) 00일 때는 In_1이 들어가는데, 00이라면 In_1이 0이므로 Data_Out은 0입니다.

(2) 01일 때는 In_2이 들어가는데, 01이라는 것은 In_2가 1이므로 Data_Out은 1입니다.

(3) 10일 때는 In_1&In_2이므로, 항상 0이 됩니다.

(4) 11일 때는 In_1 | In_2이므로 항상 1이 됩니다.

In_2가 0이면 0, In_2가 1이면 1이 됩니다. 고로 아무 게이트가 필요 없고, 입력도 In_2만 있으면 이 case문을 나타낼 수 있습니다.
