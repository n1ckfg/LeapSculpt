// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32742,y:32710,varname:node_3138,prsc:2|emission-8416-OUT,voffset-822-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:9632,x:31778,y:32914,varname:node_9632,prsc:2;n:type:ShaderForge.SFN_Sin,id:8474,x:32193,y:32933,varname:node_8474,prsc:2|IN-5281-OUT;n:type:ShaderForge.SFN_Multiply,id:5281,x:32018,y:32933,varname:node_5281,prsc:2|A-9632-X,B-6865-OUT;n:type:ShaderForge.SFN_Vector4Property,id:1976,x:32288,y:33162,ptovrint:False,ptlb:VertOffsetDir,ptin:_VertOffsetDir,varname:node_1976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:1,v3:0,v4:0;n:type:ShaderForge.SFN_Multiply,id:822,x:32503,y:33048,varname:node_822,prsc:2|A-8474-OUT,B-1976-XYZ;n:type:ShaderForge.SFN_ValueProperty,id:6865,x:31763,y:33101,ptovrint:False,ptlb:WorldXMult,ptin:_WorldXMult,varname:node_6865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_RemapRange,id:8416,x:32444,y:32822,varname:node_8416,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8474-OUT;proporder:1976-6865;pass:END;sub:END;*/

Shader "Shader Forge/ShaderForgeDepth" {
    Properties {
        _VertOffsetDir ("VertOffsetDir", Vector) = (0,1,0,0)
        _WorldXMult ("WorldXMult", Float ) = 1
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
            uniform float4 _VertOffsetDir;
            uniform float _WorldXMult;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float node_8474 = sin((mul(unity_ObjectToWorld, v.vertex).r*_WorldXMult));
                v.vertex.xyz += (node_8474*_VertOffsetDir.rgb);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float node_8474 = sin((i.posWorld.r*_WorldXMult));
                float node_8416 = (node_8474*0.5+0.5);
                float3 emissive = float3(node_8416,node_8416,node_8416);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _VertOffsetDir;
            uniform float _WorldXMult;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float node_8474 = sin((mul(unity_ObjectToWorld, v.vertex).r*_WorldXMult));
                v.vertex.xyz += (node_8474*_VertOffsetDir.rgb);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
