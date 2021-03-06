using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class P03_Chapter02 : MonoBehaviour
{
   //02유니티 쉐이의 작성 요령

	//1 쉐이더 랩으로만 작성하기 : 고정파이프라인 쉐이더
	//매우 가볍고 하드웨어 호환성이 좋지만 기능이 상당히 부족하기 때문에 고급 혀과를 기대하긴 어렵습니다.

	//2 서피스 쉐이더로 작성하기
	//쉐이더랩 스크립트와 함께 일부분 CG쉐이더코드를 사용하는 방법입니다.
	//기본적인 조명 코드와 버텍스 쉐이더의 복잡한 부분은 스크립트를 이용하여 자동으로 처리되고 있고, 픽셀 쉐이더 부분만 간편하게 작성할 수도 있어서 편합니다.

	//3 버텍스&프래그먼트 쉐이더로 작성하기
	//좀 더 본격적인 쉐이더 작성 방법입니다. 자동으로 처리해주는 부분이 별로 없어서 제대로 된 CG 쉐이더 방식으로 버텍스의 좌표 변환부터 제대로 처리해야 작동합니다.

}
