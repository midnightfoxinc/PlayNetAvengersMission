using System;
using UnityEngine;

// Token: 0x020001F9 RID: 505
public class ParticleSystemSingleAutoDestroy : MonoBehaviour
{
	// Token: 0x06000E7D RID: 3709 RVA: 0x0006600C File Offset: 0x0006420C
	public void Start()
	{
		this.ps = base.transform.GetComponent<ParticleSystem>();
	}

	// Token: 0x06000E7E RID: 3710 RVA: 0x00066020 File Offset: 0x00064220
	public void Update()
	{
		if (!this.ps.IsAlive())
		{
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x04000E60 RID: 3680
	private ParticleSystem ps;
}
