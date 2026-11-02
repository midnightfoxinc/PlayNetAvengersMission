using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000093 RID: 147
[AddComponentMenu("NGUI/Interaction/Button")]
public class UIButton : UIButtonColor
{
	// Token: 0x17000027 RID: 39
	// (get) Token: 0x0600037C RID: 892 RVA: 0x00017424 File Offset: 0x00015624
	// (set) Token: 0x0600037D RID: 893 RVA: 0x00017480 File Offset: 0x00015680
	public override bool isEnabled
	{
		get
		{
			if (!base.enabled)
			{
				return false;
			}
			Collider component = base.gameObject.GetComponent<Collider>();
			if (component && component.enabled)
			{
				return true;
			}
			Collider2D component2 = base.GetComponent<Collider2D>();
			return component2 && component2.enabled;
		}
		set
		{
			if (this.isEnabled != value)
			{
				Collider component = base.gameObject.GetComponent<Collider>();
				if (component != null)
				{
					component.enabled = value;
					UIButton[] components = base.GetComponents<UIButton>();
					foreach (UIButton uibutton in components)
					{
						uibutton.SetState((!value) ? UIButtonColor.State.Disabled : UIButtonColor.State.Normal, false);
					}
				}
				else
				{
					Collider2D component2 = base.GetComponent<Collider2D>();
					if (component2 != null)
					{
						component2.enabled = value;
						UIButton[] components2 = base.GetComponents<UIButton>();
						foreach (UIButton uibutton2 in components2)
						{
							uibutton2.SetState((!value) ? UIButtonColor.State.Disabled : UIButtonColor.State.Normal, false);
						}
					}
					else
					{
						base.enabled = value;
					}
				}
			}
		}
	}

	// Token: 0x17000028 RID: 40
	// (get) Token: 0x0600037E RID: 894 RVA: 0x00017564 File Offset: 0x00015764
	// (set) Token: 0x0600037F RID: 895 RVA: 0x00017580 File Offset: 0x00015780
	public string normalSprite
	{
		get
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			return this.mNormalSprite;
		}
		set
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			if (this.mSprite != null && !string.IsNullOrEmpty(this.mNormalSprite) && this.mNormalSprite == this.mSprite.spriteName)
			{
				this.mNormalSprite = value;
				this.SetSprite(value);
				NGUITools.SetDirty(this.mSprite);
			}
			else
			{
				this.mNormalSprite = value;
				if (this.mState == UIButtonColor.State.Normal)
				{
					this.SetSprite(value);
				}
			}
		}
	}

	// Token: 0x17000029 RID: 41
	// (get) Token: 0x06000380 RID: 896 RVA: 0x00017614 File Offset: 0x00015814
	// (set) Token: 0x06000381 RID: 897 RVA: 0x00017630 File Offset: 0x00015830
	public Sprite normalSprite2D
	{
		get
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			return this.mNormalSprite2D;
		}
		set
		{
			if (!this.mInitDone)
			{
				this.OnInit();
			}
			if (this.mSprite2D != null && this.mNormalSprite2D == this.mSprite2D.sprite2D)
			{
				this.mNormalSprite2D = value;
				this.SetSprite(value);
				NGUITools.SetDirty(this.mSprite);
			}
			else
			{
				this.mNormalSprite2D = value;
				if (this.mState == UIButtonColor.State.Normal)
				{
					this.SetSprite(value);
				}
			}
		}
	}

	// Token: 0x06000382 RID: 898 RVA: 0x000176B4 File Offset: 0x000158B4
	protected override void OnInit()
	{
		base.OnInit();
		this.mSprite = (this.mWidget as UISprite);
		this.mSprite2D = (this.mWidget as UI2DSprite);
		if (this.mSprite != null)
		{
			this.mNormalSprite = this.mSprite.spriteName;
		}
		if (this.mSprite2D != null)
		{
			this.mNormalSprite2D = this.mSprite2D.sprite2D;
		}
	}

	// Token: 0x06000383 RID: 899 RVA: 0x00017730 File Offset: 0x00015930
	protected override void OnEnable()
	{
		if (this.isEnabled)
		{
			if (this.mInitDone)
			{
				this.OnHover(UICamera.hoveredObject == base.gameObject);
			}
		}
		else
		{
			this.SetState(UIButtonColor.State.Disabled, true);
		}
	}

	// Token: 0x06000384 RID: 900 RVA: 0x00017778 File Offset: 0x00015978
	protected override void OnDragOver()
	{
		if (this.isEnabled && (this.dragHighlight || UICamera.currentTouch.pressed == base.gameObject))
		{
			base.OnDragOver();
		}
	}

	// Token: 0x06000385 RID: 901 RVA: 0x000177BC File Offset: 0x000159BC
	protected override void OnDragOut()
	{
		if (this.isEnabled && (this.dragHighlight || UICamera.currentTouch.pressed == base.gameObject))
		{
			base.OnDragOut();
		}
	}

	// Token: 0x06000386 RID: 902 RVA: 0x00017800 File Offset: 0x00015A00
	protected virtual void OnClick()
	{
		if (UIButton.current == null && this.isEnabled && UICamera.currentTouchID != -2 && UICamera.currentTouchID != -3)
		{
			UIButton.current = this;
			EventDelegate.Execute(this.onClick);
			UIButton.current = null;
		}
	}

	// Token: 0x06000387 RID: 903 RVA: 0x00017858 File Offset: 0x00015A58
	public override void SetState(UIButtonColor.State state, bool immediate)
	{
		base.SetState(state, immediate);
		if (this.mSprite != null)
		{
			switch (state)
			{
			case UIButtonColor.State.Normal:
				this.SetSprite(this.mNormalSprite);
				break;
			case UIButtonColor.State.Hover:
				this.SetSprite((!string.IsNullOrEmpty(this.hoverSprite)) ? this.hoverSprite : this.mNormalSprite);
				break;
			case UIButtonColor.State.Pressed:
				this.SetSprite(this.pressedSprite);
				break;
			case UIButtonColor.State.Disabled:
				this.SetSprite(this.disabledSprite);
				break;
			}
		}
		else if (this.mSprite2D != null)
		{
			switch (state)
			{
			case UIButtonColor.State.Normal:
				this.SetSprite(this.mNormalSprite2D);
				break;
			case UIButtonColor.State.Hover:
				this.SetSprite((!(this.hoverSprite2D == null)) ? this.hoverSprite2D : this.mNormalSprite2D);
				break;
			case UIButtonColor.State.Pressed:
				this.SetSprite(this.pressedSprite2D);
				break;
			case UIButtonColor.State.Disabled:
				this.SetSprite(this.disabledSprite2D);
				break;
			}
		}
	}

	// Token: 0x06000388 RID: 904 RVA: 0x00017990 File Offset: 0x00015B90
	protected void SetSprite(string sp)
	{
		if (this.mSprite != null && !string.IsNullOrEmpty(sp) && this.mSprite.spriteName != sp)
		{
			this.mSprite.spriteName = sp;
			if (this.pixelSnap)
			{
				this.mSprite.MakePixelPerfect();
			}
		}
	}

	// Token: 0x06000389 RID: 905 RVA: 0x000179F4 File Offset: 0x00015BF4
	protected void SetSprite(Sprite sp)
	{
		if (sp != null && this.mSprite2D != null && this.mSprite2D.sprite2D != sp)
		{
			this.mSprite2D.sprite2D = sp;
			if (this.pixelSnap)
			{
				this.mSprite2D.MakePixelPerfect();
			}
		}
	}

	// Token: 0x040003BD RID: 957
	public static UIButton current;

	// Token: 0x040003BE RID: 958
	public bool dragHighlight;

	// Token: 0x040003BF RID: 959
	public string hoverSprite;

	// Token: 0x040003C0 RID: 960
	public string pressedSprite;

	// Token: 0x040003C1 RID: 961
	public string disabledSprite;

	// Token: 0x040003C2 RID: 962
	public Sprite hoverSprite2D;

	// Token: 0x040003C3 RID: 963
	public Sprite pressedSprite2D;

	// Token: 0x040003C4 RID: 964
	public Sprite disabledSprite2D;

	// Token: 0x040003C5 RID: 965
	public bool pixelSnap;

	// Token: 0x040003C6 RID: 966
	public List<EventDelegate> onClick = new List<EventDelegate>();

	// Token: 0x040003C7 RID: 967
	[NonSerialized]
	private UISprite mSprite;

	// Token: 0x040003C8 RID: 968
	[NonSerialized]
	private UI2DSprite mSprite2D;

	// Token: 0x040003C9 RID: 969
	[NonSerialized]
	private string mNormalSprite;

	// Token: 0x040003CA RID: 970
	[NonSerialized]
	private Sprite mNormalSprite2D;
}
