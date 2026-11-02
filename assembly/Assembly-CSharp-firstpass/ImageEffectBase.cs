using System;
using UnityEngine;

// Token: 0x0200001B RID: 27
[RequireComponent(typeof(Camera))]
[AddComponentMenu("")]
public class ImageEffectBase : MonoBehaviour
{
	// Token: 0x06000232 RID: 562 RVA: 0x00008808 File Offset: 0x00006A08
	protected virtual void Start()
	{
		if (!SystemInfo.supportsImageEffects)
		{
			base.enabled = false;
			return;
		}
		if (!this.shader || !this.shader.isSupported)
		{
			base.enabled = false;
		}
	}

	// Token: 0x17000024 RID: 36
	// (get) Token: 0x06000233 RID: 563 RVA: 0x00008850 File Offset: 0x00006A50
	protected Material material
	{
		get
		{
			if (this.m_Material == null)
			{
				this.m_Material = new Material(this.shader);
				this.m_Material.hideFlags = 61;
			}
			return this.m_Material;
		}
	}

	// Token: 0x06000234 RID: 564 RVA: 0x00008888 File Offset: 0x00006A88
	protected virtual void OnDisable()
	{
		if (this.m_Material)
		{
			Object.DestroyImmediate(this.m_Material);
		}
	}

	// Token: 0x040000B4 RID: 180
	public Shader shader;

	// Token: 0x040000B5 RID: 181
	private Material m_Material;
}
