using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200003A RID: 58
[AddComponentMenu("Event/EasyTouch Trigger")]
[Serializable]
public class EasyTouchTrigger : MonoBehaviour
{
	// Token: 0x060001AD RID: 429 RVA: 0x0000BD20 File Offset: 0x00009F20
	private void Start()
	{
		if (Object.FindObjectOfType(typeof(EasyTouch)) == null)
		{
			Debug.LogWarning("EasyTouch doesn't exist in your scene");
		}
	}

	// Token: 0x060001AE RID: 430 RVA: 0x0000BD54 File Offset: 0x00009F54
	private void OnEnable()
	{
		this.SubscribeEasyTouchEvent();
	}

	// Token: 0x060001AF RID: 431 RVA: 0x0000BD5C File Offset: 0x00009F5C
	private void OnDisable()
	{
		this.UnsubscribeEasyTouchEvent();
	}

	// Token: 0x060001B0 RID: 432 RVA: 0x0000BD64 File Offset: 0x00009F64
	private void OnDestroy()
	{
		this.UnsubscribeEasyTouchEvent();
	}

	// Token: 0x060001B1 RID: 433 RVA: 0x0000BD6C File Offset: 0x00009F6C
	private void SubscribeEasyTouchEvent()
	{
		if (this.IsRecevier4(EasyTouch.EventName.On_Cancel))
		{
			EasyTouch.On_Cancel += this.On_Cancel;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_TouchStart))
		{
			EasyTouch.On_TouchStart += this.On_TouchStart;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_TouchDown))
		{
			EasyTouch.On_TouchDown += this.On_TouchDown;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_TouchUp))
		{
			EasyTouch.On_TouchUp += this.On_TouchUp;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_SimpleTap))
		{
			EasyTouch.On_SimpleTap += this.On_SimpleTap;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_LongTapStart))
		{
			EasyTouch.On_LongTapStart += this.On_LongTapStart;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_LongTap))
		{
			EasyTouch.On_LongTap += this.On_LongTap;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_LongTapEnd))
		{
			EasyTouch.On_LongTapEnd += this.On_LongTapEnd;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_DoubleTap))
		{
			EasyTouch.On_DoubleTap += this.On_DoubleTap;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_DragStart))
		{
			EasyTouch.On_DragStart += this.On_DragStart;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_Drag))
		{
			EasyTouch.On_Drag += this.On_Drag;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_DragEnd))
		{
			EasyTouch.On_DragEnd += this.On_DragEnd;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_SwipeStart))
		{
			EasyTouch.On_SwipeStart += this.On_SwipeStart;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_Swipe))
		{
			EasyTouch.On_Swipe += this.On_Swipe;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_SwipeEnd))
		{
			EasyTouch.On_SwipeEnd += this.On_SwipeEnd;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_TouchStart2Fingers))
		{
			EasyTouch.On_TouchStart2Fingers += this.On_TouchStart2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_TouchDown2Fingers))
		{
			EasyTouch.On_TouchDown2Fingers += this.On_TouchDown2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_TouchUp2Fingers))
		{
			EasyTouch.On_TouchUp2Fingers += this.On_TouchUp2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_SimpleTap2Fingers))
		{
			EasyTouch.On_SimpleTap2Fingers += this.On_SimpleTap2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_LongTapStart2Fingers))
		{
			EasyTouch.On_LongTapStart2Fingers += this.On_LongTapStart2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_LongTap2Fingers))
		{
			EasyTouch.On_LongTap2Fingers += this.On_LongTap2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_LongTapEnd2Fingers))
		{
			EasyTouch.On_LongTapEnd2Fingers += this.On_LongTapEnd2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_DoubleTap2Fingers))
		{
			EasyTouch.On_DoubleTap2Fingers += this.On_DoubleTap2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_SwipeStart2Fingers))
		{
			EasyTouch.On_SwipeStart2Fingers += this.On_SwipeStart2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_Swipe2Fingers))
		{
			EasyTouch.On_Swipe2Fingers += this.On_Swipe2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_SwipeEnd2Fingers))
		{
			EasyTouch.On_SwipeEnd2Fingers += this.On_SwipeEnd2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_DragStart2Fingers))
		{
			EasyTouch.On_DragStart2Fingers += this.On_DragStart2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_Drag2Fingers))
		{
			EasyTouch.On_Drag2Fingers += this.On_Drag2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_DragEnd2Fingers))
		{
			EasyTouch.On_DragEnd2Fingers += this.On_DragEnd2Fingers;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_Pinch))
		{
			EasyTouch.On_Pinch += this.On_Pinch;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_PinchIn))
		{
			EasyTouch.On_PinchIn += this.On_PinchIn;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_PinchOut))
		{
			EasyTouch.On_PinchOut += this.On_PinchOut;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_PinchEnd))
		{
			EasyTouch.On_PinchEnd += this.On_PinchEnd;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_Twist))
		{
			EasyTouch.On_Twist += this.On_Twist;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_TwistEnd))
		{
			EasyTouch.On_TwistEnd += this.On_TwistEnd;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_OverUIElement))
		{
			EasyTouch.On_OverUIElement += this.On_OverUIElement;
		}
		if (this.IsRecevier4(EasyTouch.EventName.On_UIElementTouchUp))
		{
			EasyTouch.On_UIElementTouchUp += this.On_UIElementTouchUp;
		}
	}

	// Token: 0x060001B2 RID: 434 RVA: 0x0000C1C8 File Offset: 0x0000A3C8
	private void UnsubscribeEasyTouchEvent()
	{
		EasyTouch.On_Cancel -= this.On_Cancel;
		EasyTouch.On_TouchStart -= this.On_TouchStart;
		EasyTouch.On_TouchDown -= this.On_TouchDown;
		EasyTouch.On_TouchUp -= this.On_TouchUp;
		EasyTouch.On_SimpleTap -= this.On_SimpleTap;
		EasyTouch.On_LongTapStart -= this.On_LongTapStart;
		EasyTouch.On_LongTap -= this.On_LongTap;
		EasyTouch.On_LongTapEnd -= this.On_LongTapEnd;
		EasyTouch.On_DoubleTap -= this.On_DoubleTap;
		EasyTouch.On_DragStart -= this.On_DragStart;
		EasyTouch.On_Drag -= this.On_Drag;
		EasyTouch.On_DragEnd -= this.On_DragEnd;
		EasyTouch.On_SwipeStart -= this.On_SwipeStart;
		EasyTouch.On_Swipe -= this.On_Swipe;
		EasyTouch.On_SwipeEnd -= this.On_SwipeEnd;
		EasyTouch.On_TouchStart2Fingers -= this.On_TouchStart2Fingers;
		EasyTouch.On_TouchDown2Fingers -= this.On_TouchDown2Fingers;
		EasyTouch.On_TouchUp2Fingers -= this.On_TouchUp2Fingers;
		EasyTouch.On_SimpleTap2Fingers -= this.On_SimpleTap2Fingers;
		EasyTouch.On_LongTapStart2Fingers -= this.On_LongTapStart2Fingers;
		EasyTouch.On_LongTap2Fingers -= this.On_LongTap2Fingers;
		EasyTouch.On_LongTapEnd2Fingers -= this.On_LongTapEnd2Fingers;
		EasyTouch.On_DoubleTap2Fingers -= this.On_DoubleTap2Fingers;
		EasyTouch.On_SwipeStart2Fingers -= this.On_SwipeStart2Fingers;
		EasyTouch.On_Swipe2Fingers -= this.On_Swipe2Fingers;
		EasyTouch.On_SwipeEnd2Fingers -= this.On_SwipeEnd2Fingers;
		EasyTouch.On_DragStart2Fingers -= this.On_DragStart2Fingers;
		EasyTouch.On_Drag2Fingers -= this.On_Drag2Fingers;
		EasyTouch.On_DragEnd2Fingers -= this.On_DragEnd2Fingers;
		EasyTouch.On_Pinch -= this.On_Pinch;
		EasyTouch.On_PinchIn -= this.On_PinchIn;
		EasyTouch.On_PinchOut -= this.On_PinchOut;
		EasyTouch.On_PinchEnd -= this.On_PinchEnd;
		EasyTouch.On_Twist -= this.On_Twist;
		EasyTouch.On_TwistEnd -= this.On_TwistEnd;
		EasyTouch.On_OverUIElement += this.On_OverUIElement;
		EasyTouch.On_UIElementTouchUp += this.On_UIElementTouchUp;
	}

	// Token: 0x060001B3 RID: 435 RVA: 0x0000C44C File Offset: 0x0000A64C
	private void On_TouchStart(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_TouchStart, gesture);
	}

	// Token: 0x060001B4 RID: 436 RVA: 0x0000C458 File Offset: 0x0000A658
	private void On_TouchDown(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_TouchDown, gesture);
	}

	// Token: 0x060001B5 RID: 437 RVA: 0x0000C464 File Offset: 0x0000A664
	private void On_TouchUp(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_TouchUp, gesture);
	}

	// Token: 0x060001B6 RID: 438 RVA: 0x0000C470 File Offset: 0x0000A670
	private void On_SimpleTap(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_SimpleTap, gesture);
	}

	// Token: 0x060001B7 RID: 439 RVA: 0x0000C47C File Offset: 0x0000A67C
	private void On_DoubleTap(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_DoubleTap, gesture);
	}

	// Token: 0x060001B8 RID: 440 RVA: 0x0000C488 File Offset: 0x0000A688
	private void On_LongTapStart(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_LongTapStart, gesture);
	}

	// Token: 0x060001B9 RID: 441 RVA: 0x0000C494 File Offset: 0x0000A694
	private void On_LongTap(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_LongTap, gesture);
	}

	// Token: 0x060001BA RID: 442 RVA: 0x0000C4A0 File Offset: 0x0000A6A0
	private void On_LongTapEnd(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_LongTapEnd, gesture);
	}

	// Token: 0x060001BB RID: 443 RVA: 0x0000C4AC File Offset: 0x0000A6AC
	private void On_SwipeStart(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_SwipeStart, gesture);
	}

	// Token: 0x060001BC RID: 444 RVA: 0x0000C4B8 File Offset: 0x0000A6B8
	private void On_Swipe(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_Swipe, gesture);
	}

	// Token: 0x060001BD RID: 445 RVA: 0x0000C4C4 File Offset: 0x0000A6C4
	private void On_SwipeEnd(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_SwipeEnd, gesture);
	}

	// Token: 0x060001BE RID: 446 RVA: 0x0000C4D0 File Offset: 0x0000A6D0
	private void On_DragStart(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_DragStart, gesture);
	}

	// Token: 0x060001BF RID: 447 RVA: 0x0000C4DC File Offset: 0x0000A6DC
	private void On_Drag(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_Drag, gesture);
	}

	// Token: 0x060001C0 RID: 448 RVA: 0x0000C4E8 File Offset: 0x0000A6E8
	private void On_DragEnd(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_DragEnd, gesture);
	}

	// Token: 0x060001C1 RID: 449 RVA: 0x0000C4F4 File Offset: 0x0000A6F4
	private void On_Cancel(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_Cancel, gesture);
	}

	// Token: 0x060001C2 RID: 450 RVA: 0x0000C500 File Offset: 0x0000A700
	private void On_TouchStart2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_TouchStart2Fingers, gesture);
	}

	// Token: 0x060001C3 RID: 451 RVA: 0x0000C50C File Offset: 0x0000A70C
	private void On_TouchDown2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_TouchDown2Fingers, gesture);
	}

	// Token: 0x060001C4 RID: 452 RVA: 0x0000C518 File Offset: 0x0000A718
	private void On_TouchUp2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_TouchUp2Fingers, gesture);
	}

	// Token: 0x060001C5 RID: 453 RVA: 0x0000C524 File Offset: 0x0000A724
	private void On_LongTapStart2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_LongTapStart2Fingers, gesture);
	}

	// Token: 0x060001C6 RID: 454 RVA: 0x0000C530 File Offset: 0x0000A730
	private void On_LongTap2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_LongTap2Fingers, gesture);
	}

	// Token: 0x060001C7 RID: 455 RVA: 0x0000C53C File Offset: 0x0000A73C
	private void On_LongTapEnd2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_LongTapEnd2Fingers, gesture);
	}

	// Token: 0x060001C8 RID: 456 RVA: 0x0000C548 File Offset: 0x0000A748
	private void On_DragStart2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_DragStart2Fingers, gesture);
	}

	// Token: 0x060001C9 RID: 457 RVA: 0x0000C554 File Offset: 0x0000A754
	private void On_Drag2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_Drag2Fingers, gesture);
	}

	// Token: 0x060001CA RID: 458 RVA: 0x0000C560 File Offset: 0x0000A760
	private void On_DragEnd2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_DragEnd2Fingers, gesture);
	}

	// Token: 0x060001CB RID: 459 RVA: 0x0000C56C File Offset: 0x0000A76C
	private void On_SwipeStart2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_SwipeStart2Fingers, gesture);
	}

	// Token: 0x060001CC RID: 460 RVA: 0x0000C578 File Offset: 0x0000A778
	private void On_Swipe2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_Swipe2Fingers, gesture);
	}

	// Token: 0x060001CD RID: 461 RVA: 0x0000C584 File Offset: 0x0000A784
	private void On_SwipeEnd2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_SwipeEnd2Fingers, gesture);
	}

	// Token: 0x060001CE RID: 462 RVA: 0x0000C590 File Offset: 0x0000A790
	private void On_Twist(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_Twist, gesture);
	}

	// Token: 0x060001CF RID: 463 RVA: 0x0000C59C File Offset: 0x0000A79C
	private void On_TwistEnd(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_TwistEnd, gesture);
	}

	// Token: 0x060001D0 RID: 464 RVA: 0x0000C5A8 File Offset: 0x0000A7A8
	private void On_Pinch(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_Pinch, gesture);
	}

	// Token: 0x060001D1 RID: 465 RVA: 0x0000C5B4 File Offset: 0x0000A7B4
	private void On_PinchOut(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_PinchOut, gesture);
	}

	// Token: 0x060001D2 RID: 466 RVA: 0x0000C5C0 File Offset: 0x0000A7C0
	private void On_PinchIn(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_PinchIn, gesture);
	}

	// Token: 0x060001D3 RID: 467 RVA: 0x0000C5CC File Offset: 0x0000A7CC
	private void On_PinchEnd(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_PinchEnd, gesture);
	}

	// Token: 0x060001D4 RID: 468 RVA: 0x0000C5D8 File Offset: 0x0000A7D8
	private void On_SimpleTap2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_SimpleTap2Fingers, gesture);
	}

	// Token: 0x060001D5 RID: 469 RVA: 0x0000C5E4 File Offset: 0x0000A7E4
	private void On_DoubleTap2Fingers(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_DoubleTap2Fingers, gesture);
	}

	// Token: 0x060001D6 RID: 470 RVA: 0x0000C5F0 File Offset: 0x0000A7F0
	private void On_UIElementTouchUp(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_UIElementTouchUp, gesture);
	}

	// Token: 0x060001D7 RID: 471 RVA: 0x0000C5FC File Offset: 0x0000A7FC
	private void On_OverUIElement(Gesture gesture)
	{
		this.TriggerScheduler(EasyTouch.EventName.On_OverUIElement, gesture);
	}

	// Token: 0x060001D8 RID: 472 RVA: 0x0000C608 File Offset: 0x0000A808
	public void AddTrigger(EasyTouch.EventName ev)
	{
		EasyTouchTrigger.EasyTouchReceiver easyTouchReceiver = new EasyTouchTrigger.EasyTouchReceiver();
		easyTouchReceiver.enable = true;
		easyTouchReceiver.restricted = true;
		easyTouchReceiver.eventName = ev;
		easyTouchReceiver.gameObject = null;
		easyTouchReceiver.otherReceiver = false;
		easyTouchReceiver.name = "New trigger";
		this.receivers.Add(easyTouchReceiver);
		if (Application.isPlaying)
		{
			this.UnsubscribeEasyTouchEvent();
			this.SubscribeEasyTouchEvent();
		}
	}

	// Token: 0x060001D9 RID: 473 RVA: 0x0000C66C File Offset: 0x0000A86C
	public bool SetTriggerEnable(string triggerName, bool value)
	{
		EasyTouchTrigger.EasyTouchReceiver trigger = this.GetTrigger(triggerName);
		if (trigger != null)
		{
			trigger.enable = value;
			return true;
		}
		return false;
	}

	// Token: 0x060001DA RID: 474 RVA: 0x0000C694 File Offset: 0x0000A894
	public bool GetTriggerEnable(string triggerName)
	{
		EasyTouchTrigger.EasyTouchReceiver trigger = this.GetTrigger(triggerName);
		return trigger != null && trigger.enable;
	}

	// Token: 0x060001DB RID: 475 RVA: 0x0000C6B8 File Offset: 0x0000A8B8
	private void TriggerScheduler(EasyTouch.EventName evnt, Gesture gesture)
	{
		foreach (EasyTouchTrigger.EasyTouchReceiver easyTouchReceiver in this.receivers)
		{
			if (easyTouchReceiver.enable && easyTouchReceiver.eventName == evnt && ((easyTouchReceiver.restricted && gesture.pickedObject == base.gameObject) || (!easyTouchReceiver.restricted && (easyTouchReceiver.gameObject == null || easyTouchReceiver.gameObject == gesture.pickedObject))))
			{
				GameObject gameObject = base.gameObject;
				if (easyTouchReceiver.otherReceiver && easyTouchReceiver.gameObjectReceiver != null)
				{
					gameObject = easyTouchReceiver.gameObjectReceiver;
				}
				switch (easyTouchReceiver.parameter)
				{
				case EasyTouchTrigger.ETTParameter.None:
					gameObject.SendMessage(easyTouchReceiver.methodName, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Gesture:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Finger_Id:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.fingerIndex, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Touch_Count:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.touchCount, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Start_Position:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.startPosition, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Position:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.position, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Delta_Position:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.deltaPosition, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Swipe_Type:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.swipe, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Swipe_Length:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.swipeLength, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Swipe_Vector:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.swipeVector, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Delta_Pinch:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.deltaPinch, 1);
					break;
				case EasyTouchTrigger.ETTParameter.Twist_Anlge:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.twistAngle, 1);
					break;
				case EasyTouchTrigger.ETTParameter.ActionTime:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.actionTime, 1);
					break;
				case EasyTouchTrigger.ETTParameter.DeltaTime:
					gameObject.SendMessage(easyTouchReceiver.methodName, gesture.deltaTime, 1);
					break;
				case EasyTouchTrigger.ETTParameter.PickedObject:
					if (gesture.pickedObject != null)
					{
						gameObject.SendMessage(easyTouchReceiver.methodName, gesture.pickedObject, 1);
					}
					break;
				case EasyTouchTrigger.ETTParameter.PickedUIElement:
					if (gesture.pickedUIElement != null)
					{
						gameObject.SendMessage(easyTouchReceiver.methodName, gesture.pickedObject, 1);
					}
					break;
				}
			}
		}
	}

	// Token: 0x060001DC RID: 476 RVA: 0x0000C9D0 File Offset: 0x0000ABD0
	private bool IsRecevier4(EasyTouch.EventName evnt)
	{
		int num = this.receivers.FindIndex((EasyTouchTrigger.EasyTouchReceiver e) => e.eventName == evnt);
		return num > -1;
	}

	// Token: 0x060001DD RID: 477 RVA: 0x0000CA0C File Offset: 0x0000AC0C
	private EasyTouchTrigger.EasyTouchReceiver GetTrigger(string triggerName)
	{
		return this.receivers.Find((EasyTouchTrigger.EasyTouchReceiver n) => n.name == triggerName);
	}

	// Token: 0x040001CE RID: 462
	[SerializeField]
	public List<EasyTouchTrigger.EasyTouchReceiver> receivers = new List<EasyTouchTrigger.EasyTouchReceiver>();

	// Token: 0x0200003B RID: 59
	public enum ETTParameter
	{
		// Token: 0x040001D0 RID: 464
		None,
		// Token: 0x040001D1 RID: 465
		Gesture,
		// Token: 0x040001D2 RID: 466
		Finger_Id,
		// Token: 0x040001D3 RID: 467
		Touch_Count,
		// Token: 0x040001D4 RID: 468
		Start_Position,
		// Token: 0x040001D5 RID: 469
		Position,
		// Token: 0x040001D6 RID: 470
		Delta_Position,
		// Token: 0x040001D7 RID: 471
		Swipe_Type,
		// Token: 0x040001D8 RID: 472
		Swipe_Length,
		// Token: 0x040001D9 RID: 473
		Swipe_Vector,
		// Token: 0x040001DA RID: 474
		Delta_Pinch,
		// Token: 0x040001DB RID: 475
		Twist_Anlge,
		// Token: 0x040001DC RID: 476
		ActionTime,
		// Token: 0x040001DD RID: 477
		DeltaTime,
		// Token: 0x040001DE RID: 478
		PickedObject,
		// Token: 0x040001DF RID: 479
		PickedUIElement
	}

	// Token: 0x0200003C RID: 60
	[Serializable]
	public class EasyTouchReceiver
	{
		// Token: 0x040001E0 RID: 480
		public bool enable;

		// Token: 0x040001E1 RID: 481
		public string name;

		// Token: 0x040001E2 RID: 482
		public bool restricted;

		// Token: 0x040001E3 RID: 483
		public GameObject gameObject;

		// Token: 0x040001E4 RID: 484
		public bool otherReceiver;

		// Token: 0x040001E5 RID: 485
		public GameObject gameObjectReceiver;

		// Token: 0x040001E6 RID: 486
		public EasyTouch.EventName eventName;

		// Token: 0x040001E7 RID: 487
		public string methodName;

		// Token: 0x040001E8 RID: 488
		public EasyTouchTrigger.ETTParameter parameter;
	}
}
