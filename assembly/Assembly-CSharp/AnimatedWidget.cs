using System;
using UnityEngine;

// Token: 0x020000FC RID: 252
[ExecuteInEditMode]
public class AnimatedWidget : MonoBehaviour
{
	// Token: 0x060007A1 RID: 1953 RVA: 0x000390B0 File Offset: 0x000372B0
	private void OnEnable()
	{
		this.mWidget = base.GetComponent<UIWidget>();
		this.LateUpdate();
	}

	// Token: 0x060007A2 RID: 1954 RVA: 0x000390C4 File Offset: 0x000372C4
	private void LateUpdate()
	{
		if (this.mWidget != null)
		{
			this.mWidget.width = Mathf.RoundToInt(this.width);
			this.mWidget.height = Mathf.RoundToInt(this.height);
		}
	}

	// Token: 0x0400072C RID: 1836
	public float width = 1f;

	// Token: 0x0400072D RID: 1837
	public float height = 1f;

	// Token: 0x0400072E RID: 1838
	private UIWidget mWidget;
}
