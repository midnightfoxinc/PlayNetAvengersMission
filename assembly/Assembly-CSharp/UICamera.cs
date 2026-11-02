using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000114 RID: 276
[RequireComponent(typeof(Camera))]
[ExecuteInEditMode]
[AddComponentMenu("NGUI/UI/NGUI Event System (UICamera)")]
public class UICamera : MonoBehaviour
{
	// Token: 0x170000FE RID: 254
	// (get) Token: 0x0600087C RID: 2172 RVA: 0x0003D620 File Offset: 0x0003B820
	[Obsolete("Use new OnDragStart / OnDragOver / OnDragOut / OnDragEnd events instead")]
	public bool stickyPress
	{
		get
		{
			return true;
		}
	}

	// Token: 0x170000FF RID: 255
	// (get) Token: 0x0600087D RID: 2173 RVA: 0x0003D624 File Offset: 0x0003B824
	// (set) Token: 0x0600087E RID: 2174 RVA: 0x0003D63C File Offset: 0x0003B83C
	public static bool disableController
	{
		get
		{
			return UICamera.mDisableController && !UIPopupList.isOpen;
		}
		set
		{
			UICamera.mDisableController = value;
		}
	}

	// Token: 0x17000100 RID: 256
	// (get) Token: 0x0600087F RID: 2175 RVA: 0x0003D644 File Offset: 0x0003B844
	// (set) Token: 0x06000880 RID: 2176 RVA: 0x0003D64C File Offset: 0x0003B84C
	[Obsolete("Use lastEventPosition instead. It handles controller input properly.")]
	public static Vector2 lastTouchPosition
	{
		get
		{
			return UICamera.mLastPos;
		}
		set
		{
			UICamera.mLastPos = value;
		}
	}

	// Token: 0x17000101 RID: 257
	// (get) Token: 0x06000881 RID: 2177 RVA: 0x0003D654 File Offset: 0x0003B854
	// (set) Token: 0x06000882 RID: 2178 RVA: 0x0003D6B0 File Offset: 0x0003B8B0
	public static Vector2 lastEventPosition
	{
		get
		{
			UICamera.ControlScheme currentScheme = UICamera.currentScheme;
			if (currentScheme == UICamera.ControlScheme.Controller)
			{
				GameObject hoveredObject = UICamera.hoveredObject;
				if (hoveredObject != null)
				{
					Bounds bounds = NGUIMath.CalculateAbsoluteWidgetBounds(hoveredObject.transform);
					Camera camera = NGUITools.FindCameraForLayer(hoveredObject.layer);
					return camera.WorldToScreenPoint(bounds.center);
				}
			}
			return UICamera.mLastPos;
		}
		set
		{
			UICamera.mLastPos = value;
		}
	}

	// Token: 0x17000102 RID: 258
	// (get) Token: 0x06000883 RID: 2179 RVA: 0x0003D6B8 File Offset: 0x0003B8B8
	public static UICamera first
	{
		get
		{
			if (UICamera.list == null || UICamera.list.size == 0)
			{
				return null;
			}
			return UICamera.list[0];
		}
	}

	// Token: 0x17000103 RID: 259
	// (get) Token: 0x06000884 RID: 2180 RVA: 0x0003D6EC File Offset: 0x0003B8EC
	// (set) Token: 0x06000885 RID: 2181 RVA: 0x0003D75C File Offset: 0x0003B95C
	public static UICamera.ControlScheme currentScheme
	{
		get
		{
			if (UICamera.mCurrentKey == null)
			{
				return UICamera.ControlScheme.Touch;
			}
			if (UICamera.mCurrentKey >= 330)
			{
				return UICamera.ControlScheme.Controller;
			}
			if (UICamera.current != null && UICamera.mLastScheme == UICamera.ControlScheme.Controller && (UICamera.mCurrentKey == UICamera.current.submitKey0 || UICamera.mCurrentKey == UICamera.current.submitKey1))
			{
				return UICamera.ControlScheme.Controller;
			}
			return UICamera.ControlScheme.Mouse;
		}
		set
		{
			if (value == UICamera.ControlScheme.Mouse)
			{
				UICamera.currentKey = 323;
			}
			else if (value == UICamera.ControlScheme.Controller)
			{
				UICamera.currentKey = 330;
			}
			else if (value == UICamera.ControlScheme.Touch)
			{
				UICamera.currentKey = 0;
			}
			else
			{
				UICamera.currentKey = 48;
			}
			UICamera.mLastScheme = value;
		}
	}

	// Token: 0x17000104 RID: 260
	// (get) Token: 0x06000886 RID: 2182 RVA: 0x0003D7B4 File Offset: 0x0003B9B4
	// (set) Token: 0x06000887 RID: 2183 RVA: 0x0003D7BC File Offset: 0x0003B9BC
	public static KeyCode currentKey
	{
		get
		{
			return UICamera.mCurrentKey;
		}
		set
		{
			if (UICamera.mCurrentKey != value)
			{
				UICamera.ControlScheme controlScheme = UICamera.mLastScheme;
				UICamera.mCurrentKey = value;
				UICamera.mLastScheme = UICamera.currentScheme;
				if (controlScheme != UICamera.mLastScheme)
				{
					UICamera.HideTooltip();
					if (UICamera.mLastScheme == UICamera.ControlScheme.Mouse)
					{
						Cursor.lockState = 0;
						Cursor.visible = true;
					}
					else if (UICamera.current != null && UICamera.current.autoHideCursor)
					{
						Cursor.visible = false;
						Cursor.lockState = 1;
						UICamera.mMouse[0].ignoreDelta = 2;
					}
					if (UICamera.onSchemeChange != null)
					{
						UICamera.onSchemeChange();
					}
				}
			}
		}
	}

	// Token: 0x17000105 RID: 261
	// (get) Token: 0x06000888 RID: 2184 RVA: 0x0003D864 File Offset: 0x0003BA64
	public static Ray currentRay
	{
		get
		{
			return (!(UICamera.currentCamera != null) || UICamera.currentTouch == null) ? default(Ray) : UICamera.currentCamera.ScreenPointToRay(UICamera.currentTouch.pos);
		}
	}

	// Token: 0x17000106 RID: 262
	// (get) Token: 0x06000889 RID: 2185 RVA: 0x0003D8B4 File Offset: 0x0003BAB4
	public static bool inputHasFocus
	{
		get
		{
			return UICamera.mInputFocus && UICamera.mSelected && UICamera.mSelected.activeInHierarchy;
		}
	}

	// Token: 0x17000107 RID: 263
	// (get) Token: 0x0600088A RID: 2186 RVA: 0x0003D8E4 File Offset: 0x0003BAE4
	// (set) Token: 0x0600088B RID: 2187 RVA: 0x0003D8EC File Offset: 0x0003BAEC
	[Obsolete("Use delegates instead such as UICamera.onClick, UICamera.onHover, etc.")]
	public static GameObject genericEventHandler
	{
		get
		{
			return UICamera.mGenericHandler;
		}
		set
		{
			UICamera.mGenericHandler = value;
		}
	}

	// Token: 0x17000108 RID: 264
	// (get) Token: 0x0600088C RID: 2188 RVA: 0x0003D8F4 File Offset: 0x0003BAF4
	private bool handlesEvents
	{
		get
		{
			return UICamera.eventHandler == this;
		}
	}

	// Token: 0x17000109 RID: 265
	// (get) Token: 0x0600088D RID: 2189 RVA: 0x0003D904 File Offset: 0x0003BB04
	public Camera cachedCamera
	{
		get
		{
			if (this.mCam == null)
			{
				this.mCam = base.GetComponent<Camera>();
			}
			return this.mCam;
		}
	}

	// Token: 0x1700010A RID: 266
	// (get) Token: 0x0600088E RID: 2190 RVA: 0x0003D92C File Offset: 0x0003BB2C
	public static GameObject tooltipObject
	{
		get
		{
			return UICamera.mTooltip;
		}
	}

	// Token: 0x1700010B RID: 267
	// (get) Token: 0x0600088F RID: 2191 RVA: 0x0003D934 File Offset: 0x0003BB34
	public static bool isOverUI
	{
		get
		{
			if (UICamera.currentTouch != null)
			{
				return UICamera.currentTouch.isOverUI;
			}
			int i = 0;
			int count = UICamera.activeTouches.Count;
			while (i < count)
			{
				UICamera.MouseOrTouch mouseOrTouch = UICamera.activeTouches[i];
				if (mouseOrTouch.pressed != null && mouseOrTouch.pressed != UICamera.fallThrough && NGUITools.FindInParents<UIRoot>(mouseOrTouch.pressed) != null)
				{
					return true;
				}
				i++;
			}
			return (UICamera.mMouse[0].current != null && UICamera.mMouse[0].current != UICamera.fallThrough && NGUITools.FindInParents<UIRoot>(UICamera.mMouse[0].current) != null) || (UICamera.controller.pressed != null && UICamera.controller.pressed != UICamera.fallThrough && NGUITools.FindInParents<UIRoot>(UICamera.controller.pressed) != null);
		}
	}

	// Token: 0x1700010C RID: 268
	// (get) Token: 0x06000890 RID: 2192 RVA: 0x0003DA58 File Offset: 0x0003BC58
	// (set) Token: 0x06000891 RID: 2193 RVA: 0x0003DAB4 File Offset: 0x0003BCB4
	public static GameObject hoveredObject
	{
		get
		{
			if (UICamera.currentTouch != null && UICamera.currentTouch.dragStarted)
			{
				return UICamera.currentTouch.current;
			}
			if (UICamera.mHover && UICamera.mHover.activeInHierarchy)
			{
				return UICamera.mHover;
			}
			UICamera.mHover = null;
			return null;
		}
		set
		{
			if (UICamera.mHover == value)
			{
				return;
			}
			bool flag = false;
			UICamera uicamera = UICamera.current;
			if (UICamera.currentTouch == null)
			{
				flag = true;
				UICamera.currentTouchID = -100;
				UICamera.currentTouch = UICamera.controller;
			}
			UICamera.ShowTooltip(null);
			if (UICamera.mSelected && UICamera.currentScheme == UICamera.ControlScheme.Controller)
			{
				UICamera.Notify(UICamera.mSelected, "OnSelect", false);
				if (UICamera.onSelect != null)
				{
					UICamera.onSelect(UICamera.mSelected, false);
				}
				UICamera.mSelected = null;
			}
			if (UICamera.mHover)
			{
				UICamera.Notify(UICamera.mHover, "OnHover", false);
				if (UICamera.onHover != null)
				{
					UICamera.onHover(UICamera.mHover, false);
				}
			}
			UICamera.mHover = value;
			UICamera.currentTouch.clickNotification = UICamera.ClickNotification.None;
			if (UICamera.mHover)
			{
				if (UICamera.mHover != UICamera.controller.current && UICamera.mHover.GetComponent<UIKeyNavigation>() != null)
				{
					UICamera.controller.current = UICamera.mHover;
				}
				if (flag)
				{
					UICamera uicamera2 = (!(UICamera.mHover != null)) ? UICamera.list[0] : UICamera.FindCameraForLayer(UICamera.mHover.layer);
					if (uicamera2 != null)
					{
						UICamera.current = uicamera2;
						UICamera.currentCamera = uicamera2.cachedCamera;
					}
				}
				if (UICamera.onHover != null)
				{
					UICamera.onHover(UICamera.mHover, true);
				}
				UICamera.Notify(UICamera.mHover, "OnHover", true);
			}
			if (flag)
			{
				UICamera.current = uicamera;
				UICamera.currentCamera = ((!(uicamera != null)) ? null : uicamera.cachedCamera);
				UICamera.currentTouch = null;
				UICamera.currentTouchID = -100;
			}
		}
	}

	// Token: 0x1700010D RID: 269
	// (get) Token: 0x06000892 RID: 2194 RVA: 0x0003DCA0 File Offset: 0x0003BEA0
	// (set) Token: 0x06000893 RID: 2195 RVA: 0x0003DE08 File Offset: 0x0003C008
	public static GameObject controllerNavigationObject
	{
		get
		{
			if (UICamera.controller.current && UICamera.controller.current.activeInHierarchy)
			{
				return UICamera.controller.current;
			}
			if (UICamera.currentScheme == UICamera.ControlScheme.Controller && UICamera.current != null && UICamera.current.useController && !UICamera.ignoreControllerInput && UIKeyNavigation.list.size > 0)
			{
				for (int i = 0; i < UIKeyNavigation.list.size; i++)
				{
					UIKeyNavigation uikeyNavigation = UIKeyNavigation.list[i];
					if (uikeyNavigation && uikeyNavigation.constraint != UIKeyNavigation.Constraint.Explicit && uikeyNavigation.startsSelected)
					{
						UICamera.hoveredObject = uikeyNavigation.gameObject;
						UICamera.controller.current = UICamera.mHover;
						return UICamera.mHover;
					}
				}
				if (UICamera.mHover == null)
				{
					for (int j = 0; j < UIKeyNavigation.list.size; j++)
					{
						UIKeyNavigation uikeyNavigation2 = UIKeyNavigation.list[j];
						if (uikeyNavigation2 && uikeyNavigation2.constraint != UIKeyNavigation.Constraint.Explicit)
						{
							UICamera.hoveredObject = uikeyNavigation2.gameObject;
							UICamera.controller.current = UICamera.mHover;
							return UICamera.mHover;
						}
					}
				}
			}
			UICamera.controller.current = null;
			return null;
		}
		set
		{
			if (UICamera.controller.current != value && UICamera.controller.current)
			{
				UICamera.Notify(UICamera.controller.current, "OnHover", false);
				if (UICamera.onHover != null)
				{
					UICamera.onHover(UICamera.controller.current, false);
				}
				UICamera.controller.current = null;
			}
			UICamera.hoveredObject = value;
		}
	}

	// Token: 0x1700010E RID: 270
	// (get) Token: 0x06000894 RID: 2196 RVA: 0x0003DE88 File Offset: 0x0003C088
	// (set) Token: 0x06000895 RID: 2197 RVA: 0x0003DEB8 File Offset: 0x0003C0B8
	public static GameObject selectedObject
	{
		get
		{
			if (UICamera.mSelected && UICamera.mSelected.activeInHierarchy)
			{
				return UICamera.mSelected;
			}
			UICamera.mSelected = null;
			return null;
		}
		set
		{
			if (UICamera.mSelected == value)
			{
				UICamera.hoveredObject = value;
				UICamera.controller.current = value;
				return;
			}
			UICamera.ShowTooltip(null);
			bool flag = false;
			UICamera uicamera = UICamera.current;
			if (UICamera.currentTouch == null)
			{
				flag = true;
				UICamera.currentTouchID = -100;
				UICamera.currentTouch = UICamera.controller;
			}
			UICamera.mInputFocus = false;
			if (UICamera.mSelected)
			{
				UICamera.Notify(UICamera.mSelected, "OnSelect", false);
				if (UICamera.onSelect != null)
				{
					UICamera.onSelect(UICamera.mSelected, false);
				}
			}
			UICamera.mSelected = value;
			UICamera.currentTouch.clickNotification = UICamera.ClickNotification.None;
			if (value != null)
			{
				UIKeyNavigation component = value.GetComponent<UIKeyNavigation>();
				if (component != null)
				{
					UICamera.controller.current = value;
				}
			}
			if (UICamera.mSelected && flag)
			{
				UICamera uicamera2 = (!(UICamera.mSelected != null)) ? UICamera.list[0] : UICamera.FindCameraForLayer(UICamera.mSelected.layer);
				if (uicamera2 != null)
				{
					UICamera.current = uicamera2;
					UICamera.currentCamera = uicamera2.cachedCamera;
				}
			}
			if (UICamera.mSelected)
			{
				UICamera.mInputFocus = (UICamera.mSelected.activeInHierarchy && UICamera.mSelected.GetComponent<UIInput>() != null);
				if (UICamera.onSelect != null)
				{
					UICamera.onSelect(UICamera.mSelected, true);
				}
				UICamera.Notify(UICamera.mSelected, "OnSelect", true);
			}
			if (flag)
			{
				UICamera.current = uicamera;
				UICamera.currentCamera = ((!(uicamera != null)) ? null : uicamera.cachedCamera);
				UICamera.currentTouch = null;
				UICamera.currentTouchID = -100;
			}
		}
	}

	// Token: 0x06000896 RID: 2198 RVA: 0x0003E090 File Offset: 0x0003C290
	public static bool IsPressed(GameObject go)
	{
		for (int i = 0; i < 3; i++)
		{
			if (UICamera.mMouse[i].pressed == go)
			{
				return true;
			}
		}
		int j = 0;
		int count = UICamera.activeTouches.Count;
		while (j < count)
		{
			UICamera.MouseOrTouch mouseOrTouch = UICamera.activeTouches[j];
			if (mouseOrTouch.pressed == go)
			{
				return true;
			}
			j++;
		}
		return UICamera.controller.pressed == go;
	}

	// Token: 0x1700010F RID: 271
	// (get) Token: 0x06000897 RID: 2199 RVA: 0x0003E11C File Offset: 0x0003C31C
	[Obsolete("Use either 'CountInputSources()' or 'activeTouches.Count'")]
	public static int touchCount
	{
		get
		{
			return UICamera.CountInputSources();
		}
	}

	// Token: 0x06000898 RID: 2200 RVA: 0x0003E124 File Offset: 0x0003C324
	public static int CountInputSources()
	{
		int num = 0;
		int i = 0;
		int count = UICamera.activeTouches.Count;
		while (i < count)
		{
			UICamera.MouseOrTouch mouseOrTouch = UICamera.activeTouches[i];
			if (mouseOrTouch.pressed != null)
			{
				num++;
			}
			i++;
		}
		for (int j = 0; j < UICamera.mMouse.Length; j++)
		{
			if (UICamera.mMouse[j].pressed != null)
			{
				num++;
			}
		}
		if (UICamera.controller.pressed != null)
		{
			num++;
		}
		return num;
	}

	// Token: 0x17000110 RID: 272
	// (get) Token: 0x06000899 RID: 2201 RVA: 0x0003E1C4 File Offset: 0x0003C3C4
	public static int dragCount
	{
		get
		{
			int num = 0;
			int i = 0;
			int count = UICamera.activeTouches.Count;
			while (i < count)
			{
				UICamera.MouseOrTouch mouseOrTouch = UICamera.activeTouches[i];
				if (mouseOrTouch.dragged != null)
				{
					num++;
				}
				i++;
			}
			for (int j = 0; j < UICamera.mMouse.Length; j++)
			{
				if (UICamera.mMouse[j].dragged != null)
				{
					num++;
				}
			}
			if (UICamera.controller.dragged != null)
			{
				num++;
			}
			return num;
		}
	}

	// Token: 0x17000111 RID: 273
	// (get) Token: 0x0600089A RID: 2202 RVA: 0x0003E264 File Offset: 0x0003C464
	public static Camera mainCamera
	{
		get
		{
			UICamera eventHandler = UICamera.eventHandler;
			return (!(eventHandler != null)) ? null : eventHandler.cachedCamera;
		}
	}

	// Token: 0x17000112 RID: 274
	// (get) Token: 0x0600089B RID: 2203 RVA: 0x0003E290 File Offset: 0x0003C490
	public static UICamera eventHandler
	{
		get
		{
			for (int i = 0; i < UICamera.list.size; i++)
			{
				UICamera uicamera = UICamera.list.buffer[i];
				if (!(uicamera == null) && uicamera.enabled && NGUITools.GetActive(uicamera.gameObject))
				{
					return uicamera;
				}
			}
			return null;
		}
	}

	// Token: 0x0600089C RID: 2204 RVA: 0x0003E2F4 File Offset: 0x0003C4F4
	private static int CompareFunc(UICamera a, UICamera b)
	{
		if (a.cachedCamera.depth < b.cachedCamera.depth)
		{
			return 1;
		}
		if (a.cachedCamera.depth > b.cachedCamera.depth)
		{
			return -1;
		}
		return 0;
	}

	// Token: 0x0600089D RID: 2205 RVA: 0x0003E33C File Offset: 0x0003C53C
	private static Rigidbody FindRootRigidbody(Transform trans)
	{
		while (trans != null)
		{
			if (trans.GetComponent<UIPanel>() != null)
			{
				return null;
			}
			Rigidbody component = trans.GetComponent<Rigidbody>();
			if (component != null)
			{
				return component;
			}
			trans = trans.parent;
		}
		return null;
	}

	// Token: 0x0600089E RID: 2206 RVA: 0x0003E38C File Offset: 0x0003C58C
	private static Rigidbody2D FindRootRigidbody2D(Transform trans)
	{
		while (trans != null)
		{
			if (trans.GetComponent<UIPanel>() != null)
			{
				return null;
			}
			Rigidbody2D component = trans.GetComponent<Rigidbody2D>();
			if (component != null)
			{
				return component;
			}
			trans = trans.parent;
		}
		return null;
	}

	// Token: 0x0600089F RID: 2207 RVA: 0x0003E3DC File Offset: 0x0003C5DC
	public static void Raycast(UICamera.MouseOrTouch touch)
	{
		if (!UICamera.Raycast(touch.pos))
		{
			UICamera.mRayHitObject = UICamera.fallThrough;
		}
		if (UICamera.mRayHitObject == null)
		{
			UICamera.mRayHitObject = UICamera.mGenericHandler;
		}
		touch.last = touch.current;
		touch.current = UICamera.mRayHitObject;
		UICamera.mLastPos = touch.pos;
	}

	// Token: 0x060008A0 RID: 2208 RVA: 0x0003E444 File Offset: 0x0003C644
	public static bool Raycast(Vector3 inPos)
	{
		for (int i = 0; i < UICamera.list.size; i++)
		{
			UICamera uicamera = UICamera.list.buffer[i];
			if (uicamera.enabled && NGUITools.GetActive(uicamera.gameObject))
			{
				UICamera.currentCamera = uicamera.cachedCamera;
				Vector3 vector = UICamera.currentCamera.ScreenToViewportPoint(inPos);
				if (!float.IsNaN(vector.x) && !float.IsNaN(vector.y))
				{
					if (vector.x >= 0f && vector.x <= 1f && vector.y >= 0f && vector.y <= 1f)
					{
						Ray ray = UICamera.currentCamera.ScreenPointToRay(inPos);
						int num = UICamera.currentCamera.cullingMask & uicamera.eventReceiverMask;
						float num2 = (uicamera.rangeDistance <= 0f) ? (UICamera.currentCamera.farClipPlane - UICamera.currentCamera.nearClipPlane) : uicamera.rangeDistance;
						if (uicamera.eventType == UICamera.EventType.World_3D)
						{
							if (Physics.Raycast(ray, ref UICamera.lastHit, num2, num))
							{
								UICamera.lastWorldPosition = UICamera.lastHit.point;
								UICamera.mRayHitObject = UICamera.lastHit.collider.gameObject;
								if (!uicamera.eventsGoToColliders)
								{
									Rigidbody rigidbody = UICamera.FindRootRigidbody(UICamera.mRayHitObject.transform);
									if (rigidbody != null)
									{
										UICamera.mRayHitObject = rigidbody.gameObject;
									}
								}
								return true;
							}
						}
						else if (uicamera.eventType == UICamera.EventType.UI_3D)
						{
							RaycastHit[] array = Physics.RaycastAll(ray, num2, num);
							if (array.Length > 1)
							{
								int j = 0;
								while (j < array.Length)
								{
									GameObject gameObject = array[j].collider.gameObject;
									UIWidget component = gameObject.GetComponent<UIWidget>();
									if (component != null)
									{
										if (component.isVisible)
										{
											if (component.hitCheck == null || component.hitCheck(array[j].point))
											{
												goto IL_256;
											}
										}
									}
									else
									{
										UIRect uirect = NGUITools.FindInParents<UIRect>(gameObject);
										if (!(uirect != null) || uirect.finalAlpha >= 0.001f)
										{
											goto IL_256;
										}
									}
									IL_2D7:
									j++;
									continue;
									IL_256:
									UICamera.mHit.depth = NGUITools.CalculateRaycastDepth(gameObject);
									if (UICamera.mHit.depth != 2147483647)
									{
										UICamera.mHit.hit = array[j];
										UICamera.mHit.point = array[j].point;
										UICamera.mHit.go = array[j].collider.gameObject;
										UICamera.mHits.Add(UICamera.mHit);
										goto IL_2D7;
									}
									goto IL_2D7;
								}
								UICamera.mHits.Sort((UICamera.DepthEntry r1, UICamera.DepthEntry r2) => r2.depth.CompareTo(r1.depth));
								for (int k = 0; k < UICamera.mHits.size; k++)
								{
									if (UICamera.IsVisible(ref UICamera.mHits.buffer[k]))
									{
										UICamera.lastHit = UICamera.mHits[k].hit;
										UICamera.mRayHitObject = UICamera.mHits[k].go;
										UICamera.lastWorldPosition = UICamera.mHits[k].point;
										UICamera.mHits.Clear();
										return true;
									}
								}
								UICamera.mHits.Clear();
							}
							else if (array.Length == 1)
							{
								GameObject gameObject2 = array[0].collider.gameObject;
								UIWidget component2 = gameObject2.GetComponent<UIWidget>();
								if (component2 != null)
								{
									if (!component2.isVisible)
									{
										goto IL_7D8;
									}
									if (component2.hitCheck != null && !component2.hitCheck(array[0].point))
									{
										goto IL_7D8;
									}
								}
								else
								{
									UIRect uirect2 = NGUITools.FindInParents<UIRect>(gameObject2);
									if (uirect2 != null && uirect2.finalAlpha < 0.001f)
									{
										goto IL_7D8;
									}
								}
								if (UICamera.IsVisible(array[0].point, array[0].collider.gameObject))
								{
									UICamera.lastHit = array[0];
									UICamera.lastWorldPosition = array[0].point;
									UICamera.mRayHitObject = UICamera.lastHit.collider.gameObject;
									return true;
								}
							}
						}
						else if (uicamera.eventType == UICamera.EventType.World_2D)
						{
							if (UICamera.m2DPlane.Raycast(ray, ref num2))
							{
								Vector3 point = ray.GetPoint(num2);
								Collider2D collider2D = Physics2D.OverlapPoint(point, num);
								if (collider2D)
								{
									UICamera.lastWorldPosition = point;
									UICamera.mRayHitObject = collider2D.gameObject;
									if (!uicamera.eventsGoToColliders)
									{
										Rigidbody2D rigidbody2D = UICamera.FindRootRigidbody2D(UICamera.mRayHitObject.transform);
										if (rigidbody2D != null)
										{
											UICamera.mRayHitObject = rigidbody2D.gameObject;
										}
									}
									return true;
								}
							}
						}
						else if (uicamera.eventType == UICamera.EventType.UI_2D)
						{
							if (UICamera.m2DPlane.Raycast(ray, ref num2))
							{
								UICamera.lastWorldPosition = ray.GetPoint(num2);
								Collider2D[] array2 = Physics2D.OverlapPointAll(UICamera.lastWorldPosition, num);
								if (array2.Length > 1)
								{
									int l = 0;
									while (l < array2.Length)
									{
										GameObject gameObject3 = array2[l].gameObject;
										UIWidget component3 = gameObject3.GetComponent<UIWidget>();
										if (component3 != null)
										{
											if (component3.isVisible)
											{
												if (component3.hitCheck == null || component3.hitCheck(UICamera.lastWorldPosition))
												{
													goto IL_62F;
												}
											}
										}
										else
										{
											UIRect uirect3 = NGUITools.FindInParents<UIRect>(gameObject3);
											if (!(uirect3 != null) || uirect3.finalAlpha >= 0.001f)
											{
												goto IL_62F;
											}
										}
										IL_67E:
										l++;
										continue;
										IL_62F:
										UICamera.mHit.depth = NGUITools.CalculateRaycastDepth(gameObject3);
										if (UICamera.mHit.depth != 2147483647)
										{
											UICamera.mHit.go = gameObject3;
											UICamera.mHit.point = UICamera.lastWorldPosition;
											UICamera.mHits.Add(UICamera.mHit);
											goto IL_67E;
										}
										goto IL_67E;
									}
									UICamera.mHits.Sort((UICamera.DepthEntry r1, UICamera.DepthEntry r2) => r2.depth.CompareTo(r1.depth));
									for (int m = 0; m < UICamera.mHits.size; m++)
									{
										if (UICamera.IsVisible(ref UICamera.mHits.buffer[m]))
										{
											UICamera.mRayHitObject = UICamera.mHits[m].go;
											UICamera.mHits.Clear();
											return true;
										}
									}
									UICamera.mHits.Clear();
								}
								else if (array2.Length == 1)
								{
									GameObject gameObject4 = array2[0].gameObject;
									UIWidget component4 = gameObject4.GetComponent<UIWidget>();
									if (component4 != null)
									{
										if (!component4.isVisible)
										{
											goto IL_7D8;
										}
										if (component4.hitCheck != null && !component4.hitCheck(UICamera.lastWorldPosition))
										{
											goto IL_7D8;
										}
									}
									else
									{
										UIRect uirect4 = NGUITools.FindInParents<UIRect>(gameObject4);
										if (uirect4 != null && uirect4.finalAlpha < 0.001f)
										{
											goto IL_7D8;
										}
									}
									if (UICamera.IsVisible(UICamera.lastWorldPosition, gameObject4))
									{
										UICamera.mRayHitObject = gameObject4;
										return true;
									}
								}
							}
						}
					}
				}
			}
			IL_7D8:;
		}
		return false;
	}

	// Token: 0x060008A1 RID: 2209 RVA: 0x0003EC40 File Offset: 0x0003CE40
	private static bool IsVisible(Vector3 worldPoint, GameObject go)
	{
		UIPanel uipanel = NGUITools.FindInParents<UIPanel>(go);
		while (uipanel != null)
		{
			if (!uipanel.IsVisible(worldPoint))
			{
				return false;
			}
			uipanel = uipanel.parentPanel;
		}
		return true;
	}

	// Token: 0x060008A2 RID: 2210 RVA: 0x0003EC7C File Offset: 0x0003CE7C
	private static bool IsVisible(ref UICamera.DepthEntry de)
	{
		UIPanel uipanel = NGUITools.FindInParents<UIPanel>(de.go);
		while (uipanel != null)
		{
			if (!uipanel.IsVisible(de.point))
			{
				return false;
			}
			uipanel = uipanel.parentPanel;
		}
		return true;
	}

	// Token: 0x060008A3 RID: 2211 RVA: 0x0003ECC4 File Offset: 0x0003CEC4
	public static bool IsHighlighted(GameObject go)
	{
		return UICamera.hoveredObject == go;
	}

	// Token: 0x060008A4 RID: 2212 RVA: 0x0003ECD4 File Offset: 0x0003CED4
	public static UICamera FindCameraForLayer(int layer)
	{
		int num = 1 << layer;
		for (int i = 0; i < UICamera.list.size; i++)
		{
			UICamera uicamera = UICamera.list.buffer[i];
			Camera cachedCamera = uicamera.cachedCamera;
			if (cachedCamera != null && (cachedCamera.cullingMask & num) != 0)
			{
				return uicamera;
			}
		}
		return null;
	}

	// Token: 0x060008A5 RID: 2213 RVA: 0x0003ED34 File Offset: 0x0003CF34
	private static int GetDirection(KeyCode up, KeyCode down)
	{
		if (UICamera.GetKeyDown(up))
		{
			UICamera.currentKey = up;
			return 1;
		}
		if (UICamera.GetKeyDown(down))
		{
			UICamera.currentKey = down;
			return -1;
		}
		return 0;
	}

	// Token: 0x060008A6 RID: 2214 RVA: 0x0003ED74 File Offset: 0x0003CF74
	private static int GetDirection(KeyCode up0, KeyCode up1, KeyCode down0, KeyCode down1)
	{
		if (UICamera.GetKeyDown(up0))
		{
			UICamera.currentKey = up0;
			return 1;
		}
		if (UICamera.GetKeyDown(up1))
		{
			UICamera.currentKey = up1;
			return 1;
		}
		if (UICamera.GetKeyDown(down0))
		{
			UICamera.currentKey = down0;
			return -1;
		}
		if (UICamera.GetKeyDown(down1))
		{
			UICamera.currentKey = down1;
			return -1;
		}
		return 0;
	}

	// Token: 0x060008A7 RID: 2215 RVA: 0x0003EDE4 File Offset: 0x0003CFE4
	private static int GetDirection(string axis)
	{
		float time = RealTime.time;
		if (UICamera.mNextEvent < time && !string.IsNullOrEmpty(axis))
		{
			float num = UICamera.GetAxis(axis);
			if (num > 0.75f)
			{
				UICamera.currentKey = 330;
				UICamera.mNextEvent = time + 0.25f;
				return 1;
			}
			if (num < -0.75f)
			{
				UICamera.currentKey = 330;
				UICamera.mNextEvent = time + 0.25f;
				return -1;
			}
		}
		return 0;
	}

	// Token: 0x060008A8 RID: 2216 RVA: 0x0003EE60 File Offset: 0x0003D060
	public static void Notify(GameObject go, string funcName, object obj)
	{
		if (UICamera.mNotifying > 10)
		{
			return;
		}
		if (UICamera.currentScheme == UICamera.ControlScheme.Controller && UIPopupList.isOpen && UIPopupList.current.source == go && UIPopupList.isOpen)
		{
			go = UIPopupList.current.gameObject;
		}
		if (go && go.activeInHierarchy)
		{
			UICamera.mNotifying++;
			go.SendMessage(funcName, obj, 1);
			if (UICamera.mGenericHandler != null && UICamera.mGenericHandler != go)
			{
				UICamera.mGenericHandler.SendMessage(funcName, obj, 1);
			}
			UICamera.mNotifying--;
		}
	}

	// Token: 0x060008A9 RID: 2217 RVA: 0x0003EF20 File Offset: 0x0003D120
	public static UICamera.MouseOrTouch GetMouse(int button)
	{
		return UICamera.mMouse[button];
	}

	// Token: 0x060008AA RID: 2218 RVA: 0x0003EF2C File Offset: 0x0003D12C
	public static UICamera.MouseOrTouch GetTouch(int id, bool createIfMissing = false)
	{
		if (id < 0)
		{
			return UICamera.GetMouse(-id - 1);
		}
		int i = 0;
		int count = UICamera.mTouchIDs.Count;
		while (i < count)
		{
			if (UICamera.mTouchIDs[i] == id)
			{
				return UICamera.activeTouches[i];
			}
			i++;
		}
		if (createIfMissing)
		{
			UICamera.MouseOrTouch mouseOrTouch = new UICamera.MouseOrTouch();
			mouseOrTouch.pressTime = RealTime.time;
			mouseOrTouch.touchBegan = true;
			UICamera.activeTouches.Add(mouseOrTouch);
			UICamera.mTouchIDs.Add(id);
			return mouseOrTouch;
		}
		return null;
	}

	// Token: 0x060008AB RID: 2219 RVA: 0x0003EFBC File Offset: 0x0003D1BC
	public static void RemoveTouch(int id)
	{
		int i = 0;
		int count = UICamera.mTouchIDs.Count;
		while (i < count)
		{
			if (UICamera.mTouchIDs[i] == id)
			{
				UICamera.mTouchIDs.RemoveAt(i);
				UICamera.activeTouches.RemoveAt(i);
				return;
			}
			i++;
		}
	}

	// Token: 0x060008AC RID: 2220 RVA: 0x0003F010 File Offset: 0x0003D210
	private void Awake()
	{
		UICamera.mWidth = Screen.width;
		UICamera.mHeight = Screen.height;
		UICamera.currentScheme = UICamera.ControlScheme.Touch;
		UICamera.mMouse[0].pos = Input.mousePosition;
		for (int i = 1; i < 3; i++)
		{
			UICamera.mMouse[i].pos = UICamera.mMouse[0].pos;
			UICamera.mMouse[i].lastPos = UICamera.mMouse[0].pos;
		}
		UICamera.mLastPos = UICamera.mMouse[0].pos;
	}

	// Token: 0x060008AD RID: 2221 RVA: 0x0003F0A0 File Offset: 0x0003D2A0
	private void OnEnable()
	{
		UICamera.list.Add(this);
		UICamera.list.Sort(new BetterList<UICamera>.CompareFunc(UICamera.CompareFunc));
	}

	// Token: 0x060008AE RID: 2222 RVA: 0x0003F0C4 File Offset: 0x0003D2C4
	private void OnDisable()
	{
		UICamera.list.Remove(this);
	}

	// Token: 0x060008AF RID: 2223 RVA: 0x0003F0D4 File Offset: 0x0003D2D4
	private void Start()
	{
		if (this.eventType != UICamera.EventType.World_3D && this.cachedCamera.transparencySortMode != 2)
		{
			this.cachedCamera.transparencySortMode = 2;
		}
		if (Application.isPlaying)
		{
			if (UICamera.fallThrough == null)
			{
				UIRoot uiroot = NGUITools.FindInParents<UIRoot>(base.gameObject);
				UICamera.fallThrough = ((!(uiroot != null)) ? base.gameObject : uiroot.gameObject);
			}
			this.cachedCamera.eventMask = 0;
		}
	}

	// Token: 0x060008B0 RID: 2224 RVA: 0x0003F160 File Offset: 0x0003D360
	private void Update()
	{
		if (!this.handlesEvents)
		{
			return;
		}
		if (this.processEventsIn == UICamera.ProcessEventsIn.Update)
		{
			this.ProcessEvents();
		}
	}

	// Token: 0x060008B1 RID: 2225 RVA: 0x0003F180 File Offset: 0x0003D380
	private void LateUpdate()
	{
		if (!this.handlesEvents)
		{
			return;
		}
		if (this.processEventsIn == UICamera.ProcessEventsIn.LateUpdate)
		{
			this.ProcessEvents();
		}
		int width = Screen.width;
		int height = Screen.height;
		if (width != UICamera.mWidth || height != UICamera.mHeight)
		{
			UICamera.mWidth = width;
			UICamera.mHeight = height;
			UIRoot.Broadcast("UpdateAnchors");
			if (UICamera.onScreenResize != null)
			{
				UICamera.onScreenResize();
			}
		}
	}

	// Token: 0x060008B2 RID: 2226 RVA: 0x0003F1F8 File Offset: 0x0003D3F8
	private void ProcessEvents()
	{
		UICamera.current = this;
		NGUIDebug.debugRaycast = this.debug;
		if (this.useTouch)
		{
			this.ProcessTouches();
		}
		else if (this.useMouse)
		{
			this.ProcessMouse();
		}
		if (UICamera.onCustomInput != null)
		{
			UICamera.onCustomInput();
		}
		if ((this.useKeyboard || this.useController) && !UICamera.disableController && !UICamera.ignoreControllerInput)
		{
			this.ProcessOthers();
		}
		if (this.useMouse && UICamera.mHover != null && UICamera.currentScheme == UICamera.ControlScheme.Mouse)
		{
			float num = string.IsNullOrEmpty(this.scrollAxisName) ? 0f : UICamera.GetAxis(this.scrollAxisName);
			if (num != 0f)
			{
				if (UICamera.onScroll != null)
				{
					UICamera.onScroll(UICamera.mHover, num);
				}
				UICamera.Notify(UICamera.mHover, "OnScroll", num);
			}
			if (UICamera.showTooltips && UICamera.mTooltipTime != 0f && !UIPopupList.isOpen && UICamera.mMouse[0].dragged == null && (UICamera.mTooltipTime < RealTime.time || UICamera.GetKey(304) || UICamera.GetKey(303)))
			{
				UICamera.currentTouch = UICamera.mMouse[0];
				UICamera.currentTouchID = -1;
				UICamera.ShowTooltip(UICamera.mHover);
			}
		}
		if (UICamera.mTooltip != null && !NGUITools.GetActive(UICamera.mTooltip))
		{
			UICamera.ShowTooltip(null);
		}
		UICamera.current = null;
		UICamera.currentTouchID = -100;
	}

	// Token: 0x060008B3 RID: 2227 RVA: 0x0003F3CC File Offset: 0x0003D5CC
	public void ProcessMouse()
	{
		bool flag = false;
		bool flag2 = false;
		for (int i = 0; i < 3; i++)
		{
			if (Input.GetMouseButtonDown(i))
			{
				UICamera.currentKey = 323 + i;
				flag2 = true;
				flag = true;
			}
			else if (Input.GetMouseButton(i))
			{
				UICamera.currentKey = 323 + i;
				flag = true;
			}
		}
		if (UICamera.currentScheme == UICamera.ControlScheme.Touch)
		{
			return;
		}
		UICamera.currentTouch = UICamera.mMouse[0];
		Vector2 vector = Input.mousePosition;
		if (UICamera.currentTouch.ignoreDelta == 0)
		{
			UICamera.currentTouch.delta = vector - UICamera.currentTouch.pos;
		}
		else
		{
			UICamera.currentTouch.ignoreDelta--;
			UICamera.currentTouch.delta.x = 0f;
			UICamera.currentTouch.delta.y = 0f;
		}
		float sqrMagnitude = UICamera.currentTouch.delta.sqrMagnitude;
		UICamera.currentTouch.pos = vector;
		UICamera.mLastPos = vector;
		bool flag3 = false;
		if (UICamera.currentScheme != UICamera.ControlScheme.Mouse)
		{
			if (sqrMagnitude < 0.001f)
			{
				return;
			}
			UICamera.currentKey = 323;
			flag3 = true;
		}
		else if (sqrMagnitude > 0.001f)
		{
			flag3 = true;
		}
		for (int j = 1; j < 3; j++)
		{
			UICamera.mMouse[j].pos = UICamera.currentTouch.pos;
			UICamera.mMouse[j].delta = UICamera.currentTouch.delta;
		}
		if (flag || flag3 || this.mNextRaycast < RealTime.time)
		{
			this.mNextRaycast = RealTime.time + 0.02f;
			UICamera.Raycast(UICamera.currentTouch);
			for (int k = 0; k < 3; k++)
			{
				UICamera.mMouse[k].current = UICamera.currentTouch.current;
			}
		}
		bool flag4 = UICamera.currentTouch.last != UICamera.currentTouch.current;
		bool flag5 = UICamera.currentTouch.pressed != null;
		if (!flag5)
		{
			UICamera.hoveredObject = UICamera.currentTouch.current;
		}
		UICamera.currentTouchID = -1;
		if (flag4)
		{
			UICamera.currentKey = 323;
		}
		if (!flag && flag3 && (!this.stickyTooltip || flag4))
		{
			if (UICamera.mTooltipTime != 0f)
			{
				UICamera.mTooltipTime = Time.unscaledTime + this.tooltipDelay;
			}
			else if (UICamera.mTooltip != null)
			{
				UICamera.ShowTooltip(null);
			}
		}
		if (flag3 && UICamera.onMouseMove != null)
		{
			UICamera.onMouseMove(UICamera.currentTouch.delta);
			UICamera.currentTouch = null;
		}
		if (flag4 && (flag2 || (flag5 && !flag)))
		{
			UICamera.hoveredObject = null;
		}
		for (int l = 0; l < 3; l++)
		{
			bool mouseButtonDown = Input.GetMouseButtonDown(l);
			bool mouseButtonUp = Input.GetMouseButtonUp(l);
			if (mouseButtonDown || mouseButtonUp)
			{
				UICamera.currentKey = 323 + l;
			}
			UICamera.currentTouch = UICamera.mMouse[l];
			UICamera.currentTouchID = -1 - l;
			UICamera.currentKey = 323 + l;
			if (mouseButtonDown)
			{
				UICamera.currentTouch.pressedCam = UICamera.currentCamera;
				UICamera.currentTouch.pressTime = RealTime.time;
			}
			else if (UICamera.currentTouch.pressed != null)
			{
				UICamera.currentCamera = UICamera.currentTouch.pressedCam;
			}
			this.ProcessTouch(mouseButtonDown, mouseButtonUp);
		}
		if (!flag && flag4)
		{
			UICamera.currentTouch = UICamera.mMouse[0];
			UICamera.mTooltipTime = Time.unscaledTime + this.tooltipDelay;
			UICamera.currentTouchID = -1;
			UICamera.currentKey = 323;
			UICamera.hoveredObject = UICamera.currentTouch.current;
		}
		UICamera.currentTouch = null;
		UICamera.mMouse[0].last = UICamera.mMouse[0].current;
		for (int m = 1; m < 3; m++)
		{
			UICamera.mMouse[m].last = UICamera.mMouse[0].last;
		}
	}

	// Token: 0x060008B4 RID: 2228 RVA: 0x0003F810 File Offset: 0x0003DA10
	public void ProcessTouches()
	{
		int num = (UICamera.GetInputTouchCount != null) ? UICamera.GetInputTouchCount() : Input.touchCount;
		for (int i = 0; i < num; i++)
		{
			TouchPhase phase;
			int fingerId;
			Vector2 position;
			int tapCount;
			if (UICamera.GetInputTouch == null)
			{
				UnityEngine.Touch touch = Input.GetTouch(i);
				phase = touch.phase;
				fingerId = touch.fingerId;
				position = touch.position;
				tapCount = touch.tapCount;
			}
			else
			{
				UICamera.Touch touch2 = UICamera.GetInputTouch(i);
				phase = touch2.phase;
				fingerId = touch2.fingerId;
				position = touch2.position;
				tapCount = touch2.tapCount;
			}
			UICamera.currentTouchID = ((!this.allowMultiTouch) ? 1 : fingerId);
			UICamera.currentTouch = UICamera.GetTouch(UICamera.currentTouchID, true);
			bool flag = phase == null || UICamera.currentTouch.touchBegan;
			bool flag2 = phase == 4 || phase == 3;
			UICamera.currentTouch.delta = position - UICamera.currentTouch.pos;
			UICamera.currentTouch.pos = position;
			UICamera.currentKey = 0;
			UICamera.Raycast(UICamera.currentTouch);
			if (flag)
			{
				UICamera.currentTouch.pressedCam = UICamera.currentCamera;
			}
			else if (UICamera.currentTouch.pressed != null)
			{
				UICamera.currentCamera = UICamera.currentTouch.pressedCam;
			}
			if (tapCount > 1)
			{
				UICamera.currentTouch.clickTime = RealTime.time;
			}
			this.ProcessTouch(flag, flag2);
			if (flag2)
			{
				UICamera.RemoveTouch(UICamera.currentTouchID);
			}
			UICamera.currentTouch.touchBegan = false;
			UICamera.currentTouch.last = null;
			UICamera.currentTouch = null;
			if (!this.allowMultiTouch)
			{
				break;
			}
		}
		if (num == 0)
		{
			if (UICamera.mUsingTouchEvents)
			{
				UICamera.mUsingTouchEvents = false;
				return;
			}
			if (this.useMouse)
			{
				this.ProcessMouse();
			}
		}
		else
		{
			UICamera.mUsingTouchEvents = true;
		}
	}

	// Token: 0x060008B5 RID: 2229 RVA: 0x0003FA0C File Offset: 0x0003DC0C
	private void ProcessFakeTouches()
	{
		bool mouseButtonDown = Input.GetMouseButtonDown(0);
		bool mouseButtonUp = Input.GetMouseButtonUp(0);
		bool mouseButton = Input.GetMouseButton(0);
		if (mouseButtonDown || mouseButtonUp || mouseButton)
		{
			UICamera.currentTouchID = 1;
			UICamera.currentTouch = UICamera.mMouse[0];
			UICamera.currentTouch.touchBegan = mouseButtonDown;
			if (mouseButtonDown)
			{
				UICamera.currentTouch.pressTime = RealTime.time;
				UICamera.activeTouches.Add(UICamera.currentTouch);
			}
			Vector2 vector = Input.mousePosition;
			UICamera.currentTouch.delta = vector - UICamera.currentTouch.pos;
			UICamera.currentTouch.pos = vector;
			UICamera.Raycast(UICamera.currentTouch);
			if (mouseButtonDown)
			{
				UICamera.currentTouch.pressedCam = UICamera.currentCamera;
			}
			else if (UICamera.currentTouch.pressed != null)
			{
				UICamera.currentCamera = UICamera.currentTouch.pressedCam;
			}
			UICamera.currentKey = 0;
			this.ProcessTouch(mouseButtonDown, mouseButtonUp);
			if (mouseButtonUp)
			{
				UICamera.activeTouches.Remove(UICamera.currentTouch);
			}
			UICamera.currentTouch.last = null;
			UICamera.currentTouch = null;
		}
	}

	// Token: 0x060008B6 RID: 2230 RVA: 0x0003FB30 File Offset: 0x0003DD30
	public void ProcessOthers()
	{
		UICamera.currentTouchID = -100;
		UICamera.currentTouch = UICamera.controller;
		bool flag = false;
		bool flag2 = false;
		if (this.submitKey0 != null && UICamera.GetKeyDown(this.submitKey0))
		{
			UICamera.currentKey = this.submitKey0;
			flag = true;
		}
		else if (this.submitKey1 != null && UICamera.GetKeyDown(this.submitKey1))
		{
			UICamera.currentKey = this.submitKey1;
			flag = true;
		}
		else if ((this.submitKey0 == 13 || this.submitKey1 == 13) && UICamera.GetKeyDown(271))
		{
			UICamera.currentKey = this.submitKey0;
			flag = true;
		}
		if (this.submitKey0 != null && UICamera.GetKeyUp(this.submitKey0))
		{
			UICamera.currentKey = this.submitKey0;
			flag2 = true;
		}
		else if (this.submitKey1 != null && UICamera.GetKeyUp(this.submitKey1))
		{
			UICamera.currentKey = this.submitKey1;
			flag2 = true;
		}
		else if ((this.submitKey0 == 13 || this.submitKey1 == 13) && UICamera.GetKeyUp(271))
		{
			UICamera.currentKey = this.submitKey0;
			flag2 = true;
		}
		if (flag)
		{
			UICamera.currentTouch.pressTime = RealTime.time;
		}
		if ((flag || flag2) && UICamera.currentScheme == UICamera.ControlScheme.Controller)
		{
			UICamera.currentTouch.current = UICamera.controllerNavigationObject;
			this.ProcessTouch(flag, flag2);
			UICamera.currentTouch.last = UICamera.currentTouch.current;
		}
		KeyCode keyCode = 0;
		if (this.useController && !UICamera.ignoreControllerInput)
		{
			if (!UICamera.disableController && UICamera.currentScheme == UICamera.ControlScheme.Controller && (UICamera.currentTouch.current == null || !UICamera.currentTouch.current.activeInHierarchy))
			{
				UICamera.currentTouch.current = UICamera.controllerNavigationObject;
			}
			if (!string.IsNullOrEmpty(this.verticalAxisName))
			{
				int direction = UICamera.GetDirection(this.verticalAxisName);
				if (direction != 0)
				{
					UICamera.ShowTooltip(null);
					UICamera.currentScheme = UICamera.ControlScheme.Controller;
					UICamera.currentTouch.current = UICamera.controllerNavigationObject;
					if (UICamera.currentTouch.current != null)
					{
						keyCode = ((direction <= 0) ? 274 : 273);
						if (UICamera.onNavigate != null)
						{
							UICamera.onNavigate(UICamera.currentTouch.current, keyCode);
						}
						UICamera.Notify(UICamera.currentTouch.current, "OnNavigate", keyCode);
					}
				}
			}
			if (!string.IsNullOrEmpty(this.horizontalAxisName))
			{
				int direction2 = UICamera.GetDirection(this.horizontalAxisName);
				if (direction2 != 0)
				{
					UICamera.ShowTooltip(null);
					UICamera.currentScheme = UICamera.ControlScheme.Controller;
					UICamera.currentTouch.current = UICamera.controllerNavigationObject;
					if (UICamera.currentTouch.current != null)
					{
						keyCode = ((direction2 <= 0) ? 276 : 275);
						if (UICamera.onNavigate != null)
						{
							UICamera.onNavigate(UICamera.currentTouch.current, keyCode);
						}
						UICamera.Notify(UICamera.currentTouch.current, "OnNavigate", keyCode);
					}
				}
			}
			float num = string.IsNullOrEmpty(this.horizontalPanAxisName) ? 0f : UICamera.GetAxis(this.horizontalPanAxisName);
			float num2 = string.IsNullOrEmpty(this.verticalPanAxisName) ? 0f : UICamera.GetAxis(this.verticalPanAxisName);
			if (num != 0f || num2 != 0f)
			{
				UICamera.ShowTooltip(null);
				UICamera.currentScheme = UICamera.ControlScheme.Controller;
				UICamera.currentTouch.current = UICamera.controllerNavigationObject;
				if (UICamera.currentTouch.current != null)
				{
					Vector2 vector;
					vector..ctor(num, num2);
					vector *= Time.unscaledDeltaTime;
					if (UICamera.onPan != null)
					{
						UICamera.onPan(UICamera.currentTouch.current, vector);
					}
					UICamera.Notify(UICamera.currentTouch.current, "OnPan", vector);
				}
			}
		}
		if ((UICamera.GetAnyKeyDown == null) ? Input.anyKeyDown : UICamera.GetAnyKeyDown())
		{
			int i = 0;
			int num3 = NGUITools.keys.Length;
			while (i < num3)
			{
				KeyCode keyCode2 = NGUITools.keys[i];
				if (keyCode != keyCode2)
				{
					if (UICamera.GetKeyDown(keyCode2))
					{
						if (this.useKeyboard || keyCode2 >= 323)
						{
							if ((this.useController && !UICamera.ignoreControllerInput) || keyCode2 < 330)
							{
								if (this.useMouse || (keyCode2 < 323 && keyCode2 > 329))
								{
									UICamera.currentKey = keyCode2;
									if (UICamera.onKey != null)
									{
										UICamera.onKey(UICamera.currentTouch.current, keyCode2);
									}
									UICamera.Notify(UICamera.currentTouch.current, "OnKey", keyCode2);
								}
							}
						}
					}
				}
				i++;
			}
		}
		UICamera.currentTouch = null;
	}

	// Token: 0x060008B7 RID: 2231 RVA: 0x000400AC File Offset: 0x0003E2AC
	private void ProcessPress(bool pressed, float click, float drag)
	{
		if (pressed)
		{
			if (UICamera.mTooltip != null)
			{
				UICamera.ShowTooltip(null);
			}
			UICamera.mTooltipTime = Time.unscaledTime + this.tooltipDelay;
			UICamera.currentTouch.pressStarted = true;
			if (UICamera.onPress != null && UICamera.currentTouch.pressed)
			{
				UICamera.onPress(UICamera.currentTouch.pressed, false);
			}
			UICamera.Notify(UICamera.currentTouch.pressed, "OnPress", false);
			if (UICamera.currentScheme == UICamera.ControlScheme.Mouse && UICamera.hoveredObject == null && UICamera.currentTouch.current != null)
			{
				UICamera.hoveredObject = UICamera.currentTouch.current;
			}
			UICamera.currentTouch.pressed = UICamera.currentTouch.current;
			UICamera.currentTouch.dragged = UICamera.currentTouch.current;
			UICamera.currentTouch.clickNotification = UICamera.ClickNotification.BasedOnDelta;
			UICamera.currentTouch.totalDelta = Vector2.zero;
			UICamera.currentTouch.dragStarted = false;
			if (UICamera.onPress != null && UICamera.currentTouch.pressed)
			{
				UICamera.onPress(UICamera.currentTouch.pressed, true);
			}
			UICamera.Notify(UICamera.currentTouch.pressed, "OnPress", true);
			if (UICamera.mSelected != UICamera.currentTouch.pressed)
			{
				UICamera.mInputFocus = false;
				if (UICamera.mSelected)
				{
					UICamera.Notify(UICamera.mSelected, "OnSelect", false);
					if (UICamera.onSelect != null)
					{
						UICamera.onSelect(UICamera.mSelected, false);
					}
				}
				UICamera.mSelected = UICamera.currentTouch.pressed;
				if (UICamera.currentTouch.pressed != null)
				{
					UIKeyNavigation component = UICamera.currentTouch.pressed.GetComponent<UIKeyNavigation>();
					if (component != null)
					{
						UICamera.controller.current = UICamera.currentTouch.pressed;
					}
				}
				if (UICamera.mSelected)
				{
					UICamera.mInputFocus = (UICamera.mSelected.activeInHierarchy && UICamera.mSelected.GetComponent<UIInput>() != null);
					if (UICamera.onSelect != null)
					{
						UICamera.onSelect(UICamera.mSelected, true);
					}
					UICamera.Notify(UICamera.mSelected, "OnSelect", true);
				}
			}
		}
		else if (UICamera.currentTouch.pressed != null && (UICamera.currentTouch.delta.sqrMagnitude != 0f || UICamera.currentTouch.current != UICamera.currentTouch.last))
		{
			UICamera.currentTouch.totalDelta += UICamera.currentTouch.delta;
			float sqrMagnitude = UICamera.currentTouch.totalDelta.sqrMagnitude;
			bool flag = false;
			if (!UICamera.currentTouch.dragStarted && UICamera.currentTouch.last != UICamera.currentTouch.current)
			{
				UICamera.currentTouch.dragStarted = true;
				UICamera.currentTouch.delta = UICamera.currentTouch.totalDelta;
				UICamera.isDragging = true;
				if (UICamera.onDragStart != null)
				{
					UICamera.onDragStart(UICamera.currentTouch.dragged);
				}
				UICamera.Notify(UICamera.currentTouch.dragged, "OnDragStart", null);
				if (UICamera.onDragOver != null)
				{
					UICamera.onDragOver(UICamera.currentTouch.last, UICamera.currentTouch.dragged);
				}
				UICamera.Notify(UICamera.currentTouch.last, "OnDragOver", UICamera.currentTouch.dragged);
				UICamera.isDragging = false;
			}
			else if (!UICamera.currentTouch.dragStarted && drag < sqrMagnitude)
			{
				flag = true;
				UICamera.currentTouch.dragStarted = true;
				UICamera.currentTouch.delta = UICamera.currentTouch.totalDelta;
			}
			if (UICamera.currentTouch.dragStarted)
			{
				if (UICamera.mTooltip != null)
				{
					UICamera.ShowTooltip(null);
				}
				UICamera.isDragging = true;
				bool flag2 = UICamera.currentTouch.clickNotification == UICamera.ClickNotification.None;
				if (flag)
				{
					if (UICamera.onDragStart != null)
					{
						UICamera.onDragStart(UICamera.currentTouch.dragged);
					}
					UICamera.Notify(UICamera.currentTouch.dragged, "OnDragStart", null);
					if (UICamera.onDragOver != null)
					{
						UICamera.onDragOver(UICamera.currentTouch.last, UICamera.currentTouch.dragged);
					}
					UICamera.Notify(UICamera.currentTouch.current, "OnDragOver", UICamera.currentTouch.dragged);
				}
				else if (UICamera.currentTouch.last != UICamera.currentTouch.current)
				{
					if (UICamera.onDragOut != null)
					{
						UICamera.onDragOut(UICamera.currentTouch.last, UICamera.currentTouch.dragged);
					}
					UICamera.Notify(UICamera.currentTouch.last, "OnDragOut", UICamera.currentTouch.dragged);
					if (UICamera.onDragOver != null)
					{
						UICamera.onDragOver(UICamera.currentTouch.last, UICamera.currentTouch.dragged);
					}
					UICamera.Notify(UICamera.currentTouch.current, "OnDragOver", UICamera.currentTouch.dragged);
				}
				if (UICamera.onDrag != null)
				{
					UICamera.onDrag(UICamera.currentTouch.dragged, UICamera.currentTouch.delta);
				}
				UICamera.Notify(UICamera.currentTouch.dragged, "OnDrag", UICamera.currentTouch.delta);
				UICamera.currentTouch.last = UICamera.currentTouch.current;
				UICamera.isDragging = false;
				if (flag2)
				{
					UICamera.currentTouch.clickNotification = UICamera.ClickNotification.None;
				}
				else if (UICamera.currentTouch.clickNotification == UICamera.ClickNotification.BasedOnDelta && click < sqrMagnitude)
				{
					UICamera.currentTouch.clickNotification = UICamera.ClickNotification.None;
				}
			}
		}
	}

	// Token: 0x060008B8 RID: 2232 RVA: 0x000406C4 File Offset: 0x0003E8C4
	private void ProcessRelease(bool isMouse, float drag)
	{
		if (UICamera.currentTouch == null)
		{
			return;
		}
		UICamera.currentTouch.pressStarted = false;
		if (UICamera.currentTouch.pressed != null)
		{
			if (UICamera.currentTouch.dragStarted)
			{
				if (UICamera.onDragOut != null)
				{
					UICamera.onDragOut(UICamera.currentTouch.last, UICamera.currentTouch.dragged);
				}
				UICamera.Notify(UICamera.currentTouch.last, "OnDragOut", UICamera.currentTouch.dragged);
				if (UICamera.onDragEnd != null)
				{
					UICamera.onDragEnd(UICamera.currentTouch.dragged);
				}
				UICamera.Notify(UICamera.currentTouch.dragged, "OnDragEnd", null);
			}
			if (UICamera.onPress != null)
			{
				UICamera.onPress(UICamera.currentTouch.pressed, false);
			}
			UICamera.Notify(UICamera.currentTouch.pressed, "OnPress", false);
			if (isMouse && this.HasCollider(UICamera.currentTouch.pressed))
			{
				if (UICamera.mHover == UICamera.currentTouch.current)
				{
					if (UICamera.onHover != null)
					{
						UICamera.onHover(UICamera.currentTouch.current, true);
					}
					UICamera.Notify(UICamera.currentTouch.current, "OnHover", true);
				}
				else
				{
					UICamera.hoveredObject = UICamera.currentTouch.current;
				}
			}
			if (UICamera.currentTouch.dragged == UICamera.currentTouch.current || (UICamera.currentScheme != UICamera.ControlScheme.Controller && UICamera.currentTouch.clickNotification != UICamera.ClickNotification.None && UICamera.currentTouch.totalDelta.sqrMagnitude < drag))
			{
				if (UICamera.currentTouch.clickNotification != UICamera.ClickNotification.None && UICamera.currentTouch.pressed == UICamera.currentTouch.current)
				{
					UICamera.ShowTooltip(null);
					float time = RealTime.time;
					if (UICamera.onClick != null)
					{
						UICamera.onClick(UICamera.currentTouch.pressed);
					}
					UICamera.Notify(UICamera.currentTouch.pressed, "OnClick", null);
					if (UICamera.currentTouch.clickTime + 0.35f > time)
					{
						if (UICamera.onDoubleClick != null)
						{
							UICamera.onDoubleClick(UICamera.currentTouch.pressed);
						}
						UICamera.Notify(UICamera.currentTouch.pressed, "OnDoubleClick", null);
					}
					UICamera.currentTouch.clickTime = time;
				}
			}
			else if (UICamera.currentTouch.dragStarted)
			{
				if (UICamera.onDrop != null)
				{
					UICamera.onDrop(UICamera.currentTouch.current, UICamera.currentTouch.dragged);
				}
				UICamera.Notify(UICamera.currentTouch.current, "OnDrop", UICamera.currentTouch.dragged);
			}
		}
		UICamera.currentTouch.dragStarted = false;
		UICamera.currentTouch.pressed = null;
		UICamera.currentTouch.dragged = null;
	}

	// Token: 0x060008B9 RID: 2233 RVA: 0x000409C8 File Offset: 0x0003EBC8
	private bool HasCollider(GameObject go)
	{
		if (go == null)
		{
			return false;
		}
		Collider component = go.GetComponent<Collider>();
		if (component != null)
		{
			return component.enabled;
		}
		Collider2D component2 = go.GetComponent<Collider2D>();
		return component2 != null && component2.enabled;
	}

	// Token: 0x060008BA RID: 2234 RVA: 0x00040A1C File Offset: 0x0003EC1C
	public void ProcessTouch(bool pressed, bool released)
	{
		if (released)
		{
			UICamera.mTooltipTime = 0f;
		}
		bool flag = UICamera.currentScheme == UICamera.ControlScheme.Mouse;
		float num = (!flag) ? this.touchDragThreshold : this.mouseDragThreshold;
		float num2 = (!flag) ? this.touchClickThreshold : this.mouseClickThreshold;
		num *= num;
		num2 *= num2;
		if (UICamera.currentTouch.pressed != null)
		{
			if (released)
			{
				this.ProcessRelease(flag, num);
			}
			this.ProcessPress(pressed, num2, num);
			if (UICamera.currentTouch.deltaTime > this.tooltipDelay && UICamera.currentTouch.pressed == UICamera.currentTouch.current && UICamera.mTooltipTime != 0f && !UICamera.currentTouch.dragStarted)
			{
				UICamera.mTooltipTime = 0f;
				UICamera.currentTouch.clickNotification = UICamera.ClickNotification.None;
				if (this.longPressTooltip)
				{
					UICamera.ShowTooltip(UICamera.currentTouch.pressed);
				}
				UICamera.Notify(UICamera.currentTouch.current, "OnLongPress", null);
			}
		}
		else if (flag || pressed || released)
		{
			this.ProcessPress(pressed, num2, num);
			if (released)
			{
				this.ProcessRelease(flag, num);
			}
		}
	}

	// Token: 0x060008BB RID: 2235 RVA: 0x00040B6C File Offset: 0x0003ED6C
	public static void CancelNextTooltip()
	{
		UICamera.mTooltipTime = 0f;
	}

	// Token: 0x060008BC RID: 2236 RVA: 0x00040B78 File Offset: 0x0003ED78
	public static bool ShowTooltip(GameObject go)
	{
		if (UICamera.mTooltip != go)
		{
			if (UICamera.mTooltip != null)
			{
				if (UICamera.onTooltip != null)
				{
					UICamera.onTooltip(UICamera.mTooltip, false);
				}
				UICamera.Notify(UICamera.mTooltip, "OnTooltip", false);
			}
			UICamera.mTooltip = go;
			UICamera.mTooltipTime = 0f;
			if (UICamera.mTooltip != null)
			{
				if (UICamera.onTooltip != null)
				{
					UICamera.onTooltip(UICamera.mTooltip, true);
				}
				UICamera.Notify(UICamera.mTooltip, "OnTooltip", true);
			}
			return true;
		}
		return false;
	}

	// Token: 0x060008BD RID: 2237 RVA: 0x00040C28 File Offset: 0x0003EE28
	public static bool HideTooltip()
	{
		return UICamera.ShowTooltip(null);
	}

	// Token: 0x040007CB RID: 1995
	public static BetterList<UICamera> list = new BetterList<UICamera>();

	// Token: 0x040007CC RID: 1996
	public static UICamera.GetKeyStateFunc GetKeyDown = (KeyCode key) => (key < 330 || !UICamera.ignoreControllerInput) && Input.GetKeyDown(key);

	// Token: 0x040007CD RID: 1997
	public static UICamera.GetKeyStateFunc GetKeyUp = (KeyCode key) => (key < 330 || !UICamera.ignoreControllerInput) && Input.GetKeyUp(key);

	// Token: 0x040007CE RID: 1998
	public static UICamera.GetKeyStateFunc GetKey = (KeyCode key) => (key < 330 || !UICamera.ignoreControllerInput) && Input.GetKey(key);

	// Token: 0x040007CF RID: 1999
	public static UICamera.GetAxisFunc GetAxis = delegate(string axis)
	{
		if (UICamera.ignoreControllerInput)
		{
			return 0f;
		}
		return Input.GetAxis(axis);
	};

	// Token: 0x040007D0 RID: 2000
	public static UICamera.GetAnyKeyFunc GetAnyKeyDown;

	// Token: 0x040007D1 RID: 2001
	public static UICamera.OnScreenResize onScreenResize;

	// Token: 0x040007D2 RID: 2002
	public UICamera.EventType eventType = UICamera.EventType.UI_3D;

	// Token: 0x040007D3 RID: 2003
	public bool eventsGoToColliders;

	// Token: 0x040007D4 RID: 2004
	public LayerMask eventReceiverMask = -1;

	// Token: 0x040007D5 RID: 2005
	public UICamera.ProcessEventsIn processEventsIn;

	// Token: 0x040007D6 RID: 2006
	public bool debug;

	// Token: 0x040007D7 RID: 2007
	public bool useMouse = true;

	// Token: 0x040007D8 RID: 2008
	public bool useTouch = true;

	// Token: 0x040007D9 RID: 2009
	public bool allowMultiTouch = true;

	// Token: 0x040007DA RID: 2010
	public bool useKeyboard = true;

	// Token: 0x040007DB RID: 2011
	public bool useController = true;

	// Token: 0x040007DC RID: 2012
	public bool stickyTooltip = true;

	// Token: 0x040007DD RID: 2013
	public float tooltipDelay = 1f;

	// Token: 0x040007DE RID: 2014
	public bool longPressTooltip;

	// Token: 0x040007DF RID: 2015
	public float mouseDragThreshold = 4f;

	// Token: 0x040007E0 RID: 2016
	public float mouseClickThreshold = 10f;

	// Token: 0x040007E1 RID: 2017
	public float touchDragThreshold = 40f;

	// Token: 0x040007E2 RID: 2018
	public float touchClickThreshold = 40f;

	// Token: 0x040007E3 RID: 2019
	public float rangeDistance = -1f;

	// Token: 0x040007E4 RID: 2020
	public string horizontalAxisName = "Horizontal";

	// Token: 0x040007E5 RID: 2021
	public string verticalAxisName = "Vertical";

	// Token: 0x040007E6 RID: 2022
	public string horizontalPanAxisName;

	// Token: 0x040007E7 RID: 2023
	public string verticalPanAxisName;

	// Token: 0x040007E8 RID: 2024
	public string scrollAxisName = "Mouse ScrollWheel";

	// Token: 0x040007E9 RID: 2025
	public bool commandClick = true;

	// Token: 0x040007EA RID: 2026
	public KeyCode submitKey0 = 13;

	// Token: 0x040007EB RID: 2027
	public KeyCode submitKey1 = 330;

	// Token: 0x040007EC RID: 2028
	public KeyCode cancelKey0 = 27;

	// Token: 0x040007ED RID: 2029
	public KeyCode cancelKey1 = 331;

	// Token: 0x040007EE RID: 2030
	public bool autoHideCursor = true;

	// Token: 0x040007EF RID: 2031
	public static UICamera.OnCustomInput onCustomInput;

	// Token: 0x040007F0 RID: 2032
	public static bool showTooltips = true;

	// Token: 0x040007F1 RID: 2033
	public static bool ignoreControllerInput = false;

	// Token: 0x040007F2 RID: 2034
	private static bool mDisableController = false;

	// Token: 0x040007F3 RID: 2035
	private static Vector2 mLastPos = Vector2.zero;

	// Token: 0x040007F4 RID: 2036
	public static Vector3 lastWorldPosition = Vector3.zero;

	// Token: 0x040007F5 RID: 2037
	public static RaycastHit lastHit;

	// Token: 0x040007F6 RID: 2038
	public static UICamera current = null;

	// Token: 0x040007F7 RID: 2039
	public static Camera currentCamera = null;

	// Token: 0x040007F8 RID: 2040
	public static UICamera.OnSchemeChange onSchemeChange;

	// Token: 0x040007F9 RID: 2041
	private static UICamera.ControlScheme mLastScheme = UICamera.ControlScheme.Mouse;

	// Token: 0x040007FA RID: 2042
	public static int currentTouchID = -100;

	// Token: 0x040007FB RID: 2043
	private static KeyCode mCurrentKey = 48;

	// Token: 0x040007FC RID: 2044
	public static UICamera.MouseOrTouch currentTouch = null;

	// Token: 0x040007FD RID: 2045
	private static bool mInputFocus = false;

	// Token: 0x040007FE RID: 2046
	private static GameObject mGenericHandler;

	// Token: 0x040007FF RID: 2047
	public static GameObject fallThrough;

	// Token: 0x04000800 RID: 2048
	public static UICamera.VoidDelegate onClick;

	// Token: 0x04000801 RID: 2049
	public static UICamera.VoidDelegate onDoubleClick;

	// Token: 0x04000802 RID: 2050
	public static UICamera.BoolDelegate onHover;

	// Token: 0x04000803 RID: 2051
	public static UICamera.BoolDelegate onPress;

	// Token: 0x04000804 RID: 2052
	public static UICamera.BoolDelegate onSelect;

	// Token: 0x04000805 RID: 2053
	public static UICamera.FloatDelegate onScroll;

	// Token: 0x04000806 RID: 2054
	public static UICamera.VectorDelegate onDrag;

	// Token: 0x04000807 RID: 2055
	public static UICamera.VoidDelegate onDragStart;

	// Token: 0x04000808 RID: 2056
	public static UICamera.ObjectDelegate onDragOver;

	// Token: 0x04000809 RID: 2057
	public static UICamera.ObjectDelegate onDragOut;

	// Token: 0x0400080A RID: 2058
	public static UICamera.VoidDelegate onDragEnd;

	// Token: 0x0400080B RID: 2059
	public static UICamera.ObjectDelegate onDrop;

	// Token: 0x0400080C RID: 2060
	public static UICamera.KeyCodeDelegate onKey;

	// Token: 0x0400080D RID: 2061
	public static UICamera.KeyCodeDelegate onNavigate;

	// Token: 0x0400080E RID: 2062
	public static UICamera.VectorDelegate onPan;

	// Token: 0x0400080F RID: 2063
	public static UICamera.BoolDelegate onTooltip;

	// Token: 0x04000810 RID: 2064
	public static UICamera.MoveDelegate onMouseMove;

	// Token: 0x04000811 RID: 2065
	private static UICamera.MouseOrTouch[] mMouse = new UICamera.MouseOrTouch[]
	{
		new UICamera.MouseOrTouch(),
		new UICamera.MouseOrTouch(),
		new UICamera.MouseOrTouch()
	};

	// Token: 0x04000812 RID: 2066
	public static UICamera.MouseOrTouch controller = new UICamera.MouseOrTouch();

	// Token: 0x04000813 RID: 2067
	public static List<UICamera.MouseOrTouch> activeTouches = new List<UICamera.MouseOrTouch>();

	// Token: 0x04000814 RID: 2068
	private static List<int> mTouchIDs = new List<int>();

	// Token: 0x04000815 RID: 2069
	private static int mWidth = 0;

	// Token: 0x04000816 RID: 2070
	private static int mHeight = 0;

	// Token: 0x04000817 RID: 2071
	private static GameObject mTooltip = null;

	// Token: 0x04000818 RID: 2072
	private Camera mCam;

	// Token: 0x04000819 RID: 2073
	private static float mTooltipTime = 0f;

	// Token: 0x0400081A RID: 2074
	private float mNextRaycast;

	// Token: 0x0400081B RID: 2075
	public static bool isDragging = false;

	// Token: 0x0400081C RID: 2076
	private static GameObject mRayHitObject;

	// Token: 0x0400081D RID: 2077
	private static GameObject mHover;

	// Token: 0x0400081E RID: 2078
	private static GameObject mSelected;

	// Token: 0x0400081F RID: 2079
	private static UICamera.DepthEntry mHit = default(UICamera.DepthEntry);

	// Token: 0x04000820 RID: 2080
	private static BetterList<UICamera.DepthEntry> mHits = new BetterList<UICamera.DepthEntry>();

	// Token: 0x04000821 RID: 2081
	private static Plane m2DPlane = new Plane(Vector3.back, 0f);

	// Token: 0x04000822 RID: 2082
	private static float mNextEvent = 0f;

	// Token: 0x04000823 RID: 2083
	private static int mNotifying = 0;

	// Token: 0x04000824 RID: 2084
	private static bool mUsingTouchEvents = true;

	// Token: 0x04000825 RID: 2085
	public static UICamera.GetTouchCountCallback GetInputTouchCount;

	// Token: 0x04000826 RID: 2086
	public static UICamera.GetTouchCallback GetInputTouch;

	// Token: 0x02000115 RID: 277
	public enum ControlScheme
	{
		// Token: 0x0400082E RID: 2094
		Mouse,
		// Token: 0x0400082F RID: 2095
		Touch,
		// Token: 0x04000830 RID: 2096
		Controller
	}

	// Token: 0x02000116 RID: 278
	public enum ClickNotification
	{
		// Token: 0x04000832 RID: 2098
		None,
		// Token: 0x04000833 RID: 2099
		Always,
		// Token: 0x04000834 RID: 2100
		BasedOnDelta
	}

	// Token: 0x02000117 RID: 279
	public class MouseOrTouch
	{
		// Token: 0x17000113 RID: 275
		// (get) Token: 0x060008C5 RID: 2245 RVA: 0x00040CF0 File Offset: 0x0003EEF0
		public float deltaTime
		{
			get
			{
				return RealTime.time - this.pressTime;
			}
		}

		// Token: 0x17000114 RID: 276
		// (get) Token: 0x060008C6 RID: 2246 RVA: 0x00040D00 File Offset: 0x0003EF00
		public bool isOverUI
		{
			get
			{
				return this.current != null && this.current != UICamera.fallThrough && NGUITools.FindInParents<UIRoot>(this.current) != null;
			}
		}

		// Token: 0x04000835 RID: 2101
		public KeyCode key;

		// Token: 0x04000836 RID: 2102
		public Vector2 pos;

		// Token: 0x04000837 RID: 2103
		public Vector2 lastPos;

		// Token: 0x04000838 RID: 2104
		public Vector2 delta;

		// Token: 0x04000839 RID: 2105
		public Vector2 totalDelta;

		// Token: 0x0400083A RID: 2106
		public Camera pressedCam;

		// Token: 0x0400083B RID: 2107
		public GameObject last;

		// Token: 0x0400083C RID: 2108
		public GameObject current;

		// Token: 0x0400083D RID: 2109
		public GameObject pressed;

		// Token: 0x0400083E RID: 2110
		public GameObject dragged;

		// Token: 0x0400083F RID: 2111
		public float pressTime;

		// Token: 0x04000840 RID: 2112
		public float clickTime;

		// Token: 0x04000841 RID: 2113
		public UICamera.ClickNotification clickNotification = UICamera.ClickNotification.Always;

		// Token: 0x04000842 RID: 2114
		public bool touchBegan = true;

		// Token: 0x04000843 RID: 2115
		public bool pressStarted;

		// Token: 0x04000844 RID: 2116
		public bool dragStarted;

		// Token: 0x04000845 RID: 2117
		public int ignoreDelta;
	}

	// Token: 0x02000118 RID: 280
	public enum EventType
	{
		// Token: 0x04000847 RID: 2119
		World_3D,
		// Token: 0x04000848 RID: 2120
		UI_3D,
		// Token: 0x04000849 RID: 2121
		World_2D,
		// Token: 0x0400084A RID: 2122
		UI_2D
	}

	// Token: 0x02000119 RID: 281
	public enum ProcessEventsIn
	{
		// Token: 0x0400084C RID: 2124
		Update,
		// Token: 0x0400084D RID: 2125
		LateUpdate
	}

	// Token: 0x0200011A RID: 282
	private struct DepthEntry
	{
		// Token: 0x0400084E RID: 2126
		public int depth;

		// Token: 0x0400084F RID: 2127
		public RaycastHit hit;

		// Token: 0x04000850 RID: 2128
		public Vector3 point;

		// Token: 0x04000851 RID: 2129
		public GameObject go;
	}

	// Token: 0x0200011B RID: 283
	public class Touch
	{
		// Token: 0x04000852 RID: 2130
		public int fingerId;

		// Token: 0x04000853 RID: 2131
		public TouchPhase phase;

		// Token: 0x04000854 RID: 2132
		public Vector2 position;

		// Token: 0x04000855 RID: 2133
		public int tapCount;
	}

	// Token: 0x0200034E RID: 846
	// (Invoke) Token: 0x0600155A RID: 5466
	public delegate bool GetKeyStateFunc(KeyCode key);

	// Token: 0x0200034F RID: 847
	// (Invoke) Token: 0x0600155E RID: 5470
	public delegate float GetAxisFunc(string name);

	// Token: 0x02000350 RID: 848
	// (Invoke) Token: 0x06001562 RID: 5474
	public delegate bool GetAnyKeyFunc();

	// Token: 0x02000351 RID: 849
	// (Invoke) Token: 0x06001566 RID: 5478
	public delegate void OnScreenResize();

	// Token: 0x02000352 RID: 850
	// (Invoke) Token: 0x0600156A RID: 5482
	public delegate void OnCustomInput();

	// Token: 0x02000353 RID: 851
	// (Invoke) Token: 0x0600156E RID: 5486
	public delegate void OnSchemeChange();

	// Token: 0x02000354 RID: 852
	// (Invoke) Token: 0x06001572 RID: 5490
	public delegate void MoveDelegate(Vector2 delta);

	// Token: 0x02000355 RID: 853
	// (Invoke) Token: 0x06001576 RID: 5494
	public delegate void VoidDelegate(GameObject go);

	// Token: 0x02000356 RID: 854
	// (Invoke) Token: 0x0600157A RID: 5498
	public delegate void BoolDelegate(GameObject go, bool state);

	// Token: 0x02000357 RID: 855
	// (Invoke) Token: 0x0600157E RID: 5502
	public delegate void FloatDelegate(GameObject go, float delta);

	// Token: 0x02000358 RID: 856
	// (Invoke) Token: 0x06001582 RID: 5506
	public delegate void VectorDelegate(GameObject go, Vector2 delta);

	// Token: 0x02000359 RID: 857
	// (Invoke) Token: 0x06001586 RID: 5510
	public delegate void ObjectDelegate(GameObject go, GameObject obj);

	// Token: 0x0200035A RID: 858
	// (Invoke) Token: 0x0600158A RID: 5514
	public delegate void KeyCodeDelegate(GameObject go, KeyCode key);

	// Token: 0x0200035B RID: 859
	// (Invoke) Token: 0x0600158E RID: 5518
	public delegate int GetTouchCountCallback();

	// Token: 0x0200035C RID: 860
	// (Invoke) Token: 0x06001592 RID: 5522
	public delegate UICamera.Touch GetTouchCallback(int index);
}
