using System;
using UnityEngine;

// Token: 0x020001F2 RID: 498
public class MoveToLocator : MonoBehaviour
{
	// Token: 0x06000E64 RID: 3684 RVA: 0x00065034 File Offset: 0x00063234
	private void Start()
	{
	}

	// Token: 0x06000E65 RID: 3685 RVA: 0x00065038 File Offset: 0x00063238
	private void Update()
	{
		base.transform.position = this.TargetTrans.position;
	}

	// Token: 0x04000E26 RID: 3622
	public Transform TargetTrans;
}
