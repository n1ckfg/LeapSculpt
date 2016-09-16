// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33074,y:32625,varname:node_3138,prsc:2|emission-8926-OUT;n:type:ShaderForge.SFN_Distance,id:4656,x:31840,y:32859,varname:node_4656,prsc:2|A-809-XYZ,B-7460-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:809,x:31639,y:32787,varname:node_809,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:7460,x:31639,y:32924,varname:node_7460,prsc:2;n:type:ShaderForge.SFN_Frac,id:6311,x:32185,y:32859,varname:node_6311,prsc:2|IN-8982-OUT;n:type:ShaderForge.SFN_Multiply,id:8982,x:32012,y:32859,varname:node_8982,prsc:2|A-5769-OUT,B-4656-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5769,x:31903,y:32741,ptovrint:False,ptlb:mult,ptin:_mult,varname:node_5769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Posterize,id:4606,x:32561,y:32936,varname:node_4606,prsc:2|IN-8213-OUT,STPS-6656-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6656,x:32352,y:32893,ptovrint:False,ptlb:post,ptin:_post,varname:node_6656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_HsvToRgb,id:8213,x:32352,y:32972,varname:node_8213,prsc:2|H-6311-OUT,S-4862-OUT,V-5368-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4862,x:32147,y:33055,ptovrint:False,ptlb:sat,ptin:_sat,varname:node_4862,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:11;n:type:ShaderForge.SFN_ValueProperty,id:5368,x:32147,y:33142,ptovrint:False,ptlb:val,ptin:_val,varname:node_5368,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_FragmentPosition,id:6074,x:31728,y:32485,varname:node_6074,prsc:2;n:type:ShaderForge.SFN_DDX,id:6768,x:31923,y:32349,varname:node_6768,prsc:2|IN-6074-XYZ;n:type:ShaderForge.SFN_DDY,id:9414,x:31923,y:32474,varname:node_9414,prsc:2|IN-6074-XYZ;n:type:ShaderForge.SFN_Normalize,id:8060,x:32100,y:32349,varname:node_8060,prsc:2|IN-6768-OUT;n:type:ShaderForge.SFN_Normalize,id:4649,x:32120,y:32474,varname:node_4649,prsc:2|IN-9414-OUT;n:type:ShaderForge.SFN_Cross,id:9490,x:32298,y:32444,varname:node_9490,prsc:2|A-8060-OUT,B-4649-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:387,x:32689,y:32587,varname:node_387,prsc:2,chbt:1|M-9490-OUT,R-6424-RGB,G-6928-RGB,B-2142-RGB,BTM-4706-RGB;n:type:ShaderForge.SFN_Color,id:6424,x:32287,y:32593,ptovrint:False,ptlb:c1,ptin:_c1,varname:node_6424,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:6928,x:32352,y:32737,ptovrint:False,ptlb:c2,ptin:_c2,varname:_c2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:2142,x:32416,y:32801,ptovrint:False,ptlb:c3,ptin:_c3,varname:_c3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:4706,x:32570,y:32472,ptovrint:False,ptlb:brmCol,ptin:_brmCol,varname:node_4706,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_SwitchProperty,id:8926,x:32879,y:32675,ptovrint:False,ptlb:reconstructMode,ptin:_reconstructMode,varname:node_8926,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4606-OUT,B-387-OUT;proporder:5769-6656-5368-4862-6424-6928-2142-4706-8926;pass:END;sub:END;*/

Shader "Shader Forge/DistFromCenterSphere" {
    Properties {
        _mult ("mult", Float ) = 1
        _post ("post", Float ) = 3
        _val ("val", Float ) = 0
        _sat ("sat", Float ) = 11
        _c1 ("c1", Color) = (0.5,0.5,0.5,1)
        _c2 ("c2", Color) = (0.5,0.5,0.5,1)
        _c3 ("c3", Color) = (0.5,0.5,0.5,1)
        _brmCol ("brmCol", Color) = (0.5,0.5,0.5,1)
        [MaterialToggle] _reconstructMode ("reconstructMode", Float ) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float _mult;
            uniform float _post;
            uniform float _sat;
            uniform float _val;
            uniform float4 _c1;
            uniform float4 _c2;
            uniform float4 _c3;
            uniform float4 _brmCol;
            uniform fixed _reconstructMode;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
////// Lighting:
////// Emissive:
                float3 node_9490 = cross(normalize(ddx(i.posWorld.rgb)),normalize(ddy(i.posWorld.rgb)));
                float3 emissive = lerp( floor((lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac(frac((_mult*distance(i.posWorld.rgb,objPos.rgb)))+float3(0.0,-1.0/3.0,1.0/3.0)))-1),_sat)*_val) * _post) / (_post - 1), (lerp( lerp( lerp( _brmCol.rgb, _c1.rgb, node_9490.r ), _c2.rgb, node_9490.g ), _c3.rgb, node_9490.b )), _reconstructMode );
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
