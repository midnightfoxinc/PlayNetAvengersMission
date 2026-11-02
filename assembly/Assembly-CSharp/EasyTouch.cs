using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

// Token: 0x0200003E RID: 62
public class EasyTouch : MonoBehaviour
{
	// Token: 0x060001E0 RID: 480 RVA: 0x0000CA60 File Offset: 0x0000AC60
	public EasyTouch()
	{
		this.enable = true;
		this.allowUIDetection = true;
		this.enableUIMode = true;
		this.autoUpdatePickedUI = false;
		this.enabledNGuiMode = false;
		this.nGUICameras = new List<Camera>();
		this.autoSelect = true;
		this.touchCameras = new List<ECamera>();
		this.pickableLayers3D = 1;
		this.enable2D = false;
		this.pickableLayers2D = 1;
		this.gesturePriority = EasyTouch.GesturePriority.Tap;
		this.StationaryTolerance = 15f;
		this.longTapTime = 1f;
		this.doubleTapDetection = EasyTouch.DoubleTapDetection.BySystem;
		this.doubleTapTime = 0.3f;
		this.swipeTolerance = 0.85f;
		this.enable2FingersGesture = true;
		this.twoFingerPickMethod = EasyTouch.TwoFingerPickMethod.Finger;
		this.enable2FingersSwipe = true;
		this.enablePinch = true;
		this.minPinchLength = 0.1f;
		this.enableTwist = true;
		this.minTwistAngle = 0.1f;
		this.enableSimulation = true;
		this.twistKey = 308;
		this.swipeKey = 306;
	}

	// Token: 0x14000001 RID: 1
	// (add) Token: 0x060001E1 RID: 481 RVA: 0x0000CBB8 File Offset: 0x0000ADB8
	// (remove) Token: 0x060001E2 RID: 482 RVA: 0x0000CBD0 File Offset: 0x0000ADD0
	public static event EasyTouch.TouchCancelHandler On_Cancel;

	// Token: 0x14000002 RID: 2
	// (add) Token: 0x060001E3 RID: 483 RVA: 0x0000CBE8 File Offset: 0x0000ADE8
	// (remove) Token: 0x060001E4 RID: 484 RVA: 0x0000CC00 File Offset: 0x0000AE00
	public static event EasyTouch.Cancel2FingersHandler On_Cancel2Fingers;

	// Token: 0x14000003 RID: 3
	// (add) Token: 0x060001E5 RID: 485 RVA: 0x0000CC18 File Offset: 0x0000AE18
	// (remove) Token: 0x060001E6 RID: 486 RVA: 0x0000CC30 File Offset: 0x0000AE30
	public static event EasyTouch.TouchStartHandler On_TouchStart;

	// Token: 0x14000004 RID: 4
	// (add) Token: 0x060001E7 RID: 487 RVA: 0x0000CC48 File Offset: 0x0000AE48
	// (remove) Token: 0x060001E8 RID: 488 RVA: 0x0000CC60 File Offset: 0x0000AE60
	public static event EasyTouch.TouchDownHandler On_TouchDown;

	// Token: 0x14000005 RID: 5
	// (add) Token: 0x060001E9 RID: 489 RVA: 0x0000CC78 File Offset: 0x0000AE78
	// (remove) Token: 0x060001EA RID: 490 RVA: 0x0000CC90 File Offset: 0x0000AE90
	public static event EasyTouch.TouchUpHandler On_TouchUp;

	// Token: 0x14000006 RID: 6
	// (add) Token: 0x060001EB RID: 491 RVA: 0x0000CCA8 File Offset: 0x0000AEA8
	// (remove) Token: 0x060001EC RID: 492 RVA: 0x0000CCC0 File Offset: 0x0000AEC0
	public static event EasyTouch.SimpleTapHandler On_SimpleTap;

	// Token: 0x14000007 RID: 7
	// (add) Token: 0x060001ED RID: 493 RVA: 0x0000CCD8 File Offset: 0x0000AED8
	// (remove) Token: 0x060001EE RID: 494 RVA: 0x0000CCF0 File Offset: 0x0000AEF0
	public static event EasyTouch.DoubleTapHandler On_DoubleTap;

	// Token: 0x14000008 RID: 8
	// (add) Token: 0x060001EF RID: 495 RVA: 0x0000CD08 File Offset: 0x0000AF08
	// (remove) Token: 0x060001F0 RID: 496 RVA: 0x0000CD20 File Offset: 0x0000AF20
	public static event EasyTouch.LongTapStartHandler On_LongTapStart;

	// Token: 0x14000009 RID: 9
	// (add) Token: 0x060001F1 RID: 497 RVA: 0x0000CD38 File Offset: 0x0000AF38
	// (remove) Token: 0x060001F2 RID: 498 RVA: 0x0000CD50 File Offset: 0x0000AF50
	public static event EasyTouch.LongTapHandler On_LongTap;

	// Token: 0x1400000A RID: 10
	// (add) Token: 0x060001F3 RID: 499 RVA: 0x0000CD68 File Offset: 0x0000AF68
	// (remove) Token: 0x060001F4 RID: 500 RVA: 0x0000CD80 File Offset: 0x0000AF80
	public static event EasyTouch.LongTapEndHandler On_LongTapEnd;

	// Token: 0x1400000B RID: 11
	// (add) Token: 0x060001F5 RID: 501 RVA: 0x0000CD98 File Offset: 0x0000AF98
	// (remove) Token: 0x060001F6 RID: 502 RVA: 0x0000CDB0 File Offset: 0x0000AFB0
	public static event EasyTouch.DragStartHandler On_DragStart;

	// Token: 0x1400000C RID: 12
	// (add) Token: 0x060001F7 RID: 503 RVA: 0x0000CDC8 File Offset: 0x0000AFC8
	// (remove) Token: 0x060001F8 RID: 504 RVA: 0x0000CDE0 File Offset: 0x0000AFE0
	public static event EasyTouch.DragHandler On_Drag;

	// Token: 0x1400000D RID: 13
	// (add) Token: 0x060001F9 RID: 505 RVA: 0x0000CDF8 File Offset: 0x0000AFF8
	// (remove) Token: 0x060001FA RID: 506 RVA: 0x0000CE10 File Offset: 0x0000B010
	public static event EasyTouch.DragEndHandler On_DragEnd;

	// Token: 0x1400000E RID: 14
	// (add) Token: 0x060001FB RID: 507 RVA: 0x0000CE28 File Offset: 0x0000B028
	// (remove) Token: 0x060001FC RID: 508 RVA: 0x0000CE40 File Offset: 0x0000B040
	public static event EasyTouch.SwipeStartHandler On_SwipeStart;

	// Token: 0x1400000F RID: 15
	// (add) Token: 0x060001FD RID: 509 RVA: 0x0000CE58 File Offset: 0x0000B058
	// (remove) Token: 0x060001FE RID: 510 RVA: 0x0000CE70 File Offset: 0x0000B070
	public static event EasyTouch.SwipeHandler On_Swipe;

	// Token: 0x14000010 RID: 16
	// (add) Token: 0x060001FF RID: 511 RVA: 0x0000CE88 File Offset: 0x0000B088
	// (remove) Token: 0x06000200 RID: 512 RVA: 0x0000CEA0 File Offset: 0x0000B0A0
	public static event EasyTouch.SwipeEndHandler On_SwipeEnd;

	// Token: 0x14000011 RID: 17
	// (add) Token: 0x06000201 RID: 513 RVA: 0x0000CEB8 File Offset: 0x0000B0B8
	// (remove) Token: 0x06000202 RID: 514 RVA: 0x0000CED0 File Offset: 0x0000B0D0
	public static event EasyTouch.TouchStart2FingersHandler On_TouchStart2Fingers;

	// Token: 0x14000012 RID: 18
	// (add) Token: 0x06000203 RID: 515 RVA: 0x0000CEE8 File Offset: 0x0000B0E8
	// (remove) Token: 0x06000204 RID: 516 RVA: 0x0000CF00 File Offset: 0x0000B100
	public static event EasyTouch.TouchDown2FingersHandler On_TouchDown2Fingers;

	// Token: 0x14000013 RID: 19
	// (add) Token: 0x06000205 RID: 517 RVA: 0x0000CF18 File Offset: 0x0000B118
	// (remove) Token: 0x06000206 RID: 518 RVA: 0x0000CF30 File Offset: 0x0000B130
	public static event EasyTouch.TouchUp2FingersHandler On_TouchUp2Fingers;

	// Token: 0x14000014 RID: 20
	// (add) Token: 0x06000207 RID: 519 RVA: 0x0000CF48 File Offset: 0x0000B148
	// (remove) Token: 0x06000208 RID: 520 RVA: 0x0000CF60 File Offset: 0x0000B160
	public static event EasyTouch.SimpleTap2FingersHandler On_SimpleTap2Fingers;

	// Token: 0x14000015 RID: 21
	// (add) Token: 0x06000209 RID: 521 RVA: 0x0000CF78 File Offset: 0x0000B178
	// (remove) Token: 0x0600020A RID: 522 RVA: 0x0000CF90 File Offset: 0x0000B190
	public static event EasyTouch.DoubleTap2FingersHandler On_DoubleTap2Fingers;

	// Token: 0x14000016 RID: 22
	// (add) Token: 0x0600020B RID: 523 RVA: 0x0000CFA8 File Offset: 0x0000B1A8
	// (remove) Token: 0x0600020C RID: 524 RVA: 0x0000CFC0 File Offset: 0x0000B1C0
	public static event EasyTouch.LongTapStart2FingersHandler On_LongTapStart2Fingers;

	// Token: 0x14000017 RID: 23
	// (add) Token: 0x0600020D RID: 525 RVA: 0x0000CFD8 File Offset: 0x0000B1D8
	// (remove) Token: 0x0600020E RID: 526 RVA: 0x0000CFF0 File Offset: 0x0000B1F0
	public static event EasyTouch.LongTap2FingersHandler On_LongTap2Fingers;

	// Token: 0x14000018 RID: 24
	// (add) Token: 0x0600020F RID: 527 RVA: 0x0000D008 File Offset: 0x0000B208
	// (remove) Token: 0x06000210 RID: 528 RVA: 0x0000D020 File Offset: 0x0000B220
	public static event EasyTouch.LongTapEnd2FingersHandler On_LongTapEnd2Fingers;

	// Token: 0x14000019 RID: 25
	// (add) Token: 0x06000211 RID: 529 RVA: 0x0000D038 File Offset: 0x0000B238
	// (remove) Token: 0x06000212 RID: 530 RVA: 0x0000D050 File Offset: 0x0000B250
	public static event EasyTouch.TwistHandler On_Twist;

	// Token: 0x1400001A RID: 26
	// (add) Token: 0x06000213 RID: 531 RVA: 0x0000D068 File Offset: 0x0000B268
	// (remove) Token: 0x06000214 RID: 532 RVA: 0x0000D080 File Offset: 0x0000B280
	public static event EasyTouch.TwistEndHandler On_TwistEnd;

	// Token: 0x1400001B RID: 27
	// (add) Token: 0x06000215 RID: 533 RVA: 0x0000D098 File Offset: 0x0000B298
	// (remove) Token: 0x06000216 RID: 534 RVA: 0x0000D0B0 File Offset: 0x0000B2B0
	public static event EasyTouch.PinchHandler On_Pinch;

	// Token: 0x1400001C RID: 28
	// (add) Token: 0x06000217 RID: 535 RVA: 0x0000D0C8 File Offset: 0x0000B2C8
	// (remove) Token: 0x06000218 RID: 536 RVA: 0x0000D0E0 File Offset: 0x0000B2E0
	public static event EasyTouch.PinchInHandler On_PinchIn;

	// Token: 0x1400001D RID: 29
	// (add) Token: 0x06000219 RID: 537 RVA: 0x0000D0F8 File Offset: 0x0000B2F8
	// (remove) Token: 0x0600021A RID: 538 RVA: 0x0000D110 File Offset: 0x0000B310
	public static event EasyTouch.PinchOutHandler On_PinchOut;

	// Token: 0x1400001E RID: 30
	// (add) Token: 0x0600021B RID: 539 RVA: 0x0000D128 File Offset: 0x0000B328
	// (remove) Token: 0x0600021C RID: 540 RVA: 0x0000D140 File Offset: 0x0000B340
	public static event EasyTouch.PinchEndHandler On_PinchEnd;

	// Token: 0x1400001F RID: 31
	// (add) Token: 0x0600021D RID: 541 RVA: 0x0000D158 File Offset: 0x0000B358
	// (remove) Token: 0x0600021E RID: 542 RVA: 0x0000D170 File Offset: 0x0000B370
	public static event EasyTouch.DragStart2FingersHandler On_DragStart2Fingers;

	// Token: 0x14000020 RID: 32
	// (add) Token: 0x0600021F RID: 543 RVA: 0x0000D188 File Offset: 0x0000B388
	// (remove) Token: 0x06000220 RID: 544 RVA: 0x0000D1A0 File Offset: 0x0000B3A0
	public static event EasyTouch.Drag2FingersHandler On_Drag2Fingers;

	// Token: 0x14000021 RID: 33
	// (add) Token: 0x06000221 RID: 545 RVA: 0x0000D1B8 File Offset: 0x0000B3B8
	// (remove) Token: 0x06000222 RID: 546 RVA: 0x0000D1D0 File Offset: 0x0000B3D0
	public static event EasyTouch.DragEnd2FingersHandler On_DragEnd2Fingers;

	// Token: 0x14000022 RID: 34
	// (add) Token: 0x06000223 RID: 547 RVA: 0x0000D1E8 File Offset: 0x0000B3E8
	// (remove) Token: 0x06000224 RID: 548 RVA: 0x0000D200 File Offset: 0x0000B400
	public static event EasyTouch.SwipeStart2FingersHandler On_SwipeStart2Fingers;

	// Token: 0x14000023 RID: 35
	// (add) Token: 0x06000225 RID: 549 RVA: 0x0000D218 File Offset: 0x0000B418
	// (remove) Token: 0x06000226 RID: 550 RVA: 0x0000D230 File Offset: 0x0000B430
	public static event EasyTouch.Swipe2FingersHandler On_Swipe2Fingers;

	// Token: 0x14000024 RID: 36
	// (add) Token: 0x06000227 RID: 551 RVA: 0x0000D248 File Offset: 0x0000B448
	// (remove) Token: 0x06000228 RID: 552 RVA: 0x0000D260 File Offset: 0x0000B460
	public static event EasyTouch.SwipeEnd2FingersHandler On_SwipeEnd2Fingers;

	// Token: 0x14000025 RID: 37
	// (add) Token: 0x06000229 RID: 553 RVA: 0x0000D278 File Offset: 0x0000B478
	// (remove) Token: 0x0600022A RID: 554 RVA: 0x0000D290 File Offset: 0x0000B490
	public static event EasyTouch.EasyTouchIsReadyHandler On_EasyTouchIsReady;

	// Token: 0x14000026 RID: 38
	// (add) Token: 0x0600022B RID: 555 RVA: 0x0000D2A8 File Offset: 0x0000B4A8
	// (remove) Token: 0x0600022C RID: 556 RVA: 0x0000D2C0 File Offset: 0x0000B4C0
	public static event EasyTouch.OverUIElementHandler On_OverUIElement;

	// Token: 0x14000027 RID: 39
	// (add) Token: 0x0600022D RID: 557 RVA: 0x0000D2D8 File Offset: 0x0000B4D8
	// (remove) Token: 0x0600022E RID: 558 RVA: 0x0000D2F0 File Offset: 0x0000B4F0
	public static event EasyTouch.UIElementTouchUpHandler On_UIElementTouchUp;

	// Token: 0x0600022F RID: 559 RVA: 0x0000D308 File Offset: 0x0000B508
	private void OnEnable()
	{
		if (Application.isPlaying && Application.isEditor)
		{
			this.InitEasyTouch();
		}
	}

	// Token: 0x06000230 RID: 560 RVA: 0x0000D324 File Offset: 0x0000B524
	private void Awake()
	{
		this.InitEasyTouch();
	}

	// Token: 0x06000231 RID: 561 RVA: 0x0000D32C File Offset: 0x0000B52C
	private void Start()
	{
		for (int i = 0; i < 100; i++)
		{
			this.singleDoubleTap[i] = new EasyTouch.DoubleTap();
		}
		int num = this.touchCameras.FindIndex((ECamera c) => c.camera == Camera.main);
		if (num < 0)
		{
			this.touchCameras.Add(new ECamera(Camera.main, false));
		}
		if (EasyTouch.On_EasyTouchIsReady != null)
		{
			EasyTouch.On_EasyTouchIsReady();
		}
	}

	// Token: 0x06000232 RID: 562 RVA: 0x0000D3B4 File Offset: 0x0000B5B4
	private void InitEasyTouch()
	{
		if (EasyTouch.instance == null)
		{
			EasyTouch.instance = this;
		}
	}

	// Token: 0x06000233 RID: 563 RVA: 0x0000D3CC File Offset: 0x0000B5CC
	private void OnDrawGizmos()
	{
	}

	// Token: 0x06000234 RID: 564 RVA: 0x0000D3D0 File Offset: 0x0000B5D0
	private void Update()
	{
		if (this.enable && EasyTouch.instance == this)
		{
			int num = this.input.TouchCount();
			if (this.oldTouchCount == 2 && num != 2 && num > 0)
			{
				this.CreateGesture2Finger(EasyTouch.EventName.On_Cancel2Fingers, Vector2.zero, Vector2.zero, Vector2.zero, 0f, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, 0f);
			}
			this.UpdateTouches(true, num);
			this.twoFinger.oldPickedObject = this.twoFinger.pickedObject;
			if (this.enable2FingersGesture && num == 2)
			{
				this.TwoFinger();
			}
			for (int i = 0; i < 100; i++)
			{
				if (this.fingers[i] != null)
				{
					this.OneFinger(i);
				}
			}
			this.oldTouchCount = num;
		}
	}

	// Token: 0x06000235 RID: 565 RVA: 0x0000D4B8 File Offset: 0x0000B6B8
	private void UpdateTouches(bool realTouch, int touchCount)
	{
		this.fingers.CopyTo(this.tmpArray, 0);
		if (realTouch || this.enableRemote)
		{
			this.ResetTouches();
			for (int i = 0; i < touchCount; i++)
			{
				Touch touch = Input.GetTouch(i);
				int num = 0;
				while (num < 100 && this.fingers[i] == null)
				{
					if (this.tmpArray[num] != null && this.tmpArray[num].fingerIndex == touch.fingerId)
					{
						this.fingers[i] = this.tmpArray[num];
					}
					num++;
				}
				if (this.fingers[i] == null)
				{
					this.fingers[i] = new Finger();
					this.fingers[i].fingerIndex = touch.fingerId;
					this.fingers[i].gesture = EasyTouch.GestureType.None;
					this.fingers[i].phase = 0;
				}
				else
				{
					this.fingers[i].phase = touch.phase;
				}
				if (this.fingers[i].phase != null)
				{
					this.fingers[i].deltaPosition = touch.position - this.fingers[i].position;
				}
				else
				{
					this.fingers[i].deltaPosition = Vector2.zero;
				}
				this.fingers[i].position = touch.position;
				this.fingers[i].tapCount = touch.tapCount;
				this.fingers[i].deltaTime = touch.deltaTime;
				this.fingers[i].touchCount = touchCount;
			}
		}
		else
		{
			for (int j = 0; j < touchCount; j++)
			{
				this.fingers[j] = this.input.GetMouseTouch(j, this.fingers[j]);
				this.fingers[j].touchCount = touchCount;
			}
		}
	}

	// Token: 0x06000236 RID: 566 RVA: 0x0000D69C File Offset: 0x0000B89C
	private void ResetTouches()
	{
		for (int i = 0; i < 100; i++)
		{
			this.fingers[i] = null;
		}
	}

	// Token: 0x06000237 RID: 567 RVA: 0x0000D6C8 File Offset: 0x0000B8C8
	private void OneFinger(int fingerIndex)
	{
		if (this.fingers[fingerIndex].gesture == EasyTouch.GestureType.None)
		{
			if (!this.singleDoubleTap[fingerIndex].inDoubleTap)
			{
				this.singleDoubleTap[fingerIndex].inDoubleTap = true;
				this.singleDoubleTap[fingerIndex].time = 0f;
				this.singleDoubleTap[fingerIndex].count = 1;
			}
			this.fingers[fingerIndex].startTimeAction = Time.realtimeSinceStartup;
			this.fingers[fingerIndex].gesture = EasyTouch.GestureType.Acquisition;
			this.fingers[fingerIndex].startPosition = this.fingers[fingerIndex].position;
			if (this.autoSelect && this.GetPickedGameObject(this.fingers[fingerIndex], false))
			{
				this.fingers[fingerIndex].pickedObject = this.pickedObject.pickedObj;
				this.fingers[fingerIndex].isGuiCamera = this.pickedObject.isGUI;
				this.fingers[fingerIndex].pickedCamera = this.pickedObject.pickedCamera;
			}
			if (this.allowUIDetection)
			{
				this.fingers[fingerIndex].isOverGui = this.IsScreenPositionOverUI(this.fingers[fingerIndex].position);
				this.fingers[fingerIndex].pickedUIElement = this.GetFirstUIElementFromCache();
			}
			this.CreateGesture(fingerIndex, EasyTouch.EventName.On_TouchStart, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
		}
		if (this.singleDoubleTap[fingerIndex].inDoubleTap)
		{
			this.singleDoubleTap[fingerIndex].time += Time.deltaTime;
		}
		this.fingers[fingerIndex].actionTime = Time.realtimeSinceStartup - this.fingers[fingerIndex].startTimeAction;
		if (this.fingers[fingerIndex].phase == 4)
		{
			this.fingers[fingerIndex].gesture = EasyTouch.GestureType.Cancel;
		}
		if (this.fingers[fingerIndex].phase != 3 && this.fingers[fingerIndex].phase != 4)
		{
			if (this.fingers[fingerIndex].phase == 2 && this.fingers[fingerIndex].actionTime >= this.longTapTime && this.fingers[fingerIndex].gesture == EasyTouch.GestureType.Acquisition)
			{
				this.fingers[fingerIndex].gesture = EasyTouch.GestureType.LongTap;
				this.CreateGesture(fingerIndex, EasyTouch.EventName.On_LongTapStart, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
			}
			if (((this.fingers[fingerIndex].gesture == EasyTouch.GestureType.Acquisition || this.fingers[fingerIndex].gesture == EasyTouch.GestureType.LongTap) && this.fingers[fingerIndex].phase == 1 && this.gesturePriority == EasyTouch.GesturePriority.Slips) || ((this.fingers[fingerIndex].gesture == EasyTouch.GestureType.Acquisition || this.fingers[fingerIndex].gesture == EasyTouch.GestureType.LongTap) && !this.FingerInTolerance(this.fingers[fingerIndex]) && this.gesturePriority == EasyTouch.GesturePriority.Tap))
			{
				if (this.fingers[fingerIndex].gesture == EasyTouch.GestureType.LongTap)
				{
					this.fingers[fingerIndex].gesture = EasyTouch.GestureType.Cancel;
					this.CreateGesture(fingerIndex, EasyTouch.EventName.On_LongTapEnd, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
					this.fingers[fingerIndex].gesture = EasyTouch.GestureType.Acquisition;
				}
				else
				{
					this.fingers[fingerIndex].oldSwipeType = EasyTouch.SwipeDirection.None;
					if (this.fingers[fingerIndex].pickedObject)
					{
						this.fingers[fingerIndex].gesture = EasyTouch.GestureType.Drag;
						this.CreateGesture(fingerIndex, EasyTouch.EventName.On_DragStart, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
					}
					else
					{
						this.fingers[fingerIndex].gesture = EasyTouch.GestureType.Swipe;
						this.CreateGesture(fingerIndex, EasyTouch.EventName.On_SwipeStart, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
					}
				}
			}
			EasyTouch.EventName eventName = EasyTouch.EventName.None;
			switch (this.fingers[fingerIndex].gesture)
			{
			case EasyTouch.GestureType.Drag:
				eventName = EasyTouch.EventName.On_Drag;
				break;
			case EasyTouch.GestureType.Swipe:
				eventName = EasyTouch.EventName.On_Swipe;
				break;
			case EasyTouch.GestureType.LongTap:
				eventName = EasyTouch.EventName.On_LongTap;
				break;
			}
			EasyTouch.SwipeDirection swipe = this.GetSwipe(new Vector2(0f, 0f), this.fingers[fingerIndex].deltaPosition);
			if (eventName != EasyTouch.EventName.None)
			{
				this.fingers[fingerIndex].oldSwipeType = swipe;
				this.CreateGesture(fingerIndex, eventName, this.fingers[fingerIndex], swipe, 0f, this.fingers[fingerIndex].deltaPosition);
			}
			this.CreateGesture(fingerIndex, EasyTouch.EventName.On_TouchDown, this.fingers[fingerIndex], swipe, 0f, this.fingers[fingerIndex].deltaPosition);
		}
		else
		{
			switch (this.fingers[fingerIndex].gesture)
			{
			case EasyTouch.GestureType.Drag:
				this.CreateGesture(fingerIndex, EasyTouch.EventName.On_DragEnd, this.fingers[fingerIndex], this.GetSwipe(this.fingers[fingerIndex].startPosition, this.fingers[fingerIndex].position), (this.fingers[fingerIndex].startPosition - this.fingers[fingerIndex].position).magnitude, this.fingers[fingerIndex].position - this.fingers[fingerIndex].startPosition);
				break;
			case EasyTouch.GestureType.Swipe:
				this.CreateGesture(fingerIndex, EasyTouch.EventName.On_SwipeEnd, this.fingers[fingerIndex], this.GetSwipe(this.fingers[fingerIndex].startPosition, this.fingers[fingerIndex].position), (this.fingers[fingerIndex].position - this.fingers[fingerIndex].startPosition).magnitude, this.fingers[fingerIndex].position - this.fingers[fingerIndex].startPosition);
				break;
			case EasyTouch.GestureType.LongTap:
				this.CreateGesture(fingerIndex, EasyTouch.EventName.On_LongTapEnd, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
				break;
			case EasyTouch.GestureType.Cancel:
				this.CreateGesture(fingerIndex, EasyTouch.EventName.On_Cancel, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
				break;
			case EasyTouch.GestureType.Acquisition:
				if (this.doubleTapDetection == EasyTouch.DoubleTapDetection.BySystem)
				{
					if (this.FingerInTolerance(this.fingers[fingerIndex]))
					{
						if (this.fingers[fingerIndex].tapCount < 2)
						{
							this.CreateGesture(fingerIndex, EasyTouch.EventName.On_SimpleTap, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
						}
						else
						{
							this.CreateGesture(fingerIndex, EasyTouch.EventName.On_DoubleTap, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
						}
					}
				}
				else if (!this.singleDoubleTap[fingerIndex].inWait)
				{
					this.singleDoubleTap[fingerIndex].finger = this.fingers[fingerIndex];
					base.StartCoroutine(this.SingleOrDouble(fingerIndex));
				}
				else
				{
					this.singleDoubleTap[fingerIndex].count++;
				}
				break;
			}
			this.CreateGesture(fingerIndex, EasyTouch.EventName.On_TouchUp, this.fingers[fingerIndex], EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
			this.fingers[fingerIndex] = null;
		}
	}

	// Token: 0x06000238 RID: 568 RVA: 0x0000DD98 File Offset: 0x0000BF98
	private IEnumerator SingleOrDouble(int fingerIndex)
	{
		this.singleDoubleTap[fingerIndex].inWait = true;
		float time2Wait = this.doubleTapTime - this.singleDoubleTap[fingerIndex].finger.actionTime;
		if (time2Wait < 0f)
		{
			time2Wait = 0f;
		}
		yield return new WaitForSeconds(time2Wait);
		if (this.singleDoubleTap[fingerIndex].count < 2)
		{
			this.CreateGesture(fingerIndex, EasyTouch.EventName.On_SimpleTap, this.singleDoubleTap[fingerIndex].finger, EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
		}
		else
		{
			this.CreateGesture(fingerIndex, EasyTouch.EventName.On_DoubleTap, this.singleDoubleTap[fingerIndex].finger, EasyTouch.SwipeDirection.None, 0f, Vector2.zero);
		}
		this.singleDoubleTap[fingerIndex].Stop();
		base.StopCoroutine("SingleOrDouble");
		yield break;
	}

	// Token: 0x06000239 RID: 569 RVA: 0x0000DDC4 File Offset: 0x0000BFC4
	private void CreateGesture(int touchIndex, EasyTouch.EventName message, Finger finger, EasyTouch.SwipeDirection swipe, float swipeLength, Vector2 swipeVector)
	{
		bool flag = true;
		if (this.autoUpdatePickedUI && this.allowUIDetection)
		{
			finger.isOverGui = this.IsScreenPositionOverUI(finger.position);
			finger.pickedUIElement = this.GetFirstUIElementFromCache();
		}
		if (this.enabledNGuiMode && message == EasyTouch.EventName.On_TouchStart)
		{
			finger.isOverGui = (finger.isOverGui || this.IsTouchOverNGui(finger.position, false));
		}
		if (this.enableUIMode || this.enabledNGuiMode)
		{
			flag = !finger.isOverGui;
		}
		Gesture gesture = finger.GetGesture();
		if (this.autoUpdatePickedObject && this.autoSelect && message != EasyTouch.EventName.On_Drag && message != EasyTouch.EventName.On_DragEnd && message != EasyTouch.EventName.On_DragStart)
		{
			if (this.GetPickedGameObject(finger, false))
			{
				gesture.pickedObject = this.pickedObject.pickedObj;
				gesture.pickedCamera = this.pickedObject.pickedCamera;
				gesture.isGuiCamera = this.pickedObject.isGUI;
			}
			else
			{
				gesture.pickedObject = null;
				gesture.pickedCamera = null;
				gesture.isGuiCamera = false;
			}
		}
		gesture.swipe = swipe;
		gesture.swipeLength = swipeLength;
		gesture.swipeVector = swipeVector;
		gesture.deltaPinch = 0f;
		gesture.twistAngle = 0f;
		if (flag)
		{
			this.RaiseEvent(message, gesture);
		}
		else if (finger.isOverGui)
		{
			if (message == EasyTouch.EventName.On_TouchUp)
			{
				this.RaiseEvent(EasyTouch.EventName.On_UIElementTouchUp, gesture);
			}
			else
			{
				this.RaiseEvent(EasyTouch.EventName.On_OverUIElement, gesture);
			}
		}
	}

	// Token: 0x0600023A RID: 570 RVA: 0x0000DF54 File Offset: 0x0000C154
	private void TwoFinger()
	{
		bool flag = false;
		if (this.twoFinger.currentGesture == EasyTouch.GestureType.None)
		{
			if (!this.singleDoubleTap[99].inDoubleTap)
			{
				this.singleDoubleTap[99].inDoubleTap = true;
				this.singleDoubleTap[99].time = 0f;
				this.singleDoubleTap[99].count = 1;
			}
			this.twoFinger.finger0 = this.GetTwoFinger(-1);
			this.twoFinger.finger1 = this.GetTwoFinger(this.twoFinger.finger0);
			this.twoFinger.startTimeAction = Time.realtimeSinceStartup;
			this.twoFinger.currentGesture = EasyTouch.GestureType.Acquisition;
			this.fingers[this.twoFinger.finger0].startPosition = this.fingers[this.twoFinger.finger0].position;
			this.fingers[this.twoFinger.finger1].startPosition = this.fingers[this.twoFinger.finger1].position;
			this.fingers[this.twoFinger.finger0].oldPosition = this.fingers[this.twoFinger.finger0].position;
			this.fingers[this.twoFinger.finger1].oldPosition = this.fingers[this.twoFinger.finger1].position;
			this.twoFinger.oldFingerDistance = Mathf.Abs(Vector2.Distance(this.fingers[this.twoFinger.finger0].position, this.fingers[this.twoFinger.finger1].position));
			this.twoFinger.startPosition = new Vector2((this.fingers[this.twoFinger.finger0].position.x + this.fingers[this.twoFinger.finger1].position.x) / 2f, (this.fingers[this.twoFinger.finger0].position.y + this.fingers[this.twoFinger.finger1].position.y) / 2f);
			this.twoFinger.position = this.twoFinger.startPosition;
			this.twoFinger.oldStartPosition = this.twoFinger.startPosition;
			this.twoFinger.deltaPosition = Vector2.zero;
			if (this.autoSelect)
			{
				if (this.GetTwoFingerPickedObject())
				{
					this.twoFinger.pickedObject = this.pickedObject.pickedObj;
					this.twoFinger.pickedCamera = this.pickedObject.pickedCamera;
					this.twoFinger.isGuiCamera = this.pickedObject.isGUI;
				}
				else
				{
					this.twoFinger.ClearPickedObjectData();
				}
			}
			if (this.allowUIDetection)
			{
				if (this.GetTwoFingerPickedUIElement())
				{
					this.twoFinger.pickedUIElement = this.pickedObject.pickedObj;
					this.twoFinger.isOverGui = true;
				}
				else
				{
					this.twoFinger.ClearPickedUIData();
				}
			}
			this.CreateGesture2Finger(EasyTouch.EventName.On_TouchStart2Fingers, this.twoFinger.startPosition, this.twoFinger.startPosition, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, this.twoFinger.oldFingerDistance);
		}
		if (this.singleDoubleTap[99].inDoubleTap)
		{
			this.singleDoubleTap[99].time += Time.deltaTime;
		}
		this.twoFinger.timeSinceStartAction = Time.realtimeSinceStartup - this.twoFinger.startTimeAction;
		this.twoFinger.position = new Vector2((this.fingers[this.twoFinger.finger0].position.x + this.fingers[this.twoFinger.finger1].position.x) / 2f, (this.fingers[this.twoFinger.finger0].position.y + this.fingers[this.twoFinger.finger1].position.y) / 2f);
		this.twoFinger.deltaPosition = this.twoFinger.position - this.twoFinger.oldStartPosition;
		this.twoFinger.fingerDistance = Mathf.Abs(Vector2.Distance(this.fingers[this.twoFinger.finger0].position, this.fingers[this.twoFinger.finger1].position));
		if (this.fingers[this.twoFinger.finger0].phase == 4 || this.fingers[this.twoFinger.finger1].phase == 4)
		{
			this.twoFinger.currentGesture = EasyTouch.GestureType.Cancel;
		}
		if (this.fingers[this.twoFinger.finger0].phase != 3 && this.fingers[this.twoFinger.finger1].phase != 3 && this.twoFinger.currentGesture != EasyTouch.GestureType.Cancel)
		{
			if (this.twoFinger.currentGesture == EasyTouch.GestureType.Acquisition && this.twoFinger.timeSinceStartAction >= this.longTapTime && this.FingerInTolerance(this.fingers[this.twoFinger.finger0]) && this.FingerInTolerance(this.fingers[this.twoFinger.finger1]))
			{
				this.twoFinger.currentGesture = EasyTouch.GestureType.LongTap;
				this.CreateGesture2Finger(EasyTouch.EventName.On_LongTapStart2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, this.twoFinger.fingerDistance);
			}
			if (((!this.FingerInTolerance(this.fingers[this.twoFinger.finger0]) || !this.FingerInTolerance(this.fingers[this.twoFinger.finger1])) && this.gesturePriority == EasyTouch.GesturePriority.Tap) || ((this.fingers[this.twoFinger.finger0].phase == 1 || this.fingers[this.twoFinger.finger1].phase == 1) && this.gesturePriority == EasyTouch.GesturePriority.Slips))
			{
				flag = true;
			}
			if (flag && this.twoFinger.currentGesture != EasyTouch.GestureType.Tap)
			{
				if (this.enable2FingersSwipe)
				{
					float num = Vector2.Dot(this.fingers[this.twoFinger.finger0].deltaPosition.normalized, this.fingers[this.twoFinger.finger1].deltaPosition.normalized);
					if (num > 0f)
					{
						if (this.twoFinger.oldGesture == EasyTouch.GestureType.LongTap)
						{
							this.CreateStateEnd2Fingers(this.twoFinger.currentGesture, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, false, this.twoFinger.fingerDistance);
							this.twoFinger.startTimeAction = Time.realtimeSinceStartup;
						}
						if (this.twoFinger.pickedObject && !this.twoFinger.dragStart)
						{
							this.twoFinger.currentGesture = EasyTouch.GestureType.Drag;
							this.CreateGesture2Finger(EasyTouch.EventName.On_DragStart2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, this.twoFinger.fingerDistance);
							this.twoFinger.dragStart = true;
						}
						else if (!this.twoFinger.pickedObject && !this.twoFinger.swipeStart)
						{
							this.twoFinger.currentGesture = EasyTouch.GestureType.Swipe;
							this.CreateGesture2Finger(EasyTouch.EventName.On_SwipeStart2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, this.twoFinger.fingerDistance);
							this.twoFinger.swipeStart = true;
						}
					}
					else if (num < 0f)
					{
						this.twoFinger.dragStart = false;
						this.twoFinger.swipeStart = false;
					}
					if (this.twoFinger.dragStart)
					{
						this.CreateGesture2Finger(EasyTouch.EventName.On_Drag2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, this.GetSwipe(this.twoFinger.oldStartPosition, this.twoFinger.position), 0f, this.twoFinger.deltaPosition, 0f, 0f, this.twoFinger.fingerDistance);
					}
					if (this.twoFinger.swipeStart)
					{
						this.CreateGesture2Finger(EasyTouch.EventName.On_Swipe2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, this.GetSwipe(this.twoFinger.oldStartPosition, this.twoFinger.position), 0f, this.twoFinger.deltaPosition, 0f, 0f, this.twoFinger.fingerDistance);
					}
				}
				Vector2 vector = this.fingers[this.twoFinger.finger0].position - this.fingers[this.twoFinger.finger1].position;
				Vector2 vector2 = this.fingers[this.twoFinger.finger0].oldPosition - this.fingers[this.twoFinger.finger1].oldPosition;
				float num2 = vector.magnitude - vector2.magnitude;
				if (this.enablePinch && ((Mathf.Abs(num2) >= this.minPinchLength && this.twoFinger.currentGesture != EasyTouch.GestureType.Pinch) || this.twoFinger.currentGesture == EasyTouch.GestureType.Pinch))
				{
					if (num2 != 0f && this.twoFinger.oldGesture == EasyTouch.GestureType.LongTap)
					{
						this.CreateStateEnd2Fingers(this.twoFinger.currentGesture, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, false, this.twoFinger.fingerDistance);
						this.twoFinger.startTimeAction = Time.realtimeSinceStartup;
					}
					this.twoFinger.currentGesture = EasyTouch.GestureType.Pinch;
					if (num2 > 0f)
					{
						this.CreateGesture2Finger(EasyTouch.EventName.On_PinchOut, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, this.GetSwipe(this.twoFinger.startPosition, this.twoFinger.position), 0f, Vector2.zero, 0f, Mathf.Abs(this.twoFinger.fingerDistance - this.twoFinger.oldFingerDistance), this.twoFinger.fingerDistance);
					}
					if (num2 < 0f)
					{
						this.CreateGesture2Finger(EasyTouch.EventName.On_PinchIn, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, this.GetSwipe(this.twoFinger.startPosition, this.twoFinger.position), 0f, Vector2.zero, 0f, Mathf.Abs(this.twoFinger.fingerDistance - this.twoFinger.oldFingerDistance), this.twoFinger.fingerDistance);
					}
					if (num2 < 0f || num2 > 0f)
					{
						this.CreateGesture2Finger(EasyTouch.EventName.On_Pinch, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, this.GetSwipe(this.twoFinger.startPosition, this.twoFinger.position), 0f, Vector2.zero, 0f, num2, this.twoFinger.fingerDistance);
					}
				}
				if (this.enableTwist)
				{
					float num3 = Vector2.Angle(vector2, vector);
					if (vector2 == vector)
					{
						num3 = 0f;
					}
					if ((Mathf.Abs(num3) >= this.minTwistAngle && this.twoFinger.currentGesture != EasyTouch.GestureType.Twist) || this.twoFinger.currentGesture == EasyTouch.GestureType.Twist)
					{
						if (this.twoFinger.oldGesture == EasyTouch.GestureType.LongTap)
						{
							this.CreateStateEnd2Fingers(this.twoFinger.currentGesture, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, false, this.twoFinger.fingerDistance);
							this.twoFinger.startTimeAction = Time.realtimeSinceStartup;
						}
						this.twoFinger.currentGesture = EasyTouch.GestureType.Twist;
						if (num3 != 0f)
						{
							num3 *= Mathf.Sign(Vector3.Cross(vector2, vector).z);
						}
						this.CreateGesture2Finger(EasyTouch.EventName.On_Twist, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, num3, 0f, this.twoFinger.fingerDistance);
					}
				}
			}
			else if (this.twoFinger.currentGesture == EasyTouch.GestureType.LongTap)
			{
				this.CreateGesture2Finger(EasyTouch.EventName.On_LongTap2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, this.twoFinger.fingerDistance);
			}
			this.CreateGesture2Finger(EasyTouch.EventName.On_TouchDown2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, this.GetSwipe(this.twoFinger.oldStartPosition, this.twoFinger.position), 0f, this.twoFinger.deltaPosition, 0f, 0f, this.twoFinger.fingerDistance);
			this.fingers[this.twoFinger.finger0].oldPosition = this.fingers[this.twoFinger.finger0].position;
			this.fingers[this.twoFinger.finger1].oldPosition = this.fingers[this.twoFinger.finger1].position;
			this.twoFinger.oldFingerDistance = this.twoFinger.fingerDistance;
			this.twoFinger.oldStartPosition = this.twoFinger.position;
			this.twoFinger.oldGesture = this.twoFinger.currentGesture;
		}
		else if (this.twoFinger.currentGesture != EasyTouch.GestureType.Acquisition && this.twoFinger.currentGesture != EasyTouch.GestureType.Tap)
		{
			this.CreateStateEnd2Fingers(this.twoFinger.currentGesture, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, true, this.twoFinger.fingerDistance);
			this.twoFinger.currentGesture = EasyTouch.GestureType.None;
			this.twoFinger.pickedObject = null;
			this.twoFinger.swipeStart = false;
			this.twoFinger.dragStart = false;
		}
		else
		{
			this.twoFinger.currentGesture = EasyTouch.GestureType.Tap;
			this.CreateStateEnd2Fingers(this.twoFinger.currentGesture, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, true, this.twoFinger.fingerDistance);
		}
	}

	// Token: 0x0600023B RID: 571 RVA: 0x0000EFC4 File Offset: 0x0000D1C4
	private void CreateStateEnd2Fingers(EasyTouch.GestureType gesture, Vector2 startPosition, Vector2 position, Vector2 deltaPosition, float time, bool realEnd, float fingerDistance)
	{
		switch (gesture)
		{
		case EasyTouch.GestureType.Tap:
		case EasyTouch.GestureType.Acquisition:
			if (this.doubleTapDetection == EasyTouch.DoubleTapDetection.BySystem)
			{
				if (this.fingers[this.twoFinger.finger0].tapCount < 2 && this.fingers[this.twoFinger.finger1].tapCount < 2)
				{
					this.CreateGesture2Finger(EasyTouch.EventName.On_SimpleTap2Fingers, startPosition, position, deltaPosition, time, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, fingerDistance);
				}
				else
				{
					this.CreateGesture2Finger(EasyTouch.EventName.On_DoubleTap2Fingers, startPosition, position, deltaPosition, time, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, fingerDistance);
				}
				this.twoFinger.currentGesture = EasyTouch.GestureType.None;
				this.twoFinger.pickedObject = null;
				this.twoFinger.swipeStart = false;
				this.twoFinger.dragStart = false;
				this.singleDoubleTap[99].Stop();
				base.StopCoroutine("SingleOrDouble2Fingers");
			}
			else if (!this.singleDoubleTap[99].inWait)
			{
				base.StartCoroutine("SingleOrDouble2Fingers");
			}
			else
			{
				this.singleDoubleTap[99].count++;
			}
			break;
		case EasyTouch.GestureType.LongTap:
			this.CreateGesture2Finger(EasyTouch.EventName.On_LongTapEnd2Fingers, startPosition, position, deltaPosition, time, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, fingerDistance);
			break;
		case EasyTouch.GestureType.Pinch:
			this.CreateGesture2Finger(EasyTouch.EventName.On_PinchEnd, startPosition, position, deltaPosition, time, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, fingerDistance);
			break;
		case EasyTouch.GestureType.Twist:
			this.CreateGesture2Finger(EasyTouch.EventName.On_TwistEnd, startPosition, position, deltaPosition, time, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, fingerDistance);
			break;
		}
		if (realEnd)
		{
			if (this.twoFinger.dragStart)
			{
				this.CreateGesture2Finger(EasyTouch.EventName.On_DragEnd2Fingers, startPosition, position, deltaPosition, time, this.GetSwipe(startPosition, position), (position - startPosition).magnitude, position - startPosition, 0f, 0f, fingerDistance);
			}
			if (this.twoFinger.swipeStart)
			{
				this.CreateGesture2Finger(EasyTouch.EventName.On_SwipeEnd2Fingers, startPosition, position, deltaPosition, time, this.GetSwipe(startPosition, position), (position - startPosition).magnitude, position - startPosition, 0f, 0f, fingerDistance);
			}
			this.CreateGesture2Finger(EasyTouch.EventName.On_TouchUp2Fingers, startPosition, position, deltaPosition, time, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, fingerDistance);
		}
	}

	// Token: 0x0600023C RID: 572 RVA: 0x0000F260 File Offset: 0x0000D460
	private IEnumerator SingleOrDouble2Fingers()
	{
		this.singleDoubleTap[99].inWait = true;
		yield return new WaitForSeconds(this.doubleTapTime);
		if (this.singleDoubleTap[99].count < 2)
		{
			this.CreateGesture2Finger(EasyTouch.EventName.On_SimpleTap2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, this.twoFinger.fingerDistance);
		}
		else
		{
			this.CreateGesture2Finger(EasyTouch.EventName.On_DoubleTap2Fingers, this.twoFinger.startPosition, this.twoFinger.position, this.twoFinger.deltaPosition, this.twoFinger.timeSinceStartAction, EasyTouch.SwipeDirection.None, 0f, Vector2.zero, 0f, 0f, this.twoFinger.fingerDistance);
		}
		this.twoFinger.currentGesture = EasyTouch.GestureType.None;
		this.twoFinger.pickedObject = null;
		this.twoFinger.swipeStart = false;
		this.twoFinger.dragStart = false;
		this.singleDoubleTap[99].Stop();
		base.StopCoroutine("SingleOrDouble2Fingers");
		yield break;
	}

	// Token: 0x0600023D RID: 573 RVA: 0x0000F27C File Offset: 0x0000D47C
	private void CreateGesture2Finger(EasyTouch.EventName message, Vector2 startPosition, Vector2 position, Vector2 deltaPosition, float actionTime, EasyTouch.SwipeDirection swipe, float swipeLength, Vector2 swipeVector, float twist, float pinch, float twoDistance)
	{
		bool flag = true;
		Gesture gesture = new Gesture();
		gesture.isOverGui = false;
		if (this.enabledNGuiMode && message == EasyTouch.EventName.On_TouchStart2Fingers)
		{
			gesture.isOverGui = (gesture.isOverGui || (this.IsTouchOverNGui(this.twoFinger.position, false) && this.IsTouchOverNGui(this.twoFinger.position, false)));
		}
		gesture.touchCount = 2;
		gesture.fingerIndex = -1;
		gesture.startPosition = startPosition;
		gesture.position = position;
		gesture.deltaPosition = deltaPosition;
		gesture.actionTime = actionTime;
		gesture.deltaTime = Time.deltaTime;
		gesture.swipe = swipe;
		gesture.swipeLength = swipeLength;
		gesture.swipeVector = swipeVector;
		gesture.deltaPinch = pinch;
		gesture.twistAngle = twist;
		gesture.twoFingerDistance = twoDistance;
		gesture.pickedObject = this.twoFinger.pickedObject;
		gesture.pickedCamera = this.twoFinger.pickedCamera;
		gesture.isGuiCamera = this.twoFinger.isGuiCamera;
		if (this.autoUpdatePickedObject && message != EasyTouch.EventName.On_Drag && message != EasyTouch.EventName.On_DragEnd && message != EasyTouch.EventName.On_Twist && message != EasyTouch.EventName.On_TwistEnd && message != EasyTouch.EventName.On_Pinch && message != EasyTouch.EventName.On_PinchEnd && message != EasyTouch.EventName.On_PinchIn && message != EasyTouch.EventName.On_PinchOut)
		{
			if (this.GetTwoFingerPickedObject())
			{
				gesture.pickedObject = this.pickedObject.pickedObj;
				gesture.pickedCamera = this.pickedObject.pickedCamera;
				gesture.isGuiCamera = this.pickedObject.isGUI;
			}
			else
			{
				this.twoFinger.ClearPickedObjectData();
			}
		}
		gesture.pickedUIElement = this.twoFinger.pickedUIElement;
		gesture.isOverGui = this.twoFinger.isOverGui;
		if (this.allowUIDetection && this.autoUpdatePickedUI && message != EasyTouch.EventName.On_Drag && message != EasyTouch.EventName.On_DragEnd && message != EasyTouch.EventName.On_Twist && message != EasyTouch.EventName.On_TwistEnd && message != EasyTouch.EventName.On_Pinch && message != EasyTouch.EventName.On_PinchEnd && message != EasyTouch.EventName.On_PinchIn && message != EasyTouch.EventName.On_PinchOut && message == EasyTouch.EventName.On_SimpleTap2Fingers)
		{
			if (this.GetTwoFingerPickedUIElement())
			{
				gesture.pickedUIElement = this.pickedObject.pickedObj;
				gesture.isOverGui = true;
			}
			else
			{
				this.twoFinger.ClearPickedUIData();
			}
		}
		if (this.enableUIMode || (this.enabledNGuiMode && this.allowUIDetection))
		{
			flag = !gesture.isOverGui;
		}
		if (flag)
		{
			this.RaiseEvent(message, gesture);
		}
		else if (gesture.isOverGui)
		{
			if (message == EasyTouch.EventName.On_TouchUp2Fingers)
			{
				this.RaiseEvent(EasyTouch.EventName.On_UIElementTouchUp, gesture);
			}
			else
			{
				this.RaiseEvent(EasyTouch.EventName.On_OverUIElement, gesture);
			}
		}
	}

	// Token: 0x0600023E RID: 574 RVA: 0x0000F53C File Offset: 0x0000D73C
	private int GetTwoFinger(int index)
	{
		int num = index + 1;
		bool flag = false;
		while (num < 10 && !flag)
		{
			if (this.fingers[num] != null && num >= index)
			{
				flag = true;
			}
			num++;
		}
		return num - 1;
	}

	// Token: 0x0600023F RID: 575 RVA: 0x0000F584 File Offset: 0x0000D784
	private bool GetTwoFingerPickedObject()
	{
		bool result = false;
		if (this.twoFingerPickMethod == EasyTouch.TwoFingerPickMethod.Finger)
		{
			if (this.GetPickedGameObject(this.fingers[this.twoFinger.finger0], false))
			{
				GameObject pickedObj = this.pickedObject.pickedObj;
				if (this.GetPickedGameObject(this.fingers[this.twoFinger.finger1], false) && pickedObj == this.pickedObject.pickedObj)
				{
					result = true;
				}
			}
		}
		else if (this.GetPickedGameObject(this.fingers[this.twoFinger.finger0], true))
		{
			result = true;
		}
		return result;
	}

	// Token: 0x06000240 RID: 576 RVA: 0x0000F624 File Offset: 0x0000D824
	private bool GetTwoFingerPickedUIElement()
	{
		bool result = false;
		if (this.fingers[this.twoFinger.finger0] == null)
		{
			return false;
		}
		if (this.twoFingerPickMethod == EasyTouch.TwoFingerPickMethod.Finger)
		{
			if (this.IsScreenPositionOverUI(this.fingers[this.twoFinger.finger0].position))
			{
				GameObject firstUIElementFromCache = this.GetFirstUIElementFromCache();
				if (this.IsScreenPositionOverUI(this.fingers[this.twoFinger.finger1].position))
				{
					GameObject firstUIElementFromCache2 = this.GetFirstUIElementFromCache();
					if (firstUIElementFromCache2 == firstUIElementFromCache || firstUIElementFromCache2.transform.IsChildOf(firstUIElementFromCache.transform) || firstUIElementFromCache.transform.IsChildOf(firstUIElementFromCache2.transform))
					{
						this.pickedObject.pickedObj = firstUIElementFromCache;
						this.pickedObject.isGUI = true;
						result = true;
					}
				}
			}
		}
		else if (this.IsScreenPositionOverUI(this.twoFinger.position))
		{
			this.pickedObject.pickedObj = this.GetFirstUIElementFromCache();
			this.pickedObject.isGUI = true;
			result = true;
		}
		return result;
	}

	// Token: 0x06000241 RID: 577 RVA: 0x0000F738 File Offset: 0x0000D938
	private void RaiseEvent(EasyTouch.EventName evnt, Gesture gesture)
	{
		switch (evnt)
		{
		case EasyTouch.EventName.On_TouchStart:
			if (EasyTouch.On_TouchStart != null)
			{
				EasyTouch.On_TouchStart(gesture);
			}
			break;
		case EasyTouch.EventName.On_TouchDown:
			if (EasyTouch.On_TouchDown != null)
			{
				EasyTouch.On_TouchDown(gesture);
			}
			break;
		case EasyTouch.EventName.On_TouchUp:
			if (EasyTouch.On_TouchUp != null)
			{
				EasyTouch.On_TouchUp(gesture);
			}
			break;
		case EasyTouch.EventName.On_SimpleTap:
			if (EasyTouch.On_SimpleTap != null)
			{
				EasyTouch.On_SimpleTap(gesture);
			}
			break;
		case EasyTouch.EventName.On_DoubleTap:
			if (EasyTouch.On_DoubleTap != null)
			{
				EasyTouch.On_DoubleTap(gesture);
			}
			break;
		case EasyTouch.EventName.On_LongTapStart:
			if (EasyTouch.On_LongTapStart != null)
			{
				EasyTouch.On_LongTapStart(gesture);
			}
			break;
		case EasyTouch.EventName.On_LongTap:
			if (EasyTouch.On_LongTap != null)
			{
				EasyTouch.On_LongTap(gesture);
			}
			break;
		case EasyTouch.EventName.On_LongTapEnd:
			if (EasyTouch.On_LongTapEnd != null)
			{
				EasyTouch.On_LongTapEnd(gesture);
			}
			break;
		case EasyTouch.EventName.On_DragStart:
			if (EasyTouch.On_DragStart != null)
			{
				EasyTouch.On_DragStart(gesture);
			}
			break;
		case EasyTouch.EventName.On_Drag:
			if (EasyTouch.On_Drag != null)
			{
				EasyTouch.On_Drag(gesture);
			}
			break;
		case EasyTouch.EventName.On_DragEnd:
			if (EasyTouch.On_DragEnd != null)
			{
				EasyTouch.On_DragEnd(gesture);
			}
			break;
		case EasyTouch.EventName.On_SwipeStart:
			if (EasyTouch.On_SwipeStart != null)
			{
				EasyTouch.On_SwipeStart(gesture);
			}
			break;
		case EasyTouch.EventName.On_Swipe:
			if (EasyTouch.On_Swipe != null)
			{
				EasyTouch.On_Swipe(gesture);
			}
			break;
		case EasyTouch.EventName.On_SwipeEnd:
			if (EasyTouch.On_SwipeEnd != null)
			{
				EasyTouch.On_SwipeEnd(gesture);
			}
			break;
		case EasyTouch.EventName.On_TouchStart2Fingers:
			if (EasyTouch.On_TouchStart2Fingers != null)
			{
				EasyTouch.On_TouchStart2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_TouchDown2Fingers:
			if (EasyTouch.On_TouchDown2Fingers != null)
			{
				EasyTouch.On_TouchDown2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_TouchUp2Fingers:
			if (EasyTouch.On_TouchUp2Fingers != null)
			{
				EasyTouch.On_TouchUp2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_SimpleTap2Fingers:
			if (EasyTouch.On_SimpleTap2Fingers != null)
			{
				EasyTouch.On_SimpleTap2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_DoubleTap2Fingers:
			if (EasyTouch.On_DoubleTap2Fingers != null)
			{
				EasyTouch.On_DoubleTap2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_LongTapStart2Fingers:
			if (EasyTouch.On_LongTapStart2Fingers != null)
			{
				EasyTouch.On_LongTapStart2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_LongTap2Fingers:
			if (EasyTouch.On_LongTap2Fingers != null)
			{
				EasyTouch.On_LongTap2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_LongTapEnd2Fingers:
			if (EasyTouch.On_LongTapEnd2Fingers != null)
			{
				EasyTouch.On_LongTapEnd2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_Twist:
			if (EasyTouch.On_Twist != null)
			{
				EasyTouch.On_Twist(gesture);
			}
			break;
		case EasyTouch.EventName.On_TwistEnd:
			if (EasyTouch.On_TwistEnd != null)
			{
				EasyTouch.On_TwistEnd(gesture);
			}
			break;
		case EasyTouch.EventName.On_Pinch:
			if (EasyTouch.On_Pinch != null)
			{
				EasyTouch.On_Pinch(gesture);
			}
			break;
		case EasyTouch.EventName.On_PinchIn:
			if (EasyTouch.On_PinchIn != null)
			{
				EasyTouch.On_PinchIn(gesture);
			}
			break;
		case EasyTouch.EventName.On_PinchOut:
			if (EasyTouch.On_PinchOut != null)
			{
				EasyTouch.On_PinchOut(gesture);
			}
			break;
		case EasyTouch.EventName.On_PinchEnd:
			if (EasyTouch.On_PinchEnd != null)
			{
				EasyTouch.On_PinchEnd(gesture);
			}
			break;
		case EasyTouch.EventName.On_DragStart2Fingers:
			if (EasyTouch.On_DragStart2Fingers != null)
			{
				EasyTouch.On_DragStart2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_Drag2Fingers:
			if (EasyTouch.On_Drag2Fingers != null)
			{
				EasyTouch.On_Drag2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_DragEnd2Fingers:
			if (EasyTouch.On_DragEnd2Fingers != null)
			{
				EasyTouch.On_DragEnd2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_SwipeStart2Fingers:
			if (EasyTouch.On_SwipeStart2Fingers != null)
			{
				EasyTouch.On_SwipeStart2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_Swipe2Fingers:
			if (EasyTouch.On_Swipe2Fingers != null)
			{
				EasyTouch.On_Swipe2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_SwipeEnd2Fingers:
			if (EasyTouch.On_SwipeEnd2Fingers != null)
			{
				EasyTouch.On_SwipeEnd2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_Cancel:
			if (EasyTouch.On_Cancel != null)
			{
				EasyTouch.On_Cancel(gesture);
			}
			break;
		case EasyTouch.EventName.On_Cancel2Fingers:
			if (EasyTouch.On_Cancel2Fingers != null)
			{
				EasyTouch.On_Cancel2Fingers(gesture);
			}
			break;
		case EasyTouch.EventName.On_OverUIElement:
			if (EasyTouch.On_OverUIElement != null)
			{
				EasyTouch.On_OverUIElement(gesture);
			}
			break;
		case EasyTouch.EventName.On_UIElementTouchUp:
			if (EasyTouch.On_UIElementTouchUp != null)
			{
				EasyTouch.On_UIElementTouchUp(gesture);
			}
			break;
		}
	}

	// Token: 0x06000242 RID: 578 RVA: 0x0000FBCC File Offset: 0x0000DDCC
	private bool GetPickedGameObject(Finger finger, bool isTowFinger = false)
	{
		if (finger == null)
		{
			return false;
		}
		this.pickedObject.isGUI = false;
		this.pickedObject.pickedObj = null;
		this.pickedObject.pickedCamera = null;
		if (this.touchCameras.Count > 0)
		{
			for (int i = 0; i < this.touchCameras.Count; i++)
			{
				if (this.touchCameras[i].camera != null && this.touchCameras[i].camera.enabled)
				{
					Vector2 vector = Vector2.zero;
					if (!isTowFinger)
					{
						vector = finger.position;
					}
					else
					{
						vector = this.twoFinger.position;
					}
					Ray ray = this.touchCameras[i].camera.ScreenPointToRay(vector);
					if (this.enable2D)
					{
						LayerMask layerMask = this.pickableLayers2D;
						RaycastHit2D[] array = new RaycastHit2D[1];
						if (Physics2D.GetRayIntersectionNonAlloc(ray, array, float.PositiveInfinity, layerMask) > 0)
						{
							this.pickedObject.pickedCamera = this.touchCameras[i].camera;
							this.pickedObject.isGUI = this.touchCameras[i].guiCamera;
							this.pickedObject.pickedObj = array[0].collider.gameObject;
							return true;
						}
					}
					LayerMask layerMask2 = this.pickableLayers3D;
					RaycastHit raycastHit;
					if (Physics.Raycast(ray, ref raycastHit, 3.4028235E+38f, layerMask2))
					{
						this.pickedObject.pickedCamera = this.touchCameras[i].camera;
						this.pickedObject.isGUI = this.touchCameras[i].guiCamera;
						this.pickedObject.pickedObj = raycastHit.collider.gameObject;
						return true;
					}
				}
			}
		}
		else
		{
			Debug.LogWarning("No camera is assigned to EasyTouch");
		}
		return false;
	}

	// Token: 0x06000243 RID: 579 RVA: 0x0000FDB8 File Offset: 0x0000DFB8
	private EasyTouch.SwipeDirection GetSwipe(Vector2 start, Vector2 end)
	{
		Vector2 normalized = (end - start).normalized;
		if (Vector2.Dot(normalized, Vector2.up) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.Up;
		}
		if (Vector2.Dot(normalized, -Vector2.up) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.Down;
		}
		if (Vector2.Dot(normalized, Vector2.right) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.Right;
		}
		if (Vector2.Dot(normalized, -Vector2.right) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.Left;
		}
		Vector2 vector = normalized;
		Vector2 vector2;
		vector2..ctor(0.5f, 0.5f);
		if (Vector2.Dot(vector, vector2.normalized) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.UpRight;
		}
		Vector2 vector3 = normalized;
		Vector2 vector4;
		vector4..ctor(0.5f, -0.5f);
		if (Vector2.Dot(vector3, vector4.normalized) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.DownRight;
		}
		Vector2 vector5 = normalized;
		Vector2 vector6;
		vector6..ctor(-0.5f, 0.5f);
		if (Vector2.Dot(vector5, vector6.normalized) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.UpLeft;
		}
		Vector2 vector7 = normalized;
		Vector2 vector8;
		vector8..ctor(-0.5f, -0.5f);
		if (Vector2.Dot(vector7, vector8.normalized) >= this.swipeTolerance)
		{
			return EasyTouch.SwipeDirection.DownLeft;
		}
		return EasyTouch.SwipeDirection.Other;
	}

	// Token: 0x06000244 RID: 580 RVA: 0x0000FEF0 File Offset: 0x0000E0F0
	private bool FingerInTolerance(Finger finger)
	{
		return (finger.position - finger.startPosition).sqrMagnitude <= this.StationaryTolerance * this.StationaryTolerance;
	}

	// Token: 0x06000245 RID: 581 RVA: 0x0000FF2C File Offset: 0x0000E12C
	private bool IsTouchOverNGui(Vector2 position, bool isTwoFingers = false)
	{
		bool flag = false;
		if (this.enabledNGuiMode)
		{
			LayerMask layerMask = this.nGUILayers;
			int num = 0;
			while (!flag && num < this.nGUICameras.Count)
			{
				Vector2 vector = Vector2.zero;
				if (!isTwoFingers)
				{
					vector = position;
				}
				else
				{
					vector = this.twoFinger.position;
				}
				Ray ray = this.nGUICameras[num].ScreenPointToRay(vector);
				RaycastHit raycastHit;
				flag = Physics.Raycast(ray, ref raycastHit, float.MaxValue, layerMask);
				num++;
			}
		}
		return flag;
	}

	// Token: 0x06000246 RID: 582 RVA: 0x0000FFC4 File Offset: 0x0000E1C4
	private Finger GetFinger(int finderId)
	{
		int num = 0;
		Finger finger = null;
		while (num < 10 && finger == null)
		{
			if (this.fingers[num] != null && this.fingers[num].fingerIndex == finderId)
			{
				finger = this.fingers[num];
			}
			num++;
		}
		return finger;
	}

	// Token: 0x06000247 RID: 583 RVA: 0x00010018 File Offset: 0x0000E218
	private bool IsScreenPositionOverUI(Vector2 position)
	{
		this.uiEventSystem = EventSystem.current;
		if (this.uiEventSystem != null)
		{
			this.uiPointerEventData = new PointerEventData(this.uiEventSystem);
			this.uiPointerEventData.position = position;
			this.uiEventSystem.RaycastAll(this.uiPointerEventData, this.uiRaycastResultCache);
			return this.uiRaycastResultCache.Count > 0;
		}
		return false;
	}

	// Token: 0x06000248 RID: 584 RVA: 0x0001008C File Offset: 0x0000E28C
	private GameObject GetFirstUIElementFromCache()
	{
		if (this.uiRaycastResultCache.Count > 0)
		{
			return this.uiRaycastResultCache[0].gameObject;
		}
		return null;
	}

	// Token: 0x06000249 RID: 585 RVA: 0x000100C0 File Offset: 0x0000E2C0
	private GameObject GetFirstUIElement(Vector2 position)
	{
		if (this.IsScreenPositionOverUI(position))
		{
			return this.GetFirstUIElementFromCache();
		}
		return null;
	}

	// Token: 0x0600024A RID: 586 RVA: 0x000100D8 File Offset: 0x0000E2D8
	public static bool IsFingerOverUIElement(int fingerIndex)
	{
		if (EasyTouch.instance != null)
		{
			Finger finger = EasyTouch.instance.GetFinger(fingerIndex);
			return finger != null && EasyTouch.instance.IsScreenPositionOverUI(finger.position);
		}
		return false;
	}

	// Token: 0x0600024B RID: 587 RVA: 0x0001011C File Offset: 0x0000E31C
	public static GameObject GetCurrentPickedUIElement(int fingerIndex)
	{
		if (!(EasyTouch.instance != null))
		{
			return null;
		}
		Finger finger = EasyTouch.instance.GetFinger(fingerIndex);
		if (finger != null)
		{
			return EasyTouch.instance.GetFirstUIElement(finger.position);
		}
		return null;
	}

	// Token: 0x0600024C RID: 588 RVA: 0x00010160 File Offset: 0x0000E360
	public static GameObject GetCurrentPickedObject(int fingerIndex)
	{
		if (!(EasyTouch.instance != null))
		{
			return null;
		}
		Finger finger = EasyTouch.instance.GetFinger(fingerIndex);
		if (finger != null && EasyTouch.instance.GetPickedGameObject(finger, false))
		{
			return EasyTouch.instance.pickedObject.pickedObj;
		}
		return null;
	}

	// Token: 0x0600024D RID: 589 RVA: 0x000101B4 File Offset: 0x0000E3B4
	public static int GetTouchCount()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.input.TouchCount();
		}
		return 0;
	}

	// Token: 0x0600024E RID: 590 RVA: 0x000101E4 File Offset: 0x0000E3E4
	public static void ResetTouch(int fingerIndex)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.GetFinger(fingerIndex).gesture = EasyTouch.GestureType.None;
		}
	}

	// Token: 0x0600024F RID: 591 RVA: 0x00010214 File Offset: 0x0000E414
	public static void SetEnabled(bool enable)
	{
		EasyTouch.instance.enable = enable;
		if (enable)
		{
			EasyTouch.instance.ResetTouches();
		}
	}

	// Token: 0x06000250 RID: 592 RVA: 0x00010234 File Offset: 0x0000E434
	public static bool GetEnabled()
	{
		return EasyTouch.instance && EasyTouch.instance.enable;
	}

	// Token: 0x06000251 RID: 593 RVA: 0x00010254 File Offset: 0x0000E454
	public static void SetUICompatibily(bool value)
	{
		if (EasyTouch.instance != null)
		{
			EasyTouch.instance.enableUIMode = value;
		}
	}

	// Token: 0x06000252 RID: 594 RVA: 0x00010274 File Offset: 0x0000E474
	public static bool GetUIComptability()
	{
		return EasyTouch.instance != null && EasyTouch.instance.enableUIMode;
	}

	// Token: 0x06000253 RID: 595 RVA: 0x00010294 File Offset: 0x0000E494
	public static void SetAutoUpdateUI(bool value)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.autoUpdatePickedUI = value;
		}
	}

	// Token: 0x06000254 RID: 596 RVA: 0x000102B0 File Offset: 0x0000E4B0
	public static bool GetAutoUpdateUI()
	{
		return EasyTouch.instance && EasyTouch.instance.autoUpdatePickedUI;
	}

	// Token: 0x06000255 RID: 597 RVA: 0x000102D0 File Offset: 0x0000E4D0
	public static void SetNGUICompatibility(bool value)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.enabledNGuiMode = value;
		}
	}

	// Token: 0x06000256 RID: 598 RVA: 0x000102EC File Offset: 0x0000E4EC
	public static bool GetNGUICompatibility()
	{
		return EasyTouch.instance && EasyTouch.instance.enabledNGuiMode;
	}

	// Token: 0x06000257 RID: 599 RVA: 0x0001030C File Offset: 0x0000E50C
	public static void SetEnableAutoSelect(bool value)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.autoSelect = value;
		}
	}

	// Token: 0x06000258 RID: 600 RVA: 0x00010328 File Offset: 0x0000E528
	public static bool GetEnableAutoSelect()
	{
		return EasyTouch.instance && EasyTouch.instance.autoSelect;
	}

	// Token: 0x06000259 RID: 601 RVA: 0x00010348 File Offset: 0x0000E548
	public static void SetAutoUpdatePickedObject(bool value)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.autoUpdatePickedObject = value;
		}
	}

	// Token: 0x0600025A RID: 602 RVA: 0x00010364 File Offset: 0x0000E564
	public static bool GetAutoUpdatePickedObject()
	{
		return EasyTouch.instance && EasyTouch.instance.autoUpdatePickedObject;
	}

	// Token: 0x0600025B RID: 603 RVA: 0x00010384 File Offset: 0x0000E584
	public static void Set3DPickableLayer(LayerMask mask)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.pickableLayers3D = mask;
		}
	}

	// Token: 0x0600025C RID: 604 RVA: 0x000103A0 File Offset: 0x0000E5A0
	public static LayerMask Get3DPickableLayer()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.pickableLayers3D;
		}
		return LayerMask.GetMask(new string[]
		{
			"Default"
		});
	}

	// Token: 0x0600025D RID: 605 RVA: 0x000103E0 File Offset: 0x0000E5E0
	public static void AddCamera(Camera cam, bool guiCam = false)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.touchCameras.Add(new ECamera(cam, guiCam));
		}
	}

	// Token: 0x0600025E RID: 606 RVA: 0x00010408 File Offset: 0x0000E608
	public static void RemoveCamera(Camera cam)
	{
		if (EasyTouch.instance)
		{
			int num = EasyTouch.instance.touchCameras.FindIndex((ECamera c) => c.camera == cam);
			if (num > -1)
			{
				EasyTouch.instance.touchCameras[num] = null;
				EasyTouch.instance.touchCameras.RemoveAt(num);
			}
		}
	}

	// Token: 0x0600025F RID: 607 RVA: 0x00010478 File Offset: 0x0000E678
	public static Camera GetCamera(int index = 0)
	{
		if (!EasyTouch.instance)
		{
			return null;
		}
		if (index < EasyTouch.instance.touchCameras.Count)
		{
			return EasyTouch.instance.touchCameras[index].camera;
		}
		return null;
	}

	// Token: 0x06000260 RID: 608 RVA: 0x000104B8 File Offset: 0x0000E6B8
	public static void SetEnable2DCollider(bool value)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.enable2D = value;
		}
	}

	// Token: 0x06000261 RID: 609 RVA: 0x000104D4 File Offset: 0x0000E6D4
	public static bool GetEnable2DCollider()
	{
		return EasyTouch.instance && EasyTouch.instance.enable2D;
	}

	// Token: 0x06000262 RID: 610 RVA: 0x000104F4 File Offset: 0x0000E6F4
	public static void Set2DPickableLayer(LayerMask mask)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.pickableLayers2D = mask;
		}
	}

	// Token: 0x06000263 RID: 611 RVA: 0x00010510 File Offset: 0x0000E710
	public static LayerMask Get2DPickableLayer()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.pickableLayers2D;
		}
		return LayerMask.GetMask(new string[]
		{
			"Default"
		});
	}

	// Token: 0x06000264 RID: 612 RVA: 0x00010550 File Offset: 0x0000E750
	public static void SetGesturePriority(EasyTouch.GesturePriority value)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.gesturePriority = value;
		}
	}

	// Token: 0x06000265 RID: 613 RVA: 0x0001056C File Offset: 0x0000E76C
	public static EasyTouch.GesturePriority GetGesturePriority()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.gesturePriority;
		}
		return EasyTouch.GesturePriority.Tap;
	}

	// Token: 0x06000266 RID: 614 RVA: 0x0001058C File Offset: 0x0000E78C
	public static void SetStationaryTolerance(float tolerance)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.StationaryTolerance = tolerance;
		}
	}

	// Token: 0x06000267 RID: 615 RVA: 0x000105A8 File Offset: 0x0000E7A8
	public static float GetStationaryTolerance()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.StationaryTolerance;
		}
		return -1f;
	}

	// Token: 0x06000268 RID: 616 RVA: 0x000105CC File Offset: 0x0000E7CC
	public static void SetLongTapTime(float time)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.longTapTime = time;
		}
	}

	// Token: 0x06000269 RID: 617 RVA: 0x000105E8 File Offset: 0x0000E7E8
	public static float GetlongTapTime()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.longTapTime;
		}
		return -1f;
	}

	// Token: 0x0600026A RID: 618 RVA: 0x0001060C File Offset: 0x0000E80C
	public static void SetDoubleTapTime(float time)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.doubleTapTime = time;
		}
	}

	// Token: 0x0600026B RID: 619 RVA: 0x00010628 File Offset: 0x0000E828
	public static float GetDoubleTapTime()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.doubleTapTime;
		}
		return -1f;
	}

	// Token: 0x0600026C RID: 620 RVA: 0x0001064C File Offset: 0x0000E84C
	public static void SetSwipeTolerance(float tolerance)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.swipeTolerance = tolerance;
		}
	}

	// Token: 0x0600026D RID: 621 RVA: 0x00010668 File Offset: 0x0000E868
	public static float GetSwipeTolerance()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.swipeTolerance;
		}
		return -1f;
	}

	// Token: 0x0600026E RID: 622 RVA: 0x0001068C File Offset: 0x0000E88C
	public static void SetEnable2FingersGesture(bool enable)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.enable2FingersGesture = enable;
		}
	}

	// Token: 0x0600026F RID: 623 RVA: 0x000106A8 File Offset: 0x0000E8A8
	public static bool GetEnable2FingersGesture()
	{
		return EasyTouch.instance && EasyTouch.instance.enable2FingersGesture;
	}

	// Token: 0x06000270 RID: 624 RVA: 0x000106C8 File Offset: 0x0000E8C8
	public static void SetTwoFingerPickMethod(EasyTouch.TwoFingerPickMethod pickMethod)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.twoFingerPickMethod = pickMethod;
		}
	}

	// Token: 0x06000271 RID: 625 RVA: 0x000106E4 File Offset: 0x0000E8E4
	public static EasyTouch.TwoFingerPickMethod GetTwoFingerPickMethod()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.twoFingerPickMethod;
		}
		return EasyTouch.TwoFingerPickMethod.Finger;
	}

	// Token: 0x06000272 RID: 626 RVA: 0x00010704 File Offset: 0x0000E904
	public static void SetEnablePinch(bool enable)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.enablePinch = enable;
		}
	}

	// Token: 0x06000273 RID: 627 RVA: 0x00010720 File Offset: 0x0000E920
	public static bool GetEnablePinch()
	{
		return EasyTouch.instance && EasyTouch.instance.enablePinch;
	}

	// Token: 0x06000274 RID: 628 RVA: 0x00010740 File Offset: 0x0000E940
	public static void SetMinPinchLength(float length)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.minPinchLength = length;
		}
	}

	// Token: 0x06000275 RID: 629 RVA: 0x0001075C File Offset: 0x0000E95C
	public static float GetMinPinchLength()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.minPinchLength;
		}
		return -1f;
	}

	// Token: 0x06000276 RID: 630 RVA: 0x00010780 File Offset: 0x0000E980
	public static void SetEnableTwist(bool enable)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.enableTwist = enable;
		}
	}

	// Token: 0x06000277 RID: 631 RVA: 0x0001079C File Offset: 0x0000E99C
	public static bool GetEnableTwist()
	{
		return EasyTouch.instance && EasyTouch.instance.enableTwist;
	}

	// Token: 0x06000278 RID: 632 RVA: 0x000107BC File Offset: 0x0000E9BC
	public static void SetMinTwistAngle(float angle)
	{
		if (EasyTouch.instance)
		{
			EasyTouch.instance.minTwistAngle = angle;
		}
	}

	// Token: 0x06000279 RID: 633 RVA: 0x000107D8 File Offset: 0x0000E9D8
	public static float GetMinTwistAngle()
	{
		if (EasyTouch.instance)
		{
			return EasyTouch.instance.minTwistAngle;
		}
		return -1f;
	}

	// Token: 0x0600027A RID: 634 RVA: 0x000107FC File Offset: 0x0000E9FC
	public static bool GetSecondeFingerSimulation()
	{
		return EasyTouch.instance != null && EasyTouch.instance.enableSimulation;
	}

	// Token: 0x0600027B RID: 635 RVA: 0x0001081C File Offset: 0x0000EA1C
	public static void SetSecondFingerSimulation(bool value)
	{
		if (EasyTouch.instance != null)
		{
			EasyTouch.instance.enableSimulation = value;
		}
	}

	// Token: 0x040001EB RID: 491
	public static EasyTouch instance;

	// Token: 0x040001EC RID: 492
	public bool enable;

	// Token: 0x040001ED RID: 493
	public bool enableRemote;

	// Token: 0x040001EE RID: 494
	public EasyTouch.GesturePriority gesturePriority;

	// Token: 0x040001EF RID: 495
	public float StationaryTolerance;

	// Token: 0x040001F0 RID: 496
	public float longTapTime;

	// Token: 0x040001F1 RID: 497
	public float swipeTolerance;

	// Token: 0x040001F2 RID: 498
	public float minPinchLength;

	// Token: 0x040001F3 RID: 499
	public float minTwistAngle;

	// Token: 0x040001F4 RID: 500
	public EasyTouch.DoubleTapDetection doubleTapDetection;

	// Token: 0x040001F5 RID: 501
	public float doubleTapTime;

	// Token: 0x040001F6 RID: 502
	public bool enable2FingersGesture;

	// Token: 0x040001F7 RID: 503
	public bool enableTwist;

	// Token: 0x040001F8 RID: 504
	public bool enablePinch;

	// Token: 0x040001F9 RID: 505
	public bool enable2FingersSwipe;

	// Token: 0x040001FA RID: 506
	public EasyTouch.TwoFingerPickMethod twoFingerPickMethod;

	// Token: 0x040001FB RID: 507
	public List<ECamera> touchCameras;

	// Token: 0x040001FC RID: 508
	public bool autoSelect;

	// Token: 0x040001FD RID: 509
	public LayerMask pickableLayers3D;

	// Token: 0x040001FE RID: 510
	public bool enable2D;

	// Token: 0x040001FF RID: 511
	public LayerMask pickableLayers2D;

	// Token: 0x04000200 RID: 512
	public bool autoUpdatePickedObject;

	// Token: 0x04000201 RID: 513
	public bool allowUIDetection;

	// Token: 0x04000202 RID: 514
	public bool enableUIMode;

	// Token: 0x04000203 RID: 515
	public bool autoUpdatePickedUI;

	// Token: 0x04000204 RID: 516
	public bool enabledNGuiMode;

	// Token: 0x04000205 RID: 517
	public LayerMask nGUILayers;

	// Token: 0x04000206 RID: 518
	public List<Camera> nGUICameras;

	// Token: 0x04000207 RID: 519
	public bool enableSimulation;

	// Token: 0x04000208 RID: 520
	public KeyCode twistKey;

	// Token: 0x04000209 RID: 521
	public KeyCode swipeKey;

	// Token: 0x0400020A RID: 522
	public bool showGuiInspector;

	// Token: 0x0400020B RID: 523
	public bool showSelectInspector;

	// Token: 0x0400020C RID: 524
	public bool showGestureInspector;

	// Token: 0x0400020D RID: 525
	public bool showTwoFingerInspector;

	// Token: 0x0400020E RID: 526
	public bool showSecondFingerInspector;

	// Token: 0x0400020F RID: 527
	private EasyTouchInput input = new EasyTouchInput();

	// Token: 0x04000210 RID: 528
	private Finger[] fingers = new Finger[100];

	// Token: 0x04000211 RID: 529
	public Texture secondFingerTexture;

	// Token: 0x04000212 RID: 530
	private TwoFingerGesture twoFinger = new TwoFingerGesture();

	// Token: 0x04000213 RID: 531
	private int oldTouchCount;

	// Token: 0x04000214 RID: 532
	private EasyTouch.DoubleTap[] singleDoubleTap = new EasyTouch.DoubleTap[100];

	// Token: 0x04000215 RID: 533
	private Finger[] tmpArray = new Finger[100];

	// Token: 0x04000216 RID: 534
	private EasyTouch.PickedObject pickedObject = new EasyTouch.PickedObject();

	// Token: 0x04000217 RID: 535
	private List<RaycastResult> uiRaycastResultCache = new List<RaycastResult>();

	// Token: 0x04000218 RID: 536
	private PointerEventData uiPointerEventData;

	// Token: 0x04000219 RID: 537
	private EventSystem uiEventSystem;

	// Token: 0x0200003F RID: 63
	[Serializable]
	private class DoubleTap
	{
		// Token: 0x0600027E RID: 638 RVA: 0x00010858 File Offset: 0x0000EA58
		public void Stop()
		{
			this.inDoubleTap = false;
			this.inWait = false;
			this.time = 0f;
			this.count = 0;
		}

		// Token: 0x04000242 RID: 578
		public bool inDoubleTap;

		// Token: 0x04000243 RID: 579
		public bool inWait;

		// Token: 0x04000244 RID: 580
		public float time;

		// Token: 0x04000245 RID: 581
		public int count;

		// Token: 0x04000246 RID: 582
		public Finger finger;
	}

	// Token: 0x02000040 RID: 64
	private class PickedObject
	{
		// Token: 0x04000247 RID: 583
		public GameObject pickedObj;

		// Token: 0x04000248 RID: 584
		public Camera pickedCamera;

		// Token: 0x04000249 RID: 585
		public bool isGUI;
	}

	// Token: 0x02000041 RID: 65
	public enum GesturePriority
	{
		// Token: 0x0400024B RID: 587
		Tap,
		// Token: 0x0400024C RID: 588
		Slips
	}

	// Token: 0x02000042 RID: 66
	public enum DoubleTapDetection
	{
		// Token: 0x0400024E RID: 590
		BySystem,
		// Token: 0x0400024F RID: 591
		ByTime
	}

	// Token: 0x02000043 RID: 67
	public enum GestureType
	{
		// Token: 0x04000251 RID: 593
		Tap,
		// Token: 0x04000252 RID: 594
		Drag,
		// Token: 0x04000253 RID: 595
		Swipe,
		// Token: 0x04000254 RID: 596
		None,
		// Token: 0x04000255 RID: 597
		LongTap,
		// Token: 0x04000256 RID: 598
		Pinch,
		// Token: 0x04000257 RID: 599
		Twist,
		// Token: 0x04000258 RID: 600
		Cancel,
		// Token: 0x04000259 RID: 601
		Acquisition
	}

	// Token: 0x02000044 RID: 68
	public enum SwipeDirection
	{
		// Token: 0x0400025B RID: 603
		None,
		// Token: 0x0400025C RID: 604
		Left,
		// Token: 0x0400025D RID: 605
		Right,
		// Token: 0x0400025E RID: 606
		Up,
		// Token: 0x0400025F RID: 607
		Down,
		// Token: 0x04000260 RID: 608
		UpLeft,
		// Token: 0x04000261 RID: 609
		UpRight,
		// Token: 0x04000262 RID: 610
		DownLeft,
		// Token: 0x04000263 RID: 611
		DownRight,
		// Token: 0x04000264 RID: 612
		Other
	}

	// Token: 0x02000045 RID: 69
	public enum TwoFingerPickMethod
	{
		// Token: 0x04000266 RID: 614
		Finger,
		// Token: 0x04000267 RID: 615
		Average
	}

	// Token: 0x02000046 RID: 70
	public enum EventName
	{
		// Token: 0x04000269 RID: 617
		None,
		// Token: 0x0400026A RID: 618
		On_TouchStart,
		// Token: 0x0400026B RID: 619
		On_TouchDown,
		// Token: 0x0400026C RID: 620
		On_TouchUp,
		// Token: 0x0400026D RID: 621
		On_SimpleTap,
		// Token: 0x0400026E RID: 622
		On_DoubleTap,
		// Token: 0x0400026F RID: 623
		On_LongTapStart,
		// Token: 0x04000270 RID: 624
		On_LongTap,
		// Token: 0x04000271 RID: 625
		On_LongTapEnd,
		// Token: 0x04000272 RID: 626
		On_DragStart,
		// Token: 0x04000273 RID: 627
		On_Drag,
		// Token: 0x04000274 RID: 628
		On_DragEnd,
		// Token: 0x04000275 RID: 629
		On_SwipeStart,
		// Token: 0x04000276 RID: 630
		On_Swipe,
		// Token: 0x04000277 RID: 631
		On_SwipeEnd,
		// Token: 0x04000278 RID: 632
		On_TouchStart2Fingers,
		// Token: 0x04000279 RID: 633
		On_TouchDown2Fingers,
		// Token: 0x0400027A RID: 634
		On_TouchUp2Fingers,
		// Token: 0x0400027B RID: 635
		On_SimpleTap2Fingers,
		// Token: 0x0400027C RID: 636
		On_DoubleTap2Fingers,
		// Token: 0x0400027D RID: 637
		On_LongTapStart2Fingers,
		// Token: 0x0400027E RID: 638
		On_LongTap2Fingers,
		// Token: 0x0400027F RID: 639
		On_LongTapEnd2Fingers,
		// Token: 0x04000280 RID: 640
		On_Twist,
		// Token: 0x04000281 RID: 641
		On_TwistEnd,
		// Token: 0x04000282 RID: 642
		On_Pinch,
		// Token: 0x04000283 RID: 643
		On_PinchIn,
		// Token: 0x04000284 RID: 644
		On_PinchOut,
		// Token: 0x04000285 RID: 645
		On_PinchEnd,
		// Token: 0x04000286 RID: 646
		On_DragStart2Fingers,
		// Token: 0x04000287 RID: 647
		On_Drag2Fingers,
		// Token: 0x04000288 RID: 648
		On_DragEnd2Fingers,
		// Token: 0x04000289 RID: 649
		On_SwipeStart2Fingers,
		// Token: 0x0400028A RID: 650
		On_Swipe2Fingers,
		// Token: 0x0400028B RID: 651
		On_SwipeEnd2Fingers,
		// Token: 0x0400028C RID: 652
		On_EasyTouchIsReady,
		// Token: 0x0400028D RID: 653
		On_Cancel,
		// Token: 0x0400028E RID: 654
		On_Cancel2Fingers,
		// Token: 0x0400028F RID: 655
		On_OverUIElement,
		// Token: 0x04000290 RID: 656
		On_UIElementTouchUp
	}

	// Token: 0x0200030E RID: 782
	// (Invoke) Token: 0x0600145A RID: 5210
	public delegate void TouchCancelHandler(Gesture gesture);

	// Token: 0x0200030F RID: 783
	// (Invoke) Token: 0x0600145E RID: 5214
	public delegate void Cancel2FingersHandler(Gesture gesture);

	// Token: 0x02000310 RID: 784
	// (Invoke) Token: 0x06001462 RID: 5218
	public delegate void TouchStartHandler(Gesture gesture);

	// Token: 0x02000311 RID: 785
	// (Invoke) Token: 0x06001466 RID: 5222
	public delegate void TouchDownHandler(Gesture gesture);

	// Token: 0x02000312 RID: 786
	// (Invoke) Token: 0x0600146A RID: 5226
	public delegate void TouchUpHandler(Gesture gesture);

	// Token: 0x02000313 RID: 787
	// (Invoke) Token: 0x0600146E RID: 5230
	public delegate void SimpleTapHandler(Gesture gesture);

	// Token: 0x02000314 RID: 788
	// (Invoke) Token: 0x06001472 RID: 5234
	public delegate void DoubleTapHandler(Gesture gesture);

	// Token: 0x02000315 RID: 789
	// (Invoke) Token: 0x06001476 RID: 5238
	public delegate void LongTapStartHandler(Gesture gesture);

	// Token: 0x02000316 RID: 790
	// (Invoke) Token: 0x0600147A RID: 5242
	public delegate void LongTapHandler(Gesture gesture);

	// Token: 0x02000317 RID: 791
	// (Invoke) Token: 0x0600147E RID: 5246
	public delegate void LongTapEndHandler(Gesture gesture);

	// Token: 0x02000318 RID: 792
	// (Invoke) Token: 0x06001482 RID: 5250
	public delegate void DragStartHandler(Gesture gesture);

	// Token: 0x02000319 RID: 793
	// (Invoke) Token: 0x06001486 RID: 5254
	public delegate void DragHandler(Gesture gesture);

	// Token: 0x0200031A RID: 794
	// (Invoke) Token: 0x0600148A RID: 5258
	public delegate void DragEndHandler(Gesture gesture);

	// Token: 0x0200031B RID: 795
	// (Invoke) Token: 0x0600148E RID: 5262
	public delegate void SwipeStartHandler(Gesture gesture);

	// Token: 0x0200031C RID: 796
	// (Invoke) Token: 0x06001492 RID: 5266
	public delegate void SwipeHandler(Gesture gesture);

	// Token: 0x0200031D RID: 797
	// (Invoke) Token: 0x06001496 RID: 5270
	public delegate void SwipeEndHandler(Gesture gesture);

	// Token: 0x0200031E RID: 798
	// (Invoke) Token: 0x0600149A RID: 5274
	public delegate void TouchStart2FingersHandler(Gesture gesture);

	// Token: 0x0200031F RID: 799
	// (Invoke) Token: 0x0600149E RID: 5278
	public delegate void TouchDown2FingersHandler(Gesture gesture);

	// Token: 0x02000320 RID: 800
	// (Invoke) Token: 0x060014A2 RID: 5282
	public delegate void TouchUp2FingersHandler(Gesture gesture);

	// Token: 0x02000321 RID: 801
	// (Invoke) Token: 0x060014A6 RID: 5286
	public delegate void SimpleTap2FingersHandler(Gesture gesture);

	// Token: 0x02000322 RID: 802
	// (Invoke) Token: 0x060014AA RID: 5290
	public delegate void DoubleTap2FingersHandler(Gesture gesture);

	// Token: 0x02000323 RID: 803
	// (Invoke) Token: 0x060014AE RID: 5294
	public delegate void LongTapStart2FingersHandler(Gesture gesture);

	// Token: 0x02000324 RID: 804
	// (Invoke) Token: 0x060014B2 RID: 5298
	public delegate void LongTap2FingersHandler(Gesture gesture);

	// Token: 0x02000325 RID: 805
	// (Invoke) Token: 0x060014B6 RID: 5302
	public delegate void LongTapEnd2FingersHandler(Gesture gesture);

	// Token: 0x02000326 RID: 806
	// (Invoke) Token: 0x060014BA RID: 5306
	public delegate void TwistHandler(Gesture gesture);

	// Token: 0x02000327 RID: 807
	// (Invoke) Token: 0x060014BE RID: 5310
	public delegate void TwistEndHandler(Gesture gesture);

	// Token: 0x02000328 RID: 808
	// (Invoke) Token: 0x060014C2 RID: 5314
	public delegate void PinchInHandler(Gesture gesture);

	// Token: 0x02000329 RID: 809
	// (Invoke) Token: 0x060014C6 RID: 5318
	public delegate void PinchOutHandler(Gesture gesture);

	// Token: 0x0200032A RID: 810
	// (Invoke) Token: 0x060014CA RID: 5322
	public delegate void PinchEndHandler(Gesture gesture);

	// Token: 0x0200032B RID: 811
	// (Invoke) Token: 0x060014CE RID: 5326
	public delegate void PinchHandler(Gesture gesture);

	// Token: 0x0200032C RID: 812
	// (Invoke) Token: 0x060014D2 RID: 5330
	public delegate void DragStart2FingersHandler(Gesture gesture);

	// Token: 0x0200032D RID: 813
	// (Invoke) Token: 0x060014D6 RID: 5334
	public delegate void Drag2FingersHandler(Gesture gesture);

	// Token: 0x0200032E RID: 814
	// (Invoke) Token: 0x060014DA RID: 5338
	public delegate void DragEnd2FingersHandler(Gesture gesture);

	// Token: 0x0200032F RID: 815
	// (Invoke) Token: 0x060014DE RID: 5342
	public delegate void SwipeStart2FingersHandler(Gesture gesture);

	// Token: 0x02000330 RID: 816
	// (Invoke) Token: 0x060014E2 RID: 5346
	public delegate void Swipe2FingersHandler(Gesture gesture);

	// Token: 0x02000331 RID: 817
	// (Invoke) Token: 0x060014E6 RID: 5350
	public delegate void SwipeEnd2FingersHandler(Gesture gesture);

	// Token: 0x02000332 RID: 818
	// (Invoke) Token: 0x060014EA RID: 5354
	public delegate void EasyTouchIsReadyHandler();

	// Token: 0x02000333 RID: 819
	// (Invoke) Token: 0x060014EE RID: 5358
	public delegate void OverUIElementHandler(Gesture gesture);

	// Token: 0x02000334 RID: 820
	// (Invoke) Token: 0x060014F2 RID: 5362
	public delegate void UIElementTouchUpHandler(Gesture gesture);
}
