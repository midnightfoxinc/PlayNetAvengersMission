using System;
using UnityEngine;

// Token: 0x0200002D RID: 45
public class DistortionObject : MonoBehaviour
{
	// Token: 0x06000133 RID: 307 RVA: 0x0000A700 File Offset: 0x00008900
	private void Awake()
	{
		base.GetComponent<Renderer>().sharedMaterial = this.matForEffectCam;
	}

	// Token: 0x06000134 RID: 308 RVA: 0x0000A714 File Offset: 0x00008914
	private void OnWillRenderObject()
	{
		Camera current = Camera.current;
		if (current.name == "Main Camera")
		{
			base.GetComponent<Renderer>().sharedMaterial = this.matForMainCam;
		}
		else if (current.name == "EffectCamera")
		{
			base.GetComponent<Renderer>().sharedMaterial = this.matForEffectCam;
		}
	}

	// Token: 0x06000135 RID: 309 RVA: 0x0000A778 File Offset: 0x00008978
	private void TilingUV()
	{
		Vector2 textureOffset = base.GetComponent<Renderer>().sharedMaterial.GetTextureOffset("_MainTex");
		textureOffset.y += this.tilingSpeed * Time.deltaTime;
		while (textureOffset.y > 1f)
		{
			textureOffset.y -= 1f;
		}
		base.GetComponent<Renderer>().sharedMaterial.SetTextureOffset("_MainTex", textureOffset);
	}

	// Token: 0x04000194 RID: 404
	[SerializeField]
	private Material matForMainCam;

	// Token: 0x04000195 RID: 405
	[SerializeField]
	private Material matForEffectCam;

	// Token: 0x04000196 RID: 406
	public float tilingSpeed = 1f;
}
