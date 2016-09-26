using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Leap;

public class LeapRotate : MonoBehaviour {

	public float speed;


	public float horizontalSpeed = 1F;
	public float verticalSpeed = 1F;
	public float drag = 0.9f;

	Vector3 v3Rotation = Vector3.zero;
	public bool canMove=false;
	public float moveScale=2f;

	public Vector handRot;
	//public Hand rotatingHand;

	void Update () {
		
		if(handRot!=null){
		v3Rotation.y += horizontalSpeed * -handRot.x;
		v3Rotation.x -= verticalSpeed * -handRot.y;      
		}


		v3Rotation *= drag;

		transform.Rotate (v3Rotation,Space.World);

	//	v3Rotation.y=horizontalSpeed*handRot.y;
	//	v3Rotation.x=horizontalSpeed*handRot.x;

		if(canMove){
			transform.Translate(new Vector3(Input.GetAxis("Horizontal"),0f,Input.GetAxis("Vertical"))*moveScale);

		}
	}
		
}

