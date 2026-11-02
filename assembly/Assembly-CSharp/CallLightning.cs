using System;
using System.Collections.Generic;
using DigitalRuby.ThunderAndLightning;
using UnityEngine;

// Token: 0x020001EB RID: 491
public class CallLightning : MonoBehaviour
{
	// Token: 0x06000E4D RID: 3661 RVA: 0x0006485C File Offset: 0x00062A5C
	private void Start()
	{
		this.BoltCount = Random.Range(this.BoltCountMin, this.BoltCountMax);
		if (!this.FromShot)
		{
			for (int i = 0; i <= this.BoltCount; i++)
			{
				GameObject gameObject = globals.armory_main.testfire_scene.LightningTargets[Random.Range(0, globals.armory_main.testfire_scene.LightningTargets.Count - 1)];
				this.impactlocation = gameObject.transform.position;
				this.GetLightning(new Vector3(0.0001f, 0.0001f, 0.0001f), this.impactlocation);
			}
		}
		this.CreationTime = Time.time;
	}

	// Token: 0x06000E4E RID: 3662 RVA: 0x00064910 File Offset: 0x00062B10
	private void Update()
	{
		if (!this.FromImpact && !this.FromShot && Time.time > this.LastTimeLightningFired + this.LightningInterval)
		{
			this.LastTimeLightningFired = Time.time;
			this.LightningInterval = Random.Range(this.LightningIntervalMax, this.LightningIntervalMin);
			GameObject gameObject = globals.armory_main.testfire_scene.LightningTargets[Random.Range(0, globals.armory_main.testfire_scene.LightningTargets.Count - 1)];
			this.impactlocation = gameObject.transform.position;
			this.GetLightning(new Vector3(0.0001f, 0.0001f, 0.0001f), this.impactlocation);
		}
		if (Time.time >= this.CreationTime + this.SelfDestructTime)
		{
			Object.Destroy(base.gameObject);
		}
		if (Input.GetKeyDown(32))
		{
			this.GetLightning(new Vector3(0.0001f, 0.0001f, 0.0001f), new Vector3(0f, 0f, 6.5f));
		}
	}

	// Token: 0x06000E4F RID: 3663 RVA: 0x00064A2C File Offset: 0x00062C2C
	public void GetLightning(Vector3 StartPos, Vector3 EndingPos)
	{
		if (this.LightningChildren != null)
		{
			for (int i = 0; i < this.LightningChildren.Count; i++)
			{
				if (this.LightningChildren[i] != null)
				{
					this.LightningChildren[i].GetLightning(StartPos, EndingPos);
				}
			}
		}
		LightningBoltScript component = base.gameObject.GetComponent<LightningBoltScript>();
		if (!component)
		{
			return;
		}
		int num = 9;
		float num2 = 0f;
		Random random = new Random();
		Vector3 start = default(Vector3);
		Vector3 end = default(Vector3);
		float num3;
		if (this.FromImpact)
		{
			start = StartPos;
			end = this.impactlocation + new Vector3(0f, 1f, -6f);
			num3 = 4f;
			globals.debug("In from impact");
		}
		else if (this.FromShot)
		{
			start = StartPos;
			end = EndingPos;
			num3 = this.SystemDuration;
		}
		else
		{
			start = StartPos;
			end = EndingPos;
			num3 = this.SystemDuration;
		}
		int generations = 6;
		float chaosFactor = 0.15096828f;
		float boltTrunkSize = this.BoltTrunkSize;
		float glowIntensity = 0.125f;
		float glowWidthMultiplier = 2.539676f;
		float forkedness = 0.3f;
		float num4 = num3 / (float)num;
		while (num-- > 0)
		{
			LightningBoltParameters p = new LightningBoltParameters
			{
				Camera = Camera.main,
				Start = start,
				End = end,
				Generations = generations,
				LifeTime = ((num != 1) ? (num4 * ((float)random.NextDouble() * 0.4f + 0.8f)) : num4),
				Delay = num2,
				ChaosFactor = chaosFactor,
				PointLightIntensity = 0f,
				TrunkWidth = boltTrunkSize,
				GlowIntensity = glowIntensity,
				GlowWidthMultiplier = glowWidthMultiplier,
				Forkedness = forkedness,
				Random = random
			};
			component.CreateLightningBolt(p);
			num2 += num4 * ((float)random.NextDouble() * 0.4f + 0.3f);
		}
	}

	// Token: 0x04000E04 RID: 3588
	private Vector3 impactlocation;

	// Token: 0x04000E05 RID: 3589
	public float LightningIntervalMax = 0.15f;

	// Token: 0x04000E06 RID: 3590
	public float LightningIntervalMin = 0.05f;

	// Token: 0x04000E07 RID: 3591
	private float LightningInterval = 0.1f;

	// Token: 0x04000E08 RID: 3592
	private float LastTimeLightningFired;

	// Token: 0x04000E09 RID: 3593
	public bool FromImpact;

	// Token: 0x04000E0A RID: 3594
	public bool FromShot;

	// Token: 0x04000E0B RID: 3595
	public int BoltCountMax = 20;

	// Token: 0x04000E0C RID: 3596
	public int BoltCountMin = 10;

	// Token: 0x04000E0D RID: 3597
	public float BoltTrunkSize = 0.0180461f;

	// Token: 0x04000E0E RID: 3598
	public float SystemDuration = 0.5658741f;

	// Token: 0x04000E0F RID: 3599
	public float CreationTime;

	// Token: 0x04000E10 RID: 3600
	public float SelfDestructTime = 5f;

	// Token: 0x04000E11 RID: 3601
	private int BoltCount;

	// Token: 0x04000E12 RID: 3602
	public List<CallLightning> LightningChildren;
}
