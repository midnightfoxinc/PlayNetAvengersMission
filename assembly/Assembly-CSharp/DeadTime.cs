using System;
using UnityEngine;

// Token: 0x02000144 RID: 324
public class DeadTime : MonoBehaviour
{
	// Token: 0x06000AA4 RID: 2724 RVA: 0x0004E418 File Offset: 0x0004C618
	private void Awake()
	{
		Object.Destroy(this.destroyRoot ? base.transform.root.gameObject : base.gameObject, this.deadTime);
	}

	// Token: 0x040009E1 RID: 2529
	public float deadTime = 1.5f;

	// Token: 0x040009E2 RID: 2530
	public bool destroyRoot;
}
