using System;
using UnityEngine;

// Token: 0x0200020D RID: 525
public class ScrollUVLineRenderer : MonoBehaviour
{
	// Token: 0x06000ED3 RID: 3795 RVA: 0x00069610 File Offset: 0x00067810
	private void Start()
	{
	}

	// Token: 0x06000ED4 RID: 3796 RVA: 0x00069614 File Offset: 0x00067814
	private void Update()
	{
		float x = this.MyLineLenderer.material.GetTextureOffset("_MainTex").x;
		this.MyLineLenderer.material.SetTextureOffset("_MainTex", new Vector2(x + this.ScrollSpeed, 1f));
	}

	// Token: 0x04000F45 RID: 3909
	public LineRenderer MyLineLenderer;

	// Token: 0x04000F46 RID: 3910
	public float ScrollSpeed;
}
