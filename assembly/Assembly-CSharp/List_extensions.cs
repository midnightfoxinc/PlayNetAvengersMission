using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200027D RID: 637
public static class List_extensions
{
	// Token: 0x06001117 RID: 4375 RVA: 0x0007A02C File Offset: 0x0007822C
	public static void Swap<T>(this List<T> source, int index1, int index2)
	{
		if (index1 < 0 || index1 > source.Count)
		{
			return;
		}
		if (index2 < 0 || index2 > source.Count)
		{
			return;
		}
		if (index1 == index2)
		{
			return;
		}
		T t = source[index1];
		source[index1] = source[index2];
		source[index2] = t;
	}

	// Token: 0x06001118 RID: 4376 RVA: 0x0007A088 File Offset: 0x00078288
	public static void Shuffle<T>(this List<T> source)
	{
		for (int i = 0; i < source.Count; i++)
		{
			int num = UnityEngine.Random.Range(0, source.Count);
			T t = source[i];
			source[i] = source[num];
			source[num] = t;
		}
	}

	// Token: 0x06001119 RID: 4377 RVA: 0x0007A0D8 File Offset: 0x000782D8
	public static T Last<T>(this List<T> source)
	{
		if (source.Count < 1)
		{
			return default(T);
		}
		return source[source.Count - 1];
	}

	// Token: 0x0600111A RID: 4378 RVA: 0x0007A10C File Offset: 0x0007830C
	public static T Random<T>(this List<T> source)
	{
		if (source.Count < 1)
		{
			return default(T);
		}
		if (source.Count == 1)
		{
			return source[0];
		}
		return source[UnityEngine.Random.Range(0, source.Count)];
	}

	// Token: 0x0600111B RID: 4379 RVA: 0x0007A158 File Offset: 0x00078358
	public static T Shift<T>(this List<T> source)
	{
		if (source.Count < 1)
		{
			return default(T);
		}
		T result = source[0];
		source.RemoveAt(0);
		return result;
	}

	// Token: 0x0600111C RID: 4380 RVA: 0x0007A18C File Offset: 0x0007838C
	public static T Pop<T>(this List<T> source)
	{
		if (source.Count < 1)
		{
			return default(T);
		}
		T result = source[source.Count - 1];
		source.RemoveAt(source.Count - 1);
		return result;
	}

	// Token: 0x0600111D RID: 4381 RVA: 0x0007A1D0 File Offset: 0x000783D0
	public static void Unshift<T>(this List<T> source, T item)
	{
		if (source.Count < 1)
		{
			source.Add(item);
			return;
		}
		source.Add(item);
		for (int i = source.Count - 1; i > 0; i--)
		{
			source[i] = source[i - 1];
		}
		source[0] = item;
	}
}
