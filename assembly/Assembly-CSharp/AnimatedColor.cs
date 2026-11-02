using System;
using UnityEngine;

// Token: 0x020000FB RID: 251
[ExecuteInEditMode]
[RequireComponent(typeof(UIWidget))]
public class AnimatedColor : MonoBehaviour
{
	// Token: 0x0600079E RID: 1950 RVA: 0x00039068 File Offset: 0x00037268
	private void OnEnable()
	{
		this.mWidget = base.GetComponent<UIWidget>();
		this.LateUpdate();
	}

	// Token: 0x0600079F RID: 1951 RVA: 0x0003907C File Offset: 0x0003727C
	private void LateUpdate()
	{
		this.mWidget.color = this.color;
	}

	// Token: 0x0400072A RID: 1834
	public Color color = Color.white;

	// Token: 0x0400072B RID: 1835
	private UIWidget mWidget;
}
