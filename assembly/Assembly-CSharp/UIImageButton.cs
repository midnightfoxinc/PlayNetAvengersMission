using System;
using UnityEngine;

// Token: 0x020000AE RID: 174
[AddComponentMenu("NGUI/UI/Image Button")]
public class UIImageButton : MonoBehaviour
{
	// Token: 0x17000032 RID: 50
	// (get) Token: 0x0600043A RID: 1082 RVA: 0x0001BD00 File Offset: 0x00019F00
	// (set) Token: 0x0600043B RID: 1083 RVA: 0x0001BD30 File Offset: 0x00019F30
	public bool isEnabled
	{
		get
		{
			Collider component = base.gameObject.GetComponent<Collider>();
			return component && component.enabled;
		}
		set
		{
			Collider component = base.gameObject.GetComponent<Collider>();
			if (!component)
			{
				return;
			}
			if (component.enabled != value)
			{
				component.enabled = value;
				this.UpdateImage();
			}
		}
	}

	// Token: 0x0600043C RID: 1084 RVA: 0x0001BD70 File Offset: 0x00019F70
	private void OnEnable()
	{
		if (this.target == null)
		{
			this.target = base.GetComponentInChildren<UISprite>();
		}
		this.UpdateImage();
	}

	// Token: 0x0600043D RID: 1085 RVA: 0x0001BD98 File Offset: 0x00019F98
	private void OnValidate()
	{
		if (this.target != null)
		{
			if (string.IsNullOrEmpty(this.normalSprite))
			{
				this.normalSprite = this.target.spriteName;
			}
			if (string.IsNullOrEmpty(this.hoverSprite))
			{
				this.hoverSprite = this.target.spriteName;
			}
			if (string.IsNullOrEmpty(this.pressedSprite))
			{
				this.pressedSprite = this.target.spriteName;
			}
			if (string.IsNullOrEmpty(this.disabledSprite))
			{
				this.disabledSprite = this.target.spriteName;
			}
		}
	}

	// Token: 0x0600043E RID: 1086 RVA: 0x0001BE3C File Offset: 0x0001A03C
	private void UpdateImage()
	{
		if (this.target != null)
		{
			if (this.isEnabled)
			{
				this.SetSprite((!UICamera.IsHighlighted(base.gameObject)) ? this.normalSprite : this.hoverSprite);
			}
			else
			{
				this.SetSprite(this.disabledSprite);
			}
		}
	}

	// Token: 0x0600043F RID: 1087 RVA: 0x0001BEA0 File Offset: 0x0001A0A0
	private void OnHover(bool isOver)
	{
		if (this.isEnabled && this.target != null)
		{
			this.SetSprite((!isOver) ? this.normalSprite : this.hoverSprite);
		}
	}

	// Token: 0x06000440 RID: 1088 RVA: 0x0001BEDC File Offset: 0x0001A0DC
	private void OnPress(bool pressed)
	{
		if (pressed)
		{
			this.SetSprite(this.pressedSprite);
		}
		else
		{
			this.UpdateImage();
		}
	}

	// Token: 0x06000441 RID: 1089 RVA: 0x0001BEFC File Offset: 0x0001A0FC
	private void SetSprite(string sprite)
	{
		if (this.target.atlas == null || this.target.atlas.GetSprite(sprite) == null)
		{
			return;
		}
		this.target.spriteName = sprite;
		if (this.pixelSnap)
		{
			this.target.MakePixelPerfect();
		}
	}

	// Token: 0x04000488 RID: 1160
	public UISprite target;

	// Token: 0x04000489 RID: 1161
	public string normalSprite;

	// Token: 0x0400048A RID: 1162
	public string hoverSprite;

	// Token: 0x0400048B RID: 1163
	public string pressedSprite;

	// Token: 0x0400048C RID: 1164
	public string disabledSprite;

	// Token: 0x0400048D RID: 1165
	public bool pixelSnap = true;
}
