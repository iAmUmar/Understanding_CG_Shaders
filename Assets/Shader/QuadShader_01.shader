Shader "CustomShaders/QuadShader_01"
{
    Properties
    {
        // turned off this line because we are not using texture in this shader
        //_MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        // LOD 100 is the simplest form of LOD use to tell that our shader is not dependent on light
        LOD 100

        Pass
        {
            // Start of CG programming
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            
            // initializing UnityCG library
            #include "UnityCG.cginc"

            fixed4 frag (v2f_img i) : SV_Target
            {
                // going to loog through each pixel and color them  
                // fixed4(r, g, b, a)
                return fixed4(1, 0, 0, 1);
            }
            // End of CG programming
            ENDCG
        }
    }
}
