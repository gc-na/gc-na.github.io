---
layout: post
title: ASIC STA, PI 공부하면서 생긴 궁금증 정리
subtitle: STA INTERVIEW QUESTION ASIC
tags: [ASIC, STA, PI, 半导体]
comments: true
---

ASIC에서 Front end! 그중에서 PI! 특히 STA를 위해 필요한 핵심 개념을 정리해보겠습니다.
참고로 저는 Synopsys EDA tool만 써봤습니다~~

1. Setup time, Hold time이 뭔가요?
Violation이 일어나지 않기 위한 조건으로, 클럭의 엣지를 기준으로, 셋업은 엣지 이전에, 홀드는 엣지 이후에 데이터 값의 최소 유지시간입니다.

2. Setup time violation과 hold time violation 중에 뭐가 더 나쁜가요?
hold time violation입니다. hold time violation은 data path와 관련이 있습니다. Setup time violation은 클럭 주기 조절로 violation을 막을 수 있습니다.  
Tc2q + Tcomb + Tsetup ≤ Tclk + Tskew  
Tc2q + Tcomb ≥ Thold + Tskew

3. Setup time Violation과 Hold time Violation을 어떻게 피할 수 있나요?
Setup time Viloation은, Tc2q, Tcomb를 줄이고, 클럭을 늘리면 됩니다. (클럭 늘리는건 피하는게 좋으므로, 클럭 스큐를 조절해보거나 회로를 최적화해본다.) 
Hold time Viloation은, Tc2q, Tcomb를 높이면 됩니다. (버퍼 추가)

4. Slack이 뭔가요?
DRT와 DAT의 차입니다. Setup time Slack은 DRT-DAT이고, Hold time Slack은 DAT-DRT입니다.
차가 음수가 되면 Violation이 일어납니다.  
DRT=Capture edge - Launch edge - Setuptime이고, DAT는 로직들의 딜레이로 알 수 있습니다.

5. 어떻게 Negative Slack을 개선하나요?
사이에 플립플롭(파이프라인)을 넣어서 DAT를 줄여주거나, 회로의 딜레이 최적화로 개선할 수 있습니다.

6. Critical path가 뭔가요?
Input에서 Output까지 Maxumun delay입니다.

7. Critical path의 delay는 어떻게 계산하나요?
게이트 딜레이의 합+네트딜레이의 합 (네트딜레이를 볼 수 없다면, 팬아웃등을 참고함.)

8. 클럭의 최소 주기는 어떻게 구하나요? 주파수는 어떻게 구하나요?
Tc2q + Tcomb + Tsetup ≤ Tclk + Tskew
freqeuncy=1/T

9. 회로 설계자가 회로의 속도를 빠르게하는 방법?
최대값의 주파수를 사용한다. Critical path를 줄인다.(path가 input에서 output까지 지나갈 로직들을 복제하고 나눠서, 회로가 커지고 다른 회로가 늦어지는 대신에 느린 path가 지나치는 로직의 수를 줄임)

10. STA가 뭔가요?
STA는 시뮬레이션할 필요 없이 회로가 constraint에 대한 timing violation이 일어날 수 있는 모든 경로에 대해 정상 작동 여부를 판단하는 방법. 기능 검증은 하지 않습니다.

11. SDF는 어떻게 만드나요? 디자인이 달라졌을 때, SDF를 재활용 할 수 있나요? 어떻게 이 파일을 만드나요?
디자인이 달라져서 셀, 네트 정보 등이 바뀌면 적용하지 못합니다.  
SPEF파일에서 정의된 RC값을 starRC를 통해 엘모어 딜레이로 환산하고, SDF파일엔 딜레이로 저장합니다.

주변사람들한테 질문 받았던게 더 있었던 것 같은데 기억이 잘 안난다..

