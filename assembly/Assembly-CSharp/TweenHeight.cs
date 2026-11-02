using System;
using UnityEngine;

// Token: 0x02000102 RID: 258
[AddComponentMenu("NGUI/Tween/Tween Height")]
[RequireComponent(typeof(UIWidget))]
public class TweenHeight : UITweener
{
	// Token: 0x170000D5 RID: 213
	// (get) Token: 0x060007D3 RID: 2003 RVA: 0x00039B84 File Offset: 0x00037D84
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

	// Token: 0x170000D6 RID: 214
	// (get) Token: 0x060007D4 RID: 2004 RVA: 0x00039BAC File Offset: 0x00037DAC
	// (set) Token: 0x060007D5 RID: 2005 RVA: 0x00039BB4 File Offset: 0x00037DB4
	[Obsolete("Use 'value' instead")]
	public int height
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

	// Token: 0x170000D7 RID: 215
	// (get) Token: 0x060007D6 RID: 2006 RVA: 0x00039BC0 File Offset: 0x00037DC0
	// (set) Token: 0x060007D7 RID: 2007 RVA: 0x00039BD0 File Offset: 0x00037DD0
	public int value
	{
		get
		{
			return this.cachedWidget.height;
		}
		set
		{
			this.cachedWidget.height = value;
		}
	}

	// Token: 0x060007D8 RID: 2008 RVA: 0x00039BE0 File Offset: 0x00037DE0
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

	// Token: 0x060007D9 RID: 2009 RVA: 0x00039C64 File Offset: 0x00037E64
	public static TweenHeight Begin(UIWidget widget, float duration, int height)
	{
		TweenHeight tweenHeight = UITweener.Begin<TweenHeight>(widget.gameObject, duration);
		tweenHeight.from = widget.height;
		tweenHeight.to = height;
		if (duration <= 0f)
		{
			tweenHeight.Sample(1f, true);
			tweenHeight.enabled = false;
		}
		return tweenHeight;
	}

	// Token: 0x060007DA RID: 2010 RVA: 0x00039CB0 File Offset: 0x00037EB0
	[ContextMenu("Set 'From' to current value")]
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x060007DB RID: 2011 RVA: 0x00039CC0 File Offset: 0x00037EC0
	[ContextMenu("Set 'To' to current value")]
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x060007DC RID: 2012 RVA: 0x00039CD0 File Offset: 0x00037ED0
	[ContextMenu("Assume value of 'From'")]
	private void SetCurrentValueToStart()
	{
		this.value = this.from;
	}

	// Token: 0x060007DD RID: 2013 RVA: 0x00039CE0 File Offset: 0x00037EE0
	[ContextMenu("Assume value of 'To'")]
	private void SetCurrentValueToEnd()
	{
		this.value = this.to;
	}

	// Token: 0x0400074F RID: 1871
	public int from = 100;

	// Token: 0x04000750 RID: 1872
	public int to = 100;

	// Token: 0x04000751 RID: 1873
	public bool updateTable;

	// Token: 0x04000752 RID: 1874
	private UIWidget mWidget;

	// Token: 0x04000753 RID: 1875
	private UITable mTable;
}
