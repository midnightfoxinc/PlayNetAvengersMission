using System;
using UnityEngine;

// Token: 0x020000A6 RID: 166
[AddComponentMenu("NGUI/Interaction/Drag-Resize Widget")]
public class UIDragResize : MonoBehaviour
{
	// Token: 0x060003FA RID: 1018 RVA: 0x0001A6A0 File Offset: 0x000188A0
	private void OnDragStart()
	{
		if (this.target != null)
		{
			Vector3[] worldCorners = this.target.worldCorners;
			this.mPlane = new Plane(worldCorners[0], worldCorners[1], worldCorners[3]);
			Ray currentRay = UICamera.currentRay;
			float num;
			if (this.mPlane.Raycast(currentRay, ref num))
			{
				this.mRayPos = currentRay.GetPoint(num);
				this.mLocalPos = this.target.cachedTransform.localPosition;
				this.mWidth = this.target.width;
				this.mHeight = this.target.height;
				this.mDragging = true;
			}
		}
	}

	// Token: 0x060003FB RID: 1019 RVA: 0x0001A760 File Offset: 0x00018960
	private void OnDrag(Vector2 delta)
	{
		if (this.mDragging && this.target != null)
		{
			Ray currentRay = UICamera.currentRay;
			float num;
			if (this.mPlane.Raycast(currentRay, ref num))
			{
				Transform cachedTransform = this.target.cachedTransform;
				cachedTransform.localPosition = this.mLocalPos;
				this.target.width = this.mWidth;
				this.target.height = this.mHeight;
				Vector3 vector = currentRay.GetPoint(num) - this.mRayPos;
				cachedTransform.position += vector;
				Vector3 vector2 = Quaternion.Inverse(cachedTransform.localRotation) * (cachedTransform.localPosition - this.mLocalPos);
				cachedTransform.localPosition = this.mLocalPos;
				NGUIMath.ResizeWidget(this.target, this.pivot, vector2.x, vector2.y, this.minWidth, this.minHeight, this.maxWidth, this.maxHeight);
				if (this.updateAnchors)
				{
					this.target.BroadcastMessage("UpdateAnchors");
				}
			}
		}
	}

	// Token: 0x060003FC RID: 1020 RVA: 0x0001A884 File Offset: 0x00018A84
	private void OnDragEnd()
	{
		this.mDragging = false;
	}

	// Token: 0x04000436 RID: 1078
	public UIWidget target;

	// Token: 0x04000437 RID: 1079
	public UIWidget.Pivot pivot = UIWidget.Pivot.BottomRight;

	// Token: 0x04000438 RID: 1080
	public int minWidth = 100;

	// Token: 0x04000439 RID: 1081
	public int minHeight = 100;

	// Token: 0x0400043A RID: 1082
	public int maxWidth = 100000;

	// Token: 0x0400043B RID: 1083
	public int maxHeight = 100000;

	// Token: 0x0400043C RID: 1084
	public bool updateAnchors;

	// Token: 0x0400043D RID: 1085
	private Plane mPlane;

	// Token: 0x0400043E RID: 1086
	private Vector3 mRayPos;

	// Token: 0x0400043F RID: 1087
	private Vector3 mLocalPos;

	// Token: 0x04000440 RID: 1088
	private int mWidth;

	// Token: 0x04000441 RID: 1089
	private int mHeight;

	// Token: 0x04000442 RID: 1090
	private bool mDragging;
}
