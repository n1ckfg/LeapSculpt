using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SculptVerts : MonoBehaviour {

	public static SculptVerts instance;

	//more sculpt modes to come 
	public enum SculptTypes {LinearFalloff,ExponentialFalloff,CubicFalloff,Flat,SinFalloff,Sin,CustomCurve,Flatten};
	public AnimationCurve customFalloffCurve;
	public float sinScale=10f;

	//this is the vert array of the resting positions, while you're not pinching but they're in new deformed positions
	private Vector3[] baseVertices;

	//this is the vert array that gets written to
	private Vector3[] tempVertices;

	//the verts to be set as they are at the very beginning, for the sake of resetting them
	public  Vector3[] startVerts;

	public SculptTypes sculptType;

	//the vectors for pinch tracking
	Vector3 startPinchSpot;
	public Vector3 currentPinchingSpot;

	//management from the UI Sliders
	public SliderDemo brushSize;
	public SliderDemo brushStrength;
	public float pullSize=5f;
	public float pullStrength=.5f;

	//reset stuff
	public float lerpVertTime=1f;
	public AnimationCurve lerpInCurve;

	//the mesh array!
	public Mesh[] meshes;

	public int meshNum=0;
	public Mesh mesh;

	//the reference to the sculpting hand, from which we get the current pinch spot
	public SculptingHand hand;

	void Awake()
	{
		if (instance == null)
			instance = this;

		else if (instance != this)
			Destroy(gameObject);    
	}


	void Start(){
		//get the mesh at the start, set the verts initially 
		mesh=GetComponent<MeshFilter>().mesh;
		mesh.MarkDynamic();

		startVerts=mesh.vertices;
		baseVertices = mesh.vertices;
	}
		
	//SwapMesh does what it sounds like, but also sets the verts to new initial values
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


	// all the vert movement stuff is in here !
	void Update () {
		
		//remap the slider to these hard coded values of ranges of influence
		pullSize=brushSize.sliderValue.Remap(0f,1f,.5f,3f);
		pullStrength=brushStrength.sliderValue.Remap(0f,1f,.5f,1.4f);
	
		//only cycle through all the verts if we have a sculptingHand and the hand is pinching!
		if(hand != null && hand.pinching){
			//get the current vertices
			tempVertices=mesh.vertices;

			//get the current leap pinch positions from the SculptingHand
			currentPinchingSpot=hand.filtered_pinch_position_;

			//this vector is useful for knowing which way to offset verts, it's just the vector from where the pinch started to where it is now
			Vector3 dragVector=currentPinchingSpot-startPinchSpot;

			if(baseVertices!=null){
			for (int i=0;i<tempVertices.Length;i++)
		{
			//since there's other vectors involved, we'd either need to translate everything to local vectors or just handle the vertex position in world space
			//so first we TransformPoint, tweak the verts, then InverseTransformPoint to put them back in positions the mesh will understand
			Vector3 vertexToSculpt = transform.TransformPoint(baseVertices[i]);

			//distance from where you pinched
			float distFromStartPinch =Vector3.Distance(vertexToSculpt,startPinchSpot);

			//this is critical - we only want the verts within the "brush size" or desired range of influence for the pinch
			if(distFromStartPinch<pullSize){

						//the different stretch types, depending on the enum value we do different operations generally based on the distance from the center of the pinch.
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
	}

	//get pinch events from the LeapInputManager
	public void OnPinch(Vector3 rawPinch){
		startPinchSpot=rawPinch;
	}
	public void StopPinching(){
		baseVertices=tempVertices;
	}
	public void ResetMesh(){
		StartCoroutine("LerpVerts");
	}

	//the coroutine to reset the verts! Basically we just cycle every vert a little bit at a time back the its starting position
	IEnumerator LerpVerts(){
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
}