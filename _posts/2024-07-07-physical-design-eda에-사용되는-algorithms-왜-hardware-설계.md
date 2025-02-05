---
published: true
---
## Physical Design EDA에 사용되는 Algorithms + 왜 Hardware 설계가 어렵고 오래걸리는걸까? EDA 회사 주가는 왜 오를까? feat. synopsys

Fabrication을 에 사용될 Mask를 설계하기 위해, 많은 방법론들이 사용되었습니다.

현대 시장에서 가장 지배적인 방법은, "Hardware Description Lanugage 기반 Logical Design 후, Electronic Design Automation Tool을 이용한 Physical Design입니다."

​

Physical Design: Code to Code의 Database 변환 과정입니다.

Input: Loical Design code (HDL, SDC, Liberty 등)

Output: Physical Design code (Liberty, NDM, GDS, OASIS 등)

​

간단한 코딩 작업처럼 보이지만, 엄청나게 많은 resource가 필요헙니다.(그냥 간단한거 하나만 할려고해도, 변수가 너무 많으니, 파일도 엄청 크고, 간단한 검증 하나 할려해도 작업 런타임이 몇 주가 걸림)

"많은 트랜지스터" (Apple M1 Ultra Chip의 경우, 114B.. 그러니까 1140억개의 Transistor)

"미세한 공정이기 때문에, 많은 물리/화학적 제약사항을 지켜야 함"(Apple M1의 경우, tsmc 5nm 공정. 머리카락의 5/10000 크기)

​

결정적으로 가장 큰 문제는, 이 Output code가 Chip으로 나왔을 때 동작하는지를 확실히 알려면, Chip을 만드는 수 밖에 없다는 것입니다.

"미세공정의 반도체 장비" 운영 비용만 한달에 아래 정도 비용이 필요합니다. 그러니 미세공정 칩 하나 만들려면 수백억원 드는게 당연하지요.

7㎚: 1억5000만달러(약 1843억원)

5㎚: 2억달러(약 2457억원)

[폭등하는 반도체 장비 가격… 2나노 앞두고 고심하는 삼성전자](https://biz.chosun.com/it-science/ict/2023/01/30/WLUMKZADIFGTZGUH7VSQD35RK4/) : 폭등하는 반도체 장비 가격 2나노 앞두고 고심하는 삼성전자 2㎚ 장비 투자 비용, 3나노 2배 수준 칩 성능 개선 폭은 제한적효율성 낮아 삼성, 구공정 강화해 고객 확보해야

버그 있는 칩이 Tape-out 된다면... 회사가 망할 수도 있는 일입니다.

그렇기 때문에, 많은 검증 과정이 필요합니다. 많은 검증을 하면서도, Time-to-market은 최대한 빨리 해야하기 때문에 runtime도 중요합니다.

​

시작합니다.

Concept: Physical Design Database 자료형

Physical Design을 위해, 두가지 DB 개념이 필요합니다. Symbol DB와 Polygon DB.

두 DB는 liberty, NDM 등으로 표현이 됩니다.

논리회로에는 설계의 논리적 개념이 들어있지만,

Physical Design DB에는 물리적 개념이 추가됩니다. 

Foundry에서 각 Transistor, Metal layer별 특성을 Characterize하여 Design KIT에 담아 놓습니다. Design Kit가 "Physical Design 꾸러미"라고 보시면 됩니다.

​

- Symbol DB: Transistor와 Metal의 속성 정보가 담겨있습니다.

Logical DB를 Physical DB로 Translation을 할 때 사용합니다. Physical Design의 1차적인 과정이라고 보시면 됩니다. 이 과정은 Synthesis라고 불립니다.

​

- Polygon DB:Symbol DB에 추가적으로 모양과 크기 등의 정보를 갖습니다.

Symbol DB로 변환 된 Design에는 "Metal, Transitor"의 속성이 고려된 상태로 Physical Implementation이 되었지만, 실제 Cell이 어디에 있고.. Net이 어느 정도 길이이며.. Net 간 간격이 어느정도라 전자기학적 현상은 어느정도 발생하고... 이런 정보들이 고려되어있지 않은 상태입니다.

Polygon DB를 갖고 Cell과 Net을 Place & Route합니다. 주로 PnR이라고 불립니다.

![0](/assets/img/223255186619/0.png)

​

​

하나의 SoC에는 많은 트랜지스터가 포함되어 있습니다. 이러한 기술 발전으로 인해 CAD 없이 Chip을 만드는 것이 불가능해졌습니다. 이러한 분야를 Electronic Design Automatiom, 즉 EDA라고 합니다.

​

Physical Design CAD Tool에는 Layout 정보를 효과적으로 관리하고 조작하기 위해 고도로 전문화된 알고리즘과 데이터 구조가 필요합니다. "EDA를 어떤 방식으로 사용할 것인지?"에 대한 고려가 가장 먼저 필요한데,

​

방법 1:사람이 직접 전부 Transistor, Net을 고르고 배치, 배선하는 Manual 방식

방법 2:Tool이 전부 고르고, 배치, 배선하는 Auto 방식 (현대의 대부분 EDA Tool들)

방법 3:이미 완성된 출력물에서, 규칙 검사만 하는 방식 (DRC, LVS Tool들)

​

대부분의 연구는 방법 2,3 위주로... Heuristic Algorithm 위주로 진행 되었습니다. 최근엔 Machine Learning이 사용되고 있구요.

수학적 알고리즘의 기본 이론은 Graph theory와 Calculation Geomerty를 기본 개념으로 합니다.

![1](/assets/img/223255186619/1.png)

![2](/assets/img/223255186619/2.png)

![3](/assets/img/223255186619/3.png)

여기서 조금 더 뻗어 나온다면,

1. Greedy Algorithms

2. Divide and Conquer Algorithms

3. Dynamic Programming Algorithms

4. Network Flow Algorithms

5. Linear/Integer Programming Techniques

위 5개가 가장 대표적이고, 여기서 좀 더 진보된 기술이 요즘 EDA에 적용이 되어있는 것이죠.

![4](/assets/img/223255186619/4.png)

시간 및 공간 복잡성이 낮으면서, 기대효과가 높아야합니다....

대부분의 선형 및 2차 알고리즘은 Physical Design 세계에선 사용이 불가능하다고 보면 됩니다.

아직도 Physical Design EDA가 왜 어려운지? 왜 일부 대기업들이 EDA 시장을 지배하는지 이해가 안 되죠.

​

알고리즘 복잡도를 설명하는 "Big-O notation"처럼,

문제가 왜 어려운지, 얼마나 어려운지를 기준점을 제시하는 방법으로 "P-NP 문제"가 있습니다. 

참고로 P - NP문제는 수학계의 최대 난제인 7대 밀레니엄 문제 중 하나입니참고로 P - NP문제는 수학계의 최대 난제인 7대 밀레니엄 문제 중 하나입니다. 밀레니엄문제이고, 컴퓨터 과학에서 가장 어려운 문제라고 불리는 문제입니다.

자세한건 아래 첨부한 유튜브를 참고하세요.

https://youtu.be/nxbufH4JnpA?si=rSNtwSIeV-1Sb8PD

[![[난제] PNP 문제](https://i.ytimg.com/vi/nxbufH4JnpA/hqdefault.jpg)](https://youtu.be/nxbufH4JnpA?si=rSNtwSIeV-1Sb8PD)

설명 : 후원 | 우리은행 1002-031-127166 (이상엽)━─ ↓↓ 책갈피 ↓↓ ─━01:24 1. P 문제란?06:49 2. NP 문제란?11:18 3. P와 NP 분류의 의의12:57 4. NP-난해 와 NP-완전15:53 5. P NP 문제란?17:44 6. P NP...

Physical Design EDA Tool에서 발생하는 대부분의 문제에 대한 다항식 시간 알고리즘이 없다는 것입니다. 

​

Algorithms for NP-hard Problems

Physical Design에서 대부분의 최적화 문제는 NP-Hard, NP-Complete입니다. 문제가 NP-완전 또는 NP-하드 경우, 해당 문제에 대한 다항식 시간 알고리즘이 존재할 가능성은 거의 없습니다. 이러한 경우 EDA Tool 알고리즘 설계자에게는 다음 네 가지 선택 사항이 남습니다.

​

1. Exponential Algorithms: 입력크기를 최소화하여 작은 Big-O를 유도

2. Special Case Algorithms: 문제에 몇 가지 제한 사항을 적용하여 일반적인 문제를 단순화

3. Approximation Algorithms: 위 2가지 방법이 불가한 경우, 최악을 피해 지금 시도한 이 결과가 Design Rule에 Violation을 발생하게 하지 않는다면, 현재의 시도로 답을 정하는 방법입니다.

-> 1,2,3은 이미 수십년 전 EDA Tool 개발에 대부분 구현이 되었고, 4번과 Machine learning을 기반으로 계속 연구/개발이 이뤄지고 있습니다.

4. Heuristic Algorithms : NP-완전 문제에 직면하면 "경험적 알고리즘"이 답이 되는 경우가 많습니다. Heuristic Algorithm은 솔루션을 생성하지만 솔루션의 최적성을 보장하지는 않습니다. 이러한 알고리즘은 효율성을 검증하기 위해 다양한 벤치마크 사례에서 테스트되어야 합니다. 물리적 설계에 대한 연구의 대부분은 경험적 알고리즘에 집중되어 있습니다.

​

Graph Algorithms

VLSI Physcial Design은 많은 문제들이 Timing 관련 문제인데, 이 Timing 문제는.. 최대한 Net을 짧고, 적은 수의 Cell을 지나야하는 "최단 경로" 문제인거죠.

그러려면, graph search, shortest path, minimum spanning tree, 그리고 여러가지 알고리즘이 더 있겠죠. 알고리즘 내용들만 나열하면,

![5](/assets/img/223255186619/5.png)

1. Graph Search Algorithms : 

Depth-First Search

Breadth-First Search

Topological Search

2. Spanning Tree Algorithms

Boruvka’s Algorithm

Kruskal’s Algorithm

Prim’s Algorithm.

3. Shortest Path Algorithms

Single Pair Shortest Path

All Pairs Shortest Paths

4. Matching Algorithms

5. Min-Cut and Max-Cut Algorithms

6. Steiner Tree Algorithms

​

Geometry Alogithms

Sweep line algorithm

Scanline rendering

​

글이 너무 길어질 것 같아서 알고리즘은 여기까지만 보고, 정리를 하려고 합니다.

- VLSI Physical Design은 Multi-Layer의 Tile 모음으로 표시됩니다. 하나의 칩은 많은 타일로 구성될 수 있습니다.

- EDA Tool은 대화형이므로 다항 시간 내에 편집 작업을 수행할 수 있어야 합니다.

- 많은 문제의 NP-hardness로 인해 휴리스틱 및 근사 알고리즘이 많이 쓰이고, 최근 머신러닝이 많이 쓰입니다.

​

아래 순서로 간단히 작성할 예정입니다!

Partitioning & Floorplanning

Power plan

PLACEment

Global Routing

Detailed Routing

Clock Tree Synthesis

DRC Fix

Compaction

​

​

->

그리고, 봐왔던것처럼..

​

대부분의 문제들이 엄청나게 무겁고, NP-Hard 문제에요. 이런건 머신러닝, AI로 해결되는 문제들이 아닙니다.

SW 회사들이 EDA에 도전하지 않는 이유는.. 이미 EDA회사들이 엄청나게 많은 연구를 해놨어요.

(오픈소스 EDA Tool이 있긴함. 성능차이가 심해서 그렇지.)

​

1. AI가 트레이닝 할 수 있는 정도면 SW 회사들이 도전하겠지만, 문제의 크기가 너무 크고, 답을 주기도 어려우니까 Learning rate를 높일 수가 없어요. 그래서 AI 만으로는 EDA를 만들 수 없습니다.

그래서, EDA를 만들려면 엄청나게 많은 각 조건에 대한 알고리즘을 구현해놔야하는데,

2.기존 EDA 회사들이 이 알고리즘에 대해 다 기밀+특허처리를 해놨습니다. 할거라면 훔쳐와야할텐데, 이건 불법이고, 비용이 비싸죠.

-> 그러니까... SW회사들이 EDA를 만들 일은 없어보입니다. 인수를 하지 않는다면.

3.반도체 설계는 수백 수천 수조원이 들어요. 수십년동안 써왔던 도구를 안 쓰고, 갑자기 새로운 도구가 나왔을 때... 돈 아끼자고 새로운 툴을 쓴다? 안 씁니다.

​

EDA 회사들이 Machine learning을 쓰는것도 특정 조건 일 때에 ML이 들어가게 만들어 놓은거구요.

 해시태그 : 