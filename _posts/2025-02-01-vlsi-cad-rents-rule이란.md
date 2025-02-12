---
published: true
---
## [VLSI CAD] Rent's Rule이란?

​

Rent’s Rule

Rent’s Rule은 복잡한 설계 시스템의 구조적 특성을 분석하고 이해하는 데 기초적인 프레임워크를 제공합니다.

이는 Logic gate의 수와 Interconnection 수 간의 관계를 기준으로 이 설계가 효율적인가 아닌가를 어림 잡을 수 있는 가이드를 제공합니다.

​

자세한 내용은 아래 논문 참고:

https://ieeexplore.ieee.org/document/1671752

[On a Pin Versus Block Relationship For Partitions of Logic Graphs](https://ieeexplore.ieee.org/document/1671752) : Partitions of the set of blocks of a computer logic graph, also called a block graph, into subsets called modules demonstrate that a two-region relationship exists between P, the average number of pins per module, and B, the average number of blocks per module. In the first region, P = KBr, where K ...

Rent의 법칙이란?

Rent의 법칙은 Logic block의 수 B와 Connector pin의 수 P 사이에 다음과 같은 관계를 정의합니다.

여기서 K는 상수(보통 3~5)이며, r은 Rent 지수(보통 0.6~0.7)입니다.

> P = KB^r

출처 : No Site

P: 필요한 연결 핀 수 (Pins)

B: 논리 블록의 개수 (Blocks)

K: 비례 상수 (Constant, 회로에 따라 다름)

r: Rent 지수 (Exponent, 0에서 1 사이 값)​

​

이 식은 논리 블록의 수(B)가 많아질수록 연결 핀의 수(P)도 증가한다는 것을 보여줍니다. 증가율은 Rent 지수 𝑟 r에 따라 달라집니다.

​

이 논문을 따르면,

r = 0.5: 평면 설계상에서 최고 효율적인 설계를 의미. [완벽한 직사각형 Mesh인 회로가 있다고 가정하고, 가운데에서 정사각형 서브 회로를 잘라냅니다. 정사각형에 n개의 논리 블록이 있는 경우 정사각형의 각 변은 n 의 제곱근이고 , 렌트 지수 r=0.5 가 됩니다.]

r = 1.0: 상대적으로 비효율적인 설계를 의미, Interconnect 너무 많음. 매우 높은 확률로 congestion 발생.

r = 0.7 +- @: 일반적으로 빅테크 회사들에서 Tape-out 나가는 Chip들의 r 값 

아래 그림 참고.

![2](/assets/img/223716363287/2.png)

This Chip is Bananas (B A N A N A S), Patrick Madden Associate Professor, SUNY Binghamton CSD그래서 이러한 Rent의 법칙을 일부 고려하여, 설계자동화 프로그램 및 AI에 적용합니다.

Target r값을 엔지니어가 정의하면 툴이 이 값을 찾을 때까지 계속 place를 바꿔보는 방식인거죠.

​

효율적인 배치를 통한 연결선 감소: Rent의 법칙은 효율적인 Place 전략을 수립하여 연결선을 최소화할 수 있도록 돕습니다. 이를 통해 회로 설계의 공간적 효율성과 전력 소모를 줄일 수 있습니다.

Multi level Hypergraph distribution 알고리즘에 적용

3. Multi level k-distrivution Hypergraph 알고리즘 등에 적용

​

![3](/assets/img/223716363287/3.png)

Louis K Scheffer, C Shan Xu, Michal Januszewski, Zhiyuan Lu, Shin-ya Takemura, Kenneth J Hayworth, Gary B Huang, Kazunori Shinomiya, Jeremy Maitlin-Shepard, Stuart Berg, Jody Clements, Philip M Hubbard, William T Katz, Lowell Umayam, Ting Zhao, David Ackerman, Tim Blakely, John Bogovic, Tom Dolafi, Dagmar Kainmueller, Takashi Kawase, Khaled A Khairy, Laramie Leavitt, Peter H Li, Larry Lindsey, Nicole Neubarth, Donald J Olbris, Hideo Otsuna, Eric T Trautman, Masayoshi Ito, Alexander S Bates, Jens Goldammer, Tanya Wolff, Robert Svirskas, Philipp Schlegel, Erika Neace, Christopher J Knecht, Chelsea X Alvarado, Dennis A Bailey, Samantha Ballinger, Jolanta A Borycz, Brandon S Canino, Natasha Cheatham, Michael Cook, Marisa Dreher, Octave Duclos, Bryon Eubanks, Kelli Fairbanks, Samantha Finley, Nora Forknall, Audrey Francis, Gary Patrick Hopkins, Emily M Joyce, SungJin Kim, Nicole A Kirk, Julie Kovalyak, Shirley A Lauchie, Alanna Lohff, Charli Maldonado, Emily A Manley, Sari McLin, Caroline Mooney, Miatta Ndama, Omotara Ogundeyi, Nneoma Okeoma, Christopher Ordish, Nicholas Padilla, Christopher M Patrick, Tyler Paterson, Elliott E Phillips, Emily M Phillips, Neha Rampally, Caitlin Ribeiro, Madelaine K Robertson, Jon Thomson Rymer, Sean M Ryan, Megan Sammons, Anne K Scott, Ashley L Scott, Aya Shinomiya, Claire Smith, Kelsey Smith, Natalie L Smith, Margaret A Sobeski, Alia Suleiman, Jackie Swift, Satoko Takemura, Iris Talebi, Dorota Tarnogorska, Emily Tenshaw, Temour Tokhi, John J Walsh, Tansy Yang, Jane Anne Horne, Feng Li, Ruchi Parekh, Patricia K Rivlin, Vivek Jayaraman, Marta Costa, Gregory SXE Jefferis, Kei Ito, Stephan Saalfeld, Reed George, Ian A Meinertzhagen, Gerald M Rubin, Harald F Hess, Viren Jain, Stephen M Plaza (2020) A connectome and analysis of the adult Drosophila central brain eLife 9:e57443​ https://doi.org/ ​

Rent's rule 자체에 대해서 계산식이랑 이게 무엇을 의미하는지  간단히 알아봤고,

어떻게 P&R 툴 알고리즘을 만들어야 Rent's rule을 최소화 할 수 있는지... 이런 논문들은 아래 참고

​

https://ieeexplore.ieee.org/document/1671752

[On a Pin Versus Block Relationship For Partitions of Logic Graphs](https://ieeexplore.ieee.org/document/1671752) : Partitions of the set of blocks of a computer logic graph, also called a block graph, into subsets called modules demonstrate that a two-region relationship exists between P, the average number of pins per module, and B, the average number of blocks per module. In the first region, P = KBr, where K ...

https://arxiv.org/abs/2404.13049v2

[DG-RePlAce: A Dataflow-Driven GPU-Accelerated Analytical Global Placement Framework for Machine Learning Accelerators](https://arxiv.org/abs/2404.13049v2) : Global placement is a fundamental step in VLSI physical design. The wide use of 2D processing element (PE) arrays in machine learning accelerators poses new challenges of scalability and Quality of Results (QoR) for state-of-the-art academic global placers. In this work, we develop DG-RePlAce, a new...

https://dl.acm.org/doi/10.1145/378239.379064

[Improved cut sequences for partitioning based placement | Proceedings of the 38th annual Design Automation Conference](https://dl.acm.org/doi/10.1145/378239.379064) : Article Share on Improved cut sequences for partitioning based placement Authors : Mehmet Can Yildiz , Patrick H. Madden Authors Info & Claims DAC '01: Proceedings of the 38th annual Design Automation Conference Pages 776 - 779 https://doi.org/10.1145/378239.379064 Published : 22 June 2001 Publicati...

https://dl.acm.org/doi/10.1145/1120725.1120864

[On structure and suboptimality in placement | Proceedings of the 2005 Asia and South Pacific Design Automation Conference](https://dl.acm.org/doi/10.1145/1120725.1120864) : Article Share on On structure and suboptimality in placement Authors : Satoshi Ono , Patrick H. Madden Authors Info & Claims ASP-DAC '05: Proceedings of the 2005 Asia and South Pacific Design Automation Conference Pages 331 - 336 https://doi.org/10.1145/1120725.1120864 Published : 18 January 2005 Pu...

https://www.seas.upenn.edu/~andre/pdf/rentsw_slip01.pdf

 해시태그 : 