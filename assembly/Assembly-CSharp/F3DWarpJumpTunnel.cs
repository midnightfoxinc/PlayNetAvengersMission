using System;
using UnityEngine;

// Token: 0x02000018 RID: 24
public class F3DWarpJumpTunnel : MonoBehaviour
{
	// Token: 0x0600009E RID: 158 RVA: 0x000064D8 File Offset: 0x000046D8
	private void Awake()
	{
		this.transform = base.GetComponent<Transform>();
		this.meshRenderer = base.GetComponent<MeshRenderer>();
		this.alphaID = Shader.PropertyToID("_Alpha");
	}

	// Token: 0x0600009F RID: 159 RVA: 0x00006510 File Offset: 0x00004710
	public void OnSpawned()
	{
		this.grow = false;
		this.meshRenderer.material.SetFloat(this.alphaID, 0f);
		F3DTime.time.AddTimer(this.StartDelay, 1, new Action(this.ToggleGrow));
		F3DTime.time.AddTimer(this.FadeDelay, 1, new Action(this.ToggleGrow));
		this.transform.localScale = new Vector3(1f, 1f, 1f);
		this.transform.localRotation = this.transform.localRotation * Quaternion.Euler(0f, 0f, (float)Random.Range(-360, 360));
	}

	// Token: 0x060000A0 RID: 160 RVA: 0x000065D4 File Offset: 0x000047D4
	private void ToggleGrow()
	{
		this.grow = !this.grow;
	}

	// Token: 0x060000A1 RID: 161 RVA: 0x000065E8 File Offset: 0x000047E8
	private void Update()
	{
		this.transform.Rotate(0f, 0f, this.RotationSpeed * Time.deltaTime);
		if (this.grow)
		{
			this.transform.localScale = Vector3.Lerp(this.transform.localScale, this.ScaleTo, Time.deltaTime * this.ScaleTime);
			this.alpha = Mathf.Lerp(this.alpha, 1f, Time.deltaTime * this.ColorTime);
			this.meshRenderer.material.SetFloat(this.alphaID, this.alpha);
		}
		else
		{
			this.alpha = Mathf.Lerp(this.alpha, 0f, Time.deltaTime * this.ColorFadeTime);
			this.meshRenderer.material.SetFloat(this.alphaID, this.alpha);
		}
	}

	// Token: 0x040000F7 RID: 247
	private Transform transform;

	// Token: 0x040000F8 RID: 248
	private MeshRenderer meshRenderer;

	// Token: 0x040000F9 RID: 249
	public float StartDelay;

	// Token: 0x040000FA RID: 250
	public float FadeDelay;

	// Token: 0x040000FB RID: 251
	public Vector3 ScaleTo;

	// Token: 0x040000FC RID: 252
	public float ScaleTime;

	// Token: 0x040000FD RID: 253
	public float ColorTime;

	// Token: 0x040000FE RID: 254
	public float ColorFadeTime;

	// Token: 0x040000FF RID: 255
	public float RotationSpeed;

	// Token: 0x04000100 RID: 256
	private bool grow;

	// Token: 0x04000101 RID: 257
	private float alpha;

	// Token: 0x04000102 RID: 258
	private int alphaID;
}
