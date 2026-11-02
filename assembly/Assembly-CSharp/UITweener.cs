using System;
using System.Collections.Generic;
using AnimationOrTween;
using UnityEngine;

// Token: 0x0200010A RID: 266
public abstract class UITweener : MonoBehaviour
{
	// Token: 0x170000EA RID: 234
	// (get) Token: 0x06000829 RID: 2089 RVA: 0x0003A950 File Offset: 0x00038B50
	public float amountPerDelta
	{
		get
		{
			if (this.duration == 0f)
			{
				return 1000f;
			}
			if (this.mDuration != this.duration)
			{
				this.mDuration = this.duration;
				this.mAmountPerDelta = Mathf.Abs(1f / this.duration) * Mathf.Sign(this.mAmountPerDelta);
			}
			return this.mAmountPerDelta;
		}
	}

	// Token: 0x170000EB RID: 235
	// (get) Token: 0x0600082A RID: 2090 RVA: 0x0003A9BC File Offset: 0x00038BBC
	// (set) Token: 0x0600082B RID: 2091 RVA: 0x0003A9C4 File Offset: 0x00038BC4
	public float tweenFactor
	{
		get
		{
			return this.mFactor;
		}
		set
		{
			this.mFactor = Mathf.Clamp01(value);
		}
	}

	// Token: 0x170000EC RID: 236
	// (get) Token: 0x0600082C RID: 2092 RVA: 0x0003A9D4 File Offset: 0x00038BD4
	public Direction direction
	{
		get
		{
			return (this.amountPerDelta >= 0f) ? Direction.Forward : Direction.Reverse;
		}
	}

	// Token: 0x0600082D RID: 2093 RVA: 0x0003A9F0 File Offset: 0x00038BF0
	private void Reset()
	{
		if (!this.mStarted)
		{
			this.SetStartToCurrentValue();
			this.SetEndToCurrentValue();
		}
	}

	// Token: 0x0600082E RID: 2094 RVA: 0x0003AA0C File Offset: 0x00038C0C
	protected virtual void Start()
	{
		this.Update();
	}

	// Token: 0x0600082F RID: 2095 RVA: 0x0003AA14 File Offset: 0x00038C14
	private void Update()
	{
		float num = (!this.ignoreTimeScale) ? Time.deltaTime : RealTime.deltaTime;
		float num2 = (!this.ignoreTimeScale) ? Time.time : RealTime.time;
		if (!this.mStarted)
		{
			num = 0f;
			this.mStarted = true;
			this.mStartTime = num2 + this.delay;
		}
		if (num2 < this.mStartTime)
		{
			return;
		}
		this.mFactor += ((this.duration != 0f) ? (this.amountPerDelta * num) : 1f);
		if (this.style == UITweener.Style.Loop)
		{
			if (this.mFactor > 1f)
			{
				this.mFactor -= Mathf.Floor(this.mFactor);
			}
		}
		else if (this.style == UITweener.Style.PingPong)
		{
			if (this.mFactor > 1f)
			{
				this.mFactor = 1f - (this.mFactor - Mathf.Floor(this.mFactor));
				this.mAmountPerDelta = -this.mAmountPerDelta;
			}
			else if (this.mFactor < 0f)
			{
				this.mFactor = -this.mFactor;
				this.mFactor -= Mathf.Floor(this.mFactor);
				this.mAmountPerDelta = -this.mAmountPerDelta;
			}
		}
		if (this.style == UITweener.Style.Once && (this.duration == 0f || this.mFactor > 1f || this.mFactor < 0f))
		{
			this.mFactor = Mathf.Clamp01(this.mFactor);
			this.Sample(this.mFactor, true);
			base.enabled = false;
			if (UITweener.current != this)
			{
				UITweener uitweener = UITweener.current;
				UITweener.current = this;
				if (this.onFinished != null)
				{
					this.mTemp = this.onFinished;
					this.onFinished = new List<EventDelegate>();
					EventDelegate.Execute(this.mTemp);
					for (int i = 0; i < this.mTemp.Count; i++)
					{
						EventDelegate eventDelegate = this.mTemp[i];
						if (eventDelegate != null && !eventDelegate.oneShot)
						{
							EventDelegate.Add(this.onFinished, eventDelegate, eventDelegate.oneShot);
						}
					}
					this.mTemp = null;
				}
				if (this.eventReceiver != null && !string.IsNullOrEmpty(this.callWhenFinished))
				{
					this.eventReceiver.SendMessage(this.callWhenFinished, this, 1);
				}
				UITweener.current = uitweener;
			}
		}
		else
		{
			this.Sample(this.mFactor, false);
		}
	}

	// Token: 0x06000830 RID: 2096 RVA: 0x0003ACD0 File Offset: 0x00038ED0
	public void SetOnFinished(EventDelegate.Callback del)
	{
		EventDelegate.Set(this.onFinished, del);
	}

	// Token: 0x06000831 RID: 2097 RVA: 0x0003ACE0 File Offset: 0x00038EE0
	public void SetOnFinished(EventDelegate del)
	{
		EventDelegate.Set(this.onFinished, del);
	}

	// Token: 0x06000832 RID: 2098 RVA: 0x0003ACF0 File Offset: 0x00038EF0
	public void AddOnFinished(EventDelegate.Callback del)
	{
		EventDelegate.Add(this.onFinished, del);
	}

	// Token: 0x06000833 RID: 2099 RVA: 0x0003AD00 File Offset: 0x00038F00
	public void AddOnFinished(EventDelegate del)
	{
		EventDelegate.Add(this.onFinished, del);
	}

	// Token: 0x06000834 RID: 2100 RVA: 0x0003AD10 File Offset: 0x00038F10
	public void RemoveOnFinished(EventDelegate del)
	{
		if (this.onFinished != null)
		{
			this.onFinished.Remove(del);
		}
		if (this.mTemp != null)
		{
			this.mTemp.Remove(del);
		}
	}

	// Token: 0x06000835 RID: 2101 RVA: 0x0003AD50 File Offset: 0x00038F50
	private void OnDisable()
	{
		this.mStarted = false;
	}

	// Token: 0x06000836 RID: 2102 RVA: 0x0003AD5C File Offset: 0x00038F5C
	public void Sample(float factor, bool isFinished)
	{
		float num = Mathf.Clamp01(factor);
		if (this.method == UITweener.Method.EaseIn)
		{
			num = 1f - Mathf.Sin(1.5707964f * (1f - num));
			if (this.steeperCurves)
			{
				num *= num;
			}
		}
		else if (this.method == UITweener.Method.EaseOut)
		{
			num = Mathf.Sin(1.5707964f * num);
			if (this.steeperCurves)
			{
				num = 1f - num;
				num = 1f - num * num;
			}
		}
		else if (this.method == UITweener.Method.EaseInOut)
		{
			num -= Mathf.Sin(num * 6.2831855f) / 6.2831855f;
			if (this.steeperCurves)
			{
				num = num * 2f - 1f;
				float num2 = Mathf.Sign(num);
				num = 1f - Mathf.Abs(num);
				num = 1f - num * num;
				num = num2 * num * 0.5f + 0.5f;
			}
		}
		else if (this.method == UITweener.Method.BounceIn)
		{
			num = this.BounceLogic(num);
		}
		else if (this.method == UITweener.Method.BounceOut)
		{
			num = 1f - this.BounceLogic(1f - num);
		}
		this.OnUpdate((this.animationCurve == null) ? num : this.animationCurve.Evaluate(num), isFinished);
	}

	// Token: 0x06000837 RID: 2103 RVA: 0x0003AEB0 File Offset: 0x000390B0
	private float BounceLogic(float val)
	{
		if (val < 0.363636f)
		{
			val = 7.5685f * val * val;
		}
		else if (val < 0.727272f)
		{
			val = 7.5625f * (val -= 0.545454f) * val + 0.75f;
		}
		else if (val < 0.90909f)
		{
			val = 7.5625f * (val -= 0.818181f) * val + 0.9375f;
		}
		else
		{
			val = 7.5625f * (val -= 0.9545454f) * val + 0.984375f;
		}
		return val;
	}

	// Token: 0x06000838 RID: 2104 RVA: 0x0003AF48 File Offset: 0x00039148
	[Obsolete("Use PlayForward() instead")]
	public void Play()
	{
		this.Play(true);
	}

	// Token: 0x06000839 RID: 2105 RVA: 0x0003AF54 File Offset: 0x00039154
	public void PlayForward()
	{
		this.Play(true);
	}

	// Token: 0x0600083A RID: 2106 RVA: 0x0003AF60 File Offset: 0x00039160
	public void PlayReverse()
	{
		this.Play(false);
	}

	// Token: 0x0600083B RID: 2107 RVA: 0x0003AF6C File Offset: 0x0003916C
	public void Play(bool forward)
	{
		this.mAmountPerDelta = Mathf.Abs(this.amountPerDelta);
		if (!forward)
		{
			this.mAmountPerDelta = -this.mAmountPerDelta;
		}
		base.enabled = true;
		this.Update();
	}

	// Token: 0x0600083C RID: 2108 RVA: 0x0003AFA0 File Offset: 0x000391A0
	public void ResetToBeginning()
	{
		this.mStarted = false;
		this.mFactor = ((this.amountPerDelta >= 0f) ? 0f : 1f);
		this.Sample(this.mFactor, false);
	}

	// Token: 0x0600083D RID: 2109 RVA: 0x0003AFDC File Offset: 0x000391DC
	public void Toggle()
	{
		if (this.mFactor > 0f)
		{
			this.mAmountPerDelta = -this.amountPerDelta;
		}
		else
		{
			this.mAmountPerDelta = Mathf.Abs(this.amountPerDelta);
		}
		base.enabled = true;
	}

	// Token: 0x0600083E RID: 2110
	protected abstract void OnUpdate(float factor, bool isFinished);

	// Token: 0x0600083F RID: 2111 RVA: 0x0003B024 File Offset: 0x00039224
	public static T Begin<T>(GameObject go, float duration) where T : UITweener
	{
		T t = go.GetComponent<T>();
		if (t != null && t.tweenGroup != 0)
		{
			t = (T)((object)null);
			T[] components = go.GetComponents<T>();
			int i = 0;
			int num = components.Length;
			while (i < num)
			{
				t = components[i];
				if (t != null && t.tweenGroup == 0)
				{
					break;
				}
				t = (T)((object)null);
				i++;
			}
		}
		if (t == null)
		{
			t = go.AddComponent<T>();
			if (t == null)
			{
				Debug.LogError(string.Concat(new object[]
				{
					"Unable to add ",
					typeof(T),
					" to ",
					NGUITools.GetHierarchy(go)
				}), go);
				return (T)((object)null);
			}
		}
		t.mStarted = false;
		t.duration = duration;
		t.mFactor = 0f;
		t.mAmountPerDelta = Mathf.Abs(t.amountPerDelta);
		t.style = UITweener.Style.Once;
		t.animationCurve = new AnimationCurve(new Keyframe[]
		{
			new Keyframe(0f, 0f, 0f, 1f),
			new Keyframe(1f, 1f, 1f, 0f)
		});
		t.eventReceiver = null;
		t.callWhenFinished = null;
		t.enabled = true;
		return t;
	}

	// Token: 0x06000840 RID: 2112 RVA: 0x0003B1F4 File Offset: 0x000393F4
	public virtual void SetStartToCurrentValue()
	{
	}

	// Token: 0x06000841 RID: 2113 RVA: 0x0003B1F8 File Offset: 0x000393F8
	public virtual void SetEndToCurrentValue()
	{
	}

	// Token: 0x04000774 RID: 1908
	public static UITweener current;

	// Token: 0x04000775 RID: 1909
	[HideInInspector]
	public UITweener.Method method;

	// Token: 0x04000776 RID: 1910
	[HideInInspector]
	public UITweener.Style style;

	// Token: 0x04000777 RID: 1911
	[HideInInspector]
	public AnimationCurve animationCurve = new AnimationCurve(new Keyframe[]
	{
		new Keyframe(0f, 0f, 0f, 1f),
		new Keyframe(1f, 1f, 1f, 0f)
	});

	// Token: 0x04000778 RID: 1912
	[HideInInspector]
	public bool ignoreTimeScale = true;

	// Token: 0x04000779 RID: 1913
	[HideInInspector]
	public float delay;

	// Token: 0x0400077A RID: 1914
	[HideInInspector]
	public float duration = 1f;

	// Token: 0x0400077B RID: 1915
	[HideInInspector]
	public bool steeperCurves;

	// Token: 0x0400077C RID: 1916
	[HideInInspector]
	public int tweenGroup;

	// Token: 0x0400077D RID: 1917
	[HideInInspector]
	public List<EventDelegate> onFinished = new List<EventDelegate>();

	// Token: 0x0400077E RID: 1918
	[HideInInspector]
	public GameObject eventReceiver;

	// Token: 0x0400077F RID: 1919
	[HideInInspector]
	public string callWhenFinished;

	// Token: 0x04000780 RID: 1920
	private bool mStarted;

	// Token: 0x04000781 RID: 1921
	private float mStartTime;

	// Token: 0x04000782 RID: 1922
	private float mDuration;

	// Token: 0x04000783 RID: 1923
	private float mAmountPerDelta = 1000f;

	// Token: 0x04000784 RID: 1924
	private float mFactor;

	// Token: 0x04000785 RID: 1925
	private List<EventDelegate> mTemp;

	// Token: 0x0200010B RID: 267
	public enum Method
	{
		// Token: 0x04000787 RID: 1927
		Linear,
		// Token: 0x04000788 RID: 1928
		EaseIn,
		// Token: 0x04000789 RID: 1929
		EaseOut,
		// Token: 0x0400078A RID: 1930
		EaseInOut,
		// Token: 0x0400078B RID: 1931
		BounceIn,
		// Token: 0x0400078C RID: 1932
		BounceOut
	}

	// Token: 0x0200010C RID: 268
	public enum Style
	{
		// Token: 0x0400078E RID: 1934
		Once,
		// Token: 0x0400078F RID: 1935
		Loop,
		// Token: 0x04000790 RID: 1936
		PingPong
	}
}
