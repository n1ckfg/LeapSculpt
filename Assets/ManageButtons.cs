using UnityEngine;
using System.Collections;

public class ManageButtons : MonoBehaviour {

	// Use this for initialization
	public ToggleLeapButtons[] buttons;
	void Start () {
		buttons=GetComponentsInChildren<ToggleLeapButtons>();
	}

	public void PickOne(ToggleLeapButtons activeOne){
		
		foreach(ToggleLeapButtons button in buttons){
			button.Deactivate();
		}
		activeOne.Activate();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
