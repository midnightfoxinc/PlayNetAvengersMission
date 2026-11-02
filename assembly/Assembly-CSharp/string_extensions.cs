using System;
using System.Collections.Generic;
using System.Globalization;

// Token: 0x0200027C RID: 636
public static class string_extensions
{
	// Token: 0x06001113 RID: 4371 RVA: 0x00079EDC File Offset: 0x000780DC
	public static string shift(this string s, int length)
	{
		string result;
		if (s.Length > length)
		{
			result = s.Substring(0, length);
			s = s.Substring(length);
		}
		else
		{
			result = s;
			s = string.Empty;
		}
		return result;
	}

	// Token: 0x06001114 RID: 4372 RVA: 0x00079F18 File Offset: 0x00078118
	public static int[] ToIntArray(this string s, char separator)
	{
		s = s.Trim();
		List<int> list = new List<int>();
		string[] array = s.Split(new char[]
		{
			separator
		});
		for (int i = 0; i < array.Length; i++)
		{
			if (!string.IsNullOrEmpty(array[i]))
			{
				list.Add(Convert.ToInt32(array[i]));
			}
		}
		return list.ToArray();
	}

	// Token: 0x06001115 RID: 4373 RVA: 0x00079F7C File Offset: 0x0007817C
	public static float[] ToFloatArray(this string s, char separator)
	{
		s = s.Trim();
		List<float> list = new List<float>();
		string[] array = s.Split(new char[]
		{
			separator
		});
		for (int i = 0; i < array.Length; i++)
		{
			if (!string.IsNullOrEmpty(array[i]))
			{
				list.Add(float.Parse(array[i], CultureInfo.InvariantCulture.NumberFormat));
			}
		}
		return list.ToArray();
	}

	// Token: 0x06001116 RID: 4374 RVA: 0x00079FE8 File Offset: 0x000781E8
	public static string break_every_n(this string s, int n, string break_string = " ")
	{
		if (n < 1)
		{
			return s;
		}
		for (int i = n; i < s.Length; i += n)
		{
			s = s.Insert(i, break_string);
			i += break_string.Length;
		}
		return s;
	}
}
