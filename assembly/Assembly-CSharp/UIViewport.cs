using System;
using UnityEngine;

// Token: 0x02000139 RID: 313
[RequireComponent(typeof(Camera))]
[AddComponentMenu("NGUI/UI/Viewport Camera")]
[ExecuteInEditMode]
public class UIViewport : MonoBehaviour
{
	// Token: 0x06000A75 RID: 2677 RVA: 0x0004CF68 File Offset: 0x0004B168
	private void Start()
	{
		this.mCam = base.GetComponent<Camera>();
		if (this.sourceCamera == null)
		{
			this.sourceCamera = Camera.main;
		}
	}

	// Token: 0x06000A76 RID: 2678 RVA: 0x0004CFA0 File Offset: 0x0004B1A0
	private void LateUpdate()
	{
		if (this.topLeft != null && this.bottomRight != null)
		{
			if (this.topLeft.gameObject.activeInHierarchy)
			{
				Vector3 vector = this.sourceCamera.WorldToScreenPoint(this.topLeft.position);
				Vector3 vector2 = this.sourceCamera.WorldToScreenPoint(this.bottomRight.position);
				Rect rect;
				rect..ctor(vector.x / (float)Screen.width, vector2.y / (float)Screen.height, (vector2.x - vector.x) / (float)Screen.width, (vector.y - vector2.y) / (float)Screen.height);
				float num = this.fullSize * rect.height;
				if (rect != this.mCam.rect)
				{
					this.mCam.rect = rect;
				}
				if (this.mCam.orthographicSize != num)
				{
					this.mCam.orthographicSize = num;
				}
				this.mCam.enabled = true;
			}
			else
			{
				this.mCam.enabled = false;
			}
		}
	}

	// Token: 0x0400098D RID: 2445
	public Camera sourceCamera;

	// Token: 0x0400098E RID: 2446
	public Transform topLeft;

	// Token: 0x0400098F RID: 2447
	public Transform bottomRight;

	// Token: 0x04000990 RID: 2448
	public float fullSize = 1f;

	// Token: 0x04000991 RID: 2449
	private Camera mCam;
}
