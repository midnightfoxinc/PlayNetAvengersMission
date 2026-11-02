using System;
using UnityEngine;

// Token: 0x0200014D RID: 333
public class FixSlowDistortionOnMobile : MonoBehaviour
{
	// Token: 0x06000AE3 RID: 2787 RVA: 0x0004F9C4 File Offset: 0x0004DBC4
	private void OnRenderImage(RenderTexture src, RenderTexture dest)
	{
		Graphics.Blit(src, dest);
	}
}
