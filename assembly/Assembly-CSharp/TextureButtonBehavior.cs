using System;
using UnityEngine;

// Token: 0x020001BF RID: 447
[RequireComponent(typeof(UIWidget))]
public class TextureButtonBehavior : ButtonCoreBehavior
{
	// Token: 0x06000D11 RID: 3345 RVA: 0x0005E7B8 File Offset: 0x0005C9B8
	public void set_texture(Texture2D t)
	{
		this.texture.mainTexture = t;
	}

	// Token: 0x04000D21 RID: 3361
	public UITexture texture;

	// Token: 0x04000D22 RID: 3362
	public UILabel label;
}
