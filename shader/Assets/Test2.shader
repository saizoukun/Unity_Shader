Shader "Custom/Test2" {
	SUbShader {
		Tags {"Queue" = "Geometry+1"}
		ZTest Always
		ZWrite On

		blend SrcAlpha OneMinusSrcAlpha

		Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag

		float4 vert(float4 pos : POSITION) :SV_POSITION {
			return mul(UNITY_MATRIX_MVP,pos);
			}

		float4 frag() : SV_TARGET {
			return float4(1,0,0,0.5);
		}
		ENDCG
		}
	}
}