using System;
using UnityEngine;

// Token: 0x020001B3 RID: 435
public class ConstantSpinBehavior : MonoBehaviour
{
	// Token: 0x06000CE5 RID: 3301 RVA: 0x0005D6B8 File Offset: 0x0005B8B8
	private void Start()
	{
		this._previous_time = Time.time;
		float num = (!this.randomStartRot || this.speed.x == 0f) ? base.transform.localEulerAngles.x : ((float)Random.Range(0, 360));
		float num2 = (!this.randomStartRot || this.speed.y == 0f) ? base.transform.localEulerAngles.y : ((float)Random.Range(0, 360));
		float num3 = (!this.randomStartRot || this.speed.z == 0f) ? base.transform.localEulerAngles.z : ((float)Random.Range(0, 360));
		base.transform.localEulerAngles = new Vector3(num, num2, num3);
	}

	// Token: 0x06000CE6 RID: 3302 RVA: 0x0005D7B4 File Offset: 0x0005B9B4
	private void FixedUpdate()
	{
		float num;
		if (this.ignoreTimescale)
		{
			num = Time.realtimeSinceStartup - this._previous_time;
			this._previous_time = Time.realtimeSinceStartup;
		}
		else
		{
			num = Time.deltaTime;
		}
		base.gameObject.transform.Rotate(this.speed * num);
	}

	// Token: 0x04000CE2 RID: 3298
	public Vector3 speed;

	// Token: 0x04000CE3 RID: 3299
	public bool ignoreTimescale;

	// Token: 0x04000CE4 RID: 3300
	public bool randomStartRot;

	// Token: 0x04000CE5 RID: 3301
	private float _previous_time;
}
