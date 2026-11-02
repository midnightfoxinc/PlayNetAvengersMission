using System;
using UnityEngine;

// Token: 0x020000E8 RID: 232
public class RealTime : MonoBehaviour
{
	// Token: 0x17000085 RID: 133
	// (get) Token: 0x060006B4 RID: 1716 RVA: 0x000315D0 File Offset: 0x0002F7D0
	public static float time
	{
		get
		{
			return Time.unscaledTime;
		}
	}

	// Token: 0x17000086 RID: 134
	// (get) Token: 0x060006B5 RID: 1717 RVA: 0x000315D8 File Offset: 0x0002F7D8
	public static float deltaTime
	{
		get
		{
			return Time.unscaledDeltaTime;
		}
	}
}
