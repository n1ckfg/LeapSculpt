using UnityEngine;
using System.Collections;
using Leap;

public class CustomHandInitializer : MonoBehaviour {

	//Upon the leap's typical InitHand method running, this little function checks if it's the right hand and if so activates the SculptingHand script

	public void AssignHand(Hand hand){
		if (hand.IsRight){
				SculptingHand handInstance =GetComponent<SculptingHand>();
				handInstance.enabled=true;
				LeapInputManager.instance.InitializePinchingHand(handInstance);
			}
	}

}
