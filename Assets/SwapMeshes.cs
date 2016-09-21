using UnityEngine;
using System.Collections;

public class SwapMeshes : MonoBehaviour {

	// Use this for initialization

	MeshRenderer mesh;

	public Material[] mats;
	public bool matToggle=false;
	public int matNum;
	void Start () {

		mesh =GetComponent<MeshRenderer>();


	}
	
	// Update is called once per frame
	void Update () {
		if(matToggle){
			matNum=0;
		}
		else{
			matNum=1;
		}
		mesh.material=mats[matNum];
		SculptVerts.instance.gameObject.GetComponent<MeshRenderer>().material=mats[matNum];

	}

	void OnTriggerEnter(){
		matToggle =!matToggle;
	}
}

