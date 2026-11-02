using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x02000027 RID: 39
	public class LightningBolt
	{
		// Token: 0x06000105 RID: 261 RVA: 0x00009050 File Offset: 0x00007250
		public LightningBolt(LightningBoltRenderer lightningBoltRenderer, GameObject parent, LightningBoltScript script, ParticleSystem originParticleSystem, ParticleSystem glowParticleSystem, LightningBoltParameters p)
		{
			this.lightningBoltRenderer = lightningBoltRenderer;
			p.Camera = (p.Camera ?? Camera.main);
			p.GlowIntensity = Mathf.Clamp(p.GlowIntensity, 0f, 1f);
			p.GlowWidthMultiplier = Mathf.Clamp(p.GlowWidthMultiplier, 0f, 64f);
			this.random = (p.Random ?? new Random(Environment.TickCount));
			this.Parent = parent;
			this.script = script;
			this.camera = p.Camera;
			this.LifeTime = Mathf.Max(0.01f, p.LifeTime);
			this.peakLifeTimeStart = p.LifeTime * 0.2f;
			this.peakLifeTimeEnd = p.LifeTime - this.peakLifeTimeStart;
			this.chaosFactor = p.ChaosFactor;
			this.Delay = p.Delay;
			this.intensity = p.PointLightIntensity;
			this.trunkWidth = p.TrunkWidth;
			this.endWidthMultiplier = p.EndWidthMultiplier;
			this.SetupLightningLight();
			if (p.Generations > 0)
			{
				p.Generations = Mathf.Clamp(p.Generations, 4, 8);
				this.forkedness = (int)(p.Forkedness * (float)p.Generations);
				this.GenerateLightningBolt(p.Start, p.End, p.Generations, p.Generations, 0f, 0f);
				float glowWidthMultiplier = p.GlowWidthMultiplier;
				this.RenderLightningBolt(p.Start, originParticleSystem, glowParticleSystem, p.GlowIntensity, glowWidthMultiplier);
			}
		}

		// Token: 0x1700000F RID: 15
		// (get) Token: 0x06000107 RID: 263 RVA: 0x0000921C File Offset: 0x0000741C
		// (set) Token: 0x06000108 RID: 264 RVA: 0x00009224 File Offset: 0x00007424
		public GameObject Parent { get; private set; }

		// Token: 0x17000010 RID: 16
		// (get) Token: 0x06000109 RID: 265 RVA: 0x00009230 File Offset: 0x00007430
		// (set) Token: 0x0600010A RID: 266 RVA: 0x00009238 File Offset: 0x00007438
		public float LifeTime { get; private set; }

		// Token: 0x17000011 RID: 17
		// (get) Token: 0x0600010B RID: 267 RVA: 0x00009244 File Offset: 0x00007444
		// (set) Token: 0x0600010C RID: 268 RVA: 0x0000924C File Offset: 0x0000744C
		public float ElapsedTime { get; private set; }

		// Token: 0x17000012 RID: 18
		// (get) Token: 0x0600010D RID: 269 RVA: 0x00009258 File Offset: 0x00007458
		// (set) Token: 0x0600010E RID: 270 RVA: 0x00009260 File Offset: 0x00007460
		public float Delay { get; private set; }

		// Token: 0x17000013 RID: 19
		// (get) Token: 0x0600010F RID: 271 RVA: 0x0000926C File Offset: 0x0000746C
		// (set) Token: 0x06000110 RID: 272 RVA: 0x00009274 File Offset: 0x00007474
		public float CurrentDelayAmount { get; private set; }

		// Token: 0x17000014 RID: 20
		// (get) Token: 0x06000111 RID: 273 RVA: 0x00009280 File Offset: 0x00007480
		// (set) Token: 0x06000112 RID: 274 RVA: 0x00009288 File Offset: 0x00007488
		public bool HasGlow { get; private set; }

		// Token: 0x06000113 RID: 275 RVA: 0x00009294 File Offset: 0x00007494
		private void SetupLightningLight()
		{
			if (this.intensity > 0f)
			{
				this.lightningLightObject = new GameObject();
				this.lightningLightObject.name = "LightningBoltLight";
				this.lightningLight = this.lightningLightObject.AddComponent<Light>();
				this.lightningLight.type = 2;
				this.lightningLight.color = Color.white;
				this.lightningLight.range = 5000f;
				this.lightningLight.bounceIntensity = 1f;
				this.lightningLight.intensity = 0f;
				this.lightningLight.enabled = (this.Delay <= 0f);
				this.lightningLightObject.transform.parent = this.Parent.transform;
			}
		}

		// Token: 0x06000114 RID: 276 RVA: 0x00009360 File Offset: 0x00007560
		private void RenderLightningBolt(Vector3 start, ParticleSystem originParticleSystem, ParticleSystem glowParticleSystem, float glowIntensity, float glowWidthMultiplier)
		{
			if (this.segmentGroups.Count == 0)
			{
				return;
			}
			float num = this.LifeTime / (float)this.segmentGroups.Count;
			float num2 = num * 0.9f;
			float num3 = num * 1.1f;
			float num4 = num3 - num2;
			if (originParticleSystem != null)
			{
				this.script.StartCoroutine(this.GenerateOriginParticle(originParticleSystem, start, this.LifeTime));
			}
			this.HasGlow = true;
			bool hasGlow = this.HasGlow;
			if (this.lightningBoltRenderer != null)
			{
				this.lightningBoltRenderer.Begin(this);
				if (this.HasGlow)
				{
					this.lightningBoltRenderer.GlowIntensityMultiplier = glowIntensity;
					this.lightningBoltRenderer.GlowWidthMultiplier = glowWidthMultiplier;
				}
			}
			foreach (LightningBoltSegmentGroup lightningBoltSegmentGroup in this.segmentGroups)
			{
				if (lightningBoltSegmentGroup.Segments.Count >= 2)
				{
					lightningBoltSegmentGroup.Delay = this.CurrentDelayAmount;
					lightningBoltSegmentGroup.LifeTime = this.LifeTime - this.CurrentDelayAmount;
					lightningBoltSegmentGroup.PeakStart = lightningBoltSegmentGroup.LifeTime * 0.2f;
					lightningBoltSegmentGroup.PeakEnd = lightningBoltSegmentGroup.LifeTime - lightningBoltSegmentGroup.PeakStart;
					if (hasGlow)
					{
						this.script.StartCoroutine(this.RenderGroupGlow(lightningBoltSegmentGroup, glowParticleSystem, this.LifeTime - this.CurrentDelayAmount, this.Delay + this.CurrentDelayAmount, glowIntensity, glowWidthMultiplier));
					}
					if (this.lightningBoltRenderer != null)
					{
						this.lightningBoltRenderer.AddGroup(this, lightningBoltSegmentGroup);
					}
					this.CurrentDelayAmount += (float)this.random.NextDouble() * num2 + num4;
				}
			}
			if (this.lightningBoltRenderer != null)
			{
				this.lightningBoltRenderer.Optimize();
			}
		}

		// Token: 0x06000115 RID: 277 RVA: 0x00009554 File Offset: 0x00007754
		private IEnumerator RenderGroupGlow(LightningBoltSegmentGroup g, ParticleSystem glowParticleSystem, float glowTime, float delayTime, float glowIntensity, float glowWidthMultiplier)
		{
			yield return new WaitForSeconds(delayTime);
			float cameraTangent = Mathf.Tan(this.camera.fieldOfView * 0.5f * 0.017453292f) * 2f;
			float oneOverPixelHeight = 1f / (float)this.camera.pixelHeight;
			Color32 color = g.Color;
			color.a = (byte)((float)color.a * glowIntensity);
			for (int i = g.StartIndex; i < g.Segments.Count; i++)
			{
				Vector3 screenStart = this.camera.WorldToScreenPoint(g.Segments[i].Start);
				Vector3 screenEnd = this.camera.WorldToScreenPoint(g.Segments[i].End);
				screenStart.z = (screenEnd.z = 0f);
				Vector3 worldMiddle = (g.Segments[i].Start + g.Segments[i].End) * 0.5f;
				float frustumHeight = Vector3.Distance(worldMiddle, this.camera.transform.position) * cameraTangent;
				float frustumPercent = frustumHeight * oneOverPixelHeight;
				float lineWidthScreen = g.LineWidth * ((float)this.camera.pixelHeight / frustumHeight);
				float particleSize = Vector2.Distance(screenStart, screenEnd) * 2f + lineWidthScreen * glowWidthMultiplier;
				particleSize *= frustumPercent;
				if (glowParticleSystem)
				{
					glowParticleSystem.Emit(worldMiddle, Vector3.zero, particleSize, glowTime, color);
				}
			}
			yield break;
		}

		// Token: 0x06000116 RID: 278 RVA: 0x000095CC File Offset: 0x000077CC
		public void Cleanup()
		{
			foreach (LightningBoltSegmentGroup lightningBoltSegmentGroup in this.segmentGroups)
			{
				if (this.lightningBoltRenderer != null)
				{
					this.lightningBoltRenderer.RemoveGroup(lightningBoltSegmentGroup);
				}
				LightningBolt.groupCache.Add(lightningBoltSegmentGroup);
			}
			if (this.lightningLightObject != null)
			{
				Object.Destroy(this.lightningLightObject);
			}
			if (this.lightningBoltRenderer != null)
			{
				this.lightningBoltRenderer.Cleanup(this);
			}
		}

		// Token: 0x06000117 RID: 279 RVA: 0x00009680 File Offset: 0x00007880
		public bool Update()
		{
			if (this.Delay > 0f)
			{
				this.Delay -= Time.deltaTime;
				if (this.Delay > 0f)
				{
					return true;
				}
				if (this.lightningLight != null)
				{
					this.lightningLight.enabled = true;
				}
				this.ElapsedTime = -this.Delay;
			}
			else
			{
				this.ElapsedTime += Time.deltaTime;
			}
			if (this.ElapsedTime > this.LifeTime)
			{
				this.Cleanup();
				return false;
			}
			if (this.lightningLight != null)
			{
				float num;
				float num2;
				float num3;
				if (this.ElapsedTime >= this.peakLifeTimeStart)
				{
					if (this.ElapsedTime <= this.peakLifeTimeEnd)
					{
						num = 1f;
						num2 = 1f;
						num3 = 1f;
					}
					else
					{
						num = (this.ElapsedTime - this.peakLifeTimeEnd) / (this.LifeTime - this.peakLifeTimeEnd);
						num2 = 1f;
						num3 = 0f;
					}
				}
				else
				{
					num = this.ElapsedTime / this.peakLifeTimeStart;
					num2 = 0f;
					num3 = 1f;
				}
				this.lightningLight.intensity = Mathf.Lerp(this.intensity * num2, this.intensity * num3, num);
			}
			foreach (LightningBoltSegmentGroup group in this.segmentGroups)
			{
				if (this.lightningBoltRenderer != null)
				{
					this.lightningBoltRenderer.Render(this, group);
				}
			}
			return true;
		}

		// Token: 0x06000118 RID: 280 RVA: 0x00009840 File Offset: 0x00007A40
		private LightningBoltSegmentGroup CreateGroup()
		{
			LightningBoltSegmentGroup lightningBoltSegmentGroup;
			if (LightningBolt.groupCache.Count == 0)
			{
				lightningBoltSegmentGroup = new LightningBoltSegmentGroup();
			}
			else
			{
				int num = LightningBolt.groupCache.Count - 1;
				lightningBoltSegmentGroup = LightningBolt.groupCache[num];
				lightningBoltSegmentGroup.Segments.Clear();
				lightningBoltSegmentGroup.StartIndex = 0;
				LightningBolt.groupCache.RemoveAt(num);
			}
			lightningBoltSegmentGroup.EndWidthMultiplier = this.endWidthMultiplier;
			this.segmentGroups.Add(lightningBoltSegmentGroup);
			return lightningBoltSegmentGroup;
		}

		// Token: 0x06000119 RID: 281 RVA: 0x000098B8 File Offset: 0x00007AB8
		private IEnumerator GenerateOriginParticle(ParticleSystem p, Vector3 pos, float lifeTime)
		{
			yield return new WaitForSeconds(this.Delay);
			p.Emit(pos, Vector3.zero, (float)this.random.NextDouble() * 1000f + 1000f, lifeTime * 1.25f, new Color(1f, 1f, 1f, 1f));
			yield break;
		}

		// Token: 0x0600011A RID: 282 RVA: 0x00009900 File Offset: 0x00007B00
		private void GenerateLightningBolt(Vector3 start, Vector3 end, int generation, int totalGenerations, float offsetAmount, float lineWidth)
		{
			if (generation < 1)
			{
				return;
			}
			LightningBoltSegmentGroup lightningBoltSegmentGroup = this.CreateGroup();
			lightningBoltSegmentGroup.Segments.Add(new LightningBoltSegment
			{
				Start = start,
				End = end
			});
			float num = (float)generation / (float)totalGenerations;
			num *= num;
			if (offsetAmount <= 0f)
			{
				offsetAmount = (end - start).magnitude * this.chaosFactor;
			}
			if (lineWidth <= 0f)
			{
				lightningBoltSegmentGroup.LineWidth = ((this.trunkWidth > 0f) ? this.trunkWidth : ((float)this.random.NextDouble() * 7f + 7f));
			}
			else
			{
				lightningBoltSegmentGroup.LineWidth = lineWidth * num;
			}
			lightningBoltSegmentGroup.LineWidth *= num;
			lightningBoltSegmentGroup.Color = new Color(1f, 1f, 1f, num);
			lightningBoltSegmentGroup.Generation = generation - 1;
			while (generation-- > 0)
			{
				int startIndex = lightningBoltSegmentGroup.StartIndex;
				lightningBoltSegmentGroup.StartIndex = lightningBoltSegmentGroup.Segments.Count;
				for (int i = startIndex; i < lightningBoltSegmentGroup.StartIndex; i++)
				{
					start = lightningBoltSegmentGroup.Segments[i].Start;
					end = lightningBoltSegmentGroup.Segments[i].End;
					Vector3 vector = (start + end) * 0.5f;
					vector += this.RandomVector(start, end, offsetAmount);
					lightningBoltSegmentGroup.Segments.Add(new LightningBoltSegment
					{
						Start = start,
						End = vector
					});
					lightningBoltSegmentGroup.Segments.Add(new LightningBoltSegment
					{
						Start = vector,
						End = end
					});
					if (generation > 2 && generation >= totalGenerations - this.forkedness)
					{
						int num2 = this.random.Next(0, generation);
						if (num2 < this.forkedness)
						{
							Vector3 vector2 = vector - start;
							float num3 = (float)this.random.NextDouble() * 0.2f + 0.6f;
							Vector3 end2 = vector + vector2 * num3;
							this.GenerateLightningBolt(vector, end2, generation, totalGenerations, 0f, lineWidth);
						}
					}
				}
				offsetAmount *= 0.5f;
			}
		}

		// Token: 0x0600011B RID: 283 RVA: 0x00009B60 File Offset: 0x00007D60
		private void GetSideVector(ref Vector3 directionNormalized, out Vector3 side)
		{
			if (directionNormalized == Vector3.zero)
			{
				side = Vector3.right;
			}
			else
			{
				float x = directionNormalized.x;
				float y = directionNormalized.y;
				float z = directionNormalized.z;
				float num = Mathf.Abs(x);
				float num2 = Mathf.Abs(y);
				float num3 = Mathf.Abs(z);
				float num4;
				float num5;
				float num6;
				if (num >= num2 && num2 >= num3)
				{
					num4 = 1f;
					num5 = 1f;
					num6 = -(y * num4 + z * num5) / x;
				}
				else if (num2 >= num3)
				{
					num6 = 1f;
					num5 = 1f;
					num4 = -(x * num6 + z * num5) / y;
				}
				else
				{
					num6 = 1f;
					num4 = 1f;
					num5 = -(x * num6 + y * num4) / z;
				}
				Vector3 vector;
				vector..ctor(num6, num4, num5);
				side = vector.normalized;
			}
		}

		// Token: 0x0600011C RID: 284 RVA: 0x00009C4C File Offset: 0x00007E4C
		private Vector3 RandomVector(Vector3 start, Vector3 end, float offsetAmount)
		{
			if (this.camera.orthographic)
			{
				Vector3 normalized = (end - start).normalized;
				Vector3 vector;
				vector..ctor(-normalized.y, normalized.x, normalized.z);
				float num = (float)this.random.NextDouble() * offsetAmount * 2f - offsetAmount;
				return vector * num;
			}
			Vector3 normalized2 = (end - start).normalized;
			Vector3 normalized3 = Vector3.Cross(start, end).normalized;
			float num2 = ((float)this.random.NextDouble() + 0.1f) * offsetAmount;
			float num3 = (float)this.random.NextDouble() * 360f;
			return Quaternion.AngleAxis(num3, normalized2) * normalized3 * num2;
		}

		// Token: 0x04000154 RID: 340
		private const int generationWhereForksStop = 2;

		// Token: 0x04000155 RID: 341
		private static readonly List<LightningBoltSegmentGroup> groupCache = new List<LightningBoltSegmentGroup>();

		// Token: 0x04000156 RID: 342
		private LightningBoltRenderer lightningBoltRenderer;

		// Token: 0x04000157 RID: 343
		private GameObject lightningLightObject;

		// Token: 0x04000158 RID: 344
		private Camera camera;

		// Token: 0x04000159 RID: 345
		private Light lightningLight;

		// Token: 0x0400015A RID: 346
		private LightningBoltScript script;

		// Token: 0x0400015B RID: 347
		private float peakLifeTimeStart;

		// Token: 0x0400015C RID: 348
		private float peakLifeTimeEnd;

		// Token: 0x0400015D RID: 349
		private float chaosFactor;

		// Token: 0x0400015E RID: 350
		private Random random;

		// Token: 0x0400015F RID: 351
		private float intensity;

		// Token: 0x04000160 RID: 352
		private float trunkWidth;

		// Token: 0x04000161 RID: 353
		private int forkedness;

		// Token: 0x04000162 RID: 354
		private float endWidthMultiplier;

		// Token: 0x04000163 RID: 355
		private readonly List<LightningBoltSegmentGroup> segmentGroups = new List<LightningBoltSegmentGroup>();
	}
}
