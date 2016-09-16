using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SculptVerts : MonoBehaviour {

	public static SculptVerts instance;

	public enum SculptTypes {LinearFalloff,ExponentialFalloff,CubicFalloff,Flat,SinFalloff,Sin,CustomCurve,Flatten};
	public AnimationCurve customFalloffCurve;

	public float sinScale=10f;
	private Vector3[] baseVertices;

	private Vector3[] tempVertices;

	//the verts to be set as they are at the very beginning, for the sake of resetting them
	public  Vector3[] startVerts;

	public SculptTypes sculptType;


	 Vector3 startPinchSpot;
	public Vector3 currentPinchingSpot;

	public SliderDemo brushSize;
	public SliderDemo brushStrength;
	public float pullSize=5f;
	public float pullStrength=.5f;



	public float lerpVertTime=1f;
	public AnimationCurve lerpInCurve;

	public bool getClosestPinchSpotFirst=false;

	public Mesh[] meshes;

	public int meshNum=0;
	public Mesh mesh;

	public SculptingHand hand;

	void Awake()
	{
		if (instance == null)
			instance = this;

		else if (instance != this)
			Destroy(gameObject);    
	}


	void Start(){
		mesh=GetComponent<MeshFilter>().mesh;
		mesh.MarkDynamic();

		startVerts=mesh.vertices;
		baseVertices = mesh.vertices;
	}
		
	public void SwapMesh(){
		if(meshNum>=meshes.Length){
			meshNum=0;
		}
		else if(meshNum<0){
			meshNum=meshes.Length-1;
		}

		GetComponent<MeshFilter>().mesh=meshes[meshNum];
		mesh=GetComponent<MeshFilter>().mesh;
		mesh.MarkDynamic();

		startVerts=mesh.vertices;
		baseVertices=mesh.vertices;

		tempVertices=null;
	}

	void Update () {
		if(Input.GetKeyDown(KeyCode.Space)){
			//SwapMesh();
		}

		//remap the slider to these hard coded values of ranges of influence
		pullSize=brushSize.sliderValue.Remap(0f,1f,.5f,3f);
		pullStrength=brushStrength.sliderValue.Remap(0f,1f,.2f,1.2f);

		if(Input.GetKeyDown(KeyCode.U)){
			StartCoroutine("LerpVerts");
		}

		//only cycle through the verts if we have a sculptingHand and the hand is pinching!
		if(hand != null && hand.pinching){
			//overwrite the temporary vertices 
			tempVertices=mesh.vertices;

			//get the current leap pinch positions from the SculptingHand
			currentPinchingSpot=hand.filtered_pinch_position_;

			//this vector is useful for knowing which way to offset verts, it's just the vector from where the pinch started to where it is now
			Vector3 dragVector=currentPinchingSpot-startPinchSpot;

			for (int i=0;i<tempVertices.Length;i++)
		{

			//since there's other vectors involved, we'd either need to translate everything to local vectors or just handle the vertex position in world space
			//so first we TransformPoint, tweak the verts, then InverseTransformPoint to put them back in positions the mesh will understand
			Vector3 vertexToSculpt = transform.TransformPoint(baseVertices[i]);

			//distance from where you pinched
			float distFromStartPinch =Vector3.Distance(vertexToSculpt,startPinchSpot);

			//this is critical - we only want the verts within the "brush size" or desired range of influence for the pinch
			if(distFromStartPinch<pullSize){

					switch(sculptType){

					case(SculptTypes.LinearFalloff):
						vertexToSculpt+=dragVector * (pullSize-distFromStartPinch)*pullStrength;
						break;
					case(SculptTypes.ExponentialFalloff):
						vertexToSculpt+=dragVector *  Mathf.Pow((pullSize-distFromStartPinch)*pullStrength,2f);
						break;
					case(SculptTypes.CubicFalloff):
						vertexToSculpt+=dragVector *  Mathf.Pow((pullSize-distFromStartPinch)*pullStrength,3f);
						break;
					case(SculptTypes.Flat):
						vertexToSculpt+=dragVector *pullStrength;
						break;
					case(SculptTypes.Sin):
						vertexToSculpt+=dragVector * (Mathf.Sin((pullSize-distFromStartPinch)/sinScale).Remap(-1f,1f,0f,1f));
						break;
					}

			}
				//back to local space for the mesh
				tempVertices[i] =transform.InverseTransformPoint(vertexToSculpt);
		}
			//finally, set the active mesh verts to the new verts, and RecalculateBounds makes sure new (possibly distant) parts of the mesh are drawn.
			mesh.vertices = tempVertices;
		mesh.RecalculateBounds();

		}
	
	}

	public void OnPinch(Vector3 rawPinch){
		Debug.Log("onpinch");
		startPinchSpot=rawPinch;
	}

	public void StopPinching(){
		baseVertices=tempVertices;
	}


	IEnumerator LerpVerts(){
		Debug.Log("yeP");
		float j=0f;
		Vector3[] currentVerts=tempVertices;

		while(j<1f){
			float lerpAmt=lerpInCurve.Evaluate(j);
			for (int i=0 ;i<currentVerts.Length;i++)
		{
				currentVerts[i]=Vector3.Lerp(currentVerts[i],startVerts[i],lerpAmt);
		}
			mesh.vertices=currentVerts;
			j+=Time.deltaTime/lerpVertTime;
			yield return null;

		}
		baseVertices=currentVerts;

	}



	public void GetPinchSpot(Vector3 pinchSpot){
		float currentClosest=1f;
		int currentClosestVert=0;

		for (int i=0;i<tempVertices.Length;i++)
		{
			float dist =Vector3.Distance(pinchSpot,transform.TransformPoint(tempVertices[i]));
				if(dist<currentClosest){
					currentClosest=dist;
					currentClosestVert=i;
				}
		}
		startPinchSpot= transform.TransformPoint(tempVertices[currentClosestVert]);
	}
/*
	void OnDrawGizmos() {
		Gizmos.color = Color.yellow;
		Gizmos.DrawSphere(currentPinchingSpot,pullSize);
	}
	*/
}

	/*
	public float GetPerlin(float x,float z){
		float dist = Vector2.Distance(new Vector2(x, z), lavaSpot);
		float extraHeight = 0 ;
		if (dist <= lavaLampDistance)
		{
			extraHeight = Mathf.Pow((lavaLampDistance - 1-dist),2) * lavaCenterHeight * lavaGeneralScale;
		}
		return extraHeight + Mathf.PerlinNoise((x+perlinLocX)/slopeScaler,(z+perlinLocY)/slopeScaler)*scale-scale/3;

	}

	IEnumerator LavaGoopCalculation()
	{
		lavaSpot = lavaSpotSet;
		float i = 0f;
		while (i <= 1.1f)
		{
			lavaCenterHeight = lavaLampCurve.Evaluate(i);
			i += Time.deltaTime / lavaLampDuration;
			yield return null;
		}

	}
}

*/