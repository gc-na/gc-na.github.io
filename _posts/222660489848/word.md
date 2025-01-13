## Verilog Full case란?

Verilog로 어떤 코드를 쓰느냐에 따라, latch가 합성 될 수도 있고 Flip flop이 합성 될 수도 있다.

​

그러나, 우리는 Latch보다 Flip Flop을 사용한다. Flip flop은 데이터를 active edge에서만 값을 채오기 때문에 glitch에서 latch보다 더 안정적이며, 우리는 회로의 clock edge에서 동작하는 회로를 만든다. latch는 enable이 들어오면, D값에 따라 Q값이 계속 변한다..

​

​

Full case란, 모든 경우의 수가 정의되어 완성된 조건문이다. -> Flip flop 합성 됨.

​

정의는 이렇고, 예시를 들어보겠습니다.

​

input [1:0] Sel;이 있는 경우, Sel의 경우의수는 00, 01, 10, 11입니다.

​

Verilog에서

case (Sel)

    2'b00 : Data_Out = A;

    2'b01 : Data_Out = B;

    2'b10 : Data_Out = C;

    2'b11 : Data_Out = D;

endcase

​

처럼 case의 모든 조건이 모두 주어졌을 때.

​

혹은, Default가 있어서, 모든 조건이 완성된 경우.

case(1'b1)

    Sel_A : Data_Out = A;

    Sel_B : Data_Out = B;

    Sel_C : Data_Out = C;

    default : Data_Out = D;

endcase

​

​

​

Non-Full case -> Latch 합성됨.

​

case (Sel)

    2'b00 : D_Out = A;

    2'b01 : D_Out = B;

    2'b10 : D_Out = C;

endcase

​

2'b11인 경우의 수가 없음. Sel이 2'b11이 들어온 경우, D_Out은 값 변화 없이 이전 값을 유지해야한다. 그래서 Latch 합성됨.

​

​

​

그러나, 디지털 회로 설계에선, Latch가 반드시 필요한 경우가 아니라면, 보통 Flip flop만 사용한다.

​

​

​

Sel은 10비트의 크기를 가진 Signal이지만, Sel에 실제로 출력되는 경우의 수는 5개만 있다고 가정하자.

아래와 같은 코드를 작성하고 싶을 것이다. 하지만, 아래처럼 쓰면 합성 단계에서 Latch가 합성된다.

​

case (Sel)

    10'b0000000000 : D_Out = A;

    10'b0000000001 : D_Out = B;

    10'b0000000010 : D_Out = C;

    10'b0000000011 : D_Out = D;

    10'b0000000100 : D_Out = E;

endcase

​

​

​

헌데, Synopsys社의 Design Compiler 같은 합성 툴의 경우, 이러한 경우를 위한 함수가 들어있다.

조건문 옆에 //synopsys full_case라고 써주면, verilog simulation tool에선, 이를 주석으로 인식한다. 하지만 합성 툴에선, 이를 Flip flop으로 합성 가능한 Non-Full case라고 인식을 한다. (자세한건 Full_case Directive라고 찾아보기!)

​

​

case (Sel) //synopsys full_case

    10'b0000000000 : D_Out = A;

    10'b0000000001 : D_Out = B;

    10'b0000000010 : D_Out = C;

    10'b0000000011 : D_Out = D;

    10'b0000000100 : D_Out = E;

endcase

​

​

Simulation Tool에선 위 코드에 Latch를 생성하고, Synthesis Tool에선 위 코드에 Flip flop을 생성하기 때문에,

Simulation과 Synthesis의 불일치, 즉 Pre-synthesis와 Post-synthesis간 mismatch가 존재 할 수 있다.

 해시태그 : 