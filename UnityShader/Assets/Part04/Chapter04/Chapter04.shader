Shader "Custom/Chapter04"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        
        //CGPROGRAM~ENDCG부분은 CG언어를 이용하여 쉐이더를 직접 짜는 부분!
        CGPROGRAM

        // 1. 설정부분(전처리or스피닛이라고 부름)
        //==================================================
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows //noambient

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0
        //======================================================

        
        sampler2D _MainTex;

        // 2. Input이라는 이름을 가진 구조체 (엔진으로부터 받아올 데이터)
        //========================================================
        struct Input
        {
            float2 uv_MainTex;
        };
        //========================================================

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)


        // 3. surf라는 이름을 가진 함수(색상이나 이미지 출력)
        //========================================================
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            //o.Albedo = float3(1,0,0);
            //o.Emission = float3(1,0,0);
            //o.Emission = float3(1,0,0) + float3(0,1,0); //노랑
            //o.Emission = float3(1,0,0) * float3(0,1,0); //검정
            o.Emission = float3(1,0,0) + float3(1,0,0); //빨강
            // Metallic and smoothness come from slider variables
          
            o.Alpha = c.a;
        }

        //SurfaceOutputStandard구조체 내부
        //struct SurfaceOutputStandard
        //{
        //  fixed3 Albedo;
        //  fixed3 Normal;
        //  fixed3 Emission;
        //  half Metallic;
        //  half Smoothness;
        //  half Occlusion;
        //  half Alpha;
        //}
        //========================================================
        ENDCG
    }
    FallBack "Diffuse"
}
