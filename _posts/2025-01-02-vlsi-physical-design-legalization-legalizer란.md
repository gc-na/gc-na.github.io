---
published: true
---
## VLSI Physical Design: Legalization, Legalizer란?

![0](/assets/img/223678445989/0.png)

Algorithms to improve area density utilization, routability and timing during detailed placement and legalization of VLSI circuitsLegalization란?

반도체 디지털 회로 설계의 Physical Design 단계에서 Legalization은 모든 Cell이 "올바른 위치"에 있도록 조정하는 과정입니다.

여기서 "올바른 위치"란,

(1) Cell이 서로 겹치지 않고

(2) 전력/신호/Standard cell Row에 정렬되며

(3) DFM, DRC와 설계 최적화가 될 수 있는 위치입니다.

이것에 대한 Clean 여부가 Legality 여부입니다.

​

Place 단계에서 설계 툴은 주로 면적, 타이밍, 전력과 같은 매트릭스를 기준으로 셀의 초기 위치를 정합니다.

하지만 이 배치가 실제 제조 공정과 설계 규칙에 100% 부합하지 않을 수 있습니다.

​

왜 이런 Legality issue가 발생하는가?

Legalizer engine이 매우 무겁습니다. 그래서 설계/최적화 단계에서는 가벼운 Legality check 엔진을 사용하고, 설계 완료 후 Legalizer로 수정하고.. 이런 단계를 계속 거칩니다.

​

Legalizer는 주로 P&R Tool에 들어있습니다. IC Compiler1/2, Fusion Compiler 등.

​

Legalization 과정 상세

셀 겹침 해결: 초기 배치에서는 셀이 무작위로 겹칠 수 있습니다. Legalization은 이를 제거하며, 동시에 배치의 이동량을 최소화하여 초기 최적화를 유지합니다.

표준 셀 정렬: CMOS 공정에서는 셀이 Row(가로 방향) 단위로 정렬되어야 합니다. 셀의 크기와 전력 핀 위치를 고려하여 정확히 정렬합니다. 그러니까.. VDD, VSS Line이 딱 정해져있고, 각 LEF들이 이 VDD, VSS 라인에 맞아야한다는 뜻입니다.

​

Cell의 실제 Shape이 담긴 정보인 LEF가 아래 1번 그림처럼 생겼고,

![1](/assets/img/223678445989/1.png)

LEF아래 2번 그림처럼 이 LEF의 Place는 VDD와 VSS row에 딱 맞게 붙어야 된다는 것이죠.

Standard Cells 의 배치형태를 보면, Row가 일정하게 유지가 되죠?

![2](/assets/img/223678445989/2.png)

Chip. Source: https://vlsibyjim.blogspot.com/2015/03/power-planning.html3. DRC 준수: 파운드리가 정의한 설계 규칙(Design Rule)을 준수해야 합니다.

최소 셀 간 간격(Minimum spacing)

전력 및 신호 라인과의 연결 위치

셀 배치 방향(Orientation)

4. Timing, Power optimization 고려: 단순히 Legality issue 해결을 위해 Cell을 "옮기는" 작업이 아니라, Timing 경로가 길어지지 않도록 하고 전력 분배가 균등하도록 세심하게 조정합니다.

---

Legalization의 주요 도전 과제

배치 밀도와 셀 간 간격: 설계가 고밀도일수록 Legalization이 어려워집니다.

2. 타이밍 위반 문제: 셀 위치가 변경되면 타이밍 경로가 길어질 수 있습니다.

3. 전력 라인 및 IR Drop: 셀의 위치 변경이 전력망(Power Grid)과의 연결을 방해하거나, IR Drop을 증가시킬 수 있습니다.

4. 과도한 셀 이동: 초기 배치와 Legalization 후의 위치가 크게 달라지면, 기존의 면적, 전력, 타이밍 최적화 결과가 나옴.

​

---

결론

완전 단순하게 보면,

(1) P&R 후에 출력되는 Code 읽고

(2) Location 값이 겹치는 Code가 있나? 이런 것들을 파악하고,

(3) 겹치지 않도록 값을 좀 수정해주고,

이런게 Legalizer입니다.

​

그렇지만 현대의 실제 Legalization은 단순한 "위치 조정" 이상의 의미를 갖습니다. 설계의 제조 가능성을 보장하고, 성능, 전력, 면적의 균형을 맞추는 중요한 과정입니다. 고밀도 설계와 공정이 미세화될수록 Legalization은 더욱 복잡해지고 중요해지고 있습니다.

Legalizer 툴이 매우 무겁기에, 성능 지표도 더 중요해지고 있구요.

​

여러분의 설계 과정에서 Legalization이 고민된다면, 이 글의 내용을 참고하시거나 댓글로 질문 남겨주세요! 도와드리겠습니다. 😉

 해시태그 : 