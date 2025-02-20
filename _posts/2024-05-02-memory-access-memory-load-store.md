---
published: true
---
## Memory Access, Memory Load & store

지난 포스팅에서 '컴퓨터 내 메모리의 역할과 종류'를 알아봤습니다.

컴퓨터의 기본 동작은 'I/O와 인터페이스하며 데이터를 읽기, 쓰기, 기타 동작(operate라고 칭하겠습니다..)'입니다.

​

​

![0](/assets/img/222933939793/0.png)

​

Memory를 얘기하기전에 ISA, 어셈블리어에 대해 짧게 이야기를 하겠습니다.

어셈블리어는 Programming Language 중에 가장 Low level이에요.

"값을 불러와"

"값을 저장해"

"값끼리 더해"

이런 단순 연산들이 합쳐져서 High Level Language의 command 한 줄이 나오는거에요.

​

개발자들이 사용하는 Programming, script 언어는 High Level Language라고 불립니다.

대부분의 개발자들은 Compiler 이전 스텝까지만 코드 작성 및 수정을 하고,

Assembler, Linker, Loader는 특별한 경우가 아니라면 직접 작성과 수정을 하진 않습니다.(극한의 최적화, 디버깅 필요시 보긴 함.)

아, 그리고 어셈블리어는 프로세서 제조사마다 다르고, RISC냐 CISC냐에따라 구조도 다릅니다.

​

RISC가 병렬처리에 유리한 Pipeline이 가능하기 때문에 요즘 대세요. 그래서 이 글도 RISC를 기준으로 작성하겠습니다.

​

​

![1](/assets/img/222933939793/1.png)

![2](/assets/img/222933939793/2.png)

참고로 Compiler는 보통 'Debug mode, Release mode'가 있어요.

Debug mode는 code 자체에서 그대로 어셈블리어로 변환을 하는 반면, release mode는 코드 최적화를 거친 후 어셈블리어로 변환을 합니다.

​

​

Memory에 Load하고 Store하는 기본 단위는 Bit (1과 0), Byte는 (8bit), word는 제조사마다 기준이 좀 다르지만 bit나 byte의 묶음이고,

이 단위대로 Load & Store하도록 되어 있습니다.

![3](/assets/img/222933939793/3.png)

0, 1, 2, 3, 4, 5, 6, 7... 값을 '왼쪽부터 저장(Big-endian)하는지 오른쪽부터(Little-endian)부터 저장하는지'도 제조사마다 다르고, 통신방법마다 다릅니다. (다 장단점이 있는데, 저한테 중요하지 않은 내용이라 기억이 안나네요...ㅎㅎ)

그래서 소켓통신을 하거나, 임베디드 시스템을 하는 경우 메모리에 값을 어떤 순서로 Load/Store하는지 알아둬야 합니다.

​

​

![4](/assets/img/222933939793/4.png)

아래 C언어 코드로 자신의 endian 표기 방식을 알 수 있습니다.

결과가 '78563412'로 출력되었다면 리틀 엔디안

결과가 '12345678'로 출력되었다면 빅 엔디안

​

int i;

int test = 0x12345678;

char* ptr = (char*)&test; // 1 바이트만을 가리키는 포인터를 생성함.

 

for (i = 0; i < sizeof(int); i++)

{

 printf("%x", ptr[i]); // 1 바이트씩 순서대로 그 값을 출력함.

}

​

​

​

아래 그림에서 컴퓨터 구조+동작방식이 대강 다 설명되어있으니 자세히 읽어보세요!

​

![5](/assets/img/222933939793/5.png)

​

​

​

![6](/assets/img/222933939793/6.png)

​

​

Processor가 Memory에서 어떤 Address에서 값을 가져올지 방법을 'Memory Access'라고 합니다.

Memory Access는 Direct와 Indirect 방법이 있어요.

​

철수가 가진 값을 Load 해야하는 경우,

Direct : 철수의 좌표에 가서 값 Load

Indirect : 철수의 위치를 갖고있는 영희에게 접근

​

![7](/assets/img/222933939793/7.png)

​

​

​

졸려서 여기까지만 적습니다. 궁금하신 것 있으면 댓글 달아주세요.

 해시태그 : 