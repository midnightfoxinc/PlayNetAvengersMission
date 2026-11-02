using System;
using UnityEngine;

// Token: 0x0200030D RID: 781
public class PerlinNoise
{
	// Token: 0x06001455 RID: 5205 RVA: 0x00092204 File Offset: 0x00090404
	private static float Noise(int x)
	{
		x = (x << 13 ^ x);
		return 1f - (float)(x * (x * x * 15731 + 789221) + 1376312589 & int.MaxValue) / 1.0737418E+09f;
	}

	// Token: 0x06001456 RID: 5206 RVA: 0x00092244 File Offset: 0x00090444
	private static float SmoothedNoise(int x)
	{
		return PerlinNoise.Noise(x) / 2f + PerlinNoise.Noise(x - 1) / 4f + PerlinNoise.Noise(x + 1) / 4f;
	}

	// Token: 0x06001457 RID: 5207 RVA: 0x0009227C File Offset: 0x0009047C
	private static float InterpolatedNoise(float x)
	{
		int num = (int)x;
		float num2 = x - (float)num;
		float num3 = PerlinNoise.SmoothedNoise(num);
		float num4 = PerlinNoise.SmoothedNoise(num + 1);
		return Mathf.Lerp(num3, num4, num2);
	}

	// Token: 0x06001458 RID: 5208 RVA: 0x000922AC File Offset: 0x000904AC
	public static float Perlin1D(float x, float persistence = 0.5f, int octaves = 6)
	{
		float num = 0f;
		int num2 = octaves - 1;
		for (int i = 0; i < num2; i++)
		{
			float num3 = Mathf.Pow(2f, (float)i);
			float num4 = Mathf.Pow(persistence, (float)i);
			num += PerlinNoise.InterpolatedNoise(x * num3) * num4;
		}
		return num;
	}
}
