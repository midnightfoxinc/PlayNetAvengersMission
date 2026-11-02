using System;
using UnityEngine;

// Token: 0x020001EE RID: 494
public class DieTimer : MonoBehaviour
{
	// Token: 0x06000E56 RID: 3670 RVA: 0x00064DE0 File Offset: 0x00062FE0
	private void Start()
	{
		this.BornTime = Time.time;
	}

	// Token: 0x06000E57 RID: 3671 RVA: 0x00064DF0 File Offset: 0x00062FF0
	private void Update()
	{
		if (Time.time > this.BornTime + this.LifeTime)
		{
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x04000E19 RID: 3609
	public float LifeTime;

	// Token: 0x04000E1A RID: 3610
	private float BornTime;
}
