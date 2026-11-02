using System;
using System.Collections;
using UnityEngine;

// Token: 0x020001B0 RID: 432
public class ButtonBouncer : MonoBehaviour
{
	// Token: 0x06000CD7 RID: 3287 RVA: 0x0005D410 File Offset: 0x0005B610
	private void Awake()
	{
		if (!this.Button)
		{
			globals.debugError(string.Format("No button found for ButtonBounce on {0}!", base.gameObject.name));
			base.enabled = false;
			return;
		}
		if (!this.ButtonTween)
		{
			globals.debugError(string.Format("No tween found for ButtonBounce on {0}!", base.gameObject.name));
			base.enabled = false;
			return;
		}
		this.Sprite = this.ButtonTween.gameObject.GetComponent<UISprite>();
	}

	// Token: 0x06000CD8 RID: 3288 RVA: 0x0005D498 File Offset: 0x0005B698
	private void OnEnable()
	{
		if (!this.ButtonTween)
		{
			return;
		}
		if (this.ButtonGrowsOnEntry)
		{
			if (!this.ButtonDownPlaysForward)
			{
				this.ButtonTween.ResetToBeginning();
				this.ButtonTween.PlayForward();
			}
			else
			{
				this.ButtonTween.ResetToBeginning();
				this.ButtonTween.PlayReverse();
			}
		}
		else
		{
			TweenScale tweenScale = (TweenScale)this.ButtonTween;
			this.ButtonTween.gameObject.transform.localScale = ((!this.ButtonDownPlaysForward) ? tweenScale.to : tweenScale.from);
		}
		if (this.Sprite)
		{
			this.Sprite.MakePixelPerfect();
		}
	}

	// Token: 0x06000CD9 RID: 3289 RVA: 0x0005D55C File Offset: 0x0005B75C
	private void Update()
	{
		if (this.Button && this.Button.hit)
		{
			this.ButtonPressed();
		}
		else if (this.Button && this.Button.released)
		{
			this.ButtonReleased();
		}
	}

	// Token: 0x06000CDA RID: 3290 RVA: 0x0005D5BC File Offset: 0x0005B7BC
	private void ButtonPressed()
	{
		if (!this.TweeningDown)
		{
			base.StartCoroutine(this.TweenDown());
		}
	}

	// Token: 0x06000CDB RID: 3291 RVA: 0x0005D5D8 File Offset: 0x0005B7D8
	private void ButtonReleased()
	{
		if (!this.TweeningUp)
		{
			base.StartCoroutine(this.TweenUp());
		}
	}

	// Token: 0x06000CDC RID: 3292 RVA: 0x0005D5F4 File Offset: 0x0005B7F4
	private IEnumerator TweenDown()
	{
		this.TweeningDown = true;
		this.TweeningUp = false;
		if (this.ButtonDownPlaysForward)
		{
			this.ButtonTween.PlayForward();
		}
		else
		{
			this.ButtonTween.PlayReverse();
		}
		while (this.TweeningDown && this.ButtonTween.enabled)
		{
			yield return null;
		}
		if (this.TweeningDown && this.Button.released)
		{
			this.ButtonReleased();
		}
		this.TweeningDown = false;
		base.StartCoroutine(this.SafetyShutoff());
		yield return null;
		yield break;
	}

	// Token: 0x06000CDD RID: 3293 RVA: 0x0005D610 File Offset: 0x0005B810
	private IEnumerator TweenUp()
	{
		this.TweeningUp = true;
		this.TweeningDown = false;
		if (this.ButtonDownPlaysForward)
		{
			this.ButtonTween.PlayReverse();
		}
		else
		{
			this.ButtonTween.PlayForward();
		}
		while (this.TweeningUp && this.ButtonTween.enabled)
		{
			yield return null;
		}
		this.TweeningUp = false;
		yield return null;
		yield break;
	}

	// Token: 0x06000CDE RID: 3294 RVA: 0x0005D62C File Offset: 0x0005B82C
	private IEnumerator SafetyShutoff()
	{
		while (!this.TweeningDown || !this.TweeningUp)
		{
			if (!this.Button.pressed)
			{
				this.ButtonReleased();
				break;
			}
			yield return null;
		}
		yield break;
	}

	// Token: 0x06000CDF RID: 3295 RVA: 0x0005D648 File Offset: 0x0005B848
	public bool IsTweening()
	{
		return this.TweeningUp || this.TweeningDown;
	}

	// Token: 0x04000CD8 RID: 3288
	public UITweener ButtonTween;

	// Token: 0x04000CD9 RID: 3289
	public ButtonCoreBehavior Button;

	// Token: 0x04000CDA RID: 3290
	public bool ButtonDownPlaysForward;

	// Token: 0x04000CDB RID: 3291
	public bool ButtonGrowsOnEntry = true;

	// Token: 0x04000CDC RID: 3292
	private bool TweeningDown;

	// Token: 0x04000CDD RID: 3293
	private bool TweeningUp;

	// Token: 0x04000CDE RID: 3294
	private UISprite Sprite;
}
