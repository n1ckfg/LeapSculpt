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

	bool toggleMovement;
	bool canPinch=true;
	public bool moveMeshAlso=false;

	GameObject buttonManager;

	void Start () {
		buttonManager=GetComponentInChildren<ManageButtons>().gameObject;
		buttonManager.SetActive(false);
	}
	
	// Update is called once per frame
	void Update () {
		/*
		hand = SculptVerts.instance.hand;
		if(hand!=null){
		if(hand.pinching && pinchInRange){
				Vector3 pos= transform.position;
				pos.y=hand.filtered_pinch_position_.y;
				if(pos.y<=minY){
					pos.y=minY;
				}
				else if(pos.y>=maxY){
					pos.y=maxY;
				}
				transform.position=pos;
		}
		}
		*/
	}
	/*
	public void StopPinching(){
		pinchInRange=false;

		if(Vector3.Distance(pinchSpot,transform.position)<grabbableRange){
			pinchInRange=true;
		}
	}
	*/
	public void OnPinch(Vector3 pinchSpot){
		if(Vector3.Distance(pinchSpot,transform.position)<grabbableRange &&canPinch){
			canPinch=false;
		if(!toggleMovement ){
				buttonManager.SetActive(true);
				if(moveMeshAlso)
					SculptVerts.instance.transform.parent.DOBlendableMoveBy(Vector3.up*moveDist,1f).SetEase(Ease.OutCubic);
				
				transform.DOBlendableMoveBy(Vector3.up*moveDist,1f).SetEase(Ease.OutCubic).OnComplete(ToggleMovement);


		}
			else{
				buttonManager.SetActive(false);
				transform.DOBlendableMoveBy(Vector3.down*moveDist,1f).SetEase(Ease.OutCubic).OnComplete(ToggleMovement);

				if(moveMeshAlso)
					SculptVerts.instance.transform.parent.DOBlendableMoveBy(Vector3.down*moveDist,1f).SetEase(Ease.OutCubic);
		}
		}
	}

	void ToggleMovement(){
		toggleMovement=!toggleMovement;
		canPinch=true;
	}

}
