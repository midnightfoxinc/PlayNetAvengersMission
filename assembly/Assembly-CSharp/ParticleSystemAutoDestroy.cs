using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001F8 RID: 504
public class ParticleSystemAutoDestroy : MonoBehaviour
{
	// Token: 0x06000E7A RID: 3706 RVA: 0x00065F58 File Offset: 0x00064158
	public void Start()
	{
		this.ps = new List<ParticleSystem>();
		this.ps.AddRange(base.transform.GetComponentsInChildren<ParticleSystem>());
	}

	// Token: 0x06000E7B RID: 3707 RVA: 0x00065F7C File Offset: 0x0006417C
	public void Update()
	{
		foreach (ParticleSystem particleSystem in this.ps)
		{
			if (particleSystem != null && particleSystem.IsAlive())
			{
				break;
			}
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x04000E5F RID: 3679
	public List<ParticleSystem> ps;
}
