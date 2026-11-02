using System;
using UnityEngine;

// Token: 0x020001E8 RID: 488
public class AlwaysOrient : MonoBehaviour
{
	// Token: 0x06000E2A RID: 3626 RVA: 0x00064114 File Offset: 0x00062314
	private void Start()
	{
	}

	// Token: 0x06000E2B RID: 3627 RVA: 0x00064118 File Offset: 0x00062318
	private void Update()
	{
		base.transform.eulerAngles = Vector3.zero;
	}
}
