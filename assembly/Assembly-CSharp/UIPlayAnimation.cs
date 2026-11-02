using System;
using System.Collections.Generic;
using AnimationOrTween;
using UnityEngine;

// Token: 0x020000B4 RID: 180
[ExecuteInEditMode]
[AddComponentMenu("NGUI/Interaction/Play Animation")]
public class UIPlayAnimation : MonoBehaviour
{
	// Token: 0x17000036 RID: 54
	// (get) Token: 0x06000463 RID: 1123 RVA: 0x0001CB84 File Offset: 0x0001AD84
	private bool dualState
	{
		get
		{
			return this.trigger == Trigger.OnPress || this.trigger == Trigger.OnHover;
		}
	}

	// Token: 0x06000464 RID: 1124 RVA: 0x0001CBA0 File Offset: 0x0001ADA0
	private void Awake()
	{
		UIButton component = base.GetComponent<UIButton>();
		if (component != null)
		{
			this.dragHighlight = component.dragHighlight;
		}
		if (this.eventReceiver != null && EventDelegate.IsValid(this.onFinished))
		{
			this.eventReceiver = null;
			this.callWhenFinished = null;
		}
	}

	// Token: 0x06000465 RID: 1125 RVA: 0x0001CBFC File Offset: 0x0001ADFC
	private void Start()
	{
		this.mStarted = true;
		if (this.target == null && this.animator == null)
		{
			this.animator = base.GetComponentInChildren<Animator>();
		}
		if (this.animator != null)
		{
			if (this.animator.enabled)
			{
				this.animator.enabled = false;
			}
			return;
		}
		if (this.target == null)
		{
			this.target = base.GetComponentInChildren<Animation>();
		}
		if (this.target != null && this.target.enabled)
		{
			this.target.enabled = false;
		}
	}

	// Token: 0x06000466 RID: 1126 RVA: 0x0001CCB8 File Offset: 0x0001AEB8
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

	// Token: 0x06000467 RID: 1127 RVA: 0x0001CD7C File Offset: 0x0001AF7C
	private void OnDisable()
	{
		UIToggle component = base.GetComponent<UIToggle>();
		if (component != null)
		{
			EventDelegate.Remove(component.onChange, new EventDelegate.Callback(this.OnToggle));
		}
	}

	// Token: 0x06000468 RID: 1128 RVA: 0x0001CDB4 File Offset: 0x0001AFB4
	private void OnHover(bool isOver)
	{
		if (!base.enabled)
		{
			return;
		}
		if (this.trigger == Trigger.OnHover || (this.trigger == Trigger.OnHoverTrue && isOver) || (this.trigger == Trigger.OnHoverFalse && !isOver))
		{
			this.Play(isOver, this.dualState);
		}
	}

	// Token: 0x06000469 RID: 1129 RVA: 0x0001CE0C File Offset: 0x0001B00C
	private void OnPress(bool isPressed)
	{
		if (!base.enabled)
		{
			return;
		}
		if (UICamera.currentTouchID == -2 || UICamera.currentTouchID == -3)
		{
			return;
		}
		if (this.trigger == Trigger.OnPress || (this.trigger == Trigger.OnPressTrue && isPressed) || (this.trigger == Trigger.OnPressFalse && !isPressed))
		{
			this.Play(isPressed, this.dualState);
		}
	}

	// Token: 0x0600046A RID: 1130 RVA: 0x0001CE7C File Offset: 0x0001B07C
	private void OnClick()
	{
		if (UICamera.currentTouchID == -2 || UICamera.currentTouchID == -3)
		{
			return;
		}
		if (base.enabled && this.trigger == Trigger.OnClick)
		{
			this.Play(true, false);
		}
	}

	// Token: 0x0600046B RID: 1131 RVA: 0x0001CEB8 File Offset: 0x0001B0B8
	private void OnDoubleClick()
	{
		if (UICamera.currentTouchID == -2 || UICamera.currentTouchID == -3)
		{
			return;
		}
		if (base.enabled && this.trigger == Trigger.OnDoubleClick)
		{
			this.Play(true, false);
		}
	}

	// Token: 0x0600046C RID: 1132 RVA: 0x0001CEF4 File Offset: 0x0001B0F4
	private void OnSelect(bool isSelected)
	{
		if (!base.enabled)
		{
			return;
		}
		if (this.trigger == Trigger.OnSelect || (this.trigger == Trigger.OnSelectTrue && isSelected) || (this.trigger == Trigger.OnSelectFalse && !isSelected))
		{
			this.Play(isSelected, this.dualState);
		}
	}

	// Token: 0x0600046D RID: 1133 RVA: 0x0001CF50 File Offset: 0x0001B150
	private void OnToggle()
	{
		if (!base.enabled || UIToggle.current == null)
		{
			return;
		}
		if (this.trigger == Trigger.OnActivate || (this.trigger == Trigger.OnActivateTrue && UIToggle.current.value) || (this.trigger == Trigger.OnActivateFalse && !UIToggle.current.value))
		{
			this.Play(UIToggle.current.value, this.dualState);
		}
	}

	// Token: 0x0600046E RID: 1134 RVA: 0x0001CFD4 File Offset: 0x0001B1D4
	private void OnDragOver()
	{
		if (base.enabled && this.dualState)
		{
			if (UICamera.currentTouch.dragged == base.gameObject)
			{
				this.Play(true, true);
			}
			else if (this.dragHighlight && this.trigger == Trigger.OnPress)
			{
				this.Play(true, true);
			}
		}
	}

	// Token: 0x0600046F RID: 1135 RVA: 0x0001D040 File Offset: 0x0001B240
	private void OnDragOut()
	{
		if (base.enabled && this.dualState && UICamera.hoveredObject != base.gameObject)
		{
			this.Play(false, true);
		}
	}

	// Token: 0x06000470 RID: 1136 RVA: 0x0001D080 File Offset: 0x0001B280
	private void OnDrop(GameObject go)
	{
		if (base.enabled && this.trigger == Trigger.OnPress && UICamera.currentTouch.dragged != base.gameObject)
		{
			this.Play(false, true);
		}
	}

	// Token: 0x06000471 RID: 1137 RVA: 0x0001D0C8 File Offset: 0x0001B2C8
	public void Play(bool forward)
	{
		this.Play(forward, true);
	}

	// Token: 0x06000472 RID: 1138 RVA: 0x0001D0D4 File Offset: 0x0001B2D4
	public void Play(bool forward, bool onlyIfDifferent)
	{
		if (this.target || this.animator)
		{
			if (onlyIfDifferent)
			{
				if (this.mActivated == forward)
				{
					return;
				}
				this.mActivated = forward;
			}
			if (this.clearSelection && UICamera.selectedObject == base.gameObject)
			{
				UICamera.selectedObject = null;
			}
			int num = (int)(-(int)this.playDirection);
			Direction direction = (Direction)((!forward) ? num : ((int)this.playDirection));
			ActiveAnimation activeAnimation = (!this.target) ? ActiveAnimation.Play(this.animator, this.clipName, direction, this.ifDisabledOnPlay, this.disableWhenFinished) : ActiveAnimation.Play(this.target, this.clipName, direction, this.ifDisabledOnPlay, this.disableWhenFinished);
			if (activeAnimation != null)
			{
				if (this.resetOnPlay)
				{
					activeAnimation.Reset();
				}
				for (int i = 0; i < this.onFinished.Count; i++)
				{
					EventDelegate.Add(activeAnimation.onFinished, new EventDelegate.Callback(this.OnFinished), true);
				}
			}
		}
	}

	// Token: 0x06000473 RID: 1139 RVA: 0x0001D200 File Offset: 0x0001B400
	public void PlayForward()
	{
		this.Play(true);
	}

	// Token: 0x06000474 RID: 1140 RVA: 0x0001D20C File Offset: 0x0001B40C
	public void PlayReverse()
	{
		this.Play(false);
	}

	// Token: 0x06000475 RID: 1141 RVA: 0x0001D218 File Offset: 0x0001B418
	private void OnFinished()
	{
		if (UIPlayAnimation.current == null)
		{
			UIPlayAnimation.current = this;
			EventDelegate.Execute(this.onFinished);
			if (this.eventReceiver != null && !string.IsNullOrEmpty(this.callWhenFinished))
			{
				this.eventReceiver.SendMessage(this.callWhenFinished, 1);
			}
			this.eventReceiver = null;
			UIPlayAnimation.current = null;
		}
	}

	// Token: 0x040004AF RID: 1199
	public static UIPlayAnimation current;

	// Token: 0x040004B0 RID: 1200
	public Animation target;

	// Token: 0x040004B1 RID: 1201
	public Animator animator;

	// Token: 0x040004B2 RID: 1202
	public string clipName;

	// Token: 0x040004B3 RID: 1203
	public Trigger trigger;

	// Token: 0x040004B4 RID: 1204
	public Direction playDirection = Direction.Forward;

	// Token: 0x040004B5 RID: 1205
	public bool resetOnPlay;

	// Token: 0x040004B6 RID: 1206
	public bool clearSelection;

	// Token: 0x040004B7 RID: 1207
	public EnableCondition ifDisabledOnPlay;

	// Token: 0x040004B8 RID: 1208
	public DisableCondition disableWhenFinished;

	// Token: 0x040004B9 RID: 1209
	public List<EventDelegate> onFinished = new List<EventDelegate>();

	// Token: 0x040004BA RID: 1210
	[HideInInspector]
	[SerializeField]
	private GameObject eventReceiver;

	// Token: 0x040004BB RID: 1211
	[SerializeField]
	[HideInInspector]
	private string callWhenFinished;

	// Token: 0x040004BC RID: 1212
	private bool mStarted;

	// Token: 0x040004BD RID: 1213
	private bool mActivated;

	// Token: 0x040004BE RID: 1214
	private bool dragHighlight;
}
