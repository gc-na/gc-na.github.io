---
published: true
---
## [Deep learning] Backpropagation algoritihm (오차역전파)란 + 유

Backpropagation algorithm은 Artificial Neural Network에서 가중치(weight)와 편향(bias)을 업데이트하기 위한 알고리즘입니다. Backpropagation은 Gradient Descent 알고리즘과 함께 사용되며, 인공신경망에서 가중치와 편향을 조정해 학습을 진행합니다.

​

Backpropagation 알고리즘은 인공신경망에서 발생한 오차(error)를 역전파(Back propagation)하여 각 노드(node)의 오차 기여도를 계산하고, 이를 기반으로 가중치와 편향을 조정합니다. 이 과정에서 Chain Rule을 사용합니다.

​

순서도로 설명하면,

1. Backpropagation 알고리즘은 먼저 인공신경망의 출력값과 실제값 사이의 오차를 계산합니다. 

2. 오차를 각각의 노드에서 역방향(backward)으로 전파하여 각 노드의 기여도를 계산합니다.

3. 이 기여도를 이용하여 가중치와 편향을 업데이트합니다.

이 과정을 반복하여 인공신경망을 학습시킵니다.

​

이 기법은 2-layer 이상인 Deep learning에서 유리합니다.

​

![0](/assets/img/223071802280/0.png)

​

​

Backpropagation 알고리즘을 유도를 제가 깔끔하게 유도해보려고 했는데 ㅜㅜ 지저분해졌습니다. 참고는 안될 것 같은데, 기록용으로 남깁니다.

![1](/assets/img/223071802280/1.png)

![2](/assets/img/223071802280/2.png)

​

​

​

Backpropagation은 인공지능의 입문자들이 슬슬 떠나게 되는 계기가 되는.. 처음에 이해하기가 어려운 부분입니다! 아래 유튜브에 한글 자막도 있으니, 참고해주세요~

[![What is backpropagation really doing? | Chapter 3, Deep learning](https://i.ytimg.com/vi/Ilg3gGewQ5U/hqdefault.jpg)](https://youtu.be/Ilg3gGewQ5U)

설명 : What's actually happening to a neural network as it learns?Help fund future projects: https://www.patreon.com/3blue1brownAn equally valuable form of support ...

​

 해시태그 : 