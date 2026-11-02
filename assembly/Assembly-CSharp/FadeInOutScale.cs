using System;
using UnityEngine;

// Token: 0x02000149 RID: 329
public class FadeInOutScale : MonoBehaviour
{
	// Token: 0x06000AC4 RID: 2756 RVA: 0x0004EDD4 File Offset: 0x0004CFD4
	private void Start()
	{
		this.t = base.transform;
		this.oldScale = this.t.localScale;
		this.isInitialized = true;
	}

	// Token: 0x06000AC5 RID: 2757 RVA: 0x0004EE08 File Offset: 0x0004D008
	private void InitDefaultVariables()
	{
		this.t.localScale = Vector3.zero;
		this.time = 0f;
		this.oldSin = 0f;
		this.canUpdate = true;
		this.updateTime = true;
	}

	// Token: 0x06000AC6 RID: 2758 RVA: 0x0004EE4C File Offset: 0x0004D04C
	private void OnEnable()
	{
		if (this.isInitialized)
		{
			this.InitDefaultVariables();
		}
	}

	// Token: 0x06000AC7 RID: 2759 RVA: 0x0004EE60 File Offset: 0x0004D060
	private void Update()
	{
		if (!this.canUpdate)
		{
			return;
		}
		if (this.updateTime)
		{
			this.time = Time.time;
			this.updateTime = false;
		}
		float num = Mathf.Sin((Time.time - this.time) / this.Speed);
		float num2 = num * this.MaxScale;
		if (this.FadeInOutStatus == FadeInOutStatus.In)
		{
			this.t.localScale = new Vector3(this.oldScale.x * num2, this.oldScale.y * num2, this.oldScale.z * num2);
		}
		if (this.FadeInOutStatus == FadeInOutStatus.Out)
		{
			this.t.localScale = new Vector3(this.MaxScale * this.oldScale.x - this.oldScale.x * num2, this.MaxScale * this.oldScale.y - this.oldScale.y * num2, this.MaxScale * this.oldScale.z - this.oldScale.z * num2);
		}
		if (this.oldSin > num)
		{
			this.canUpdate = false;
		}
		this.oldSin = num;
	}

	// Token: 0x04000A11 RID: 2577
	public FadeInOutStatus FadeInOutStatus;

	// Token: 0x04000A12 RID: 2578
	public float Speed = 1f;

	// Token: 0x04000A13 RID: 2579
	public float MaxScale = 2f;

	// Token: 0x04000A14 RID: 2580
	private Vector3 oldScale;

	// Token: 0x04000A15 RID: 2581
	private float time;

	// Token: 0x04000A16 RID: 2582
	private float oldSin;

	// Token: 0x04000A17 RID: 2583
	private bool updateTime = true;

	// Token: 0x04000A18 RID: 2584
	private bool canUpdate = true;

	// Token: 0x04000A19 RID: 2585
	private Transform t;

	// Token: 0x04000A1A RID: 2586
	private bool isInitialized;
}
