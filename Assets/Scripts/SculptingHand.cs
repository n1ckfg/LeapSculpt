/******************************************************************************\
* Copyright (C) Leap Motion, Inc. 2011-2014.                                   *
* Leap Motion proprietary. Licensed under Apache 2.0                           *
* Available at http://www.apache.org/licenses/LICENSE-2.0.html                 *
\******************************************************************************/


using UnityEngine;
using System.Collections;
using Leap;

// Leap Motion hand script that detects pinches and grabs the closest rigidbody.
public class SculptingHand : MonoBehaviour {

	public enum PinchState {
		kPinched,
		kReleased,
		kReleasing
	}
	// Ratio of the length of the proximal bone of the thumb that will trigger a pinch.
	public float grabTriggerDistance = 0.7f;

	// Ratio of the length of the proximal bone of the thumb that will trigger a release.
	public float releaseTriggerDistance = 1.2f;

	// If the object gets far from the pinch we'll break the bond.
	public float releaseBreakDistance = 0.3f;

	// Filtering the rotation of grabbed object.
	public float rotationFiltering = 0.4f;

	// Filtering the movement of grabbed object.
	public float positionFiltering = 0.4f;

	// Curve of the trailing off of strength as you release the object.
	public AnimationCurve releaseStrengthCurve;

	// Minimum tracking confidence of the hand that will cause a change of state.
	public float minConfidence = 0.1f;


	protected PinchState pinch_state_;
	protected Collider active_object_;

	protected float last_max_angular_velocity_;
	protected Quaternion rotation_from_palm_;

	protected Vector3 current_pinch_position_;
	public Vector3 filtered_pinch_position_;
	protected Vector3 object_pinch_offset_;
	protected Quaternion palm_rotation_;

	public GrabbableUI grabbableUI;
	public bool pinching;

	Hand hand;

	void Awake(){
				
		//	if(LeapInputManager.instance.hands.Length=
	
	}

	void Start() {
		pinch_state_ = PinchState.kReleased;
		active_object_ = null;
		last_max_angular_velocity_ = 0.0f;
		rotation_from_palm_ = Quaternion.identity;
		current_pinch_position_ = Vector3.zero;
		filtered_pinch_position_ = Vector3.zero;
		object_pinch_offset_ = Vector3.zero;
		palm_rotation_ = Quaternion.identity;
	}

	void OnDestroy() {
		OnRelease();
	}
		
	//these tell the LeapInputManager to trigger stuff.	
	protected void StartPinch() {
		LeapInputManager.instance.OnPinch(current_pinch_position_);
		pinching=true;
	}

	protected void OnRelease() {
		LeapInputManager.instance.OnRelease();
		pinching=false;
	}


	// this is all the stuff straight from the original leap scripts

	protected PinchState GetNewPinchState() {
		HandModel hand_model = GetComponent<HandModel>();
		Hand leap_hand = hand_model.GetLeapHand();

		Vector leap_thumb_tip = leap_hand.Fingers[0].TipPosition;
		float closest_distance = Mathf.Infinity;

		// Check thumb tip distance to joints on all other fingers.
		// If it's close enough, you're pinching.
		for (int i = 1; i < HandModel.NUM_FINGERS; ++i) {
			Finger finger = leap_hand.Fingers[i];

			for (int j = 0; j < FingerModel.NUM_BONES; ++j) {
				Vector leap_joint_position = finger.Bone((Bone.BoneType)j).NextJoint;

				float thumb_tip_distance = leap_joint_position.DistanceTo(leap_thumb_tip);
				closest_distance = Mathf.Min(closest_distance, thumb_tip_distance);
			}
		}

		// Scale trigger distance by thumb proximal bone length.
		float proximal_length = leap_hand.Fingers[0].Bone(Bone.BoneType.TYPE_PROXIMAL).Length;
		float trigger_distance = proximal_length * grabTriggerDistance;

		if (closest_distance <= trigger_distance)
			return PinchState.kPinched;
		else
			return PinchState.kReleased;
	}


	protected void UpdatePinchPosition() {
		HandModel hand_model = GetComponent<HandModel>();
		current_pinch_position_ = 0.5f * (hand_model.fingers[0].GetTipPosition() + 
			hand_model.fingers[1].GetTipPosition());

		Vector3 delta_pinch = current_pinch_position_ - filtered_pinch_position_;
		filtered_pinch_position_ += (1.0f - positionFiltering) * delta_pinch;
	}





	protected void UpdatePalmRotation() {
		HandModel hand_model = GetComponent<HandModel>();
		palm_rotation_ = Quaternion.Slerp(palm_rotation_, hand_model.GetPalmRotation(),
			1.0f - rotationFiltering);
	}
		
	void FixedUpdate() {
		
	//assign to sculptVerts if it doesn't have a hand this is pretty much a failsafe thing
		if(SculptVerts.instance.hand==null){
			SculptVerts.instance.hand=this;
		}

		UpdatePalmRotation();
		UpdatePinchPosition();

		HandModel hand_model = GetComponent<HandModel>();
		Hand leap_hand = hand_model.GetLeapHand();



		if (leap_hand == null)
			return;

		PinchState new_pinch_state = GetNewPinchState();

		if (pinch_state_ == PinchState.kPinched) {
			if (new_pinch_state == PinchState.kReleased)
				OnRelease();
		}
		else if (pinch_state_ == PinchState.kReleasing) {
			if (new_pinch_state == PinchState.kReleased)
				OnRelease();
			else if (new_pinch_state == PinchState.kPinched)
				StartPinch();
		}
		else {
			if (new_pinch_state == PinchState.kPinched)
				StartPinch();
		}
		pinch_state_ = new_pinch_state;
	}
}