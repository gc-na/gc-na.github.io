---
published: true
---
## MIM이란? Multiple Instance Module이란?

​

​

다중 인스턴스 모듈, MIM이란?

​

Multiple Instance Module(MIM)은 VLSI 설계에서 하나의 모듈의 여러 인스턴스를 생성하고 이를 설계 내에서 인스턴스화하는 설계 접근 방식을 말합니다. 이 기술은 물리적 설계를 최적화하고, 특히 AI 가속기, GPU, ASIC과 같은 복잡한 시스템에서 높은 성능을 달성하는 데 필수적입니다.

​

verilog에서 module은 가장 작은 하나의 디자인이라고 보시면 됩니다.

이런 모듈이 하나의 게이트가 되고, 하나의 서브시스템이 되고, 하나의 칩이 되는거죠.

​

수학에서 함수를 선언하고, 소프트웨어에서 Class를 선언하는 것처럼 만든다고 보시면 됩니다.

```
module basic_module (
input wire clk,
input wire rst,
input wire [3:0] data_in,
output wire [3:0] data_out
);
    // 모듈 기능 구현
endmodule
```

위처럼 이런식으로 하나의 모듈을 만들고,

아래처럼 top module이라는 디자인에서 불러오는거죠.

```
module top_module (
input wire clk,
input wire rst,
input wire [15:0] data_in,
output wire [15:0] data_out
);
// 인스턴스 1
basic_module u1 (
.clk(clk),
.rst(rst),
.data_in(data_in[3:0]),
.data_out(data_out[3:0])
);

// 인스턴스 2
basic_module u2 (
.clk(clk),
.rst(rst),
.data_in(data_in[7:4]),
.data_out(data_out[7:4])
);

// 인스턴스 3
basic_module u3 (
.clk(clk),
.rst(rst),
.data_in(data_in[11:8]),
.data_out(data_out[11:8])
);

// 인스턴스 4
basic_module u4 (
.clk(clk),
.rst(rst),
.data_in(data_in[15:12]),
.data_out(data_out[15:12])
);
endmodule
```

다들 아시는 CPU, GPU에 대해 좀 더 자세히 보면,

CPU는 단일 코어들이 높은 Performance를 보여주고, GPU는 많은 병렬코어들이 존재합니다.

![4](/assets/img/223488202100/4.png)

이런 병렬 코어(연두색 사각형)들을 하나하나 코드 작성해서 만드는게 아니라, 하나만 만들어놓고 MIM 방식으로 재사용하는 것이죠.

AI 가속기에서 매우 큰 데이터 스트림을 병렬적으로 처리하여 처리 속도와 효율성을 높이는 데 널리 사용됩니다.

여러 인스턴스의 계산 모듈을 생성함으로써 AI 가속기는 대용량 데이터 세트에 대한 병렬 처리를 수행할 수 있으며, 이는 AI 응용 프로그램의 주요 요구 사항입니다.

​

​

아래 기사에 따르면, NVIDIA의 블랙록은 208Billion. 2080억개의 트랜지스터입니다.

https://futuretimeline.net/blog/2024/03/22-nvidia-ai-chip-208-billion-transistors.htm

[New AI chips feature 208 billion transistors](https://futuretimeline.net/blog/2024/03/22-nvidia-ai-chip-208-billion-transistors.htm) : Chip giant NVIDIA has launched its Blackwell family of processors, which are set to provide yet another leap in scale and speed for AI.

반도체 물리 회로 설계, Physical Design에서는 이 모듈을 칩에 배치 및 제약조건 충족을 해야합니다.

이걸 어쨌든 Full chip level으로 Timing Sign-off를  맞춰야 Tape out을 할 것입니다.

​

EDA에서 인공지능반도체 (MIM이 엄청 들어간)에 대한 다양한 런타임 최소화기법들이 존재하는데, 이 내용은 이후 포스팅에서 다루겠습니다.

 해시태그 : 