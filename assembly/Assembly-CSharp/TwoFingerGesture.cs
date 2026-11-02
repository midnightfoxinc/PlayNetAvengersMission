using System;
using UnityEngine;

// Token: 0x0200004A RID: 74
public class TwoFingerGesture
{
	// Token: 0x06000293 RID: 659 RVA: 0x000111A8 File Offset: 0x0000F3A8
	public void ClearPickedObjectData()
	{
		this.pickedObject = null;
		this.oldPickedObject = null;
		this.pickedCamera = null;
		this.isGuiCamera = false;
	}

	// Token: 0x06000294 RID: 660 RVA: 0x000111C8 File Offset: 0x0000F3C8
	public void ClearPickedUIData()
	{
		this.isOverGui = false;
		this.pickedUIElement = null;
	}

	// Token: 0x040002A6 RID: 678
	public EasyTouch.GestureType currentGesture = EasyTouch.GestureType.None;

	// Token: 0x040002A7 RID: 679
	public EasyTouch.GestureType oldGesture = EasyTouch.GestureType.None;

	// Token: 0x040002A8 RID: 680
	public int finger0;

	// Token: 0x040002A9 RID: 681
	public int finger1;

	// Token: 0x040002AA RID: 682
	public float startTimeAction;

	// Token: 0x040002AB RID: 683
	public float timeSinceStartAction;

	// Token: 0x040002AC RID: 684
	public Vector2 startPosition;

	// Token: 0x040002AD RID: 685
	public Vector2 position;

	// Token: 0x040002AE RID: 686
	public Vector2 deltaPosition;

	// Token: 0x040002AF RID: 687
	public Vector2 oldStartPosition;

	// Token: 0x040002B0 RID: 688
	public float fingerDistance;

	// Token: 0x040002B1 RID: 689
	public float oldFingerDistance;

	// Token: 0x040002B2 RID: 690
	public GameObject pickedObject;

	// Token: 0x040002B3 RID: 691
	public GameObject oldPickedObject;

	// Token: 0x040002B4 RID: 692
	public Camera pickedCamera;

	// Token: 0x040002B5 RID: 693
	public bool isGuiCamera;

	// Token: 0x040002B6 RID: 694
	public bool isOverGui;

	// Token: 0x040002B7 RID: 695
	public GameObject pickedUIElement;

	// Token: 0x040002B8 RID: 696
	public bool dragStart;

	// Token: 0x040002B9 RID: 697
	public bool swipeStart;

	// Token: 0x040002BA RID: 698
	public bool inSingleDoubleTaps;

	// Token: 0x040002BB RID: 699
	public float tapCurentTime;
}
