using System;
using System.Collections;
using UnityEngine;

// Token: 0x02000140 RID: 320
public class WaterWaveUvAnimation : MonoBehaviour
{
	// Token: 0x06000A93 RID: 2707 RVA: 0x0004DA0C File Offset: 0x0004BC0C
	private void Start()
	{
		this.mat = base.GetComponent<Renderer>().material;
		this.delta = 1f / (float)this.fps * this.speed;
		base.StartCoroutine(this.updateTiling());
	}

	// Token: 0x06000A94 RID: 2708 RVA: 0x0004DA54 File Offset: 0x0004BC54
	private IEnumerator updateTiling()
	{
		for (;;)
		{
			this.offset += this.delta;
			this.offsetHeight += this.delta;
			if (this.offset >= 1f)
			{
				Object.Destroy(base.gameObject);
			}
			Vector2 vec = new Vector2(0f, this.offset);
			this.mat.SetTextureOffset("_BumpMap", vec);
			this.mat.SetFloat("_OffsetYHeightMap", this.offset);
			if (this.offset < 0.3f)
			{
				this.mat.SetColor("_Color", new Color(this.color.r, this.color.g, this.color.b, this.offset / 0.3f));
			}
			if (this.offset > 0.7f)
			{
				this.mat.SetColor("_Color", new Color(this.color.r, this.color.g, this.color.b, (1f - this.offset) / 0.3f));
			}
			yield return new WaitForSeconds(1f / (float)this.fps);
		}
		yield break;
	}

	// Token: 0x040009B8 RID: 2488
	public float speed = 1f;

	// Token: 0x040009B9 RID: 2489
	public int fps = 30;

	// Token: 0x040009BA RID: 2490
	public Color color;

	// Token: 0x040009BB RID: 2491
	private Material mat;

	// Token: 0x040009BC RID: 2492
	private float offset;

	// Token: 0x040009BD RID: 2493
	private float offsetHeight;

	// Token: 0x040009BE RID: 2494
	private float delta;
}
