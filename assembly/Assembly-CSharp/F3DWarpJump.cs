using System;
using UnityEngine;

// Token: 0x02000017 RID: 23
public class F3DWarpJump : MonoBehaviour
{
	// Token: 0x06000098 RID: 152 RVA: 0x000063D0 File Offset: 0x000045D0
	private void Start()
	{
		if (this.SendOnSpawned)
		{
			base.BroadcastMessage("OnSpawned", 1);
		}
	}

	// Token: 0x06000099 RID: 153 RVA: 0x000063EC File Offset: 0x000045EC
	public void OnSpawned()
	{
		this.isWarping = false;
		this.WarpSpark.transform.localPosition = this.ShipJumpStartPoint;
		this.ShipPos.position = this.WarpSpark.transform.position;
		F3DTime.time.AddTimer(3f, 1, new Action(this.OnWarp));
	}

	// Token: 0x0600009A RID: 154 RVA: 0x00006450 File Offset: 0x00004650
	private void OnWarp()
	{
		this.isWarping = true;
	}

	// Token: 0x0600009B RID: 155 RVA: 0x0000645C File Offset: 0x0000465C
	private void ShiftShipPosition()
	{
		this.WarpSpark.transform.localPosition = Vector3.Lerp(this.WarpSpark.transform.localPosition, this.ShipJumpEndPoint, Time.deltaTime * this.ShipJumpSpeed);
		this.ShipPos.position = this.WarpSpark.transform.position;
	}

	// Token: 0x0600009C RID: 156 RVA: 0x000064BC File Offset: 0x000046BC
	private void Update()
	{
		if (this.isWarping)
		{
			this.ShiftShipPosition();
		}
	}

	// Token: 0x040000F0 RID: 240
	public ParticleSystem WarpSpark;

	// Token: 0x040000F1 RID: 241
	public Transform ShipPos;

	// Token: 0x040000F2 RID: 242
	public float ShipJumpSpeed;

	// Token: 0x040000F3 RID: 243
	public Vector3 ShipJumpStartPoint;

	// Token: 0x040000F4 RID: 244
	public Vector3 ShipJumpEndPoint;

	// Token: 0x040000F5 RID: 245
	public bool SendOnSpawned;

	// Token: 0x040000F6 RID: 246
	private bool isWarping;
}
