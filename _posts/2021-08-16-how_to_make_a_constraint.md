---
layout: post
title: Stopwatch Verilog RTL code에 DC(Designe Compiler)로 Constraint file 만들고 적용하기! 使用 DC（Design Compiler）创建约束文件并将其应用于秒表 Verilog RTL 代码！
subtitle: How to make Verilog Constraint file
tags: [ASIC, Verilog, Constraint, 半导体]
comments: true
---

지난번에 만든 Stopwatch RTL code에 이어, 그 파일에 constraint file을 적용시켜보는 실습을 하겠습니다.

1. 정확한 Specification은 없고, 아래와 같은 2줄의 코드로 test.con 파일을 만들어주세요.

reset_design

create_clock -period 2 [get_ports clk]

2. Design Compiler를 실행해주세요.

3. $read_verilog 코드를 사용해서, 이전에 만든 .v파일을 읽어주세요.

4. File - Setup에서 자신이 사용할 db파일을 넣어주세요.

5. $source test.con

6. $compile_ultra 혹은 $compile을 실행해주세요.

7. $report_timing

![report_timing](/assets/img/period2_timing.png)

8. $report_area

![report_area](/assets/img/period2_area.png)
