using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

// Token: 0x02000054 RID: 84
[Serializable]
public abstract class ETCBase : MonoBehaviour
{
	// Token: 0x1700001F RID: 31
	// (get) Token: 0x060002A9 RID: 681 RVA: 0x0001224C File Offset: 0x0001044C
	// (set) Token: 0x060002AA RID: 682 RVA: 0x00012254 File Offset: 0x00010454
	public ETCBase.RectAnchor anchor
	{
		get
		{
			return this._anchor;
		}
		set
		{
			if (value != this._anchor)
			{
				this._anchor = value;
				this.SetAnchorPosition();
			}
		}
	}

	// Token: 0x17000020 RID: 32
	// (get) Token: 0x060002AB RID: 683 RVA: 0x00012270 File Offset: 0x00010470
	// (set) Token: 0x060002AC RID: 684 RVA: 0x00012278 File Offset: 0x00010478
	public Vector2 anchorOffet
	{
		get
		{
			return this._anchorOffet;
		}
		set
		{
			if (value != this._anchorOffet)
			{
				this._anchorOffet = value;
				this.SetAnchorPosition();
			}
		}
	}

	// Token: 0x17000021 RID: 33
	// (get) Token: 0x060002AD RID: 685 RVA: 0x00012298 File Offset: 0x00010498
	// (set) Token: 0x060002AE RID: 686 RVA: 0x000122A0 File Offset: 0x000104A0
	public bool visible
	{
		get
		{
			return this._visible;
		}
		set
		{
			if (value != this._visible)
			{
				this._visible = value;
				this.SetVisible();
			}
		}
	}

	// Token: 0x17000022 RID: 34
	// (get) Token: 0x060002AF RID: 687 RVA: 0x000122BC File Offset: 0x000104BC
	// (set) Token: 0x060002B0 RID: 688 RVA: 0x000122C4 File Offset: 0x000104C4
	public bool activated
	{
		get
		{
			return this._activated;
		}
		set
		{
			if (value != this._activated)
			{
				this._activated = value;
				this.SetActivated();
			}
		}
	}

	// Token: 0x060002B1 RID: 689 RVA: 0x000122E0 File Offset: 0x000104E0
	protected virtual void Awake()
	{
		this.isShuttingDown = false;
		this.cachedRectTransform = (base.transform as RectTransform);
		this.cachedRootCanvas = base.transform.parent.GetComponent<Canvas>();
		if (!this.isShuttingDown)
		{
			ETCSingleton<ETCInput>.instance.RegisterControl(this);
		}
		if (!this.allowSimulationStandalone)
		{
			this.enableKeySimulation = false;
		}
	}

	// Token: 0x060002B2 RID: 690 RVA: 0x00012344 File Offset: 0x00010544
	private void OnDestroy()
	{
		if (!this.isShuttingDown && !Application.isLoadingLevel && ETCSingleton<ETCInput>.instance)
		{
			ETCSingleton<ETCInput>.instance.UnRegisterControl(this);
		}
	}

	// Token: 0x060002B3 RID: 691 RVA: 0x00012378 File Offset: 0x00010578
	private void OnApplicationQuit()
	{
		this.isShuttingDown = true;
	}

	// Token: 0x060002B4 RID: 692 RVA: 0x00012384 File Offset: 0x00010584
	public virtual void Update()
	{
		if (!this.useFixedUpdate)
		{
			base.StartCoroutine("UpdateVirtualControl");
		}
	}

	// Token: 0x060002B5 RID: 693 RVA: 0x000123A0 File Offset: 0x000105A0
	public virtual void FixedUpdate()
	{
		if (this.useFixedUpdate)
		{
			base.StartCoroutine("UpdateVirtualControl");
		}
	}

	// Token: 0x060002B6 RID: 694 RVA: 0x000123BC File Offset: 0x000105BC
	private IEnumerator UpdateVirtualControl()
	{
		yield return new WaitForEndOfFrame();
		this.UpdateControlState();
		yield break;
	}

	// Token: 0x060002B7 RID: 695 RVA: 0x000123D8 File Offset: 0x000105D8
	protected virtual void UpdateControlState()
	{
	}

	// Token: 0x060002B8 RID: 696 RVA: 0x000123DC File Offset: 0x000105DC
	protected virtual void SetVisible()
	{
	}

	// Token: 0x060002B9 RID: 697 RVA: 0x000123E0 File Offset: 0x000105E0
	protected virtual void SetActivated()
	{
	}

	// Token: 0x060002BA RID: 698 RVA: 0x000123E4 File Offset: 0x000105E4
	public void SetAnchorPosition()
	{
		switch (this._anchor)
		{
		case ETCBase.RectAnchor.BottomLeft:
			this.rectTransform().anchorMin = new Vector2(0f, 0f);
			this.rectTransform().anchorMax = new Vector2(0f, 0f);
			this.rectTransform().anchoredPosition = new Vector2(this.rectTransform().sizeDelta.x / 2f + this._anchorOffet.x, this.rectTransform().sizeDelta.y / 2f + this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.BottomCenter:
			this.rectTransform().anchorMin = new Vector2(0.5f, 0f);
			this.rectTransform().anchorMax = new Vector2(0.5f, 0f);
			this.rectTransform().anchoredPosition = new Vector2(this._anchorOffet.x, this.rectTransform().sizeDelta.y / 2f + this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.BottonRight:
			this.rectTransform().anchorMin = new Vector2(1f, 0f);
			this.rectTransform().anchorMax = new Vector2(1f, 0f);
			this.rectTransform().anchoredPosition = new Vector2(-this.rectTransform().sizeDelta.x / 2f - this._anchorOffet.x, this.rectTransform().sizeDelta.y / 2f + this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.CenterLeft:
			this.rectTransform().anchorMin = new Vector2(0f, 0.5f);
			this.rectTransform().anchorMax = new Vector2(0f, 0.5f);
			this.rectTransform().anchoredPosition = new Vector2(this.rectTransform().sizeDelta.x / 2f + this._anchorOffet.x, this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.Center:
			this.rectTransform().anchorMin = new Vector2(0.5f, 0.5f);
			this.rectTransform().anchorMax = new Vector2(0.5f, 0.5f);
			this.rectTransform().anchoredPosition = new Vector2(this._anchorOffet.x, this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.CenterRight:
			this.rectTransform().anchorMin = new Vector2(1f, 0.5f);
			this.rectTransform().anchorMax = new Vector2(1f, 0.5f);
			this.rectTransform().anchoredPosition = new Vector2(-this.rectTransform().sizeDelta.x / 2f - this._anchorOffet.x, this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.TopLeft:
			this.rectTransform().anchorMin = new Vector2(0f, 1f);
			this.rectTransform().anchorMax = new Vector2(0f, 1f);
			this.rectTransform().anchoredPosition = new Vector2(this.rectTransform().sizeDelta.x / 2f + this._anchorOffet.x, -this.rectTransform().sizeDelta.y / 2f - this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.TopCenter:
			this.rectTransform().anchorMin = new Vector2(0.5f, 1f);
			this.rectTransform().anchorMax = new Vector2(0.5f, 1f);
			this.rectTransform().anchoredPosition = new Vector2(this._anchorOffet.x, -this.rectTransform().sizeDelta.y / 2f - this._anchorOffet.y);
			break;
		case ETCBase.RectAnchor.TopRight:
			this.rectTransform().anchorMin = new Vector2(1f, 1f);
			this.rectTransform().anchorMax = new Vector2(1f, 1f);
			this.rectTransform().anchoredPosition = new Vector2(-this.rectTransform().sizeDelta.x / 2f - this._anchorOffet.x, -this.rectTransform().sizeDelta.y / 2f - this._anchorOffet.y);
			break;
		}
	}

	// Token: 0x060002BB RID: 699 RVA: 0x000128C8 File Offset: 0x00010AC8
	protected GameObject GetFirstUIElement(Vector2 position)
	{
		this.uiEventSystem = EventSystem.current;
		if (!(this.uiEventSystem != null))
		{
			return null;
		}
		this.uiPointerEventData = new PointerEventData(this.uiEventSystem);
		this.uiPointerEventData.position = position;
		this.uiEventSystem.RaycastAll(this.uiPointerEventData, this.uiRaycastResultCache);
		if (this.uiRaycastResultCache.Count > 0)
		{
			return this.uiRaycastResultCache[0].gameObject;
		}
		return null;
	}

	// Token: 0x04000304 RID: 772
	protected RectTransform cachedRectTransform;

	// Token: 0x04000305 RID: 773
	protected Canvas cachedRootCanvas;

	// Token: 0x04000306 RID: 774
	[SerializeField]
	protected ETCBase.RectAnchor _anchor;

	// Token: 0x04000307 RID: 775
	[SerializeField]
	protected Vector2 _anchorOffet;

	// Token: 0x04000308 RID: 776
	[SerializeField]
	protected bool _visible;

	// Token: 0x04000309 RID: 777
	[SerializeField]
	protected bool _activated;

	// Token: 0x0400030A RID: 778
	public int pointId = -1;

	// Token: 0x0400030B RID: 779
	public bool enableKeySimulation;

	// Token: 0x0400030C RID: 780
	public bool allowSimulationStandalone;

	// Token: 0x0400030D RID: 781
	public ETCBase.DPadAxis dPadAxisCount;

	// Token: 0x0400030E RID: 782
	public bool useFixedUpdate;

	// Token: 0x0400030F RID: 783
	private bool isShuttingDown;

	// Token: 0x04000310 RID: 784
	private List<RaycastResult> uiRaycastResultCache = new List<RaycastResult>();

	// Token: 0x04000311 RID: 785
	private PointerEventData uiPointerEventData;

	// Token: 0x04000312 RID: 786
	private EventSystem uiEventSystem;

	// Token: 0x04000313 RID: 787
	public bool isOnDrag;

	// Token: 0x04000314 RID: 788
	public bool isSwipeIn;

	// Token: 0x04000315 RID: 789
	public bool isSwipeOut;

	// Token: 0x04000316 RID: 790
	public bool showPSInspector;

	// Token: 0x04000317 RID: 791
	public bool showSpriteInspector;

	// Token: 0x04000318 RID: 792
	public bool showEventInspector;

	// Token: 0x04000319 RID: 793
	public bool showBehaviourInspector;

	// Token: 0x0400031A RID: 794
	public bool showAxesInspector;

	// Token: 0x0400031B RID: 795
	public bool showTouchEventInspector;

	// Token: 0x0400031C RID: 796
	public bool showDownEventInspector;

	// Token: 0x0400031D RID: 797
	public bool showPressEventInspector;

	// Token: 0x02000055 RID: 85
	public enum ControlType
	{
		// Token: 0x0400031F RID: 799
		Joystick,
		// Token: 0x04000320 RID: 800
		TouchPad,
		// Token: 0x04000321 RID: 801
		DPad,
		// Token: 0x04000322 RID: 802
		Button
	}

	// Token: 0x02000056 RID: 86
	public enum RectAnchor
	{
		// Token: 0x04000324 RID: 804
		UserDefined,
		// Token: 0x04000325 RID: 805
		BottomLeft,
		// Token: 0x04000326 RID: 806
		BottomCenter,
		// Token: 0x04000327 RID: 807
		BottonRight,
		// Token: 0x04000328 RID: 808
		CenterLeft,
		// Token: 0x04000329 RID: 809
		Center,
		// Token: 0x0400032A RID: 810
		CenterRight,
		// Token: 0x0400032B RID: 811
		TopLeft,
		// Token: 0x0400032C RID: 812
		TopCenter,
		// Token: 0x0400032D RID: 813
		TopRight
	}

	// Token: 0x02000057 RID: 87
	public enum DPadAxis
	{
		// Token: 0x0400032F RID: 815
		Two_Axis,
		// Token: 0x04000330 RID: 816
		Four_Axis
	}
}
