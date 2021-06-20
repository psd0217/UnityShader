﻿Shader "Custom/P08_Chapter04"
{
     Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Metallic ("Metallic",Range(0,1))=0
        _Smoothness ("Smoothness",Range(0,1))=0.5
        _BumpMap ("Narmalmap", 2D) = "bump" {}
        _Occlusion("Occlusion", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard 

        sampler2D _MainTex;
        sampler2D _BumpMap;
        sampler2D _Occlusion;
        float _Metallic;
        float _Smoothness;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Occlusion = tex2D (_Occlusion, IN.uv_MainTex);
            fixed3 n =UnpackNormal( tex2D (_BumpMap, IN.uv_BumpMap));
            o.Normal = n;
            o.Albedo = c.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Smoothness;
            o.Alpha = c.a;
            
        }
        ENDCG
    }
    FallBack "Diffuse"
}
