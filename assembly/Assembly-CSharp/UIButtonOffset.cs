using System;
using UnityEngine;

// Token: 0x0200009A RID: 154
[AddComponentMenu("NGUI/Interaction/Button Offset")]
public class UIButtonOffset : MonoBehaviour
{
	// Token: 0x060003AC RID: 940 RVA: 0x000183FC File Offset: 0x000165FC
	private void Start()
	{
		if (!this.mStarted)
		{
			this.mStarted = true;
			if (this.tweenTarget == null)
			{
				this.tweenTarget = base.transform;
			}
			this.mPos = this.tweenTarget.localPosition;
		}
	}

	// Token: 0x060003AD RID: 941 RVA: 0x0001844C File Offset: 0x0001664C
	private void OnEnable()
	{
		if (this.mStarted)
		{
			this.OnHover(UICamera.IsHighlighted(base.gameObject));
		}
	}

	// Token: 0x060003AE RID: 942 RVA: 0x0001846C File Offset: 0x0001666C
	private void OnDisable()
	{
		if (this.mStarted && this.tweenTarget != null)
		{
			TweenPosition component = this.tweenTarget.GetComponent<TweenPosition>();
			if (component != null)
			{
				component.value = this.mPos;
				component.enabled = false;
			}
		}
	}

	// Token: 0x060003AF RID: 943 RVA: 0x000184C0 File Offset: 0x000166C0
	private void OnPress(bool isPressed)
	{
		this.mPressed = isPressed;
		if (base.enabled)
		{
			if (!this.mStarted)
			{
				this.Start();
			}
			TweenPosition.Begin(this.tweenTarget.gameObject, this.duration, (!isPressed) ? ((!UICamera.IsHighlighted(base.gameObject)) ? this.mPos : (this.mPos + this.hover)) : (this.mPos + this.pressed)).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003B0 RID: 944 RVA: 0x00018554 File Offset: 0x00016754
	private void OnHover(bool isOver)
	{
		if (base.enabled)
		{
			if (!this.mStarted)
			{
				this.Start();
			}
			TweenPosition.Begin(this.tweenTarget.gameObject, this.duration, (!isOver) ? this.mPos : (this.mPos + this.hover)).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003B1 RID: 945 RVA: 0x000185BC File Offset: 0x000167BC
	private void OnDragOver()
	{
		if (this.mPressed)
		{
			TweenPosition.Begin(this.tweenTarget.gameObject, this.duration, this.mPos + this.hover).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003B2 RID: 946 RVA: 0x00018604 File Offset: 0x00016804
	private void OnDragOut()
	{
		if (this.mPressed)
		{
			TweenPosition.Begin(this.tweenTarget.gameObject, this.duration, this.mPos).method = UITweener.Method.EaseInOut;
		}
	}

	// Token: 0x060003B3 RID: 947 RVA: 0x00018634 File Offset: 0x00016834
	private void OnSelect(bool isSelected)
	{
		if (base.enabled && (!isSelected || UICamera.currentScheme == UICamera.ControlScheme.Controller))
		{
			this.OnHover(isSelected);
		}
	}

	// Token: 0x040003ED RID: 1005
	public Transform tweenTarget;

	// Token: 0x040003EE RID: 1006
	public Vector3 hover = Vector3.zero;

	// Token: 0x040003EF RID: 1007
	public Vector3 pressed = new Vector3(2f, -2f);

	// Token: 0x040003F0 RID: 1008
	public float duration = 0.2f;

	// Token: 0x040003F1 RID: 1009
	[NonSerialized]
	private Vector3 mPos;

	// Token: 0x040003F2 RID: 1010
	[NonSerialized]
	private bool mStarted;

	// Token: 0x040003F3 RID: 1011
	[NonSerialized]
	private bool mPressed;
}
