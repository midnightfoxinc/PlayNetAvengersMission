using System;
using UnityEngine;

// Token: 0x02000138 RID: 312
[AddComponentMenu("NGUI/UI/Tooltip")]
public class UITooltip : MonoBehaviour
{
	// Token: 0x170001A3 RID: 419
	// (get) Token: 0x06000A6A RID: 2666 RVA: 0x0004C8C4 File Offset: 0x0004AAC4
	public static bool isVisible
	{
		get
		{
			return UITooltip.mInstance != null && UITooltip.mInstance.mTarget == 1f;
		}
	}

	// Token: 0x06000A6B RID: 2667 RVA: 0x0004C8F8 File Offset: 0x0004AAF8
	private void Awake()
	{
		UITooltip.mInstance = this;
	}

	// Token: 0x06000A6C RID: 2668 RVA: 0x0004C900 File Offset: 0x0004AB00
	private void OnDestroy()
	{
		UITooltip.mInstance = null;
	}

	// Token: 0x06000A6D RID: 2669 RVA: 0x0004C908 File Offset: 0x0004AB08
	protected virtual void Start()
	{
		this.mTrans = base.transform;
		this.mWidgets = base.GetComponentsInChildren<UIWidget>();
		this.mPos = this.mTrans.localPosition;
		if (this.uiCamera == null)
		{
			this.uiCamera = NGUITools.FindCameraForLayer(base.gameObject.layer);
		}
		this.SetAlpha(0f);
	}

	// Token: 0x06000A6E RID: 2670 RVA: 0x0004C970 File Offset: 0x0004AB70
	protected virtual void Update()
	{
		if (this.mTooltip != UICamera.tooltipObject)
		{
			this.mTooltip = null;
			this.mTarget = 0f;
		}
		if (this.mCurrent != this.mTarget)
		{
			this.mCurrent = Mathf.Lerp(this.mCurrent, this.mTarget, RealTime.deltaTime * this.appearSpeed);
			if (Mathf.Abs(this.mCurrent - this.mTarget) < 0.001f)
			{
				this.mCurrent = this.mTarget;
			}
			this.SetAlpha(this.mCurrent * this.mCurrent);
			if (this.scalingTransitions)
			{
				Vector3 vector = this.mSize * 0.25f;
				vector.y = -vector.y;
				Vector3 localScale = Vector3.one * (1.5f - this.mCurrent * 0.5f);
				Vector3 localPosition = Vector3.Lerp(this.mPos - vector, this.mPos, this.mCurrent);
				this.mTrans.localPosition = localPosition;
				this.mTrans.localScale = localScale;
			}
		}
	}

	// Token: 0x06000A6F RID: 2671 RVA: 0x0004CA94 File Offset: 0x0004AC94
	protected virtual void SetAlpha(float val)
	{
		int i = 0;
		int num = this.mWidgets.Length;
		while (i < num)
		{
			UIWidget uiwidget = this.mWidgets[i];
			Color color = uiwidget.color;
			color.a = val;
			uiwidget.color = color;
			i++;
		}
	}

	// Token: 0x06000A70 RID: 2672 RVA: 0x0004CADC File Offset: 0x0004ACDC
	protected virtual void SetText(string tooltipText)
	{
		if (this.text != null && !string.IsNullOrEmpty(tooltipText))
		{
			this.mTarget = 1f;
			this.mTooltip = UICamera.tooltipObject;
			this.text.text = tooltipText;
			this.mPos = UICamera.lastEventPosition;
			Transform transform = this.text.transform;
			Vector3 localPosition = transform.localPosition;
			Vector3 localScale = transform.localScale;
			this.mSize = this.text.printedSize;
			this.mSize.x = this.mSize.x * localScale.x;
			this.mSize.y = this.mSize.y * localScale.y;
			if (this.background != null)
			{
				Vector4 border = this.background.border;
				this.mSize.x = this.mSize.x + (border.x + border.z + (localPosition.x - border.x) * 2f);
				this.mSize.y = this.mSize.y + (border.y + border.w + (-localPosition.y - border.y) * 2f);
				this.background.width = Mathf.RoundToInt(this.mSize.x);
				this.background.height = Mathf.RoundToInt(this.mSize.y);
			}
			if (this.uiCamera != null)
			{
				this.mPos.x = Mathf.Clamp01(this.mPos.x / (float)Screen.width);
				this.mPos.y = Mathf.Clamp01(this.mPos.y / (float)Screen.height);
				float num = this.uiCamera.orthographicSize / this.mTrans.parent.lossyScale.y;
				float num2 = (float)Screen.height * 0.5f / num;
				Vector2 vector;
				vector..ctor(num2 * this.mSize.x / (float)Screen.width, num2 * this.mSize.y / (float)Screen.height);
				this.mPos.x = Mathf.Min(this.mPos.x, 1f - vector.x);
				this.mPos.y = Mathf.Max(this.mPos.y, vector.y);
				this.mTrans.position = this.uiCamera.ViewportToWorldPoint(this.mPos);
				this.mPos = this.mTrans.localPosition;
				this.mPos.x = Mathf.Round(this.mPos.x);
				this.mPos.y = Mathf.Round(this.mPos.y);
			}
			else
			{
				if (this.mPos.x + this.mSize.x > (float)Screen.width)
				{
					this.mPos.x = (float)Screen.width - this.mSize.x;
				}
				if (this.mPos.y - this.mSize.y < 0f)
				{
					this.mPos.y = this.mSize.y;
				}
				this.mPos.x = this.mPos.x - (float)Screen.width * 0.5f;
				this.mPos.y = this.mPos.y - (float)Screen.height * 0.5f;
			}
			this.mTrans.localPosition = this.mPos;
			if (this.tooltipRoot != null)
			{
				this.tooltipRoot.BroadcastMessage("UpdateAnchors");
			}
			else
			{
				this.text.BroadcastMessage("UpdateAnchors");
			}
		}
		else
		{
			this.mTooltip = null;
			this.mTarget = 0f;
		}
	}

	// Token: 0x06000A71 RID: 2673 RVA: 0x0004CEDC File Offset: 0x0004B0DC
	[Obsolete("Use UITooltip.Show instead")]
	public static void ShowText(string text)
	{
		if (UITooltip.mInstance != null)
		{
			UITooltip.mInstance.SetText(text);
		}
	}

	// Token: 0x06000A72 RID: 2674 RVA: 0x0004CEFC File Offset: 0x0004B0FC
	public static void Show(string text)
	{
		if (UITooltip.mInstance != null)
		{
			UITooltip.mInstance.SetText(text);
		}
	}

	// Token: 0x06000A73 RID: 2675 RVA: 0x0004CF1C File Offset: 0x0004B11C
	public static void Hide()
	{
		if (UITooltip.mInstance != null)
		{
			UITooltip.mInstance.mTooltip = null;
			UITooltip.mInstance.mTarget = 0f;
		}
	}

	// Token: 0x0400097F RID: 2431
	protected static UITooltip mInstance;

	// Token: 0x04000980 RID: 2432
	public Camera uiCamera;

	// Token: 0x04000981 RID: 2433
	public UILabel text;

	// Token: 0x04000982 RID: 2434
	public GameObject tooltipRoot;

	// Token: 0x04000983 RID: 2435
	public UISprite background;

	// Token: 0x04000984 RID: 2436
	public float appearSpeed = 10f;

	// Token: 0x04000985 RID: 2437
	public bool scalingTransitions = true;

	// Token: 0x04000986 RID: 2438
	protected GameObject mTooltip;

	// Token: 0x04000987 RID: 2439
	protected Transform mTrans;

	// Token: 0x04000988 RID: 2440
	protected float mTarget;

	// Token: 0x04000989 RID: 2441
	protected float mCurrent;

	// Token: 0x0400098A RID: 2442
	protected Vector3 mPos;

	// Token: 0x0400098B RID: 2443
	protected Vector3 mSize = Vector3.zero;

	// Token: 0x0400098C RID: 2444
	protected UIWidget[] mWidgets;
}
