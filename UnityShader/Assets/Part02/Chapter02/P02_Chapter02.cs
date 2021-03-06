using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class P02_Chapter02 : MonoBehaviour
{
    //모니터에서 표현되는 생과 빛의 기본원리

    //01 모니터의 색은 어떻게 표현되는가?
    //모니터의 한 픽셀을 이루는 기본 구조는 마치 RGB의 색으로 빛나는 3개의 조명이 붙어있는 모습이라고 생각할 수 있습니다.

    //02 모니터에 나타나는 색을 숫자로 표현하기
    //한 픽셀의 RGB가 100,100,100이라면 RGB조명이 모두 켜져있음
    //한 픽셀의 RGB가 0,0,0이라면 RGB조명이 모두 꺼짐
    //빨강 = 100,0,0
    //회색 = 50,50,50
    //노랑 = 100,100,0

    //03 컬러를 숫자로 나타내보기
    //float형태로 나타내 보겠습니다. 수학에서 100%는 1 50%는 0.5 0%는 0으로 나타냅니다.
    //흰색의 RGB는 1,1,1로 검정은 0,0,0 노랑은 1,1,0으로 표현하면 됩니다.

    //04 컬러를 숫자로 인식해 보기
    //검정 0,0,0 흰색 1,1,1 회색 0.5,0.5,0.5 이렇게 3개의 색의 나열을 float3라고 합니다.
    //만약 float3이미지에 알파(투명) 채널이 포함된다면 알파 채널까지 포함하여 float4형식으로 나타낼수 있습니다.

    //05 컬러를 연산해 보기
    //덧샘 회색 + 회색 = 흰색  , 노랑(1,1,0) + 빨강(1,0,0) = 노랑(2,1,0) = 노랑(1,1,0) 최대값이 1이기 때문에 실제 눈에 보이는 색상은 노랑색으로 보이게 됩니다.
    //곱샘 회색(0.5,0.5,0.5) * 회색(0.5,0.5,0.5) = 어두운 회색(0.25,0.25,0.25)
    //반전 1 - 노랑(1,1,0) = 파랑(0,0,1)
}
