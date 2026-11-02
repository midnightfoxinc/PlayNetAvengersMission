using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001EF RID: 495
public class FragsFadeBehavoir : MonoBehaviour
{
	// Token: 0x06000E59 RID: 3673 RVA: 0x00064E4C File Offset: 0x0006304C
	private void Start()
	{
		this.BornTime = Time.time;
		this.Materials = new List<Material>();
		Renderer component = base.transform.GetComponent<Renderer>();
		this.Materials.AddRange(component.materials);
	}

	// Token: 0x06000E5A RID: 3674 RVA: 0x00064E8C File Offset: 0x0006308C
	private void Update()
	{
		if (this.scale < 0.01f)
		{
			Object.Destroy(base.gameObject);
		}
		if (Time.time > this.BornTime + this.FadeTime && !this.StartWaitToFaid)
		{
			this.StartWaitToFaid = true;
			base.StartCoroutine("WaitToFade");
		}
	}

	// Token: 0x06000E5B RID: 3675 RVA: 0x00064EEC File Offset: 0x000630EC
	private IEnumerator WaitToFade()
	{
		while (this.scale > 0.01f)
		{
			foreach (Material mat in this.Materials)
			{
				mat.SetColor("_Color", new Color(mat.GetColor("_Color").r, mat.GetColor("_Color").g, mat.GetColor("_Color").b, Mathf.Lerp(mat.GetColor("_Color").a, 0f, Time.deltaTime * this.FadeSpeed)));
			}
			this.scale = Mathf.Lerp(this.scale, 0f, Time.deltaTime * this.FadeSpeed);
			yield return null;
		}
		yield break;
	}

	// Token: 0x04000E1B RID: 3611
	private float FadeTime = 5f;

	// Token: 0x04000E1C RID: 3612
	private float FadeSpeed = 1f;

	// Token: 0x04000E1D RID: 3613
	private float BornTime;

	// Token: 0x04000E1E RID: 3614
	private List<Material> Materials;

	// Token: 0x04000E1F RID: 3615
	private float scale = 1f;

	// Token: 0x04000E20 RID: 3616
	private bool StartWaitToFaid;
}
