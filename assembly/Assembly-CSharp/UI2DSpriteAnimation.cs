using System;
using UnityEngine;

// Token: 0x0200010E RID: 270
public class UI2DSpriteAnimation : MonoBehaviour
{
	// Token: 0x170000F5 RID: 245
	// (get) Token: 0x06000853 RID: 2131 RVA: 0x0003BB88 File Offset: 0x00039D88
	public bool isPlaying
	{
		get
		{
			return base.enabled;
		}
	}

	// Token: 0x170000F6 RID: 246
	// (get) Token: 0x06000854 RID: 2132 RVA: 0x0003BB90 File Offset: 0x00039D90
	// (set) Token: 0x06000855 RID: 2133 RVA: 0x0003BB98 File Offset: 0x00039D98
	public int framesPerSecond
	{
		get
		{
			return this.framerate;
		}
		set
		{
			this.framerate = value;
		}
	}

	// Token: 0x06000856 RID: 2134 RVA: 0x0003BBA4 File Offset: 0x00039DA4
	public void Play()
	{
		if (this.frames != null && this.frames.Length > 0)
		{
			if (!base.enabled && !this.loop)
			{
				int num = (this.framerate <= 0) ? (this.mIndex - 1) : (this.mIndex + 1);
				if (num < 0 || num >= this.frames.Length)
				{
					this.mIndex = ((this.framerate >= 0) ? 0 : (this.frames.Length - 1));
				}
			}
			base.enabled = true;
			this.UpdateSprite();
		}
	}

	// Token: 0x06000857 RID: 2135 RVA: 0x0003BC48 File Offset: 0x00039E48
	public void Pause()
	{
		base.enabled = false;
	}

	// Token: 0x06000858 RID: 2136 RVA: 0x0003BC54 File Offset: 0x00039E54
	public void ResetToBeginning()
	{
		this.mIndex = ((this.framerate >= 0) ? 0 : (this.frames.Length - 1));
		this.UpdateSprite();
	}

	// Token: 0x06000859 RID: 2137 RVA: 0x0003BC8C File Offset: 0x00039E8C
	private void Start()
	{
		this.Play();
	}

	// Token: 0x0600085A RID: 2138 RVA: 0x0003BC94 File Offset: 0x00039E94
	private void Update()
	{
		if (this.frames == null || this.frames.Length == 0)
		{
			base.enabled = false;
		}
		else if (this.framerate != 0)
		{
			float num = (!this.ignoreTimeScale) ? Time.time : RealTime.time;
			if (this.mUpdate < num)
			{
				this.mUpdate = num;
				int num2 = (this.framerate <= 0) ? (this.mIndex - 1) : (this.mIndex + 1);
				if (!this.loop && (num2 < 0 || num2 >= this.frames.Length))
				{
					base.enabled = false;
					return;
				}
				this.mIndex = NGUIMath.RepeatIndex(num2, this.frames.Length);
				this.UpdateSprite();
			}
		}
	}

	// Token: 0x0600085B RID: 2139 RVA: 0x0003BD64 File Offset: 0x00039F64
	private void UpdateSprite()
	{
		if (this.mUnitySprite == null && this.mNguiSprite == null)
		{
			this.mUnitySprite = base.GetComponent<SpriteRenderer>();
			this.mNguiSprite = base.GetComponent<UI2DSprite>();
			if (this.mUnitySprite == null && this.mNguiSprite == null)
			{
				base.enabled = false;
				return;
			}
		}
		float num = (!this.ignoreTimeScale) ? Time.time : RealTime.time;
		if (this.framerate != 0)
		{
			this.mUpdate = num + Mathf.Abs(1f / (float)this.framerate);
		}
		if (this.mUnitySprite != null)
		{
			this.mUnitySprite.sprite = this.frames[this.mIndex];
		}
		else if (this.mNguiSprite != null)
		{
			this.mNguiSprite.nextSprite = this.frames[this.mIndex];
		}
	}

	// Token: 0x04000799 RID: 1945
	[SerializeField]
	protected int framerate = 20;

	// Token: 0x0400079A RID: 1946
	public bool ignoreTimeScale = true;

	// Token: 0x0400079B RID: 1947
	public bool loop = true;

	// Token: 0x0400079C RID: 1948
	public Sprite[] frames;

	// Token: 0x0400079D RID: 1949
	private SpriteRenderer mUnitySprite;

	// Token: 0x0400079E RID: 1950
	private UI2DSprite mNguiSprite;

	// Token: 0x0400079F RID: 1951
	private int mIndex;

	// Token: 0x040007A0 RID: 1952
	private float mUpdate;
}
