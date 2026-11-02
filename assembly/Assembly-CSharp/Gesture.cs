using System;
using UnityEngine;

// Token: 0x02000049 RID: 73
public class Gesture : BaseFinger
{
	// Token: 0x0600028A RID: 650 RVA: 0x00011020 File Offset: 0x0000F220
	public Vector3 GetTouchToWorldPoint(float z)
	{
		return Camera.main.ScreenToWorldPoint(new Vector3(this.position.x, this.position.y, z));
	}

	// Token: 0x0600028B RID: 651 RVA: 0x00011054 File Offset: 0x0000F254
	public Vector3 GetTouchToWorldPoint(Vector3 position3D)
	{
		return Camera.main.ScreenToWorldPoint(new Vector3(this.position.x, this.position.y, Camera.main.transform.InverseTransformPoint(position3D).z));
	}

	// Token: 0x0600028C RID: 652 RVA: 0x000110A0 File Offset: 0x0000F2A0
	public float GetSwipeOrDragAngle()
	{
		return Mathf.Atan2(this.swipeVector.normalized.y, this.swipeVector.normalized.x) * 57.29578f;
	}

	// Token: 0x0600028D RID: 653 RVA: 0x000110E0 File Offset: 0x0000F2E0
	public Vector2 NormalizedPosition()
	{
		return new Vector2(100f / (float)Screen.width * this.position.x / 100f, 100f / (float)Screen.height * this.position.y / 100f);
	}

	// Token: 0x0600028E RID: 654 RVA: 0x00011130 File Offset: 0x0000F330
	public bool IsOverUIElement()
	{
		return EasyTouch.IsFingerOverUIElement(this.fingerIndex);
	}

	// Token: 0x0600028F RID: 655 RVA: 0x00011140 File Offset: 0x0000F340
	public bool IsOverRectTransform(RectTransform tr, Camera camera = null)
	{
		if (camera == null)
		{
			camera = Camera.main;
		}
		return RectTransformUtility.RectangleContainsScreenPoint(tr, this.position, camera);
	}

	// Token: 0x06000290 RID: 656 RVA: 0x00011170 File Offset: 0x0000F370
	public GameObject GetCurrentFirstPickedUIElement()
	{
		return EasyTouch.GetCurrentPickedUIElement(this.fingerIndex);
	}

	// Token: 0x06000291 RID: 657 RVA: 0x00011180 File Offset: 0x0000F380
	public GameObject GetCurrentPickedObject()
	{
		return EasyTouch.GetCurrentPickedObject(this.fingerIndex);
	}

	// Token: 0x040002A0 RID: 672
	public EasyTouch.SwipeDirection swipe;

	// Token: 0x040002A1 RID: 673
	public float swipeLength;

	// Token: 0x040002A2 RID: 674
	public Vector2 swipeVector;

	// Token: 0x040002A3 RID: 675
	public float deltaPinch;

	// Token: 0x040002A4 RID: 676
	public float twistAngle;

	// Token: 0x040002A5 RID: 677
	public float twoFingerDistance;
}
