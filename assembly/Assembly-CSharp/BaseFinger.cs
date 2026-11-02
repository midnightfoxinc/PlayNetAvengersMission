using System;
using UnityEngine;

// Token: 0x02000039 RID: 57
public class BaseFinger
{
	// Token: 0x060001AB RID: 427 RVA: 0x0000BC68 File Offset: 0x00009E68
	public Gesture GetGesture()
	{
		return new Gesture
		{
			fingerIndex = this.fingerIndex,
			touchCount = this.touchCount,
			startPosition = this.startPosition,
			position = this.position,
			deltaPosition = this.deltaPosition,
			actionTime = this.actionTime,
			deltaTime = this.deltaTime,
			isOverGui = this.isOverGui,
			pickedCamera = this.pickedCamera,
			pickedObject = this.pickedObject,
			isGuiCamera = this.isGuiCamera,
			pickedUIElement = this.pickedUIElement
		};
	}

	// Token: 0x040001C2 RID: 450
	public int fingerIndex;

	// Token: 0x040001C3 RID: 451
	public int touchCount;

	// Token: 0x040001C4 RID: 452
	public Vector2 startPosition;

	// Token: 0x040001C5 RID: 453
	public Vector2 position;

	// Token: 0x040001C6 RID: 454
	public Vector2 deltaPosition;

	// Token: 0x040001C7 RID: 455
	public float actionTime;

	// Token: 0x040001C8 RID: 456
	public float deltaTime;

	// Token: 0x040001C9 RID: 457
	public Camera pickedCamera;

	// Token: 0x040001CA RID: 458
	public GameObject pickedObject;

	// Token: 0x040001CB RID: 459
	public bool isGuiCamera;

	// Token: 0x040001CC RID: 460
	public bool isOverGui;

	// Token: 0x040001CD RID: 461
	public GameObject pickedUIElement;
}
