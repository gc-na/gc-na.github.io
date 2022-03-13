---
layout: post
title: DRC란? Design Rule Constraints란? Unknown, Metasatability 차이
subtitle: What is DRC in vlsi?
tags: [DRC, Capacitance, Transition, Fanout]
comments: true
---

우선, [wikipedia](https://en.wikipedia.org/wiki/Metastability_(electronics) 에 자세한 정보가 나와있으니, 참고하시길 바랍니다. 


X(don't care, Unknown) -> Z(High Impidance) -> Metastability 순으로 설명하겠습니다.


Digital은 0과 1로 이루어져 있습니다. 우리가 진리표를 그릴 때, 어떤 입력이 들어오든 출력이 결정 되어있으면, 거기엔 X (don't care) 표시를 해줍니다.

입력에선 사실 이런걸 몰라도(?) 상관 없는데, 출력엔 이게 정말 중요합니다. 칩이 버그가 생길 수 있거든요.


반도체 설계로 밥벌이하는 사람들도 이거로 실수하고, 툴에서도 최대한 이런 문제(LINT)가 있다는걸 미리 알려주지만.. 툴도 찾지 못하고 설계자도 인식을 못하면 버그 있는 칩이 양산될 될 수 있습니다. 자율주행 자동차나, 의료기에 이런 버그가 있다면 끔찍하겠죠?


그 예시를 위해 몇가지 예를 들겠습니다.



1. 코드가 아래처럼 동작되도록 써있다고 합시다.

C=A

C=B


C, Python 같은 언어는 순차적으로 진행되어, 최종적으로 C에선 B의 값을 갖고 있습니다.



그러나 HDL은 Hardware Description language입니다. 코드를 쓰면, 회로가 만들어져요. 전기 신호를 회로들에게 보내면, 신호들은 병렬적으로 움직이죠.

C=A, C=B 이런식으로 코드를 쓰면, A와 B의 출력이 동시에 C라는 회로에 들어갑니다. 그러면 A가 나올지 B가 나올지 모르겠죠? 

2. Y=AA'라는 회로가 있다면? 이상적으로 생각하면, 항상 Y는 0으로 값이 고정 되겠죠? 실제론 그렇지 않습니다.

![Monster job](/assets/img/fffggfdgfdag.png)

A와 A에 인버터 달린 회로가 AND게이트의 입력으로 나가고, AND게이트의 출력으로 나올 것입니다.

실제 회로에는 인버터를 지날 때 지연시간이 존재합니다.

A가 0인상태라면, A에선 0이 A'에선 1이 들어가 AND게이트 출력에선 0이 나옵니다. A가 0에서 1로 바뀐다면, A는 1로 바뀌고, A'는 인버터를 통해 0으로 바뀝니다.

A'는 A에서 인버터를 지나는 시간 때문에 1초 늦게 0으로 바뀐다고 합시다. A'가 1초동안은 이전 값(1)을 보내고 있습니다. 그러면, 1초동안 A와 A'는 1을 보내기 때문에 1초동안은 Y에서 1의 값이 나타납니다.


이밖에도.. 다양한 이유들로 LINT들이 생깁니다. 이상적인 시뮬레이션에서는 이 설계가 문제 없어보이는데, 실제론 이상이 있는 것들이요.



아무튼.. 여기까지는 'X'에 대해 설명했습니다. X는 이렇게.. 0이 나오는건지 1이 나오는건지 모르는 상태에요.





Z는 제 3의 상태라고 합니다. pspice나.. 전자캐드를 사용하다보면, floating되었다고 자주 보실겁니다. 선이 연결이 안되어, 높은 저항값을 갖고있는 High Impidance이죠.

![Monster job](/assets/img/dsfasdfsdsasf.png)


학부에서는 0/1/X/Z까지만 배우죠. 다음으로 하는 Metastability는 조금 어려울 수 있습니다.



로직들을 연결하는 Wire에도 사실 저항과 커패시턴스 값이 존재한다는걸 아시나요?

제가 자주 인용하는 [Apple의 M1](https://www.cnet.com/tech/computing/m1-ultra-apple-just-unveiled-its-most-powerful-chip-yet/) 같은 경우엔, 1000억개의 Transistor가 있습니다.

만약에 집적회로 속 얇은 선 하나가 1억개의 transistor를 연결한다면, 무슨 원리로 그런지는 모르겠지만 과부화가 걸리겠죠? (만약에 클럭 스피드가 아주 느리면 상관 없을 수도 있습니다. 트랜지스터들이 스위칭되는 것이 문제거든요.)

이런 문제들이 생기면 출력이 불안정해집니다. 이런걸 Metastability라고 해요.

Metastability를 야기하는 Factor들이 대표적으로 3가지가 있습니다.

Fanout / Transition / Capacitance

사실 저는 공정 엔지니어가 아니다보니, 기억이 안 납니다. 저는 안 쓰거든요. 배우긴 했고, 씽크대 아래에 있는 제 전공 책 안에 이것들이 어떻게 작용하는지 써 있지만.... 필요하면 찾아서 보겠습니다. 안 써서 까먹었어요.

하지만, 이거로 우리가 design을 합성 할 때, max fanout 개수, max capacitance는 공정엔지니어들이 자신의 공정에 맞춰 놓은 datasheet에 꼭 맞춰야합니다. 그렇지 않으면 칩 수율이 엉망이 될거니까요.



근데 수율이라고 말하니까.. bug defect fault failure error에 대해서 쓰고싶네요. 다 다른 개념이거든요. 저도 배웠는데 헷갈려서.. 봄이 끝나기 전에 써보겠습니다.
