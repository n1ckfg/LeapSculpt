using UnityEngine;
using System.Collections;

public class RebuildingSphere : MonoBehaviour {

	public int numBits;

	public float hitRange=5f;
	public static RebuildingSphere instance = null; 

	void Awake()
	{
		if (instance == null)
			instance = this;

		else if (instance != this)
			Destroy(gameObject);    
	}
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		transform.localScale=Vector3.one*numBits*20;
	}
}
