---
published: true
---
## 반도체 Design란? Technology란? Process란? DTCO란?

반도체 직무 소개부터 반도체 관련주까지 너무나도 많은 용어들이 있어 어렵습니다.

심지어 Design, Technology, Process 이런 단어를 사전적으로 알고 있는데도 잘 모르겠죠.

​

Design과 Technology는 10단계로 나누면 대강 아래처럼 나눠진다고 보시면 됩니다.

위 정보는 아주 간단히 요약한거고,

이것보다 훨~씬 많은 커뮤니케이션이 Fabless <-> Foundry간 이어집니다.

![2](/assets/img/223367292241/2.png)

​

DTCO란?

주로 성숙도가 낮은 반도체 공정(새롭게 개발되어 양산 경험이 많지 않은 공정)에 대해, 반도체 개발 초기 과정부터 설계 및 공정 모두 동시에 최적화를 목적으로 하는 방법론입니다.

DFM (Design For Manufactoring)은 성숙 공정 (어떤 부분에 대해 공정에서 약점이 있는지.. 이런것들이 다 파악된)에서 주로 사용되는 방법론이구요.

​

DTCO나 DFM이나 목적은 "PPA와 Yield"입니다. (PPA: Power, Performance, Area)

선진공정에서 좋은 반도체 -> DTCO

성숙공정에서 좋은 반도체 -> DFM

​

사실, 글은 여기까지만 읽으셔도 됩니다. 검색창에 반도체 회사 이름 + DTCO라고 검색하시면 각 회사별 DTCO 전략이 나와있습니다.

​

회사마다 DTCO 단계에서 하는 것이 다르고, 각 공정마다 DTCO에서 하는 것이 다릅니다.

그래서 DTCO가 무엇인지는 각 회사에서 보면 될 것 같고, 인텔에서 1.8nm 공정을 하겠다고 공언을 했으니~ intel의 DTCO 전략에 대해 보시면 좋을 것 같습니다.

(intel도 고객사라 제가 다루긴 조심스럽네요.)

![3](/assets/img/223367292241/3.png)

​

Why DTCO?

DTCO는 PPA, Yield, 제조 비용을 개선하기 위해 함께 최적화된 설계 및 공정 기술입니다.

보통 새로운 기술 노드를 위한 DTCO는 단순히 Channel length만 줄이는 것이 아닙니다. 일반적으로 이전 세대와 정확히 동일한 구조, 더 작은 구조를 제공하는 대신 여러가지 실험을 해보고, 상당한 아키텍처 혁신을 수반합니다. (그래서 엔지니어는 평생 배우는 직업인가봐요..)

엔지니어들은 반도체는 2년마다 2배씩 집적도가 높이기 위해 노력을 하고 있고, 2년마다 정말 급변하고 있습니다. 지금은 3D 반도체가 나오고 있죠.

​

​

아래 글은 tsmc에서 정리한 "DTCO"에 대한 내용

https://www.tsmc.com/english/news-events/blog-article-20220615

​

아래 글은 램리서치가 2021년에 정리한 "DTCO"입니다.

https://www.thelec.kr/news/articleView.html?idxno=14054

[[기고] 반도체 가상 제조를 활용해 '설계 기술 동시 최적화' - 전자부품 전문 미디어 디일렉](https://www.thelec.kr/news/articleView.html?idxno=14054) : 글: 조셉 어빈 램리서치 반도체 프로세스 및 공정 디렉터 설계 기술 공동 최적화(Design Technology Co-Optimization, DTCO)를 사용하면 반도체 기술 개발 초기 과정에서 설계 및 공정(제조)을 동시에 충독할 수 ...

https://www.youtube.com/watch?v=jA-bu3viEXc

[![Design Technology Co-Optimization](https://i.ytimg.com/vi/jA-bu3viEXc/hqdefault.jpg)](https://www.youtube.com/watch?v=jA-bu3viEXc)

설명 : Rising complexity is making it increasingly difficult to optimize chips for yield and reliability. David Fried, vice president of computational products at ...

 해시태그 : 