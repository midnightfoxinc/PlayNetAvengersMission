using System;
using System.Collections.Generic;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000029 RID: 41
	public class LightningBoltScript : MonoBehaviour
	{
		// Token: 0x0600011E RID: 286 RVA: 0x00009D38 File Offset: 0x00007F38
		private void Start()
		{
			if (this.LightningMaterial == null || this.LightningMaterialMesh == null || this.LightningMaterialMeshNoGlow == null)
			{
				Debug.LogError("Must assign lightning materials");
			}
			if (this.RenderMode == LightningBoltRenderMode.LineRenderer)
			{
				this.lightningBoltRenderer = new LightningBoltLineRenderer();
			}
			else
			{
				this.lightningBoltRenderer = new LightningBoltMeshRenderer();
				(this.lightningBoltRenderer as LightningBoltMeshRenderer).MaterialNoGlow = this.LightningMaterialMeshNoGlow;
				if (this.RenderMode == LightningBoltRenderMode.MeshRendererLineGlow)
				{
					this.LightningMaterialMesh.EnableKeyword("USE_LINE_GLOW");
				}
				else
				{
					this.LightningMaterialMesh.DisableKeyword("USE_LINE_GLOW");
				}
			}
			this.lightningBoltRenderer.Script = this;
			this.lightningBoltRenderer.Material = ((this.lightningBoltRenderer.ShaderIndex != 0) ? this.LightningMaterialMesh : this.LightningMaterial);
		}

		// Token: 0x0600011F RID: 287 RVA: 0x00009E28 File Offset: 0x00008028
		private void Update()
		{
			if (this.bolts.Count == 0)
			{
				return;
			}
			for (int i = this.bolts.Count - 1; i >= 0; i--)
			{
				if (!this.bolts[i].Update())
				{
					this.bolts.RemoveAt(i);
				}
			}
		}

		// Token: 0x06000120 RID: 288 RVA: 0x00009E88 File Offset: 0x00008088
		public void CreateLightningBolt(LightningBoltParameters p)
		{
			LightningBolt lightningBolt = new LightningBolt(this.lightningBoltRenderer, base.gameObject, this, this.LightningOriginParticleSystem, this.LightningGlowParticleSystem, p);
			this.bolts.Add(lightningBolt);
		}

		// Token: 0x0400016E RID: 366
		private LightningBoltRenderer lightningBoltRenderer;

		// Token: 0x0400016F RID: 367
		[Tooltip("Whether to use the mesh renderer or the line renderer to draw the lightning.")]
		public LightningBoltRenderMode RenderMode = LightningBoltRenderMode.MeshRendererSquareBillboardGlow;

		// Token: 0x04000170 RID: 368
		[Tooltip("Lightning material for line renderer")]
		public Material LightningMaterial;

		// Token: 0x04000171 RID: 369
		[Tooltip("Lightning material for mesh renderer")]
		public Material LightningMaterialMesh;

		// Token: 0x04000172 RID: 370
		[Tooltip("Lightning material for mesh renderer, without glow")]
		public Material LightningMaterialMeshNoGlow;

		// Token: 0x04000173 RID: 371
		[Tooltip("Lightning origin particle system")]
		public ParticleSystem LightningOriginParticleSystem;

		// Token: 0x04000174 RID: 372
		[Tooltip("Lightning glow particle system")]
		public ParticleSystem LightningGlowParticleSystem;

		// Token: 0x04000175 RID: 373
		private readonly List<LightningBolt> bolts = new List<LightningBolt>();
	}
}
