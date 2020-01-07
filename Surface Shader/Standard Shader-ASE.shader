// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Surface/Standard Shader-ASE"
{
	Properties
	{
		_Tiling_X("Tiling_X", Float) = 1
		_Tiling_Y("Tiling_Y", Float) = 1
		[NoScaleOffset]_Albedo("Albedo", 2D) = "white" {}
		_AlbedoColor("Albedo Color", Color) = (1,1,1,1)
		[NoScaleOffset]_Specular("Specular", 2D) = "white" {}
		_SpecularColor("Specular Color", Color) = (0,0,0,0)
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		[NoScaleOffset]_Normal("Normal", 2D) = "bump" {}
		_Bumpiness("Bumpiness", Range( -2 , 2)) = 1
		[NoScaleOffset]_Emission("Emission", 2D) = "white" {}
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		[NoScaleOffset]_AmbientOcclusion("Ambient Occlusion", 2D) = "white" {}
		_Ambient("Ambient", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.0
		#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Bumpiness;
		uniform sampler2D _Normal;
		uniform float _Tiling_X;
		uniform float _Tiling_Y;
		uniform sampler2D _Albedo;
		uniform float4 _AlbedoColor;
		uniform sampler2D _Emission;
		uniform float4 _EmissionColor;
		uniform sampler2D _Specular;
		uniform float4 _SpecularColor;
		uniform float _Smoothness;
		uniform sampler2D _AmbientOcclusion;
		uniform float _Ambient;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float2 appendResult60 = (float2(_Tiling_X , _Tiling_Y));
			float2 uv_TexCoord42 = i.uv_texcoord * appendResult60;
			o.Normal = UnpackScaleNormal( tex2D( _Normal, uv_TexCoord42 ), _Bumpiness );
			o.Albedo = ( tex2D( _Albedo, uv_TexCoord42 ) * _AlbedoColor ).rgb;
			o.Emission = ( tex2D( _Emission, uv_TexCoord42 ) * _EmissionColor ).rgb;
			float4 tex2DNode30 = tex2D( _Specular, uv_TexCoord42 );
			o.Specular = ( tex2DNode30 * _SpecularColor ).rgb;
			o.Smoothness = ( tex2DNode30.a * _Smoothness );
			o.Occlusion = ( tex2D( _AmbientOcclusion, uv_TexCoord42 ).r * _Ambient );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17101
0;0;1920;1029;923.6364;188.1483;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;61;-1247.653,825.8643;Inherit;False;631.6425;255.249;Texture Coordinate;4;58;59;60;42;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-1195.172,965.1132;Inherit;False;Property;_Tiling_Y;Tiling_Y;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-1197.653,880.8215;Inherit;False;Property;_Tiling_X;Tiling_X;0;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;60;-1030.311,894.4569;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;42;-858.0104,875.8643;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;40;-416.9048,1236.902;Inherit;False;816.0343;437.3038;Specular;5;29;38;39;31;30;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;32;-138.1242,1695.956;Inherit;False;523.0344;338.2078;Ambient Occlusion;3;33;34;35;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WireNode;45;-437.9409,1729.412;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;39;-286.2354,1487.981;Inherit;False;Property;_SpecularColor;Specular Color;5;0;Create;True;0;0;False;0;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;54;-304.0701,233.8105;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;23;-255,456.4308;Inherit;False;649;283;Normal;2;17;13;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-71.90485,1549.902;Inherit;False;Property;_Smoothness;Smoothness;6;0;Create;True;0;0;False;0;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;34;-88.12416,1745.956;Inherit;True;Property;_AmbientOcclusion;Ambient Occlusion;11;1;[NoScaleOffset];Create;True;0;0;False;0;None;f2038a21ce13af04f83bc07c4d6d5d93;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;35;-66.12416,1941.955;Inherit;False;Property;_Ambient;Ambient;12;0;Create;True;0;0;False;0;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;37;-136.0349,761.3672;Inherit;False;526.9999;451.6135;Emission;3;24;25;36;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;12;-151.9827,0.2922118;Inherit;False;539.0692;435.1732;Albedo;3;8;11;7;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;30;-366.9048,1286.902;Inherit;True;Property;_Specular;Specular;4;1;[NoScaleOffset];Create;True;0;0;False;0;None;ca68646d618ac0547913625990a5a8c3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;7;-102.9827,55.29222;Inherit;True;Property;_Albedo;Albedo;2;1;[NoScaleOffset];Create;True;0;0;False;0;None;4139c886da1dbc2468867f6b00c0a101;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;24;-101.0349,815.3672;Inherit;True;Property;_Emission;Emission;9;1;[NoScaleOffset];Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;46;-325.222,608.1956;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-4.235405,1289.981;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;226.8757,1772.956;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-225.8748,607.5759;Inherit;False;Property;_Bumpiness;Bumpiness;8;0;Create;True;0;0;False;0;1;0.88;-2;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;241.0951,1406.902;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;36;-14.39148,1020.981;Inherit;False;Property;_EmissionColor;Emission Color;10;1;[HDR];Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;11;-22.98269,255.2922;Inherit;False;Property;_AlbedoColor;Albedo Color;3;0;Create;True;0;0;False;0;1,1,1,1;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;233.0173,153.2922;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;50;526.1946,1660.736;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;228.965,838.3672;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;13;78,523.4307;Inherit;True;Property;_Normal;Normal;7;1;[NoScaleOffset];Create;True;0;0;False;0;None;92db155b36483f5429d2926c3785de70;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;52;417.1131,1266.551;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;51;502.6429,1313.654;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;650.6717,965.1117;Float;False;True;2;ASEMaterialInspector;0;0;StandardSpecular;Surface/Standard Shader-ASE;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;60;0;58;0
WireConnection;60;1;59;0
WireConnection;42;0;60;0
WireConnection;45;0;42;0
WireConnection;54;0;42;0
WireConnection;34;1;45;0
WireConnection;30;1;42;0
WireConnection;7;1;54;0
WireConnection;24;1;42;0
WireConnection;46;0;42;0
WireConnection;38;0;30;0
WireConnection;38;1;39;0
WireConnection;33;0;34;1
WireConnection;33;1;35;0
WireConnection;29;0;30;4
WireConnection;29;1;31;0
WireConnection;8;0;7;0
WireConnection;8;1;11;0
WireConnection;50;0;33;0
WireConnection;25;0;24;0
WireConnection;25;1;36;0
WireConnection;13;1;46;0
WireConnection;13;5;17;0
WireConnection;52;0;38;0
WireConnection;51;0;29;0
WireConnection;0;0;8;0
WireConnection;0;1;13;0
WireConnection;0;2;25;0
WireConnection;0;3;52;0
WireConnection;0;4;51;0
WireConnection;0;5;50;0
ASEEND*/
//CHKSM=C96FA78E5FE4C06F5DCF405F75798B9EF4D8B2AC