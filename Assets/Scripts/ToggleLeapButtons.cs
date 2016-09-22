using UnityEngine;
using System.Collections;

public class ToggleLeapButtons : MonoBehaviour {

	// Use this for initialization

	public bool enabled;
	public bool firstSelectedTool;

	public float lerpTime=1f;

	public float targetScale=1f;

	public SculptVerts.SculptTypes type;
	void Start () {
		if(firstSelectedTool)
			PickOne();
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void Activate(){
		enabled=true;
		targetScale=2f;
		StartCoroutine("LerpToScale");
		SculptVerts.instance.sculptType=type;
	}

	public void Deactivate(){
		enabled=false;
		targetScale=1f;
		StartCoroutine("LerpToScale");
	}

	void OnTriggerEnter(Collider col){
		if(col.CompareTag("IndexTip")){
			PickOne();
		}
	}

	IEnumerator LerpToScale(){
		float i= 0f;
		while(i<=1f){

			transform.localScale=Vector3.one*Mathf.Lerp(transform.localScale.x,targetScale,i);
			i+=Time.deltaTime/lerpTime;
			yield return null;
		}
		transform.localScale=Vector3.one*targetScale;

	}

	void PickOne(){
		GetComponentInParent<ManageButtons>().PickOne(this);
	}
}
