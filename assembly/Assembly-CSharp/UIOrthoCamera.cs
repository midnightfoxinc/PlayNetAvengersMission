using System;
using UnityEngine;

// Token: 0x02000129 RID: 297
[RequireComponent(typeof(Camera))]
[AddComponentMenu("NGUI/UI/Orthographic Camera")]
[ExecuteInEditMode]
public class UIOrthoCamera : MonoBehaviour
{
	// Token: 0x060009AC RID: 2476 RVA: 0x00046EEC File Offset: 0x000450EC
	private void Start()
	{
		this.mCam = base.GetComponent<Camera>();
		this.mTrans = base.transform;
		this.mCam.orthographic = true;
	}

	// Token: 0x060009AD RID: 2477 RVA: 0x00046F20 File Offset: 0x00045120
	private void Update()
	{
		float num = this.mCam.rect.yMin * (float)Screen.height;
		float num2 = this.mCam.rect.yMax * (float)Screen.height;
		float num3 = (num2 - num) * 0.5f * this.mTrans.lossyScale.y;
		if (!Mathf.Approximately(this.mCam.orthographicSize, num3))
		{
			this.mCam.orthographicSize = num3;
		}
	}

	// Token: 0x040008F2 RID: 2290
	private Camera mCam;

	// Token: 0x040008F3 RID: 2291
	private Transform mTrans;
}
