---
layout: post
title: ATPG란? DFT란? FLOW, Alorithm 핵심 정리. TestMAX, TetraMAX 수행과정
subtitle: What is ATPG and DFT?
tags: [ATPG, DFT, TestMAX, DFT compiler, TetraMAX]
comments: true
---

DFT의 단계에 함께하는 ATPG란, 디지털 회로의 테스트 패턴 생성 알고리즘 입니다. (Automatic Test Pattern Generation)
그냥 무턱대고 집어넣으면, 50개의 경우의 수만 따져도, 1000조개가 넘는 경우의 수가 나옵니다. 실제 경우의 수는 이보다 많구요. 그래서 다양한 알고리즘이 쓰입니다.
1. Manual Test Pattern Generation
설계 회로의 동작 검증을 위하여 논리 시뮬레이션에서 사용하는 기능.
Fault 검출을 위해 Test Vector를 변형시켜 사용합니다. 높은 FC(Fault Coverage)을 얻기는 어려우나, Stuck At Fault 외에도 시간 지연 고장 등을 검출할 수 있습니다.
Fault Coverage란, 검사율을 뜻합니다. 이 Fault Coverage과 반도체 수율은 다른 의미입니다.
2) Random Test Pattern Generation
Fault model이나 회로 구조에 무관하게 SW/HW 방법으로 임의의 테스트 벡터를 생성해서 대입합니다.
단순함. 그러나 높은 Fault Coverage가 나오기 힘들다.
3) Algorithmic Test Pattern Generation 그 유명한 ATPG!
회로도와 사용된 소자의 동작 특성을 이용하여 SW Algorithm을 사용하여 테스트 벡터를 생성하는 것으로, 비교적 Fault Coverage를 얻을 수 있습니다.

기본 ATPG의 알고리즘은 아래와 같습니다. 그리고 이 자체만으로 쓰는 경우는 없고, D, PODEM, FAN 알고리즘 등 다양한 알고리즘들을 응용해서 사용합니다. 
Step 1: 초기화
(1) 회로내의 모든 논리 소자의 입출력 신호값을 X로 초기화
(2) 특정 와이어에 Fault를 가정
Step 2: 목표 설정. 결함 영향 '유발' 대상 또는 결함 영향 '전파' 대상 설정
Condition 2.1: 목표대상의 설정이 가능하면, 목표에 대한 논리값 결정 과정 수행
Condition 2.2: 목표대상의 설정이 불가능하면, 철회 과정 수행
Step 3: 테스트 생성 과정 진행 여부 결정
Condition 3.1: 결함 영향이 '유발'되고 동시에 결함 영향이 주 출력단에 '전파'되었으면, 테스트 패턴 생성 완료
Condition 3.2: 테스트 패턴 생성 중단 조건이 만족되면, 테스트 생성 종료
Condition 3.3: Condition 3.1과 3.2가 만족되지 않으면, Step 2로 이동한다.

저는 ATPG EDA tool로 Synopsys社의 DFT Compiler & TestMAX(TetraMAX)를 사용해봐서 TextMAX flow를 설명해드리겠습니다.
TetraMax tool은 HDL Design에 대해서 적은 수의 Test Vector를 생성해서 높은 Fault Coverage을 얻을 수 있는 EDA tool입니다.

DFT Compiler Flow
1. Test-Ready 상태에서 HDL Netlist 불러오기 $compile -scan
2. Test DRC $check_scan
3. Preview Scan Architecture $preview_scan
4. Scan Insertion(테스트) $insert_scan
5. Test DRC again $check_scan
문제 있으면 위에서 수정
6. Scan Design Completed. Compiled & Scanned Netlist 생성
7. STIL test Protocol(_*_.spf) FILE 생성 $write_test_protocol

TetraMAX ATPG
1. Netlist 읽기. (TetraMAX에 최적화되지 않은 Netlist는 수정 필요)
2. Verilog Library 읽기.
3. ATPG design model 생성
4. STIL test Protocol File 읽어서 DRC(Design Rule Check)
5. Fault list를 준비해서 ATPG option을 설정.
6. 테스트 벡터값을 삽입하고, Fault Coverage 도출 및 확인. 기준값 미달이면 다시 위로 돌아가서 옵션을 바꿔본다.
7. Pattern 요약
8. Test Pattern과 Fault list를 저장.

참고, The Standard Test Interface Language (STIL FILE) STIL Procedure File (SPF FILE)은 DRC(Design Rule Check)와 Pattern 만드는데에 필요함.
내부 딜레이, RC값 정보가 들어있음.
