using System;
using UnityEngine;

// Token: 0x0200027F RID: 639
public static class GameObject_extensions
{
	// Token: 0x06001121 RID: 4385 RVA: 0x0007A3FC File Offset: 0x000785FC
	public static void SetLayerRecursively(this GameObject go, int layerNumber)
	{
		go.layer = layerNumber;
		for (int i = 0; i < go.transform.childCount; i++)
		{
			go.transform.GetChild(i).gameObject.SetLayerRecursively(layerNumber);
		}
	}
}
