---
layout: post
title: [ML/DL] Sigmoid Function이란?
subtitle: #CTS #P&R #ASIC
tags: [PhysicalDesign]
comments: true
---


AI를 만들려면, 학습시킬 데이터가 필요하고, 모델을 어떻게 만들지 전략이 필요합니다.

​

우선 우리가 사용하는 대부분의 작업은, 입력이 있고 출력이 있습니다. 우리가 원하는 것은 입력을 줬을 때, AI가 출력을 주길 원합니다.

​

Activation function의 기본 목적은 입력값에 대한 출력값에 줄 영향치를 결정하는 것입니다.

Activation function은 일종의 f(x)같은 함수입니다.

아래 식이 Sigmoid function의 예인데, 이 함수는 출력 값이 0~1으로 나오기 때문에, 이 함수를 쓰면, 입력값이 아무리 크든 작든 출력값이 간단해집니다.



![ba](​https://postfiles.pstatic.net/MjAyMzA0MTBfMTUy/MDAxNjgxMTM3MDQ1MTc4.cDymRNw923Q9UADpp5UqiKhIjy4TkmMS7eBK7Avh_-Yg.AjeQzXgd4ecz-eXYbfTYTdM_yU9TW4l-XxcXsvXx2rIg.PNG.gc_na/image.png?type=w966)

​

Activation function은 이진 분류, 다중 분류, 회귀 등 다양한 인공신경망 모델에서 사용됩니다. 다양한 활성화 함수가 있지만, 대표적인 함수로는 Sigmoid 함수, ReLU 함수, Tanh 함수, Softmax 함수 등이 있습니다.

이 activation function을 뭘 썼느냐에 따라, Model의 성능과 정확도에 큰 영향을 끼치기에, 어떤 데이터를 쓰냐에 따라 잘 맞춰 써야한다고 합니다.

​

​

​

인공신경망에서는 각 뉴런의 출력값을 결정하는 데 사용됩니다.

아래 잘 설명된 예시가 있어서 갖고왔습니다. 한번 천천히 읽어보고 이해해보면 좋을 것 같습니다.

​![ba](https://postfiles.pstatic.net/MjAyMzA0MTBfMTMy/MDAxNjgxMTM3NTQzMDA0.RMIdRbnLH8vZRNx0CLzgGNJcfioy-9PyErqCvzpkYlAg.Cw1Nz90moM1tonQHANq6GdhzZIHTOsa6QUL5wu0-SuIg.PNG.gc_na/image.png?type=w966)


Sigmoid 함수는 다음과 같이 정의됩니다:

​

f(x) = 1 / (1 + e^-x)

​

여기서 x는 입력값입니다. Sigmoid 함수는 입력값 x가 커질수록 1에 가까워지며, 작아질수록 0에 가까워집니다. 따라서 Sigmoid 함수는 출력값이 0과 1 사이에 있으며, 이것은 이진 분류 문제에서 매우 유용하게 사용됩니다.

​

Sigmoid 함수는 미분 가능한 함수이며, 역전파(backpropagation) 알고리즘에서 사용되는 기울기(gradient) 계산에 유용합니다.

역전파 알고리즘은 인공신경망의 가중치(weight)를 업데이트하는 데 사용되는 알고리즘으로, 기울기 계산은 이 과정에서 매우 중요합니다. 따라서 Sigmoid 함수는 역전파 알고리즘에서 활성화 함수로 많이 사용됩니다.

​

하지만, Sigmoid 함수는 출력값이 0이나 1에 가까워지면 기울기가 매우 작아져서 기울기 소실(gradient vanishing) 문제가 발생할 수 있습니다. 이 문제는 깊은(deep) 신경망에서 발생할 가능성이 높아지며, 이를 해결하기 위해 ReLU(Rectified Linear Unit) 함수 등 다른 활성화 함수가 사용되기도 합니다.
