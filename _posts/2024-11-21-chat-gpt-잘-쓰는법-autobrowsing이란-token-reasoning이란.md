---
published: true
---
## Chat GPT 잘 쓰는법, Autobrowsing이란? Token Reasoning이란?

이번에 Chat GPT의 새로운 버전 O1이 출시되었습니다.

SNS에 O1, 최근 Chat GPT 업데이트 관련하여 흥미로운 글들이 올라와서 옮겨봅니다.

​

OpenAI Official:

경쟁적 프로그래밍 문제(Codeforces)에서 89번째 백분위를 차지했고, 미국 수학 올림피아드(AIME) 예선에서 미국 학생 상위 500위에 들었고, 물리, 생물학, 화학 문제(GPQA)의 벤치마크에서 인간의 박사 수준 정확도를 넘어섰습니다. STEM 분야 연구에도 인상적인 성과를 거두었습니다.

​

​

Chat GPT 잘 쓰는 법 (A.K.A. 원하는 답을 줄 수 있는 질문 하는 법.)

간단한 프롬프트에서 가장 잘 수행됩니다. few-shot prompting이나 모델에 "단계별로 생각하도록" 지시하는 것과 같은 일부 프롬프트 엔지니어링 기술은 성능을 향상시키지 못할 수 있으며 때로는 방해가 될 수 있습니다. 다음은 몇 가지 모범 사례입니다.

간단하고 직접적인 메시지를 전달하세요. 모델은 광범위한 안내가 필요 없이 간단하고 명확한 지침을 이해하고 이에 응답하는 데 능숙합니다.

생각의 연쇄적 프롬프트를 피하세요. 이러한 모델은 내부적으로 추론을 수행하므로 "단계별로 생각하세요" 또는 "추론 내용을 설명하세요"라는 프롬프트는 불필요합니다.

명확성을 위해 구분 기호를 사용하세요. 세 개의 따옴표, XML 태그 또는 섹션 제목과 같은 구분 기호를 사용하여 입력의 각 부분을 명확하게 표시하고, 모델이 다양한 섹션을 적절히 해석하는 데 도움을 줍니다.

검색 증강 생성(RAG)에서 추가 컨텍스트를 제한합니다. 추가 컨텍스트나 문서를 제공할 때 모델이 응답을 지나치게 복잡하게 만드는 것을 방지하기 위해 가장 관련성 있는 정보만 포함합니다.

​

https://openai.com/index/introducing-openai-o1-preview/

https://www.youtube.com/watch?v=3k89FMJhZ00&ab_channel=OpenAI

[![Building OpenAI o1](https://i.ytimg.com/vi/3k89FMJhZ00/hqdefault.jpg)](https://www.youtube.com/watch?v=3k89FMJhZ00&ab_channel=OpenAI)

설명 : Top row (left to right): Mark Chen, Giambattista Parascandolo, Trapit Bansal, Łukasz Kaiser, Hunter Lightman, Karl Cobbe, Łukasz Kondraciuk, Szymon Sidor, No...

​

o1 모델은 추론 토큰을 도입합니다 . 모델은 이러한 추론 토큰을 사용하여 "생각"하고 프롬프트에 대한 이해를 분석하고 응답을 생성하는 여러 가지 접근 방식을 고려합니다. 추론 토큰을 생성한 후 모델은 답변을 가시적 완료 토큰으로 생성하고 추론 토큰을 컨텍스트에서 삭제합니다.

다음은 사용자와 어시스턴트 간의 다단계 대화의 예입니다. 각 단계의 입력 및 출력 토큰은 이어지고 추론 토큰은 삭제됩니다.

![0](/assets/img/223592120036/0.png)

​

Reference:

https://cookbook.openai.com/examples/o1/using_reasoning_for_routine_generation

https://cookbook.openai.com/examples/o1/using_reasoning_for_data_validation

​

@mathemagic1an

https://x.com/mathemagic1an

[X의 Jay Hack님(@mathemagic1an)](https://x.com/mathemagic1an) : Founder/CEO @codegen. Tweets about AI, computing, and their impacts on society. Previously did startups, @palantir, @stanford. Not a pseudonym.

Chat GPT가 다른 Tool을 사용 할 수 있다!

It seems like o1-preview has access to a calculator of sorts that it can invoke at inference time.

I've never seen a model pull off 700,112 * 9 and get it right during regular token streaming.

Besides that, demonstrates very advanced reasoning. Officially impressed

​

요약하면 지금까지 대중이 알고 있는 Chat GPT는 이러했음.

(1) Chat GPT같은 인공지능은 Large Language Model

(2) 문장과 문장의 의미 추론은 잘함

(3) 수식 계산은, 언어추론의 영역이 아니다.

-> 그래서 Chat GPT는 수식 계산을 할 수 없다.

Chat GPT는 피자 레시피는 알려줘도 너에게 실물 피자를 갖다 줄 수는 없음.

​

위와 같은  인식이었는데, 이번에 새로 나온 Chat GPT 버전에서는 아래와 같은 것을 할 수 있다.

![1](/assets/img/223592120036/1.png)

LLM은 수학 계산을 할 수는 없지만, LLM이 판단해서 "특정 도구" 예를 들면 계산기를 켜서 계산기에 입력값을 넣고 출력값을 사용자에게 보여줄 수 있다는 것입니다.

앞으로는 Chat GPT가 배달의민족을 통해 음식 배달도 시키고, 쿠팡에서 과일도 주문해줄 수 있을듯 합니다.

​

​

실시간 정보 접근

실시간 정보 수집이나 대규모 데이터를 자동으로 처리해야 하는 상황에서는 오토브라우징이 강력한 도구로 자리잡고 있습니다. AI와 자연어 처리 기술이 발전하면서 오토브라우징의 효율성은 날로 높아지고 있어, 앞으로 더 많은 분야에서 활용될 가능성이 큽니다.

![2](/assets/img/223592120036/2.png)

​

Autobrowsing이란? 오토브라우징이란?​

오토브라우징은 인공지능(AI)과 웹 탐색 기술이 만나 탄생한 최신 기술입니다.

쉽게 말해, AI가 마치 사람처럼 웹 브라우저를 사용해 필요한 정보를 자동으로 수집하고 처리하는 과정입니다.

우리가 검색창에 입력하고, 정보를 찾아서 학습하고 추론하고 요약하는 것처럼,

AI가 검색창에 입력하고 정보를 찾아서 학습하고 추론하고 요약하는 것입니다. 크롤링과 좀 다르죠.

​

​

​

그리고 한국어를 아는 사람들만 암호화/복호화 할 수 있는 암호가 있죠.

아래처럼 한국어에 몇글자씩 획을 추가하거나, 자음을 이동시키는 방법입니다.

직우상 얻떤 번역깃돗 일끌 슈 없쥐많 한국인듦은 쉽게 앗랍볼 숫 있는 한끌의 암혼화 방펍잇 잊댜.

![3](/assets/img/223592120036/3.png)

이번 Chat GPT는 이런것도 추론해낼 수 있습니다.

![4](/assets/img/223592120036/4.png)

https://www.youtube.com/watch?v=eZDmDn6Iq9Y&t=51s&ab_channel=OpenAI

[![Korean Cipher with OpenAI o1](https://i.ytimg.com/vi/eZDmDn6Iq9Y/hqdefault.jpg)](https://www.youtube.com/watch?v=eZDmDn6Iq9Y&t=51s&ab_channel=OpenAI)

설명 : Say hello to OpenAI o1—a new series of AI models designed to spend more time thinking before they respond. This new series of AI models can reason through co...

결국 기존의 LLM 한계: Hallucination, Tokenizer, 실시간 학습 등 다 어느정도 회피하거나 해결 할 수 있는 방법들이 존재한다는 것.

​

지금은 수익성이 가장 높은 산업.

(1) "동영상 추천 알고리즘, 광고 알고리즘" 정도에 인공지능이 활발하게 쓰이지만,

(2) 좀 더 정확도가 높아지면, 다들 "인공지능 비서"를 갖고 있을 것이고.

(3) 이렇게 되면 인공지능을 활용하는 사람 vs 인공지능을 활용하지 않는 사람의 격차는 매우 커질 것.

인공지능 자체가 사람을 완전히 대체하진 않겠지만, 인공지능을 활용하는 사람이 일당백 업무를 할 수 있을듯.

​

매일 반도체의 성능 개선되고, 인공지능의 발전하고 있습니다.

업계에 있는 사람 입장에서, 새로 쏟아지는 논문을 보면, '이게 된다고??? 아 이거 이렇게 했구나...' 하는 사이에 혁신이 쏟아집니다.

​

그런데, 나는 그런거 몰라~ 지금까지 그런거 없이도 오늘 잘 살았는데? 바깥 문호를 완전히 닫아놓는 마인드면 진짜 어느 순간 뒤쳐지게 될 것 같습니다.

 해시태그 : 