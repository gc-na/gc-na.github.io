---
published: true
---
## MDP란? Mask Data Preparation(MDP), GDS2파일으로 어떻게 마스크를 만들까?

반도체 설계회사는 Tape out을 통해 설계 정보가 담긴 GDS 파일(oasis)을 Foundry의 Mask팀에게 전달합니다.

Foundry의 Mask팀은 GDS의 Layout 정보를 Photomask로 제작하기 위하여, Mask 제작 장비가 사용할 수 있는 Data로 바꾸어 주는 작업을 합니다.

​

이 작업을 Pattern Generation Work라고 부릅니다.

PG Work는 MDP, OPC, Frame, Fracturing, Jobdeck Generation 단계로 이루어져 있습니다.

이 글에서는 MDP에 대해서 알아볼 예정입니다.

![0](/assets/img/223422818497/0.png)

credit: https://semiengineering.com/inside-photomask-writing/​

MDP란?

Mask Data Preparation(MDP)은 VLSI(Very Large Scale Integration) 설계 데이터를 포토마스크(photomask) 제작에 필요한 형식으로 변환하는 단계입니다.

반도체 제조공정에서는 마스크를 갖고 제품을 그리는거구요.

​

![1](/assets/img/223422818497/1.png)

​

MDP는 설계자의 의도를 충실히 반영하면서도, 제조 공정의 한계를 고려하여 최적의 마스크 데이터를 생성하는 것을 목표로 합니다.

반도체 공정의 미세화가 진행될수록 MDP도 더 어려워지고 있습니다.

최신 공정에서는 Design Rule이 매우 복잡해지고 있으며, Photo공정시 사용하는 빛의 파장 대비 Pattern 크기가 작아짐에 따라 lithography 공정에서의 Diffraction 현상과 Proximity effect로 인한 왜곡이 심화되고 있기 때문입니다.

![2](/assets/img/223422818497/2.png)

빛의 물리적 한계를 극복하기 위해 Multi patterning, Resolution Enhancement Techniques(RET)를 적용하는 등 마스크 패턴을 보정함으로써 웨이퍼 상에 원하는 패턴을 그리려고 하고 있습니다.

​

![3](/assets/img/223422818497/3.png)

​

​

VLSI 설계가 완료되면 설계 결과물은 Layout Database 형태로 Foundry의 MDP 팀에 전달됩니다. 이걸 Tape out이라고 하고, Chip 설계자들은 이 때 휴가를 갑니다.ㅎㅎ...

일반적으로 GDSII(Graphic Design System II) 또는 OASIS(Open Artwork System Interchange Standard) 포맷이 사용됩니다.

그래서 Tape-out이라는 용어 대신, GDS out이라는 용어를 쓸 때도 있습니다.

​

MDP 팀은 이 Layout Database를 기반으로 다음과 같은 일련의 과정을 거쳐 최종 Mask Data를 생성하게 됩니다.

1. GDS Layout DRC: Foundrt 별 DRC 체크를 위해 EDA Tool로  설계 무결성을 검증하고, 필요 시 설계 데이터를 수정합니다. 

2. RET 적용: OPC(Optical Proximity Correction), SRAF(Sub-Resolution Assist Features) 등 Resolution Enhancement Techniques를 적용하여 리소그래피 공정에서의 회절 및 근접 효과로 인한 패턴 왜곡을 최소화합니다.  

3. MRC(Mask Rule Check) 및 MPC(Mask Process Correction) 수행: 마스크 제작 및 검사 장비의 제약 조건을 고려하여 마스크 룰 검증을 수행합니다.

4. Fracturing: Mask Writer에서 인식 가능한 형태로 마스크 데이터를 분할하고 변환합니다. 

5. Job Deck 생성: Mask Writer를 구동하기 위한 명령어 집합을 생성합니다.

여기에 쓴 용어들은 이후 글에서 포스팅 할 예정입니다.

​

최종 생성된 마스크 데이터는 MEBES(Manufacturing Electron Beam Exposure System) 포맷 등으로 변환되어 마스크샵에 전달되며, 이를 바탕으로 실제 마스크가 제작됩니다.

​

​

http://www.layouteditor.net/wiki/MEBES

[MEBES - LayoutEditor Wiki](http://www.layouteditor.net/wiki/MEBES) : MEBES (Manufacturing Electron Beam Exposure System) MEBES were photo mask ebeam writers by the company Etec Systems Inc. These ebeam write used a own input format. That format is accepted by some mask shops and is used as an exchange file format for a single layer. MEBES version 1 to 5 exists. Using...

MDP에 사용되는 주요 파일 포맷 정리

​

MDP는 설계 데이터의 교환과 변환이 빈번하게 이루어지는 만큼, 표준화된 파일 포맷의 사용이 필수적입니다. 주로 사용되는 파일 포맷은 다음과 같습니다.

​

- GDSII: 설계 Layout 정보를 저장하기 위한 바이너리 파일 포맷으로, Cadence사에 의해 개발되었습니다. 오랜 기간 업계 표준으로 사용되어 왔으며, 현재도 널리 쓰이고 있습니다. 

- OASIS: GDSII의 대안으로 개발된 새로운 Layout 파일 포맷입니다. GDSII 대비 파일 크기를 대폭 줄일 수 있어 설계 데이터 처리 속도와 효율성 측면에서 장점이 있습니다. 용어는 GDS라고 부르지만, 실제로는 Oasis를 사용하는 경우가 많습니다.

- MEBES: 마스크 제작을 위한 Mask Writer 입력 포맷 중 하나로, 주로 전자빔 방식의 장비에서 사용됩니다.

​

![4](/assets/img/223422818497/4.png)

Credit: https://www.tool.co.jp/en/products/oasis-utility/​

https://sst.semiconductor-digest.com/2020/02/oasis-vs-gds-time-to-switch/

[OASIS vs GDS: Time to switch? | Semiconductor Digest](https://sst.semiconductor-digest.com/2020/02/oasis-vs-gds-time-to-switch/) : The Open Artwork System Interchange Standard (OASIS®) format, which can reduce both file sizes and loading times. The OASIS format has been available for almost 15 years and is accepted by every major foundry. It is also supported by all industry standard EDA tools.

​

아래는 MDP 내부 과정에서 진행하는 흐름입니다.

이후 포스팅에서 하나씩 살펴보도록 할게요~

![5](/assets/img/223422818497/5.png)

​

DRC in MDP

- Layer check

- DRC(Design Rule Check)

- LVS(Layout Versus Schematic)

​

RET(Resolution Enhancement Techniques) in MDP

- OPC(Optical Proximity Correction)

- Rule-based OPC

- Model-based OPC

- SRAF(Sub-Resolution Assist Features)

- MRC(Mask Rule Check) 및 MPC(Mask Process Correction) 수행

- PSM(Phase Shift Mask) 

​

Fracturing in MDP

- 마스크 데이터를 Mask Writer의 포맷에 맞게 분할하고 변환

​

Job Deck in MDP 

- Mask Writer를 구동하기 위한 명령 집합(Job Deck) 생성: 마스크 사양, 기판 정보, Alignment Mark 위치, Plot Order 등 마스크 제작에 필요한 제반 정보

![6](/assets/img/223422818497/6.png)

Credit:  https://siliconvlsi.com/optical-proximity-correction-opc-in-vlsi/​

​

 해시태그 : 