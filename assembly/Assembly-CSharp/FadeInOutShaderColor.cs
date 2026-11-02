using System;
using UnityEngine;

// Token: 0x0200014A RID: 330
public class FadeInOutShaderColor : MonoBehaviour
{
	// Token: 0x06000AC9 RID: 2761 RVA: 0x0004EFA4 File Offset: 0x0004D1A4
	private void GetEffectSettingsComponent(Transform tr)
	{
		Transform parent = tr.parent;
		if (parent != null)
		{
			this.effectSettings = parent.GetComponentInChildren<EffectSettings>();
			if (this.effectSettings == null)
			{
				this.GetEffectSettingsComponent(parent.transform);
			}
		}
	}

	// Token: 0x06000ACA RID: 2762 RVA: 0x0004EFF0 File Offset: 0x0004D1F0
	public void UpdateMaterial(Material instanceMaterial)
	{
		this.mat = instanceMaterial;
		this.InitMaterial();
	}

	// Token: 0x06000ACB RID: 2763 RVA: 0x0004F000 File Offset: 0x0004D200
	private void Start()
	{
		this.GetEffectSettingsComponent(base.transform);
		if (this.effectSettings != null)
		{
			this.effectSettings.CollisionEnter += new EventHandler<CollisionInfo>(this.prefabSettings_CollisionEnter);
		}
		this.InitMaterial();
	}

	// Token: 0x06000ACC RID: 2764 RVA: 0x0004F048 File Offset: 0x0004D248
	private void InitMaterial()
	{
		if (this.isInitialized)
		{
			return;
		}
		if (base.GetComponent<Renderer>() != null)
		{
			this.mat = base.GetComponent<Renderer>().material;
		}
		else if (this.mat == null)
		{
			return;
		}
		this.oldColor = this.mat.GetColor(this.ShaderColorName);
		this.isStartDelay = (this.StartDelay > 0.001f);
		this.isIn = (this.FadeInSpeed > 0.001f);
		this.isOut = (this.FadeOutSpeed > 0.001f);
		this.InitDefaultVariables();
		this.isInitialized = true;
	}

	// Token: 0x06000ACD RID: 2765 RVA: 0x0004F0F8 File Offset: 0x0004D2F8
	private void InitDefaultVariables()
	{
		this.fadeInComplited = false;
		this.fadeOutComplited = false;
		this.allComplited = false;
		this.canStartFadeOut = false;
		this.isCollisionEnter = false;
		this.oldAlpha = 0f;
		this.alpha = 0f;
		this.canStart = false;
		this.currentColor = this.oldColor;
		if (this.isIn)
		{
			this.currentColor.a = 0f;
		}
		this.mat.SetColor(this.ShaderColorName, this.currentColor);
		if (this.isStartDelay)
		{
			base.Invoke("SetupStartDelay", this.StartDelay);
		}
		else
		{
			this.canStart = true;
		}
		if (!this.isIn)
		{
			if (!this.FadeOutAfterCollision)
			{
				base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
			}
			this.oldAlpha = this.oldColor.a;
		}
	}

	// Token: 0x06000ACE RID: 2766 RVA: 0x0004F1E4 File Offset: 0x0004D3E4
	private void prefabSettings_CollisionEnter(object sender, CollisionInfo e)
	{
		this.isCollisionEnter = true;
		if (!this.isIn && this.FadeOutAfterCollision)
		{
			base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
		}
	}

	// Token: 0x06000ACF RID: 2767 RVA: 0x0004F220 File Offset: 0x0004D420
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.InitDefaultVariables();
		}
	}

	// Token: 0x06000AD0 RID: 2768 RVA: 0x0004F234 File Offset: 0x0004D434
	private void SetupStartDelay()
	{
		this.canStart = true;
	}

	// Token: 0x06000AD1 RID: 2769 RVA: 0x0004F240 File Offset: 0x0004D440
	private void SetupFadeOutDelay()
	{
		this.canStartFadeOut = true;
	}

	// Token: 0x06000AD2 RID: 2770 RVA: 0x0004F24C File Offset: 0x0004D44C
	private void Update()
	{
		if (!this.canStart)
		{
			return;
		}
		if (this.effectSettings != null && this.UseHideStatus && this.allComplited && this.effectSettings.IsVisible)
		{
			this.allComplited = false;
			this.fadeInComplited = false;
			this.fadeOutComplited = false;
			this.InitDefaultVariables();
		}
		if (this.isIn && !this.fadeInComplited)
		{
			if (this.effectSettings == null)
			{
				this.FadeIn();
			}
			else if ((this.UseHideStatus && this.effectSettings.IsVisible) || !this.UseHideStatus)
			{
				this.FadeIn();
			}
		}
		if (!this.isOut || this.fadeOutComplited || !this.canStartFadeOut)
		{
			return;
		}
		if (this.effectSettings == null || (!this.UseHideStatus && !this.FadeOutAfterCollision))
		{
			this.FadeOut();
		}
		else if ((this.UseHideStatus && !this.effectSettings.IsVisible) || this.isCollisionEnter)
		{
			this.FadeOut();
		}
	}

	// Token: 0x06000AD3 RID: 2771 RVA: 0x0004F398 File Offset: 0x0004D598
	private void FadeIn()
	{
		this.alpha = this.oldAlpha + Time.deltaTime / this.FadeInSpeed;
		if (this.alpha >= this.oldColor.a)
		{
			this.fadeInComplited = true;
			if (!this.isOut)
			{
				this.allComplited = true;
			}
			this.alpha = this.oldColor.a;
			base.Invoke("SetupFadeOutDelay", this.FadeOutDelay);
		}
		this.currentColor.a = this.alpha;
		this.mat.SetColor(this.ShaderColorName, this.currentColor);
		this.oldAlpha = this.alpha;
	}

	// Token: 0x06000AD4 RID: 2772 RVA: 0x0004F444 File Offset: 0x0004D644
	private void FadeOut()
	{
		this.alpha = this.oldAlpha - Time.deltaTime / this.FadeOutSpeed;
		if (this.alpha <= 0f)
		{
			this.alpha = 0f;
			this.fadeOutComplited = true;
			this.allComplited = true;
		}
		this.currentColor.a = this.alpha;
		this.mat.SetColor(this.ShaderColorName, this.currentColor);
		this.oldAlpha = this.alpha;
	}

	// Token: 0x04000A1B RID: 2587
	public string ShaderColorName = "_Color";

	// Token: 0x04000A1C RID: 2588
	public float StartDelay;

	// Token: 0x04000A1D RID: 2589
	public float FadeInSpeed;

	// Token: 0x04000A1E RID: 2590
	public float FadeOutDelay;

	// Token: 0x04000A1F RID: 2591
	public float FadeOutSpeed;

	// Token: 0x04000A20 RID: 2592
	public bool UseSharedMaterial;

	// Token: 0x04000A21 RID: 2593
	public bool FadeOutAfterCollision;

	// Token: 0x04000A22 RID: 2594
	public bool UseHideStatus;

	// Token: 0x04000A23 RID: 2595
	private Material mat;

	// Token: 0x04000A24 RID: 2596
	private Color oldColor;

	// Token: 0x04000A25 RID: 2597
	private Color currentColor;

	// Token: 0x04000A26 RID: 2598
	private float oldAlpha;

	// Token: 0x04000A27 RID: 2599
	private float alpha;

	// Token: 0x04000A28 RID: 2600
	private bool canStart;

	// Token: 0x04000A29 RID: 2601
	private bool canStartFadeOut;

	// Token: 0x04000A2A RID: 2602
	private bool fadeInComplited;

	// Token: 0x04000A2B RID: 2603
	private bool fadeOutComplited;

	// Token: 0x04000A2C RID: 2604
	private bool isCollisionEnter;

	// Token: 0x04000A2D RID: 2605
	private bool allComplited;

	// Token: 0x04000A2E RID: 2606
	private bool isStartDelay;

	// Token: 0x04000A2F RID: 2607
	private bool isIn;

	// Token: 0x04000A30 RID: 2608
	private bool isOut;

	// Token: 0x04000A31 RID: 2609
	private EffectSettings effectSettings;

	// Token: 0x04000A32 RID: 2610
	private bool isInitialized;
}
