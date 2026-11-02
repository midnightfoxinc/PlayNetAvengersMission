using System;
using UnityEngine;

// Token: 0x020001F1 RID: 497
[ExecuteInEditMode]
public class LockHorizontalFOVBehavior : MonoBehaviour
{
	// Token: 0x170001D6 RID: 470
	// (get) Token: 0x06000E60 RID: 3680 RVA: 0x00064FC8 File Offset: 0x000631C8
	public Camera camera
	{
		get
		{
			if (!this._camera)
			{
				this._camera = base.GetComponent<Camera>();
			}
			return this._camera;
		}
	}

	// Token: 0x06000E61 RID: 3681 RVA: 0x00064FF8 File Offset: 0x000631F8
	private void adjust_fov()
	{
		this.camera.fieldOfView = this.horizontal_fov / this.camera.aspect;
	}

	// Token: 0x06000E62 RID: 3682 RVA: 0x00065024 File Offset: 0x00063224
	private void OnPreRender()
	{
		this.adjust_fov();
	}

	// Token: 0x04000E24 RID: 3620
	public float horizontal_fov = 106f;

	// Token: 0x04000E25 RID: 3621
	private Camera _camera;
}
