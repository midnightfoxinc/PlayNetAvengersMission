using System;
using UnityEngine;

// Token: 0x0200009B RID: 155
[AddComponentMenu("NGUI/Interaction/Button Rotation")]
public class UIButtonRotation : MonoBehaviour
{
	// Token: 0x060003B5 RID: 949 RVA: 0x00018688 File Offset: 0x00016888
	private void Start()
	{
		if (!this.mStarted)
		{
			this.mStarted = true;
			if (this.tweenTarget == null)
			{
				this.tweenTarget = base.transform;
			}
			this.mRot = this.tweenTarget.localRotation;
		}
	}

	// Token: 0x060003B6 RID: 950 RVA: 0x000186D8 File Offset: 0x000168D8
	private void OnEnable()
	{
		if (this.mStarted)
		{
			this.OnHover(UICamera.IsHighlighted(base.gameObject));
		}
	}

	// Token: 0x060003B7 RID: 951 RVA: 0x000186F8 File Offset: 0x000168F8
	private void OnDisable()
	{
		if (this.mStarted && this.tweenTarget != null)
		{
			TweenRotation component = this.tweenTarget.GetComponent<TweenRotation>();
			if (component != null)
			{
				component.value = this.mRot;
				component.enabled = false;
			}
		}
	}

	// Token: 0x060003B8 RID: 952 RVA: 0x0001874C File Offset: 0x0001694C
	private void OnPress(bool isPressed)
	{
		if (base.enabled)
		{
			if (!this.mStarted)
			{
				this.Start();
			}
			TweenRotation.Begin(this.tweenTarget.gameObject, this.duration, (!isPressed) ? ((!UICamera.IsHighlighted(base.gameObject)) ? this.mRot : (this.mRot * Quaternion.Euler(this.hover))) : (this.mRot * Quaternion.Euler(this.pressed))).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003B9 RID: 953 RVA: 0x000187E4 File Offset: 0x000169E4
	private void OnHover(bool isOver)
	{
		if (base.enabled)
		{
			if (!this.mStarted)
			{
				this.Start();
			}
			TweenRotation.Begin(this.tweenTarget.gameObject, this.duration, (!isOver) ? this.mRot : (this.mRot * Quaternion.Euler(this.hover))).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003BA RID: 954 RVA: 0x00018850 File Offset: 0x00016A50
	private void OnSelect(bool isSelected)
	{
		if (base.enabled && (!isSelected || UICamera.currentScheme == UICamera.ControlScheme.Controller))
		{
			this.OnHover(isSelected);
		}
	}

	// Token: 0x040003F4 RID: 1012
	public Transform tweenTarget;

	// Token: 0x040003F5 RID: 1013
	public Vector3 hover = Vector3.zero;

	// Token: 0x040003F6 RID: 1014
	public Vector3 pressed = Vector3.zero;

	// Token: 0x040003F7 RID: 1015
	public float duration = 0.2f;

	// Token: 0x040003F8 RID: 1016
	private Quaternion mRot;

	// Token: 0x040003F9 RID: 1017
	private bool mStarted;
}
