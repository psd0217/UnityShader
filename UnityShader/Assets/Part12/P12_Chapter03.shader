Shader "Custom/P12_Chapter03"
{
   Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Transparent"}

        CGPROGRAM
        #pragma surface surf nolight noembient alpha:fade

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
            float3 worldPos;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            //o.Albedo = c.rgb;
            //o.Emission = IN.worldPos.rgb;
            //o.Emission = IN.worldPos.g;
            //o.Emission = frac(IN.worldPos.g);
            //o.Emission = pow(frac(IN.worldPos.g*3),30);
            //o.Emission = pow(frac(IN.worldPos.g*11-_Time.y),30);
            o.Emission = float3(0,1,0);
            fixed4 rim = saturate( dot(o.Normal, IN.viewDir));
            rim = pow(1-rim,3) + pow(frac(IN.worldPos.g*11-_Time.y),10);
            //o.Alpha = rim * (sin(_Time.y*3) *0.5 +0.5);
            //o.Alpha = rim * abs(sin(_Time.y*3));
            o.Alpha = rim;
        }

        float4 Lightingnolight(SurfaceOutput s, float3 lightDir, float atten)
        {
            return float4(0,0,0,s.Alpha);
        }

        ENDCG
    }
    FallBack "Transparent/Diffuse" //그림자를 생성하지 않게 하는 코드
}
