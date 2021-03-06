Shader "Custom/P17_Chpater03"
{
    Properties
    {
        _TintColor("Tint Color",Color) = (0.5,0.5,0.5,0.5)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" "IgnoreProjector"="True"}
        zwrite off
        //blend SrcAlpha OneMinusSrcAlpha //소스 * 소스알파 + 배경 * (1-소스알파) // alpha blending
        blend SrcAlpha One // 소스 * 소스알파 + 배경 * 1 //additive
        //blend One One // 소스 * 1 + 배경 * 1 // Additive No Alpha Black is Transparent
        //blend DstColor Zero // 소스 * 배경 + 0 * 배경 = 소스 * 배경  // 2X Multiplicative
       //blend DstColor SrcColor // 소스 * 배경 + 배경 * 소스 //Multiplicative
        cull off
        
        
        CGPROGRAM
        #pragma surface surf Lambert keepalpha noforwardadd nolightmap noambient novertexlights noshadow


        sampler2D _MainTex;
        float4 _TintColor;

        struct Input
        {
            float2 uv_MainTex;
            float4 color:COLOR;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            c = c * 2 * _TintColor * IN.color;
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }

        float4 Lightingnolight(SurfaceOutput s, float lightDir, float atten)
        {
            return float4(0,0,0, s.Alpha);
        }
        
        ENDCG
    }
    FallBack "Legacy Shaders/Transparent/VertexLit"
}
