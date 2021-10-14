Shader "CustomShaders/QuadRectangle"
{
    Properties
    {

    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
        
            #include "UnityCG.cginc"

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 position : TEXCOORD1;
                float2 uv : TEXCOORD0;
            };

            v2f vert (appdata_base v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.position = v.vertex;
                o.uv = v.texcoord;

                return o;
            }

            float rect(float2 pos, float2 size, float2 center)
            {
                float2 tempPos = pos - center;
                float2 halfSize = size * 0.5;
                // float horz = (tempPos.x > -halfSize.x && tempPos.x < halfSize.x) ? 1 : 0;
                // That's how we do this in CG
                float horz = step(-halfSize.x, tempPos.x) - step(halfSize.x, tempPos.x);
                // float vert = (tempPos.y > -halfSize.y && tempPos.y < halfSize.y) ? 1 : 0;
                float vert = step(-halfSize.y, tempPos.y) - step(halfSize.y, tempPos.y);
                
                return horz * vert;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                float2 pos = i.position.xy;
                float2 center = float2(-0.25, 0.25);
                float2 size = 0.5;
                float inRect = rect(pos, size, center);
                //float inCircle = 1 - step(0.25, length(i.position.xy));
                fixed3 color = fixed3(1, 1, 0) * inRect;
                return fixed4(color, 1);
            }

            ENDCG
        }
    }
}
