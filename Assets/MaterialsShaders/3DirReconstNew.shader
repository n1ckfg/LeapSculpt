// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33085,y:32693,varname:node_3138,prsc:2|emission-3638-OUT,custl-3638-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31930,y:32933,ptovrint:False,ptlb:c1,ptin:_c1,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_FragmentPosition,id:3681,x:31404,y:32665,varname:node_3681,prsc:2;n:type:ShaderForge.SFN_DDX,id:366,x:31725,y:32589,varname:node_366,prsc:2|IN-3681-XYZ;n:type:ShaderForge.SFN_DDY,id:2133,x:31725,y:32718,varname:node_2133,prsc:2|IN-3681-XYZ;n:type:ShaderForge.SFN_Cross,id:5447,x:32096,y:32652,varname:node_5447,prsc:2|A-3643-OUT,B-1188-OUT;n:type:ShaderForge.SFN_Normalize,id:3643,x:31885,y:32589,varname:node_3643,prsc:2|IN-366-OUT;n:type:ShaderForge.SFN_Normalize,id:1188,x:31896,y:32718,varname:node_1188,prsc:2|IN-2133-OUT;n:type:ShaderForge.SFN_Color,id:5425,x:32009,y:33005,ptovrint:False,ptlb:c2,ptin:_c2,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Color,id:3876,x:32106,y:33106,ptovrint:False,ptlb:c3,ptin:_c3,varname:_Color_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_ChannelBlend,id:3638,x:32741,y:32806,varname:node_3638,prsc:2,chbt:1|M-8349-OUT,R-7241-RGB,G-5425-RGB,B-3876-RGB,BTM-5385-OUT;n:type:ShaderForge.SFN_Color,id:6351,x:32621,y:32284,ptovrint:False,ptlb:lerpY1,ptin:_lerpY1,varname:_c4,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_ObjectPosition,id:7651,x:31500,y:32800,varname:node_7651,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8349,x:32250,y:32739,varname:node_8349,prsc:2|A-5447-OUT,B-5447-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:9698,x:32170,y:32510,varname:node_9698,prsc:2;n:type:ShaderForge.SFN_Add,id:8736,x:32407,y:32520,varname:node_8736,prsc:2|A-9698-Y,B-6413-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6413,x:32296,y:32429,ptovrint:False,ptlb:add,ptin:_add,varname:node_6413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:2634,x:32582,y:32548,varname:node_2634,prsc:2|A-7548-OUT,B-8736-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7548,x:32436,y:32402,ptovrint:False,ptlb:mult,ptin:_mult,varname:_add_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Lerp,id:7205,x:32843,y:32525,varname:node_7205,prsc:2|A-6351-RGB,B-6358-RGB,T-2634-OUT;n:type:ShaderForge.SFN_Color,id:6358,x:32621,y:32446,ptovrint:False,ptlb:lerpY2,ptin:_lerpY2,varname:_c5,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:8237,x:32455,y:33117,ptovrint:False,ptlb:yLerpAmt,ptin:_yLerpAmt,varname:node_8237,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Lerp,id:5385,x:32632,y:33117,varname:node_5385,prsc:2|A-4279-RGB,B-7205-OUT,T-8237-OUT;n:type:ShaderForge.SFN_Color,id:4279,x:32337,y:33208,ptovrint:False,ptlb:altBtmColor,ptin:_altBtmColor,varname:node_4279,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:7241-5425-3876-6413-7548-6351-6358-8237-4279;pass:END;sub:END;*/

Shader "Shader Forge/3DirReconstNew" {
    Properties {
        _c1 ("c1", Color) = (0.07843138,0.3921569,0.7843137,1)
        _c2 ("c2", Color) = (0.07843138,0.3921569,0.7843137,1)
        _c3 ("c3", Color) = (0.07843138,0.3921569,0.7843137,1)
        _add ("add", Float ) = 0
        _mult ("mult", Float ) = 1
        _lerpY1 ("lerpY1", Color) = (1,1,1,1)
        _lerpY2 ("lerpY2", Color) = (0,0,0,1)
        _yLerpAmt ("yLerpAmt", Float ) = 0
        _altBtmColor ("altBtmColor", Color) = (0.5,0.5,0.5,1)
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
            uniform float4 _c1;
            uniform float4 _c2;
            uniform float4 _c3;
            uniform float4 _lerpY1;
            uniform float _add;
            uniform float _mult;
            uniform float4 _lerpY2;
            uniform float _yLerpAmt;
            uniform float4 _altBtmColor;
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
                float3 node_5447 = cross(normalize(ddx(i.posWorld.rgb)),normalize(ddy(i.posWorld.rgb)));
                float3 node_8349 = (node_5447*node_5447);
                float3 node_3638 = (lerp( lerp( lerp( lerp(_altBtmColor.rgb,lerp(_lerpY1.rgb,_lerpY2.rgb,(_mult*(i.posWorld.g+_add))),_yLerpAmt), _c1.rgb, node_8349.r ), _c2.rgb, node_8349.g ), _c3.rgb, node_8349.b ));
                float3 emissive = node_3638;
                float3 finalColor = emissive + node_3638;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
