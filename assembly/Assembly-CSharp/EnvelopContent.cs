using System;
using UnityEngine;

// Token: 0x0200008F RID: 143
[RequireComponent(typeof(UIWidget))]
[AddComponentMenu("NGUI/Interaction/Envelop Content")]
public class EnvelopContent : MonoBehaviour
{
	// Token: 0x0600036C RID: 876 RVA: 0x00016B8C File Offset: 0x00014D8C
	private void Start()
	{
		this.mStarted = true;
		this.Execute();
	}

	// Token: 0x0600036D RID: 877 RVA: 0x00016B9C File Offset: 0x00014D9C
	private void OnEnable()
	{
		if (this.mStarted)
		{
			this.Execute();
		}
	}

	// Token: 0x0600036E RID: 878 RVA: 0x00016BB0 File Offset: 0x00014DB0
	[ContextMenu("Execute")]
	public void Execute()
	{
		if (this.targetRoot == base.transform)
		{
			Debug.LogError("Target Root object cannot be the same object that has Envelop Content. Make it a sibling instead.", this);
		}
		else if (NGUITools.IsChild(this.targetRoot, base.transform))
		{
			Debug.LogError("Target Root object should not be a parent of Envelop Content. Make it a sibling instead.", this);
		}
		else
		{
			Bounds bounds = NGUIMath.CalculateRelativeWidgetBounds(base.transform.parent, this.targetRoot, false, true);
			float num = bounds.min.x + (float)this.padLeft;
			float num2 = bounds.min.y + (float)this.padBottom;
			float num3 = bounds.max.x + (float)this.padRight;
			float num4 = bounds.max.y + (float)this.padTop;
			UIWidget component = base.GetComponent<UIWidget>();
			component.SetRect(num, num2, num3 - num, num4 - num2);
			base.BroadcastMessage("UpdateAnchors", 1);
		}
	}

	// Token: 0x040003A3 RID: 931
	public Transform targetRoot;

	// Token: 0x040003A4 RID: 932
	public int padLeft;

	// Token: 0x040003A5 RID: 933
	public int padRight;

	// Token: 0x040003A6 RID: 934
	public int padBottom;

	// Token: 0x040003A7 RID: 935
	public int padTop;

	// Token: 0x040003A8 RID: 936
	private bool mStarted;
}
