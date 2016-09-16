using UnityEngine;
using System.Collections;
using DG.Tweening;

public class FragmentScript : MonoBehaviour {

	// Use this for initialization
	public Vector3 startPos;
	public Quaternion startRot;
	public float resetTime=1f;
	void Start () {
		startPos=transform.position;
		startRot=transform.rotation;
	
	}

	public void Reset(){
	//	GetComponent<Rigidbody>().velocity=Vector3.zero;
		GetComponent<Rigidbody>().isKinematic=true;

		transform.DOMove(startPos,resetTime,false).SetEase(Ease.InOutCubic);
		transform.DORotateQuaternion(startRot,resetTime).SetEase(Ease.InOutCubic).OnComplete(toggleKinematic);;

		//

	//	GetComponent<Rigidbody>().velocity=Vector3.zero;
	//	
	}

	public void toggleKinematic(){
		GetComponent<Rigidbody>().isKinematic=false;
	}
	
	// Update is called once per frame
	void Update () {

		if(Input.GetKeyDown(KeyCode.U)){
			Reset();
		}
	
	}
}
