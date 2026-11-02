using System;
using UnityEngine;

// Token: 0x02000019 RID: 25
public class F3DWarpTunnel : MonoBehaviour
{
	// Token: 0x060000A3 RID: 163 RVA: 0x000066D8 File Offset: 0x000048D8
	private void Start()
	{
		this.speed = 0f;
		this.OnDirectionChange();
	}

	// Token: 0x060000A4 RID: 164 RVA: 0x000066EC File Offset: 0x000048EC
	private void OnDirectionChange()
	{
		this.newSpeed = Random.Range(-this.MaxRotationSpeed, this.MaxRotationSpeed);
		F3DTime.time.AddTimer((float)Random.Range(1, 5), 1, new Action(this.OnDirectionChange));
	}

	// Token: 0x060000A5 RID: 165 RVA: 0x00006734 File Offset: 0x00004934
	private void Update()
	{
		this.speed = Mathf.Lerp(this.speed, this.newSpeed, Time.deltaTime * this.AdaptationFactor);
		base.transform.rotation = Quaternion.Lerp(base.transform.rotation, base.transform.rotation * Quaternion.Euler(this.speed, 0f, 0f), Time.deltaTime);
	}

	// Token: 0x04000103 RID: 259
	public float MaxRotationSpeed;

	// Token: 0x04000104 RID: 260
	public float AdaptationFactor;

	// Token: 0x04000105 RID: 261
	private float speed;

	// Token: 0x04000106 RID: 262
	private float newSpeed;
}
