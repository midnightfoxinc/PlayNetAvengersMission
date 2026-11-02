using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using UnityEngine;

// Token: 0x020000E3 RID: 227
public static class NGUITools
{
	// Token: 0x1700007D RID: 125
	// (get) Token: 0x06000637 RID: 1591 RVA: 0x0002E18C File Offset: 0x0002C38C
	// (set) Token: 0x06000638 RID: 1592 RVA: 0x0002E1B8 File Offset: 0x0002C3B8
	public static float soundVolume
	{
		get
		{
			if (!NGUITools.mLoaded)
			{
				NGUITools.mLoaded = true;
				NGUITools.mGlobalVolume = PlayerPrefs.GetFloat("Sound", 1f);
			}
			return NGUITools.mGlobalVolume;
		}
		set
		{
			if (NGUITools.mGlobalVolume != value)
			{
				NGUITools.mLoaded = true;
				NGUITools.mGlobalVolume = value;
				PlayerPrefs.SetFloat("Sound", value);
			}
		}
	}

	// Token: 0x1700007E RID: 126
	// (get) Token: 0x06000639 RID: 1593 RVA: 0x0002E1E8 File Offset: 0x0002C3E8
	public static bool fileAccess
	{
		get
		{
			return Application.platform != 5 && Application.platform != 3;
		}
	}

	// Token: 0x0600063A RID: 1594 RVA: 0x0002E204 File Offset: 0x0002C404
	public static AudioSource PlaySound(AudioClip clip)
	{
		return NGUITools.PlaySound(clip, 1f, 1f);
	}

	// Token: 0x0600063B RID: 1595 RVA: 0x0002E218 File Offset: 0x0002C418
	public static AudioSource PlaySound(AudioClip clip, float volume)
	{
		return NGUITools.PlaySound(clip, volume, 1f);
	}

	// Token: 0x0600063C RID: 1596 RVA: 0x0002E228 File Offset: 0x0002C428
	public static AudioSource PlaySound(AudioClip clip, float volume, float pitch)
	{
		float time = RealTime.time;
		if (NGUITools.mLastClip == clip && NGUITools.mLastTimestamp + 0.1f > time)
		{
			return null;
		}
		NGUITools.mLastClip = clip;
		NGUITools.mLastTimestamp = time;
		volume *= NGUITools.soundVolume;
		if (clip != null && volume > 0.01f)
		{
			if (NGUITools.mListener == null || !NGUITools.GetActive(NGUITools.mListener))
			{
				AudioListener[] array = Object.FindObjectsOfType(typeof(AudioListener)) as AudioListener[];
				if (array != null)
				{
					for (int i = 0; i < array.Length; i++)
					{
						if (NGUITools.GetActive(array[i]))
						{
							NGUITools.mListener = array[i];
							break;
						}
					}
				}
				if (NGUITools.mListener == null)
				{
					Camera camera = Camera.main;
					if (camera == null)
					{
						camera = (Object.FindObjectOfType(typeof(Camera)) as Camera);
					}
					if (camera != null)
					{
						NGUITools.mListener = camera.gameObject.AddComponent<AudioListener>();
					}
				}
			}
			if (NGUITools.mListener != null && NGUITools.mListener.enabled && NGUITools.GetActive(NGUITools.mListener.gameObject))
			{
				AudioSource audioSource = NGUITools.mListener.GetComponent<AudioSource>();
				if (audioSource == null)
				{
					audioSource = NGUITools.mListener.gameObject.AddComponent<AudioSource>();
				}
				audioSource.priority = 50;
				audioSource.pitch = pitch;
				audioSource.PlayOneShot(clip, volume);
				return audioSource;
			}
		}
		return null;
	}

	// Token: 0x0600063D RID: 1597 RVA: 0x0002E3C0 File Offset: 0x0002C5C0
	public static int RandomRange(int min, int max)
	{
		if (min == max)
		{
			return min;
		}
		return Random.Range(min, max + 1);
	}

	// Token: 0x0600063E RID: 1598 RVA: 0x0002E3D4 File Offset: 0x0002C5D4
	public static string GetHierarchy(GameObject obj)
	{
		if (obj == null)
		{
			return string.Empty;
		}
		string text = obj.name;
		while (obj.transform.parent != null)
		{
			obj = obj.transform.parent.gameObject;
			text = obj.name + "\\" + text;
		}
		return text;
	}

	// Token: 0x0600063F RID: 1599 RVA: 0x0002E43C File Offset: 0x0002C63C
	public static T[] FindActive<T>() where T : Component
	{
		return Object.FindObjectsOfType(typeof(T)) as T[];
	}

	// Token: 0x06000640 RID: 1600 RVA: 0x0002E454 File Offset: 0x0002C654
	public static Camera FindCameraForLayer(int layer)
	{
		int num = 1 << layer;
		Camera camera;
		for (int i = 0; i < UICamera.list.size; i++)
		{
			camera = UICamera.list.buffer[i].cachedCamera;
			if (camera && (camera.cullingMask & num) != 0)
			{
				return camera;
			}
		}
		camera = Camera.main;
		if (camera && (camera.cullingMask & num) != 0)
		{
			return camera;
		}
		Camera[] array = new Camera[Camera.allCamerasCount];
		int allCameras = Camera.GetAllCameras(array);
		for (int j = 0; j < allCameras; j++)
		{
			camera = array[j];
			if (camera && camera.enabled && (camera.cullingMask & num) != 0)
			{
				return camera;
			}
		}
		return null;
	}

	// Token: 0x06000641 RID: 1601 RVA: 0x0002E524 File Offset: 0x0002C724
	public static void AddWidgetCollider(GameObject go)
	{
		NGUITools.AddWidgetCollider(go, false);
	}

	// Token: 0x06000642 RID: 1602 RVA: 0x0002E530 File Offset: 0x0002C730
	public static void AddWidgetCollider(GameObject go, bool considerInactive)
	{
		if (go != null)
		{
			Collider component = go.GetComponent<Collider>();
			BoxCollider boxCollider = component as BoxCollider;
			if (boxCollider != null)
			{
				NGUITools.UpdateWidgetCollider(boxCollider, considerInactive);
				return;
			}
			if (component != null)
			{
				return;
			}
			BoxCollider2D boxCollider2D = go.GetComponent<BoxCollider2D>();
			if (boxCollider2D != null)
			{
				NGUITools.UpdateWidgetCollider(boxCollider2D, considerInactive);
				return;
			}
			UICamera uicamera = UICamera.FindCameraForLayer(go.layer);
			if (uicamera != null && (uicamera.eventType == UICamera.EventType.World_2D || uicamera.eventType == UICamera.EventType.UI_2D))
			{
				boxCollider2D = go.AddComponent<BoxCollider2D>();
				boxCollider2D.isTrigger = true;
				UIWidget component2 = go.GetComponent<UIWidget>();
				if (component2 != null)
				{
					component2.autoResizeBoxCollider = true;
				}
				NGUITools.UpdateWidgetCollider(boxCollider2D, considerInactive);
				return;
			}
			boxCollider = go.AddComponent<BoxCollider>();
			boxCollider.isTrigger = true;
			UIWidget component3 = go.GetComponent<UIWidget>();
			if (component3 != null)
			{
				component3.autoResizeBoxCollider = true;
			}
			NGUITools.UpdateWidgetCollider(boxCollider, considerInactive);
		}
	}

	// Token: 0x06000643 RID: 1603 RVA: 0x0002E628 File Offset: 0x0002C828
	public static void UpdateWidgetCollider(GameObject go)
	{
		NGUITools.UpdateWidgetCollider(go, false);
	}

	// Token: 0x06000644 RID: 1604 RVA: 0x0002E634 File Offset: 0x0002C834
	public static void UpdateWidgetCollider(GameObject go, bool considerInactive)
	{
		if (go != null)
		{
			BoxCollider component = go.GetComponent<BoxCollider>();
			if (component != null)
			{
				NGUITools.UpdateWidgetCollider(component, considerInactive);
				return;
			}
			BoxCollider2D component2 = go.GetComponent<BoxCollider2D>();
			if (component2 != null)
			{
				NGUITools.UpdateWidgetCollider(component2, considerInactive);
			}
		}
	}

	// Token: 0x06000645 RID: 1605 RVA: 0x0002E684 File Offset: 0x0002C884
	public static void UpdateWidgetCollider(BoxCollider box, bool considerInactive)
	{
		if (box != null)
		{
			GameObject gameObject = box.gameObject;
			UIWidget component = gameObject.GetComponent<UIWidget>();
			if (component != null)
			{
				Vector4 drawRegion = component.drawRegion;
				if (drawRegion.x != 0f || drawRegion.y != 0f || drawRegion.z != 1f || drawRegion.w != 1f)
				{
					Vector4 drawingDimensions = component.drawingDimensions;
					box.center = new Vector3((drawingDimensions.x + drawingDimensions.z) * 0.5f, (drawingDimensions.y + drawingDimensions.w) * 0.5f);
					box.size = new Vector3(drawingDimensions.z - drawingDimensions.x, drawingDimensions.w - drawingDimensions.y);
				}
				else
				{
					Vector3[] localCorners = component.localCorners;
					box.center = Vector3.Lerp(localCorners[0], localCorners[2], 0.5f);
					box.size = localCorners[2] - localCorners[0];
				}
			}
			else
			{
				Bounds bounds = NGUIMath.CalculateRelativeWidgetBounds(gameObject.transform, considerInactive);
				box.center = bounds.center;
				box.size = new Vector3(bounds.size.x, bounds.size.y, 0f);
			}
		}
	}

	// Token: 0x06000646 RID: 1606 RVA: 0x0002E814 File Offset: 0x0002CA14
	public static void UpdateWidgetCollider(BoxCollider2D box, bool considerInactive)
	{
		if (box != null)
		{
			GameObject gameObject = box.gameObject;
			UIWidget component = gameObject.GetComponent<UIWidget>();
			if (component != null)
			{
				Vector3[] localCorners = component.localCorners;
				box.offset = Vector3.Lerp(localCorners[0], localCorners[2], 0.5f);
				box.size = localCorners[2] - localCorners[0];
			}
			else
			{
				Bounds bounds = NGUIMath.CalculateRelativeWidgetBounds(gameObject.transform, considerInactive);
				box.offset = bounds.center;
				box.size = new Vector2(bounds.size.x, bounds.size.y);
			}
		}
	}

	// Token: 0x06000647 RID: 1607 RVA: 0x0002E8F4 File Offset: 0x0002CAF4
	public static string GetTypeName<T>()
	{
		string text = typeof(T).ToString();
		if (text.StartsWith("UI"))
		{
			text = text.Substring(2);
		}
		else if (text.StartsWith("UnityEngine."))
		{
			text = text.Substring(12);
		}
		return text;
	}

	// Token: 0x06000648 RID: 1608 RVA: 0x0002E948 File Offset: 0x0002CB48
	public static string GetTypeName(Object obj)
	{
		if (obj == null)
		{
			return "Null";
		}
		string text = obj.GetType().ToString();
		if (text.StartsWith("UI"))
		{
			text = text.Substring(2);
		}
		else if (text.StartsWith("UnityEngine."))
		{
			text = text.Substring(12);
		}
		return text;
	}

	// Token: 0x06000649 RID: 1609 RVA: 0x0002E9AC File Offset: 0x0002CBAC
	public static void RegisterUndo(Object obj, string name)
	{
	}

	// Token: 0x0600064A RID: 1610 RVA: 0x0002E9B0 File Offset: 0x0002CBB0
	public static void SetDirty(Object obj)
	{
	}

	// Token: 0x0600064B RID: 1611 RVA: 0x0002E9B4 File Offset: 0x0002CBB4
	public static GameObject AddChild(this GameObject parent)
	{
		return parent.AddChild(true);
	}

	// Token: 0x0600064C RID: 1612 RVA: 0x0002E9C0 File Offset: 0x0002CBC0
	public static GameObject AddChild(this GameObject parent, bool undo)
	{
		GameObject gameObject = new GameObject();
		if (parent != null)
		{
			Transform transform = gameObject.transform;
			transform.parent = parent.transform;
			transform.localPosition = Vector3.zero;
			transform.localRotation = Quaternion.identity;
			transform.localScale = Vector3.one;
			gameObject.layer = parent.layer;
		}
		return gameObject;
	}

	// Token: 0x0600064D RID: 1613 RVA: 0x0002EA20 File Offset: 0x0002CC20
	public static GameObject AddChild(this GameObject parent, GameObject prefab)
	{
		GameObject gameObject = Object.Instantiate<GameObject>(prefab);
		if (gameObject != null && parent != null)
		{
			Transform transform = gameObject.transform;
			transform.parent = parent.transform;
			transform.localPosition = Vector3.zero;
			transform.localRotation = Quaternion.identity;
			transform.localScale = Vector3.one;
			gameObject.layer = parent.layer;
		}
		return gameObject;
	}

	// Token: 0x0600064E RID: 1614 RVA: 0x0002EA90 File Offset: 0x0002CC90
	public static int CalculateRaycastDepth(GameObject go)
	{
		UIWidget component = go.GetComponent<UIWidget>();
		if (component != null)
		{
			return component.raycastDepth;
		}
		UIWidget[] componentsInChildren = go.GetComponentsInChildren<UIWidget>();
		if (componentsInChildren.Length == 0)
		{
			return 0;
		}
		int num = int.MaxValue;
		int i = 0;
		int num2 = componentsInChildren.Length;
		while (i < num2)
		{
			if (componentsInChildren[i].enabled)
			{
				num = Mathf.Min(num, componentsInChildren[i].raycastDepth);
			}
			i++;
		}
		return num;
	}

	// Token: 0x0600064F RID: 1615 RVA: 0x0002EB04 File Offset: 0x0002CD04
	public static int CalculateNextDepth(GameObject go)
	{
		if (go)
		{
			int num = -1;
			UIWidget[] componentsInChildren = go.GetComponentsInChildren<UIWidget>();
			int i = 0;
			int num2 = componentsInChildren.Length;
			while (i < num2)
			{
				num = Mathf.Max(num, componentsInChildren[i].depth);
				i++;
			}
			return num + 1;
		}
		return 0;
	}

	// Token: 0x06000650 RID: 1616 RVA: 0x0002EB50 File Offset: 0x0002CD50
	public static int CalculateNextDepth(GameObject go, bool ignoreChildrenWithColliders)
	{
		if (go && ignoreChildrenWithColliders)
		{
			int num = -1;
			UIWidget[] componentsInChildren = go.GetComponentsInChildren<UIWidget>();
			int i = 0;
			int num2 = componentsInChildren.Length;
			while (i < num2)
			{
				UIWidget uiwidget = componentsInChildren[i];
				if (!(uiwidget.cachedGameObject != go) || (!(uiwidget.GetComponent<Collider>() != null) && !(uiwidget.GetComponent<Collider2D>() != null)))
				{
					num = Mathf.Max(num, uiwidget.depth);
				}
				i++;
			}
			return num + 1;
		}
		return NGUITools.CalculateNextDepth(go);
	}

	// Token: 0x06000651 RID: 1617 RVA: 0x0002EBE8 File Offset: 0x0002CDE8
	public static int AdjustDepth(GameObject go, int adjustment)
	{
		if (!(go != null))
		{
			return 0;
		}
		UIPanel uipanel = go.GetComponent<UIPanel>();
		if (uipanel != null)
		{
			foreach (UIPanel uipanel2 in go.GetComponentsInChildren<UIPanel>(true))
			{
				uipanel2.depth += adjustment;
			}
			return 1;
		}
		uipanel = NGUITools.FindInParents<UIPanel>(go);
		if (uipanel == null)
		{
			return 0;
		}
		UIWidget[] componentsInChildren2 = go.GetComponentsInChildren<UIWidget>(true);
		int j = 0;
		int num = componentsInChildren2.Length;
		while (j < num)
		{
			UIWidget uiwidget = componentsInChildren2[j];
			if (!(uiwidget.panel != uipanel))
			{
				uiwidget.depth += adjustment;
			}
			j++;
		}
		return 2;
	}

	// Token: 0x06000652 RID: 1618 RVA: 0x0002ECB0 File Offset: 0x0002CEB0
	public static void BringForward(GameObject go)
	{
		int num = NGUITools.AdjustDepth(go, 1000);
		if (num == 1)
		{
			NGUITools.NormalizePanelDepths();
		}
		else if (num == 2)
		{
			NGUITools.NormalizeWidgetDepths();
		}
	}

	// Token: 0x06000653 RID: 1619 RVA: 0x0002ECE8 File Offset: 0x0002CEE8
	public static void PushBack(GameObject go)
	{
		int num = NGUITools.AdjustDepth(go, -1000);
		if (num == 1)
		{
			NGUITools.NormalizePanelDepths();
		}
		else if (num == 2)
		{
			NGUITools.NormalizeWidgetDepths();
		}
	}

	// Token: 0x06000654 RID: 1620 RVA: 0x0002ED20 File Offset: 0x0002CF20
	public static void NormalizeDepths()
	{
		NGUITools.NormalizeWidgetDepths();
		NGUITools.NormalizePanelDepths();
	}

	// Token: 0x06000655 RID: 1621 RVA: 0x0002ED2C File Offset: 0x0002CF2C
	public static void NormalizeWidgetDepths()
	{
		NGUITools.NormalizeWidgetDepths(NGUITools.FindActive<UIWidget>());
	}

	// Token: 0x06000656 RID: 1622 RVA: 0x0002ED38 File Offset: 0x0002CF38
	public static void NormalizeWidgetDepths(GameObject go)
	{
		NGUITools.NormalizeWidgetDepths(go.GetComponentsInChildren<UIWidget>());
	}

	// Token: 0x06000657 RID: 1623 RVA: 0x0002ED48 File Offset: 0x0002CF48
	public static void NormalizeWidgetDepths(UIWidget[] list)
	{
		int num = list.Length;
		if (num > 0)
		{
			Array.Sort<UIWidget>(list, new Comparison<UIWidget>(UIWidget.FullCompareFunc));
			int num2 = 0;
			int depth = list[0].depth;
			for (int i = 0; i < num; i++)
			{
				UIWidget uiwidget = list[i];
				if (uiwidget.depth == depth)
				{
					uiwidget.depth = num2;
				}
				else
				{
					depth = uiwidget.depth;
					num2 = (uiwidget.depth = num2 + 1);
				}
			}
		}
	}

	// Token: 0x06000658 RID: 1624 RVA: 0x0002EDC4 File Offset: 0x0002CFC4
	public static void NormalizePanelDepths()
	{
		UIPanel[] array = NGUITools.FindActive<UIPanel>();
		int num = array.Length;
		if (num > 0)
		{
			Array.Sort<UIPanel>(array, new Comparison<UIPanel>(UIPanel.CompareFunc));
			int num2 = 0;
			int depth = array[0].depth;
			for (int i = 0; i < num; i++)
			{
				UIPanel uipanel = array[i];
				if (uipanel.depth == depth)
				{
					uipanel.depth = num2;
				}
				else
				{
					depth = uipanel.depth;
					num2 = (uipanel.depth = num2 + 1);
				}
			}
		}
	}

	// Token: 0x06000659 RID: 1625 RVA: 0x0002EE4C File Offset: 0x0002D04C
	public static UIPanel CreateUI(bool advanced3D)
	{
		return NGUITools.CreateUI(null, advanced3D, -1);
	}

	// Token: 0x0600065A RID: 1626 RVA: 0x0002EE58 File Offset: 0x0002D058
	public static UIPanel CreateUI(bool advanced3D, int layer)
	{
		return NGUITools.CreateUI(null, advanced3D, layer);
	}

	// Token: 0x0600065B RID: 1627 RVA: 0x0002EE64 File Offset: 0x0002D064
	public static UIPanel CreateUI(Transform trans, bool advanced3D, int layer)
	{
		UIRoot uiroot = (!(trans != null)) ? null : NGUITools.FindInParents<UIRoot>(trans.gameObject);
		if (uiroot == null && UIRoot.list.Count > 0)
		{
			foreach (UIRoot uiroot2 in UIRoot.list)
			{
				if (uiroot2.gameObject.layer == layer)
				{
					uiroot = uiroot2;
					break;
				}
			}
		}
		if (uiroot == null)
		{
			int i = 0;
			int count = UIPanel.list.Count;
			while (i < count)
			{
				UIPanel uipanel = UIPanel.list[i];
				GameObject gameObject = uipanel.gameObject;
				if (gameObject.hideFlags == null && gameObject.layer == layer)
				{
					trans.parent = uipanel.transform;
					trans.localScale = Vector3.one;
					return uipanel;
				}
				i++;
			}
		}
		if (uiroot != null)
		{
			UICamera componentInChildren = uiroot.GetComponentInChildren<UICamera>();
			if (componentInChildren != null && componentInChildren.GetComponent<Camera>().orthographic == advanced3D)
			{
				trans = null;
				uiroot = null;
			}
		}
		if (uiroot == null)
		{
			GameObject gameObject2 = NGUITools.AddChild((GameObject)null, false);
			uiroot = gameObject2.AddComponent<UIRoot>();
			if (layer == -1)
			{
				layer = LayerMask.NameToLayer("UI");
			}
			if (layer == -1)
			{
				layer = LayerMask.NameToLayer("2D UI");
			}
			gameObject2.layer = layer;
			if (advanced3D)
			{
				gameObject2.name = "UI Root (3D)";
				uiroot.scalingStyle = UIRoot.Scaling.Constrained;
			}
			else
			{
				gameObject2.name = "UI Root";
				uiroot.scalingStyle = UIRoot.Scaling.Flexible;
			}
		}
		UIPanel uipanel2 = uiroot.GetComponentInChildren<UIPanel>();
		if (uipanel2 == null)
		{
			Camera[] array = NGUITools.FindActive<Camera>();
			float num = -1f;
			bool flag = false;
			int num2 = 1 << uiroot.gameObject.layer;
			foreach (Camera camera in array)
			{
				if (camera.clearFlags == 2 || camera.clearFlags == 1)
				{
					flag = true;
				}
				num = Mathf.Max(num, camera.depth);
				camera.cullingMask &= ~num2;
			}
			Camera camera2 = uiroot.gameObject.AddChild(false);
			camera2.gameObject.AddComponent<UICamera>();
			camera2.clearFlags = ((!flag) ? 2 : 3);
			camera2.backgroundColor = Color.grey;
			camera2.cullingMask = num2;
			camera2.depth = num + 1f;
			if (advanced3D)
			{
				camera2.nearClipPlane = 0.1f;
				camera2.farClipPlane = 4f;
				camera2.transform.localPosition = new Vector3(0f, 0f, -700f);
			}
			else
			{
				camera2.orthographic = true;
				camera2.orthographicSize = 1f;
				camera2.nearClipPlane = -10f;
				camera2.farClipPlane = 10f;
			}
			AudioListener[] array2 = NGUITools.FindActive<AudioListener>();
			if (array2 == null || array2.Length == 0)
			{
				camera2.gameObject.AddComponent<AudioListener>();
			}
			uipanel2 = uiroot.gameObject.AddComponent<UIPanel>();
		}
		if (trans != null)
		{
			while (trans.parent != null)
			{
				trans = trans.parent;
			}
			if (NGUITools.IsChild(trans, uipanel2.transform))
			{
				uipanel2 = trans.gameObject.AddComponent<UIPanel>();
			}
			else
			{
				trans.parent = uipanel2.transform;
				trans.localScale = Vector3.one;
				trans.localPosition = Vector3.zero;
				uipanel2.cachedTransform.SetChildLayer(uipanel2.cachedGameObject.layer);
			}
		}
		return uipanel2;
	}

	// Token: 0x0600065C RID: 1628 RVA: 0x0002F254 File Offset: 0x0002D454
	public static void SetChildLayer(this Transform t, int layer)
	{
		for (int i = 0; i < t.childCount; i++)
		{
			Transform child = t.GetChild(i);
			child.gameObject.layer = layer;
			child.SetChildLayer(layer);
		}
	}

	// Token: 0x0600065D RID: 1629 RVA: 0x0002F294 File Offset: 0x0002D494
	public static T AddChild<T>(this GameObject parent) where T : Component
	{
		GameObject gameObject = parent.AddChild();
		string typeName;
		if (!NGUITools.mTypeNames.TryGetValue(typeof(T), ref typeName) || typeName == null)
		{
			typeName = NGUITools.GetTypeName<T>();
			NGUITools.mTypeNames[typeof(T)] = typeName;
		}
		gameObject.name = typeName;
		return gameObject.AddComponent<T>();
	}

	// Token: 0x0600065E RID: 1630 RVA: 0x0002F2F4 File Offset: 0x0002D4F4
	public static T AddChild<T>(this GameObject parent, bool undo) where T : Component
	{
		GameObject gameObject = parent.AddChild(undo);
		string typeName;
		if (!NGUITools.mTypeNames.TryGetValue(typeof(T), ref typeName) || typeName == null)
		{
			typeName = NGUITools.GetTypeName<T>();
			NGUITools.mTypeNames[typeof(T)] = typeName;
		}
		gameObject.name = typeName;
		return gameObject.AddComponent<T>();
	}

	// Token: 0x0600065F RID: 1631 RVA: 0x0002F354 File Offset: 0x0002D554
	public static T AddWidget<T>(this GameObject go, int depth = 2147483647) where T : UIWidget
	{
		if (depth == 2147483647)
		{
			depth = NGUITools.CalculateNextDepth(go);
		}
		T result = go.AddChild<T>();
		result.width = 100;
		result.height = 100;
		result.depth = depth;
		return result;
	}

	// Token: 0x06000660 RID: 1632 RVA: 0x0002F3A8 File Offset: 0x0002D5A8
	public static UISprite AddSprite(this GameObject go, UIAtlas atlas, string spriteName, int depth = 2147483647)
	{
		UISpriteData uispriteData = (!(atlas != null)) ? null : atlas.GetSprite(spriteName);
		UISprite uisprite = go.AddWidget(depth);
		uisprite.type = ((uispriteData != null && uispriteData.hasBorder) ? UIBasicSprite.Type.Sliced : UIBasicSprite.Type.Simple);
		uisprite.atlas = atlas;
		uisprite.spriteName = spriteName;
		return uisprite;
	}

	// Token: 0x06000661 RID: 1633 RVA: 0x0002F404 File Offset: 0x0002D604
	public static GameObject GetRoot(GameObject go)
	{
		Transform transform = go.transform;
		for (;;)
		{
			Transform parent = transform.parent;
			if (parent == null)
			{
				break;
			}
			transform = parent;
		}
		return transform.gameObject;
	}

	// Token: 0x06000662 RID: 1634 RVA: 0x0002F444 File Offset: 0x0002D644
	public static T FindInParents<T>(GameObject go) where T : Component
	{
		if (go == null)
		{
			return (T)((object)null);
		}
		T component = go.GetComponent<T>();
		if (component == null)
		{
			Transform parent = go.transform.parent;
			while (parent != null && component == null)
			{
				component = parent.gameObject.GetComponent<T>();
				parent = parent.parent;
			}
		}
		return component;
	}

	// Token: 0x06000663 RID: 1635 RVA: 0x0002F4C0 File Offset: 0x0002D6C0
	public static T FindInParents<T>(Transform trans) where T : Component
	{
		if (trans == null)
		{
			return (T)((object)null);
		}
		return trans.GetComponentInParent<T>();
	}

	// Token: 0x06000664 RID: 1636 RVA: 0x0002F4DC File Offset: 0x0002D6DC
	public static void Destroy(Object obj)
	{
		if (obj)
		{
			if (obj is Transform)
			{
				Transform transform = obj as Transform;
				GameObject gameObject = transform.gameObject;
				if (Application.isPlaying)
				{
					transform.parent = null;
					Object.Destroy(gameObject);
				}
				else
				{
					Object.DestroyImmediate(gameObject);
				}
			}
			else if (obj is GameObject)
			{
				GameObject gameObject2 = obj as GameObject;
				Transform transform2 = gameObject2.transform;
				if (Application.isPlaying)
				{
					transform2.parent = null;
					Object.Destroy(gameObject2);
				}
				else
				{
					Object.DestroyImmediate(gameObject2);
				}
			}
			else if (Application.isPlaying)
			{
				Object.Destroy(obj);
			}
			else
			{
				Object.DestroyImmediate(obj);
			}
		}
	}

	// Token: 0x06000665 RID: 1637 RVA: 0x0002F590 File Offset: 0x0002D790
	public static void DestroyChildren(this Transform t)
	{
		bool isPlaying = Application.isPlaying;
		while (t.childCount != 0)
		{
			Transform child = t.GetChild(0);
			if (isPlaying)
			{
				child.parent = null;
				Object.Destroy(child.gameObject);
			}
			else
			{
				Object.DestroyImmediate(child.gameObject);
			}
		}
	}

	// Token: 0x06000666 RID: 1638 RVA: 0x0002F5E4 File Offset: 0x0002D7E4
	public static void DestroyImmediate(Object obj)
	{
		if (obj != null)
		{
			if (Application.isEditor)
			{
				Object.DestroyImmediate(obj);
			}
			else
			{
				Object.Destroy(obj);
			}
		}
	}

	// Token: 0x06000667 RID: 1639 RVA: 0x0002F610 File Offset: 0x0002D810
	public static void Broadcast(string funcName)
	{
		GameObject[] array = Object.FindObjectsOfType(typeof(GameObject)) as GameObject[];
		int i = 0;
		int num = array.Length;
		while (i < num)
		{
			array[i].SendMessage(funcName, 1);
			i++;
		}
	}

	// Token: 0x06000668 RID: 1640 RVA: 0x0002F654 File Offset: 0x0002D854
	public static void Broadcast(string funcName, object param)
	{
		GameObject[] array = Object.FindObjectsOfType(typeof(GameObject)) as GameObject[];
		int i = 0;
		int num = array.Length;
		while (i < num)
		{
			array[i].SendMessage(funcName, param, 1);
			i++;
		}
	}

	// Token: 0x06000669 RID: 1641 RVA: 0x0002F698 File Offset: 0x0002D898
	public static bool IsChild(Transform parent, Transform child)
	{
		if (parent == null || child == null)
		{
			return false;
		}
		while (child != null)
		{
			if (child == parent)
			{
				return true;
			}
			child = child.parent;
		}
		return false;
	}

	// Token: 0x0600066A RID: 1642 RVA: 0x0002F6E8 File Offset: 0x0002D8E8
	private static void Activate(Transform t)
	{
		NGUITools.Activate(t, false);
	}

	// Token: 0x0600066B RID: 1643 RVA: 0x0002F6F4 File Offset: 0x0002D8F4
	private static void Activate(Transform t, bool compatibilityMode)
	{
		NGUITools.SetActiveSelf(t.gameObject, true);
		if (compatibilityMode)
		{
			int i = 0;
			int childCount = t.childCount;
			while (i < childCount)
			{
				Transform child = t.GetChild(i);
				if (child.gameObject.activeSelf)
				{
					return;
				}
				i++;
			}
			int j = 0;
			int childCount2 = t.childCount;
			while (j < childCount2)
			{
				Transform child2 = t.GetChild(j);
				NGUITools.Activate(child2, true);
				j++;
			}
		}
	}

	// Token: 0x0600066C RID: 1644 RVA: 0x0002F774 File Offset: 0x0002D974
	private static void Deactivate(Transform t)
	{
		NGUITools.SetActiveSelf(t.gameObject, false);
	}

	// Token: 0x0600066D RID: 1645 RVA: 0x0002F784 File Offset: 0x0002D984
	public static void SetActive(GameObject go, bool state)
	{
		NGUITools.SetActive(go, state, true);
	}

	// Token: 0x0600066E RID: 1646 RVA: 0x0002F790 File Offset: 0x0002D990
	public static void SetActive(GameObject go, bool state, bool compatibilityMode)
	{
		if (go)
		{
			if (state)
			{
				NGUITools.Activate(go.transform, compatibilityMode);
				NGUITools.CallCreatePanel(go.transform);
			}
			else
			{
				NGUITools.Deactivate(go.transform);
			}
		}
	}

	// Token: 0x0600066F RID: 1647 RVA: 0x0002F7D8 File Offset: 0x0002D9D8
	[DebuggerStepThrough]
	[DebuggerHidden]
	private static void CallCreatePanel(Transform t)
	{
		UIWidget component = t.GetComponent<UIWidget>();
		if (component != null)
		{
			component.CreatePanel();
		}
		int i = 0;
		int childCount = t.childCount;
		while (i < childCount)
		{
			NGUITools.CallCreatePanel(t.GetChild(i));
			i++;
		}
	}

	// Token: 0x06000670 RID: 1648 RVA: 0x0002F824 File Offset: 0x0002DA24
	public static void SetActiveChildren(GameObject go, bool state)
	{
		Transform transform = go.transform;
		if (state)
		{
			int i = 0;
			int childCount = transform.childCount;
			while (i < childCount)
			{
				Transform child = transform.GetChild(i);
				NGUITools.Activate(child);
				i++;
			}
		}
		else
		{
			int j = 0;
			int childCount2 = transform.childCount;
			while (j < childCount2)
			{
				Transform child2 = transform.GetChild(j);
				NGUITools.Deactivate(child2);
				j++;
			}
		}
	}

	// Token: 0x06000671 RID: 1649 RVA: 0x0002F89C File Offset: 0x0002DA9C
	[Obsolete("Use NGUITools.GetActive instead")]
	public static bool IsActive(Behaviour mb)
	{
		return mb != null && mb.enabled && mb.gameObject.activeInHierarchy;
	}

	// Token: 0x06000672 RID: 1650 RVA: 0x0002F8D0 File Offset: 0x0002DAD0
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static bool GetActive(Behaviour mb)
	{
		return mb && mb.enabled && mb.gameObject.activeInHierarchy;
	}

	// Token: 0x06000673 RID: 1651 RVA: 0x0002F904 File Offset: 0x0002DB04
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static bool GetActive(GameObject go)
	{
		return go && go.activeInHierarchy;
	}

	// Token: 0x06000674 RID: 1652 RVA: 0x0002F91C File Offset: 0x0002DB1C
	[DebuggerStepThrough]
	[DebuggerHidden]
	public static void SetActiveSelf(GameObject go, bool state)
	{
		go.SetActive(state);
	}

	// Token: 0x06000675 RID: 1653 RVA: 0x0002F928 File Offset: 0x0002DB28
	public static void SetLayer(GameObject go, int layer)
	{
		go.layer = layer;
		Transform transform = go.transform;
		int i = 0;
		int childCount = transform.childCount;
		while (i < childCount)
		{
			Transform child = transform.GetChild(i);
			NGUITools.SetLayer(child.gameObject, layer);
			i++;
		}
	}

	// Token: 0x06000676 RID: 1654 RVA: 0x0002F970 File Offset: 0x0002DB70
	public static Vector3 Round(Vector3 v)
	{
		v.x = Mathf.Round(v.x);
		v.y = Mathf.Round(v.y);
		v.z = Mathf.Round(v.z);
		return v;
	}

	// Token: 0x06000677 RID: 1655 RVA: 0x0002F9B8 File Offset: 0x0002DBB8
	public static void MakePixelPerfect(Transform t)
	{
		UIWidget component = t.GetComponent<UIWidget>();
		if (component != null)
		{
			component.MakePixelPerfect();
		}
		if (t.GetComponent<UIAnchor>() == null && t.GetComponent<UIRoot>() == null)
		{
			t.localPosition = NGUITools.Round(t.localPosition);
			t.localScale = NGUITools.Round(t.localScale);
		}
		int i = 0;
		int childCount = t.childCount;
		while (i < childCount)
		{
			NGUITools.MakePixelPerfect(t.GetChild(i));
			i++;
		}
	}

	// Token: 0x06000678 RID: 1656 RVA: 0x0002FA48 File Offset: 0x0002DC48
	public static void FitOnScreen(this Camera cam, Transform transform, Vector3 pos)
	{
		cam.FitOnScreen(transform, transform, pos);
	}

	// Token: 0x06000679 RID: 1657 RVA: 0x0002FA54 File Offset: 0x0002DC54
	public static void FitOnScreen(this Camera cam, Transform transform, Transform content, Vector3 pos)
	{
		Bounds bounds;
		cam.FitOnScreen(transform, content, pos, out bounds);
	}

	// Token: 0x0600067A RID: 1658 RVA: 0x0002FA6C File Offset: 0x0002DC6C
	public static void FitOnScreen(this Camera cam, Transform transform, Transform content, Vector3 pos, out Bounds bounds)
	{
		bounds = NGUIMath.CalculateRelativeWidgetBounds(transform, content);
		Vector3 min = bounds.min;
		Vector3 vector = bounds.max;
		Vector3 size = bounds.size;
		size.x += min.x;
		size.y -= vector.y;
		if (cam != null)
		{
			pos.x = Mathf.Clamp01(pos.x / (float)Screen.width);
			pos.y = Mathf.Clamp01(pos.y / (float)Screen.height);
			float num = cam.orthographicSize / transform.parent.lossyScale.y;
			float num2 = (float)Screen.height * 0.5f / num;
			vector = new Vector2(num2 * size.x / (float)Screen.width, num2 * size.y / (float)Screen.height);
			pos.x = Mathf.Min(pos.x, 1f - vector.x);
			pos.y = Mathf.Max(pos.y, vector.y);
			transform.position = cam.ViewportToWorldPoint(pos);
			pos = transform.localPosition;
			pos.x = Mathf.Round(pos.x);
			pos.y = Mathf.Round(pos.y);
		}
		else
		{
			if (pos.x + size.x > (float)Screen.width)
			{
				pos.x = (float)Screen.width - size.x;
			}
			if (pos.y - size.y < 0f)
			{
				pos.y = size.y;
			}
			pos.x -= (float)Screen.width * 0.5f;
			pos.y -= (float)Screen.height * 0.5f;
		}
		transform.localPosition = pos;
	}

	// Token: 0x0600067B RID: 1659 RVA: 0x0002FC70 File Offset: 0x0002DE70
	public static bool Save(string fileName, byte[] bytes)
	{
		if (!NGUITools.fileAccess)
		{
			return false;
		}
		string text = Application.persistentDataPath + "/" + fileName;
		if (bytes == null)
		{
			if (File.Exists(text))
			{
				File.Delete(text);
			}
			return true;
		}
		FileStream fileStream = null;
		try
		{
			fileStream = File.Create(text);
		}
		catch (Exception ex)
		{
			Debug.LogError(ex.Message);
			return false;
		}
		fileStream.Write(bytes, 0, bytes.Length);
		fileStream.Close();
		return true;
	}

	// Token: 0x0600067C RID: 1660 RVA: 0x0002FD0C File Offset: 0x0002DF0C
	public static byte[] Load(string fileName)
	{
		if (!NGUITools.fileAccess)
		{
			return null;
		}
		string text = Application.persistentDataPath + "/" + fileName;
		if (File.Exists(text))
		{
			return File.ReadAllBytes(text);
		}
		return null;
	}

	// Token: 0x0600067D RID: 1661 RVA: 0x0002FD4C File Offset: 0x0002DF4C
	public static Color ApplyPMA(Color c)
	{
		if (c.a != 1f)
		{
			c.r *= c.a;
			c.g *= c.a;
			c.b *= c.a;
		}
		return c;
	}

	// Token: 0x0600067E RID: 1662 RVA: 0x0002FDAC File Offset: 0x0002DFAC
	public static void MarkParentAsChanged(GameObject go)
	{
		UIRect[] componentsInChildren = go.GetComponentsInChildren<UIRect>();
		int i = 0;
		int num = componentsInChildren.Length;
		while (i < num)
		{
			componentsInChildren[i].ParentHasChanged();
			i++;
		}
	}

	// Token: 0x1700007F RID: 127
	// (get) Token: 0x0600067F RID: 1663 RVA: 0x0002FDE0 File Offset: 0x0002DFE0
	// (set) Token: 0x06000680 RID: 1664 RVA: 0x0002FE00 File Offset: 0x0002E000
	public static string clipboard
	{
		get
		{
			TextEditor textEditor = new TextEditor();
			textEditor.Paste();
			return textEditor.text;
		}
		set
		{
			TextEditor textEditor = new TextEditor();
			textEditor.text = value;
			textEditor.OnFocus();
			textEditor.Copy();
		}
	}

	// Token: 0x06000681 RID: 1665 RVA: 0x0002FE28 File Offset: 0x0002E028
	[Obsolete("Use NGUIText.EncodeColor instead")]
	public static string EncodeColor(Color c)
	{
		return NGUIText.EncodeColor24(c);
	}

	// Token: 0x06000682 RID: 1666 RVA: 0x0002FE30 File Offset: 0x0002E030
	[Obsolete("Use NGUIText.ParseColor instead")]
	public static Color ParseColor(string text, int offset)
	{
		return NGUIText.ParseColor24(text, offset);
	}

	// Token: 0x06000683 RID: 1667 RVA: 0x0002FE3C File Offset: 0x0002E03C
	[Obsolete("Use NGUIText.StripSymbols instead")]
	public static string StripSymbols(string text)
	{
		return NGUIText.StripSymbols(text);
	}

	// Token: 0x06000684 RID: 1668 RVA: 0x0002FE44 File Offset: 0x0002E044
	public static T AddMissingComponent<T>(this GameObject go) where T : Component
	{
		T t = go.GetComponent<T>();
		if (t == null)
		{
			t = go.AddComponent<T>();
		}
		return t;
	}

	// Token: 0x06000685 RID: 1669 RVA: 0x0002FE74 File Offset: 0x0002E074
	public static Vector3[] GetSides(this Camera cam)
	{
		return cam.GetSides(Mathf.Lerp(cam.nearClipPlane, cam.farClipPlane, 0.5f), null);
	}

	// Token: 0x06000686 RID: 1670 RVA: 0x0002FEA0 File Offset: 0x0002E0A0
	public static Vector3[] GetSides(this Camera cam, float depth)
	{
		return cam.GetSides(depth, null);
	}

	// Token: 0x06000687 RID: 1671 RVA: 0x0002FEAC File Offset: 0x0002E0AC
	public static Vector3[] GetSides(this Camera cam, Transform relativeTo)
	{
		return cam.GetSides(Mathf.Lerp(cam.nearClipPlane, cam.farClipPlane, 0.5f), relativeTo);
	}

	// Token: 0x06000688 RID: 1672 RVA: 0x0002FED8 File Offset: 0x0002E0D8
	public static Vector3[] GetSides(this Camera cam, float depth, Transform relativeTo)
	{
		if (cam.orthographic)
		{
			float orthographicSize = cam.orthographicSize;
			float num = -orthographicSize;
			float num2 = orthographicSize;
			float num3 = -orthographicSize;
			float num4 = orthographicSize;
			Rect rect = cam.rect;
			Vector2 screenSize = NGUITools.screenSize;
			float num5 = screenSize.x / screenSize.y;
			num5 *= rect.width / rect.height;
			num *= num5;
			num2 *= num5;
			Transform transform = cam.transform;
			Quaternion rotation = transform.rotation;
			Vector3 position = transform.position;
			int num6 = Mathf.RoundToInt(screenSize.x);
			int num7 = Mathf.RoundToInt(screenSize.y);
			if ((num6 & 1) == 1)
			{
				position.x -= 1f / screenSize.x;
			}
			if ((num7 & 1) == 1)
			{
				position.y += 1f / screenSize.y;
			}
			NGUITools.mSides[0] = rotation * new Vector3(num, 0f, depth) + position;
			NGUITools.mSides[1] = rotation * new Vector3(0f, num4, depth) + position;
			NGUITools.mSides[2] = rotation * new Vector3(num2, 0f, depth) + position;
			NGUITools.mSides[3] = rotation * new Vector3(0f, num3, depth) + position;
		}
		else
		{
			NGUITools.mSides[0] = cam.ViewportToWorldPoint(new Vector3(0f, 0.5f, depth));
			NGUITools.mSides[1] = cam.ViewportToWorldPoint(new Vector3(0.5f, 1f, depth));
			NGUITools.mSides[2] = cam.ViewportToWorldPoint(new Vector3(1f, 0.5f, depth));
			NGUITools.mSides[3] = cam.ViewportToWorldPoint(new Vector3(0.5f, 0f, depth));
		}
		if (relativeTo != null)
		{
			for (int i = 0; i < 4; i++)
			{
				NGUITools.mSides[i] = relativeTo.InverseTransformPoint(NGUITools.mSides[i]);
			}
		}
		return NGUITools.mSides;
	}

	// Token: 0x06000689 RID: 1673 RVA: 0x00030158 File Offset: 0x0002E358
	public static Vector3[] GetWorldCorners(this Camera cam)
	{
		float depth = Mathf.Lerp(cam.nearClipPlane, cam.farClipPlane, 0.5f);
		return cam.GetWorldCorners(depth, null);
	}

	// Token: 0x0600068A RID: 1674 RVA: 0x00030184 File Offset: 0x0002E384
	public static Vector3[] GetWorldCorners(this Camera cam, float depth)
	{
		return cam.GetWorldCorners(depth, null);
	}

	// Token: 0x0600068B RID: 1675 RVA: 0x00030190 File Offset: 0x0002E390
	public static Vector3[] GetWorldCorners(this Camera cam, Transform relativeTo)
	{
		return cam.GetWorldCorners(Mathf.Lerp(cam.nearClipPlane, cam.farClipPlane, 0.5f), relativeTo);
	}

	// Token: 0x0600068C RID: 1676 RVA: 0x000301BC File Offset: 0x0002E3BC
	public static Vector3[] GetWorldCorners(this Camera cam, float depth, Transform relativeTo)
	{
		if (cam.orthographic)
		{
			float orthographicSize = cam.orthographicSize;
			float num = -orthographicSize;
			float num2 = orthographicSize;
			float num3 = -orthographicSize;
			float num4 = orthographicSize;
			Rect rect = cam.rect;
			Vector2 screenSize = NGUITools.screenSize;
			float num5 = screenSize.x / screenSize.y;
			num5 *= rect.width / rect.height;
			num *= num5;
			num2 *= num5;
			Transform transform = cam.transform;
			Quaternion rotation = transform.rotation;
			Vector3 position = transform.position;
			NGUITools.mSides[0] = rotation * new Vector3(num, num3, depth) + position;
			NGUITools.mSides[1] = rotation * new Vector3(num, num4, depth) + position;
			NGUITools.mSides[2] = rotation * new Vector3(num2, num4, depth) + position;
			NGUITools.mSides[3] = rotation * new Vector3(num2, num3, depth) + position;
		}
		else
		{
			NGUITools.mSides[0] = cam.ViewportToWorldPoint(new Vector3(0f, 0f, depth));
			NGUITools.mSides[1] = cam.ViewportToWorldPoint(new Vector3(0f, 1f, depth));
			NGUITools.mSides[2] = cam.ViewportToWorldPoint(new Vector3(1f, 1f, depth));
			NGUITools.mSides[3] = cam.ViewportToWorldPoint(new Vector3(1f, 0f, depth));
		}
		if (relativeTo != null)
		{
			for (int i = 0; i < 4; i++)
			{
				NGUITools.mSides[i] = relativeTo.InverseTransformPoint(NGUITools.mSides[i]);
			}
		}
		return NGUITools.mSides;
	}

	// Token: 0x0600068D RID: 1677 RVA: 0x000303C4 File Offset: 0x0002E5C4
	public static string GetFuncName(object obj, string method)
	{
		if (obj == null)
		{
			return "<null>";
		}
		string text = obj.GetType().ToString();
		int num = text.LastIndexOf('/');
		if (num > 0)
		{
			text = text.Substring(num + 1);
		}
		return (!string.IsNullOrEmpty(method)) ? (text + "/" + method) : text;
	}

	// Token: 0x0600068E RID: 1678 RVA: 0x00030420 File Offset: 0x0002E620
	public static void Execute<T>(GameObject go, string funcName) where T : Component
	{
		T[] components = go.GetComponents<T>();
		foreach (T t in components)
		{
			MethodInfo method = t.GetType().GetMethod(funcName, 52);
			if (method != null)
			{
				method.Invoke(t, null);
			}
		}
	}

	// Token: 0x0600068F RID: 1679 RVA: 0x00030480 File Offset: 0x0002E680
	public static void ExecuteAll<T>(GameObject root, string funcName) where T : Component
	{
		NGUITools.Execute<T>(root, funcName);
		Transform transform = root.transform;
		int i = 0;
		int childCount = transform.childCount;
		while (i < childCount)
		{
			NGUITools.ExecuteAll<T>(transform.GetChild(i).gameObject, funcName);
			i++;
		}
	}

	// Token: 0x06000690 RID: 1680 RVA: 0x000304C8 File Offset: 0x0002E6C8
	public static void ImmediatelyCreateDrawCalls(GameObject root)
	{
		NGUITools.ExecuteAll<UIWidget>(root, "Start");
		NGUITools.ExecuteAll<UIPanel>(root, "Start");
		NGUITools.ExecuteAll<UIWidget>(root, "Update");
		NGUITools.ExecuteAll<UIPanel>(root, "Update");
		NGUITools.ExecuteAll<UIPanel>(root, "LateUpdate");
	}

	// Token: 0x17000080 RID: 128
	// (get) Token: 0x06000691 RID: 1681 RVA: 0x00030504 File Offset: 0x0002E704
	public static Vector2 screenSize
	{
		get
		{
			return new Vector2((float)Screen.width, (float)Screen.height);
		}
	}

	// Token: 0x06000692 RID: 1682 RVA: 0x00030518 File Offset: 0x0002E718
	public static string KeyToCaption(KeyCode key)
	{
		switch (key)
		{
		case 0:
			return null;
		default:
			switch (key)
			{
			case 256:
				return "K0";
			case 257:
				return "K1";
			case 258:
				return "K2";
			case 259:
				return "K3";
			case 260:
				return "K4";
			case 261:
				return "K5";
			case 262:
				return "K6";
			case 263:
				return "K7";
			case 264:
				return "K8";
			case 265:
				return "K9";
			case 266:
				return ".";
			case 267:
				return "/";
			case 268:
				return "*";
			case 269:
				return "-";
			case 270:
				return "+";
			case 271:
				return "NT";
			case 272:
				return "=";
			case 273:
				return "UP";
			case 274:
				return "DN";
			case 275:
				return "LT";
			case 276:
				return "RT";
			case 277:
				return "Ins";
			case 278:
				return "Home";
			case 279:
				return "End";
			case 280:
				return "PU";
			case 281:
				return "PD";
			case 282:
				return "F1";
			case 283:
				return "F2";
			case 284:
				return "F3";
			case 285:
				return "F4";
			case 286:
				return "F5";
			case 287:
				return "F6";
			case 288:
				return "F7";
			case 289:
				return "F8";
			case 290:
				return "F9";
			case 291:
				return "F10";
			case 292:
				return "F11";
			case 293:
				return "F12";
			case 294:
				return "F13";
			case 295:
				return "F14";
			case 296:
				return "F15";
			case 300:
				return "Num";
			case 301:
				return "Cap";
			case 302:
				return "Scr";
			case 303:
				return "RS";
			case 304:
				return "LS";
			case 305:
				return "RC";
			case 306:
				return "LC";
			case 307:
				return "RA";
			case 308:
				return "LA";
			case 323:
				return "M0";
			case 324:
				return "M1";
			case 325:
				return "M2";
			case 326:
				return "M3";
			case 327:
				return "M4";
			case 328:
				return "M5";
			case 329:
				return "M6";
			case 330:
				return "(A)";
			case 331:
				return "(B)";
			case 332:
				return "(X)";
			case 333:
				return "(Y)";
			case 334:
				return "(RB)";
			case 335:
				return "(LB)";
			case 336:
				return "(Back)";
			case 337:
				return "(Start)";
			case 338:
				return "(LS)";
			case 339:
				return "(RS)";
			case 340:
				return "J10";
			case 341:
				return "J11";
			case 342:
				return "J12";
			case 343:
				return "J13";
			case 344:
				return "J14";
			case 345:
				return "J15";
			case 346:
				return "J16";
			case 347:
				return "J17";
			case 348:
				return "J18";
			case 349:
				return "J19";
			}
			return null;
		case 8:
			return "BS";
		case 9:
			return "Tab";
		case 12:
			return "Clr";
		case 13:
			return "NT";
		case 19:
			return "PS";
		case 27:
			return "Esc";
		case 32:
			return "SP";
		case 33:
			return "!";
		case 34:
			return "\"";
		case 35:
			return "#";
		case 36:
			return "$";
		case 38:
			return "&";
		case 39:
			return "'";
		case 40:
			return "(";
		case 41:
			return ")";
		case 42:
			return "*";
		case 43:
			return "+";
		case 44:
			return ",";
		case 45:
			return "-";
		case 46:
			return ".";
		case 47:
			return "/";
		case 48:
			return "0";
		case 49:
			return "1";
		case 50:
			return "2";
		case 51:
			return "3";
		case 52:
			return "4";
		case 53:
			return "5";
		case 54:
			return "6";
		case 55:
			return "7";
		case 56:
			return "8";
		case 57:
			return "9";
		case 58:
			return ":";
		case 59:
			return ";";
		case 60:
			return "<";
		case 61:
			return "=";
		case 62:
			return ">";
		case 63:
			return "?";
		case 64:
			return "@";
		case 91:
			return "[";
		case 92:
			return "\\";
		case 93:
			return "]";
		case 94:
			return "^";
		case 95:
			return "_";
		case 96:
			return "`";
		case 97:
			return "A";
		case 98:
			return "B";
		case 99:
			return "C";
		case 100:
			return "D";
		case 101:
			return "E";
		case 102:
			return "F";
		case 103:
			return "G";
		case 104:
			return "H";
		case 105:
			return "I";
		case 106:
			return "J";
		case 107:
			return "K";
		case 108:
			return "L";
		case 109:
			return "M";
		case 110:
			return "N0";
		case 111:
			return "O";
		case 112:
			return "P";
		case 113:
			return "Q";
		case 114:
			return "R";
		case 115:
			return "S";
		case 116:
			return "T";
		case 117:
			return "U";
		case 118:
			return "V";
		case 119:
			return "W";
		case 120:
			return "X";
		case 121:
			return "Y";
		case 122:
			return "Z";
		case 127:
			return "Del";
		}
	}

	// Token: 0x06000693 RID: 1683 RVA: 0x00030C34 File Offset: 0x0002EE34
	public static T Draw<T>(string id, NGUITools.OnInitFunc<T> onInit = null) where T : UIWidget
	{
		UIWidget uiwidget;
		if (NGUITools.mWidgets.TryGetValue(id, ref uiwidget) && uiwidget)
		{
			return (T)((object)uiwidget);
		}
		if (NGUITools.mRoot == null)
		{
			UICamera uicamera = null;
			UIRoot uiroot = null;
			for (int i = 0; i < UIRoot.list.Count; i++)
			{
				UIRoot uiroot2 = UIRoot.list[i];
				if (uiroot2)
				{
					UICamera uicamera2 = UICamera.FindCameraForLayer(uiroot2.gameObject.layer);
					if (uicamera2 && uicamera2.cachedCamera.orthographic)
					{
						uicamera = uicamera2;
						uiroot = uiroot2;
						break;
					}
				}
			}
			if (uicamera == null)
			{
				NGUITools.mRoot = NGUITools.CreateUI(false, LayerMask.NameToLayer("UI"));
			}
			else
			{
				NGUITools.mRoot = uiroot.gameObject.AddChild<UIPanel>();
			}
			NGUITools.mRoot.depth = 100000;
			NGUITools.mGo = NGUITools.mRoot.gameObject;
			NGUITools.mGo.name = "Immediate Mode GUI";
		}
		uiwidget = NGUITools.mGo.AddWidget(int.MaxValue);
		uiwidget.name = id;
		NGUITools.mWidgets[id] = uiwidget;
		if (onInit != null)
		{
			onInit((T)((object)uiwidget));
		}
		return (T)((object)uiwidget);
	}

	// Token: 0x0400064E RID: 1614
	private static AudioListener mListener;

	// Token: 0x0400064F RID: 1615
	private static bool mLoaded = false;

	// Token: 0x04000650 RID: 1616
	private static float mGlobalVolume = 1f;

	// Token: 0x04000651 RID: 1617
	private static float mLastTimestamp = 0f;

	// Token: 0x04000652 RID: 1618
	private static AudioClip mLastClip;

	// Token: 0x04000653 RID: 1619
	private static Dictionary<Type, string> mTypeNames = new Dictionary<Type, string>();

	// Token: 0x04000654 RID: 1620
	private static Vector3[] mSides = new Vector3[4];

	// Token: 0x04000655 RID: 1621
	public static KeyCode[] keys = new KeyCode[]
	{
		8,
		9,
		12,
		13,
		19,
		27,
		32,
		33,
		34,
		35,
		36,
		38,
		39,
		40,
		41,
		42,
		43,
		44,
		45,
		46,
		47,
		48,
		49,
		50,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		58,
		59,
		60,
		61,
		62,
		63,
		64,
		91,
		92,
		93,
		94,
		95,
		96,
		97,
		98,
		99,
		100,
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		110,
		111,
		112,
		113,
		114,
		115,
		116,
		117,
		118,
		119,
		120,
		121,
		122,
		127,
		256,
		257,
		258,
		259,
		260,
		261,
		262,
		263,
		264,
		265,
		266,
		267,
		268,
		269,
		270,
		271,
		272,
		273,
		274,
		275,
		276,
		277,
		278,
		279,
		280,
		281,
		282,
		283,
		284,
		285,
		286,
		287,
		288,
		289,
		290,
		291,
		292,
		293,
		294,
		295,
		296,
		300,
		301,
		302,
		303,
		304,
		305,
		306,
		307,
		308,
		326,
		327,
		328,
		329,
		330,
		331,
		332,
		333,
		334,
		335,
		336,
		337,
		338,
		339,
		340,
		341,
		342,
		343,
		344,
		345,
		346,
		347,
		348,
		349
	};

	// Token: 0x04000656 RID: 1622
	private static Dictionary<string, UIWidget> mWidgets = new Dictionary<string, UIWidget>();

	// Token: 0x04000657 RID: 1623
	private static UIPanel mRoot;

	// Token: 0x04000658 RID: 1624
	private static GameObject mGo;

	// Token: 0x02000341 RID: 833
	// (Invoke) Token: 0x06001526 RID: 5414
	public delegate void OnInitFunc<T>(T w) where T : UIWidget;
}
