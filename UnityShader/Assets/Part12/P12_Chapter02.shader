﻿Shader "Custom/P12_Chapter02"
{
     Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _BumpMap ("Normalmap", 2D) = "bump" {}
        _RimColor ("RimColor", Color) = (1,1,1,1)
        _RimPower ("RimPower", Range(1,10)) = 3
    }
    SubShader
    {
        Tags { "RenderType"="Opaque"}

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        sampler2D _BumpMap;
        float4 _RimColor;
        float _RimPower;

        struct Input
        {
            float2 uv_MainTex;
             float2 uv_BumpMap;
            float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
            fixed4 rim = saturate( dot(o.Normal, IN.viewDir));
            o.Emission = pow(1-rim,_RimPower) * _RimColor.rgb;
            o.Alpha = c.a;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
