Shader "Custom/P14_Chpater03"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        cull back
        
        //1st pass
        CGPROGRAM
        #pragma surface surf Lambert 

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
        
        //2nd pass
//        CGPROGRAM
//        #pragma surface surf Lambert 
//
//        sampler2D _MainTex;
//
//        struct Input
//        {
//            float2 uv_MainTex;
//        };
//        void surf (Input IN, inout SurfaceOutput o)
//        {
//            // Albedo comes from a texture tinted by color
//            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
//            o.Albedo = c.rgb;
//            o.Alpha = c.a;
//        }
//        ENDCG
    }
    FallBack "Diffuse"
}
