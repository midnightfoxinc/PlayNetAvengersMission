using System;
using UnityEngine;

// Token: 0x0200003D RID: 61
[Serializable]
public class ECamera
{
	// Token: 0x060001DF RID: 479 RVA: 0x0000CA48 File Offset: 0x0000AC48
	public ECamera(Camera cam, bool gui)
	{
		this.camera = cam;
		this.guiCamera = gui;
	}

	// Token: 0x040001E9 RID: 489
	public Camera camera;

	// Token: 0x040001EA RID: 490
	public bool guiCamera;
}
