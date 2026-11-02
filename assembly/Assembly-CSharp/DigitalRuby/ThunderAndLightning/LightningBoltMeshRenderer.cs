using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000022 RID: 34
	public class LightningBoltMeshRenderer : LightningBoltRenderer
	{
		// Token: 0x060000EE RID: 238 RVA: 0x0000863C File Offset: 0x0000683C
		private IEnumerator EnableRenderer(LightningBoltMeshRenderer.LineRendererMesh renderer, LightningBolt lightningBolt, float delay)
		{
			yield return new WaitForSeconds(delay);
			if (renderer != null && lightningBolt.ElapsedTime < lightningBolt.LifeTime)
			{
				renderer.Begin();
			}
			yield break;
		}

		// Token: 0x060000EF RID: 239 RVA: 0x0000867C File Offset: 0x0000687C
		public override void Begin(LightningBolt lightningBolt)
		{
			LightningBoltMeshRenderer.LineRendererMesh lineRendererMesh;
			if (!this.renderers.TryGetValue(lightningBolt, ref lineRendererMesh))
			{
				if (this.rendererCache.Count == 0)
				{
					lineRendererMesh = new GameObject
					{
						name = "LightningBoltMeshRenderer",
						transform = 
						{
							parent = lightningBolt.Parent.transform,
							position = lightningBolt.Parent.transform.position
						}
					}.AddComponent<LightningBoltMeshRenderer.LineRendererMesh>();
				}
				else
				{
					lineRendererMesh = this.rendererCache[this.rendererCache.Count - 1];
					this.rendererCache.RemoveAt(this.rendererCache.Count - 1);
				}
				lineRendererMesh.Material = ((!lightningBolt.HasGlow) ? this.MaterialNoGlow : base.Material);
				this.renderers[lightningBolt] = lineRendererMesh;
				base.Script.StartCoroutine(this.EnableRenderer(lineRendererMesh, lightningBolt, lightningBolt.Delay));
			}
		}

		// Token: 0x060000F0 RID: 240 RVA: 0x00008774 File Offset: 0x00006974
		public override void AddGroup(LightningBolt lightningBolt, LightningBoltSegmentGroup group)
		{
			LightningBoltMeshRenderer.LineRendererMesh lineRendererMesh = this.renderers[lightningBolt];
			float num = Time.time + group.Delay + lightningBolt.Delay;
			Color c;
			c..ctor(num, num + group.PeakStart, num + group.PeakEnd, num + group.LifeTime);
			float num2 = group.LineWidth * 0.5f;
			int num3 = group.Segments.Count - group.StartIndex;
			float num4 = (num2 - num2 * group.EndWidthMultiplier) / (float)num3;
			lineRendererMesh.BeginLine(group.Segments[group.StartIndex].Start, group.Segments[group.StartIndex].End, num2, c, base.GlowWidthMultiplier, base.GlowIntensityMultiplier);
			for (int i = group.StartIndex + 1; i < group.Segments.Count; i++)
			{
				num2 -= num4;
				lineRendererMesh.AppendLine(group.Segments[i].Start, group.Segments[i].End, num2, c, base.GlowWidthMultiplier, base.GlowIntensityMultiplier);
			}
		}

		// Token: 0x060000F1 RID: 241 RVA: 0x000088A8 File Offset: 0x00006AA8
		public override void Cleanup(LightningBolt lightningBolt)
		{
			LightningBoltMeshRenderer.LineRendererMesh lineRendererMesh;
			if (this.renderers.TryGetValue(lightningBolt, ref lineRendererMesh))
			{
				this.renderers.Remove(lightningBolt);
				this.rendererCache.Add(lineRendererMesh);
				lineRendererMesh.Reset();
			}
		}

		// Token: 0x1700000B RID: 11
		// (get) Token: 0x060000F2 RID: 242 RVA: 0x000088E8 File Offset: 0x00006AE8
		public override int ShaderIndex
		{
			get
			{
				return 1;
			}
		}

		// Token: 0x1700000C RID: 12
		// (get) Token: 0x060000F3 RID: 243 RVA: 0x000088EC File Offset: 0x00006AEC
		public override bool CanGlow
		{
			get
			{
				return true;
			}
		}

		// Token: 0x1700000D RID: 13
		// (get) Token: 0x060000F4 RID: 244 RVA: 0x000088F0 File Offset: 0x00006AF0
		// (set) Token: 0x060000F5 RID: 245 RVA: 0x000088F8 File Offset: 0x00006AF8
		public Material MaterialNoGlow { get; set; }

		// Token: 0x04000128 RID: 296
		private readonly Dictionary<LightningBolt, LightningBoltMeshRenderer.LineRendererMesh> renderers = new Dictionary<LightningBolt, LightningBoltMeshRenderer.LineRendererMesh>();

		// Token: 0x04000129 RID: 297
		private readonly List<LightningBoltMeshRenderer.LineRendererMesh> rendererCache = new List<LightningBoltMeshRenderer.LineRendererMesh>();

		// Token: 0x02000023 RID: 35
		[RequireComponent(typeof(MeshFilter), typeof(MeshRenderer))]
		public class LineRendererMesh : MonoBehaviour
		{
			// Token: 0x060000F8 RID: 248 RVA: 0x000089CC File Offset: 0x00006BCC
			private void Awake()
			{
				this.mesh = new Mesh();
				base.GetComponent<MeshFilter>().sharedMesh = this.mesh;
				this.meshRenderer = base.GetComponent<MeshRenderer>();
				this.meshRenderer.shadowCastingMode = 0;
				this.meshRenderer.useLightProbes = false;
				this.meshRenderer.receiveShadows = false;
				this.meshRenderer.reflectionProbeUsage = 0;
				this.meshRenderer.enabled = false;
			}

			// Token: 0x060000F9 RID: 249 RVA: 0x00008A40 File Offset: 0x00006C40
			private void OnWillRenderObject()
			{
				this.Material.SetVector("_CameraDownVector", -Camera.current.transform.up);
				this.Material.SetVector("_CameraRightVector", Camera.current.transform.right);
				this.Material.SetFloat("_CameraTangent", 2f * Mathf.Tan(Camera.current.fieldOfView * 0.5f * 0.017453292f));
			}

			// Token: 0x060000FA RID: 250 RVA: 0x00008ACC File Offset: 0x00006CCC
			private void Update()
			{
				if (this.needsUpdate)
				{
					this.mesh.vertices = this.vertices.ToArray();
					this.mesh.tangents = this.lineDirs.ToArray();
					this.mesh.colors = this.colors.ToArray();
					this.mesh.uv = this.texCoords.ToArray();
					this.mesh.uv2 = this.glowModifiers.ToArray();
					this.mesh.normals = this.ends.ToArray();
					this.mesh.triangles = this.indices.ToArray();
					this.needsUpdate = false;
				}
			}

			// Token: 0x060000FB RID: 251 RVA: 0x00008B88 File Offset: 0x00006D88
			private void AddIndices()
			{
				int count = this.vertices.Count;
				this.indices.Add(count++);
				this.indices.Add(count++);
				this.indices.Add(count);
				this.indices.Add(count--);
				this.indices.Add(count);
				this.indices.Add(count + 2);
			}

			// Token: 0x060000FC RID: 252 RVA: 0x00008BFC File Offset: 0x00006DFC
			public void Begin()
			{
				this.meshRenderer.enabled = true;
				base.gameObject.SetActive(true);
			}

			// Token: 0x060000FD RID: 253 RVA: 0x00008C18 File Offset: 0x00006E18
			public void BeginLine(Vector3 start, Vector3 end, float radius, Color c, float glowWidthModifier, float glowIntensity)
			{
				this.AddIndices();
				Vector2 vector;
				vector..ctor(glowWidthModifier, glowIntensity);
				Vector4 vector2 = end - start;
				vector2.w = radius;
				this.vertices.Add(start);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv1);
				this.lineDirs.Add(vector2);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
				this.vertices.Add(end);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv2);
				this.lineDirs.Add(vector2);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
				vector2.w = -radius;
				this.vertices.Add(start);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv3);
				this.lineDirs.Add(vector2);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
				this.vertices.Add(end);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv4);
				this.lineDirs.Add(vector2);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
				this.needsUpdate = true;
			}

			// Token: 0x060000FE RID: 254 RVA: 0x00008DA4 File Offset: 0x00006FA4
			public void AppendLine(Vector3 start, Vector3 end, float radius, Color c, float glowWidthModifier, float glowIntensity)
			{
				this.AddIndices();
				Vector2 vector;
				vector..ctor(glowWidthModifier, glowIntensity);
				Vector4 vector2 = end - start;
				vector2.w = radius;
				this.vertices.Add(start);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv1);
				this.lineDirs.Add(this.lineDirs[this.lineDirs.Count - 3]);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
				this.vertices.Add(end);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv2);
				this.lineDirs.Add(vector2);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
				vector2.w = -radius;
				this.vertices.Add(start);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv3);
				this.lineDirs.Add(this.lineDirs[this.lineDirs.Count - 3]);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
				this.vertices.Add(end);
				this.texCoords.Add(LightningBoltMeshRenderer.LineRendererMesh.uv4);
				this.lineDirs.Add(vector2);
				this.colors.Add(c);
				this.glowModifiers.Add(vector);
				this.ends.Add(vector2);
			}

			// Token: 0x060000FF RID: 255 RVA: 0x00008F58 File Offset: 0x00007158
			public void Reset()
			{
				this.mesh.triangles = null;
				this.meshRenderer.enabled = false;
				base.gameObject.SetActive(false);
				this.indices.Clear();
				this.vertices.Clear();
				this.colors.Clear();
				this.lineDirs.Clear();
				this.texCoords.Clear();
				this.glowModifiers.Clear();
				this.ends.Clear();
			}

			// Token: 0x1700000E RID: 14
			// (get) Token: 0x06000100 RID: 256 RVA: 0x00008FD8 File Offset: 0x000071D8
			// (set) Token: 0x06000101 RID: 257 RVA: 0x00008FE8 File Offset: 0x000071E8
			public Material Material
			{
				get
				{
					return base.GetComponent<MeshRenderer>().sharedMaterial;
				}
				set
				{
					base.GetComponent<MeshRenderer>().sharedMaterial = value;
				}
			}

			// Token: 0x0400012B RID: 299
			private static readonly Vector2 uv1 = new Vector2(0f, 0f);

			// Token: 0x0400012C RID: 300
			private static readonly Vector2 uv2 = new Vector2(1f, 0f);

			// Token: 0x0400012D RID: 301
			private static readonly Vector2 uv3 = new Vector2(0f, 1f);

			// Token: 0x0400012E RID: 302
			private static readonly Vector2 uv4 = new Vector2(1f, 1f);

			// Token: 0x0400012F RID: 303
			private Mesh mesh;

			// Token: 0x04000130 RID: 304
			private MeshRenderer meshRenderer;

			// Token: 0x04000131 RID: 305
			private readonly List<int> indices = new List<int>();

			// Token: 0x04000132 RID: 306
			private readonly List<Vector2> texCoords = new List<Vector2>();

			// Token: 0x04000133 RID: 307
			private readonly List<Vector3> vertices = new List<Vector3>();

			// Token: 0x04000134 RID: 308
			private readonly List<Vector4> lineDirs = new List<Vector4>();

			// Token: 0x04000135 RID: 309
			private readonly List<Color> colors = new List<Color>();

			// Token: 0x04000136 RID: 310
			private readonly List<Vector2> glowModifiers = new List<Vector2>();

			// Token: 0x04000137 RID: 311
			private readonly List<Vector3> ends = new List<Vector3>();

			// Token: 0x04000138 RID: 312
			private bool needsUpdate = true;
		}
	}
}
