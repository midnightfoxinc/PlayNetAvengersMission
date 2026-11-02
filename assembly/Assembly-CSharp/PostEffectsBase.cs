using System;
using UnityEngine;

// Token: 0x020001E5 RID: 485
[ExecuteInEditMode]
[RequireComponent(typeof(Camera))]
public abstract class PostEffectsBase : MonoBehaviour
{
	// Token: 0x170001D4 RID: 468
	// (get) Token: 0x06000E10 RID: 3600 RVA: 0x000636A0 File Offset: 0x000618A0
	public Camera camera
	{
		get
		{
			if (!this._camera)
			{
				this._camera = base.GetComponent<Camera>();
			}
			return this._camera;
		}
	}

	// Token: 0x06000E11 RID: 3601 RVA: 0x000636D0 File Offset: 0x000618D0
	protected Material CheckShaderAndCreateMaterial(Shader s, Material m2Create)
	{
		if (!s)
		{
			globals.debug("Missing shader in " + this.ToString());
			base.enabled = false;
			return null;
		}
		if (s.isSupported && m2Create && m2Create.shader == s)
		{
			return m2Create;
		}
		if (!s.isSupported)
		{
			this.NotSupported();
			globals.debug(string.Concat(new string[]
			{
				"The shader ",
				s.ToString(),
				" on effect ",
				this.ToString(),
				" is not supported on this platform!"
			}));
			return null;
		}
		m2Create = new Material(s);
		m2Create.hideFlags = 52;
		if (m2Create)
		{
			return m2Create;
		}
		return null;
	}

	// Token: 0x06000E12 RID: 3602 RVA: 0x0006379C File Offset: 0x0006199C
	protected Material CreateMaterial(Shader s, Material m2Create)
	{
		if (!s)
		{
			globals.debug("Missing shader in " + this.ToString());
			return null;
		}
		if (m2Create && m2Create.shader == s && s.isSupported)
		{
			return m2Create;
		}
		if (!s.isSupported)
		{
			return null;
		}
		m2Create = new Material(s);
		m2Create.hideFlags = 52;
		if (m2Create)
		{
			return m2Create;
		}
		return null;
	}

	// Token: 0x06000E13 RID: 3603 RVA: 0x00063820 File Offset: 0x00061A20
	private void OnEnable()
	{
		this.isSupported = true;
	}

	// Token: 0x06000E14 RID: 3604 RVA: 0x0006382C File Offset: 0x00061A2C
	protected bool CheckSupport()
	{
		return this.CheckSupport(false);
	}

	// Token: 0x06000E15 RID: 3605 RVA: 0x00063838 File Offset: 0x00061A38
	protected virtual bool CheckResources()
	{
		globals.debugWarning("CheckResources () for " + this.ToString() + " should be overwritten.");
		return this.isSupported;
	}

	// Token: 0x06000E16 RID: 3606 RVA: 0x00063868 File Offset: 0x00061A68
	private void Start()
	{
		this.CheckResources();
	}

	// Token: 0x06000E17 RID: 3607 RVA: 0x00063874 File Offset: 0x00061A74
	protected bool CheckSupport(bool needDepth)
	{
		this.isSupported = true;
		this.supportHDRTextures = SystemInfo.SupportsRenderTextureFormat(2);
		this.supportDX11 = (SystemInfo.graphicsShaderLevel >= 50 && SystemInfo.supportsComputeShaders);
		if (!SystemInfo.supportsImageEffects || !SystemInfo.supportsRenderTextures)
		{
			this.NotSupported();
			return false;
		}
		if (needDepth && !SystemInfo.SupportsRenderTextureFormat(1))
		{
			this.NotSupported();
			return false;
		}
		if (needDepth)
		{
			this.camera.depthTextureMode |= 1;
		}
		return true;
	}

	// Token: 0x06000E18 RID: 3608 RVA: 0x00063900 File Offset: 0x00061B00
	protected bool CheckSupport(bool needDepth, bool needHdr)
	{
		if (!this.CheckSupport(needDepth))
		{
			return false;
		}
		if (needHdr && !this.supportHDRTextures)
		{
			this.NotSupported();
			return false;
		}
		return true;
	}

	// Token: 0x06000E19 RID: 3609 RVA: 0x00063938 File Offset: 0x00061B38
	protected bool Dx11Support()
	{
		return this.supportDX11;
	}

	// Token: 0x06000E1A RID: 3610 RVA: 0x00063940 File Offset: 0x00061B40
	protected void ReportAutoDisable()
	{
		globals.debugWarning("The image effect " + this.ToString() + " has been disabled as it's not supported on the current platform.");
	}

	// Token: 0x06000E1B RID: 3611 RVA: 0x0006395C File Offset: 0x00061B5C
	protected bool CheckShader(Shader s)
	{
		globals.debug(string.Concat(new string[]
		{
			"The shader ",
			s.ToString(),
			" on effect ",
			this.ToString(),
			" is not part of the Unity 3.2+ effects suite anymore. For best performance and quality, please ensure you are using the latest Standard Assets Image Effects (Pro only) package."
		}));
		if (!s.isSupported)
		{
			this.NotSupported();
			return false;
		}
		return false;
	}

	// Token: 0x06000E1C RID: 3612 RVA: 0x000639B8 File Offset: 0x00061BB8
	protected void NotSupported()
	{
		base.enabled = false;
		this.isSupported = false;
	}

	// Token: 0x06000E1D RID: 3613 RVA: 0x000639C8 File Offset: 0x00061BC8
	private void DrawBorder(RenderTexture dest, Material material)
	{
		RenderTexture.active = dest;
		bool flag = true;
		GL.PushMatrix();
		GL.LoadOrtho();
		for (int i = 0; i < material.passCount; i++)
		{
			material.SetPass(i);
			float num;
			float num2;
			if (flag)
			{
				num = 1f;
				num2 = 0f;
			}
			else
			{
				num = 0f;
				num2 = 1f;
			}
			float num3 = 0f;
			float num4 = 0f + 1f / ((float)dest.width * 1f);
			float num5 = 0f;
			float num6 = 1f;
			GL.Begin(7);
			GL.TexCoord2(0f, num);
			GL.Vertex3(num3, num5, 0.1f);
			GL.TexCoord2(1f, num);
			GL.Vertex3(num4, num5, 0.1f);
			GL.TexCoord2(1f, num2);
			GL.Vertex3(num4, num6, 0.1f);
			GL.TexCoord2(0f, num2);
			GL.Vertex3(num3, num6, 0.1f);
			num3 = 1f - 1f / ((float)dest.width * 1f);
			num4 = 1f;
			num5 = 0f;
			num6 = 1f;
			GL.TexCoord2(0f, num);
			GL.Vertex3(num3, num5, 0.1f);
			GL.TexCoord2(1f, num);
			GL.Vertex3(num4, num5, 0.1f);
			GL.TexCoord2(1f, num2);
			GL.Vertex3(num4, num6, 0.1f);
			GL.TexCoord2(0f, num2);
			GL.Vertex3(num3, num6, 0.1f);
			num3 = 0f;
			num4 = 1f;
			num5 = 0f;
			num6 = 0f + 1f / ((float)dest.height * 1f);
			GL.TexCoord2(0f, num);
			GL.Vertex3(num3, num5, 0.1f);
			GL.TexCoord2(1f, num);
			GL.Vertex3(num4, num5, 0.1f);
			GL.TexCoord2(1f, num2);
			GL.Vertex3(num4, num6, 0.1f);
			GL.TexCoord2(0f, num2);
			GL.Vertex3(num3, num6, 0.1f);
			num3 = 0f;
			num4 = 1f;
			num5 = 1f - 1f / ((float)dest.height * 1f);
			num6 = 1f;
			GL.TexCoord2(0f, num);
			GL.Vertex3(num3, num5, 0.1f);
			GL.TexCoord2(1f, num);
			GL.Vertex3(num4, num5, 0.1f);
			GL.TexCoord2(1f, num2);
			GL.Vertex3(num4, num6, 0.1f);
			GL.TexCoord2(0f, num2);
			GL.Vertex3(num3, num6, 0.1f);
			GL.End();
		}
		GL.PopMatrix();
	}

	// Token: 0x04000DC6 RID: 3526
	protected bool supportHDRTextures = true;

	// Token: 0x04000DC7 RID: 3527
	protected bool supportDX11;

	// Token: 0x04000DC8 RID: 3528
	protected bool isSupported = true;

	// Token: 0x04000DC9 RID: 3529
	private Camera _camera;
}
