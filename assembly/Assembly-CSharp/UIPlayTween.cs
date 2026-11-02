using System;
using System.Collections.Generic;
using AnimationOrTween;
using UnityEngine;

// Token: 0x020000B7 RID: 183
[AddComponentMenu("NGUI/Interaction/Play Tween")]
[ExecuteInEditMode]
public class UIPlayTween : MonoBehaviour
{
	// Token: 0x06000480 RID: 1152 RVA: 0x0001D4CC File Offset: 0x0001B6CC
	private void Awake()
	{
		if (this.eventReceiver != null && EventDelegate.IsValid(this.onFinished))
		{
			this.eventReceiver = null;
			this.callWhenFinished = null;
		}
	}

	// Token: 0x06000481 RID: 1153 RVA: 0x0001D500 File Offset: 0x0001B700
	private void Start()
	{
		this.mStarted = true;
		if (this.tweenTarget == null)
		{
			this.tweenTarget = base.gameObject;
		}
	}

	// Token: 0x06000482 RID: 1154 RVA: 0x0001D534 File Offset: 0x0001B734
	private void OnEnable()
	{
		if (this.mStarted)
		{
			this.OnHover(UICamera.IsHighlighted(base.gameObject));
		}
		if (UICamera.currentTouch != null)
		{
			if (this.trigger == Trigger.OnPress || this.trigger == Trigger.OnPressTrue)
			{
				this.mActivated = (UICamera.currentTouch.pressed == base.gameObject);
			}
			if (this.trigger == Trigger.OnHover || this.trigger == Trigger.OnHoverTrue)
			{
				this.mActivated = (UICamera.currentTouch.current == base.gameObject);
			}
		}
		UIToggle component = base.GetComponent<UIToggle>();
		if (component != null)
		{
			EventDelegate.Add(component.onChange, new EventDelegate.Callback(this.OnToggle));
		}
	}

	// Token: 0x06000483 RID: 1155 RVA: 0x0001D5F8 File Offset: 0x0001B7F8
	private void OnDisable()
	{
		UIToggle component = base.GetComponent<UIToggle>();
		if (component != null)
		{
			EventDelegate.Remove(component.onChange, new EventDelegate.Callback(this.OnToggle));
		}
	}

	// Token: 0x06000484 RID: 1156 RVA: 0x0001D630 File Offset: 0x0001B830
	private void OnDragOver()
	{
		if (this.trigger == Trigger.OnHover)
		{
			this.OnHover(true);
		}
	}

	// Token: 0x06000485 RID: 1157 RVA: 0x0001D648 File Offset: 0x0001B848
	private void OnHover(bool isOver)
	{
		if (base.enabled && (this.trigger == Trigger.OnHover || (this.trigger == Trigger.OnHoverTrue && isOver) || (this.trigger == Trigger.OnHoverFalse && !isOver)))
		{
			this.mActivated = (isOver && this.trigger == Trigger.OnHover);
			this.Play(isOver);
		}
	}

	// Token: 0x06000486 RID: 1158 RVA: 0x0001D6B0 File Offset: 0x0001B8B0
	private void OnDragOut()
	{
		if (base.enabled && this.mActivated)
		{
			this.mActivated = false;
			this.Play(false);
		}
	}

	// Token: 0x06000487 RID: 1159 RVA: 0x0001D6E4 File Offset: 0x0001B8E4
	private void OnPress(bool isPressed)
	{
		if (base.enabled && (this.trigger == Trigger.OnPress || (this.trigger == Trigger.OnPressTrue && isPressed) || (this.trigger == Trigger.OnPressFalse && !isPressed)))
		{
			this.mActivated = (isPressed && this.trigger == Trigger.OnPress);
			this.Play(isPressed);
		}
	}

	// Token: 0x06000488 RID: 1160 RVA: 0x0001D74C File Offset: 0x0001B94C
	private void OnClick()
	{
		if (base.enabled && this.trigger == Trigger.OnClick)
		{
			this.Play(true);
		}
	}

	// Token: 0x06000489 RID: 1161 RVA: 0x0001D76C File Offset: 0x0001B96C
	private void OnDoubleClick()
	{
		if (base.enabled && this.trigger == Trigger.OnDoubleClick)
		{
			this.Play(true);
		}
	}

	// Token: 0x0600048A RID: 1162 RVA: 0x0001D790 File Offset: 0x0001B990
	private void OnSelect(bool isSelected)
	{
		if (base.enabled && (this.trigger == Trigger.OnSelect || (this.trigger == Trigger.OnSelectTrue && isSelected) || (this.trigger == Trigger.OnSelectFalse && !isSelected)))
		{
			this.mActivated = (isSelected && this.trigger == Trigger.OnSelect);
			this.Play(isSelected);
		}
	}

	// Token: 0x0600048B RID: 1163 RVA: 0x0001D7FC File Offset: 0x0001B9FC
	private void OnToggle()
	{
		if (!base.enabled || UIToggle.current == null)
		{
			return;
		}
		if (this.trigger == Trigger.OnActivate || (this.trigger == Trigger.OnActivateTrue && UIToggle.current.value) || (this.trigger == Trigger.OnActivateFalse && !UIToggle.current.value))
		{
			this.Play(UIToggle.current.value);
		}
	}

	// Token: 0x0600048C RID: 1164 RVA: 0x0001D878 File Offset: 0x0001BA78
	private void Update()
	{
		if (this.disableWhenFinished != DisableCondition.DoNotDisable && this.mTweens != null)
		{
			bool flag = true;
			bool flag2 = true;
			int i = 0;
			int num = this.mTweens.Length;
			while (i < num)
			{
				UITweener uitweener = this.mTweens[i];
				if (uitweener.tweenGroup == this.tweenGroup)
				{
					if (uitweener.enabled)
					{
						flag = false;
						break;
					}
					if (uitweener.direction != (Direction)this.disableWhenFinished)
					{
						flag2 = false;
					}
				}
				i++;
			}
			if (flag)
			{
				if (flag2)
				{
					NGUITools.SetActive(this.tweenTarget, false);
				}
				this.mTweens = null;
			}
		}
	}

	// Token: 0x0600048D RID: 1165 RVA: 0x0001D924 File Offset: 0x0001BB24
	public void Play(bool forward)
	{
		this.mActive = 0;
		GameObject gameObject = (!(this.tweenTarget == null)) ? this.tweenTarget : base.gameObject;
		if (!NGUITools.GetActive(gameObject))
		{
			if (this.ifDisabledOnPlay != EnableCondition.EnableThenPlay)
			{
				return;
			}
			NGUITools.SetActive(gameObject, true);
		}
		this.mTweens = ((!this.includeChildren) ? gameObject.GetComponents<UITweener>() : gameObject.GetComponentsInChildren<UITweener>());
		if (this.mTweens.Length == 0)
		{
			if (this.disableWhenFinished != DisableCondition.DoNotDisable)
			{
				NGUITools.SetActive(this.tweenTarget, false);
			}
		}
		else
		{
			bool flag = false;
			if (this.playDirection == Direction.Reverse)
			{
				forward = !forward;
			}
			int i = 0;
			int num = this.mTweens.Length;
			while (i < num)
			{
				UITweener uitweener = this.mTweens[i];
				if (uitweener.tweenGroup == this.tweenGroup)
				{
					if (!flag && !NGUITools.GetActive(gameObject))
					{
						flag = true;
						NGUITools.SetActive(gameObject, true);
					}
					this.mActive++;
					if (this.playDirection == Direction.Toggle)
					{
						EventDelegate.Add(uitweener.onFinished, new EventDelegate.Callback(this.OnFinished), true);
						uitweener.Toggle();
					}
					else
					{
						if (this.resetOnPlay || (this.resetIfDisabled && !uitweener.enabled))
						{
							uitweener.Play(forward);
							uitweener.ResetToBeginning();
						}
						EventDelegate.Add(uitweener.onFinished, new EventDelegate.Callback(this.OnFinished), true);
						uitweener.Play(forward);
					}
				}
				i++;
			}
		}
	}

	// Token: 0x0600048E RID: 1166 RVA: 0x0001DABC File Offset: 0x0001BCBC
	private void OnFinished()
	{
		if (--this.mActive == 0 && UIPlayTween.current == null)
		{
			UIPlayTween.current = this;
			EventDelegate.Execute(this.onFinished);
			if (this.eventReceiver != null && !string.IsNullOrEmpty(this.callWhenFinished))
			{
				this.eventReceiver.SendMessage(this.callWhenFinished, 1);
			}
			this.eventReceiver = null;
			UIPlayTween.current = null;
		}
	}

	// Token: 0x040004CD RID: 1229
	public static UIPlayTween current;

	// Token: 0x040004CE RID: 1230
	public GameObject tweenTarget;

	// Token: 0x040004CF RID: 1231
	public int tweenGroup;

	// Token: 0x040004D0 RID: 1232
	public Trigger trigger;

	// Token: 0x040004D1 RID: 1233
	public Direction playDirection = Direction.Forward;

	// Token: 0x040004D2 RID: 1234
	public bool resetOnPlay;

	// Token: 0x040004D3 RID: 1235
	public bool resetIfDisabled;

	// Token: 0x040004D4 RID: 1236
	public EnableCondition ifDisabledOnPlay;

	// Token: 0x040004D5 RID: 1237
	public DisableCondition disableWhenFinished;

	// Token: 0x040004D6 RID: 1238
	public bool includeChildren;

	// Token: 0x040004D7 RID: 1239
	public List<EventDelegate> onFinished = new List<EventDelegate>();

	// Token: 0x040004D8 RID: 1240
	[SerializeField]
	[HideInInspector]
	private GameObject eventReceiver;

	// Token: 0x040004D9 RID: 1241
	[HideInInspector]
	[SerializeField]
	private string callWhenFinished;

	// Token: 0x040004DA RID: 1242
	private UITweener[] mTweens;

	// Token: 0x040004DB RID: 1243
	private bool mStarted;

	// Token: 0x040004DC RID: 1244
	private int mActive;

	// Token: 0x040004DD RID: 1245
	private bool mActivated;
}
