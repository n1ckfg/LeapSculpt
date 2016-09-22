using UnityEngine;
using System.Collections;

public class SwapMeshButton : MonoBehaviour {

	// Use this for initialization
	public bool rightButton;
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnTriggerEnter(Collider col){
		if(col.CompareTag("IndexTip")){
			if(rightButton){
				SculptVerts.instance.meshNum++;
				SculptVerts.instance.SwapMesh();
			}
			else{
				SculptVerts.instance.meshNum--;
				SculptVerts.instance.SwapMesh();
			}
		}
	}
}
