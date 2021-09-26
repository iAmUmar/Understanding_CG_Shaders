Shader "CustomShaders/UnlitAddingProperties"
{
    Properties
    {
        _ColorA("Color A", Color) = (1, 0, 0, 1)
        _ColorB("Color B", Color) = (0, 0, 1, 1)
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            fixed4 _ColorA, _ColorB;

            fixed4 frag (v2f_img i) : SV_Target
            {
                float delta = (sin(_Time.y) + 1) / 2;

                // in lerp function retrn value is = 
                // (1 - delta) * _ColorA + delta * _ColorBs
                fixed3 color = lerp(_ColorA, _ColorB, delta);
                return fixed4(color, 1);
            }
            ENDCG
        }
    }
}
