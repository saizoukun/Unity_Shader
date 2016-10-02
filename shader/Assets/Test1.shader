// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Custom/test1" {
	Properties{
		_MainTex("メインのテクスチャだよ",2D) = "white"
	}
	SubShader {
		Pass {
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag

		uniform sampler2D _MainTex;

		struct v2f {
			float4 wPos : SV_POSITION;
			float2 uv :TEXCOORD0;
		};

		v2f vert(float4 pos : POSITION,float2 uv : TEXCOORD) {
		v2f OUT;
		OUT.wPos = mul(UNITY_MATRIX_MVP,pos);
		OUT.uv = uv;
		//OUT.cubeColor.xyz = mul(UNITY_MATRIX_V,mul(_Object2World,normal)) * 0.5 + 0.5;
		//OUT.cubeColor.w = 1.0;
		return OUT;
		}

		float4 frag(v2f input) : COLOR {
			return tex2D(_MainTex,input.uv);
		}
		ENDCG
		}
	}
}