Shader "Hidden/AlphaPattern"
{
    CGINCLUDE

    #include "UnityCG.cginc"

    sampler2D _MainTex;
    sampler2D _TestTex;

    float Pattern(float2 uv)
    {
        if (uv.x < 0.5)
        {
            return frac(dot(uv, 5));
        }
        else
        {
            uv = floor(uv * _ScreenParams.xy) * 0.001;
            return frac(sin(dot(uv, float2(12.9898,78.233))) * 43758.5453123);
        }
    }

    float4 Generator(v2f_img input) : SV_Target
    {
        return float4(1, 1, 1, Pattern(input.uv));
    }

    float4 Tester(v2f_img input) : SV_Target
    {
        return abs(tex2D(_TestTex, input.uv).a - Pattern(input.uv));
    }

    ENDCG

    SubShader
    {
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment Generator
            ENDCG
        }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment Tester
            ENDCG
        }
    }
}
