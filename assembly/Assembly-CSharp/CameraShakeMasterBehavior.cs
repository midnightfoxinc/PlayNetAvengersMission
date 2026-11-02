using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000156 RID: 342
public class CameraShakeMasterBehavior : MonoBehaviour
{
	// Token: 0x06000B13 RID: 2835 RVA: 0x00051B18 File Offset: 0x0004FD18
	private void Awake()
	{
		CameraShakeMasterBehavior._instance = this;
	}

	// Token: 0x06000B14 RID: 2836 RVA: 0x00051B20 File Offset: 0x0004FD20
	public void TriggerShake(float magnitude, float duration)
	{
		this._shakes.Add(new CameraShakeMasterBehavior.Shake(magnitude, duration));
	}

	// Token: 0x06000B15 RID: 2837 RVA: 0x00051B34 File Offset: 0x0004FD34
	private void Update()
	{
		Vector2 vector = Vector3.zero;
		List<CameraShakeMasterBehavior.Shake> list = new List<CameraShakeMasterBehavior.Shake>();
		for (int i = 0; i < this._shakes.Count; i++)
		{
			CameraShakeMasterBehavior.Shake shake = this._shakes[i];
			if (shake.lifetime <= 0f)
			{
				list.Add(shake);
			}
			else
			{
				float num = PerlinNoise.Perlin1D(Time.time * this.perlinScale, this.perlinPersistence, this.perlinOctaves);
				float num2 = PerlinNoise.Perlin1D((Time.time + 1000000f) * this.perlinScale, this.perlinPersistence, this.perlinOctaves);
				vector += new Vector2(num, num2) * shake.magnitude * Util.EaseIn(0f, 1f, shake.lifetime / shake.duration);
				shake.lifetime -= Time.deltaTime;
			}
		}
		for (int j = 0; j < list.Count; j++)
		{
			this._shakes.Remove(list[j]);
		}
		base.BroadcastMessage("OnCameraShake", vector, 1);
	}

	// Token: 0x04000A91 RID: 2705
	public static CameraShakeMasterBehavior _instance;

	// Token: 0x04000A92 RID: 2706
	public float perlinScale = 12f;

	// Token: 0x04000A93 RID: 2707
	public float perlinPersistence = 0.6f;

	// Token: 0x04000A94 RID: 2708
	public int perlinOctaves = 6;

	// Token: 0x04000A95 RID: 2709
	private List<CameraShakeMasterBehavior.Shake> _shakes = new List<CameraShakeMasterBehavior.Shake>();

	// Token: 0x02000157 RID: 343
	private class Shake
	{
		// Token: 0x06000B16 RID: 2838 RVA: 0x00051C6C File Offset: 0x0004FE6C
		public Shake(float m, float d)
		{
			this.magnitude = m;
			this.duration = d;
			this.lifetime = d;
		}

		// Token: 0x04000A96 RID: 2710
		public float magnitude;

		// Token: 0x04000A97 RID: 2711
		public float lifetime;

		// Token: 0x04000A98 RID: 2712
		public float duration;
	}
}
