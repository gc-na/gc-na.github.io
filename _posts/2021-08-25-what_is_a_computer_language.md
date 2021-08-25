---
layout: post
title: 
subtitle: #
tags: []
comments: true
---

C는 컴파일 언어, Python은 인터프리터 언어입니다.
프로그래머들은 보통 프로그램을 만들 때. C/C++, Python 등으로 프로그램을 만듭니다.

1. C language로 프로그램을 만들면, source.c 파일이 생성됩니다.
이 source.c 파일은
#include <stdio.h>
int main(void)
{
  unsigned char a;
  a=49;
  printf("%c", a);
  return 0;
}
이런 식으로 되어있을텐데, 컴퓨터는 이게 뭔지 이해하지 못합니다. 인간은 쉽게(?) 이해할 수 있는 High level language입니다.

2. Compiler
High level language(C/C++ 등..)에서 Low level language인 Assembly Language로 Compile 해주는 역할입니다.
이 Assembly 언어는 어떤 ISA를 사용하느냐에 따라 달라집니다.
제가 사용하는 RISC-V의 경우 ADD 연산은,
Add  x2, x3, x4
이런식으로 나타나고, source.s(유닉스 환경), source.asm(윈도우 환경)파일이 생성됩니다.
이런 식으로 써줘도, 아직 컴퓨터는 이해하지 못해요. 수많은 연산자를 사용해기 때문에 인간도 바로 이해하기는 힘든 Low level language입니다.

3. Assembler
Low level language에서 Machine language로 바꿔주는 과정입니다.
00100011000.......  이런식으로 2진수 값이 되어야, '어디에 언제 전압을 걸어주고 빼줘'가 됩니다.
source.o(유닉스 환경), source.obj(윈도우 환경) 파일이 생성이 됩니다. (object라서 목적파일이라고 불려요.)
그냥 우리가 만들었던 source.c파일에 대한 source.o파일만으로는 프로그램은 우리가 만든 기능을 하지 못해요.
우리가 만든 printf()함수는 C language의 Library에 만들어진 함수를 우리가 쓴거에요.

4. Linker
object들의 관계를 연결해주는 과정입니다.
'source.o의 n번째 code는 lib.o파일의 x번째에 있는 함수를 쓴것입니다.'라고 연결해줍니다.
최종적으로, source.out(유닉스 환경) 혹은 source.exe(윈도우 환경)에 파일이 만들어집니다.

5. 이후에 실행할 때는 Loader에 올라가고, 메모리에 들어가고 코드를 읽어 실행하게 됩니다.

unsigned char a같은 command line의 실행과정은 포인터를 알면 과정을 쉽게 알 수 있습니다.
(1) source의 명령어를 읽었는데, unsigned char가 있네? 이게 뭐지
(2) 아, 이건 C language의 라이브러리 함수네. 라이브러리 함수로 가자.
(3) 라이브러리에서 unsigned char 함수를 찾아서 실행해.
(4) 하드웨어야 a의 주소값을 지정해줘.
(5) a의 위치에 8bit의 크기를 할당해줘.
