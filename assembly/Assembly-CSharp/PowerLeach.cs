using System;
using UnityEngine;

// Token: 0x020001FC RID: 508
public class PowerLeach : MonoBehaviour
{
	// Token: 0x06000E85 RID: 3717 RVA: 0x00066164 File Offset: 0x00064364
	private void Start()
	{
		this.BornTime = Time.time;
	}

	// Token: 0x06000E86 RID: 3718 RVA: 0x00066174 File Offset: 0x00064374
	private void Update()
	{
		if (Time.time > this.LastTimeSpawn + this.SpawnInterval && this.ReturnBallCount <= this.ReturnBallTotal)
		{
			this.LastTimeSpawn = Time.time;
			this.ReturnBallCount++;
			Object.Instantiate(this.ReturnBall, base.transform.position, base.transform.rotation);
		}
	}

	// Token: 0x04000E64 RID: 3684
	public GameObject ReturnBall;

	// Token: 0x04000E65 RID: 3685
	private float SpawnInterval = 0.2f;

	// Token: 0x04000E66 RID: 3686
	private int ReturnBallTotal = 3;

	// Token: 0x04000E67 RID: 3687
	private int ReturnBallCount;

	// Token: 0x04000E68 RID: 3688
	private float LastTimeSpawn;

	// Token: 0x04000E69 RID: 3689
	private float BornTime;
}
