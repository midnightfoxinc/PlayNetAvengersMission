using System;
using UnityEngine;

// Token: 0x02000281 RID: 641
public static class Transform_extensions
{
	// Token: 0x06001123 RID: 4387 RVA: 0x0007A4B4 File Offset: 0x000786B4
	public static void SnapToZero(this Transform source)
	{
		source.localPosition = Vector3.zero;
		source.localScale = Vector3.one;
		source.localRotation = Quaternion.identity;
	}

	// Token: 0x06001124 RID: 4388 RVA: 0x0007A4E4 File Offset: 0x000786E4
	public static void YLookAt(this Transform source, Transform dest)
	{
		Vector3 vector;
		vector..ctor(dest.position.x, source.position.y, dest.position.z);
		source.LookAt(vector);
	}
}
