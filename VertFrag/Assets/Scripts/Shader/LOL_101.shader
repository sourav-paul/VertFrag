Shader "AAA/LOL_101" 
{
	Properties 
	{
		_Color("Color", Color) = (1, 1, 1, 1)
		_AmbientColor ("Ambient Color", Color) = (1, 1, 1, 1)
		_MySliderValue ("Slider value", Range(1,5)) = 2.5
	}

	SubShader 
	{
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		fixed4 _Color;
		float4 _AmbientColor;
		float _MySliderValue;

		struct Input 
		{
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutputStandard o) 
		{
			fixed4 c = pow((_Color + _AmbientColor), _MySliderValue);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
