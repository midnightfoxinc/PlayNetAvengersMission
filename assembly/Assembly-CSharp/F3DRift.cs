using System;
using UnityEngine;

// Token: 0x02000012 RID: 18
public class F3DRift : MonoBehaviour
{
	// Token: 0x06000084 RID: 132 RVA: 0x00005CB4 File Offset: 0x00003EB4
	private void Start()
	{
		this.dScale = base.transform.localScale;
	}

	// Token: 0x06000085 RID: 133 RVA: 0x00005CC8 File Offset: 0x00003EC8
	private void Update()
	{
		base.transform.rotation = base.transform.rotation * Quaternion.Euler(0f, 0f, this.RotationSpeed * Time.deltaTime);
		base.transform.localScale = new Vector3(this.dScale.x, this.dScale.y, this.dScale.z + Mathf.Sin(Time.time * this.MorphSpeed) * this.MorphFactor);
	}

	// Token: 0x040000DA RID: 218
	public float RotationSpeed;

	// Token: 0x040000DB RID: 219
	public float MorphSpeed;

	// Token: 0x040000DC RID: 220
	public float MorphFactor;

	// Token: 0x040000DD RID: 221
	private Vector3 dScale;
}
