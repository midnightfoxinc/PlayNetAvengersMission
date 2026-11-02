using System;
using UnityEngine;

// Token: 0x020001FD RID: 509
public class RandomRotation : MonoBehaviour
{
	// Token: 0x06000E88 RID: 3720 RVA: 0x000661EC File Offset: 0x000643EC
	private void Start()
	{
		base.transform.eulerAngles = new Vector3(Random.Range(this.Min, this.Max) * this.RotationVector.x, Random.Range(this.Min, this.Max) * this.RotationVector.y, Random.Range(this.Min, this.Max) * this.RotationVector.z);
	}

	// Token: 0x06000E89 RID: 3721 RVA: 0x00066260 File Offset: 0x00064460
	private void Update()
	{
	}

	// Token: 0x04000E6A RID: 3690
	public Vector3 RotationVector;

	// Token: 0x04000E6B RID: 3691
	public float Min;

	// Token: 0x04000E6C RID: 3692
	public float Max;
}
