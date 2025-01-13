## Synthesis의 핵심! Design Compiler 수행 과정, DC flow 핵심 개념 정리 Design Compiler流程，DC流核心概念总结

1. DC에 필요한 setupfile을 만든다.

.synopsys_dc.setup

2. HDL file(Verilog HDL, VHDL 등) 불러오기.

DC에 최적화된 질 좋은 code가 나와야 DC의 최적화도, 최종 P&R에도 좋은 결과가 나옴. 아래 과정에서 아무리 최적화해도 30% 이상 최적화하기 힘들다. 최적화가 필요하면, RTL code부터 수정하기.

__RTL code가 최종 chip에 가장 많은 영향을 끼친다.__

$ read_verilog A.v

3. Vendor에서 Library 파일 받음

설계회사가 레시피를 만든다면, 공정회사는 식자재를 통해 음식을 만든다. 그러므로 설계사는 공정회사에 주문을 할 때, 공정사가 어떤 재료(NAND 게이트 같은..)를 갖고있는지 확인해서 사용한다.

$ set target_library 65nm.db

$ set link_library "* $target_library"

$ link

4. 환경 설정

입력을 얼마나 강하게 줄 것인지(driving cell), wire의 저항과 커패시턴스는 어느정도로 줄 것인지 설정.

$ set_operarting_condition

$ set_wire_load

$ set_driving_cell

5. 컴파일 방법 설정(Top-Down, Bottom-Up 방법이 있는데, 대부분 Top-Down 씀)

6. Constraints file 작성, 적용

RTL code만 보고서 "이 회로에 게이트가 몇 개 들어가서 크기가 어느정도고, 지연시간은 어느정도 걸리겠다라는 것"을 예측하기 어렵다. 5나노 공정 같은 경우엔, 손톱만한 칩에 200억개의 칩이 들어가는데, 이 경우의 수를 다 보는 것은 어려움.

A block에서 걸리는 delay는 몇 초라서, B block에서 몇 초의 여유분을 줘야하는지.. 이런것들이 위반되면 회로 작동이 안된다. 그래서 이 제약조건들을 어림잡아 계산을 한다.

그래서 이 제약조건들을 정하고, DC에 적용하면 그 조건들을 만족하는 경우의 수만 남게된다. 거기서 타이밍이 더 중요한지, 크기가 더 중요한지 골라서 하면 된다.

__좋은 Chip 만들려면 좋은 RTL code가 있어야하고, 잘 계산된 Constraints file이 있어야 좋은 결과가 나온다.__

$ set input_delay -max

$ source A_file.con

7. Compile

$ compile

$ compile_ultra

울트라 명령으로 하면 자동으로 DC 최적화 다 해주는데.. 비싸다. 작은 회사, 연구소는 이런거 없다. 스스로 찾아서 최적화해주면 된다.

8. Analyze and Debug

9. _*_.ddc로 저장.

$ write -format verilog -output mydesign_mapped.v

​

​

SoC 회사에서 "DC 사용해보셨어요?" 질문은 Synopsys社의 tool로 synthesis 할 줄 아세요?라는 질문입니다.

Synthesis는, HDL을 logic으로 translation하고, 이 logic을 optimize하고, gate level로 mapping하는 합성 과정입니다.

HDL과 Synthesis tool이 없을 때에는 이런 회로를 하나 하나 다 그리고, 맞게 했나 검증을 계속 했어야 했죠.

​

constraint file은 제약조건이 적힌 파일인데,

실제 회로 안에는 지연시간도 있고, 크기에 대한 제한도 있습니다. 이런 제약조건을 넣지 않고 회로로 만들면, 크기가 너무 크거나, 시간이 너무 오래걸리거나, 회로내에 지연시간 때문에 정상 기능을 못할 수 있기 때문에, 면적과 커패시턴스, 인풋 아웃풋 딜레이 등을 써서 constraint file을 만들어 적용합니다.

 해시태그 : 