using System;
using UnityEngine;

// Token: 0x0200013F RID: 319
public class WaterUvAnimation : MonoBehaviour
{
	// Token: 0x06000A90 RID: 2704 RVA: 0x0004D914 File Offset: 0x0004BB14
	private void Awake()
	{
		this.mat = base.GetComponent<Renderer>().materials[this.MaterialNomber];
	}

	// Token: 0x06000A91 RID: 2705 RVA: 0x0004D930 File Offset: 0x0004BB30
	private void Update()
	{
		if (this.IsReverse)
		{
			this.offset -= Time.deltaTime * this.Speed;
			if (this.offset < 0f)
			{
				this.offset = 1f;
			}
		}
		else
		{
			this.offset += Time.deltaTime * this.Speed;
			if (this.offset > 1f)
			{
				this.offset = 0f;
			}
		}
		Vector2 vector;
		vector..ctor(0f, this.offset);
		this.mat.SetTextureOffset("_BumpMap", vector);
		this.mat.SetFloat("_OffsetYHeightMap", this.offset);
	}

	// Token: 0x040009AF RID: 2479
	public bool IsReverse;

	// Token: 0x040009B0 RID: 2480
	public float Speed = 1f;

	// Token: 0x040009B1 RID: 2481
	public int MaterialNomber;

	// Token: 0x040009B2 RID: 2482
	private Material mat;

	// Token: 0x040009B3 RID: 2483
	private float deltaFps;

	// Token: 0x040009B4 RID: 2484
	private bool isVisible;

	// Token: 0x040009B5 RID: 2485
	private bool isCorutineStarted;

	// Token: 0x040009B6 RID: 2486
	private float offset;

	// Token: 0x040009B7 RID: 2487
	private float delta;
}
