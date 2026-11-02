using System;
using System.Collections;
using UnityEngine;

namespace DigitalRuby.ThunderAndLightning
{
	// Token: 0x0200002A RID: 42
	public class ThunderAndLightningScript : MonoBehaviour
	{
		// Token: 0x06000122 RID: 290 RVA: 0x00009F54 File Offset: 0x00008154
		private void Start()
		{
			if (this.Camera == null)
			{
				this.Camera = Camera.main;
			}
			if (this.Camera.farClipPlane < 10000f)
			{
				Debug.LogWarning("Far clip plane should be 10000+ for best lightning effects");
			}
			if (RenderSettings.skybox != null)
			{
				Material skybox = new Material(RenderSettings.skybox);
				RenderSettings.skybox = skybox;
				this.skyboxMaterial = skybox;
			}
			this.skyboxExposureOriginal = (this.skyboxExposureStorm = ((!(this.skyboxMaterial == null)) ? this.skyboxMaterial.GetFloat("_Exposure") : 1f));
			this.audioSourceThunder = base.gameObject.AddComponent<AudioSource>();
			this.lightningBoltHandler = new ThunderAndLightningScript.LightningBoltHandler(this);
		}

		// Token: 0x06000123 RID: 291 RVA: 0x0000A01C File Offset: 0x0000821C
		private void Update()
		{
			if (this.lightningBoltHandler != null)
			{
				this.lightningBoltHandler.Update();
			}
		}

		// Token: 0x06000124 RID: 292 RVA: 0x0000A034 File Offset: 0x00008234
		public void CallNormalLightning()
		{
			base.StartCoroutine(this.lightningBoltHandler.ProcessLightning(false, true));
		}

		// Token: 0x06000125 RID: 293 RVA: 0x0000A04C File Offset: 0x0000824C
		public void CallIntenseLightning()
		{
			base.StartCoroutine(this.lightningBoltHandler.ProcessLightning(true, true));
		}

		// Token: 0x17000015 RID: 21
		// (get) Token: 0x06000126 RID: 294 RVA: 0x0000A064 File Offset: 0x00008264
		public float SkyboxExposureOriginal
		{
			get
			{
				return this.skyboxExposureOriginal;
			}
		}

		// Token: 0x04000176 RID: 374
		[Tooltip("Lightning bolt script - optional, leave null if you don't want lightning bolts")]
		public LightningBoltScript LightningBoltScript;

		// Token: 0x04000177 RID: 375
		[Tooltip("Camera where the lightning should be centered over. Defaults to main camera.")]
		public Camera Camera;

		// Token: 0x04000178 RID: 376
		[Tooltip("Random duration that the scene will light up - intense lightning extends this a little.")]
		public Vector2 LightningShowTimeRange = new Vector2(0.2f, 0.5f);

		// Token: 0x04000179 RID: 377
		[Tooltip("Random interval between strikes.")]
		public Vector2 LightningIntervalTimeRange = new Vector2(10f, 25f);

		// Token: 0x0400017A RID: 378
		[Range(0f, 1f)]
		[Tooltip("Probability (0-1) of an intense lightning bolt that hits really close. Intense lightning has increased brightness and louder thunder compared to normal lightning, and the thunder sounds plays a lot sooner.")]
		public float LightningIntenseProbability = 0.2f;

		// Token: 0x0400017B RID: 379
		[Tooltip("Sounds to play for normal thunder. One will be chosen at random for each lightning strike. Depending on intensity, some normal lightning may not play a thunder sound.")]
		public AudioClip[] ThunderSoundsNormal;

		// Token: 0x0400017C RID: 380
		[Tooltip("Sounds to play for intense thunder. One will be chosen at random for each lightning strike.")]
		public AudioClip[] ThunderSoundsIntense;

		// Token: 0x0400017D RID: 381
		[Tooltip("Whether lightning strikes should always try to be in the camera view")]
		public bool LightningAlwaysVisible = true;

		// Token: 0x0400017E RID: 382
		[Tooltip("The chance lightning will simply be in the clouds with no visible bolt")]
		[Range(0f, 1f)]
		public float CloudLightningChance = 0.5f;

		// Token: 0x0400017F RID: 383
		[Tooltip("Whether to modify the skybox exposure when lightning is created")]
		public bool ModifySkyboxExposure;

		// Token: 0x04000180 RID: 384
		[Tooltip("How much the lightning should glow, 0 for none 1 for full glow")]
		[Range(0f, 1f)]
		public float GlowIntensity = 0.1f;

		// Token: 0x04000181 RID: 385
		[Tooltip("How the glow width should be multiplied, 0 for none, 64 is max")]
		[Range(0f, 64f)]
		public float GlowWidthMultiplier = 4f;

		// Token: 0x04000182 RID: 386
		[Range(0f, 1f)]
		[Tooltip("How forked the lightning should be. 0 for none, 1 for LOTS of forks.")]
		public float Forkedness = 0.5f;

		// Token: 0x04000183 RID: 387
		[Range(0f, 1f)]
		[Tooltip("How chaotic is the lightning? Higher numbers make more chaotic lightning.")]
		public float ChaosFactor = 0.2f;

		// Token: 0x04000184 RID: 388
		[Range(4f, 8f)]
		[Tooltip("Number of generations. The higher the number, the more detailed the lightning is, but more expensive to create.")]
		public int Generations = 6;

		// Token: 0x04000185 RID: 389
		private float skyboxExposureOriginal;

		// Token: 0x04000186 RID: 390
		private float skyboxExposureStorm;

		// Token: 0x04000187 RID: 391
		private float nextLightningTime;

		// Token: 0x04000188 RID: 392
		private float lightningDuration;

		// Token: 0x04000189 RID: 393
		private bool lightningInProgress;

		// Token: 0x0400018A RID: 394
		private AudioSource audioSourceThunder;

		// Token: 0x0400018B RID: 395
		private ThunderAndLightningScript.LightningBoltHandler lightningBoltHandler;

		// Token: 0x0400018C RID: 396
		private Material skyboxMaterial;

		// Token: 0x0400018D RID: 397
		private AudioClip lastThunderSound;

		// Token: 0x0200002B RID: 43
		private class LightningBoltHandler
		{
			// Token: 0x06000127 RID: 295 RVA: 0x0000A06C File Offset: 0x0000826C
			public LightningBoltHandler(ThunderAndLightningScript script)
			{
				this.script = script;
				this.CalculateNextLightningTime();
			}

			// Token: 0x06000128 RID: 296 RVA: 0x0000A084 File Offset: 0x00008284
			private void UpdateLighting()
			{
				if (this.script.lightningInProgress)
				{
					return;
				}
				if (this.script.ModifySkyboxExposure)
				{
					this.script.skyboxExposureStorm = 0.35f;
					if (this.script.skyboxMaterial != null)
					{
						this.script.skyboxMaterial.SetFloat("_Exposure", this.script.skyboxExposureStorm);
					}
				}
				this.CheckForLightning();
			}

			// Token: 0x06000129 RID: 297 RVA: 0x0000A100 File Offset: 0x00008300
			private void CalculateNextLightningTime()
			{
				this.script.nextLightningTime = Time.time + Random.Range(this.script.LightningIntervalTimeRange.x, this.script.LightningIntervalTimeRange.y);
				this.script.lightningInProgress = false;
				if (this.script.ModifySkyboxExposure)
				{
					this.script.skyboxMaterial.SetFloat("_Exposure", this.script.skyboxExposureStorm);
				}
			}

			// Token: 0x0600012A RID: 298 RVA: 0x0000A180 File Offset: 0x00008380
			private IEnumerator CalculateNextLightningLater(float duration)
			{
				yield return new WaitForSeconds(duration);
				this.CalculateNextLightningTime();
				yield break;
			}

			// Token: 0x0600012B RID: 299 RVA: 0x0000A1AC File Offset: 0x000083AC
			public IEnumerator ProcessLightning(bool intense, bool visible)
			{
				this.script.lightningInProgress = true;
				float intensity;
				float sleepTime;
				AudioClip[] sounds;
				if (intense)
				{
					float percent = Random.Range(0f, 1f);
					intensity = Mathf.Lerp(2f, 8f, percent);
					sleepTime = 5f / intensity;
					this.script.lightningDuration = Random.Range(this.script.LightningShowTimeRange.x, this.script.LightningShowTimeRange.y);
					sounds = this.script.ThunderSoundsIntense;
				}
				else
				{
					float percent2 = Random.Range(0f, 1f);
					intensity = Mathf.Lerp(0f, 2f, percent2);
					sleepTime = 30f / intensity;
					this.script.lightningDuration = Random.Range(this.script.LightningShowTimeRange.x, this.script.LightningShowTimeRange.y);
					sounds = this.script.ThunderSoundsNormal;
				}
				if (this.script.skyboxMaterial != null && this.script.ModifySkyboxExposure)
				{
					this.script.skyboxMaterial.SetFloat("_Exposure", Mathf.Max(intensity * 0.5f, this.script.skyboxExposureStorm));
				}
				int num = Random.Range(0, 100);
				int count;
				if (num > 95)
				{
					count = 3;
				}
				else if (num > 80)
				{
					count = 2;
				}
				else
				{
					count = 1;
				}
				float duration = (count != 1) ? (this.script.lightningDuration / (float)count * Random.Range(1.05f, 1.25f)) : this.script.lightningDuration;
				this.script.lightningDuration *= (float)count;
				this.Strike(intense, this.script.Generations, duration, intensity, this.script.ChaosFactor, this.script.GlowIntensity, this.script.GlowWidthMultiplier, this.script.Forkedness, count, this.script.Camera, (!visible) ? null : this.script.Camera);
				this.script.StartCoroutine(this.CalculateNextLightningLater(duration));
				bool playThunder = intensity >= 1f;
				if (playThunder && sounds != null && sounds.Length != 0)
				{
					yield return new WaitForSeconds(sleepTime);
					AudioClip clip = null;
					do
					{
						clip = sounds[Random.Range(0, sounds.Length - 1)];
					}
					while (sounds.Length > 1 && clip == this.script.lastThunderSound);
					this.script.lastThunderSound = clip;
					this.script.audioSourceThunder.PlayOneShot(clip, intensity * 0.5f);
				}
				yield break;
			}

			// Token: 0x0600012C RID: 300 RVA: 0x0000A1E4 File Offset: 0x000083E4
			private void Strike(bool intense, int generations, float duration, float intensity, float chaosFactor, float glowIntensity, float glowWidth, float forkedness, int count, Camera camera, Camera visibleInCamera)
			{
				if (count < 1)
				{
					return;
				}
				Random random = new Random();
				float num = (!intense) ? -5000f : -1000f;
				float num2 = (!intense) ? 5000f : 1000f;
				float num3 = (!intense) ? 2500f : 500f;
				float num4 = (Random.Range(0, 2) != 0) ? Random.Range(num3, num2) : Random.Range(num, -num3);
				float y = 620f;
				float num5 = (Random.Range(0, 2) != 0) ? Random.Range(num3, num2) : Random.Range(num, -num3);
				float num6 = 0f;
				Vector3 vector = this.script.Camera.transform.position;
				vector.x += num4;
				vector.y = y;
				vector.z += num5;
				if (visibleInCamera != null)
				{
					Quaternion rotation = visibleInCamera.transform.rotation;
					visibleInCamera.transform.rotation = Quaternion.Euler(0f, rotation.eulerAngles.y, 0f);
					float num7 = Random.Range((float)visibleInCamera.pixelWidth * 0.1f, (float)visibleInCamera.pixelWidth * 0.9f);
					float num8 = Random.Range(visibleInCamera.nearClipPlane + num3 + num3, num2);
					Vector3 vector2 = visibleInCamera.ScreenToWorldPoint(new Vector3(num7, 0f, num8));
					vector = vector2;
					vector.y = y;
					visibleInCamera.transform.rotation = rotation;
				}
				while (count-- > 0)
				{
					Vector3 vector3 = vector;
					num4 = Random.Range(-100f, 100f);
					y = ((Random.Range(0, 4) != 0) ? -1f : Random.Range(-1f, 600f));
					num5 += Random.Range(-100f, 100f);
					vector3.x += num4;
					vector3.y = y;
					vector3.z += num5;
					vector3.x += num3 * camera.transform.forward.x;
					vector3.z += num3 * camera.transform.forward.z;
					while ((vector - vector3).magnitude < 500f)
					{
						vector3.x += num3 * camera.transform.forward.x;
						vector3.z += num3 * camera.transform.forward.z;
					}
					if (this.script.LightningBoltScript != null)
					{
						if (Random.value < this.script.CloudLightningChance)
						{
							generations = 0;
						}
						LightningBoltParameters p = new LightningBoltParameters
						{
							Camera = camera,
							Start = vector,
							End = vector3,
							Generations = generations,
							LifeTime = duration,
							Delay = num6,
							ChaosFactor = chaosFactor,
							PointLightIntensity = intensity,
							TrunkWidth = 0f,
							EndWidthMultiplier = 0.25f,
							GlowIntensity = glowIntensity,
							GlowWidthMultiplier = glowWidth,
							Forkedness = forkedness,
							Random = random
						};
						this.script.LightningBoltScript.CreateLightningBolt(p);
						num6 += duration / (float)count * Random.Range(0.2f, 0.5f);
					}
				}
			}

			// Token: 0x0600012D RID: 301 RVA: 0x0000A5B4 File Offset: 0x000087B4
			private void CheckForLightning()
			{
				if (Time.time >= this.script.nextLightningTime)
				{
					bool intense = Random.value < this.script.LightningIntenseProbability;
					this.script.StartCoroutine(this.ProcessLightning(intense, this.script.LightningAlwaysVisible));
				}
			}

			// Token: 0x0600012E RID: 302 RVA: 0x0000A608 File Offset: 0x00008808
			public void Update()
			{
				this.UpdateLighting();
			}

			// Token: 0x0400018E RID: 398
			private ThunderAndLightningScript script;
		}
	}
}
