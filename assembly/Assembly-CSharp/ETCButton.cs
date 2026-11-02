using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

// Token: 0x02000058 RID: 88
[Serializable]
public class ETCButton : ETCBase, IPointerUpHandler, IPointerEnterHandler, IEventSystemHandler, IPointerDownHandler, IPointerExitHandler
{
	// Token: 0x060002BC RID: 700 RVA: 0x00012950 File Offset: 0x00010B50
	public ETCButton()
	{
		this.axis = new ETCAxis("Button");
		this._visible = true;
		this._activated = true;
		this.isOnTouch = false;
		this.enableKeySimulation = true;
		this.enableKeySimulation = false;
		this.axis.positivekey = 32;
		this.showPSInspector = true;
		this.showSpriteInspector = false;
		this.showBehaviourInspector = false;
		this.showEventInspector = false;
	}

	// Token: 0x060002BD RID: 701 RVA: 0x000129C0 File Offset: 0x00010BC0
	protected override void Awake()
	{
		base.Awake();
		this.cachedImage = base.GetComponent<Image>();
	}

	// Token: 0x060002BE RID: 702 RVA: 0x000129D4 File Offset: 0x00010BD4
	private void Start()
	{
		this.isOnPress = false;
	}

	// Token: 0x060002BF RID: 703 RVA: 0x000129E0 File Offset: 0x00010BE0
	protected override void UpdateControlState()
	{
		this.UpdateButton();
	}

	// Token: 0x060002C0 RID: 704 RVA: 0x000129E8 File Offset: 0x00010BE8
	public void OnPointerEnter(PointerEventData eventData)
	{
		if (this.isSwipeIn && !this.isOnTouch)
		{
			if (eventData.pointerDrag != null && eventData.pointerDrag.GetComponent<ETCBase>() && eventData.pointerDrag != base.gameObject)
			{
				this.previousDargObject = eventData.pointerDrag;
			}
			eventData.pointerDrag = base.gameObject;
			eventData.pointerPress = base.gameObject;
			this.OnPointerDown(eventData);
		}
	}

	// Token: 0x060002C1 RID: 705 RVA: 0x00012A74 File Offset: 0x00010C74
	public void OnPointerDown(PointerEventData eventData)
	{
		if (this._activated && !this.isOnTouch)
		{
			this.pointId = eventData.pointerId;
			this.axis.ResetAxis();
			this.axis.axisState = ETCAxis.AxisState.Down;
			this.isOnPress = false;
			this.isOnTouch = true;
			this.onDown.Invoke();
			this.ApllyState();
		}
	}

	// Token: 0x060002C2 RID: 706 RVA: 0x00012ADC File Offset: 0x00010CDC
	public void OnPointerUp(PointerEventData eventData)
	{
		if (this.pointId == eventData.pointerId)
		{
			this.isOnPress = false;
			this.isOnTouch = false;
			this.axis.axisState = ETCAxis.AxisState.Up;
			this.axis.axisValue = 0f;
			this.onUp.Invoke();
			this.ApllyState();
			if (this.previousDargObject)
			{
				ExecuteEvents.Execute<IPointerUpHandler>(this.previousDargObject, eventData, ExecuteEvents.pointerUpHandler);
				this.previousDargObject = null;
			}
		}
	}

	// Token: 0x060002C3 RID: 707 RVA: 0x00012B60 File Offset: 0x00010D60
	public void OnPointerExit(PointerEventData eventData)
	{
		if (this.pointId == eventData.pointerId && this.axis.axisState == ETCAxis.AxisState.Press && !this.isSwipeOut)
		{
			this.OnPointerUp(eventData);
		}
	}

	// Token: 0x060002C4 RID: 708 RVA: 0x00012BA4 File Offset: 0x00010DA4
	private void UpdateButton()
	{
		if (this.axis.axisState == ETCAxis.AxisState.Down)
		{
			this.isOnPress = true;
			this.axis.axisState = ETCAxis.AxisState.Press;
		}
		if (this.isOnPress)
		{
			this.axis.UpdateButton();
			this.onPressed.Invoke();
			this.onPressedValue.Invoke(this.axis.axisValue);
		}
		if (this.axis.axisState == ETCAxis.AxisState.Up)
		{
			this.isOnPress = false;
			this.axis.axisState = ETCAxis.AxisState.None;
		}
		if (this.enableKeySimulation && this._activated && this._visible && !this.isOnTouch)
		{
			if (Input.GetKey(this.axis.positivekey) && this.axis.axisState == ETCAxis.AxisState.None)
			{
				this.axis.axisState = ETCAxis.AxisState.Down;
			}
			if (!Input.GetKey(this.axis.positivekey) && this.axis.axisState == ETCAxis.AxisState.Press)
			{
				this.axis.axisState = ETCAxis.AxisState.Up;
				this.onUp.Invoke();
			}
		}
	}

	// Token: 0x060002C5 RID: 709 RVA: 0x00012CCC File Offset: 0x00010ECC
	protected override void SetVisible()
	{
		base.GetComponent<Image>().enabled = this._visible;
	}

	// Token: 0x060002C6 RID: 710 RVA: 0x00012CE0 File Offset: 0x00010EE0
	private void ApllyState()
	{
		ETCAxis.AxisState axisState = this.axis.axisState;
		if (axisState != ETCAxis.AxisState.Down && axisState != ETCAxis.AxisState.Press)
		{
			this.cachedImage.sprite = this.normalSprite;
			this.cachedImage.color = this.normalColor;
		}
		else
		{
			this.cachedImage.sprite = this.pressedSprite;
			this.cachedImage.color = this.pressedColor;
		}
	}

	// Token: 0x04000331 RID: 817
	[SerializeField]
	public ETCButton.OnDownHandler onDown;

	// Token: 0x04000332 RID: 818
	[SerializeField]
	public ETCButton.OnPressedHandler onPressed;

	// Token: 0x04000333 RID: 819
	[SerializeField]
	public ETCButton.OnPressedValueandler onPressedValue;

	// Token: 0x04000334 RID: 820
	[SerializeField]
	public ETCButton.OnUPHandler onUp;

	// Token: 0x04000335 RID: 821
	public ETCAxis axis;

	// Token: 0x04000336 RID: 822
	public Sprite normalSprite;

	// Token: 0x04000337 RID: 823
	public Color normalColor;

	// Token: 0x04000338 RID: 824
	public Sprite pressedSprite;

	// Token: 0x04000339 RID: 825
	public Color pressedColor;

	// Token: 0x0400033A RID: 826
	private Image cachedImage;

	// Token: 0x0400033B RID: 827
	private bool isOnPress;

	// Token: 0x0400033C RID: 828
	private GameObject previousDargObject;

	// Token: 0x0400033D RID: 829
	private bool isOnTouch;

	// Token: 0x02000059 RID: 89
	[Serializable]
	public class OnDownHandler : UnityEvent
	{
	}

	// Token: 0x0200005A RID: 90
	[Serializable]
	public class OnPressedHandler : UnityEvent
	{
	}

	// Token: 0x0200005B RID: 91
	[Serializable]
	public class OnPressedValueandler : UnityEvent<float>
	{
	}

	// Token: 0x0200005C RID: 92
	[Serializable]
	public class OnUPHandler : UnityEvent
	{
	}
}
