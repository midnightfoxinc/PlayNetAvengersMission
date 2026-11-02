using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

// Token: 0x0200005D RID: 93
public class ETCDPad : ETCBase, IPointerUpHandler, IEventSystemHandler, IPointerDownHandler, IDragHandler
{
	// Token: 0x060002CB RID: 715 RVA: 0x00012D7C File Offset: 0x00010F7C
	public ETCDPad()
	{
		this.axisX = new ETCAxis("Horizontal");
		this.axisY = new ETCAxis("Vertical");
		this._visible = true;
		this._activated = true;
		this.dPadAxisCount = ETCBase.DPadAxis.Two_Axis;
		this.tmpAxis = Vector2.zero;
		this.showPSInspector = true;
		this.showSpriteInspector = false;
		this.showBehaviourInspector = false;
		this.showEventInspector = false;
		this.isOnDrag = false;
		this.isOnTouch = false;
		this.axisX.positivekey = 275;
		this.axisX.negativeKey = 276;
		this.axisY.positivekey = 273;
		this.axisY.negativeKey = 274;
		this.enableKeySimulation = true;
		this.enableKeySimulation = false;
	}

	// Token: 0x060002CC RID: 716 RVA: 0x00012E48 File Offset: 0x00011048
	private void Start()
	{
		this.tmpAxis = Vector2.zero;
		this.OldTmpAxis = Vector2.zero;
		this.axisX.InitAxis();
		this.axisY.InitAxis();
	}

	// Token: 0x060002CD RID: 717 RVA: 0x00012E84 File Offset: 0x00011084
	protected override void UpdateControlState()
	{
		this.UpdateDPad();
	}

	// Token: 0x060002CE RID: 718 RVA: 0x00012E8C File Offset: 0x0001108C
	public void OnPointerDown(PointerEventData eventData)
	{
		if (this._activated && !this.isOnTouch)
		{
			this.onTouchStart.Invoke();
			this.GetTouchDirection(eventData.position, eventData.pressEventCamera);
			this.isOnTouch = true;
			this.isOnDrag = true;
			this.pointId = eventData.pointerId;
		}
	}

	// Token: 0x060002CF RID: 719 RVA: 0x00012EE8 File Offset: 0x000110E8
	public void OnDrag(PointerEventData eventData)
	{
		if (this._activated && this.pointId == eventData.pointerId)
		{
			this.isOnTouch = true;
			this.isOnDrag = true;
			this.GetTouchDirection(eventData.position, eventData.pressEventCamera);
		}
	}

	// Token: 0x060002D0 RID: 720 RVA: 0x00012F34 File Offset: 0x00011134
	public void OnPointerUp(PointerEventData eventData)
	{
		if (this.pointId == eventData.pointerId)
		{
			this.isOnTouch = false;
			this.isOnDrag = false;
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
			this.pointId = -1;
			this.onTouchUp.Invoke();
		}
	}

	// Token: 0x060002D1 RID: 721 RVA: 0x00012FE4 File Offset: 0x000111E4
	private void UpdateDPad()
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
	}

	// Token: 0x060002D2 RID: 722 RVA: 0x000135EC File Offset: 0x000117EC
	protected override void SetVisible()
	{
		base.GetComponent<Image>().enabled = this._visible;
	}

	// Token: 0x060002D3 RID: 723 RVA: 0x00013600 File Offset: 0x00011800
	private void GetTouchDirection(Vector2 position, Camera cam)
	{
		Vector2 vector;
		RectTransformUtility.ScreenPointToLocalPointInRectangle(this.cachedRectTransform, position, cam, ref vector);
		Vector2 vector2 = this.rectTransform().sizeDelta / 3f;
		this.tmpAxis = Vector2.zero;
		if ((vector.x < -vector2.x / 2f && vector.y > -vector2.y / 2f && vector.y < vector2.y / 2f && this.dPadAxisCount == ETCBase.DPadAxis.Two_Axis) || (this.dPadAxisCount == ETCBase.DPadAxis.Four_Axis && vector.x < -vector2.x / 2f))
		{
			this.tmpAxis.x = -1f;
		}
		if ((vector.x > vector2.x / 2f && vector.y > -vector2.y / 2f && vector.y < vector2.y / 2f && this.dPadAxisCount == ETCBase.DPadAxis.Two_Axis) || (this.dPadAxisCount == ETCBase.DPadAxis.Four_Axis && vector.x > vector2.x / 2f))
		{
			this.tmpAxis.x = 1f;
		}
		if ((vector.y > vector2.y / 2f && vector.x > -vector2.x / 2f && vector.x < vector2.x / 2f && this.dPadAxisCount == ETCBase.DPadAxis.Two_Axis) || (this.dPadAxisCount == ETCBase.DPadAxis.Four_Axis && vector.y > vector2.y / 2f))
		{
			this.tmpAxis.y = 1f;
		}
		if ((vector.y < -vector2.y / 2f && vector.x > -vector2.x / 2f && vector.x < vector2.x / 2f && this.dPadAxisCount == ETCBase.DPadAxis.Two_Axis) || (this.dPadAxisCount == ETCBase.DPadAxis.Four_Axis && vector.y < -vector2.y / 2f))
		{
			this.tmpAxis.y = -1f;
		}
	}

	// Token: 0x0400033E RID: 830
	[SerializeField]
	public ETCDPad.OnMoveStartHandler onMoveStart;

	// Token: 0x0400033F RID: 831
	[SerializeField]
	public ETCDPad.OnMoveHandler onMove;

	// Token: 0x04000340 RID: 832
	[SerializeField]
	public ETCDPad.OnMoveSpeedHandler onMoveSpeed;

	// Token: 0x04000341 RID: 833
	[SerializeField]
	public ETCDPad.OnMoveEndHandler onMoveEnd;

	// Token: 0x04000342 RID: 834
	[SerializeField]
	public ETCDPad.OnTouchStartHandler onTouchStart;

	// Token: 0x04000343 RID: 835
	[SerializeField]
	public ETCDPad.OnTouchUPHandler onTouchUp;

	// Token: 0x04000344 RID: 836
	[SerializeField]
	public ETCDPad.OnDownUpHandler OnDownUp;

	// Token: 0x04000345 RID: 837
	[SerializeField]
	public ETCDPad.OnDownDownHandler OnDownDown;

	// Token: 0x04000346 RID: 838
	[SerializeField]
	public ETCDPad.OnDownLeftHandler OnDownLeft;

	// Token: 0x04000347 RID: 839
	[SerializeField]
	public ETCDPad.OnDownRightHandler OnDownRight;

	// Token: 0x04000348 RID: 840
	[SerializeField]
	public ETCDPad.OnDownUpHandler OnPressUp;

	// Token: 0x04000349 RID: 841
	[SerializeField]
	public ETCDPad.OnDownDownHandler OnPressDown;

	// Token: 0x0400034A RID: 842
	[SerializeField]
	public ETCDPad.OnDownLeftHandler OnPressLeft;

	// Token: 0x0400034B RID: 843
	[SerializeField]
	public ETCDPad.OnDownRightHandler OnPressRight;

	// Token: 0x0400034C RID: 844
	public ETCAxis axisX;

	// Token: 0x0400034D RID: 845
	public ETCAxis axisY;

	// Token: 0x0400034E RID: 846
	public Sprite normalSprite;

	// Token: 0x0400034F RID: 847
	public Color normalColor;

	// Token: 0x04000350 RID: 848
	public Sprite pressedSprite;

	// Token: 0x04000351 RID: 849
	public Color pressedColor;

	// Token: 0x04000352 RID: 850
	private Vector2 tmpAxis;

	// Token: 0x04000353 RID: 851
	private Vector2 OldTmpAxis;

	// Token: 0x04000354 RID: 852
	private bool isOnTouch;

	// Token: 0x04000355 RID: 853
	private Image cachedImage;

	// Token: 0x0200005E RID: 94
	[Serializable]
	public class OnMoveStartHandler : UnityEvent
	{
	}

	// Token: 0x0200005F RID: 95
	[Serializable]
	public class OnMoveHandler : UnityEvent<Vector2>
	{
	}

	// Token: 0x02000060 RID: 96
	[Serializable]
	public class OnMoveSpeedHandler : UnityEvent<Vector2>
	{
	}

	// Token: 0x02000061 RID: 97
	[Serializable]
	public class OnMoveEndHandler : UnityEvent
	{
	}

	// Token: 0x02000062 RID: 98
	[Serializable]
	public class OnTouchStartHandler : UnityEvent
	{
	}

	// Token: 0x02000063 RID: 99
	[Serializable]
	public class OnTouchUPHandler : UnityEvent
	{
	}

	// Token: 0x02000064 RID: 100
	[Serializable]
	public class OnDownUpHandler : UnityEvent
	{
	}

	// Token: 0x02000065 RID: 101
	[Serializable]
	public class OnDownDownHandler : UnityEvent
	{
	}

	// Token: 0x02000066 RID: 102
	[Serializable]
	public class OnDownLeftHandler : UnityEvent
	{
	}

	// Token: 0x02000067 RID: 103
	[Serializable]
	public class OnDownRightHandler : UnityEvent
	{
	}

	// Token: 0x02000068 RID: 104
	[Serializable]
	public class OnPressUpHandler : UnityEvent
	{
	}

	// Token: 0x02000069 RID: 105
	[Serializable]
	public class OnPressDownHandler : UnityEvent
	{
	}

	// Token: 0x0200006A RID: 106
	[Serializable]
	public class OnPressLeftHandler : UnityEvent
	{
	}

	// Token: 0x0200006B RID: 107
	[Serializable]
	public class OnPressRightHandler : UnityEvent
	{
	}
}
