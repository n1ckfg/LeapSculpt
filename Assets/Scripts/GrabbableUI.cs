using UnityEngine;
using System.Collections;
using DG.Tweening;

public class GrabbableUI : MonoBehaviour {

	// Use this for initialization
	 SculptingHand hand;

	public float moveDist=3f;
	public float grabbableRange=.5f;

	public float minY;
	public float maxY;

	public bool toggleMovement;
	public bool canPinch=true;
	public bool moveMeshAlso=false;

	GameObject buttonManager;

	void Start () {
		buttonManager=GetComponentInChildren<ManageButtons>().gameObject;
		buttonManager.SetActive(false);
	}
	
	// Update is called once per frame
	void Update () {
	}

	public void OnPinch(Vector3 pinchSpot){
		//check if you pinched in range of the handle
		float dist =Vector3.Distance(pinchSpot,transform.position);
		if(dist<grabbableRange &&canPinch){
			canPinch=false;

		if(!toggleMovement ){
			buttonManager.SetActive(true);
			MoveUpOrDown(true);
		}
			else{
			buttonManager.SetActive(false);
			MoveUpOrDown(false);
		}
		}
		//if a pinch is registered out of range of the handle while it's up, hide the handle again
		//very specific set of bools here, sorry if it's confusing. moveMeshalso makes this reset only happen for the mesh selector ui, which sas that bool disabled anyway
		else if(dist>grabbableRange && toggleMovement && canPinch && !moveMeshAlso){
			buttonManager.SetActive(false);
			canPinch=false;
			MoveUpOrDown(false);
		}
	}

	public void MoveUpOrDown(bool up){
		Vector3 moveDir;
		if(up)
			moveDir=Vector3.up;
		else
			moveDir=Vector3.down;

		transform.DOBlendableMoveBy(moveDir*moveDist,1f).SetEase(Ease.OutCubic).OnComplete(ToggleMovement);

		if(moveMeshAlso)
			SculptVerts.instance.transform.parent.DOBlendableMoveBy(moveDir*moveDist,1f).SetEase(Ease.OutCubic);

	}

	void ToggleMovement(){
		toggleMovement=!toggleMovement;
		canPinch=true;
	}

}
