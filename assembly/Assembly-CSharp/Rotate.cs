using System;
using UnityEngine;

// Token: 0x0200020C RID: 524
public class Rotate : MonoBehaviour
{
	// Token: 0x06000ED0 RID: 3792 RVA: 0x000694C0 File Offset: 0x000676C0
	private void Start()
	{
		this.BornTime = Time.time;
		float num = 1f;
		if (this.RandomRotationOnAxis)
		{
			if (Random.Range(0f, 100f) > 50f)
			{
				num = -1f;
			}
			else
			{
				num = 1f;
			}
		}
		this.RotationSpeedOnVector = new Vector3(num * Random.Range(this.RotationSpeedOnVectorMin.x, this.RotationSpeedOnVectorMax.x), num * Random.Range(this.RotationSpeedOnVectorMin.y, this.RotationSpeedOnVectorMax.y), num * Random.Range(this.RotationSpeedOnVectorMin.z, this.RotationSpeedOnVectorMax.z));
		this.StartRotation = this.RotationSpeedOnVector;
		if (this.LerpRotation)
		{
			this.RotationSpeedOnVector = Vector3.zero;
		}
	}

	// Token: 0x06000ED1 RID: 3793 RVA: 0x00069598 File Offset: 0x00067798
	private void Update()
	{
		if (Time.time > this.BornTime + this.DelayRotation)
		{
			if (this.LerpRotation)
			{
				this.RotationSpeedOnVector = Vector3.Lerp(this.RotationSpeedOnVector, this.StartRotation, Time.deltaTime * this.LerpSpeed);
			}
			base.transform.Rotate(this.RotationSpeedOnVector * Time.deltaTime);
		}
	}

	// Token: 0x04000F3C RID: 3900
	public Vector3 RotationSpeedOnVectorMin;

	// Token: 0x04000F3D RID: 3901
	public Vector3 RotationSpeedOnVectorMax;

	// Token: 0x04000F3E RID: 3902
	public bool RandomRotationOnAxis = true;

	// Token: 0x04000F3F RID: 3903
	private Vector3 RotationSpeedOnVector;

	// Token: 0x04000F40 RID: 3904
	private Vector3 StartRotation;

	// Token: 0x04000F41 RID: 3905
	public float DelayRotation;

	// Token: 0x04000F42 RID: 3906
	private float BornTime;

	// Token: 0x04000F43 RID: 3907
	public bool LerpRotation;

	// Token: 0x04000F44 RID: 3908
	public float LerpSpeed;
}
