using System;
using UnityEngine;

// Token: 0x020001ED RID: 493
public class DelayWorldEffects : MonoBehaviour
{
	// Token: 0x06000E53 RID: 3667 RVA: 0x00064CC0 File Offset: 0x00062EC0
	private void Start()
	{
		this.BornTime = Time.time;
	}

	// Token: 0x06000E54 RID: 3668 RVA: 0x00064CD0 File Offset: 0x00062ED0
	private void Update()
	{
		if (this.HasPlayed)
		{
			return;
		}
		if (Time.time > this.BornTime + this.DelayTimeToStart)
		{
			this.HasPlayed = true;
			foreach (ParticleSystem particleSystem in globals.armory_main.testfire_scene.EMPWorldParticleSystems)
			{
				particleSystem.Play();
			}
			for (int i = 0; i < globals.armory_main.testfire_scene.EMPWorldCallLightnings.Count - 1; i++)
			{
				globals.armory_main.testfire_scene.EMPWorldCallLightnings[i].GetLightning(new Vector3(0.001f, 0.001f, 0.001f), globals.armory_main.testfire_scene.EMPWorldCallLightningTargets[i].position);
			}
		}
	}

	// Token: 0x04000E16 RID: 3606
	public float DelayTimeToStart = 2f;

	// Token: 0x04000E17 RID: 3607
	private bool HasPlayed;

	// Token: 0x04000E18 RID: 3608
	private float BornTime;
}
