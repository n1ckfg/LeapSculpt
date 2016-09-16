using UnityEngine;
using System.Collections;
using Leap;

public class CustomHandInitializer : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
		
	public void AssignHand(Hand hand){
		if (hand.IsRight){
				SculptingHand handInstance =GetComponent<SculptingHand>();
				handInstance.enabled=true;
				LeapInputManager.instance.InitializePinchingHand(handInstance);
			}
	}

}
