---
layout: post
title: 저전력 반도체 설계 동향
subtitle: #lowpower
tags: low power design vlsi
comments: true
---



핸드폰, 노트북 등 최근 소형 휴대용 기기들은 고속, 다기능화되어 가는 추세로 많은 전력을 소모 한다. 한정된 배터리 용량에서 휴대시간을 늘리기 위해서는 저전력 SoC 설계는 고려해야 할 중요한 요소 중에 하나이다.

​

SoC 전력 소비는 Dynamic Power와 Static Power로 구분된다.

**Dynamic power :**

Transistor의 출력 신호가 Dynamic 해질 때 (그러니까, 0->1, 1->0 등 신호가 변할 때) 발생하는 Power이다.

Internal Power와 Wires power가 Dynamic power에 사용된다.

SPICE Tool이나 PrimeTime PX, PrimePower 등... 잘 살펴보면 Internal power와 wire power가 있다... 이걸 합하면 Dynamic power이다.

좀 더 교과서적으로 설명하면, Dynamic power는 출력신호가 변경되는 경우 Transistor 동작 중 흐르는 전류에 의해 소비되는 전력으로 출력 커패시턴스를 충전 및 방전하는 데 필요한 스위칭전류(Switching Current)와 셀의 스위칭 동안 NMOS 및 PMOS 트 랜지스터가 동시에 모두 동작 상태일 때 단락전류 (Short Current)에 의해 소비되는 전력이다. (CMOS 내 NMOS와 PMOS는 이상적이지 않기에, 둘다 열리는 찰나의 순간이 있는데, 이 때 큰 전력소비를 한다...)

​

**Static power :**

출력신호가 Static해도(신호가 변하지 않고 정적인 상태) 소모되는 Power. 질질 샌다고해서 leakage power라고도 많이 불린다.

​

자세한 공식은 아래에서..

​

![](https://postfiles.pstatic.net/MjAyMzA3MTdfNDQg/MDAxNjg5NjAyMTQ4ODg2.fJkl0fZOwHNIq4ls6Wl9lfGaR8Z3f39JTynbUpsxphwg.zmUvGukXfuwrAlpvv41V2vgjj5ot1M3FQBA10YjHgekg.PNG.gc_na/image.png?type=w966)

​

공정 회사에서는 Transistor 단위로 소자 설계를 한다.

Transistor의 채널 길이를 짧게 만들 수록, 신호전환에 필요한 전압이 줄어들게된다. -> Dynamic power가 줄어든다.

그런데... 채널 길이가 짧을 수록 source와 drain간 간격이 짧아지고... 새어나가는 전류들이 점점 많아진다.

​

그래서 위 그림에서 보면 미세공정으로 갈 수록 leakage power의 비중이 커짐을 볼 수 있다.

또, 요즘은 Chip size가 크더라도 어떻게든 저전력 chip을 만드는 것이 중요해졌다. 배터리가 오래 가야하고.. 에너지 이슈도 있으니까.

그래서 빅-리틀 코어처럼.. 반도체 chip 설계를 "High performance 일 때는 A Core가 동작, Low power mode 일 때는 B core가 동작" 처럼 설계를 하다보니, Chip size는 커졌고, 잠 자고 있는 module들은 많아지고, 점점 더 static power가 커지고 있다

​

-> 1줄요약 : power = dynamic + static. 미세공정으로 갈 수록 static power 문제가 큼.

​

![](https://postfiles.pstatic.net/MjAyMzA3MTdfMTk0/MDAxNjg5NjAyMjM0MjU3.naEhFeSiOrSUpEH_F5nGhG1xklBstdzQ5WKkgumQBMEg._2-CxURJxUzk3SxPWO1Wu2lJxeyEXEnJPwRgWCiCyiUg.PNG.gc_na/image.png?type=w966)

​

​

많이 적용되는 저전력 SoC 설계 기술은 Clock Gating, Multi-threshold Voltage, Power Gating, Multi-voltage Design을 들 수 있다. 여기서는 EDA 툴을 사용하여 동적전력과 정적전력을 줄이 는 저전력 SoC 설계 동향을 살펴보려고 합니다.

​

짧게 소개하면,

Clock gating과 Power gating : Flipflop의 input pin(Clock이 될 수도 있고, Data pin이 될 수도있고.)에 Enable signal을 이용하여.. 필요할 때에만 신호가 변경되게 만드는 방법이다. Dynamic power를 줄일 수 있는 기법이다.

![](https://postfiles.pstatic.net/MjAyMzA3MTdfMTIz/MDAxNjg5NjAzMzAzODgy.0O9_khD2F_Xx6kP1C5gBtV1MR_WprqqCiwGi4ixh5Twg.G7YxKao-U3ikXt2OpOKIJvECsZz1NeP1reETx4lbjjEg.PNG.gc_na/image.png?type=w966)

ICG, ECG, Latch based, AND based 등등 엄청나게 많은 방법들이 있다.

​

multi Vth :

Transistor로 우리는 MOSFET을 쓰고있고, Gate에 전압을 주면, Source와 Drain이 연결되어 신호를 조정 할 수 있으니... 그래서 트랜지스터를 쓰는거잖아요?

![](https://postfiles.pstatic.net/MjAyMzA3MTdfMjYg/MDAxNjg5NjAzOTE1NTc3.qTkwi9yF0FJM9XpM5mNEy-uFcVle75O5hAAHmuK1CFYg.dfsvdM7EgIu_mldAM8tiuFz0jBtm8wZU9tJNDqwOY0Yg.PNG.gc_na/image.png?type=w966)

그리고 아래 그림처럼 문턱전압을 넘어서야 출력 신호를 전환시킬 수 있는 채널 형성이됩니다.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Threshold_formation.gif/500px-Threshold_formation.gif)

근데 사실 채널 형성이 되지 않아도.. 미세한 전류들이 새어나가고 있는 것을 우린 위에서 봤습니다.

이 새어나가는 전류를 없에려면, 새어나가게 어렵게해야허고, 그러려면, 문턱전압을 높여줘야합니다. 대신에 문턱전압이 오를 때까지 기다려야하기에 퍼포먼스는 안 좋습니다.

​

문턱전압을 Voltage threshold라고 부르죠. 그래서 Foundry 회사에선 High voltage, Regular voltage, Low voltage... 등 다양한 트랜지스터가 담긴 공정 디자인 키트를 전달합니다.

​

Low power가 필요한 곳엔 HVT, High performance가 필요한 곳엔 LVT.. 이런식으로 설계를 하는게 Multi voltage design의 기본이라고 보면됩니다.

Multi voltage, DVFS는 Dynamic power를 줄이는 방법이긴한데, 위 내용과 일맥상통하는 내용입니다. 구현 방법은 전혀 다르지만.

​

​

그래서... Verilog만으로 이것들을 다 할 수 있냐?

-> 불가능한건 아닌데, 인간적이지 않습니다. Verilog로는 Function에 대한 RTL 설계를 하고, Power적인 설계는 **UPF (IEEE 1801)**라는 Standard를 사용합니다. 완전 Logical한 내용이라기보단, TCL Base로 되어있는 SDC와 비슷한 구조라고 보시면 됩니다. 이 UPF로 설계하고 검증하고 해야합니다.

​

Power domain 선언하고,

Power domain이 어느정도 전압을 갖고.. 어디에 연결되고... A Module의 동작 전압은 뭐고.. B Module의 동작 전압은 뭐라서 A와 B 사이에 Voltage level shifter가 필요하고... C Module은 껐다 켰다 하는 Module인데 D Module은 항상 켜져있는 Module이고... 이런 정보들이 있습니다.

​

대표적으론 아래처럼 Isolation, level shifter, retention 등이 있습니다.

​

![](https://postfiles.pstatic.net/MjAyMzA3MTdfMTcx/MDAxNjg5NjA0NDk0Mjc3.N_ja4owWyb3tPNgRTtg5egul2c2IU34vdeiAaSet9aMg.dRsKYfiX5u44LuwEcpcrgTPiZ2FOVrbdJ7iLPgHRx8cg.PNG.gc_na/image.png?type=w966)

![](https://postfiles.pstatic.net/MjAyMzA3MTdfNTQg/MDAxNjg5NjA0NTM5MTUy.feehp5Q4DxJxbod6TpXteX_0QF5wUeMoyu_4rfUvqLsg.GgZpVsNrRhr6xqyUxT7AmGOvCKSpqOES03EKl9iqAwgg.PNG.gc_na/image.png?type=w966)

![](https://postfiles.pstatic.net/MjAyMzA3MTdfMTQw/MDAxNjg5NjA0NTQ2MzAz.U-DROLWIB_Zg8SfONQmv3PBnoVT9pUA64NzZxZwTK_8g.vVmO9z3egK3uY1rFSdzsHma8Bpssib7rFQp4IKzhoOIg.PNG.gc_na/image.png?type=w966)

​

​

https://standards.ieee.org/ieee/1801/6767/

 [**IEEE Standards Association**

IEEE websites place cookies on your device to give you the best user experience. By using our websites, you agree to the placement of these cookies. To learn more, read our Privacy Policy. Accept & Close Active Standard IEEE 1801-2018 IEEE Standard for Design and Verification of Low-Power, Energy-Aw...

standards.ieee.org](https://standards.ieee.org/ieee/1801/6767/)

환경오염, 국제정세위기, 전기자동차로 전환, 정보화시대에서 필요한 큰 데이터센터, 반도체 스케일링의 둔화. 그리고 소비자들이 지금 현재의 반도체보다 더 빠른 반도체보단... 배터리 더 오래가고, 전력 덜 먹는 반도체를 더 선호하죠.

결국 저전력 반도체 설계가 주목을 받고 있습니다.

​

계속해서 효율적인 저전력 설계 방법론에 대한 중요성이 높아지고 있습니다.

앞으로 디지털 설계 엔지니어는 RTL 설계 뿐만 아니라, UPF 설계도 할 줄 알아야 하고, 공정 Design kit도 고를 줄 알아야합니다!
