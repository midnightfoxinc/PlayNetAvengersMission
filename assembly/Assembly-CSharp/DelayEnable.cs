using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001EC RID: 492
public class DelayEnable : MonoBehaviour
{
	// Token: 0x06000E51 RID: 3665 RVA: 0x00064C44 File Offset: 0x00062E44
	public void EnabledAllInList()
	{
		foreach (GameObject gameObject in this.MyObjects)
		{
			gameObject.SetActive(true);
		}
	}

	// Token: 0x04000E13 RID: 3603
	public List<GameObject> MyObjects;

	// Token: 0x04000E14 RID: 3604
	private float BornTime;

	// Token: 0x04000E15 RID: 3605
	private float LastInterval;
}
