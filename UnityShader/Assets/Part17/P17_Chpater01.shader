Shader "Custom/P17_Chpater01"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }
        zwrite off
        //blend SrcAlpha OneMinusSrcAlpha //소스 * 소스알파 + 배경 * (1-소스알파) // alpha blending
        //blend SrcAlpha One // 소스 * 소스알파 + 배경 * 1 //additive
        //blend One One // 소스 * 1 + 배경 * 1 // Additive No Alpha Black is Transparent
        //blend DstColor Zero // 소스 * 배경 + 0 * 배경 = 소스 * 배경  // 2X Multiplicative
        blend DstColor SrcColor // 소스 * 배경 + 배경 * 소스 //Multiplicative
        
        
        CGPROGRAM
        #pragma surface surf Lambert keepalpha


        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Legacy Shaders/Transparent/VertexLit"
}
