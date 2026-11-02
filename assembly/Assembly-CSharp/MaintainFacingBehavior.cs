using System;
using UnityEngine;

// Token: 0x020001BA RID: 442
public class MaintainFacingBehavior : MonoBehaviour
{
	// Token: 0x06000CF9 RID: 3321 RVA: 0x0005DD34 File Offset: 0x0005BF34
	[ContextMenu("Execute")]
	private void LateUpdate()
	{
		if (!this.target)
		{
			this.target = Camera.main.transform;
		}
		base.transform.rotation = this.target.rotation;
	}

	// Token: 0x04000D01 RID: 3329
	public Transform target;
}
