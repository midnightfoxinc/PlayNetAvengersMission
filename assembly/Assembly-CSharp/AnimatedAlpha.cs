using System;
using UnityEngine;

// Token: 0x020000FA RID: 250
[ExecuteInEditMode]
public class AnimatedAlpha : MonoBehaviour
{
	// Token: 0x0600079B RID: 1947 RVA: 0x00038FE0 File Offset: 0x000371E0
	private void OnEnable()
	{
		this.mWidget = base.GetComponent<UIWidget>();
		this.mPanel = base.GetComponent<UIPanel>();
		this.LateUpdate();
	}

	// Token: 0x0600079C RID: 1948 RVA: 0x00039000 File Offset: 0x00037200
	private void LateUpdate()
	{
		if (this.mWidget != null)
		{
			this.mWidget.alpha = this.alpha;
		}
		if (this.mPanel != null)
		{
			this.mPanel.alpha = this.alpha;
		}
	}

	// Token: 0x04000727 RID: 1831
	[Range(0f, 1f)]
	public float alpha = 1f;

	// Token: 0x04000728 RID: 1832
	private UIWidget mWidget;

	// Token: 0x04000729 RID: 1833
	private UIPanel mPanel;
}
