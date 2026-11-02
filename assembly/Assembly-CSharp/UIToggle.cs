using System;
using System.Collections.Generic;
using AnimationOrTween;
using UnityEngine;

// Token: 0x020000CB RID: 203
[ExecuteInEditMode]
[AddComponentMenu("NGUI/Interaction/Toggle")]
public class UIToggle : UIWidgetContainer
{
	// Token: 0x1700005B RID: 91
	// (get) Token: 0x0600052C RID: 1324 RVA: 0x0002316C File Offset: 0x0002136C
	// (set) Token: 0x0600052D RID: 1325 RVA: 0x0002318C File Offset: 0x0002138C
	public bool value
	{
		get
		{
			return (!this.mStarted) ? this.startsActive : this.mIsActive;
		}
		set
		{
			if (!this.mStarted)
			{
				this.startsActive = value;
			}
			else if (this.group == 0 || value || this.optionCanBeNone || !this.mStarted)
			{
				this.Set(value, true);
			}
		}
	}

	// Token: 0x1700005C RID: 92
	// (get) Token: 0x0600052E RID: 1326 RVA: 0x000231E0 File Offset: 0x000213E0
	public bool isColliderEnabled
	{
		get
		{
			Collider component = base.GetComponent<Collider>();
			if (component != null)
			{
				return component.enabled;
			}
			Collider2D component2 = base.GetComponent<Collider2D>();
			return component2 != null && component2.enabled;
		}
	}

	// Token: 0x1700005D RID: 93
	// (get) Token: 0x0600052F RID: 1327 RVA: 0x00023224 File Offset: 0x00021424
	// (set) Token: 0x06000530 RID: 1328 RVA: 0x0002322C File Offset: 0x0002142C
	[Obsolete("Use 'value' instead")]
	public bool isChecked
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

	// Token: 0x06000531 RID: 1329 RVA: 0x00023238 File Offset: 0x00021438
	public static UIToggle GetActiveToggle(int group)
	{
		for (int i = 0; i < UIToggle.list.size; i++)
		{
			UIToggle uitoggle = UIToggle.list[i];
			if (uitoggle != null && uitoggle.group == group && uitoggle.mIsActive)
			{
				return uitoggle;
			}
		}
		return null;
	}

	// Token: 0x06000532 RID: 1330 RVA: 0x00023294 File Offset: 0x00021494
	private void OnEnable()
	{
		UIToggle.list.Add(this);
	}

	// Token: 0x06000533 RID: 1331 RVA: 0x000232A4 File Offset: 0x000214A4
	private void OnDisable()
	{
		UIToggle.list.Remove(this);
	}

	// Token: 0x06000534 RID: 1332 RVA: 0x000232B4 File Offset: 0x000214B4
	public void Start()
	{
		if (this.mStarted)
		{
			return;
		}
		if (this.startsChecked)
		{
			this.startsChecked = false;
			this.startsActive = true;
		}
		if (!Application.isPlaying)
		{
			if (this.checkSprite != null && this.activeSprite == null)
			{
				this.activeSprite = this.checkSprite;
				this.checkSprite = null;
			}
			if (this.checkAnimation != null && this.activeAnimation == null)
			{
				this.activeAnimation = this.checkAnimation;
				this.checkAnimation = null;
			}
			if (Application.isPlaying && this.activeSprite != null)
			{
				this.activeSprite.alpha = ((!this.invertSpriteState) ? ((!this.startsActive) ? 0f : 1f) : ((!this.startsActive) ? 1f : 0f));
			}
			if (EventDelegate.IsValid(this.onChange))
			{
				this.eventReceiver = null;
				this.functionName = null;
			}
		}
		else
		{
			this.mIsActive = !this.startsActive;
			this.mStarted = true;
			bool flag = this.instantTween;
			this.instantTween = true;
			this.Set(this.startsActive, true);
			this.instantTween = flag;
		}
	}

	// Token: 0x06000535 RID: 1333 RVA: 0x00023420 File Offset: 0x00021620
	private void OnClick()
	{
		if (base.enabled && this.isColliderEnabled && UICamera.currentTouchID != -2)
		{
			this.value = !this.value;
		}
	}

	// Token: 0x06000536 RID: 1334 RVA: 0x00023460 File Offset: 0x00021660
	public void Set(bool state, bool notify = true)
	{
		if (this.validator != null && !this.validator(state))
		{
			return;
		}
		if (!this.mStarted)
		{
			this.mIsActive = state;
			this.startsActive = state;
			if (this.activeSprite != null)
			{
				this.activeSprite.alpha = ((!this.invertSpriteState) ? ((!state) ? 0f : 1f) : ((!state) ? 1f : 0f));
			}
		}
		else if (this.mIsActive != state)
		{
			if (this.group != 0 && state)
			{
				int i = 0;
				int size = UIToggle.list.size;
				while (i < size)
				{
					UIToggle uitoggle = UIToggle.list[i];
					if (uitoggle != this && uitoggle.group == this.group)
					{
						uitoggle.Set(false, true);
					}
					if (UIToggle.list.size != size)
					{
						size = UIToggle.list.size;
						i = 0;
					}
					else
					{
						i++;
					}
				}
			}
			this.mIsActive = state;
			if (this.activeSprite != null)
			{
				if (this.instantTween || !NGUITools.GetActive(this))
				{
					this.activeSprite.alpha = ((!this.invertSpriteState) ? ((!this.mIsActive) ? 0f : 1f) : ((!this.mIsActive) ? 1f : 0f));
				}
				else
				{
					TweenAlpha.Begin(this.activeSprite.gameObject, 0.15f, (!this.invertSpriteState) ? ((!this.mIsActive) ? 0f : 1f) : ((!this.mIsActive) ? 1f : 0f));
				}
			}
			if (notify && UIToggle.current == null)
			{
				UIToggle uitoggle2 = UIToggle.current;
				UIToggle.current = this;
				if (EventDelegate.IsValid(this.onChange))
				{
					EventDelegate.Execute(this.onChange);
				}
				else if (this.eventReceiver != null && !string.IsNullOrEmpty(this.functionName))
				{
					this.eventReceiver.SendMessage(this.functionName, this.mIsActive, 1);
				}
				UIToggle.current = uitoggle2;
			}
			if (this.animator != null)
			{
				ActiveAnimation activeAnimation = ActiveAnimation.Play(this.animator, null, (!state) ? Direction.Reverse : Direction.Forward, EnableCondition.IgnoreDisabledState, DisableCondition.DoNotDisable);
				if (activeAnimation != null && (this.instantTween || !NGUITools.GetActive(this)))
				{
					activeAnimation.Finish();
				}
			}
			else if (this.activeAnimation != null)
			{
				ActiveAnimation activeAnimation2 = ActiveAnimation.Play(this.activeAnimation, null, (!state) ? Direction.Reverse : Direction.Forward, EnableCondition.IgnoreDisabledState, DisableCondition.DoNotDisable);
				if (activeAnimation2 != null && (this.instantTween || !NGUITools.GetActive(this)))
				{
					activeAnimation2.Finish();
				}
			}
			else if (this.tween != null)
			{
				bool active = NGUITools.GetActive(this);
				if (this.tween.tweenGroup != 0)
				{
					UITweener[] componentsInChildren = this.tween.GetComponentsInChildren<UITweener>(true);
					int j = 0;
					int num = componentsInChildren.Length;
					while (j < num)
					{
						UITweener uitweener = componentsInChildren[j];
						if (uitweener.tweenGroup == this.tween.tweenGroup)
						{
							uitweener.Play(state);
							if (this.instantTween || !active)
							{
								uitweener.tweenFactor = ((!state) ? 0f : 1f);
							}
						}
						j++;
					}
				}
				else
				{
					this.tween.Play(state);
					if (this.instantTween || !active)
					{
						this.tween.tweenFactor = ((!state) ? 0f : 1f);
					}
				}
			}
		}
	}

	// Token: 0x04000588 RID: 1416
	public static BetterList<UIToggle> list = new BetterList<UIToggle>();

	// Token: 0x04000589 RID: 1417
	public static UIToggle current;

	// Token: 0x0400058A RID: 1418
	public int group;

	// Token: 0x0400058B RID: 1419
	public UIWidget activeSprite;

	// Token: 0x0400058C RID: 1420
	public bool invertSpriteState;

	// Token: 0x0400058D RID: 1421
	public Animation activeAnimation;

	// Token: 0x0400058E RID: 1422
	public Animator animator;

	// Token: 0x0400058F RID: 1423
	public UITweener tween;

	// Token: 0x04000590 RID: 1424
	public bool startsActive;

	// Token: 0x04000591 RID: 1425
	public bool instantTween;

	// Token: 0x04000592 RID: 1426
	public bool optionCanBeNone;

	// Token: 0x04000593 RID: 1427
	public List<EventDelegate> onChange = new List<EventDelegate>();

	// Token: 0x04000594 RID: 1428
	public UIToggle.Validate validator;

	// Token: 0x04000595 RID: 1429
	[SerializeField]
	[HideInInspector]
	private UISprite checkSprite;

	// Token: 0x04000596 RID: 1430
	[HideInInspector]
	[SerializeField]
	private Animation checkAnimation;

	// Token: 0x04000597 RID: 1431
	[HideInInspector]
	[SerializeField]
	private GameObject eventReceiver;

	// Token: 0x04000598 RID: 1432
	[HideInInspector]
	[SerializeField]
	private string functionName = "OnActivate";

	// Token: 0x04000599 RID: 1433
	[SerializeField]
	[HideInInspector]
	private bool startsChecked;

	// Token: 0x0400059A RID: 1434
	private bool mIsActive = true;

	// Token: 0x0400059B RID: 1435
	private bool mStarted;

	// Token: 0x0200033B RID: 827
	// (Invoke) Token: 0x0600150E RID: 5390
	public delegate bool Validate(bool choice);
}
