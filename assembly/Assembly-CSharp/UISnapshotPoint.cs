using System;
using UnityEngine;

// Token: 0x020000F6 RID: 246
[AddComponentMenu("NGUI/Internal/Snapshot Point")]
[ExecuteInEditMode]
public class UISnapshotPoint : MonoBehaviour
{
	// Token: 0x0600074F RID: 1871 RVA: 0x00036E9C File Offset: 0x0003509C
	private void Start()
	{
		if (base.tag != "EditorOnly")
		{
			base.tag = "EditorOnly";
		}
	}

	// Token: 0x040006F5 RID: 1781
	public bool isOrthographic = true;

	// Token: 0x040006F6 RID: 1782
	public float nearClip = -100f;

	// Token: 0x040006F7 RID: 1783
	public float farClip = 100f;

	// Token: 0x040006F8 RID: 1784
	[Range(10f, 80f)]
	public int fieldOfView = 35;

	// Token: 0x040006F9 RID: 1785
	public float orthoSize = 30f;

	// Token: 0x040006FA RID: 1786
	public Texture2D thumbnail;
}
