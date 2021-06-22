Shader "Custom/P14_Chpater04"
{
      Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _NprColor ("NprColor", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        cull front
        
        //1st pass
        CGPROGRAM
        #pragma surface surf Nolight vertex:vert noshadow noambient

        sampler2D _MainTex;
        float4 _NprColor;

        void vert(inout appdata_full v)
        {
            //v.vertex.xyz = v.vertex.xyz + v.normal.xyz *0.003 * sin(_Time.y);
            v.vertex.xyz = v.vertex.xyz + v.normal.xyz *0.003;
        }
        
        struct Input
        {
            float4 color:COLOR;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
        }
        float4 LightingNolight(SurfaceOutput s, float3 lightDir, float atten)
        {
            return  _NprColor;
        }
        ENDCG
        
        cull back
        //2nd pass
        CGPROGRAM
        #pragma surface surf Lambert 

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
    FallBack "Diffuse"
}
