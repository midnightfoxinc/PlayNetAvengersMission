using System;
using UnityEngine;

// Token: 0x02000210 RID: 528
public class SwipeBehavior : MonoBehaviour
{
	// Token: 0x06000EE4 RID: 3812 RVA: 0x0006A624 File Offset: 0x00068824
	private void OnEnable()
	{
		EasyTouch.On_SwipeStart += this.On_SwipeStart;
		EasyTouch.On_Swipe += this.On_Swipe;
		EasyTouch.On_SwipeEnd += this.On_SwipeEnd;
		globals.debug("Adding Easy Touch Events");
	}

	// Token: 0x06000EE5 RID: 3813 RVA: 0x0006A664 File Offset: 0x00068864
	private void OnDisable()
	{
		this.UnsubscribeEvent();
	}

	// Token: 0x06000EE6 RID: 3814 RVA: 0x0006A66C File Offset: 0x0006886C
	private void OnDestroy()
	{
		this.UnsubscribeEvent();
	}

	// Token: 0x06000EE7 RID: 3815 RVA: 0x0006A674 File Offset: 0x00068874
	private void UnsubscribeEvent()
	{
		EasyTouch.On_SwipeStart -= this.On_SwipeStart;
		EasyTouch.On_Swipe -= this.On_Swipe;
		EasyTouch.On_SwipeEnd -= this.On_SwipeEnd;
	}

	// Token: 0x06000EE8 RID: 3816 RVA: 0x0006A6AC File Offset: 0x000688AC
	private void On_SwipeStart(Gesture gesture)
	{
	}

	// Token: 0x06000EE9 RID: 3817 RVA: 0x0006A6B0 File Offset: 0x000688B0
	private void On_Swipe(Gesture gesture)
	{
	}

	// Token: 0x06000EEA RID: 3818 RVA: 0x0006A6B4 File Offset: 0x000688B4
	private void On_SwipeEnd(Gesture gesture)
	{
		if (!globals.armory_main.testfire_scene)
		{
			return;
		}
		globals.debug("Should be swiping");
		if (gesture.swipe == EasyTouch.SwipeDirection.Left)
		{
			globals.armory_main.testfire_scene.SwipeLeft();
		}
		else if (gesture.swipe == EasyTouch.SwipeDirection.Right)
		{
			globals.armory_main.testfire_scene.SwipeRight();
		}
	}
}
