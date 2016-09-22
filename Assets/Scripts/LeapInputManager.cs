using UnityEngine;
using System.Collections;
using Leap;
using Leap.Util;



public class LeapInputManager : MonoBehaviour {

	Vector3 pos;

	public FingerModel[] fingers = new FingerModel[5];

	public GameObject[] fingertipObjects;

	public LeapRotate rotScript;

	public HandController handControl;
	public Frame frame;


	public GrabbableUI uiHandle;
	public GrabbableUI upperHandle;

	/*---------------------
	 * 
	 * This manager is for working with the leap's quirky input scheme.
	 * The main purpose here is to point the currently existing hand
	 *
	 ----------------------*/


	//enforce singleton pattern
	public static LeapInputManager instance = null;

		void Awake()
		{
			if (instance == null)
				instance = this;

			else if (instance != this)
				Destroy(gameObject);
		}

	//These are triggered by the SculptingHand.cs

	public void OnPinch(Vector3 pinchPos){
		SculptVerts.instance.OnPinch(pinchPos);
		uiHandle.OnPinch(pinchPos);
		upperHandle.OnPinch(pinchPos);
	}

	public void OnRelease(){
		SculptVerts.instance.StopPinching();
	}
		
	public void InitializePinchingHand(SculptingHand hand){
		SculptVerts.instance.hand=hand;
	}

	// Update is called once per frame
	void FixedUpdate () {
		
		frame=handControl.GetImageFrame();

		//assign the handRotation vector depending on the existance of a left hand
		if(frame.Hands.Count==1 && frame.Hands[0].IsLeft){
			rotScript.handRot= frame.Hands.Leftmost.PalmVelocity;
		}
		else if(frame.Hands.Count==2){
			rotScript.handRot= frame.Hands.Leftmost.PalmVelocity;
		}
		else{
			rotScript.handRot=Vector.Zero;
		}

		if(fingertipObjects.Length>0){
		for (int i = 0; i < fingers.Length; ++i) {
			fingertipObjects[i].transform.position=fingers[i].GetTipPosition();
		}
	}
	}
}
