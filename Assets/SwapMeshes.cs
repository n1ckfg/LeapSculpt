using UnityEngine;
using System.Collections;

public class SwapMeshes : MonoBehaviour {

	// Use this for initialization

	MeshRenderer mesh;

	public bool partyMode=false;
	public float speed;

	public Material[] mats;
	public int matNum;
	void Start () {

		mesh =GetComponent<MeshRenderer>();

	}
	
	// Update is called once per frame
	void Update () {
		
		mesh.material=mats[matNum];
		if(partyMode){
			float val = mesh.sharedMaterial.GetFloat("_node_2236");
			val+=speed;
			mesh.sharedMaterial.SetFloat("_node_2236",val);
		}

	}
}
