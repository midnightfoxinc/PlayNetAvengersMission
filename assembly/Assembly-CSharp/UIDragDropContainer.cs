using System;
using UnityEngine;

// Token: 0x020000A0 RID: 160
[AddComponentMenu("NGUI/Interaction/Drag and Drop Container")]
public class UIDragDropContainer : MonoBehaviour
{
	// Token: 0x060003D4 RID: 980 RVA: 0x0001944C File Offset: 0x0001764C
	protected virtual void Start()
	{
		if (this.reparentTarget == null)
		{
			this.reparentTarget = base.transform;
		}
	}

	// Token: 0x04000407 RID: 1031
	public Transform reparentTarget;
}
