using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200012C RID: 300
[AddComponentMenu("NGUI/UI/Root")]
[ExecuteInEditMode]
public class UIRoot : MonoBehaviour
{
	// Token: 0x1700017D RID: 381
	// (get) Token: 0x060009FE RID: 2558 RVA: 0x00049BFC File Offset: 0x00047DFC
	public UIRoot.Constraint constraint
	{
		get
		{
			if (this.fitWidth)
			{
				if (this.fitHeight)
				{
					return UIRoot.Constraint.Fit;
				}
				return UIRoot.Constraint.FitWidth;
			}
			else
			{
				if (this.fitHeight)
				{
					return UIRoot.Constraint.FitHeight;
				}
				return UIRoot.Constraint.Fill;
			}
		}
	}

	// Token: 0x1700017E RID: 382
	// (get) Token: 0x060009FF RID: 2559 RVA: 0x00049C34 File Offset: 0x00047E34
	public UIRoot.Scaling activeScaling
	{
		get
		{
			UIRoot.Scaling scaling = this.scalingStyle;
			if (scaling == UIRoot.Scaling.ConstrainedOnMobiles)
			{
				return UIRoot.Scaling.Constrained;
			}
			return scaling;
		}
	}

	// Token: 0x1700017F RID: 383
	// (get) Token: 0x06000A00 RID: 2560 RVA: 0x00049C54 File Offset: 0x00047E54
	public int activeHeight
	{
		get
		{
			if (this.activeScaling == UIRoot.Scaling.Flexible)
			{
				Vector2 screenSize = NGUITools.screenSize;
				float num = screenSize.x / screenSize.y;
				if (screenSize.y < (float)this.minimumHeight)
				{
					screenSize.y = (float)this.minimumHeight;
					screenSize.x = screenSize.y * num;
				}
				else if (screenSize.y > (float)this.maximumHeight)
				{
					screenSize.y = (float)this.maximumHeight;
					screenSize.x = screenSize.y * num;
				}
				int num2 = Mathf.RoundToInt((!this.shrinkPortraitUI || screenSize.y <= screenSize.x) ? screenSize.y : (screenSize.y / num));
				return (!this.adjustByDPI) ? num2 : NGUIMath.AdjustByDPI((float)num2);
			}
			UIRoot.Constraint constraint = this.constraint;
			if (constraint == UIRoot.Constraint.FitHeight)
			{
				return this.manualHeight;
			}
			Vector2 screenSize2 = NGUITools.screenSize;
			float num3 = screenSize2.x / screenSize2.y;
			float num4 = (float)this.manualWidth / (float)this.manualHeight;
			switch (constraint)
			{
			case UIRoot.Constraint.Fit:
				return (num4 <= num3) ? this.manualHeight : Mathf.RoundToInt((float)this.manualWidth / num3);
			case UIRoot.Constraint.Fill:
				return (num4 >= num3) ? this.manualHeight : Mathf.RoundToInt((float)this.manualWidth / num3);
			case UIRoot.Constraint.FitWidth:
				return Mathf.RoundToInt((float)this.manualWidth / num3);
			default:
				return this.manualHeight;
			}
		}
	}

	// Token: 0x17000180 RID: 384
	// (get) Token: 0x06000A01 RID: 2561 RVA: 0x00049DF8 File Offset: 0x00047FF8
	public float pixelSizeAdjustment
	{
		get
		{
			int num = Mathf.RoundToInt(NGUITools.screenSize.y);
			return (num != -1) ? this.GetPixelSizeAdjustment(num) : 1f;
		}
	}

	// Token: 0x06000A02 RID: 2562 RVA: 0x00049E30 File Offset: 0x00048030
	public static float GetPixelSizeAdjustment(GameObject go)
	{
		UIRoot uiroot = NGUITools.FindInParents<UIRoot>(go);
		return (!(uiroot != null)) ? 1f : uiroot.pixelSizeAdjustment;
	}

	// Token: 0x06000A03 RID: 2563 RVA: 0x00049E60 File Offset: 0x00048060
	public float GetPixelSizeAdjustment(int height)
	{
		height = Mathf.Max(2, height);
		if (this.activeScaling == UIRoot.Scaling.Constrained)
		{
			return (float)this.activeHeight / (float)height;
		}
		if (height < this.minimumHeight)
		{
			return (float)this.minimumHeight / (float)height;
		}
		if (height > this.maximumHeight)
		{
			return (float)this.maximumHeight / (float)height;
		}
		return 1f;
	}

	// Token: 0x06000A04 RID: 2564 RVA: 0x00049EC0 File Offset: 0x000480C0
	protected virtual void Awake()
	{
		this.mTrans = base.transform;
	}

	// Token: 0x06000A05 RID: 2565 RVA: 0x00049ED0 File Offset: 0x000480D0
	protected virtual void OnEnable()
	{
		UIRoot.list.Add(this);
	}

	// Token: 0x06000A06 RID: 2566 RVA: 0x00049EE0 File Offset: 0x000480E0
	protected virtual void OnDisable()
	{
		UIRoot.list.Remove(this);
	}

	// Token: 0x06000A07 RID: 2567 RVA: 0x00049EF0 File Offset: 0x000480F0
	protected virtual void Start()
	{
		UIOrthoCamera componentInChildren = base.GetComponentInChildren<UIOrthoCamera>();
		if (componentInChildren != null)
		{
			Debug.LogWarning("UIRoot should not be active at the same time as UIOrthoCamera. Disabling UIOrthoCamera.", componentInChildren);
			Camera component = componentInChildren.gameObject.GetComponent<Camera>();
			componentInChildren.enabled = false;
			if (component != null)
			{
				component.orthographicSize = 1f;
			}
		}
		else
		{
			this.UpdateScale(false);
		}
	}

	// Token: 0x06000A08 RID: 2568 RVA: 0x00049F54 File Offset: 0x00048154
	private void Update()
	{
		this.UpdateScale(true);
	}

	// Token: 0x06000A09 RID: 2569 RVA: 0x00049F60 File Offset: 0x00048160
	public void UpdateScale(bool updateAnchors = true)
	{
		if (this.mTrans != null)
		{
			float num = (float)this.activeHeight;
			if (num > 0f)
			{
				float num2 = 2f / num;
				Vector3 localScale = this.mTrans.localScale;
				if (Mathf.Abs(localScale.x - num2) > 1E-45f || Mathf.Abs(localScale.y - num2) > 1E-45f || Mathf.Abs(localScale.z - num2) > 1E-45f)
				{
					this.mTrans.localScale = new Vector3(num2, num2, num2);
					if (updateAnchors)
					{
						base.BroadcastMessage("UpdateAnchors");
					}
				}
			}
		}
	}

	// Token: 0x06000A0A RID: 2570 RVA: 0x0004A014 File Offset: 0x00048214
	public static void Broadcast(string funcName)
	{
		int i = 0;
		int count = UIRoot.list.Count;
		while (i < count)
		{
			UIRoot uiroot = UIRoot.list[i];
			if (uiroot != null)
			{
				uiroot.BroadcastMessage(funcName, 1);
			}
			i++;
		}
	}

	// Token: 0x06000A0B RID: 2571 RVA: 0x0004A060 File Offset: 0x00048260
	public static void Broadcast(string funcName, object param)
	{
		if (param == null)
		{
			Debug.LogError("SendMessage is bugged when you try to pass 'null' in the parameter field. It behaves as if no parameter was specified.");
		}
		else
		{
			int i = 0;
			int count = UIRoot.list.Count;
			while (i < count)
			{
				UIRoot uiroot = UIRoot.list[i];
				if (uiroot != null)
				{
					uiroot.BroadcastMessage(funcName, param, 1);
				}
				i++;
			}
		}
	}

	// Token: 0x04000921 RID: 2337
	public static List<UIRoot> list = new List<UIRoot>();

	// Token: 0x04000922 RID: 2338
	public UIRoot.Scaling scalingStyle;

	// Token: 0x04000923 RID: 2339
	public int manualWidth = 1280;

	// Token: 0x04000924 RID: 2340
	public int manualHeight = 720;

	// Token: 0x04000925 RID: 2341
	public int minimumHeight = 320;

	// Token: 0x04000926 RID: 2342
	public int maximumHeight = 1536;

	// Token: 0x04000927 RID: 2343
	public bool fitWidth;

	// Token: 0x04000928 RID: 2344
	public bool fitHeight = true;

	// Token: 0x04000929 RID: 2345
	public bool adjustByDPI;

	// Token: 0x0400092A RID: 2346
	public bool shrinkPortraitUI;

	// Token: 0x0400092B RID: 2347
	private Transform mTrans;

	// Token: 0x0200012D RID: 301
	public enum Scaling
	{
		// Token: 0x0400092D RID: 2349
		Flexible,
		// Token: 0x0400092E RID: 2350
		Constrained,
		// Token: 0x0400092F RID: 2351
		ConstrainedOnMobiles
	}

	// Token: 0x0200012E RID: 302
	public enum Constraint
	{
		// Token: 0x04000931 RID: 2353
		Fit,
		// Token: 0x04000932 RID: 2354
		Fill,
		// Token: 0x04000933 RID: 2355
		FitWidth,
		// Token: 0x04000934 RID: 2356
		FitHeight
	}
}
