Shader "Custom/P09_Chpater03"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SpecColor("Specular Color", color) = (1,1,1,1)
         _SpecValue("Specular",Range(0,1)) = 0.5
        _Gloss("Gloss",Range(0,1)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque"}

        CGPROGRAM
        #pragma surface surf BlinnPhong

        sampler2D _MainTex;
        float _SpecValue;
        float _Gloss;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb * 0.5;
            o.Specular = _SpecValue;
            o.Gloss = _Gloss;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
