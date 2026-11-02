using System;
using UnityEngine;

// Token: 0x020001BE RID: 446
public class ShakeBehavior : MonoBehaviour
{
	// Token: 0x06000D0D RID: 3341 RVA: 0x0005E6DC File Offset: 0x0005C8DC
	public void play()
	{
		this._countdown = 1f;
	}

	// Token: 0x06000D0E RID: 3342 RVA: 0x0005E6EC File Offset: 0x0005C8EC
	public bool isShaking()
	{
		return this._countdown > 0f;
	}

	// Token: 0x06000D0F RID: 3343 RVA: 0x0005E6FC File Offset: 0x0005C8FC
	private void Update()
	{
		if (this._countdown > 0f)
		{
			this._countdown -= Time.deltaTime / this.duration;
			if (this._countdown < 0f)
			{
				this._countdown = 0f;
			}
			base.transform.localPosition = Random.onUnitSphere * this._countdown * this.radius;
			if (this.shake_others != null)
			{
				for (int i = 0; i < this.shake_others.Length; i++)
				{
					this.shake_others[i].localPosition = base.transform.localPosition;
				}
			}
		}
	}

	// Token: 0x04000D1D RID: 3357
	public float radius = 1f;

	// Token: 0x04000D1E RID: 3358
	public float duration = 1f;

	// Token: 0x04000D1F RID: 3359
	public Transform[] shake_others;

	// Token: 0x04000D20 RID: 3360
	private float _countdown;
}
