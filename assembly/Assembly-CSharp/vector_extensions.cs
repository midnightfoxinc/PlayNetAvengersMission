using System;
using UnityEngine;

// Token: 0x0200027B RID: 635
public static class vector_extensions
{
	// Token: 0x06001110 RID: 4368 RVA: 0x00079E8C File Offset: 0x0007808C
	public static Vector3 xzy(this Vector3 v)
	{
		return new Vector3(v.x, v.z, v.y);
	}

	// Token: 0x06001111 RID: 4369 RVA: 0x00079EA8 File Offset: 0x000780A8
	public static Vector3 xzy(this Vector2 v)
	{
		return new Vector3(v.x, 0f, v.y);
	}

	// Token: 0x06001112 RID: 4370 RVA: 0x00079EC4 File Offset: 0x000780C4
	public static Vector2 xz(this Vector3 v)
	{
		return new Vector2(v.x, v.z);
	}
}
