Shader "Custom/P14_Chpater05"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _BumpMap ("Normalmap", 2D) = "bump" {}
        _NprColor ("NprColor", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        cull front
        
        //1st pass
        CGPROGRAM
        #pragma surface surf Nolight vertex:vert noshadow noambient

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
        #pragma surface surf Toon noambient 

        sampler2D _MainTex;
        sampler2D _BumpMap;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;
        };
        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        float4 LightingToon(SurfaceOutput s, float3 lightDir, float atten)
        {
            float ndotl = dot(s.Normal,lightDir)*0.5+0.5;
            // if(ndotl > 0.7)
            //     ndotl = 1;
            // else if(ndotl > 0.4)
            //     ndotl = 0.3;
            // else
            //     ndotl = 0;
            ndotl = ndotl * 3;
            ndotl = ceil(ndotl)/5;

            float4 final;
            final.rgb = s.Albedo * ndotl * _LightColor0.rgb;
            final.a = s.Alpha;
            
            return final;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
