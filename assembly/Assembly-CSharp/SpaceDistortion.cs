using System;
using UnityEngine;

// Token: 0x0200002E RID: 46
public class SpaceDistortion : MonoBehaviour
{
	// Token: 0x06000137 RID: 311 RVA: 0x0000A7FC File Offset: 0x000089FC
	private void Start()
	{
		this.heatTex = new RenderTexture(Screen.width / 4, Screen.height / 4, 16, 0);
		this.heatTex.wrapMode = 0;
		this.heatTex.Create();
		this.effectCamera.targetTexture = this.heatTex;
		this.effectCamera.fieldOfView = Camera.main.fieldOfView;
		this.screenMat.SetTexture("_DistortionTex", this.heatTex);
	}

	// Token: 0x06000138 RID: 312 RVA: 0x0000A87C File Offset: 0x00008A7C
	private void OnRenderImage(RenderTexture src, RenderTexture dst)
	{
		Graphics.Blit(src, dst, this.screenMat);
	}

	// Token: 0x04000197 RID: 407
	[SerializeField]
	private Camera effectCamera;

	// Token: 0x04000198 RID: 408
	[SerializeField]
	private Material screenMat;

	// Token: 0x04000199 RID: 409
	private RenderTexture heatTex;
}
