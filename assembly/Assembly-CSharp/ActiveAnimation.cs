using System;
using System.Collections.Generic;
using AnimationOrTween;
using UnityEngine;

// Token: 0x020000D0 RID: 208
[AddComponentMenu("NGUI/Internal/Active Animation")]
public class ActiveAnimation : MonoBehaviour
{
	// Token: 0x1700005E RID: 94
	// (get) Token: 0x0600054A RID: 1354 RVA: 0x000243E4 File Offset: 0x000225E4
	private float playbackTime
	{
		get
		{
			return Mathf.Clamp01(this.mAnimator.GetCurrentAnimatorStateInfo(0).normalizedTime);
		}
	}

	// Token: 0x1700005F RID: 95
	// (get) Token: 0x0600054B RID: 1355 RVA: 0x0002440C File Offset: 0x0002260C
	public bool isPlaying
	{
		get
		{
			if (!(this.mAnim == null))
			{
				foreach (object obj in this.mAnim)
				{
					AnimationState animationState = (AnimationState)obj;
					if (this.mAnim.IsPlaying(animationState.name))
					{
						if (this.mLastDirection == Direction.Forward)
						{
							if (animationState.time < animationState.length)
							{
								return true;
							}
						}
						else
						{
							if (this.mLastDirection != Direction.Reverse)
							{
								return true;
							}
							if (animationState.time > 0f)
							{
								return true;
							}
						}
					}
				}
				return false;
			}
			if (this.mAnimator != null)
			{
				if (this.mLastDirection == Direction.Reverse)
				{
					if (this.playbackTime == 0f)
					{
						return false;
					}
				}
				else if (this.playbackTime == 1f)
				{
					return false;
				}
				return true;
			}
			return false;
		}
	}

	// Token: 0x0600054C RID: 1356 RVA: 0x00024548 File Offset: 0x00022748
	public void Finish()
	{
		if (this.mAnim != null)
		{
			foreach (object obj in this.mAnim)
			{
				AnimationState animationState = (AnimationState)obj;
				if (this.mLastDirection == Direction.Forward)
				{
					animationState.time = animationState.length;
				}
				else if (this.mLastDirection == Direction.Reverse)
				{
					animationState.time = 0f;
				}
			}
			this.mAnim.Sample();
		}
		else if (this.mAnimator != null)
		{
			this.mAnimator.Play(this.mClip, 0, (this.mLastDirection != Direction.Forward) ? 0f : 1f);
		}
	}

	// Token: 0x0600054D RID: 1357 RVA: 0x00024644 File Offset: 0x00022844
	public void Reset()
	{
		if (this.mAnim != null)
		{
			foreach (object obj in this.mAnim)
			{
				AnimationState animationState = (AnimationState)obj;
				if (this.mLastDirection == Direction.Reverse)
				{
					animationState.time = animationState.length;
				}
				else if (this.mLastDirection == Direction.Forward)
				{
					animationState.time = 0f;
				}
			}
		}
		else if (this.mAnimator != null)
		{
			this.mAnimator.Play(this.mClip, 0, (this.mLastDirection != Direction.Reverse) ? 0f : 1f);
		}
	}

	// Token: 0x0600054E RID: 1358 RVA: 0x00024734 File Offset: 0x00022934
	private void Start()
	{
		if (this.eventReceiver != null && EventDelegate.IsValid(this.onFinished))
		{
			this.eventReceiver = null;
			this.callWhenFinished = null;
		}
	}

	// Token: 0x0600054F RID: 1359 RVA: 0x00024768 File Offset: 0x00022968
	private void Update()
	{
		float deltaTime = RealTime.deltaTime;
		if (deltaTime == 0f)
		{
			return;
		}
		if (this.mAnimator != null)
		{
			this.mAnimator.Update((this.mLastDirection != Direction.Reverse) ? deltaTime : (-deltaTime));
			if (this.isPlaying)
			{
				return;
			}
			this.mAnimator.enabled = false;
			base.enabled = false;
		}
		else
		{
			if (!(this.mAnim != null))
			{
				base.enabled = false;
				return;
			}
			bool flag = false;
			foreach (object obj in this.mAnim)
			{
				AnimationState animationState = (AnimationState)obj;
				if (this.mAnim.IsPlaying(animationState.name))
				{
					float num = animationState.speed * deltaTime;
					animationState.time += num;
					if (num < 0f)
					{
						if (animationState.time > 0f)
						{
							flag = true;
						}
						else
						{
							animationState.time = 0f;
						}
					}
					else if (animationState.time < animationState.length)
					{
						flag = true;
					}
					else
					{
						animationState.time = animationState.length;
					}
				}
			}
			this.mAnim.Sample();
			if (flag)
			{
				return;
			}
			base.enabled = false;
		}
		if (this.mNotify)
		{
			this.mNotify = false;
			if (ActiveAnimation.current == null)
			{
				ActiveAnimation.current = this;
				EventDelegate.Execute(this.onFinished);
				if (this.eventReceiver != null && !string.IsNullOrEmpty(this.callWhenFinished))
				{
					this.eventReceiver.SendMessage(this.callWhenFinished, 1);
				}
				ActiveAnimation.current = null;
			}
			if (this.mDisableDirection != Direction.Toggle && this.mLastDirection == this.mDisableDirection)
			{
				NGUITools.SetActive(base.gameObject, false);
			}
		}
	}

	// Token: 0x06000550 RID: 1360 RVA: 0x00024994 File Offset: 0x00022B94
	private void Play(string clipName, Direction playDirection)
	{
		if (playDirection == Direction.Toggle)
		{
			playDirection = ((this.mLastDirection == Direction.Forward) ? Direction.Reverse : Direction.Forward);
		}
		if (this.mAnim != null)
		{
			base.enabled = true;
			this.mAnim.enabled = false;
			bool flag = string.IsNullOrEmpty(clipName);
			if (flag)
			{
				if (!this.mAnim.isPlaying)
				{
					this.mAnim.Play();
				}
			}
			else if (!this.mAnim.IsPlaying(clipName))
			{
				this.mAnim.Play(clipName);
			}
			foreach (object obj in this.mAnim)
			{
				AnimationState animationState = (AnimationState)obj;
				if (string.IsNullOrEmpty(clipName) || animationState.name == clipName)
				{
					float num = Mathf.Abs(animationState.speed);
					animationState.speed = num * (float)playDirection;
					if (playDirection == Direction.Reverse && animationState.time == 0f)
					{
						animationState.time = animationState.length;
					}
					else if (playDirection == Direction.Forward && animationState.time == animationState.length)
					{
						animationState.time = 0f;
					}
				}
			}
			this.mLastDirection = playDirection;
			this.mNotify = true;
			this.mAnim.Sample();
		}
		else if (this.mAnimator != null)
		{
			if (base.enabled && this.isPlaying && this.mClip == clipName)
			{
				this.mLastDirection = playDirection;
				return;
			}
			base.enabled = true;
			this.mNotify = true;
			this.mLastDirection = playDirection;
			this.mClip = clipName;
			this.mAnimator.Play(this.mClip, 0, (playDirection != Direction.Forward) ? 1f : 0f);
		}
	}

	// Token: 0x06000551 RID: 1361 RVA: 0x00024BAC File Offset: 0x00022DAC
	public static ActiveAnimation Play(Animation anim, string clipName, Direction playDirection, EnableCondition enableBeforePlay, DisableCondition disableCondition)
	{
		if (!NGUITools.GetActive(anim.gameObject))
		{
			if (enableBeforePlay != EnableCondition.EnableThenPlay)
			{
				return null;
			}
			NGUITools.SetActive(anim.gameObject, true);
			UIPanel[] componentsInChildren = anim.gameObject.GetComponentsInChildren<UIPanel>();
			int i = 0;
			int num = componentsInChildren.Length;
			while (i < num)
			{
				componentsInChildren[i].Refresh();
				i++;
			}
		}
		ActiveAnimation activeAnimation = anim.GetComponent<ActiveAnimation>();
		if (activeAnimation == null)
		{
			activeAnimation = anim.gameObject.AddComponent<ActiveAnimation>();
		}
		activeAnimation.mAnim = anim;
		activeAnimation.mDisableDirection = (Direction)disableCondition;
		activeAnimation.onFinished.Clear();
		activeAnimation.Play(clipName, playDirection);
		if (activeAnimation.mAnim != null)
		{
			activeAnimation.mAnim.Sample();
		}
		else if (activeAnimation.mAnimator != null)
		{
			activeAnimation.mAnimator.Update(0f);
		}
		return activeAnimation;
	}

	// Token: 0x06000552 RID: 1362 RVA: 0x00024C8C File Offset: 0x00022E8C
	public static ActiveAnimation Play(Animation anim, string clipName, Direction playDirection)
	{
		return ActiveAnimation.Play(anim, clipName, playDirection, EnableCondition.DoNothing, DisableCondition.DoNotDisable);
	}

	// Token: 0x06000553 RID: 1363 RVA: 0x00024C98 File Offset: 0x00022E98
	public static ActiveAnimation Play(Animation anim, Direction playDirection)
	{
		return ActiveAnimation.Play(anim, null, playDirection, EnableCondition.DoNothing, DisableCondition.DoNotDisable);
	}

	// Token: 0x06000554 RID: 1364 RVA: 0x00024CA4 File Offset: 0x00022EA4
	public static ActiveAnimation Play(Animator anim, string clipName, Direction playDirection, EnableCondition enableBeforePlay, DisableCondition disableCondition)
	{
		if (enableBeforePlay != EnableCondition.IgnoreDisabledState && !NGUITools.GetActive(anim.gameObject))
		{
			if (enableBeforePlay != EnableCondition.EnableThenPlay)
			{
				return null;
			}
			NGUITools.SetActive(anim.gameObject, true);
			UIPanel[] componentsInChildren = anim.gameObject.GetComponentsInChildren<UIPanel>();
			int i = 0;
			int num = componentsInChildren.Length;
			while (i < num)
			{
				componentsInChildren[i].Refresh();
				i++;
			}
		}
		ActiveAnimation activeAnimation = anim.GetComponent<ActiveAnimation>();
		if (activeAnimation == null)
		{
			activeAnimation = anim.gameObject.AddComponent<ActiveAnimation>();
		}
		activeAnimation.mAnimator = anim;
		activeAnimation.mDisableDirection = (Direction)disableCondition;
		activeAnimation.onFinished.Clear();
		activeAnimation.Play(clipName, playDirection);
		if (activeAnimation.mAnim != null)
		{
			activeAnimation.mAnim.Sample();
		}
		else if (activeAnimation.mAnimator != null)
		{
			activeAnimation.mAnimator.Update(0f);
		}
		return activeAnimation;
	}

	// Token: 0x040005B0 RID: 1456
	public static ActiveAnimation current;

	// Token: 0x040005B1 RID: 1457
	public List<EventDelegate> onFinished = new List<EventDelegate>();

	// Token: 0x040005B2 RID: 1458
	[HideInInspector]
	public GameObject eventReceiver;

	// Token: 0x040005B3 RID: 1459
	[HideInInspector]
	public string callWhenFinished;

	// Token: 0x040005B4 RID: 1460
	private Animation mAnim;

	// Token: 0x040005B5 RID: 1461
	private Direction mLastDirection;

	// Token: 0x040005B6 RID: 1462
	private Direction mDisableDirection;

	// Token: 0x040005B7 RID: 1463
	private bool mNotify;

	// Token: 0x040005B8 RID: 1464
	private Animator mAnimator;

	// Token: 0x040005B9 RID: 1465
	private string mClip = string.Empty;
}
