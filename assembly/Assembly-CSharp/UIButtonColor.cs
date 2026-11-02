using System;
using UnityEngine;

// Token: 0x02000095 RID: 149
[AddComponentMenu("NGUI/Interaction/Button Color")]
[ExecuteInEditMode]
public class UIButtonColor : UIWidgetContainer
{
	// Token: 0x1700002A RID: 42
	// (get) Token: 0x0600038D RID: 909 RVA: 0x00017B00 File Offset: 0x00015D00
	// (set) Token: 0x0600038E RID: 910 RVA: 0x00017B08 File Offset: 0x00015D08
	public UIButtonColor.State state
	{
		get
		{
			return this.mState;
		}
		set
		{
			this.SetState(value, false);
		}
	}

	// Token: 0x1700002B RID: 43
	// (get) Token: 0x0600038F RID: 911 RVA: 0x00017B14 File Offset: 0x00015D14
	// (set) Token: 0x06000390 RID: 912 RVA: 0x00017B30 File Offset: 0x00015D30
	public Color defaultColor
	{
		get
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			return this.mDefaultColor;
		}
		set
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			this.mDefaultColor = value;
			UIButtonColor.State state = this.mState;
			this.mState = UIButtonColor.State.Disabled;
			this.SetState(state, false);
		}
	}

	// Token: 0x1700002C RID: 44
	// (get) Token: 0x06000391 RID: 913 RVA: 0x00017B6C File Offset: 0x00015D6C
	// (set) Token: 0x06000392 RID: 914 RVA: 0x00017B74 File Offset: 0x00015D74
	public virtual bool isEnabled
	{
		get
		{
			return base.enabled;
		}
		set
		{
			base.enabled = value;
		}
	}

	// Token: 0x06000393 RID: 915 RVA: 0x00017B80 File Offset: 0x00015D80
	public void ResetDefaultColor()
	{
		this.defaultColor = this.mStartingColor;
	}

	// Token: 0x06000394 RID: 916 RVA: 0x00017B90 File Offset: 0x00015D90
	public void CacheDefaultColor()
	{
		if (!this.mInitDone)
		{
			this.OnInit();
		}
	}

	// Token: 0x06000395 RID: 917 RVA: 0x00017BA4 File Offset: 0x00015DA4
	private void Start()
	{
		if (!this.mInitDone)
		{
			this.OnInit();
		}
		if (!this.isEnabled)
		{
			this.SetState(UIButtonColor.State.Disabled, true);
		}
	}

	// Token: 0x06000396 RID: 918 RVA: 0x00017BD8 File Offset: 0x00015DD8
	protected virtual void OnInit()
	{
		this.mInitDone = true;
		if (this.tweenTarget == null && !Application.isPlaying)
		{
			this.tweenTarget = base.gameObject;
		}
		if (this.tweenTarget != null)
		{
			this.mWidget = this.tweenTarget.GetComponent<UIWidget>();
		}
		if (this.mWidget != null)
		{
			this.mDefaultColor = this.mWidget.color;
			this.mStartingColor = this.mDefaultColor;
		}
		else if (this.tweenTarget != null)
		{
			Renderer component = this.tweenTarget.GetComponent<Renderer>();
			if (component != null)
			{
				this.mDefaultColor = ((!Application.isPlaying) ? component.sharedMaterial.color : component.material.color);
				this.mStartingColor = this.mDefaultColor;
			}
			else
			{
				Light component2 = this.tweenTarget.GetComponent<Light>();
				if (component2 != null)
				{
					this.mDefaultColor = component2.color;
					this.mStartingColor = this.mDefaultColor;
				}
				else
				{
					this.tweenTarget = null;
					this.mInitDone = false;
				}
			}
		}
	}

	// Token: 0x06000397 RID: 919 RVA: 0x00017D10 File Offset: 0x00015F10
	protected virtual void OnEnable()
	{
		if (this.mInitDone)
		{
			this.OnHover(UICamera.IsHighlighted(base.gameObject));
		}
		if (UICamera.currentTouch != null)
		{
			if (UICamera.currentTouch.pressed == base.gameObject)
			{
				this.OnPress(true);
			}
			else if (UICamera.currentTouch.current == base.gameObject)
			{
				this.OnHover(true);
			}
		}
	}

	// Token: 0x06000398 RID: 920 RVA: 0x00017D8C File Offset: 0x00015F8C
	protected virtual void OnDisable()
	{
		if (this.mInitDone && this.mState != UIButtonColor.State.Normal)
		{
			this.SetState(UIButtonColor.State.Normal, true);
			if (this.tweenTarget != null)
			{
				TweenColor component = this.tweenTarget.GetComponent<TweenColor>();
				if (component != null)
				{
					component.value = this.mDefaultColor;
					component.enabled = false;
				}
			}
		}
	}

	// Token: 0x06000399 RID: 921 RVA: 0x00017DF4 File Offset: 0x00015FF4
	protected virtual void OnHover(bool isOver)
	{
		if (this.isEnabled)
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			if (this.tweenTarget != null)
			{
				this.SetState((!isOver) ? UIButtonColor.State.Normal : UIButtonColor.State.Hover, false);
			}
		}
	}

	// Token: 0x0600039A RID: 922 RVA: 0x00017E44 File Offset: 0x00016044
	protected virtual void OnPress(bool isPressed)
	{
		if (this.isEnabled && UICamera.currentTouch != null)
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			if (this.tweenTarget != null)
			{
				if (isPressed)
				{
					this.SetState(UIButtonColor.State.Pressed, false);
				}
				else if (UICamera.currentTouch.current == base.gameObject)
				{
					if (UICamera.currentScheme == UICamera.ControlScheme.Controller)
					{
						this.SetState(UIButtonColor.State.Hover, false);
					}
					else if (UICamera.currentScheme == UICamera.ControlScheme.Mouse && UICamera.hoveredObject == base.gameObject)
					{
						this.SetState(UIButtonColor.State.Hover, false);
					}
					else
					{
						this.SetState(UIButtonColor.State.Normal, false);
					}
				}
				else
				{
					this.SetState(UIButtonColor.State.Normal, false);
				}
			}
		}
	}

	// Token: 0x0600039B RID: 923 RVA: 0x00017F10 File Offset: 0x00016110
	protected virtual void OnDragOver()
	{
		if (this.isEnabled)
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			if (this.tweenTarget != null)
			{
				this.SetState(UIButtonColor.State.Pressed, false);
			}
		}
	}

	// Token: 0x0600039C RID: 924 RVA: 0x00017F54 File Offset: 0x00016154
	protected virtual void OnDragOut()
	{
		if (this.isEnabled)
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			if (this.tweenTarget != null)
			{
				this.SetState(UIButtonColor.State.Normal, false);
			}
		}
	}

	// Token: 0x0600039D RID: 925 RVA: 0x00017F98 File Offset: 0x00016198
	public virtual void SetState(UIButtonColor.State state, bool instant)
	{
		if (!this.mInitDone)
		{
			this.mInitDone = true;
			this.OnInit();
		}
		if (this.mState != state)
		{
			this.mState = state;
			this.UpdateColor(instant);
		}
	}

	// Token: 0x0600039E RID: 926 RVA: 0x00017FD8 File Offset: 0x000161D8
	public void UpdateColor(bool instant)
	{
		if (this.tweenTarget != null)
		{
			TweenColor tweenColor;
			switch (this.mState)
			{
			case UIButtonColor.State.Hover:
				tweenColor = TweenColor.Begin(this.tweenTarget, this.duration, this.hover);
				break;
			case UIButtonColor.State.Pressed:
				tweenColor = TweenColor.Begin(this.tweenTarget, this.duration, this.pressed);
				break;
			case UIButtonColor.State.Disabled:
				tweenColor = TweenColor.Begin(this.tweenTarget, this.duration, this.disabledColor);
				break;
			default:
				tweenColor = TweenColor.Begin(this.tweenTarget, this.duration, this.mDefaultColor);
				break;
			}
			if (instant && tweenColor != null)
			{
				tweenColor.value = tweenColor.to;
				tweenColor.enabled = false;
			}
		}
	}

	// Token: 0x040003CD RID: 973
	public GameObject tweenTarget;

	// Token: 0x040003CE RID: 974
	public Color hover = new Color(0.88235295f, 0.78431374f, 0.5882353f, 1f);

	// Token: 0x040003CF RID: 975
	public Color pressed = new Color(0.7176471f, 0.6392157f, 0.48235294f, 1f);

	// Token: 0x040003D0 RID: 976
	public Color disabledColor = Color.grey;

	// Token: 0x040003D1 RID: 977
	public float duration = 0.2f;

	// Token: 0x040003D2 RID: 978
	[NonSerialized]
	protected Color mStartingColor;

	// Token: 0x040003D3 RID: 979
	[NonSerialized]
	protected Color mDefaultColor;

	// Token: 0x040003D4 RID: 980
	[NonSerialized]
	protected bool mInitDone;

	// Token: 0x040003D5 RID: 981
	[NonSerialized]
	protected UIWidget mWidget;

	// Token: 0x040003D6 RID: 982
	[NonSerialized]
	protected UIButtonColor.State mState;

	// Token: 0x02000096 RID: 150
	public enum State
	{
		// Token: 0x040003D8 RID: 984
		Normal,
		// Token: 0x040003D9 RID: 985
		Hover,
		// Token: 0x040003DA RID: 986
		Pressed,
		// Token: 0x040003DB RID: 987
		Disabled
	}
}
