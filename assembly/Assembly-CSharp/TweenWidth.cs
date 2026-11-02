using System;
using UnityEngine;

// Token: 0x02000109 RID: 265
[RequireComponent(typeof(UIWidget))]
[AddComponentMenu("NGUI/Tween/Tween Width")]
public class TweenWidth : UITweener
{
	// Token: 0x170000E7 RID: 231
	// (get) Token: 0x0600081D RID: 2077 RVA: 0x0003A74C File Offset: 0x0003894C
	public UIWidget cachedWidget
	{
		get
		{
			if (this.mWidget == null)
			{
				this.mWidget = base.GetComponent<UIWidget>();
			}
			return this.mWidget;
		}
	}

	// Token: 0x170000E8 RID: 232
	// (get) Token: 0x0600081E RID: 2078 RVA: 0x0003A774 File Offset: 0x00038974
	// (set) Token: 0x0600081F RID: 2079 RVA: 0x0003A77C File Offset: 0x0003897C
	[Obsolete("Use 'value' instead")]
	public int width
	{
		get
		{
			return this.value;
		}
		set
		{
			this.value = value;
		}
	}

	// Token: 0x170000E9 RID: 233
	// (get) Token: 0x06000820 RID: 2080 RVA: 0x0003A788 File Offset: 0x00038988
	// (set) Token: 0x06000821 RID: 2081 RVA: 0x0003A798 File Offset: 0x00038998
	public int value
	{
		get
		{
			return this.cachedWidget.width;
		}
		set
		{
			this.cachedWidget.width = value;
		}
	}

	// Token: 0x06000822 RID: 2082 RVA: 0x0003A7A8 File Offset: 0x000389A8
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = Mathf.RoundToInt((float)this.from * (1f - factor) + (float)this.to * factor);
		if (this.updateTable)
		{
			if (this.mTable == null)
			{
				this.mTable = NGUITools.FindInParents<UITable>(base.gameObject);
				if (this.mTable == null)
				{
					this.updateTable = false;
					return;
				}
			}
			this.mTable.repositionNow = true;
		}
	}

	// Token: 0x06000823 RID: 2083 RVA: 0x0003A82C File Offset: 0x00038A2C
	public static TweenWidth Begin(UIWidget widget, float duration, int width)
	{
		TweenWidth tweenWidth = UITweener.Begin<TweenWidth>(widget.gameObject, duration);
		tweenWidth.from = widget.width;
		tweenWidth.to = width;
		if (duration <= 0f)
		{
			tweenWidth.Sample(1f, true);
			tweenWidth.enabled = false;
		}
		return tweenWidth;
	}

	// Token: 0x06000824 RID: 2084 RVA: 0x0003A878 File Offset: 0x00038A78
	[ContextMenu("Set 'From' to current value")]
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x06000825 RID: 2085 RVA: 0x0003A888 File Offset: 0x00038A88
	[ContextMenu("Set 'To' to current value")]
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x06000826 RID: 2086 RVA: 0x0003A898 File Offset: 0x00038A98
	[ContextMenu("Assume value of 'From'")]
	private void SetCurrentValueToStart()
	{
		this.value = this.from;
	}

	// Token: 0x06000827 RID: 2087 RVA: 0x0003A8A8 File Offset: 0x00038AA8
	[ContextMenu("Assume value of 'To'")]
	private void SetCurrentValueToEnd()
	{
		this.value = this.to;
	}

	// Token: 0x0400076F RID: 1903
	public int from = 100;

	// Token: 0x04000770 RID: 1904
	public int to = 100;

	// Token: 0x04000771 RID: 1905
	public bool updateTable;

	// Token: 0x04000772 RID: 1906
	private UIWidget mWidget;

	// Token: 0x04000773 RID: 1907
	private UITable mTable;
}
