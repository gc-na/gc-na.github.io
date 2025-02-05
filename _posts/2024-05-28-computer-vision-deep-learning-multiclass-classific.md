---
published: true
---
## [Computer Vision / Deep learning] Multiclass Classification with MNIST Dataset

Computer Vision의 기초,,, Deep Learning의 기초를 다지기 위해 Multiclass Classification에 대해 공부해보려고 합니다.

![0](/assets/img/223089856711/0.png)

MNIST Dataset은 Machine Learning 분야에서 많이 사용되는 데이터 중 하나입니다.

이 데이터는 손으로 쓴 숫자 이미지의 집합으로 구성되어 있습니다. 각 이미지는 28x28 픽셀(dot가 가로 28, 세로 28개) 크기로 구성되며, 이 이미지는 0부터 9까지의 숫자 중 하나를 나타냅니다.

​

![1](/assets/img/223089856711/1.png)

위키피디아 피셜로는 CNN으로 만들어진 MNIST model들이 가장 Error rate가 낮네요.

​

우리는 정말 개념만 살펴볼거라, 

1) 1pixel nosie 섞어서 5x5를 하나의 이미지로 50개의 Data 생성하고.

예를들어 noise 없는 5는 아래처럼 이미지가 그려집니다.

1 1 1 1 1

1 0 0 0 0 

1 1 1 1 0

0 0 0 0 1

1 1 1 1 0

​

![2](/assets/img/223089856711/2.png)

​

2) 5x5 pixel로 30개 데이터셋으로 Training하고, 20개 Data로 Test dat에 사용할 것입니다.

일단 MATLAB code 먼저 보여드릴게요. MATLAB code는 C언어 느낌이라, C 공부해보셨으면 매우 쉽게 하실 것 같습니다. 시간 날때 pytorch 실습자료도 추가해놓을게요.

​

​

TestMultiClass.m : 이 파일에는 Training Data가 들어있습니다.

2개의 Hidden layer로 되어있고, 5x5로 되어있는 행렬 5개로 구성된 3차원 데이터 매트릭스입니다. hidden layer에는 sigmoid function을 썼고, output layer에는 softmax를 사용했습니다... 이전 글에서 설명했으니 참고해주세요.

​

X에서는 Input image 값을 주는거고, D에서는 Input image가 어떤 값을 나타내는건지 알려주는 것이고... Sigmoid 함수를 통해 Weight를 찾아나가는 과정입니다.

```
clear all

rng(3);

X  = zeros(5, 5, 5);
 
X(:, :, 1) = [ 0 1 1 0 0;
               0 0 1 0 0;
               0 0 1 0 0;
               0 0 1 0 0;
               0 1 1 1 0
             ];
 
X(:, :, 2) = [ 1 1 1 1 0;
               0 0 0 0 1;
               0 1 1 1 0;
               1 0 0 0 0;
               1 1 1 1 1
             ];
 
X(:, :, 3) = [ 1 1 1 1 0;
               0 0 0 0 1;
               0 1 1 1 0;
               0 0 0 0 1;
               1 1 1 1 0
             ];

X(:, :, 4) = [ 0 0 0 1 0;
               0 0 1 1 0;
               0 1 0 1 0;
               1 1 1 1 1;
               0 0 0 1 0
             ];
         
X(:, :, 5) = [ 1 1 1 1 1;
               1 0 0 0 0;
               1 1 1 1 0;
               0 0 0 0 1;
               1 1 1 1 0
             ];

D = [ 1 0 0 0 0;
      0 1 0 0 0;
      0 0 1 0 0;
      0 0 0 1 0;
      0 0 0 0 1
    ];
      
W1 = 2*rand(50, 25) - 1;
W2 = 2*rand( 5, 50) - 1;

for epoch = 1:10000           % train
  [W1 W2] = MultiClass(W1, W2, X, D);
end

N = 5;                        % inference
for k = 1:N
  x  = reshape(X(:, :, k), 25, 1);
  v1 = W1*x;
  y1 = Sigmoid(v1);
  v  = W2*y1;
  y  = Softmax(v)
end




%-----Function Define-------
% MultiClass
function [W1, W2] = MultiClass(W1, W2, X, D)
  alpha = 0.9;
  
  N = 5;  
  for k = 1:N
    x = reshape(X(:, :, k), 25, 1);
    d = D(k, :)';
    
    v1 = W1*x;
    y1 = Sigmoid(v1);
    v  = W2*y1;
    y  = Softmax(v);
    
    e     = d - y;
    delta = e;

    e1     = W2'*delta;
    delta1 = y1.*(1-y1).*e1; 
    
    dW1 = alpha*delta1*x';
    W1 = W1 + dW1;
    
    dW2 = alpha*delta*y1';   
    W2 = W2 + dW2;
  end
end

% Sigmoid
function y = Sigmoid(x)
  y = 1 ./ (1 + exp(-x));
end
% Softmax
function y = Softmax(x)
  ex = exp(x);
  y  = ex / sum(ex);
end
```

결과값은 아래와 같습니다. 잘 트레이닝되었네요.

![3](/assets/img/223089856711/3.png)

​

​

​

여기에 1 pixel noise가 섞인 Data set 5개를 넣어보겠습니당.

```
clear all

TestMultiClass;                 % W1, W2

X  = zeros(5, 5, 5);
 
X(:, :, 1) = [ 0 0 1 1 0;
               0 0 1 1 0;
               0 1 0 1 0;
               0 0 0 1 0;
               0 1 1 1 0
             ];
 
X(:, :, 2) = [ 1 1 1 1 0;
               0 0 0 0 1;
               0 1 1 1 0;
               1 0 0 0 1;
               1 1 1 1 1
             ];
 
X(:, :, 3) = [ 1 1 1 1 0;
               0 0 0 0 1;
               0 1 1 1 0;
               1 0 0 0 1;
               1 1 1 1 0
             ];
         
X(:, :, 4) = [ 0 1 1 1 0;
               0 1 0 0 0;
               0 1 1 1 0;
               0 0 0 1 0;
               0 1 1 1 0
             ];     
         
X(:, :, 5) = [ 0 1 1 1 1;
               0 1 0 0 0;
               0 1 1 1 0;
               0 0 0 1 0;
               1 1 1 1 0
             ];    
         
N = 5;                        % inference
for k = 1:N
  x  = reshape(X(:, :, k), 25, 1);
  v1 = W1*x;
  y1 = Sigmoid(v1);
  v  = W2*y1;
  y  = Softmax(v)
end



%-----Function Define-------
% MultiClass
function [W1, W2] = MultiClass(W1, W2, X, D)
  alpha = 0.9;
  
  N = 5;  
  for k = 1:N
    x = reshape(X(:, :, k), 25, 1);
    d = D(k, :)';
    
    v1 = W1*x;
    y1 = Sigmoid(v1);
    v  = W2*y1;
    y  = Softmax(v);
    
    e     = d - y;
    delta = e;

    e1     = W2'*delta;
    delta1 = y1.*(1-y1).*e1; 
    
    dW1 = alpha*delta1*x';
    W1 = W1 + dW1;
    
    dW2 = alpha*delta*y1';   
    W2 = W2 + dW2;
  end
end

% Sigmoid
function y = Sigmoid(x)
  y = 1 ./ (1 + exp(-x));
end
% Softmax
function y = Softmax(x)
  ex = exp(x);
  y  = ex / sum(ex);
end
```

결과값은 아래와 같습니다.

![4](/assets/img/223089856711/4.png)

![5](/assets/img/223089856711/5.png)

사실 위 데이터를 사람이 보면, 1이라고 생각 할 것 같은데, 제가 만든 트레이닝세트에서는 4로 인식을 하는군요. 2, 3, 5는 잘 찾는 것 같은데... 1이랑 4를 잘 못 찾는 것 같습니다.

​

```
clear all

rng(3);

X  = zeros(5, 5, 5);
 
X(:, :, 1) = [ 0 1 1 0 0;
               0 0 1 0 0;
               0 0 1 0 0;
               0 0 1 0 0;
               0 1 1 1 0
             ];
 
X(:, :, 2) = [ 1 1 1 1 0;
               0 0 0 0 1;
               0 1 1 1 0;
               1 0 0 0 0;
               1 1 1 1 1
             ];
 
X(:, :, 3) = [ 1 1 1 1 0;
               0 0 0 0 1;
               0 1 1 1 0;
               0 0 0 0 1;
               1 1 1 1 0
             ];

X(:, :, 4) = [ 0 0 0 1 0;
               0 0 1 1 0;
               0 1 0 1 0;
               1 1 1 1 1;
               0 0 0 1 0
             ];
         
X(:, :, 5) = [ 1 1 1 1 1;
               1 0 0 0 0;
               1 1 1 1 0;
               0 0 0 0 1;
               1 1 1 1 0
             ];
X(:, :, 1) = [ 1 0 1 1 0;
               0 0 1 1 0;
               0 1 0 1 0;
               0 0 0 1 0;
               0 1 1 1 0
             ];

X(:, :, 6) = [ 0 0 1 1 0;
               1 0 1 1 0;
               0 1 0 1 0;
               0 0 0 1 0;
               0 1 1 1 0
             ];

X(:, :, 7) = [ 0 0 1 1 0;
               0 0 1 1 0;
               1 1 0 1 0;
               0 0 0 1 0;
               0 1 1 1 0
             ];

X(:, :, 8) = [ 0 0 1 1 0;
               0 0 1 1 0;
               0 1 0 1 0;
               1 0 0 1 0;
               0 1 1 1 0
             ];

X(:, :, 9) = [ 0 0 1 1 0;
               0 0 1 1 0;
               0 1 0 1 0;
               0 0 0 1 0;
               1 1 1 1 0
             ];

X(:, :, 10) = [ 0 0 1 1 1;
               0 0 1 1 0;
               0 1 0 1 0;
               0 0 0 1 0;
               0 1 1 1 0
             ];

X(:, :, 11) = [ 0 0 1 1 0;
               0 0 1 1 1;
               0 1 0 1 0;
               0 0 0 1 0;
               0 1 1 1 0
             ];


D = [ 1 0 0 0 0;
      0 1 0 0 0;
      0 0 1 0 0;
      0 0 0 1 0;
      0 0 0 0 1;
      1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0
    ];
      
W1 = 2*rand(50, 25) - 1;
W2 = 2*rand( 5, 50) - 1;

for epoch = 1:10000           % train
  [W1 W2] = MultiClass(W1, W2, X, D);
end

N = 5;                        % inference
for k = 1:N
  x  = reshape(X(:, :, k), 25, 1);
  v1 = W1*x;
  y1 = Sigmoid(v1);
  v  = W2*y1;
  y  = Softmax(v)
end




%-----Function Define-------
% MultiClass
function [W1, W2] = MultiClass(W1, W2, X, D)
  alpha = 0.9;
  
  N = 5;  
  for k = 1:N
    x = reshape(X(:, :, k), 25, 1);
    d = D(k, :)';
    
    v1 = W1*x;
    y1 = Sigmoid(v1);
    v  = W2*y1;
    y  = Softmax(v);
    
    e     = d - y;
    delta = e;

    e1     = W2'*delta;
    delta1 = y1.*(1-y1).*e1; 
    
    dW1 = alpha*delta1*x';
    W1 = W1 + dW1;
    
    dW2 = alpha*delta*y1';   
    W2 = W2 + dW2;
  end
end

% Sigmoid
function y = Sigmoid(x)
  y = 1 ./ (1 + exp(-x));
end
% Softmax
function y = Softmax(x)
  ex = exp(x);
  y  = ex / sum(ex);
end
```

Model 만드는 과정이 그니깐,

​

A Training set으로 Model 만들고 Test해보고,

B Training set으로 Model 만들고 Test해보고....

이런식으로 반복을 해서, 가장 좋은 Training set을 찾아서, Model 만드는겁니다.

​

AI로 박사과정 하고있는 친구한테....

"Training, Validation, Test 벡터세트" 어떤 비율으로 주냐고 물어보니까, 보통 Training Data, Validation data, Test data로 6:3:1이나 7:2:1 혹은 9:1로 준다고 하더라구여.

​

​

![6](/assets/img/223089856711/6.png)

​

![7](/assets/img/223089856711/7.png)

이런거 트레이닝 데이터에 실수로 넣었다가, 2랑 3 둘다 모델이 이상하게 만들어지더라구요. 이런거 트레이닝 데이터에 안 들어가도록 조심히 해야합니다. 

​

데이터셋 한 50개  정도 넣어보니, 5x5에서는 충분히 만족스러운 MODEL이 생성되었습니다.

​

​

​

인공신경망에서 data의 양과 질이 어떻느냐가 가장 중요한 요소인 것 같고, 이 요소들을 어떤 비율로 Training, Validation으로 나눌지도 중요하며, 어떤 함수를 몇 개의 Hidden layer로 사용할지 알아내는 것이 중요합니다.

Learning process를 요약하면 input ~ output 간 weight를 찾는 것입니다. Training data의 양이 적거나 불균형하게 분포되어 있다면, 모델이 학습한 패턴이 편향될 수 있습니다.

그리고 적당한 노이즈를 추가하여 모델 생성에 노이즈 마진이 필요합니다. 리서치해보니, sigmoid 함수가 binary classification에선 많이 쓰이지만, 이외의 경우엔 relu 함수가 모델 생성에도, 시간적으로도 더 좋다고 하네요. ㅎㅎ

​

​

​

 해시태그 : 