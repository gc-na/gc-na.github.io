---
published: true
---
## 반도체 설계 결함을 찾는 설계. DFT와 Stuck at fault, Transition Fault ATPG와 Simulation

Design For Test(이하 DFT)는 공정상 결함을 찾기 위한 설계입니다.

​

반도체에 먼지 한 톨이라도 들어가면 결함이 발생하게 됩니다.

![0](/assets/img/222999841092/0.png)

​

​

근데 반도체 양산을 하면 억단위 개수로 양산을 하는데, 일일이 촬영하여 Defect를 찾기는 어렵습니다.

그리고 미세공정으로 들어가며 수율이 아주 낮아졌습니다. 양품 비율이 10% 20%정도입니다.

자율주행 자동차, 의료기기, 방산 산업에 쓰이면서 DFT의 중요도는 더 높아지고 있습니다.

[삼성 vs TSMC, 명운 건 '파운드리 3nm' 경쟁](https://www.hankyung.com/economy/article/2023010914841) : 삼성 vs TSMC, 명운 건 '파운드리 3nm' 경쟁, 향후 2~3년 고객 확보전 치열 삼성, 신기술 적용 승부수 "수율 완벽 수준까지 올라와" TSMC, 6개월 뒤늦게 양산 수율 안정적, 첫 고객 애플 추정

​

그래서, Chip을 설계하면서, 공정에서 생긴 결함을 발견 할 수 있는 회로를 Chip 자체에 설계를 합니다.

이런걸 설계하는 엔지니어를 DFT Engineer라고 불러요.

​

결함의 종류는 반도체 중간에 끊어지거나 어디에 연결되어 0이나 1로 상태가 굳어져(STUCK)되어있는 Stuck at fault,

반도체의 배선이 굵어지거나 얇아져서 속도에 영향이 있는 Transition Fault,

배선이 옆 배선과 붙어버린 Bridge Fault 등 다양한 Fault들이 있습니다.

​

다양한 Fault들이 있고, 양산의 기준을 맞추려면 Foundry가 Sign-off Guide로 주는 기준들을 맞춰야합니다.

Stuckat fault, Transition Fault만 잘 검출해도 대부분의 불량 chip들은 걸러낼 수 있습니다.

​

이런  Fault 검출은 2가지 단계로 구성됩니다.

1.Chip 내부에서 Test pattern을 input pin에 load해주는 DFT (SCAN Shift)

2. Chip 내부에 어떤 Test pattern을 input에 입력해야 output에 출력 되는지에 대한 Test pattern 생성

​

![1](/assets/img/222999841092/1.png)

위 그림에서 AND Gate Y pin wire에 Stuck at 0 Fault가 있는지 확인하려면,

​

OR Gate에 1, 0 혹은 0,1 혹은 11을 인가.

AND Gate에 1 1 인가하면,

정상 동작인 경우 출력이 1이 나와야합니다. 만약에 0이 출력되면 AND Gate에 Stuck at fault가 있다는 것을 확인 할 수 있습니다.

​

다만, Stuck at fault는 기본적으로.. Chip의 clock보다 느린 clock으로 동작합니다. 외부 값을 받아오려면, 동작속도를 빠르게 진행시킬 수 없거든요.

​

​

![2](/assets/img/222999841092/2.png)

​

Transition Fault도 기본적인 오류 검출은 Stuck at과 동일하나,

Transition Fault는 Chip의 자체 clock으로 Fault를 검출합니다.

​

그래서 OCC(On Chip Clock) controller라는 Logic이 필요합니다.

Test pattern을 Load 할 때(SCAN Shift)에만 외부의 느린 SCAN clock으로 동작시키고, 값을 Test 할 때 (SCAN Capture)는 OCC를 통해 Chip 내부 Function clock으로 동작시킵니다.

​

​

 해시태그 : 