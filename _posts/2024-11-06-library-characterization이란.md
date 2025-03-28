---
published: true
---
## Library Characterization이란?

Foundry가 Fabless에게 제공 하는 파일 중 하나인 Library. 제일 중요한 파일입니다.

이 라이브러리라는 파일을 생성하는 것을을 라이브러리 캐릭이라고 합니다.

![0](/assets/img/223531114280/0.png)

​

​

Library Cell Characterization이란?

우리는 주로 이것을 캐릭, Char 등으로 부릅니다. Library Cell characterization에는 다양한 조건에서 셀의 동작을 정확하게 나타내는 라이브러리 내 표준 셀의 세부 모델을 생성하는 작업이 포함됩니다.

이러한 모델에는 Timing, Power, Area, Noise 등의 주요 특성이 포함됩니다.

​

Foundry에서는 TCAD, SPICE, Library char까지 주요 임무를 맡게 됩니다.

​

SPICE Tool은 매우 정확하게 Cell 특성을 모델링 할 수 있는데, 계산 과정에 엄청난 컴퓨팅을 사용하게 됩니다.

이 Cell을 갖고 Chip을 디자인하려면, 그때 그때 이런 계산을 해둔 것보다는, 이미 계산을 해놓은 데이터셋을 하나 만들어놓고, 필요 할 때마다 계산된 값을 가져오는게 좋죠.

​

ASIC 칩 설계의 큰 흐름이 아래처럼 진행되는데, 아래 flow 대부분이 Library를 사용합니다.

![1](/assets/img/223531114280/1.png)

Data Self-healing Technique using ASIC Level Security Mechanisms, Kuldeep Chouhan![2](/assets/img/223531114280/2.png)

Data Self-healing Technique using ASIC Level Security Mechanisms, Kuldeep Chouhan​

Library characterization의 주요 목표는,

(1) IC 설계 프로세스 전반에 걸쳐 디지털 설계 툴에서 활용할 수 있고,

(2) SPICE와 Library 간의 격차가 거의 없는 고품질 데이터 + 저용량으로 생성하는 것입니다.

-> 이게 매우 까다롭습니다. EDA Tool이 빠르게 돌려면 파일이 가벼워야하고, 가벼우면 데이터 양이 줄어드니 내삽/외삽을 해야하는 범위가 넓어집니다. 근데 실제 특성은 linear하지 않아서, SPICE와 Library 간 차이값이 발생합니다.

​

어떻게 하냐? 간단히 설명하면,

(1) input 파일으로 Transistor/Technology model, SPICE Circuit 받고

(2) SPICE Simulation이랑 라이브러리 캐릭 진행해서

(3) 모델링 된 라이브러리 출력한다.

​

아래 같은 흐름이에요. 정확히 아래처럼 쓰는건 아니긴한데.

```
set CORNER TT
set VOLTAGE 1.2
set TEMPERATURE 25
set cell AND2_Chase
set_operating_condition -voltage $VOLTAGE -temp $TEMPERATURE

## Load template information for each cell ##
source technology_config.tcl
source spice_config.tcl
read_spice SUBCKT.sp

source user_config.tcl

char_library -cells ${cells}

write_library ${cell}.lib
write_verilog ${cell}.v
```

그러고 나면, 아래 같은 포맷으로 파일이 출력됩니다.

물론 library에는 다양한 버전이 있습니다. NLDM, CCST, CCSN 등..

그리고, 하나의 셀을 "Worst Process Corner, Worst Voltage Corner, Worst Temperature corner" 등 여러가지 코너로 뽑습니다.

​

Library의 대명사처럼 쓰이는 것이 .lib이고, .lib은 liberty file format입니다.

모든 회사의 EDA Tool이 인식 할 수 있도록, 오픈소스로 공개되어있는 Cell 모델링 규칙입니다.

사람이 읽을 수 있는 ASCII 포맷입니다.

```
/* General Syntax of a Technology Library */
library (nameoflibrary) {
... /* Library level simple and complex attributes */
... /* Library level group statements */
... /* Default attributes */
... /* Scaling Factors for delay calculation */
/* Cell definitions */
cell (cell_name) {
... /* cell level simple attributes */
/* pin groups within the cell */
pin(pin_name) {
... /* pin level simple attributes */
/* timing group within the pin level */
timing(){
... /* timing level simple attributes */
} /* end of timing */
... /* additional timing groups */
} /* end of pin */
... /* more pin descriptions */
} /* end of cell */
... /* more cells */
} /* end of library */
```

그런데! ASCII 포맷은 사실 용량 최적화 측면에서 매우 비효율적입니다. 그래서 compress 시킨 후, .db 형태로 저장합니다.

Synopsys EDA Tool은 대부분 liberty도 호환은 하지만, 너무 무겁기에 매우 느립니다. .db를 사용합니다.

​

​

주로 많이 쓰이는 Tool은

Synopsys사의 PrimeLib, Cadence사의 Liberate가 많이 쓰입니다. 이 외에도 많은 툴이 있긴한데, 어쨌든 다른 EDA와의 호환을 고려해야하니, 두 회사 제품이 가장 많이 쓰입니다. Synopsys 같은 경우엔, 가장 많이 쓰이는 ".lib"이라는 liberty 포맷을 개발한 회사이기도 하구요.

좀 더 자세한 내용을 보시려면, 아래 링크를 확인하세요.

https://www.synopsys.com/glossary/what-is-library-characterization.html

[What is Library Characterization? – How it Works & Techniques | Synopsys](https://www.synopsys.com/glossary/what-is-library-characterization.html) : Cell library characterization is a process of analyzing a circuit using static and dynamic methods to generate models suitable for chip implementation flows.

​

(1) Library characterization 할 때에는 SPICE가 Golden data입니다.

(2) STA, Power analysis, EDA Tool을 이용한 대부분의 것들은 Library가 Golden data이구요.

(3) 결국, Library <-> SPICE Simulation의 차이값이 거의 없어야합니다.

그런데 Library는 사실 계산을 만들지 않고, SPICE Simulation에서 계산된 몇가지 주요 값들을 가져오는 것이다보니, 이 주요값을 그대로 갖고와서 쓰는게 아니라면, 오차가 발생하게 됩니다. 아래 글을 참조해주세요.

https://blog.naver.com/gc_na/223466110373

[Library: Interpolation이란? Extrapolation이란?](https://blog.naver.com/gc_na/223466110373) : 통계학적 연구를 할 때 많이 쓰는 개념이 Interpolation과 Extrapolation입니다. 개념은 간단한데, 잘 설...

​

아~ 나는 라이브러리 캐릭은 잘 모르겠고, 라이브러리 써보고싶어서 이 글 들어왔다?

오픈소스로 유명한, skywater PDK 사용하면 됩니다.

https://github.com/google/skywater-pdk

[GitHub - google/skywater-pdk: Open source process design kit for usage with SkyWater Technology Foundry's 130nm node.](https://github.com/google/skywater-pdk) : Open source process design kit for usage with SkyWater Technology Foundry's 130nm node. - google/skywater-pdk

skywater에서 오픈소스 PDK를 공개했고, 이거로 MPW도 가능합니다. 여기 아래 일정에 맞춰서 GDS out 하면 됩니다.

​

​

![3](/assets/img/223531114280/3.png)

나는 다른 회사꺼로도 칩을 만들어보고싶다?

![4](/assets/img/223531114280/4.png)

![5](/assets/img/223531114280/5.png)

Europractice도 있습니다. 유럽권 학교 다니면 할인도 받을 수 있는 것 같습니다.

https://europractice-ic.com/schedules-prices-2024/

​

CMC Microsystems는 캐나다 연구자들을 위한 것들인데, 캐나다 학교 다니시면 무료로 제조까지 할 수 있는 것 같습니다.

https://www.cmc.ca/technologies/

[FAB Technologies – CMC Microsystems](https://www.cmc.ca/technologies/) : Click for Subscriber Pricing Process Name Features Design Kits and Libraries List Price (USD)* $917/mm 2 (Minimum charge is for a 24 mm 2 design) Molecular Beam Epitaxy (MBE) Gas-Source MBE Metal-Organic Chemical Vapor Deposition (MOCVD) See the Opto Epitaxy Form . Contact  fab@cmc.ca . Photonics Co...

​

 해시태그 : 