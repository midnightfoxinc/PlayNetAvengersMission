using System;
using UnityEngine;

// Token: 0x0200017E RID: 382
[ExecuteInEditMode]
[RequireComponent(typeof(Camera))]
public class BlurEffectBehavior : PostEffectsBase
{
	// Token: 0x06000BE2 RID: 3042 RVA: 0x0005707C File Offset: 0x0005527C
	protected override bool CheckResources()
	{
		base.CheckSupport(false);
		this.blurMaterial = base.CheckShaderAndCreateMaterial(this.blurShader, this.blurMaterial);
		if (!this.isSupported)
		{
			base.ReportAutoDisable();
		}
		return this.isSupported;
	}

	// Token: 0x06000BE3 RID: 3043 RVA: 0x000570B8 File Offset: 0x000552B8
	private void OnDisable()
	{
		if (this.blurMaterial)
		{
			Object.DestroyImmediate(this.blurMaterial);
		}
	}

	// Token: 0x06000BE4 RID: 3044 RVA: 0x000570D8 File Offset: 0x000552D8
	private void OnRenderImage(RenderTexture source, RenderTexture destination)
	{
		if (!this.CheckResources())
		{
			Graphics.Blit(source, destination);
			return;
		}
		float num = 1f / (1f * (float)(1 << this.downsample));
		this.blurMaterial.SetVector("_Parameter", new Vector4(this.blurSize * num, -this.blurSize * num, 0f, 0f));
		source.filterMode = 1;
		int num2 = source.width >> this.downsample;
		int num3 = source.height >> this.downsample;
		RenderTexture renderTexture = RenderTexture.GetTemporary(num2, num3, 0, source.format);
		renderTexture.filterMode = 1;
		Graphics.Blit(source, renderTexture, this.blurMaterial, 0);
		int num4 = (this.blurType != BlurEffectBehavior.BlurType.StandardGauss) ? 2 : 0;
		for (int i = 0; i < this.blurIterations; i++)
		{
			float num5 = (float)i * 1f;
			this.blurMaterial.SetVector("_Parameter", new Vector4(this.blurSize * num + num5, -this.blurSize * num - num5, 0f, 0f));
			RenderTexture temporary = RenderTexture.GetTemporary(num2, num3, 0, source.format);
			temporary.filterMode = 1;
			Graphics.Blit(renderTexture, temporary, this.blurMaterial, 1 + num4);
			RenderTexture.ReleaseTemporary(renderTexture);
			renderTexture = temporary;
			temporary = RenderTexture.GetTemporary(num2, num3, 0, source.format);
			temporary.filterMode = 1;
			Graphics.Blit(renderTexture, temporary, this.blurMaterial, 2 + num4);
			RenderTexture.ReleaseTemporary(renderTexture);
			renderTexture = temporary;
		}
		Graphics.Blit(renderTexture, destination);
		RenderTexture.ReleaseTemporary(renderTexture);
	}

	// Token: 0x04000BB3 RID: 2995
	[Range(0f, 2f)]
	public int downsample = 1;

	// Token: 0x04000BB4 RID: 2996
	[Range(0f, 10f)]
	public float blurSize = 3f;

	// Token: 0x04000BB5 RID: 2997
	[Range(1f, 4f)]
	public int blurIterations = 2;

	// Token: 0x04000BB6 RID: 2998
	public BlurEffectBehavior.BlurType blurType;

	// Token: 0x04000BB7 RID: 2999
	public Shader blurShader;

	// Token: 0x04000BB8 RID: 3000
	private Material blurMaterial;

	// Token: 0x0200017F RID: 383
	public enum BlurType
	{
		// Token: 0x04000BBA RID: 3002
		StandardGauss,
		// Token: 0x04000BBB RID: 3003
		SgxGauss
	}
}
