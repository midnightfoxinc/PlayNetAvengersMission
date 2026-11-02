using System;
using UnityEngine;

// Token: 0x02000152 RID: 338
public class RandomRotateOnStart : MonoBehaviour
{
	// Token: 0x06000AFD RID: 2813 RVA: 0x0004FF3C File Offset: 0x0004E13C
	private void Start()
	{
		this.t = base.transform;
		this.t.Rotate(this.NormalizedRotateVector * (float)Random.Range(0, 360));
		this.isInitialized = true;
	}

	// Token: 0x06000AFE RID: 2814 RVA: 0x0004FF74 File Offset: 0x0004E174
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.t.Rotate(this.NormalizedRotateVector * (float)Random.Range(0, 360));
		}
	}

	// Token: 0x04000A75 RID: 2677
	public Vector3 NormalizedRotateVector = new Vector3(0f, 1f, 0f);

	// Token: 0x04000A76 RID: 2678
	private Transform t;

	// Token: 0x04000A77 RID: 2679
	private bool isInitialized;
}
