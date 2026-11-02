using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200011C RID: 284
[RequireComponent(typeof(UITexture))]
public class UIColorPicker : MonoBehaviour
{
	// Token: 0x060008C9 RID: 2249 RVA: 0x00040D70 File Offset: 0x0003EF70
	private void Start()
	{
		this.mTrans = base.transform;
		this.mUITex = base.GetComponent<UITexture>();
		this.mCam = UICamera.FindCameraForLayer(base.gameObject.layer);
		this.mWidth = this.mUITex.width;
		this.mHeight = this.mUITex.height;
		Color[] array = new Color[this.mWidth * this.mHeight];
		for (int i = 0; i < this.mHeight; i++)
		{
			float y = ((float)i - 1f) / (float)this.mHeight;
			for (int j = 0; j < this.mWidth; j++)
			{
				float x = ((float)j - 1f) / (float)this.mWidth;
				int num = j + i * this.mWidth;
				array[num] = UIColorPicker.Sample(x, y);
			}
		}
		this.mTex = new Texture2D(this.mWidth, this.mHeight, 3, false);
		this.mTex.SetPixels(array);
		this.mTex.filterMode = 2;
		this.mTex.wrapMode = 1;
		this.mTex.Apply();
		this.mUITex.mainTexture = this.mTex;
		this.Select(this.value);
	}

	// Token: 0x060008CA RID: 2250 RVA: 0x00040EB8 File Offset: 0x0003F0B8
	private void OnDestroy()
	{
		Object.Destroy(this.mTex);
		this.mTex = null;
	}

	// Token: 0x060008CB RID: 2251 RVA: 0x00040ECC File Offset: 0x0003F0CC
	private void OnPress(bool pressed)
	{
		if (base.enabled && pressed && UICamera.currentScheme != UICamera.ControlScheme.Controller)
		{
			this.Sample();
		}
	}

	// Token: 0x060008CC RID: 2252 RVA: 0x00040EFC File Offset: 0x0003F0FC
	private void OnDrag(Vector2 delta)
	{
		if (base.enabled)
		{
			this.Sample();
		}
	}

	// Token: 0x060008CD RID: 2253 RVA: 0x00040F10 File Offset: 0x0003F110
	private void OnPan(Vector2 delta)
	{
		if (base.enabled)
		{
			this.mPos.x = Mathf.Clamp01(this.mPos.x + delta.x);
			this.mPos.y = Mathf.Clamp01(this.mPos.y + delta.y);
			this.Select(this.mPos);
		}
	}

	// Token: 0x060008CE RID: 2254 RVA: 0x00040F7C File Offset: 0x0003F17C
	private void Sample()
	{
		Vector3 vector = UICamera.lastEventPosition;
		vector = this.mCam.cachedCamera.ScreenToWorldPoint(vector);
		vector = this.mTrans.InverseTransformPoint(vector);
		Vector3[] localCorners = this.mUITex.localCorners;
		this.mPos.x = Mathf.Clamp01((vector.x - localCorners[0].x) / (localCorners[2].x - localCorners[0].x));
		this.mPos.y = Mathf.Clamp01((vector.y - localCorners[0].y) / (localCorners[2].y - localCorners[0].y));
		if (this.selectionWidget != null)
		{
			vector.x = Mathf.Lerp(localCorners[0].x, localCorners[2].x, this.mPos.x);
			vector.y = Mathf.Lerp(localCorners[0].y, localCorners[2].y, this.mPos.y);
			vector = this.mTrans.TransformPoint(vector);
			this.selectionWidget.transform.OverlayPosition(vector, this.mCam.cachedCamera);
		}
		this.value = UIColorPicker.Sample(this.mPos.x, this.mPos.y);
		UIColorPicker.current = this;
		EventDelegate.Execute(this.onChange);
		UIColorPicker.current = null;
	}

	// Token: 0x060008CF RID: 2255 RVA: 0x0004110C File Offset: 0x0003F30C
	public void Select(Vector2 v)
	{
		v.x = Mathf.Clamp01(v.x);
		v.y = Mathf.Clamp01(v.y);
		this.mPos = v;
		if (this.selectionWidget != null)
		{
			Vector3[] localCorners = this.mUITex.localCorners;
			v.x = Mathf.Lerp(localCorners[0].x, localCorners[2].x, this.mPos.x);
			v.y = Mathf.Lerp(localCorners[0].y, localCorners[2].y, this.mPos.y);
			v = this.mTrans.TransformPoint(v);
			this.selectionWidget.transform.OverlayPosition(v, this.mCam.cachedCamera);
		}
		this.value = UIColorPicker.Sample(this.mPos.x, this.mPos.y);
		UIColorPicker.current = this;
		EventDelegate.Execute(this.onChange);
		UIColorPicker.current = null;
	}

	// Token: 0x060008D0 RID: 2256 RVA: 0x00041234 File Offset: 0x0003F434
	public Vector2 Select(Color c)
	{
		if (this.mUITex == null)
		{
			this.value = c;
			return this.mPos;
		}
		float num = float.MaxValue;
		for (int i = 0; i < this.mHeight; i++)
		{
			float y = ((float)i - 1f) / (float)this.mHeight;
			for (int j = 0; j < this.mWidth; j++)
			{
				float x = ((float)j - 1f) / (float)this.mWidth;
				Color color = UIColorPicker.Sample(x, y);
				Color color2 = color;
				color2.r -= c.r;
				color2.g -= c.g;
				color2.b -= c.b;
				float num2 = color2.r * color2.r + color2.g * color2.g + color2.b * color2.b;
				if (num2 < num)
				{
					num = num2;
					this.mPos.x = x;
					this.mPos.y = y;
				}
			}
		}
		if (this.selectionWidget != null)
		{
			Vector3[] localCorners = this.mUITex.localCorners;
			Vector3 vector;
			vector.x = Mathf.Lerp(localCorners[0].x, localCorners[2].x, this.mPos.x);
			vector.y = Mathf.Lerp(localCorners[0].y, localCorners[2].y, this.mPos.y);
			vector.z = 0f;
			vector = this.mTrans.TransformPoint(vector);
			this.selectionWidget.transform.OverlayPosition(vector, this.mCam.cachedCamera);
		}
		this.value = c;
		UIColorPicker.current = this;
		EventDelegate.Execute(this.onChange);
		UIColorPicker.current = null;
		return this.mPos;
	}

	// Token: 0x060008D1 RID: 2257 RVA: 0x00041438 File Offset: 0x0003F638
	public static Color Sample(float x, float y)
	{
		if (UIColorPicker.mRed == null)
		{
			UIColorPicker.mRed = new AnimationCurve(new Keyframe[]
			{
				new Keyframe(0f, 1f),
				new Keyframe(0.14285715f, 1f),
				new Keyframe(0.2857143f, 0f),
				new Keyframe(0.42857143f, 0f),
				new Keyframe(0.5714286f, 0f),
				new Keyframe(0.71428573f, 1f),
				new Keyframe(0.85714287f, 1f),
				new Keyframe(1f, 0.5f)
			});
			UIColorPicker.mGreen = new AnimationCurve(new Keyframe[]
			{
				new Keyframe(0f, 0f),
				new Keyframe(0.14285715f, 1f),
				new Keyframe(0.2857143f, 1f),
				new Keyframe(0.42857143f, 1f),
				new Keyframe(0.5714286f, 0f),
				new Keyframe(0.71428573f, 0f),
				new Keyframe(0.85714287f, 0f),
				new Keyframe(1f, 0.5f)
			});
			UIColorPicker.mBlue = new AnimationCurve(new Keyframe[]
			{
				new Keyframe(0f, 0f),
				new Keyframe(0.14285715f, 0f),
				new Keyframe(0.2857143f, 0f),
				new Keyframe(0.42857143f, 1f),
				new Keyframe(0.5714286f, 1f),
				new Keyframe(0.71428573f, 1f),
				new Keyframe(0.85714287f, 0f),
				new Keyframe(1f, 0.5f)
			});
		}
		Vector3 vector;
		vector..ctor(UIColorPicker.mRed.Evaluate(x), UIColorPicker.mGreen.Evaluate(x), UIColorPicker.mBlue.Evaluate(x));
		if (y < 0.5f)
		{
			y *= 2f;
			vector.x *= y;
			vector.y *= y;
			vector.z *= y;
		}
		else
		{
			vector = Vector3.Lerp(vector, Vector3.one, y * 2f - 1f);
		}
		return new Color(vector.x, vector.y, vector.z, 1f);
	}

	// Token: 0x04000856 RID: 2134
	public static UIColorPicker current;

	// Token: 0x04000857 RID: 2135
	public Color value = Color.white;

	// Token: 0x04000858 RID: 2136
	public UIWidget selectionWidget;

	// Token: 0x04000859 RID: 2137
	public List<EventDelegate> onChange = new List<EventDelegate>();

	// Token: 0x0400085A RID: 2138
	[NonSerialized]
	private Transform mTrans;

	// Token: 0x0400085B RID: 2139
	[NonSerialized]
	private UITexture mUITex;

	// Token: 0x0400085C RID: 2140
	[NonSerialized]
	private Texture2D mTex;

	// Token: 0x0400085D RID: 2141
	[NonSerialized]
	private UICamera mCam;

	// Token: 0x0400085E RID: 2142
	[NonSerialized]
	private Vector2 mPos;

	// Token: 0x0400085F RID: 2143
	[NonSerialized]
	private int mWidth;

	// Token: 0x04000860 RID: 2144
	[NonSerialized]
	private int mHeight;

	// Token: 0x04000861 RID: 2145
	private static AnimationCurve mRed;

	// Token: 0x04000862 RID: 2146
	private static AnimationCurve mGreen;

	// Token: 0x04000863 RID: 2147
	private static AnimationCurve mBlue;
}
