using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200020B RID: 523
public class ReturnToPlayer : MonoBehaviour
{
	// Token: 0x06000ECC RID: 3788 RVA: 0x00069308 File Offset: 0x00067508
	private void Start()
	{
		this.Systems = new List<ParticleSystem>();
		ParticleSystem component = base.transform.GetComponent<ParticleSystem>();
		if (component != null)
		{
			this.Systems.Add(component);
		}
		List<ParticleSystem> list = new List<ParticleSystem>(base.transform.GetComponentsInChildren<ParticleSystem>());
		if (list != null && list.Count > 0)
		{
			this.Systems.AddRange(list);
		}
	}

	// Token: 0x06000ECD RID: 3789 RVA: 0x00069374 File Offset: 0x00067574
	private void Update()
	{
		if (!this.StartReturning)
		{
			return;
		}
		base.transform.position = Vector3.Lerp(base.transform.position, globals.armory_main.testfire_scene.MainMuzzle.position, Time.deltaTime * this.Speed);
		foreach (ParticleSystem particleSystem in this.Systems)
		{
			particleSystem.startSize = Mathf.Lerp(particleSystem.startSize, 0.1f, Time.deltaTime * this.Speed);
			particleSystem.startSpeed = Mathf.Lerp(particleSystem.startSize, 0.1f, Time.deltaTime * this.Speed);
		}
		this.Step = Mathf.Lerp(this.Step, 0f, Time.deltaTime * this.Speed);
		if (this.Step < 0.001f)
		{
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x06000ECE RID: 3790 RVA: 0x0006949C File Offset: 0x0006769C
	public void StartReturn()
	{
		this.StartReturning = true;
		globals.debug("  SHOULD BE STARTING TO RETURN ");
	}

	// Token: 0x04000F38 RID: 3896
	public bool StartReturning;

	// Token: 0x04000F39 RID: 3897
	private float Speed = 3f;

	// Token: 0x04000F3A RID: 3898
	private List<ParticleSystem> Systems;

	// Token: 0x04000F3B RID: 3899
	private float Step = 1f;
}
