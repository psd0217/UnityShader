Shader "Custom/P12_Chapter01"
{
     Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque"}

        CGPROGRAM
        #pragma surface surf Lambert noembient

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = 0;
            fixed4 rim = dot (o.Normal, IN.viewDir);
            o.Emission = pow(1-rim,3);
            
            o.Alpha = c.a;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
