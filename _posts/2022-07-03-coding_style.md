---
layout: post
title: 흔히 발생하는 Verilog RTL coding 실수
subtitle: Verilog coding style
tags: [Verilog RTL]
comments: true
---

여기서 말한 잘못 만든 Verilog RTL code란,

Verilog simulation 시에는 syntax error가 발견되지 않았지만, 설계자가 의도 하지 않은 실수가 들어있는 code.

​

일단, 이런 실수는 여러가지가 있는데, 무서운 점은 이런 실수들이 Error를 발생시키지 않는다는 점이다.

RTL 작성 후 compile에서 Error가 없고,

simulation 후에도 Function 문제가 없을 수 있다.

예를들어, 아래 같은 코드가 있다고 하면,

<script src="https://gist.github.com/gc-na/5691bf99b4057c90f2d739e637d1790e.js"></script>

마지막에서 두번째 줄 보면, y_reg가 Latch로 합성이 되었다.



Statistics for case statements in always block at line 7 in file

'.../mux3a.v'

===============================================

| Line | full/ parallel |

===============================================

| 9 | no/auto |

===============================================

Inferred memory devices in process

in routine mux3a line 7 in file

'.../mux3a.v'.

===============================================================================

| Register Name | Type | Width | Bus | MB | AR | AS | SR | SS | ST |

===============================================================================

| y_reg | Latch | 1 | - | - | N | N | - | - | - |

===============================================================================




디지털 회로 설계에서 Latch는 최소한으로 사용한다.

Flip Flop은 clock의 pos / neg edge가 생기는 순간에 입력 값을 낚아채 output pin으로 보내는 반면, Latch는 clock의 value에 따라 값을 보내기 때문에.. glitch 발생이 훨씬 쉽게 일어나기 때문이다.

미세공정으로 들어 갈 수록, crosstalk 같은 전자기학 문제를 고려해야될 것이 많으므로, Latch는 꼭 필요한 곳이 아니라면 잘 쓰지 않는다.





crosstalk은 대표적인 미세공정에서 발생되는 전자기학 이슈이다.

직접적으로 연결되지 않은 두 net이 연결된 것처럼, 상호간에 전기적 영향을 주는 것을 말한다. 위 사진을 보면, Aggressor net의 value change가 일어날 때, Victim net의 값이 짧은 시간동안 튀게 되었다.

latch였다면, 이런 전자기학적 이슈로 인해 문제가 생길 확률이 높다.

​
![M1](https://postfiles.pstatic.net/MjAyMjA3MDNfOCAg/MDAxNjU2ODQ0MjE1Nzc0.jp40hzDoQWSx96__tDjhs-SHE0ApoLw7gyamlf4nTMAg.RwL7QltsLTvoHOcOPexMYkO47ScD0bV-j5nHr3LRcAIg.PNG.gc_na/image.png?type=w966)

​

이런 RTL code 실수는 compile 시에도, simulation 시에도 문제가 발생되지 않는다.

만약에 이대로 Chip이 생산되면, 분명 언젠간 문제가 생길 것이다. 그 반도체 칩이 자동차에 들어간다면?

​

음,,,,



​

​

​

일반적으로 verilog에서 if문이나 case문 같은 조건문을 작성하면, MUX가 합성된다. 

![M1](https://postfiles.pstatic.net/MjAyMjA3MDNfMjkx/MDAxNjU2ODQ4NjI0NjQ1.kiZF_LZ0BAgQaTzXPCbR-5l84O2s10w2lrmjTkDcTiMg.-xGJEFEUGeVCChm2W4ZXnhZtQBtY3sqvyzqiTz7bhHgg.PNG.gc_na/image.png?type=w966)

![M2](https://postfiles.pstatic.net/MjAyMjA3MDNfMTg3/MDAxNjU2ODQ4NjY1MDE0.gkIOAagzW7Ay9iYo3lkvkyKojUfN1eJWWcSxlBE4KkAg.IDqnzo0ltlX-LIMv18FJ7iFnodPjyDjswz7MAdFqAuwg.PNG.gc_na/image.png?type=w966)


Digital 쪽에서 일하다보면,

Asterisk, lazy / greedy quantifier를 조심히 사용해야 한다.

나는 최대한 안 쓰려고 하지만, 앞 단계에서 이것들을 썼다면, 문제 없는지 더 확인하게 된다.

(그래서 차라리 이거 그냥 안 썼으면 좋겠다.)


<script src="https://gist.github.com/gc-na/c7e54bbfcc37c39ee1b264f6d19e6d70.js"></script>


언뜻 위 code를 보면, 아무 문제 없어보이고, compile이나 simulation 시에도 아무런 문제가 발생하지 않고, 합성 후 고객들이 이 칩을 사용 할 때에도 문제가 없을 수도 있다.

하지만,

irq에 3'b111 같은 값이 들어온다면? 어디에 1'b1이 들어갈까?

​

이런 RTL code로 합성을 하면, 합성 Tool에서 알아서 셋중에 하나의 Logic만 선택되도록 Encoder Logic이 들어 갈 것이다.

​

​

​

위 실수들은 흔하게 발생되는 실수라서, 경험 많은 엔지니어들이 있는 회사라면 이에 대한 방지책들은 준비가 되어있다.

만약에, 정말 흔하지 않은 실수를 했다면?



위 코드에선 하나의 wire에 25개의 더하기 연산이 들어가고 있다.

RTL coding만한다면, 그냥 눈 앞에 보이는 논리만 맞으면 되겠지만..

​

이 RTL code가 반도체 칩이 된다는 것을 생각했으면 좋겠다.



<script src="https://gist.github.com/gc-na/1bc98e984728ccdd040236bc8125d363.js"></script>


Adder가 별 것 아닌 logic처럼 보여도, 꽤 크다.

​

일단, 어지간한 공정사에선, 저렇게 큰 Adder를 Library에 넣어주지 않는다.

합성 Tool에 있는 기본 Syntheric library (designware)로 합성이 될텐데, OPT 과정에서 문제가 생긴 것 같다.

위 RTL로 합성하였을 때 EC R2N이 Fail이 된다.

(잘못된 RTL이라면 잘못된 Netlist로 합성되어 EC Success가 되어야 하지만, 잘못된 RTL을 최적화하다가 더 잘못된 합성 결과가 나오는 경우도 있다. 이런 경우에 합성 환경을 고치기는 매우 어렵다.)

​

​

낫 놓고 ㄱ자 모르는 것 같긴 한데, 추측을 해보자면..

12bit 요소들이 더해지면서 13bit로 바뀌고, 14.. 15.. 16bit를 바뀔 것이다.

12 bit + 12 bit 일 때에는 13bit adder용 Adder를 사용할 것이고, 13bit + 13bit일 때는 14bit Adder를 사용 할 것이다. 이런 Adder들이 한 wire에 병렬적으로 쓰였다가, 합성 tool에서 opt 과정에 문제가 생긴 것 같다.

​

​

어쨌든, 이런건, 한번에 하는게 아니라, 여러개로 쪼개서 병렬적으로 해야한다.

첫 단추 잘 꿰는 것이 가장 중요하다.

