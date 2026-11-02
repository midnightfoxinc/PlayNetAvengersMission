using System;
using UnityEngine;

// Token: 0x020001F3 RID: 499
public class MuzzleFlashBehavior : MonoBehaviour
{
	// Token: 0x06000E67 RID: 3687 RVA: 0x00065064 File Offset: 0x00063264
	private void Start()
	{
		this.BornTime = Time.time;
		this.StartScale = base.transform.localScale;
		base.transform.localScale = Vector3.zero;
	}

	// Token: 0x06000E68 RID: 3688 RVA: 0x000650A0 File Offset: 0x000632A0
	private void Update()
	{
		this.scale = Mathf.Clamp(this.scale + Time.deltaTime * 10f, 0f, 1f);
		base.transform.localScale = Vector3.Lerp(base.transform.localScale, this.StartScale, this.scale);
		if (Time.time > this.BornTime + this.OnTime)
		{
			Object.Destroy(base.gameObject);
		}
	}

	// Token: 0x04000E27 RID: 3623
	public float OnTime = 0.15f;

	// Token: 0x04000E28 RID: 3624
	private float BornTime;

	// Token: 0x04000E29 RID: 3625
	private float scale;

	// Token: 0x04000E2A RID: 3626
	private Vector3 StartScale;
}
