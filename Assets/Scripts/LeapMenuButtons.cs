using UnityEngine;
using System.Collections;
using LMWidgets;

public class LeapMenuButtons : ButtonToggleBase 
{

	public override void ButtonTurnsOn()
	{
		TurnsOnGraphics();
	}

	public override void ButtonTurnsOff()
	{
		TurnsOffGraphics();
	}

	private void TurnsOnGraphics()
	{
		transform.localScale=Vector3.one*2f;
	}

	private void TurnsOffGraphics()
	{

		transform.localScale=Vector3.one;
	}


	protected override void Start()
	{
		base.Start();
	}

	protected override void FixedUpdate()
	{
		base.FixedUpdate();
	}
}
