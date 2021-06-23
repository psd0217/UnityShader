﻿Shader "Custom/P16_Chapter05"
{
    Properties
    {
        _Color ("MainColor", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Cutoff("Alpha cutoff", Range(0,1))=0.5
    }
    SubShader
    {
        Tags { "RenderType"="TransparentCutOut" "Queue"="AlphaTest" }
        cull off

        CGPROGRAM
        #pragma surface surf Lambert alphatest:_Cutoff


        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) ;
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Legacy Shaders/Transparent/Cutout/VertexLit"
}
