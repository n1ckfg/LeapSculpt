// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32997,y:32543,varname:node_3138,prsc:2|emission-1144-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32066,y:32794,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_NormalVector,id:2208,x:31917,y:32671,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:7524,x:32092,y:32657,varname:node_7524,prsc:2|A-2208-OUT,B-2208-OUT,C-2208-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:9861,x:32388,y:32750,varname:node_9861,prsc:2,chbt:0|M-2208-OUT,R-7241-RGB,G-8275-RGB,B-2786-RGB,A-9348-RGB;n:type:ShaderForge.SFN_Color,id:8275,x:32120,y:32864,ptovrint:False,ptlb:Color_copy,ptin:_Color_copy,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.16119,c2:0.7843137,c3:0.07843139,c4:1;n:type:ShaderForge.SFN_Color,id:2786,x:32184,y:32928,ptovrint:False,ptlb:Color_copy_copy,ptin:_Color_copy_copy,varname:_Color_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5993238,c2:0.7843137,c3:0.07843139,c4:1;n:type:ShaderForge.SFN_Distance,id:4880,x:31640,y:32431,varname:node_4880,prsc:2|A-3265-XYZ,B-8283-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:3265,x:31397,y:32316,varname:node_3265,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:6297,x:31422,y:32486,varname:node_6297,prsc:2;n:type:ShaderForge.SFN_Lerp,id:3097,x:32106,y:32354,varname:node_3097,prsc:2|A-5602-RGB,B-9075-RGB,T-7405-OUT;n:type:ShaderForge.SFN_Add,id:7405,x:31851,y:32377,varname:node_7405,prsc:2|A-2236-OUT,B-2177-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2236,x:31720,y:32310,ptovrint:False,ptlb:node_2236,ptin:_node_2236,varname:node_2236,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:9348,x:32248,y:32992,ptovrint:False,ptlb:Color_copy_copy_copy,ptin:_Color_copy_copy_copy,varname:_Color_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Frac,id:8900,x:32736,y:32425,varname:node_8900,prsc:2|IN-6071-OUT;n:type:ShaderForge.SFN_Posterize,id:1144,x:32622,y:32572,varname:node_1144,prsc:2|IN-8900-OUT,STPS-4197-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4197,x:32437,y:32650,ptovrint:False,ptlb:node_4197,ptin:_node_4197,varname:node_4197,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Multiply,id:6071,x:32558,y:32352,varname:node_6071,prsc:2|A-3855-OUT,B-3097-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3855,x:32457,y:32257,ptovrint:False,ptlb:node_3855,ptin:_node_3855,varname:node_3855,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Sin,id:8725,x:32781,y:32687,varname:node_8725,prsc:2|IN-1144-OUT;n:type:ShaderForge.SFN_Power,id:2177,x:31770,y:32638,varname:node_2177,prsc:2|VAL-4880-OUT,EXP-1156-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1156,x:31592,y:32759,ptovrint:False,ptlb:pow,ptin:_pow,varname:node_1156,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_ViewPosition,id:8283,x:31473,y:32655,varname:node_8283,prsc:2;n:type:ShaderForge.SFN_Noise,id:1327,x:32423,y:32938,varname:node_1327,prsc:2|XY-7341-OUT;n:type:ShaderForge.SFN_Append,id:7341,x:31863,y:32855,varname:node_7341,prsc:2|A-3265-X,B-3265-Y;n:type:ShaderForge.SFN_Color,id:5602,x:31970,y:32196,ptovrint:False,ptlb:node_5602,ptin:_node_5602,varname:node_5602,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:9075,x:31825,y:32141,ptovrint:False,ptlb:node_9075,ptin:_node_9075,varname:node_9075,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:7241-8275-2786-2236-4197-3855-9348-1156-9075-5602;pass:END;sub:END;*/

Shader "Shader Forge/CrazySkybox2" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _Color_copy ("Color_copy", Color) = (0.16119,0.7843137,0.07843139,1)
        _Color_copy_copy ("Color_copy_copy", Color) = (0.5993238,0.7843137,0.07843139,1)
        _node_2236 ("node_2236", Float ) = 0
        _node_4197 ("node_4197", Float ) = 3
        _node_3855 ("node_3855", Float ) = 1
        _Color_copy_copy_copy ("Color_copy_copy_copy", Color) = (1,1,1,1)
        _pow ("pow", Float ) = 2
        _node_9075 ("node_9075", Color) = (0.5,0.5,0.5,1)
        _node_5602 ("node_5602", Color) = (0.5,0.5,0.5,1)
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
            uniform float _node_2236;
            uniform float _node_4197;
            uniform float _node_3855;
            uniform float _pow;
            uniform float4 _node_5602;
            uniform float4 _node_9075;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float3 node_1144 = floor(frac((_node_3855*lerp(_node_5602.rgb,_node_9075.rgb,(_node_2236+pow(distance(i.posWorld.rgb,_WorldSpaceCameraPos),_pow))))) * _node_4197) / (_node_4197 - 1);
                float3 emissive = node_1144;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
