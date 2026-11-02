using System;
using UnityEngine;

// Token: 0x020000B5 RID: 181
[AddComponentMenu("NGUI/Interaction/Play Sound")]
public class UIPlaySound : MonoBehaviour
{
	// Token: 0x17000037 RID: 55
	// (get) Token: 0x06000477 RID: 1143 RVA: 0x0001D2A8 File Offset: 0x0001B4A8
	private bool canPlay
	{
		get
		{
			if (!base.enabled)
			{
				return false;
			}
			UIButton component = base.GetComponent<UIButton>();
			return component == null || component.isEnabled;
		}
	}

	// Token: 0x06000478 RID: 1144 RVA: 0x0001D2E0 File Offset: 0x0001B4E0
	private void OnEnable()
	{
		if (this.trigger == UIPlaySound.Trigger.OnEnable)
		{
			NGUITools.PlaySound(this.audioClip, this.volume, this.pitch);
		}
	}

	// Token: 0x06000479 RID: 1145 RVA: 0x0001D314 File Offset: 0x0001B514
	private void OnDisable()
	{
		if (this.trigger == UIPlaySound.Trigger.OnDisable)
		{
			NGUITools.PlaySound(this.audioClip, this.volume, this.pitch);
		}
	}

	// Token: 0x0600047A RID: 1146 RVA: 0x0001D348 File Offset: 0x0001B548
	private void OnHover(bool isOver)
	{
		if (this.trigger == UIPlaySound.Trigger.OnMouseOver)
		{
			if (this.mIsOver == isOver)
			{
				return;
			}
			this.mIsOver = isOver;
		}
		if (this.canPlay && ((isOver && this.trigger == UIPlaySound.Trigger.OnMouseOver) || (!isOver && this.trigger == UIPlaySound.Trigger.OnMouseOut)))
		{
			NGUITools.PlaySound(this.audioClip, this.volume, this.pitch);
		}
	}

	// Token: 0x0600047B RID: 1147 RVA: 0x0001D3BC File Offset: 0x0001B5BC
	private void OnPress(bool isPressed)
	{
		if (this.trigger == UIPlaySound.Trigger.OnPress)
		{
			if (this.mIsOver == isPressed)
			{
				return;
			}
			this.mIsOver = isPressed;
		}
		if (this.canPlay && ((isPressed && this.trigger == UIPlaySound.Trigger.OnPress) || (!isPressed && this.trigger == UIPlaySound.Trigger.OnRelease)))
		{
			NGUITools.PlaySound(this.audioClip, this.volume, this.pitch);
		}
	}

	// Token: 0x0600047C RID: 1148 RVA: 0x0001D430 File Offset: 0x0001B630
	private void OnClick()
	{
		if (this.canPlay && this.trigger == UIPlaySound.Trigger.OnClick)
		{
			NGUITools.PlaySound(this.audioClip, this.volume, this.pitch);
		}
	}

	// Token: 0x0600047D RID: 1149 RVA: 0x0001D46C File Offset: 0x0001B66C
	private void OnSelect(bool isSelected)
	{
		if (this.canPlay && (!isSelected || UICamera.currentScheme == UICamera.ControlScheme.Controller))
		{
			this.OnHover(isSelected);
		}
	}

	// Token: 0x0600047E RID: 1150 RVA: 0x0001D494 File Offset: 0x0001B694
	public void Play()
	{
		NGUITools.PlaySound(this.audioClip, this.volume, this.pitch);
	}

	// Token: 0x040004BF RID: 1215
	public AudioClip audioClip;

	// Token: 0x040004C0 RID: 1216
	public UIPlaySound.Trigger trigger;

	// Token: 0x040004C1 RID: 1217
	[Range(0f, 1f)]
	public float volume = 1f;

	// Token: 0x040004C2 RID: 1218
	[Range(0f, 2f)]
	public float pitch = 1f;

	// Token: 0x040004C3 RID: 1219
	private bool mIsOver;

	// Token: 0x020000B6 RID: 182
	public enum Trigger
	{
		// Token: 0x040004C5 RID: 1221
		OnClick,
		// Token: 0x040004C6 RID: 1222
		OnMouseOver,
		// Token: 0x040004C7 RID: 1223
		OnMouseOut,
		// Token: 0x040004C8 RID: 1224
		OnPress,
		// Token: 0x040004C9 RID: 1225
		OnRelease,
		// Token: 0x040004CA RID: 1226
		Custom,
		// Token: 0x040004CB RID: 1227
		OnEnable,
		// Token: 0x040004CC RID: 1228
		OnDisable
	}
}
