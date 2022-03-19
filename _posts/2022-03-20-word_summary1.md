---
layout: post
title: Fault, Error, Failure, Defect / Verification, Validation 차이
subtitle: What is between with Fault, Error, Failure, Defect / Verification, Validation?
tags: [Fault, Error, Failure, Defect, Verification, Validation]
comments: true
---

교수님들이 영어 섞어 말하는 이유가 뭘까..... 1학년 때는 교수님들이 미국물 먹어서 그런줄 알았다.

​

알고보니, 한국어로는 똑같은 단어로 불리는 것이 영어에선 다양한 단어로 뜻이 나눠진다.

​

이 장에선 Verification, Validation의 차이를 알아보겠습니다.

​

​

Verification

IEEE-STD-610으로 알려진 소프트웨어 엔지니어링 표준은 "Verification"을 다음과 같이 정의합니다.

“A test of a system to prove that it meets all its specified requirements at a particular stage of its development.” ("특정 개발 단계에서 지정된 모든 요구 사항을 충족하는지 증명하기 위한 검사.")

IEEE-STD-610

Verification의 핵심은 특정 개발 단계입니다. 완제품이 나오고 나서 실제 동작 실험을 하는게 아니라, 완제품의 특정 기능의 일부를 검사하는 것입니다.

자동차를 만드는 경우, '방향 지시등 버튼을 누르면'

 '핸들에 있는 버튼이 자동차의 지시등까지 제한 시간 안에 갈 수있는가?', '지시등이 켜지고 꺼지는가?', '갑자기 켜지는 경우는 없는가?', '제품의 수명과 거친환경에 대해 어느정도 안정성을 갖는가?' 등... 완제품의 특정 기능을 단계화해서 검증하는 것입니다.

​

​

​

Validation

“An activity that ensures that an end product stakeholder’s true needs and expectations are met.”("완제품이 목적에 충족되는지 테스트")

IEEE-STD-610

취업 할 때, 휴대폰 살 때 스펙이라고 하죠? 성형외과에서는 소위 견적이라고 하구요. 처음에 제품을 만들 때 어떤 목표값이 있었을 겁니다. 자동차 크기는 어떻고... 속도는 어떻고... 힘은 어떻고... 이런게 최종적으로 맞게 되었는지 검사하는 것입니다.

제품을 만들어보지 않은 사람들은 모를겁니다.

(1) 제품을 만들다가.. 주요 인력이 중국으로 2배 연봉을 받고 가거나, 옆 나라 공장에 불이 나서 반도체 수급이 안되거나, 코로나 때문에 사람들이 출근을 못하거나,, 다양한 이유로 문제가 생깁니다.

(2) 무에서 유를 만드는 것입니다. 처음에 제품을 기획하는 사람도 자기가 어떤걸 만드는지 잘 모르고, 그 사이 모든 공정에 대해 전문가가 아닙니다. 근데 이 기획하는 아이템을 엔지니어, 디자이너들에게 설명하면... 군맹무상 그 자체입니다. 장님들이 코끼리 다리 만지면서 그림 그리듯.. 진행이 됩니다.

그래서 회의도 정말 많이 해야하고, 다 똑같은 그림을 그렸는지 확인하는 과정이 필요합니다. 그래도 마지막에 막상 보면 기획한거랑 약간 차이가 있습니다.

​

마지막엔, Vallidation이라는. '이해관계자'가 이게 '내가 기획했던거 잘 만들어졌네' or '아 이렇게 만들려고 한건 아닌데, 이거 팔리긴 할 것 같아.'하면 마케팅도 하면서 시장에 나갈 준비를 시작합니다. 




error

discrepancy between a computed, observed or measured value or condition, and the true, specified or theoretically correct value or condition

계산, 관찰 또는 측정된 값 또는 조건과 참, 지정되거나 이론적으로 올바른 값 또는 조건 사이의 불일치

​

failure

termination of the ability of an element (1.32), to perform a function as required

필요에 따라 기능을 수행하기 위해 요소의 기능 종료

​

fault

abnormal condition that can cause an element (1.32) or an item (1.69) to fail

요소 또는 항목이 실패할 수 있는 비정상적인 상태

​

Wrong: 

When requirements are implemented not in the right way. This defect is a variance from the given specification.

요구 사항이 올바른 방식으로 구현되지 않을 때. 이 결함은 지정된 사양과의 차이 발생.

​

Missing

A requirement of the customer that was not fulfilled. This is a variance from the specifications, an indication that a specification was not implemented, or a requirement of the customer was not noted correctly.

고객의 요구 사항이 올바르게 기록되지 않았음을 나타냅니다.

​

Extra

A requirement incorporated into the product that was not given by the end customer. This is always a variance from the specification, but maybe an attribute desired by the user of the product.

고객이 초기에 제안하지 않았던 요구사항에 추가되는 것.

​

Engineering change order (ECO)

An engineering change order (ECO) is a document that specifies either new product design details or proposed changes to existing products. ECOs provide a list of all the components, assemblies, and other documents that are affected. The engineering change order is sent to all key stakeholders (change control board or “CCB”) including engineering, quality, procurement, manufacturing, and external design teams or supply chain partners in many cases. Every CCB member is responsible to determine the impact of the change order and whether the ECO can. be implemented as planned and on time. CCB members will approve or reject the change and when all CCB members have approved the ECO, then it can be acted upon.

아래에서 정리.

​

ECR(Engineering Change Request)

제품 생산 및 판매 등 현장에서 제품에 대한 문제가 발생하거나 새로운 개선 사항이 도출된 경우, 담당자가 제시하는 기술변경 사항에 대하여 기술적 검토 및 조치사항을 요구하는 것을 뜻합니다. 담당자 정보, 요청 내용, 조치 요망일 등을 구체적으로 제시하여 요청해야 합니다.

​

ECO(Engineering Change Order)

부품과 조립품 및 관련 기술문서들의 변경(추가, 변경, 삭제 등) 등의 내용이 제시한 ECR을 검토하고, 이에 대한 기술적 조치사항을 구체적으로 서술하는 것을 뜻합니다. 추가적으로 변경 대상과 범위, 조건 등이 결정되면 이에 대한 최종 승인과 검토를 위한 승인권자를 설정할 수 있습니다.

​

ECN(Engineering Change Notice)

ECO에서 설정한 승인권자에게 최종 승인 및 검토를 요청하는 기능으로, ECO가 승인되면 해당 기술변경 내용을 시스템에 반영하고, ECO를 관련업무자들에게 배포합니다.

​

ECP(Engineering Change Proposal)

형상 식별서 작성 이후에 발생되는 물품의 형상, 특성, 기능 등의 변경을 위해 작성하는 기술변경제안(서)을 뜻합니다.
