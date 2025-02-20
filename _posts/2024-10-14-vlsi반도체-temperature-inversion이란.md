---
published: true
---
## [VLSI/반도체] Temperature Inversion이란?

우선 고체물리역학에서 반도체 개념부터 간단히 요약하고 가겠습니다.

​

![0](/assets/img/223444413910/0.png)

![1](/assets/img/223444413910/1.png)

1. 온도와 캐리어 이동도(Carrier Mobility)의 관계:

반도체 내에서 전자와 정공의 이동도는 온도에 따라 변합니다. 온도가 올라갈수록 lattice vibration이 증가하여 캐리어의 이동을 방해합니다. 

​

2. 캐리어 이동도와 저항의 관계:

캐리어 이동도가 감소하면 반도체 내부의 저항이 증가합니다. 

​

3. 저항과 RC Delay의 관계:

반도체 회로에서 저항과 커패시턴스는 RC Delay를 발생시킵니다.

​

4. 온도와 Delay의 관계:

위의 수식들을 종합하면, 온도 상승 → 캐리어 이동도 감소 → 저항 증가 → RC Delay 증가의 관계를 도출할 수 있습니다. 이를 하나의 수식으로 나타내면 다음과 같습니다.

​

https://www.iiserkol.ac.in/~ph324/StudyMaterials/ResistivityTdep.pdf

​

​

이외에도 온도 상승은 문턱 전압(Threshold Voltage) 감소, 누설 전류(Leakage Current) 증가 등의 영향을 미쳐 회로의 성능과 안정성을 떨어뜨릴 수 있습니다.

​

![2](/assets/img/223444413910/2.png)

![3](/assets/img/223444413910/3.png)

​

그런데, 미세공정으로 들어가다보면, 오히려 온도가 낮아질 때 지연시간이 커지는 특성을 볼 수 있습니다.

이를 Temperature Inversion이라고 부릅니다.

![4](/assets/img/223444413910/4.png)

미세 공정 노드에서는

​

1. 온도 상승에 따라 문턱 전압(V_th)이 감소하고, (V_GS - V_th)값이 줄게 됩니다.

​

2. 이로 인해 오버드라이브 전압이 증가하여 드레인 전류(I_d)가 증가합니다.

(반면, 과거 공정 기술에서는 오버드라이브 전압의 영향이 상대적으로 작습니다. 최신 공정에서는 VDD 값이 매우 낮다보니, 이런 오버드라이브의 영향이 크게 나타나는거죠.)

​

3. 오버드라이브 전압의 영향이 캐리어 이동도의 영향보다 크게 작용하여 셀의 지연 시간이 감소, temperature inversion 현상이 나타납니다.

​

또,

- Long channel에서 Vth에서 온도는 Vth 값에 약간의 영향을 미치지만, 이것보다는 온도가 증가함에 따라 전자는 많은 운동 에너지를 가지고 충돌하여 mobility 저하를 설명하므로 전류가 증가하지 않고 지연시간이 증가합니다

- Short channel 에서는 온도가 증가하면 Vth가 크게 감소하고(DIBL effect), 전류가 증가하며 지연시간이 증가됩니다.

​

![5](/assets/img/223444413910/5.png)

CMOS Transconductor Analysis for Low Temperature Sensitivity Based on ZTC MOSFET Condition, P.Toledo​

참고로, MOSFET Zero-Temperature-Coefficient (ZTC) Effect라고 해서 "오버드라이브 전압 영향과 캐리어 이동도 영향"이 셀의 지연 시간에 서로 상쇄하여 0이 되는 지점이 최소 지연시간이 되는 지점입니다.

​

ZTC에 대한 내용이 아래 문서에 있으니 참고하시면 좋을 것 같습니다.

https://lume.ufrgs.br/bitstream/handle/10183/140814/000991726.pdf?sequence=1

​

​

 해시태그 : 