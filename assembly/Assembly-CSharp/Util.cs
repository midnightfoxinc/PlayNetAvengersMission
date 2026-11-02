using System;
using UnityEngine;

// Token: 0x0200030C RID: 780
public class Util
{
	// Token: 0x06001450 RID: 5200 RVA: 0x0009217C File Offset: 0x0009037C
	public static float EaseIn(float a, float b, float x)
	{
		return Mathf.Lerp(a, b, 1f - Mathf.Cos(x * 3.1415927f / 2f));
	}

	// Token: 0x06001451 RID: 5201 RVA: 0x000921A0 File Offset: 0x000903A0
	public static float EaseOut(float a, float b, float x)
	{
		return Mathf.Lerp(a, b, Mathf.Sin(x * 3.1415927f / 2f));
	}

	// Token: 0x06001452 RID: 5202 RVA: 0x000921BC File Offset: 0x000903BC
	public static float Wrap(float x, float a, float b)
	{
		if (x < a)
		{
			float num = b - a;
			return a + (num - (a - x) % num);
		}
		if (x > b)
		{
			return a + (x - a) % (b - a);
		}
		return x;
	}

	// Token: 0x06001453 RID: 5203 RVA: 0x000921F0 File Offset: 0x000903F0
	public static string[] StringSplitNoBlanks(string str, char[] ch)
	{
		return str.Split(ch, 1);
	}
}
