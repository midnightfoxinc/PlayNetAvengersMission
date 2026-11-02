using System;
using UnityEngine;

// Token: 0x02000104 RID: 260
[AddComponentMenu("NGUI/Tween/Tween Position")]
public class TweenPosition : UITweener
{
	// Token: 0x170000DB RID: 219
	// (get) Token: 0x060007E9 RID: 2025 RVA: 0x00039DFC File Offset: 0x00037FFC
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

	// Token: 0x170000DC RID: 220
	// (get) Token: 0x060007EA RID: 2026 RVA: 0x00039E24 File Offset: 0x00038024
	// (set) Token: 0x060007EB RID: 2027 RVA: 0x00039E2C File Offset: 0x0003802C
	[Obsolete("Use 'value' instead")]
	public Vector3 position
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

	// Token: 0x170000DD RID: 221
	// (get) Token: 0x060007EC RID: 2028 RVA: 0x00039E38 File Offset: 0x00038038
	// (set) Token: 0x060007ED RID: 2029 RVA: 0x00039E6C File Offset: 0x0003806C
	public Vector3 value
	{
		get
		{
			return (!this.worldSpace) ? this.cachedTransform.localPosition : this.cachedTransform.position;
		}
		set
		{
			if (this.mRect == null || !this.mRect.isAnchored || this.worldSpace)
			{
				if (this.worldSpace)
				{
					this.cachedTransform.position = value;
				}
				else
				{
					this.cachedTransform.localPosition = value;
				}
			}
			else
			{
				value -= this.cachedTransform.localPosition;
				NGUIMath.MoveRect(this.mRect, value.x, value.y);
			}
		}
	}

	// Token: 0x060007EE RID: 2030 RVA: 0x00039F00 File Offset: 0x00038100
	private void Awake()
	{
		this.mRect = base.GetComponent<UIRect>();
	}

	// Token: 0x060007EF RID: 2031 RVA: 0x00039F10 File Offset: 0x00038110
	protected override void OnUpdate(float factor, bool isFinished)
	{
		this.value = this.from * (1f - factor) + this.to * factor;
	}

	// Token: 0x060007F0 RID: 2032 RVA: 0x00039F3C File Offset: 0x0003813C
	public static TweenPosition Begin(GameObject go, float duration, Vector3 pos)
	{
		TweenPosition tweenPosition = UITweener.Begin<TweenPosition>(go, duration);
		tweenPosition.from = tweenPosition.value;
		tweenPosition.to = pos;
		if (duration <= 0f)
		{
			tweenPosition.Sample(1f, true);
			tweenPosition.enabled = false;
		}
		return tweenPosition;
	}

	// Token: 0x060007F1 RID: 2033 RVA: 0x00039F84 File Offset: 0x00038184
	public static TweenPosition Begin(GameObject go, float duration, Vector3 pos, bool worldSpace)
	{
		TweenPosition tweenPosition = UITweener.Begin<TweenPosition>(go, duration);
		tweenPosition.worldSpace = worldSpace;
		tweenPosition.from = tweenPosition.value;
		tweenPosition.to = pos;
		if (duration <= 0f)
		{
			tweenPosition.Sample(1f, true);
			tweenPosition.enabled = false;
		}
		return tweenPosition;
	}

	// Token: 0x060007F2 RID: 2034 RVA: 0x00039FD4 File Offset: 0x000381D4
	[ContextMenu("Set 'From' to current value")]
	public override void SetStartToCurrentValue()
	{
		this.from = this.value;
	}

	// Token: 0x060007F3 RID: 2035 RVA: 0x00039FE4 File Offset: 0x000381E4
	[ContextMenu("Set 'To' to current value")]
	public override void SetEndToCurrentValue()
	{
		this.to = this.value;
	}

	// Token: 0x060007F4 RID: 2036 RVA: 0x00039FF4 File Offset: 0x000381F4
	[ContextMenu("Assume value of 'From'")]
	private void SetCurrentValueToStart()
	{
		this.value = this.from;
	}

	// Token: 0x060007F5 RID: 2037 RVA: 0x0003A004 File Offset: 0x00038204
	[ContextMenu("Assume value of 'To'")]
	private void SetCurrentValueToEnd()
	{
		this.value = this.to;
	}

	// Token: 0x04000757 RID: 1879
	public Vector3 from;

	// Token: 0x04000758 RID: 1880
	public Vector3 to;

	// Token: 0x04000759 RID: 1881
	[HideInInspector]
	public bool worldSpace;

	// Token: 0x0400075A RID: 1882
	private Transform mTrans;

	// Token: 0x0400075B RID: 1883
	private UIRect mRect;
}
