using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

// Token: 0x0200006D RID: 109
[Serializable]
public class ETCJoystick : ETCBase, IPointerUpHandler, IPointerEnterHandler, IEventSystemHandler, IPointerDownHandler, IDragHandler, IBeginDragHandler
{
	// Token: 0x06000329 RID: 809 RVA: 0x00014F20 File Offset: 0x00013120
	public ETCJoystick()
	{
		this.joystickType = ETCJoystick.JoystickType.Static;
		this.allowJoystickOverTouchPad = false;
		this.radiusBase = ETCJoystick.RadiusBase.Width;
		this.axisX = new ETCAxis("Horizontal");
		this.axisY = new ETCAxis("Vertical");
		this._visible = true;
		this._activated = true;
		this.joystickArea = ETCJoystick.JoystickArea.FullScreen;
		this.isDynamicActif = false;
		this.isOnDrag = false;
		this.isOnTouch = false;
		this.axisX.positivekey = 275;
		this.axisX.negativeKey = 276;
		this.axisY.positivekey = 273;
		this.axisY.negativeKey = 274;
		this.enableKeySimulation = true;
		this.isNoReturnThumb = false;
		this.showPSInspector = true;
		this.showAxesInspector = false;
		this.showEventInspector = false;
		this.showSpriteInspector = false;
	}

	// Token: 0x17000023 RID: 35
	// (get) Token: 0x0600032A RID: 810 RVA: 0x00014FFC File Offset: 0x000131FC
	// (set) Token: 0x0600032B RID: 811 RVA: 0x00015004 File Offset: 0x00013204
	public bool IsNoReturnThumb
	{
		get
		{
			return this.isNoReturnThumb;
		}
		set
		{
			this.isNoReturnThumb = value;
		}
	}

	// Token: 0x17000024 RID: 36
	// (get) Token: 0x0600032C RID: 812 RVA: 0x00015010 File Offset: 0x00013210
	// (set) Token: 0x0600032D RID: 813 RVA: 0x00015018 File Offset: 0x00013218
	public bool IsNoOffsetThumb
	{
		get
		{
			return this.isNoOffsetThumb;
		}
		set
		{
			this.isNoOffsetThumb = value;
		}
	}

	// Token: 0x0600032E RID: 814 RVA: 0x00015024 File Offset: 0x00013224
	protected override void Awake()
	{
		base.Awake();
		if (this.joystickType == ETCJoystick.JoystickType.Dynamic)
		{
			this.rectTransform().anchorMin = new Vector2(0.5f, 0.5f);
			this.rectTransform().anchorMax = new Vector2(0.5f, 0.5f);
			this.rectTransform().SetAsLastSibling();
			base.visible = false;
		}
	}

	// Token: 0x0600032F RID: 815 RVA: 0x00015088 File Offset: 0x00013288
	private void Start()
	{
		this.tmpAxis = Vector2.zero;
		this.OldTmpAxis = Vector2.zero;
		this.axisX.InitAxis();
		this.axisY.InitAxis();
		this.noReturnPosition = this.thumb.position;
	}

	// Token: 0x06000330 RID: 816 RVA: 0x000150D8 File Offset: 0x000132D8
	protected override void UpdateControlState()
	{
		this.UpdateJoystick();
	}

	// Token: 0x06000331 RID: 817 RVA: 0x000150E0 File Offset: 0x000132E0
	public void OnPointerEnter(PointerEventData eventData)
	{
		if (this.joystickType == ETCJoystick.JoystickType.Dynamic && !this.isDynamicActif && this._activated)
		{
			eventData.pointerDrag = base.gameObject;
			eventData.pointerPress = base.gameObject;
			this.isDynamicActif = true;
		}
		if (this.joystickType == ETCJoystick.JoystickType.Dynamic && !eventData.eligibleForClick)
		{
			this.OnPointerUp(eventData);
		}
	}

	// Token: 0x06000332 RID: 818 RVA: 0x0001514C File Offset: 0x0001334C
	public void OnPointerDown(PointerEventData eventData)
	{
		this.onTouchStart.Invoke();
		if (this.isNoOffsetThumb)
		{
			this.OnDrag(eventData);
		}
	}

	// Token: 0x06000333 RID: 819 RVA: 0x0001516C File Offset: 0x0001336C
	public void OnBeginDrag(PointerEventData eventData)
	{
	}

	// Token: 0x06000334 RID: 820 RVA: 0x00015170 File Offset: 0x00013370
	public void OnDrag(PointerEventData eventData)
	{
		this.isOnDrag = true;
		this.isOnTouch = true;
		float radius = this.GetRadius();
		if (!this.isNoReturnThumb)
		{
			this.thumbPosition = (eventData.position - eventData.pressPosition) / this.cachedRootCanvas.rectTransform().localScale.x;
		}
		else
		{
			this.thumbPosition = (eventData.position - this.noReturnPosition) / this.cachedRootCanvas.rectTransform().localScale.x + this.noReturnOffset;
		}
		if (this.isNoOffsetThumb)
		{
			this.thumbPosition = (eventData.position - this.cachedRectTransform.position) / this.cachedRootCanvas.rectTransform().localScale.x;
		}
		this.thumbPosition.x = (float)Mathf.FloorToInt(this.thumbPosition.x);
		this.thumbPosition.y = (float)Mathf.FloorToInt(this.thumbPosition.y);
		if (!this.axisX.enable)
		{
			this.thumbPosition.x = 0f;
		}
		if (!this.axisY.enable)
		{
			this.thumbPosition.y = 0f;
		}
		if (this.thumbPosition.magnitude > radius)
		{
			if (!this.isNoReturnThumb)
			{
				this.thumbPosition = this.thumbPosition.normalized * radius;
			}
			else
			{
				this.thumbPosition = this.thumbPosition.normalized * radius;
			}
		}
		this.thumb.anchoredPosition = this.thumbPosition;
	}

	// Token: 0x06000335 RID: 821 RVA: 0x00015338 File Offset: 0x00013538
	public void OnPointerUp(PointerEventData eventData)
	{
		this.isOnDrag = false;
		this.isOnTouch = false;
		if (this.isNoReturnThumb)
		{
			this.noReturnPosition = this.thumb.position;
			this.noReturnOffset = this.thumbPosition;
		}
		if (!this.isNoReturnThumb)
		{
			this.thumbPosition = Vector2.zero;
			this.thumb.anchoredPosition = Vector2.zero;
			this.axisX.axisState = ETCAxis.AxisState.None;
			this.axisY.axisState = ETCAxis.AxisState.None;
		}
		if (!this.axisX.isEnertia && !this.axisY.isEnertia)
		{
			this.axisX.ResetAxis();
			this.axisY.ResetAxis();
			this.tmpAxis = Vector2.zero;
			this.OldTmpAxis = Vector2.zero;
			this.onMoveEnd.Invoke();
		}
		if (this.joystickType == ETCJoystick.JoystickType.Dynamic)
		{
			base.visible = false;
			this.isDynamicActif = false;
		}
		this.onTouchUp.Invoke();
	}

	// Token: 0x06000336 RID: 822 RVA: 0x0001543C File Offset: 0x0001363C
	private void UpdateJoystick()
	{
		if (this.joystickType == ETCJoystick.JoystickType.Dynamic && !this._visible && this._activated)
		{
			Vector2 zero = Vector2.zero;
			Vector2 zero2 = Vector2.zero;
			if (this.isTouchOverJoystickArea(ref zero, ref zero2))
			{
				GameObject firstUIElement = base.GetFirstUIElement(zero2);
				if (firstUIElement == null || (this.allowJoystickOverTouchPad && firstUIElement.GetComponent<ETCTouchPad>()) || (firstUIElement != null && firstUIElement.GetComponent<ETCArea>()))
				{
					this.cachedRectTransform.anchoredPosition = zero;
					base.visible = true;
				}
			}
		}
		if (this.enableKeySimulation && !this.isOnTouch && this._activated && this._visible)
		{
			if (!this.isNoReturnThumb)
			{
				this.thumb.localPosition = Vector2.zero;
			}
			this.isOnDrag = false;
			if (Input.GetKey(this.axisX.positivekey))
			{
				this.isOnDrag = true;
				this.thumb.localPosition = new Vector2(this.GetRadius(), this.thumb.localPosition.y);
			}
			else if (Input.GetKey(this.axisX.negativeKey))
			{
				this.isOnDrag = true;
				this.thumb.localPosition = new Vector2(-this.GetRadius(), this.thumb.localPosition.y);
			}
			if (Input.GetKey(this.axisY.positivekey))
			{
				this.isOnDrag = true;
				this.thumb.localPosition = new Vector2(this.thumb.localPosition.x, this.GetRadius());
			}
			else if (Input.GetKey(this.axisY.negativeKey))
			{
				this.isOnDrag = true;
				this.thumb.localPosition = new Vector2(this.thumb.localPosition.x, -this.GetRadius());
			}
			this.thumbPosition = this.thumb.localPosition;
		}
		this.OldTmpAxis.x = this.axisX.axisValue;
		this.OldTmpAxis.y = this.axisY.axisValue;
		this.tmpAxis = this.thumbPosition / this.GetRadius();
		this.axisX.UpdateAxis(this.tmpAxis.x, this.isOnDrag, ETCBase.ControlType.Joystick, true);
		this.axisY.UpdateAxis(this.tmpAxis.y, this.isOnDrag, ETCBase.ControlType.Joystick, true);
		this.axisX.DoGravity();
		this.axisY.DoGravity();
		if ((this.axisX.axisValue != 0f || this.axisY.axisValue != 0f) && this.OldTmpAxis == Vector2.zero)
		{
			this.onMoveStart.Invoke();
		}
		if (this.axisX.axisValue != 0f || this.axisY.axisValue != 0f)
		{
			if (this.axisX.actionOn == ETCAxis.ActionOn.Down && (this.axisX.axisState == ETCAxis.AxisState.DownLeft || this.axisX.axisState == ETCAxis.AxisState.DownRight))
			{
				this.axisX.DoDirectAction();
			}
			else if (this.axisX.actionOn == ETCAxis.ActionOn.Press)
			{
				this.axisX.DoDirectAction();
			}
			if (this.axisY.actionOn == ETCAxis.ActionOn.Down && (this.axisY.axisState == ETCAxis.AxisState.DownUp || this.axisY.axisState == ETCAxis.AxisState.DownDown))
			{
				this.axisY.DoDirectAction();
			}
			else if (this.axisY.actionOn == ETCAxis.ActionOn.Press)
			{
				this.axisY.DoDirectAction();
			}
			this.onMove.Invoke(new Vector2(this.axisX.axisValue, this.axisY.axisValue));
			this.onMoveSpeed.Invoke(new Vector2(this.axisX.axisSpeedValue, this.axisY.axisSpeedValue));
		}
		else if (this.axisX.axisValue == 0f && this.axisY.axisValue == 0f && this.OldTmpAxis != Vector2.zero)
		{
			this.onMoveEnd.Invoke();
		}
		float num = 1f;
		if (this.axisX.invertedAxis)
		{
			num = -1f;
		}
		if (Mathf.Abs(this.OldTmpAxis.x) < this.axisX.axisThreshold && Mathf.Abs(this.axisX.axisValue) >= this.axisX.axisThreshold)
		{
			if (this.axisX.axisValue * num > 0f)
			{
				this.axisX.axisState = ETCAxis.AxisState.DownRight;
				this.OnDownRight.Invoke();
			}
			else if (this.axisX.axisValue * num < 0f)
			{
				this.axisX.axisState = ETCAxis.AxisState.DownLeft;
				this.OnDownLeft.Invoke();
			}
			else
			{
				this.axisX.axisState = ETCAxis.AxisState.None;
			}
		}
		else if (this.axisX.axisState != ETCAxis.AxisState.None)
		{
			if (this.axisX.axisValue * num > 0f)
			{
				this.axisX.axisState = ETCAxis.AxisState.PressRight;
				this.OnPressRight.Invoke();
			}
			else if (this.axisX.axisValue * num < 0f)
			{
				this.axisX.axisState = ETCAxis.AxisState.PressLeft;
				this.OnPressLeft.Invoke();
			}
			else
			{
				this.axisX.axisState = ETCAxis.AxisState.None;
			}
		}
		num = 1f;
		if (this.axisY.invertedAxis)
		{
			num = -1f;
		}
		if (Mathf.Abs(this.OldTmpAxis.y) < this.axisY.axisThreshold && Mathf.Abs(this.axisY.axisValue) >= this.axisY.axisThreshold)
		{
			if (this.axisY.axisValue * num > 0f)
			{
				this.axisY.axisState = ETCAxis.AxisState.DownUp;
				this.OnDownUp.Invoke();
			}
			else if (this.axisY.axisValue * num < 0f)
			{
				this.axisY.axisState = ETCAxis.AxisState.DownDown;
				this.OnDownDown.Invoke();
			}
			else
			{
				this.axisY.axisState = ETCAxis.AxisState.None;
			}
		}
		else if (this.axisY.axisState != ETCAxis.AxisState.None)
		{
			if (this.axisY.axisValue * num > 0f)
			{
				this.axisY.axisState = ETCAxis.AxisState.PressUp;
				this.OnPressUp.Invoke();
			}
			else if (this.axisY.axisValue * num < 0f)
			{
				this.axisY.axisState = ETCAxis.AxisState.PressDown;
				this.OnPressDown.Invoke();
			}
			else
			{
				this.axisY.axisState = ETCAxis.AxisState.None;
			}
		}
	}

	// Token: 0x06000337 RID: 823 RVA: 0x00015B94 File Offset: 0x00013D94
	private bool isTouchOverJoystickArea(ref Vector2 localPosition, ref Vector2 screenPosition)
	{
		bool flag = false;
		bool flag2 = false;
		screenPosition = Vector2.zero;
		int touchCount = this.GetTouchCount();
		int num = 0;
		while (num < touchCount && !flag)
		{
			if (Input.GetTouch(num).phase == null)
			{
				screenPosition = Input.GetTouch(num).position;
				flag2 = true;
			}
			if (flag2 && this.isScreenPointOverArea(screenPosition, ref localPosition))
			{
				flag = true;
			}
			num++;
		}
		return flag;
	}

	// Token: 0x06000338 RID: 824 RVA: 0x00015C18 File Offset: 0x00013E18
	private bool isScreenPointOverArea(Vector2 screenPosition, ref Vector2 localPosition)
	{
		bool result = false;
		if (this.joystickArea != ETCJoystick.JoystickArea.UserDefined)
		{
			if (RectTransformUtility.ScreenPointToLocalPointInRectangle(this.cachedRootCanvas.rectTransform(), screenPosition, null, ref localPosition))
			{
				switch (this.joystickArea)
				{
				case ETCJoystick.JoystickArea.FullScreen:
					result = true;
					break;
				case ETCJoystick.JoystickArea.Left:
					if (localPosition.x < 0f)
					{
						result = true;
					}
					break;
				case ETCJoystick.JoystickArea.Right:
					if (localPosition.x > 0f)
					{
						result = true;
					}
					break;
				case ETCJoystick.JoystickArea.Top:
					if (localPosition.y > 0f)
					{
						result = true;
					}
					break;
				case ETCJoystick.JoystickArea.Bottom:
					if (localPosition.y < 0f)
					{
						result = true;
					}
					break;
				case ETCJoystick.JoystickArea.TopLeft:
					if (localPosition.y > 0f && localPosition.x < 0f)
					{
						result = true;
					}
					break;
				case ETCJoystick.JoystickArea.TopRight:
					if (localPosition.y > 0f && localPosition.x > 0f)
					{
						result = true;
					}
					break;
				case ETCJoystick.JoystickArea.BottomLeft:
					if (localPosition.y < 0f && localPosition.x < 0f)
					{
						result = true;
					}
					break;
				case ETCJoystick.JoystickArea.BottomRight:
					if (localPosition.y < 0f && localPosition.x > 0f)
					{
						result = true;
					}
					break;
				}
			}
		}
		else if (RectTransformUtility.RectangleContainsScreenPoint(this.userArea, screenPosition, this.cachedRootCanvas.worldCamera))
		{
			RectTransformUtility.ScreenPointToLocalPointInRectangle(this.cachedRootCanvas.rectTransform(), screenPosition, this.cachedRootCanvas.worldCamera, ref localPosition);
			result = true;
		}
		return result;
	}

	// Token: 0x06000339 RID: 825 RVA: 0x00015DC4 File Offset: 0x00013FC4
	private int GetTouchCount()
	{
		return Input.touchCount;
	}

	// Token: 0x0600033A RID: 826 RVA: 0x00015DCC File Offset: 0x00013FCC
	private float GetRadius()
	{
		float result = 0f;
		ETCJoystick.RadiusBase radiusBase = this.radiusBase;
		if (radiusBase != ETCJoystick.RadiusBase.Width)
		{
			if (radiusBase == ETCJoystick.RadiusBase.Height)
			{
				result = this.cachedRectTransform.sizeDelta.y * 0.5f;
			}
		}
		else
		{
			result = this.cachedRectTransform.sizeDelta.x * 0.5f;
		}
		return result;
	}

	// Token: 0x0600033B RID: 827 RVA: 0x00015E38 File Offset: 0x00014038
	protected override void SetActivated()
	{
		base.GetComponent<CanvasGroup>().blocksRaycasts = this._activated;
	}

	// Token: 0x0600033C RID: 828 RVA: 0x00015E4C File Offset: 0x0001404C
	protected override void SetVisible()
	{
		base.GetComponent<Image>().enabled = this._visible;
		this.thumb.GetComponent<Image>().enabled = this._visible;
		base.GetComponent<CanvasGroup>().blocksRaycasts = this._activated;
	}

	// Token: 0x0400035A RID: 858
	[SerializeField]
	public ETCJoystick.OnMoveStartHandler onMoveStart;

	// Token: 0x0400035B RID: 859
	[SerializeField]
	public ETCJoystick.OnMoveHandler onMove;

	// Token: 0x0400035C RID: 860
	[SerializeField]
	public ETCJoystick.OnMoveSpeedHandler onMoveSpeed;

	// Token: 0x0400035D RID: 861
	[SerializeField]
	public ETCJoystick.OnMoveEndHandler onMoveEnd;

	// Token: 0x0400035E RID: 862
	[SerializeField]
	public ETCJoystick.OnTouchStartHandler onTouchStart;

	// Token: 0x0400035F RID: 863
	[SerializeField]
	public ETCJoystick.OnTouchUpHandler onTouchUp;

	// Token: 0x04000360 RID: 864
	[SerializeField]
	public ETCJoystick.OnDownUpHandler OnDownUp;

	// Token: 0x04000361 RID: 865
	[SerializeField]
	public ETCJoystick.OnDownDownHandler OnDownDown;

	// Token: 0x04000362 RID: 866
	[SerializeField]
	public ETCJoystick.OnDownLeftHandler OnDownLeft;

	// Token: 0x04000363 RID: 867
	[SerializeField]
	public ETCJoystick.OnDownRightHandler OnDownRight;

	// Token: 0x04000364 RID: 868
	[SerializeField]
	public ETCJoystick.OnDownUpHandler OnPressUp;

	// Token: 0x04000365 RID: 869
	[SerializeField]
	public ETCJoystick.OnDownDownHandler OnPressDown;

	// Token: 0x04000366 RID: 870
	[SerializeField]
	public ETCJoystick.OnDownLeftHandler OnPressLeft;

	// Token: 0x04000367 RID: 871
	[SerializeField]
	public ETCJoystick.OnDownRightHandler OnPressRight;

	// Token: 0x04000368 RID: 872
	public ETCJoystick.JoystickType joystickType;

	// Token: 0x04000369 RID: 873
	public bool allowJoystickOverTouchPad;

	// Token: 0x0400036A RID: 874
	public ETCJoystick.RadiusBase radiusBase;

	// Token: 0x0400036B RID: 875
	public ETCAxis axisX;

	// Token: 0x0400036C RID: 876
	public ETCAxis axisY;

	// Token: 0x0400036D RID: 877
	public RectTransform thumb;

	// Token: 0x0400036E RID: 878
	public ETCJoystick.JoystickArea joystickArea;

	// Token: 0x0400036F RID: 879
	public RectTransform userArea;

	// Token: 0x04000370 RID: 880
	private Vector2 thumbPosition;

	// Token: 0x04000371 RID: 881
	private bool isDynamicActif;

	// Token: 0x04000372 RID: 882
	private Vector2 tmpAxis;

	// Token: 0x04000373 RID: 883
	private Vector2 OldTmpAxis;

	// Token: 0x04000374 RID: 884
	private bool isOnTouch;

	// Token: 0x04000375 RID: 885
	[SerializeField]
	private bool isNoReturnThumb;

	// Token: 0x04000376 RID: 886
	private Vector2 noReturnPosition;

	// Token: 0x04000377 RID: 887
	private Vector2 noReturnOffset;

	// Token: 0x04000378 RID: 888
	[SerializeField]
	private bool isNoOffsetThumb;

	// Token: 0x0200006E RID: 110
	[Serializable]
	public class OnMoveStartHandler : UnityEvent
	{
	}

	// Token: 0x0200006F RID: 111
	[Serializable]
	public class OnMoveSpeedHandler : UnityEvent<Vector2>
	{
	}

	// Token: 0x02000070 RID: 112
	[Serializable]
	public class OnMoveHandler : UnityEvent<Vector2>
	{
	}

	// Token: 0x02000071 RID: 113
	[Serializable]
	public class OnMoveEndHandler : UnityEvent
	{
	}

	// Token: 0x02000072 RID: 114
	[Serializable]
	public class OnTouchStartHandler : UnityEvent
	{
	}

	// Token: 0x02000073 RID: 115
	[Serializable]
	public class OnTouchUpHandler : UnityEvent
	{
	}

	// Token: 0x02000074 RID: 116
	[Serializable]
	public class OnDownUpHandler : UnityEvent
	{
	}

	// Token: 0x02000075 RID: 117
	[Serializable]
	public class OnDownDownHandler : UnityEvent
	{
	}

	// Token: 0x02000076 RID: 118
	[Serializable]
	public class OnDownLeftHandler : UnityEvent
	{
	}

	// Token: 0x02000077 RID: 119
	[Serializable]
	public class OnDownRightHandler : UnityEvent
	{
	}

	// Token: 0x02000078 RID: 120
	[Serializable]
	public class OnPressUpHandler : UnityEvent
	{
	}

	// Token: 0x02000079 RID: 121
	[Serializable]
	public class OnPressDownHandler : UnityEvent
	{
	}

	// Token: 0x0200007A RID: 122
	[Serializable]
	public class OnPressLeftHandler : UnityEvent
	{
	}

	// Token: 0x0200007B RID: 123
	[Serializable]
	public class OnPressRightHandler : UnityEvent
	{
	}

	// Token: 0x0200007C RID: 124
	public enum JoystickArea
	{
		// Token: 0x0400037A RID: 890
		UserDefined,
		// Token: 0x0400037B RID: 891
		FullScreen,
		// Token: 0x0400037C RID: 892
		Left,
		// Token: 0x0400037D RID: 893
		Right,
		// Token: 0x0400037E RID: 894
		Top,
		// Token: 0x0400037F RID: 895
		Bottom,
		// Token: 0x04000380 RID: 896
		TopLeft,
		// Token: 0x04000381 RID: 897
		TopRight,
		// Token: 0x04000382 RID: 898
		BottomLeft,
		// Token: 0x04000383 RID: 899
		BottomRight
	}

	// Token: 0x0200007D RID: 125
	public enum JoystickType
	{
		// Token: 0x04000385 RID: 901
		Dynamic,
		// Token: 0x04000386 RID: 902
		Static
	}

	// Token: 0x0200007E RID: 126
	public enum RadiusBase
	{
		// Token: 0x04000388 RID: 904
		Width,
		// Token: 0x04000389 RID: 905
		Height
	}
}
