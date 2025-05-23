---
published: true
---
## MATLAB 2023 설치 방법, DeltaSGD 예제

포털에 MATLAB 설치 검색 혹은 아래 링크 접속

[MATLAB 및 Simulink 구입 방법](https://kr.mathworks.com/store/?gclid=Cj0KCQjwiZqhBhCJARIsACHHEH961w917XtT7Dx1VwceOnx7fJx1wUn5MQ7tw0Bz8HS9zYcepRSaXp8aAgujEALw_wcB&ef_id=Cj0KCQjwiZqhBhCJARIsACHHEH961w917XtT7Dx1VwceOnx7fJx1wUn5MQ7tw0Bz8HS9zYcepRSaXp8aAgujEALw_wcB:G:s&s_kwcid=AL!8664!3!548870027901!b!!g!!%EB%A7%A4%ED%8A%B8%EB%9E%A9%20%EA%B5%AC%EB%A7%A4&s_eid=ppc_69452703273&q=%EB%A7%A4%ED%8A%B8%EB%9E%A9%20%EA%B5%AC%EB%A7%A4) : 라이선스 옵션 표준용 영리 단체, 정부 또는 기타 조직에서 단일 사용자가 사용할 수 있습니다. 표준용 선택 교육용 학위를 수여하는 기관에서 교육 및 학술 연구에 사용할 수 있습니다. 교육용 선택 학생용 학위를 수여하는 기관에서 실시하는 교육과정과 연계해 사용할 수 있습니다. 자세히 알아보기 학생용 선택 가정용 개인적인 목적으로만 사용할 수 있습니다. 정부, 교육 기관, 영리 단체 또는 기타 조직에서는 사용할 수 없습니다. 자세히 알아보기 가정용 선택 무엇을 선택해야 할지 잘 모르겠습니까? 영업팀 문의 추가 리소스 기존 견적에서 구입...

​

MATLAB 받기 클릭

​

![0](/assets/img/223061548360/0.png)

​

![1](/assets/img/223061548360/1.png)

​

Windows용 다운로드 클릭.

MAC에서도 MATLAB을 사용 할 수 있긴한데.. UI가 뭔가 덜 익숙하기도 하고, Toolbox가 없는게 있는 것 같아서, Windows로 작업을 하고있다.

​

![2](/assets/img/223061548360/2.png)

![3](/assets/img/223061548360/3.png)

​

Toolbox가 pakage 같은건데, 본인은 딥러닝쪽만 할거라 딥러닝 관련 toolbox만 처리하였습니다.

​

![4](/assets/img/223061548360/4.png)

​

![5](/assets/img/223061548360/5.png)

​

​

​

​

MATLAB이 잘 설치 되었는지 확인하기 위해 아래 간단한 인공신경망 회로를 가정하겠습니다.

VLSI 정보와 다르게... AI 쪽은 정보가 정~~~말 많더라구요. 그래서 따로 설명은 안할거고, 예제는 AI 하는 사람들은 안 해본 사람이 없을 DeltaSGD입니다.

Input 4 : output 1 형태 4 묶음의 학습/정답 데이터를 주고, y값 찾는건데, 그림에서 설명하겠습니다.

​

![6](/assets/img/223061548360/6.png)

​

![7](/assets/img/223061548360/7.png)

​

![8](/assets/img/223061548360/8.png)

![9](/assets/img/223061548360/9.png)

```
clear all
X = [ 0 0 1;
 0 1 1;
 1 0 1;
 1 1 1;
 ];
D = [ 0
 0
 1
 1
 ];
W = 2*rand(1, 3) - 1;

for epoch = 1:10000 % train
 W = DeltaSGD(W, X, D);
end
N = 4; % inference
for k = 1:N
 x = X(k, :)';
 v = W*x;
 y = Sigmoid(v)
end

function W = DeltaSGD(W, X, D)
 alpha = 0.9;
  
  N = 4;  
  for k = 1:N
    x = X(k, :)';
    d = D(k);

    v = W*x;
    y = Sigmoid(v);
    
    e     = d - y;  
    delta = y*(1-y)*e;
  
    dW = alpha*delta*x;     % delta rule    
    
    W(1) = W(1) + dW(1); 
    W(2) = W(2) + dW(2);
    W(3) = W(3) + dW(3);    
  end
end

function y = Sigmoid(x)
    y = 1./(1+exp(-x));
end
```

​

![10](/assets/img/223061548360/10.png)

성공. 이제부터 짬짬히 MATLAB 공부도.... 공유하겠습니다.

 해시태그 : 