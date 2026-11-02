using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020000BB RID: 187
[ExecuteInEditMode]
[AddComponentMenu("NGUI/Interaction/NGUI Progress Bar")]
public class UIProgressBar : UIWidgetContainer
{
	// Token: 0x17000042 RID: 66
	// (get) Token: 0x060004BF RID: 1215 RVA: 0x0001F4AC File Offset: 0x0001D6AC
	public Transform cachedTransform
	{
		get
		{
			if (this.mTrans == null)
			{
				this.mTrans = base.transform;
			}
			return this.mTrans;
		}
	}

	// Token: 0x17000043 RID: 67
	// (get) Token: 0x060004C0 RID: 1216 RVA: 0x0001F4D4 File Offset: 0x0001D6D4
	public Camera cachedCamera
	{
		get
		{
			if (this.mCam == null)
			{
				this.mCam = NGUITools.FindCameraForLayer(base.gameObject.layer);
			}
			return this.mCam;
		}
	}

	// Token: 0x17000044 RID: 68
	// (get) Token: 0x060004C1 RID: 1217 RVA: 0x0001F504 File Offset: 0x0001D704
	// (set) Token: 0x060004C2 RID: 1218 RVA: 0x0001F50C File Offset: 0x0001D70C
	public UIWidget foregroundWidget
	{
		get
		{
			return this.mFG;
		}
		set
		{
			if (this.mFG != value)
			{
				this.mFG = value;
				this.mIsDirty = true;
			}
		}
	}

	// Token: 0x17000045 RID: 69
	// (get) Token: 0x060004C3 RID: 1219 RVA: 0x0001F530 File Offset: 0x0001D730
	// (set) Token: 0x060004C4 RID: 1220 RVA: 0x0001F538 File Offset: 0x0001D738
	public UIWidget backgroundWidget
	{
		get
		{
			return this.mBG;
		}
		set
		{
			if (this.mBG != value)
			{
				this.mBG = value;
				this.mIsDirty = true;
			}
		}
	}

	// Token: 0x17000046 RID: 70
	// (get) Token: 0x060004C5 RID: 1221 RVA: 0x0001F55C File Offset: 0x0001D75C
	// (set) Token: 0x060004C6 RID: 1222 RVA: 0x0001F564 File Offset: 0x0001D764
	public UIProgressBar.FillDirection fillDirection
	{
		get
		{
			return this.mFill;
		}
		set
		{
			if (this.mFill != value)
			{
				this.mFill = value;
				if (this.mStarted)
				{
					this.ForceUpdate();
				}
			}
		}
	}

	// Token: 0x17000047 RID: 71
	// (get) Token: 0x060004C7 RID: 1223 RVA: 0x0001F598 File Offset: 0x0001D798
	// (set) Token: 0x060004C8 RID: 1224 RVA: 0x0001F5D8 File Offset: 0x0001D7D8
	public float value
	{
		get
		{
			if (this.numberOfSteps > 1)
			{
				return Mathf.Round(this.mValue * (float)(this.numberOfSteps - 1)) / (float)(this.numberOfSteps - 1);
			}
			return this.mValue;
		}
		set
		{
			this.Set(value, true);
		}
	}

	// Token: 0x17000048 RID: 72
	// (get) Token: 0x060004C9 RID: 1225 RVA: 0x0001F5E4 File Offset: 0x0001D7E4
	// (set) Token: 0x060004CA RID: 1226 RVA: 0x0001F630 File Offset: 0x0001D830
	public float alpha
	{
		get
		{
			if (this.mFG != null)
			{
				return this.mFG.alpha;
			}
			if (this.mBG != null)
			{
				return this.mBG.alpha;
			}
			return 1f;
		}
		set
		{
			if (this.mFG != null)
			{
				this.mFG.alpha = value;
				if (this.mFG.GetComponent<Collider>() != null)
				{
					this.mFG.GetComponent<Collider>().enabled = (this.mFG.alpha > 0.001f);
				}
				else if (this.mFG.GetComponent<Collider2D>() != null)
				{
					this.mFG.GetComponent<Collider2D>().enabled = (this.mFG.alpha > 0.001f);
				}
			}
			if (this.mBG != null)
			{
				this.mBG.alpha = value;
				if (this.mBG.GetComponent<Collider>() != null)
				{
					this.mBG.GetComponent<Collider>().enabled = (this.mBG.alpha > 0.001f);
				}
				else if (this.mBG.GetComponent<Collider2D>() != null)
				{
					this.mBG.GetComponent<Collider2D>().enabled = (this.mBG.alpha > 0.001f);
				}
			}
			if (this.thumb != null)
			{
				UIWidget component = this.thumb.GetComponent<UIWidget>();
				if (component != null)
				{
					component.alpha = value;
					if (component.GetComponent<Collider>() != null)
					{
						component.GetComponent<Collider>().enabled = (component.alpha > 0.001f);
					}
					else if (component.GetComponent<Collider2D>() != null)
					{
						component.GetComponent<Collider2D>().enabled = (component.alpha > 0.001f);
					}
				}
			}
		}
	}

	// Token: 0x17000049 RID: 73
	// (get) Token: 0x060004CB RID: 1227 RVA: 0x0001F7E8 File Offset: 0x0001D9E8
	protected bool isHorizontal
	{
		get
		{
			return this.mFill == UIProgressBar.FillDirection.LeftToRight || this.mFill == UIProgressBar.FillDirection.RightToLeft;
		}
	}

	// Token: 0x1700004A RID: 74
	// (get) Token: 0x060004CC RID: 1228 RVA: 0x0001F804 File Offset: 0x0001DA04
	protected bool isInverted
	{
		get
		{
			return this.mFill == UIProgressBar.FillDirection.RightToLeft || this.mFill == UIProgressBar.FillDirection.TopToBottom;
		}
	}

	// Token: 0x060004CD RID: 1229 RVA: 0x0001F820 File Offset: 0x0001DA20
	public void Set(float val, bool notify = true)
	{
		val = Mathf.Clamp01(val);
		if (this.mValue != val)
		{
			float value = this.value;
			this.mValue = val;
			if (this.mStarted && value != this.value)
			{
				this.ForceUpdate();
				if (notify && NGUITools.GetActive(this) && EventDelegate.IsValid(this.onChange))
				{
					UIProgressBar.current = this;
					EventDelegate.Execute(this.onChange);
					UIProgressBar.current = null;
				}
			}
		}
	}

	// Token: 0x060004CE RID: 1230 RVA: 0x0001F8A4 File Offset: 0x0001DAA4
	public void Start()
	{
		if (this.mStarted)
		{
			return;
		}
		this.mStarted = true;
		this.Upgrade();
		if (Application.isPlaying)
		{
			if (this.mBG != null)
			{
				this.mBG.autoResizeBoxCollider = true;
			}
			this.OnStart();
			if (UIProgressBar.current == null && this.onChange != null)
			{
				UIProgressBar.current = this;
				EventDelegate.Execute(this.onChange);
				UIProgressBar.current = null;
			}
		}
		this.ForceUpdate();
	}

	// Token: 0x060004CF RID: 1231 RVA: 0x0001F930 File Offset: 0x0001DB30
	protected virtual void Upgrade()
	{
	}

	// Token: 0x060004D0 RID: 1232 RVA: 0x0001F934 File Offset: 0x0001DB34
	protected virtual void OnStart()
	{
	}

	// Token: 0x060004D1 RID: 1233 RVA: 0x0001F938 File Offset: 0x0001DB38
	protected void Update()
	{
		if (this.mIsDirty)
		{
			this.ForceUpdate();
		}
	}

	// Token: 0x060004D2 RID: 1234 RVA: 0x0001F94C File Offset: 0x0001DB4C
	protected void OnValidate()
	{
		if (NGUITools.GetActive(this))
		{
			this.Upgrade();
			this.mIsDirty = true;
			float num = Mathf.Clamp01(this.mValue);
			if (this.mValue != num)
			{
				this.mValue = num;
			}
			if (this.numberOfSteps < 0)
			{
				this.numberOfSteps = 0;
			}
			else if (this.numberOfSteps > 20)
			{
				this.numberOfSteps = 20;
			}
			this.ForceUpdate();
		}
		else
		{
			float num2 = Mathf.Clamp01(this.mValue);
			if (this.mValue != num2)
			{
				this.mValue = num2;
			}
			if (this.numberOfSteps < 0)
			{
				this.numberOfSteps = 0;
			}
			else if (this.numberOfSteps > 20)
			{
				this.numberOfSteps = 20;
			}
		}
	}

	// Token: 0x060004D3 RID: 1235 RVA: 0x0001FA14 File Offset: 0x0001DC14
	protected float ScreenToValue(Vector2 screenPos)
	{
		Transform cachedTransform = this.cachedTransform;
		Plane plane;
		plane..ctor(cachedTransform.rotation * Vector3.back, cachedTransform.position);
		Ray ray = this.cachedCamera.ScreenPointToRay(screenPos);
		float num;
		if (!plane.Raycast(ray, ref num))
		{
			return this.value;
		}
		return this.LocalToValue(cachedTransform.InverseTransformPoint(ray.GetPoint(num)));
	}

	// Token: 0x060004D4 RID: 1236 RVA: 0x0001FA88 File Offset: 0x0001DC88
	protected virtual float LocalToValue(Vector2 localPos)
	{
		if (!(this.mFG != null))
		{
			return this.value;
		}
		Vector3[] localCorners = this.mFG.localCorners;
		Vector3 vector = localCorners[2] - localCorners[0];
		if (this.isHorizontal)
		{
			float num = (localPos.x - localCorners[0].x) / vector.x;
			return (!this.isInverted) ? num : (1f - num);
		}
		float num2 = (localPos.y - localCorners[0].y) / vector.y;
		return (!this.isInverted) ? num2 : (1f - num2);
	}

	// Token: 0x060004D5 RID: 1237 RVA: 0x0001FB50 File Offset: 0x0001DD50
	public virtual void ForceUpdate()
	{
		this.mIsDirty = false;
		bool flag = false;
		if (this.mFG != null)
		{
			UIBasicSprite uibasicSprite = this.mFG as UIBasicSprite;
			if (this.isHorizontal)
			{
				if (uibasicSprite != null && uibasicSprite.type == UIBasicSprite.Type.Filled)
				{
					if (uibasicSprite.fillDirection == UIBasicSprite.FillDirection.Horizontal || uibasicSprite.fillDirection == UIBasicSprite.FillDirection.Vertical)
					{
						uibasicSprite.fillDirection = UIBasicSprite.FillDirection.Horizontal;
						uibasicSprite.invert = this.isInverted;
					}
					uibasicSprite.fillAmount = this.value;
				}
				else
				{
					this.mFG.drawRegion = ((!this.isInverted) ? new Vector4(0f, 0f, this.value, 1f) : new Vector4(1f - this.value, 0f, 1f, 1f));
					this.mFG.enabled = true;
					flag = (this.value < 0.001f);
				}
			}
			else if (uibasicSprite != null && uibasicSprite.type == UIBasicSprite.Type.Filled)
			{
				if (uibasicSprite.fillDirection == UIBasicSprite.FillDirection.Horizontal || uibasicSprite.fillDirection == UIBasicSprite.FillDirection.Vertical)
				{
					uibasicSprite.fillDirection = UIBasicSprite.FillDirection.Vertical;
					uibasicSprite.invert = this.isInverted;
				}
				uibasicSprite.fillAmount = this.value;
			}
			else
			{
				this.mFG.drawRegion = ((!this.isInverted) ? new Vector4(0f, 0f, 1f, this.value) : new Vector4(0f, 1f - this.value, 1f, 1f));
				this.mFG.enabled = true;
				flag = (this.value < 0.001f);
			}
		}
		if (this.thumb != null && (this.mFG != null || this.mBG != null))
		{
			Vector3[] array = (!(this.mFG != null)) ? this.mBG.localCorners : this.mFG.localCorners;
			Vector4 vector = (!(this.mFG != null)) ? this.mBG.border : this.mFG.border;
			Vector3[] array2 = array;
			int num = 0;
			array2[num].x = array2[num].x + vector.x;
			Vector3[] array3 = array;
			int num2 = 1;
			array3[num2].x = array3[num2].x + vector.x;
			Vector3[] array4 = array;
			int num3 = 2;
			array4[num3].x = array4[num3].x - vector.z;
			Vector3[] array5 = array;
			int num4 = 3;
			array5[num4].x = array5[num4].x - vector.z;
			Vector3[] array6 = array;
			int num5 = 0;
			array6[num5].y = array6[num5].y + vector.y;
			Vector3[] array7 = array;
			int num6 = 1;
			array7[num6].y = array7[num6].y - vector.w;
			Vector3[] array8 = array;
			int num7 = 2;
			array8[num7].y = array8[num7].y - vector.w;
			Vector3[] array9 = array;
			int num8 = 3;
			array9[num8].y = array9[num8].y + vector.y;
			Transform transform = (!(this.mFG != null)) ? this.mBG.cachedTransform : this.mFG.cachedTransform;
			for (int i = 0; i < 4; i++)
			{
				array[i] = transform.TransformPoint(array[i]);
			}
			if (this.isHorizontal)
			{
				Vector3 vector2 = Vector3.Lerp(array[0], array[1], 0.5f);
				Vector3 vector3 = Vector3.Lerp(array[2], array[3], 0.5f);
				this.SetThumbPosition(Vector3.Lerp(vector2, vector3, (!this.isInverted) ? this.value : (1f - this.value)));
			}
			else
			{
				Vector3 vector4 = Vector3.Lerp(array[0], array[3], 0.5f);
				Vector3 vector5 = Vector3.Lerp(array[1], array[2], 0.5f);
				this.SetThumbPosition(Vector3.Lerp(vector4, vector5, (!this.isInverted) ? this.value : (1f - this.value)));
			}
		}
		if (flag)
		{
			this.mFG.enabled = false;
		}
	}

	// Token: 0x060004D6 RID: 1238 RVA: 0x0001FFF0 File Offset: 0x0001E1F0
	protected void SetThumbPosition(Vector3 worldPos)
	{
		Transform parent = this.thumb.parent;
		if (parent != null)
		{
			worldPos = parent.InverseTransformPoint(worldPos);
			worldPos.x = Mathf.Round(worldPos.x);
			worldPos.y = Mathf.Round(worldPos.y);
			worldPos.z = 0f;
			if (Vector3.Distance(this.thumb.localPosition, worldPos) > 0.001f)
			{
				this.thumb.localPosition = worldPos;
			}
		}
		else if (Vector3.Distance(this.thumb.position, worldPos) > 1E-05f)
		{
			this.thumb.position = worldPos;
		}
	}

	// Token: 0x060004D7 RID: 1239 RVA: 0x000200A4 File Offset: 0x0001E2A4
	public virtual void OnPan(Vector2 delta)
	{
		if (base.enabled)
		{
			switch (this.mFill)
			{
			case UIProgressBar.FillDirection.LeftToRight:
			{
				float value = Mathf.Clamp01(this.mValue + delta.x);
				this.value = value;
				this.mValue = value;
				break;
			}
			case UIProgressBar.FillDirection.RightToLeft:
			{
				float value2 = Mathf.Clamp01(this.mValue - delta.x);
				this.value = value2;
				this.mValue = value2;
				break;
			}
			case UIProgressBar.FillDirection.BottomToTop:
			{
				float value3 = Mathf.Clamp01(this.mValue + delta.y);
				this.value = value3;
				this.mValue = value3;
				break;
			}
			case UIProgressBar.FillDirection.TopToBottom:
			{
				float value4 = Mathf.Clamp01(this.mValue - delta.y);
				this.value = value4;
				this.mValue = value4;
				break;
			}
			}
		}
	}

	// Token: 0x04000516 RID: 1302
	public static UIProgressBar current;

	// Token: 0x04000517 RID: 1303
	public UIProgressBar.OnDragFinished onDragFinished;

	// Token: 0x04000518 RID: 1304
	public Transform thumb;

	// Token: 0x04000519 RID: 1305
	[HideInInspector]
	[SerializeField]
	protected UIWidget mBG;

	// Token: 0x0400051A RID: 1306
	[SerializeField]
	[HideInInspector]
	protected UIWidget mFG;

	// Token: 0x0400051B RID: 1307
	[HideInInspector]
	[SerializeField]
	protected float mValue = 1f;

	// Token: 0x0400051C RID: 1308
	[SerializeField]
	[HideInInspector]
	protected UIProgressBar.FillDirection mFill;

	// Token: 0x0400051D RID: 1309
	[NonSerialized]
	protected bool mStarted;

	// Token: 0x0400051E RID: 1310
	[NonSerialized]
	protected Transform mTrans;

	// Token: 0x0400051F RID: 1311
	[NonSerialized]
	protected bool mIsDirty;

	// Token: 0x04000520 RID: 1312
	[NonSerialized]
	protected Camera mCam;

	// Token: 0x04000521 RID: 1313
	[NonSerialized]
	protected float mOffset;

	// Token: 0x04000522 RID: 1314
	public int numberOfSteps;

	// Token: 0x04000523 RID: 1315
	public List<EventDelegate> onChange = new List<EventDelegate>();

	// Token: 0x020000BC RID: 188
	public enum FillDirection
	{
		// Token: 0x04000525 RID: 1317
		LeftToRight,
		// Token: 0x04000526 RID: 1318
		RightToLeft,
		// Token: 0x04000527 RID: 1319
		BottomToTop,
		// Token: 0x04000528 RID: 1320
		TopToBottom
	}

	// Token: 0x02000338 RID: 824
	// (Invoke) Token: 0x06001502 RID: 5378
	public delegate void OnDragFinished();
}
