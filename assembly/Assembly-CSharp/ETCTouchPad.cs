using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

// Token: 0x02000080 RID: 128
[Serializable]
public class ETCTouchPad : ETCBase, IPointerUpHandler, IPointerEnterHandler, IEventSystemHandler, IPointerDownHandler, IPointerExitHandler, IDragHandler, IBeginDragHandler
{
	// Token: 0x06000351 RID: 849 RVA: 0x00015FEC File Offset: 0x000141EC
	public ETCTouchPad()
	{
		this.axisX = new ETCAxis("Horizontal");
		this.axisX.speed = 1f;
		this.axisY = new ETCAxis("Vertical");
		this.axisY.speed = 1f;
		this._visible = true;
		this._activated = true;
		this.showPSInspector = true;
		this.showSpriteInspector = false;
		this.showBehaviourInspector = false;
		this.showEventInspector = false;
		this.tmpAxis = Vector2.zero;
		this.isOnDrag = false;
		this.isOnTouch = false;
		this.axisX.positivekey = 275;
		this.axisX.negativeKey = 276;
		this.axisY.positivekey = 273;
		this.axisY.negativeKey = 274;
		this.enableKeySimulation = true;
		this.enableKeySimulation = false;
		this.isOut = false;
		this.axisX.axisState = ETCAxis.AxisState.None;
		this.useFixedUpdate = false;
		this.isDPI = false;
	}

	// Token: 0x06000352 RID: 850 RVA: 0x000160F4 File Offset: 0x000142F4
	protected override void Awake()
	{
		base.Awake();
		this.cachedImage = base.GetComponent<Image>();
		if (!this._visible)
		{
			this.cachedImage.color = new Color(0f, 0f, 0f, 0f);
		}
	}

	// Token: 0x06000353 RID: 851 RVA: 0x00016144 File Offset: 0x00014344
	private void Start()
	{
		this.tmpAxis = Vector2.zero;
		this.OldTmpAxis = Vector2.zero;
		this.axisX.InitAxis();
		this.axisY.InitAxis();
	}

	// Token: 0x06000354 RID: 852 RVA: 0x00016180 File Offset: 0x00014380
	protected override void UpdateControlState()
	{
		this.UpdateTouchPad();
	}

	// Token: 0x06000355 RID: 853 RVA: 0x00016188 File Offset: 0x00014388
	public void OnPointerEnter(PointerEventData eventData)
	{
		if (this.isSwipeIn && this.axisX.axisState == ETCAxis.AxisState.None && this._activated && !this.isOnTouch)
		{
			if (eventData.pointerDrag != null && eventData.pointerDrag != base.gameObject)
			{
				this.previousDargObject = eventData.pointerDrag;
			}
			else if (eventData.pointerPress != null && eventData.pointerPress != base.gameObject)
			{
				this.previousDargObject = eventData.pointerPress;
			}
			eventData.pointerDrag = base.gameObject;
			eventData.pointerPress = base.gameObject;
			this.OnPointerDown(eventData);
		}
	}

	// Token: 0x06000356 RID: 854 RVA: 0x00016250 File Offset: 0x00014450
	public void OnBeginDrag(PointerEventData eventData)
	{
		if (this.pointId == eventData.pointerId)
		{
			this.onMoveStart.Invoke();
		}
	}

	// Token: 0x06000357 RID: 855 RVA: 0x00016270 File Offset: 0x00014470
	public void OnDrag(PointerEventData eventData)
	{
		if (base.activated && !this.isOut && this.pointId == eventData.pointerId)
		{
			this.isOnTouch = true;
			this.isOnDrag = true;
			if (this.isDPI)
			{
				this.tmpAxis = new Vector2(eventData.delta.x / (float)Screen.width * 1000f, eventData.delta.y / (float)Screen.height * 1000f);
			}
			else
			{
				this.tmpAxis = new Vector2(eventData.delta.x, eventData.delta.y);
			}
			if (!this.axisX.enable)
			{
				this.tmpAxis.x = 0f;
			}
			if (!this.axisY.enable)
			{
				this.tmpAxis.y = 0f;
			}
		}
	}

	// Token: 0x06000358 RID: 856 RVA: 0x0001636C File Offset: 0x0001456C
	public void OnPointerDown(PointerEventData eventData)
	{
		if (this._activated && !this.isOnTouch)
		{
			this.axisX.axisState = ETCAxis.AxisState.Down;
			this.tmpAxis = eventData.delta;
			this.isOut = false;
			this.isOnTouch = true;
			this.pointId = eventData.pointerId;
			this.onTouchStart.Invoke();
		}
	}

	// Token: 0x06000359 RID: 857 RVA: 0x000163CC File Offset: 0x000145CC
	public void OnPointerUp(PointerEventData eventData)
	{
		if (this.pointId == eventData.pointerId)
		{
			this.isOnDrag = false;
			this.isOnTouch = false;
			this.tmpAxis = Vector2.zero;
			this.OldTmpAxis = Vector2.zero;
			this.axisX.axisState = ETCAxis.AxisState.None;
			this.axisY.axisState = ETCAxis.AxisState.None;
			if (!this.axisX.isEnertia && !this.axisY.isEnertia)
			{
				this.axisX.ResetAxis();
				this.axisY.ResetAxis();
				this.onMoveEnd.Invoke();
			}
			this.onTouchUp.Invoke();
			if (this.previousDargObject)
			{
				ExecuteEvents.Execute<IPointerUpHandler>(this.previousDargObject, eventData, ExecuteEvents.pointerUpHandler);
				this.previousDargObject = null;
			}
			this.pointId = -1;
		}
	}

	// Token: 0x0600035A RID: 858 RVA: 0x000164A4 File Offset: 0x000146A4
	public void OnPointerExit(PointerEventData eventData)
	{
		if (this.pointId == eventData.pointerId && !this.isSwipeOut)
		{
			this.isOut = true;
			this.OnPointerUp(eventData);
		}
	}

	// Token: 0x0600035B RID: 859 RVA: 0x000164DC File Offset: 0x000146DC
	private void UpdateTouchPad()
	{
		if (this.enableKeySimulation && !this.isOnTouch && this._activated && this._visible)
		{
			this.isOnDrag = false;
			this.tmpAxis = Vector2.zero;
			if (Input.GetKey(this.axisX.positivekey))
			{
				this.isOnDrag = true;
				this.tmpAxis = new Vector2(1f, this.tmpAxis.y);
			}
			else if (Input.GetKey(this.axisX.negativeKey))
			{
				this.isOnDrag = true;
				this.tmpAxis = new Vector2(-1f, this.tmpAxis.y);
			}
			if (Input.GetKey(this.axisY.positivekey))
			{
				this.isOnDrag = true;
				this.tmpAxis = new Vector2(this.tmpAxis.x, 1f);
			}
			else if (Input.GetKey(this.axisY.negativeKey))
			{
				this.isOnDrag = true;
				this.tmpAxis = new Vector2(this.tmpAxis.x, -1f);
			}
		}
		this.OldTmpAxis.x = this.axisX.axisValue;
		this.OldTmpAxis.y = this.axisY.axisValue;
		this.axisX.UpdateAxis(this.tmpAxis.x, this.isOnDrag, ETCBase.ControlType.DPad, true);
		this.axisY.UpdateAxis(this.tmpAxis.y, this.isOnDrag, ETCBase.ControlType.DPad, true);
		this.axisX.DoGravity();
		this.axisY.DoGravity();
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
		if (this.OldTmpAxis.x == 0f && Mathf.Abs(this.axisX.axisValue) > 0f)
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
		if (this.OldTmpAxis.y == 0f && Mathf.Abs(this.axisY.axisValue) > 0f)
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
		this.tmpAxis = Vector2.zero;
	}

	// Token: 0x0600035C RID: 860 RVA: 0x00016AA4 File Offset: 0x00014CA4
	protected override void SetVisible()
	{
		if (Application.isPlaying)
		{
			if (!this._visible)
			{
				this.cachedImage.color = new Color(0f, 0f, 0f, 0f);
			}
			else
			{
				this.cachedImage.color = new Color(1f, 1f, 1f, 1f);
			}
		}
	}

	// Token: 0x0400038C RID: 908
	[SerializeField]
	public ETCTouchPad.OnMoveStartHandler onMoveStart;

	// Token: 0x0400038D RID: 909
	[SerializeField]
	public ETCTouchPad.OnMoveHandler onMove;

	// Token: 0x0400038E RID: 910
	[SerializeField]
	public ETCTouchPad.OnMoveSpeedHandler onMoveSpeed;

	// Token: 0x0400038F RID: 911
	[SerializeField]
	public ETCTouchPad.OnMoveEndHandler onMoveEnd;

	// Token: 0x04000390 RID: 912
	[SerializeField]
	public ETCTouchPad.OnTouchStartHandler onTouchStart;

	// Token: 0x04000391 RID: 913
	[SerializeField]
	public ETCTouchPad.OnTouchUPHandler onTouchUp;

	// Token: 0x04000392 RID: 914
	[SerializeField]
	public ETCTouchPad.OnDownUpHandler OnDownUp;

	// Token: 0x04000393 RID: 915
	[SerializeField]
	public ETCTouchPad.OnDownDownHandler OnDownDown;

	// Token: 0x04000394 RID: 916
	[SerializeField]
	public ETCTouchPad.OnDownLeftHandler OnDownLeft;

	// Token: 0x04000395 RID: 917
	[SerializeField]
	public ETCTouchPad.OnDownRightHandler OnDownRight;

	// Token: 0x04000396 RID: 918
	[SerializeField]
	public ETCTouchPad.OnDownUpHandler OnPressUp;

	// Token: 0x04000397 RID: 919
	[SerializeField]
	public ETCTouchPad.OnDownDownHandler OnPressDown;

	// Token: 0x04000398 RID: 920
	[SerializeField]
	public ETCTouchPad.OnDownLeftHandler OnPressLeft;

	// Token: 0x04000399 RID: 921
	[SerializeField]
	public ETCTouchPad.OnDownRightHandler OnPressRight;

	// Token: 0x0400039A RID: 922
	public ETCAxis axisX;

	// Token: 0x0400039B RID: 923
	public ETCAxis axisY;

	// Token: 0x0400039C RID: 924
	public bool isDPI;

	// Token: 0x0400039D RID: 925
	private Image cachedImage;

	// Token: 0x0400039E RID: 926
	private Vector2 tmpAxis;

	// Token: 0x0400039F RID: 927
	private Vector2 OldTmpAxis;

	// Token: 0x040003A0 RID: 928
	private GameObject previousDargObject;

	// Token: 0x040003A1 RID: 929
	private bool isOut;

	// Token: 0x040003A2 RID: 930
	private bool isOnTouch;

	// Token: 0x02000081 RID: 129
	[Serializable]
	public class OnMoveStartHandler : UnityEvent
	{
	}

	// Token: 0x02000082 RID: 130
	[Serializable]
	public class OnMoveHandler : UnityEvent<Vector2>
	{
	}

	// Token: 0x02000083 RID: 131
	[Serializable]
	public class OnMoveSpeedHandler : UnityEvent<Vector2>
	{
	}

	// Token: 0x02000084 RID: 132
	[Serializable]
	public class OnMoveEndHandler : UnityEvent
	{
	}

	// Token: 0x02000085 RID: 133
	[Serializable]
	public class OnTouchStartHandler : UnityEvent
	{
	}

	// Token: 0x02000086 RID: 134
	[Serializable]
	public class OnTouchUPHandler : UnityEvent
	{
	}

	// Token: 0x02000087 RID: 135
	[Serializable]
	public class OnDownUpHandler : UnityEvent
	{
	}

	// Token: 0x02000088 RID: 136
	[Serializable]
	public class OnDownDownHandler : UnityEvent
	{
	}

	// Token: 0x02000089 RID: 137
	[Serializable]
	public class OnDownLeftHandler : UnityEvent
	{
	}

	// Token: 0x0200008A RID: 138
	[Serializable]
	public class OnDownRightHandler : UnityEvent
	{
	}

	// Token: 0x0200008B RID: 139
	[Serializable]
	public class OnPressUpHandler : UnityEvent
	{
	}

	// Token: 0x0200008C RID: 140
	[Serializable]
	public class OnPressDownHandler : UnityEvent
	{
	}

	// Token: 0x0200008D RID: 141
	[Serializable]
	public class OnPressLeftHandler : UnityEvent
	{
	}

	// Token: 0x0200008E RID: 142
	[Serializable]
	public class OnPressRightHandler : UnityEvent
	{
	}
}
