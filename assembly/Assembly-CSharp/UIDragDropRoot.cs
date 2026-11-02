using System;
using UnityEngine;

// Token: 0x020000A3 RID: 163
[AddComponentMenu("NGUI/Interaction/Drag and Drop Root")]
public class UIDragDropRoot : MonoBehaviour
{
	// Token: 0x060003E9 RID: 1001 RVA: 0x00019CD4 File Offset: 0x00017ED4
	private void OnEnable()
	{
		UIDragDropRoot.root = base.transform;
	}

	// Token: 0x060003EA RID: 1002 RVA: 0x00019CE4 File Offset: 0x00017EE4
	private void OnDisable()
	{
		if (UIDragDropRoot.root == base.transform)
		{
			UIDragDropRoot.root = null;
		}
	}

	// Token: 0x0400041F RID: 1055
	public static Transform root;
}
