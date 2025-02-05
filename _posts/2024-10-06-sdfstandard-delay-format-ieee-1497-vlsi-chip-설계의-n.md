---
published: true
---
## SDF(Standard Delay Format): IEEE 1497, VLSI Chip 설계의 Net delay format

SDF는 IC 설계 과정에서 타이밍 정보를 담기 위한 표준 포맷입니다.

공식문서니까 자세히 다뤄보고싶은데, 이게 공식 배포된 자료가 없는 것 같아 개념만 다룹니다.

​

자세한 것은 IEEE 회원 가입하시고 보시면 됩니다.

​

Back Annotation file란?

Back Annotation file은 IC 설계 과정에서 레이아웃 후 추출된 BEOL의 정보를 담고 있는 파일입니다. 이 파일은 주로 Standard Parasitic Exchange Format (SPEF) 형식과 SDF로 작성되며, 설계의 타이밍과 신호 무결성 (Signal Integrity, SI)을 검증하는 데 활용됩니다. 

https://silvaco.com/wp-content/uploads/content/appNotes/iccad/2-010_Parasitic_back_annotation.pdf

SPEF라는 Format도 이후에 다룰 예정인데, SPEF에는 RC값이라는 기생값이 들어있는거고,

SDF는 Delay 자체가 담겨있습니다.

​

SDF란?

Design의 타이밍 검증 및 최적화에 필수적인 Cell delay, Interconnect delay, Port delay 등의 정보를 담고 있죠. 따라서 SDF는 Static Timing Analysis (STA), Gate-Level Simulation 등 IC 설계의 여러 단계에서 널리 활용되고 있습니다.

​

![0](/assets/img/223421191865/0.png)

​

SDF의 역사를 살펴보면, 1990년대 초반 EDA 업체들이 각자의 포맷을 사용하면서 호환성 문제가 대두되었습니다. 이에 IEEE에서는 1994년 SDF V1.0을 발표하며 표준화 작업에 착수했고, 2001년 IEEE 1497-2001 표준을 제정하기에 이르렀습니다.

​

IEEE 1497-2001 표준은 SDF의 문법과 구조를 명확히 정의하고, 다양한 delay 유형의 표현 방법을 규정하여 EDA 툴 간 원활한 타이밍 정보 교환을 가능케 했습니다. 이 표준의 등장으로 IC 설계 과정의 효율성과 정확성이 크게 향상되었다고 볼 수 있겠습니다.

​

그리고 SPEF에는 RC값이 있습니다. STA를 할 때 SPEF를 사용하면, RC를 통해 딜레이를 계산하는 반면,

SDF로는 딜레이를 읽는거죠.

​

![1](/assets/img/223421191865/1.png)

​

자, 그럼 이어지는 내용에서는 SDF의 기본 개념과 활용 분야, 그리고 IEEE 1497-2001 표준의 주요 내용에 대해 더욱 자세히 살펴보도록 하겠습니다.

SDF의 기본 개념을 이해하기 위해서는 SDF에서 다루는 주요 delay 유형과 SDF 파일의 구조 및 문법을 살펴볼 필요가 있습니다.

​

SDF에서 다루는 대표적인 delay 유형

Cell delay: 셀 내부의 논리 게이트에서 발생하는 지연으로, 입력 신호가 출력으로 전파되는 데 걸리는 시간을 나타냅니다.

Interconnect delay: 셀 간 연결 와이어에서 발생하는 지연으로, 신호가 와이어를 통해 전파되는 데 걸리는 시간을 나타냅니다.

Port delay: 셀의 입출력 포트에서 발생하는 지연으로, 셀 외부와의 인터페이스에서 발생하는 지연을 나타냅니다.

​

표준 문서를 직접 보시면 제일 좋은데, 아래 링크도 도움이 될 것 같아요.

​

https://upload.wikimedia.org/wikiversity/en/e/eb/SDF.Note.H.1.20151201.pdf

​

다음으로 SDF 파일의 구조와 문법에 대해 알아보겠습니다. SDF 파일은 ASCII 텍스트 형식으로 작성되며, 계층적 구조를 가지고 있습니다. 기본적인 SDF 문법은 다음과 같습니다.

​

```
```sdf
(DELAYFILE
(DESIGN "design_name")
(DATE "date")
(VENDOR "vendor_name")
(VERSION "version")
(DIVIDER /)
(TIMESCALE unit)
(CELL
(CELLTYPE "cell_type")
(INSTANCE "instance_name")
(DELAY
(ABSOLUTE
(IOPATH input_pin output_pin (delay_value))
)
)
)
)
```
```

​

위 예시에서 볼 수 있듯이,

SDF 파일은 `(DELAYFILE ...)` 키워드로 시작하며,

내부에 `(DESIGN ...)`, `(DATE ...)`, `(VENDOR ...)` 등의 헤더 정보를 포함합니다. 

`(CELL ...)` 섹션에서는 각 셀 인스턴스의 delay 정보를 정의하게 됩니다.

`(DELAY ...)` 섹션 내에서는 `(ABSOLUTE ...)` 키워드를 사용하여 절대 지연 값을 명시할 수 있습니다.

뿐만 아니라, Timing exception도요.

사실 SDF는 여기까지만 봐도 개념은 다 이해하셨습니다.

​

SDF가 뭔지 궁금하신 분들은 여기 정도만 읽어보셔도 될 것 같고,

SDF를 갖고 설계를 하시거나 디버그를 하실 분들은 IEEE 문서를 확인하시면 좋을 것 같아요.

사실 Google에 검색해도 관련 자료가 나옵니다.

​

1. SPEF는 ASIC Flow에서 Physical Design 이후,

2. Parastric Extraction 단계에서 추출합니다. Synopsys의 StarRC가 대표 EDA Tool입니다.

3. 여기서 나온 SPEF를 RC 파일, Cap 파일이라고 부릅니다.

4. 이것을 갖고 STA Tool, PrimeTime 등으로 STA를 합니다.

5. STA에서 SPEF를 읽고, SDF 형태로 저장을 합니다.

6. VCS 등 시뮬레이션 Tool에서 Post-Layout Gate Level Simulation을 위해 Netlist와 SDF를 읽습니다.

7. 디버그를 위해 Verdi 같은 Tool에서 dump랑 이것저것 읽고, SDF를 어노테이션 시킵니다.

​

​

![2](/assets/img/223421191865/2.png)

​

SDF는 지금까지 IC 설계 과정에서 타이밍 정보를 교환하는 핵심 포맷으로 자리매김해 왔지만, 몇 가지 한계점도 존재합니다. 먼저, SDF는 단순히 delay 정보만을 표현할 뿐, 신호 무결성 (Signal Integrity, SI)이나 전력 무결성 (Power Integrity, PI) 등의 고속/고성능 설계에 필수적인 정보는 담아내지 못합니다. 이는 최신 공정에서의 설계 검증에 어려움을 야기할 수 있습니다.

​

또한, SDF는 설계 계층 간의 타이밍 정보 전달에 제한이 있습니다. 예를 들어, IP 단위의 설계에서는 IP 공급자와 사용자 간에 SDF 파일의 교환이 제한될 수 있는데, 이는 설계 검증의 정확성을 떨어뜨릴 수 있습니다.

​

그리고 3D-IC에 대한 딜레이 정보를 담기에도 부족한 부분이 있고, SI/PI, IR Drop 검증도 어려움이 있습니다.

이러한 SDF의 한계점을 극복하기 위해, 업계에서는 다양한 노력을 기울이고 있습니다. GPD, ESDF (Extended SDF) 등 입니다. 그리고 큰 디자인에서는 SDF Annotation에 대한 Runtime이나 정확도 이슈 때문에, 최근엔는 통계학을 이용한 기계 학습을 활용하고 있습니다.

​

https://ieeexplore.ieee.org/document/972829

[1497-2001 - IEEE Standard for Standard Delay Format (SDF) for the Electronic Design Process](https://ieeexplore.ieee.org/document/972829) : IEC 61523-3: 2004 Dual-logo document. Replaces IEEE Std 1497-2001. The Standard Delay Format (SDF) is defined in this standard. SDF is a textual file format for representing the delay and timing information of electronic systems. While both human and machine readable, in its most common usage it wil...

​

구글에 검색하면 자료 엄청 많이 나오는데, 이게 Leak 된 자료인지... 공식 배포된 자료인지 모르겠네요.

이게 숫자가 몇개이냐에 따라 엣지 모양이 정해지고... 이런것들을 문서에서 자세히 볼 수 있습니다.

​

​

https://www.google.com/search?q=standard+delay+format+filetype%3Apdf&newwindow=1&sca_esv=09379ecd0b6efd91&sxsrf=ACQVn0-IAgdsuu3Xt5mLSYq6p9GPmJCwYw%3A1713550849245&ei=AbYiZoPSDtjn2roP488H&udm=&ved=0ahUKEwjD1rGt8s6FAxXYs1YBHePnAQAQ4dUDCBA&uact=5&oq=standard+delay+format+filetype%3Apdf&gs_lp=Egxnd3Mtd2l6LXNlcnAiInN0YW5kYXJkIGRlbGF5IGZvcm1hdCBmaWxldHlwZTpwZGZI7RRQAFj0E3AAeAGQAQCYAYABoAHrCaoBAzguNbgBA8gBAPgBAZgCCqACgAjCAgUQABiABMICChAAGIAEGEMYigXCAgQQABgewgIHEAAYgAQYE8ICBhAAGBMYHsICCBAAGIAEGKIEwgIIEAAYExgIGB7CAgkQABiABBgTGA3CAggQABgTGA0YHsICChAAGBMYCBgNGB7CAgcQIRigARgKwgIFECEYoAGYAwCSBwM0LjagB_Iu&sclient=gws-wiz-serp

[🔎 standard delay format filetype:pdf - Google Search](https://www.google.com/search?q=standard+delay+format+filetype%3Apdf&newwindow=1&sca_esv=09379ecd0b6efd91&sxsrf=ACQVn0-IAgdsuu3Xt5mLSYq6p9GPmJCwYw%3A1713550849245&ei=AbYiZoPSDtjn2roP488H&udm=&ved=0ahUKEwjD1rGt8s6FAxXYs1YBHePnAQAQ4dUDCBA&uact=5&oq=standard+delay+format+filetype%3Apdf&gs_lp=Egxnd3Mtd2l6LXNlcnAiInN0YW5kYXJkIGRlbGF5IGZvcm1hdCBmaWxldHlwZTpwZGZI7RRQAFj0E3AAeAGQAQCYAYABoAHrCaoBAzguNbgBA8gBAPgBAZgCCqACgAjCAgUQABiABMICChAAGIAEGEMYigXCAgQQABgewgIHEAAYgAQYE8ICBhAAGBMYHsICCBAAGIAEGKIEwgIIEAAYExgIGB7CAgkQABiABBgTGA3CAggQABgTGA0YHsICChAAGBMYCBgNGB7CAgcQIRigARgKwgIFECEYoAGYAwCSBwM0LjagB_Iu&sclient=gws-wiz-serp) :  

​

 해시태그 : 