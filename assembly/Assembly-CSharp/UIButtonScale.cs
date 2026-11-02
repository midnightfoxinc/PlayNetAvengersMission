using System;
using UnityEngine;

// Token: 0x0200009C RID: 156
[AddComponentMenu("NGUI/Interaction/Button Scale")]
public class UIButtonScale : MonoBehaviour
{
	// Token: 0x060003BC RID: 956 RVA: 0x000188CC File Offset: 0x00016ACC
	private void Start()
	{
		if (!this.mStarted)
		{
			this.mStarted = true;
			if (this.tweenTarget == null)
			{
				this.tweenTarget = base.transform;
			}
			this.mScale = this.tweenTarget.localScale;
		}
	}

	// Token: 0x060003BD RID: 957 RVA: 0x0001891C File Offset: 0x00016B1C
	private void OnEnable()
	{
		if (this.mStarted)
		{
			this.OnHover(UICamera.IsHighlighted(base.gameObject));
		}
	}

	// Token: 0x060003BE RID: 958 RVA: 0x0001893C File Offset: 0x00016B3C
	private void OnDisable()
	{
		if (this.mStarted && this.tweenTarget != null)
		{
			TweenScale component = this.tweenTarget.GetComponent<TweenScale>();
			if (component != null)
			{
				component.value = this.mScale;
				component.enabled = false;
			}
		}
	}

	// Token: 0x060003BF RID: 959 RVA: 0x00018990 File Offset: 0x00016B90
	private void OnPress(bool isPressed)
	{
		if (base.enabled)
		{
			if (!this.mStarted)
			{
				this.Start();
			}
			TweenScale.Begin(this.tweenTarget.gameObject, this.duration, (!isPressed) ? ((!UICamera.IsHighlighted(base.gameObject)) ? this.mScale : Vector3.Scale(this.mScale, this.hover)) : Vector3.Scale(this.mScale, this.pressed)).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003C0 RID: 960 RVA: 0x00018A20 File Offset: 0x00016C20
	private void OnHover(bool isOver)
	{
		if (base.enabled)
		{
			if (!this.mStarted)
			{
				this.Start();
			}
			TweenScale.Begin(this.tweenTarget.gameObject, this.duration, (!isOver) ? this.mScale : Vector3.Scale(this.mScale, this.hover)).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003C1 RID: 961 RVA: 0x00018A88 File Offset: 0x00016C88
	private void OnSelect(bool isSelected)
	{
		if (base.enabled && (!isSelected || UICamera.currentScheme == UICamera.ControlScheme.Controller))
		{
			this.OnHover(isSelected);
		}
	}

	// Token: 0x040003FA RID: 1018
	public Transform tweenTarget;

	// Token: 0x040003FB RID: 1019
	public Vector3 hover = new Vector3(1.1f, 1.1f, 1.1f);

	// Token: 0x040003FC RID: 1020
	public Vector3 pressed = new Vector3(1.05f, 1.05f, 1.05f);

	// Token: 0x040003FD RID: 1021
	public float duration = 0.2f;

	// Token: 0x040003FE RID: 1022
	private Vector3 mScale;

	// Token: 0x040003FF RID: 1023
	private bool mStarted;
}
