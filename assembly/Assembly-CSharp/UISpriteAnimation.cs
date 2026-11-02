using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000130 RID: 304
[RequireComponent(typeof(UISprite))]
[ExecuteInEditMode]
[AddComponentMenu("NGUI/UI/Sprite Animation")]
public class UISpriteAnimation : MonoBehaviour
{
	// Token: 0x1700018F RID: 399
	// (get) Token: 0x06000A28 RID: 2600 RVA: 0x0004ABFC File Offset: 0x00048DFC
	public int frames
	{
		get
		{
			return this.mSpriteNames.Count;
		}
	}

	// Token: 0x17000190 RID: 400
	// (get) Token: 0x06000A29 RID: 2601 RVA: 0x0004AC0C File Offset: 0x00048E0C
	// (set) Token: 0x06000A2A RID: 2602 RVA: 0x0004AC14 File Offset: 0x00048E14
	public int framesPerSecond
	{
		get
		{
			return this.mFPS;
		}
		set
		{
			this.mFPS = value;
		}
	}

	// Token: 0x17000191 RID: 401
	// (get) Token: 0x06000A2B RID: 2603 RVA: 0x0004AC20 File Offset: 0x00048E20
	// (set) Token: 0x06000A2C RID: 2604 RVA: 0x0004AC28 File Offset: 0x00048E28
	public string namePrefix
	{
		get
		{
			return this.mPrefix;
		}
		set
		{
			if (this.mPrefix != value)
			{
				this.mPrefix = value;
				this.RebuildSpriteList();
			}
		}
	}

	// Token: 0x17000192 RID: 402
	// (get) Token: 0x06000A2D RID: 2605 RVA: 0x0004AC48 File Offset: 0x00048E48
	// (set) Token: 0x06000A2E RID: 2606 RVA: 0x0004AC50 File Offset: 0x00048E50
	public bool loop
	{
		get
		{
			return this.mLoop;
		}
		set
		{
			this.mLoop = value;
		}
	}

	// Token: 0x17000193 RID: 403
	// (get) Token: 0x06000A2F RID: 2607 RVA: 0x0004AC5C File Offset: 0x00048E5C
	public bool isPlaying
	{
		get
		{
			return this.mActive;
		}
	}

	// Token: 0x06000A30 RID: 2608 RVA: 0x0004AC64 File Offset: 0x00048E64
	protected virtual void Start()
	{
		this.RebuildSpriteList();
	}

	// Token: 0x06000A31 RID: 2609 RVA: 0x0004AC6C File Offset: 0x00048E6C
	protected virtual void Update()
	{
		if (this.mActive && this.mSpriteNames.Count > 1 && Application.isPlaying && this.mFPS > 0)
		{
			this.mDelta += Mathf.Min(1f, RealTime.deltaTime);
			float num = 1f / (float)this.mFPS;
			while (num < this.mDelta)
			{
				this.mDelta = ((num <= 0f) ? 0f : (this.mDelta - num));
				if (++this.mIndex >= this.mSpriteNames.Count)
				{
					this.mIndex = 0;
					this.mActive = this.mLoop;
				}
				if (this.mActive)
				{
					this.mSprite.spriteName = this.mSpriteNames[this.mIndex];
					if (this.mSnap)
					{
						this.mSprite.MakePixelPerfect();
					}
				}
			}
		}
	}

	// Token: 0x06000A32 RID: 2610 RVA: 0x0004AD7C File Offset: 0x00048F7C
	public void RebuildSpriteList()
	{
		if (this.mSprite == null)
		{
			this.mSprite = base.GetComponent<UISprite>();
		}
		this.mSpriteNames.Clear();
		if (this.mSprite != null && this.mSprite.atlas != null)
		{
			List<UISpriteData> spriteList = this.mSprite.atlas.spriteList;
			int i = 0;
			int count = spriteList.Count;
			while (i < count)
			{
				UISpriteData uispriteData = spriteList[i];
				if (string.IsNullOrEmpty(this.mPrefix) || uispriteData.name.StartsWith(this.mPrefix))
				{
					this.mSpriteNames.Add(uispriteData.name);
				}
				i++;
			}
			this.mSpriteNames.Sort();
		}
	}

	// Token: 0x06000A33 RID: 2611 RVA: 0x0004AE4C File Offset: 0x0004904C
	public void Play()
	{
		this.mActive = true;
	}

	// Token: 0x06000A34 RID: 2612 RVA: 0x0004AE58 File Offset: 0x00049058
	public void Pause()
	{
		this.mActive = false;
	}

	// Token: 0x06000A35 RID: 2613 RVA: 0x0004AE64 File Offset: 0x00049064
	public void ResetToBeginning()
	{
		this.mActive = true;
		this.mIndex = 0;
		if (this.mSprite != null && this.mSpriteNames.Count > 0)
		{
			this.mSprite.spriteName = this.mSpriteNames[this.mIndex];
			if (this.mSnap)
			{
				this.mSprite.MakePixelPerfect();
			}
		}
	}

	// Token: 0x0400093A RID: 2362
	[HideInInspector]
	[SerializeField]
	protected int mFPS = 30;

	// Token: 0x0400093B RID: 2363
	[HideInInspector]
	[SerializeField]
	protected string mPrefix = string.Empty;

	// Token: 0x0400093C RID: 2364
	[SerializeField]
	[HideInInspector]
	protected bool mLoop = true;

	// Token: 0x0400093D RID: 2365
	[SerializeField]
	[HideInInspector]
	protected bool mSnap = true;

	// Token: 0x0400093E RID: 2366
	protected UISprite mSprite;

	// Token: 0x0400093F RID: 2367
	protected float mDelta;

	// Token: 0x04000940 RID: 2368
	protected int mIndex;

	// Token: 0x04000941 RID: 2369
	protected bool mActive = true;

	// Token: 0x04000942 RID: 2370
	protected List<string> mSpriteNames = new List<string>();
}
