using System;
using UnityEngine;

// Token: 0x020001B1 RID: 433
public class CenterOnRootBehavior : MonoBehaviour
{
	// Token: 0x06000CE1 RID: 3297 RVA: 0x0005D668 File Offset: 0x0005B868
	[ContextMenu("Execute")]
	private void Start()
	{
		base.transform.position = NGUITools.GetRoot(base.gameObject).transform.position;
	}
}
