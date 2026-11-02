using System;
using UnityEngine;

// Token: 0x02000158 RID: 344
public class CameraShakenBehavior : MonoBehaviour
{
	// Token: 0x06000B18 RID: 2840 RVA: 0x00051CB8 File Offset: 0x0004FEB8
	private void Start()
	{
		this.ResetOrigin();
	}

	// Token: 0x06000B19 RID: 2841 RVA: 0x00051CC0 File Offset: 0x0004FEC0
	public void ResetOrigin()
	{
		this._origin = base.transform.localPosition;
	}

	// Token: 0x06000B1A RID: 2842 RVA: 0x00051CD4 File Offset: 0x0004FED4
	private void OnCameraShake(Vector2 amt)
	{
		base.transform.localPosition = this._origin + new Vector3(amt.x * this.xInfluence, amt.y * this.yInfluence, 0f);
	}

	// Token: 0x04000A99 RID: 2713
	public float xInfluence = 1f;

	// Token: 0x04000A9A RID: 2714
	public float yInfluence = 1f;

	// Token: 0x04000A9B RID: 2715
	private Vector3 _origin;
}
