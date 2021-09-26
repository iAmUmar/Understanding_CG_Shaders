Shader "CustomShaders/TimeBased_GBRA"
{
    Properties
    {
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

            fixed4 frag(v2f_img i) : SV_Target
            {
                fixed3 color = fixed3((sin(_Time.y) + 1) / 2, 0, (cos(_Time.y) + 1) / 2);
                // gbra will swap the default rgba pattern.. (In CG language swaping like this is called swizzling)
                // similarly we can use RRRA or BGRA or GGBA vice versa to overcast specific colors
                return float4(color, 1).gbra;
            }
            ENDCG
        }
    }
}
