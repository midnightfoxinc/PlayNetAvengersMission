using System;
using UnityEngine;

// Token: 0x02000048 RID: 72
public class Finger : BaseFinger
{
	// Token: 0x0400029A RID: 666
	public float startTimeAction;

	// Token: 0x0400029B RID: 667
	public Vector2 oldPosition;

	// Token: 0x0400029C RID: 668
	public int tapCount;

	// Token: 0x0400029D RID: 669
	public TouchPhase phase;

	// Token: 0x0400029E RID: 670
	public EasyTouch.GestureType gesture;

	// Token: 0x0400029F RID: 671
	public EasyTouch.SwipeDirection oldSwipeType;
}
