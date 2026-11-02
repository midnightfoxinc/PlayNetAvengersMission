using System;
using UnityEngine;

// Token: 0x0200004B RID: 75
public static class ComponentExtensions
{
	// Token: 0x06000295 RID: 661 RVA: 0x000111D8 File Offset: 0x0000F3D8
	public static RectTransform rectTransform(this Component cp)
	{
		return cp.transform as RectTransform;
	}

	// Token: 0x06000296 RID: 662 RVA: 0x000111E8 File Offset: 0x0000F3E8
	public static float Remap(this float value, float from1, float to1, float from2, float to2)
	{
		return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
	}
}
