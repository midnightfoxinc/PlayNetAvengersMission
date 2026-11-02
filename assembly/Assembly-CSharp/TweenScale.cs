using System;
using UnityEngine;

// Token: 0x02000106 RID: 262
[AddComponentMenu("NGUI/Tween/Tween Scale")]
public class TweenScale : UITweener
{
	// Token: 0x170000E1 RID: 225
	// (get) Token: 0x06000803 RID: 2051 RVA: 0x0003A200 File Offset: 0x00038400
	public Transform cachedTransform
	{
		get
		{
			if (this.mTrans == null)
			{
				this.mTrans = base.transform;
			}
			return this.mTrans;
		}
	}

	// Token: 0x170000E2 RID: 226
	// (get) Token: 0x06000804 RID: 2052 RVA: 0x0003A228 File Offset: 0x00038428
	// (set) Token: 0x06000805 RID: 2053 RVA: 0x0003A238 File Offset: 0x00038438
	public Vector3 value
	{
		get
		{
			return this.cachedTransform.localScale;
		}
		set
		{
			this.cachedTransform.localScale = value;
		}
	}

	// Token: 0x170000E3 RID: 227
	// (get) Token: 0x06000806 RID: 2054 RVA: 0x0003A248 File Offset: 0x00038448
	// (set) Token: 0x06000807 RID: 2055 RVA: 0x0003A250 File Offset: 0x00038450
	[Obsolete("Use 'value' instead")]
	public Vector3 scale
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

	// Token: 0x06000808 RID: 2056 RVA: 0x0003A25C File Offset: 0x0003845C
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = this.from * (1f - factor) + this.to * factor;
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

	// Token: 0x06000809 RID: 2057 RVA: 0x0003A2E4 File Offset: 0x000384E4
	public static TweenScale Begin(GameObject go, float duration, Vector3 scale)
	{
		TweenScale tweenScale = UITweener.Begin<TweenScale>(go, duration);
		tweenScale.from = tweenScale.value;
		tweenScale.to = scale;
		if (duration <= 0f)
		{
			tweenScale.Sample(1f, true);
			tweenScale.enabled = false;
		}
		return tweenScale;
	}

	// Token: 0x0600080A RID: 2058 RVA: 0x0003A32C File Offset: 0x0003852C
	[ContextMenu("Set 'From' to current value")]
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x0600080B RID: 2059 RVA: 0x0003A33C File Offset: 0x0003853C
	[ContextMenu("Set 'To' to current value")]
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x0600080C RID: 2060 RVA: 0x0003A34C File Offset: 0x0003854C
	[ContextMenu("Assume value of 'From'")]
	private void SetCurrentValueToStart()
	{
		this.value = this.from;
	}

	// Token: 0x0600080D RID: 2061 RVA: 0x0003A35C File Offset: 0x0003855C
	[ContextMenu("Assume value of 'To'")]
	private void SetCurrentValueToEnd()
	{
		this.value = this.to;
	}

	// Token: 0x04000760 RID: 1888
	public Vector3 from = Vector3.one;

	// Token: 0x04000761 RID: 1889
	public Vector3 to = Vector3.one;

	// Token: 0x04000762 RID: 1890
	public bool updateTable;

	// Token: 0x04000763 RID: 1891
	private Transform mTrans;

	// Token: 0x04000764 RID: 1892
	private UITable mTable;
}
