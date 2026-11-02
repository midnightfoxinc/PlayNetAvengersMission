using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000124 RID: 292
[AddComponentMenu("NGUI/UI/NGUI Label")]
[ExecuteInEditMode]
public class UILabel : UIWidget
{
	// Token: 0x17000136 RID: 310
	// (get) Token: 0x06000934 RID: 2356 RVA: 0x00044834 File Offset: 0x00042A34
	public int finalFontSize
	{
		get
		{
			if (this.trueTypeFont)
			{
				return Mathf.RoundToInt(this.mScale * (float)this.mFinalFontSize);
			}
			return Mathf.RoundToInt((float)this.mFinalFontSize * this.mScale);
		}
	}

	// Token: 0x17000137 RID: 311
	// (get) Token: 0x06000935 RID: 2357 RVA: 0x00044870 File Offset: 0x00042A70
	// (set) Token: 0x06000936 RID: 2358 RVA: 0x00044878 File Offset: 0x00042A78
	private bool shouldBeProcessed
	{
		get
		{
			return this.mShouldBeProcessed;
		}
		set
		{
			if (value)
			{
				this.mChanged = true;
				this.mShouldBeProcessed = true;
			}
			else
			{
				this.mShouldBeProcessed = false;
			}
		}
	}

	// Token: 0x17000138 RID: 312
	// (get) Token: 0x06000937 RID: 2359 RVA: 0x000448A8 File Offset: 0x00042AA8
	public override bool isAnchoredHorizontally
	{
		get
		{
			return base.isAnchoredHorizontally || this.mOverflow == UILabel.Overflow.ResizeFreely;
		}
	}

	// Token: 0x17000139 RID: 313
	// (get) Token: 0x06000938 RID: 2360 RVA: 0x000448C4 File Offset: 0x00042AC4
	public override bool isAnchoredVertically
	{
		get
		{
			return base.isAnchoredVertically || this.mOverflow == UILabel.Overflow.ResizeFreely || this.mOverflow == UILabel.Overflow.ResizeHeight;
		}
	}

	// Token: 0x1700013A RID: 314
	// (get) Token: 0x06000939 RID: 2361 RVA: 0x000448EC File Offset: 0x00042AEC
	// (set) Token: 0x0600093A RID: 2362 RVA: 0x0004494C File Offset: 0x00042B4C
	public override Material material
	{
		get
		{
			if (this.mMaterial != null)
			{
				return this.mMaterial;
			}
			if (this.mFont != null)
			{
				return this.mFont.material;
			}
			if (this.mTrueTypeFont != null)
			{
				return this.mTrueTypeFont.material;
			}
			return null;
		}
		set
		{
			if (this.mMaterial != value)
			{
				base.RemoveFromPanel();
				this.mMaterial = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700013B RID: 315
	// (get) Token: 0x0600093B RID: 2363 RVA: 0x00044980 File Offset: 0x00042B80
	// (set) Token: 0x0600093C RID: 2364 RVA: 0x00044988 File Offset: 0x00042B88
	[Obsolete("Use UILabel.bitmapFont instead")]
	public UIFont font
	{
		get
		{
			return this.bitmapFont;
		}
		set
		{
			this.bitmapFont = value;
		}
	}

	// Token: 0x1700013C RID: 316
	// (get) Token: 0x0600093D RID: 2365 RVA: 0x00044994 File Offset: 0x00042B94
	// (set) Token: 0x0600093E RID: 2366 RVA: 0x0004499C File Offset: 0x00042B9C
	public UIFont bitmapFont
	{
		get
		{
			return this.mFont;
		}
		set
		{
			if (this.mFont != value)
			{
				base.RemoveFromPanel();
				this.mFont = value;
				this.mTrueTypeFont = null;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700013D RID: 317
	// (get) Token: 0x0600093F RID: 2367 RVA: 0x000449CC File Offset: 0x00042BCC
	// (set) Token: 0x06000940 RID: 2368 RVA: 0x00044A14 File Offset: 0x00042C14
	public Font trueTypeFont
	{
		get
		{
			if (this.mTrueTypeFont != null)
			{
				return this.mTrueTypeFont;
			}
			return (!(this.mFont != null)) ? null : this.mFont.dynamicFont;
		}
		set
		{
			if (this.mTrueTypeFont != value)
			{
				this.SetActiveFont(null);
				base.RemoveFromPanel();
				this.mTrueTypeFont = value;
				this.shouldBeProcessed = true;
				this.mFont = null;
				this.SetActiveFont(value);
				this.ProcessAndRequest();
				if (this.mActiveTTF != null)
				{
					base.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x1700013E RID: 318
	// (get) Token: 0x06000941 RID: 2369 RVA: 0x00044A78 File Offset: 0x00042C78
	// (set) Token: 0x06000942 RID: 2370 RVA: 0x00044A90 File Offset: 0x00042C90
	public Object ambigiousFont
	{
		get
		{
			return this.mFont ?? this.mTrueTypeFont;
		}
		set
		{
			UIFont uifont = value as UIFont;
			if (uifont != null)
			{
				this.bitmapFont = uifont;
			}
			else
			{
				this.trueTypeFont = (value as Font);
			}
		}
	}

	// Token: 0x1700013F RID: 319
	// (get) Token: 0x06000943 RID: 2371 RVA: 0x00044AC8 File Offset: 0x00042CC8
	// (set) Token: 0x06000944 RID: 2372 RVA: 0x00044AD0 File Offset: 0x00042CD0
	public string text
	{
		get
		{
			return this.mText;
		}
		set
		{
			if (this.mText == value)
			{
				return;
			}
			if (string.IsNullOrEmpty(value))
			{
				if (!string.IsNullOrEmpty(this.mText))
				{
					this.mText = string.Empty;
					this.MarkAsChanged();
					this.ProcessAndRequest();
				}
			}
			else if (this.mText != value)
			{
				this.mText = value;
				this.MarkAsChanged();
				this.ProcessAndRequest();
			}
			if (this.autoResizeBoxCollider)
			{
				base.ResizeCollider();
			}
		}
	}

	// Token: 0x17000140 RID: 320
	// (get) Token: 0x06000945 RID: 2373 RVA: 0x00044B5C File Offset: 0x00042D5C
	public int defaultFontSize
	{
		get
		{
			return (!(this.trueTypeFont != null)) ? ((!(this.mFont != null)) ? 16 : this.mFont.defaultSize) : this.mFontSize;
		}
	}

	// Token: 0x17000141 RID: 321
	// (get) Token: 0x06000946 RID: 2374 RVA: 0x00044BA8 File Offset: 0x00042DA8
	// (set) Token: 0x06000947 RID: 2375 RVA: 0x00044BB0 File Offset: 0x00042DB0
	public int fontSize
	{
		get
		{
			return this.mFontSize;
		}
		set
		{
			value = Mathf.Clamp(value, 0, 256);
			if (this.mFontSize != value)
			{
				this.mFontSize = value;
				this.shouldBeProcessed = true;
				this.ProcessAndRequest();
			}
		}
	}

	// Token: 0x17000142 RID: 322
	// (get) Token: 0x06000948 RID: 2376 RVA: 0x00044BEC File Offset: 0x00042DEC
	// (set) Token: 0x06000949 RID: 2377 RVA: 0x00044BF4 File Offset: 0x00042DF4
	public FontStyle fontStyle
	{
		get
		{
			return this.mFontStyle;
		}
		set
		{
			if (this.mFontStyle != value)
			{
				this.mFontStyle = value;
				this.shouldBeProcessed = true;
				this.ProcessAndRequest();
			}
		}
	}

	// Token: 0x17000143 RID: 323
	// (get) Token: 0x0600094A RID: 2378 RVA: 0x00044C24 File Offset: 0x00042E24
	// (set) Token: 0x0600094B RID: 2379 RVA: 0x00044C2C File Offset: 0x00042E2C
	public NGUIText.Alignment alignment
	{
		get
		{
			return this.mAlignment;
		}
		set
		{
			if (this.mAlignment != value)
			{
				this.mAlignment = value;
				this.shouldBeProcessed = true;
				this.ProcessAndRequest();
			}
		}
	}

	// Token: 0x17000144 RID: 324
	// (get) Token: 0x0600094C RID: 2380 RVA: 0x00044C5C File Offset: 0x00042E5C
	// (set) Token: 0x0600094D RID: 2381 RVA: 0x00044C64 File Offset: 0x00042E64
	public bool applyGradient
	{
		get
		{
			return this.mApplyGradient;
		}
		set
		{
			if (this.mApplyGradient != value)
			{
				this.mApplyGradient = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000145 RID: 325
	// (get) Token: 0x0600094E RID: 2382 RVA: 0x00044C80 File Offset: 0x00042E80
	// (set) Token: 0x0600094F RID: 2383 RVA: 0x00044C88 File Offset: 0x00042E88
	public Color gradientTop
	{
		get
		{
			return this.mGradientTop;
		}
		set
		{
			if (this.mGradientTop != value)
			{
				this.mGradientTop = value;
				if (this.mApplyGradient)
				{
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x17000146 RID: 326
	// (get) Token: 0x06000950 RID: 2384 RVA: 0x00044CB4 File Offset: 0x00042EB4
	// (set) Token: 0x06000951 RID: 2385 RVA: 0x00044CBC File Offset: 0x00042EBC
	public Color gradientBottom
	{
		get
		{
			return this.mGradientBottom;
		}
		set
		{
			if (this.mGradientBottom != value)
			{
				this.mGradientBottom = value;
				if (this.mApplyGradient)
				{
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x17000147 RID: 327
	// (get) Token: 0x06000952 RID: 2386 RVA: 0x00044CE8 File Offset: 0x00042EE8
	// (set) Token: 0x06000953 RID: 2387 RVA: 0x00044CF0 File Offset: 0x00042EF0
	public int spacingX
	{
		get
		{
			return this.mSpacingX;
		}
		set
		{
			if (this.mSpacingX != value)
			{
				this.mSpacingX = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000148 RID: 328
	// (get) Token: 0x06000954 RID: 2388 RVA: 0x00044D0C File Offset: 0x00042F0C
	// (set) Token: 0x06000955 RID: 2389 RVA: 0x00044D14 File Offset: 0x00042F14
	public int spacingY
	{
		get
		{
			return this.mSpacingY;
		}
		set
		{
			if (this.mSpacingY != value)
			{
				this.mSpacingY = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000149 RID: 329
	// (get) Token: 0x06000956 RID: 2390 RVA: 0x00044D30 File Offset: 0x00042F30
	// (set) Token: 0x06000957 RID: 2391 RVA: 0x00044D38 File Offset: 0x00042F38
	public bool useFloatSpacing
	{
		get
		{
			return this.mUseFloatSpacing;
		}
		set
		{
			if (this.mUseFloatSpacing != value)
			{
				this.mUseFloatSpacing = value;
				this.shouldBeProcessed = true;
			}
		}
	}

	// Token: 0x1700014A RID: 330
	// (get) Token: 0x06000958 RID: 2392 RVA: 0x00044D54 File Offset: 0x00042F54
	// (set) Token: 0x06000959 RID: 2393 RVA: 0x00044D5C File Offset: 0x00042F5C
	public float floatSpacingX
	{
		get
		{
			return this.mFloatSpacingX;
		}
		set
		{
			if (!Mathf.Approximately(this.mFloatSpacingX, value))
			{
				this.mFloatSpacingX = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700014B RID: 331
	// (get) Token: 0x0600095A RID: 2394 RVA: 0x00044D7C File Offset: 0x00042F7C
	// (set) Token: 0x0600095B RID: 2395 RVA: 0x00044D84 File Offset: 0x00042F84
	public float floatSpacingY
	{
		get
		{
			return this.mFloatSpacingY;
		}
		set
		{
			if (!Mathf.Approximately(this.mFloatSpacingY, value))
			{
				this.mFloatSpacingY = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700014C RID: 332
	// (get) Token: 0x0600095C RID: 2396 RVA: 0x00044DA4 File Offset: 0x00042FA4
	public float effectiveSpacingY
	{
		get
		{
			return (!this.mUseFloatSpacing) ? ((float)this.mSpacingY) : this.mFloatSpacingY;
		}
	}

	// Token: 0x1700014D RID: 333
	// (get) Token: 0x0600095D RID: 2397 RVA: 0x00044DC4 File Offset: 0x00042FC4
	public float effectiveSpacingX
	{
		get
		{
			return (!this.mUseFloatSpacing) ? ((float)this.mSpacingX) : this.mFloatSpacingX;
		}
	}

	// Token: 0x1700014E RID: 334
	// (get) Token: 0x0600095E RID: 2398 RVA: 0x00044DE4 File Offset: 0x00042FE4
	// (set) Token: 0x0600095F RID: 2399 RVA: 0x00044DEC File Offset: 0x00042FEC
	public bool overflowEllipsis
	{
		get
		{
			return this.mOverflowEllipsis;
		}
		set
		{
			if (this.mOverflowEllipsis != value)
			{
				this.mOverflowEllipsis = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700014F RID: 335
	// (get) Token: 0x06000960 RID: 2400 RVA: 0x00044E08 File Offset: 0x00043008
	// (set) Token: 0x06000961 RID: 2401 RVA: 0x00044E10 File Offset: 0x00043010
	public int overflowWidth
	{
		get
		{
			return this.mOverflowWidth;
		}
		set
		{
			if (this.mOverflowWidth != value)
			{
				this.mOverflowWidth = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000150 RID: 336
	// (get) Token: 0x06000962 RID: 2402 RVA: 0x00044E2C File Offset: 0x0004302C
	private bool keepCrisp
	{
		get
		{
			return this.trueTypeFont != null && this.keepCrispWhenShrunk != UILabel.Crispness.Never && this.keepCrispWhenShrunk == UILabel.Crispness.Always;
		}
	}

	// Token: 0x17000151 RID: 337
	// (get) Token: 0x06000963 RID: 2403 RVA: 0x00044E58 File Offset: 0x00043058
	// (set) Token: 0x06000964 RID: 2404 RVA: 0x00044E60 File Offset: 0x00043060
	public bool supportEncoding
	{
		get
		{
			return this.mEncoding;
		}
		set
		{
			if (this.mEncoding != value)
			{
				this.mEncoding = value;
				this.shouldBeProcessed = true;
			}
		}
	}

	// Token: 0x17000152 RID: 338
	// (get) Token: 0x06000965 RID: 2405 RVA: 0x00044E7C File Offset: 0x0004307C
	// (set) Token: 0x06000966 RID: 2406 RVA: 0x00044E84 File Offset: 0x00043084
	public NGUIText.SymbolStyle symbolStyle
	{
		get
		{
			return this.mSymbols;
		}
		set
		{
			if (this.mSymbols != value)
			{
				this.mSymbols = value;
				this.shouldBeProcessed = true;
			}
		}
	}

	// Token: 0x17000153 RID: 339
	// (get) Token: 0x06000967 RID: 2407 RVA: 0x00044EA0 File Offset: 0x000430A0
	// (set) Token: 0x06000968 RID: 2408 RVA: 0x00044EA8 File Offset: 0x000430A8
	public UILabel.Overflow overflowMethod
	{
		get
		{
			return this.mOverflow;
		}
		set
		{
			if (this.mOverflow != value)
			{
				this.mOverflow = value;
				this.shouldBeProcessed = true;
			}
		}
	}

	// Token: 0x17000154 RID: 340
	// (get) Token: 0x06000969 RID: 2409 RVA: 0x00044EC4 File Offset: 0x000430C4
	// (set) Token: 0x0600096A RID: 2410 RVA: 0x00044ECC File Offset: 0x000430CC
	[Obsolete("Use 'width' instead")]
	public int lineWidth
	{
		get
		{
			return base.width;
		}
		set
		{
			base.width = value;
		}
	}

	// Token: 0x17000155 RID: 341
	// (get) Token: 0x0600096B RID: 2411 RVA: 0x00044ED8 File Offset: 0x000430D8
	// (set) Token: 0x0600096C RID: 2412 RVA: 0x00044EE0 File Offset: 0x000430E0
	[Obsolete("Use 'height' instead")]
	public int lineHeight
	{
		get
		{
			return base.height;
		}
		set
		{
			base.height = value;
		}
	}

	// Token: 0x17000156 RID: 342
	// (get) Token: 0x0600096D RID: 2413 RVA: 0x00044EEC File Offset: 0x000430EC
	// (set) Token: 0x0600096E RID: 2414 RVA: 0x00044EFC File Offset: 0x000430FC
	public bool multiLine
	{
		get
		{
			return this.mMaxLineCount != 1;
		}
		set
		{
			if (this.mMaxLineCount != 1 != value)
			{
				this.mMaxLineCount = ((!value) ? 1 : 0);
				this.shouldBeProcessed = true;
			}
		}
	}

	// Token: 0x17000157 RID: 343
	// (get) Token: 0x0600096F RID: 2415 RVA: 0x00044F38 File Offset: 0x00043138
	public override Vector3[] localCorners
	{
		get
		{
			if (this.shouldBeProcessed)
			{
				this.ProcessText();
			}
			return base.localCorners;
		}
	}

	// Token: 0x17000158 RID: 344
	// (get) Token: 0x06000970 RID: 2416 RVA: 0x00044F54 File Offset: 0x00043154
	public override Vector3[] worldCorners
	{
		get
		{
			if (this.shouldBeProcessed)
			{
				this.ProcessText();
			}
			return base.worldCorners;
		}
	}

	// Token: 0x17000159 RID: 345
	// (get) Token: 0x06000971 RID: 2417 RVA: 0x00044F70 File Offset: 0x00043170
	public override Vector4 drawingDimensions
	{
		get
		{
			if (this.shouldBeProcessed)
			{
				this.ProcessText();
			}
			return base.drawingDimensions;
		}
	}

	// Token: 0x1700015A RID: 346
	// (get) Token: 0x06000972 RID: 2418 RVA: 0x00044F8C File Offset: 0x0004318C
	// (set) Token: 0x06000973 RID: 2419 RVA: 0x00044F94 File Offset: 0x00043194
	public int maxLineCount
	{
		get
		{
			return this.mMaxLineCount;
		}
		set
		{
			if (this.mMaxLineCount != value)
			{
				this.mMaxLineCount = Mathf.Max(value, 0);
				this.shouldBeProcessed = true;
				if (this.overflowMethod == UILabel.Overflow.ShrinkContent)
				{
					this.MakePixelPerfect();
				}
			}
		}
	}

	// Token: 0x1700015B RID: 347
	// (get) Token: 0x06000974 RID: 2420 RVA: 0x00044FC8 File Offset: 0x000431C8
	// (set) Token: 0x06000975 RID: 2421 RVA: 0x00044FD0 File Offset: 0x000431D0
	public UILabel.Effect effectStyle
	{
		get
		{
			return this.mEffectStyle;
		}
		set
		{
			if (this.mEffectStyle != value)
			{
				this.mEffectStyle = value;
				this.shouldBeProcessed = true;
			}
		}
	}

	// Token: 0x1700015C RID: 348
	// (get) Token: 0x06000976 RID: 2422 RVA: 0x00044FEC File Offset: 0x000431EC
	// (set) Token: 0x06000977 RID: 2423 RVA: 0x00044FF4 File Offset: 0x000431F4
	public Color effectColor
	{
		get
		{
			return this.mEffectColor;
		}
		set
		{
			if (this.mEffectColor != value)
			{
				this.mEffectColor = value;
				if (this.mEffectStyle != UILabel.Effect.None)
				{
					this.shouldBeProcessed = true;
				}
			}
		}
	}

	// Token: 0x1700015D RID: 349
	// (get) Token: 0x06000978 RID: 2424 RVA: 0x0004502C File Offset: 0x0004322C
	// (set) Token: 0x06000979 RID: 2425 RVA: 0x00045034 File Offset: 0x00043234
	public Vector2 effectDistance
	{
		get
		{
			return this.mEffectDistance;
		}
		set
		{
			if (this.mEffectDistance != value)
			{
				this.mEffectDistance = value;
				this.shouldBeProcessed = true;
			}
		}
	}

	// Token: 0x1700015E RID: 350
	// (get) Token: 0x0600097A RID: 2426 RVA: 0x00045058 File Offset: 0x00043258
	// (set) Token: 0x0600097B RID: 2427 RVA: 0x00045064 File Offset: 0x00043264
	[Obsolete("Use 'overflowMethod == UILabel.Overflow.ShrinkContent' instead")]
	public bool shrinkToFit
	{
		get
		{
			return this.mOverflow == UILabel.Overflow.ShrinkContent;
		}
		set
		{
			if (value)
			{
				this.overflowMethod = UILabel.Overflow.ShrinkContent;
			}
		}
	}

	// Token: 0x1700015F RID: 351
	// (get) Token: 0x0600097C RID: 2428 RVA: 0x00045074 File Offset: 0x00043274
	public string processedText
	{
		get
		{
			if (this.mLastWidth != this.mWidth || this.mLastHeight != this.mHeight)
			{
				this.mLastWidth = this.mWidth;
				this.mLastHeight = this.mHeight;
				this.mShouldBeProcessed = true;
			}
			if (this.shouldBeProcessed)
			{
				this.ProcessText();
			}
			return this.mProcessedText;
		}
	}

	// Token: 0x17000160 RID: 352
	// (get) Token: 0x0600097D RID: 2429 RVA: 0x000450DC File Offset: 0x000432DC
	public Vector2 printedSize
	{
		get
		{
			if (this.shouldBeProcessed)
			{
				this.ProcessText();
			}
			return this.mCalculatedSize;
		}
	}

	// Token: 0x17000161 RID: 353
	// (get) Token: 0x0600097E RID: 2430 RVA: 0x000450F8 File Offset: 0x000432F8
	public override Vector2 localSize
	{
		get
		{
			if (this.shouldBeProcessed)
			{
				this.ProcessText();
			}
			return base.localSize;
		}
	}

	// Token: 0x17000162 RID: 354
	// (get) Token: 0x0600097F RID: 2431 RVA: 0x00045114 File Offset: 0x00043314
	private bool isValid
	{
		get
		{
			return this.mFont != null || this.mTrueTypeFont != null;
		}
	}

	// Token: 0x06000980 RID: 2432 RVA: 0x00045144 File Offset: 0x00043344
	protected override void OnInit()
	{
		base.OnInit();
		UILabel.mList.Add(this);
		this.SetActiveFont(this.trueTypeFont);
	}

	// Token: 0x06000981 RID: 2433 RVA: 0x00045170 File Offset: 0x00043370
	protected override void OnDisable()
	{
		this.SetActiveFont(null);
		UILabel.mList.Remove(this);
		base.OnDisable();
	}

	// Token: 0x06000982 RID: 2434 RVA: 0x0004518C File Offset: 0x0004338C
	protected void SetActiveFont(Font fnt)
	{
		if (this.mActiveTTF != fnt)
		{
			Font font = this.mActiveTTF;
			int num;
			if (font != null && UILabel.mFontUsage.TryGetValue(font, ref num))
			{
				num = Mathf.Max(0, --num);
				if (num == 0)
				{
					UILabel.mFontUsage.Remove(font);
				}
				else
				{
					UILabel.mFontUsage[font] = num;
				}
			}
			this.mActiveTTF = fnt;
			if (fnt != null)
			{
				int num2 = 0;
				UILabel.mFontUsage[fnt] = num2 + 1;
			}
		}
	}

	// Token: 0x06000983 RID: 2435 RVA: 0x00045228 File Offset: 0x00043428
	private static void OnFontChanged(Font font)
	{
		for (int i = 0; i < UILabel.mList.size; i++)
		{
			UILabel uilabel = UILabel.mList[i];
			if (uilabel != null)
			{
				Font trueTypeFont = uilabel.trueTypeFont;
				if (trueTypeFont == font)
				{
					trueTypeFont.RequestCharactersInTexture(uilabel.mText, uilabel.mFinalFontSize, uilabel.mFontStyle);
					uilabel.MarkAsChanged();
					if (uilabel.panel == null)
					{
						uilabel.CreatePanel();
					}
					if (UILabel.mTempDrawcalls == null)
					{
						UILabel.mTempDrawcalls = new List<UIDrawCall>();
					}
					if (uilabel.drawCall != null && !UILabel.mTempDrawcalls.Contains(uilabel.drawCall))
					{
						UILabel.mTempDrawcalls.Add(uilabel.drawCall);
					}
				}
			}
		}
		if (UILabel.mTempDrawcalls != null)
		{
			int j = 0;
			int count = UILabel.mTempDrawcalls.Count;
			while (j < count)
			{
				UIDrawCall uidrawCall = UILabel.mTempDrawcalls[j];
				if (uidrawCall.panel != null)
				{
					uidrawCall.panel.FillDrawCall(uidrawCall);
				}
				j++;
			}
			UILabel.mTempDrawcalls.Clear();
		}
	}

	// Token: 0x06000984 RID: 2436 RVA: 0x0004535C File Offset: 0x0004355C
	public override Vector3[] GetSides(Transform relativeTo)
	{
		if (this.shouldBeProcessed)
		{
			this.ProcessText();
		}
		return base.GetSides(relativeTo);
	}

	// Token: 0x06000985 RID: 2437 RVA: 0x00045378 File Offset: 0x00043578
	protected override void UpgradeFrom265()
	{
		this.ProcessText(true, true);
		if (this.mShrinkToFit)
		{
			this.overflowMethod = UILabel.Overflow.ShrinkContent;
			this.mMaxLineCount = 0;
		}
		if (this.mMaxLineWidth != 0)
		{
			base.width = this.mMaxLineWidth;
			this.overflowMethod = ((this.mMaxLineCount <= 0) ? UILabel.Overflow.ShrinkContent : UILabel.Overflow.ResizeHeight);
		}
		else
		{
			this.overflowMethod = UILabel.Overflow.ResizeFreely;
		}
		if (this.mMaxLineHeight != 0)
		{
			base.height = this.mMaxLineHeight;
		}
		if (this.mFont != null)
		{
			int defaultSize = this.mFont.defaultSize;
			if (base.height < defaultSize)
			{
				base.height = defaultSize;
			}
			this.fontSize = defaultSize;
		}
		this.mMaxLineWidth = 0;
		this.mMaxLineHeight = 0;
		this.mShrinkToFit = false;
		NGUITools.UpdateWidgetCollider(base.gameObject, true);
	}

	// Token: 0x06000986 RID: 2438 RVA: 0x00045454 File Offset: 0x00043654
	protected override void OnAnchor()
	{
		if (this.mOverflow == UILabel.Overflow.ResizeFreely)
		{
			if (base.isFullyAnchored)
			{
				this.mOverflow = UILabel.Overflow.ShrinkContent;
			}
		}
		else if (this.mOverflow == UILabel.Overflow.ResizeHeight && this.topAnchor.target != null && this.bottomAnchor.target != null)
		{
			this.mOverflow = UILabel.Overflow.ShrinkContent;
		}
		base.OnAnchor();
	}

	// Token: 0x06000987 RID: 2439 RVA: 0x000454CC File Offset: 0x000436CC
	private void ProcessAndRequest()
	{
		if (this.ambigiousFont != null)
		{
			this.ProcessText();
		}
	}

	// Token: 0x06000988 RID: 2440 RVA: 0x000454E8 File Offset: 0x000436E8
	protected override void OnEnable()
	{
		base.OnEnable();
		if (!UILabel.mTexRebuildAdded)
		{
			UILabel.mTexRebuildAdded = true;
			Font.textureRebuilt += new Action<Font>(UILabel.OnFontChanged);
		}
	}

	// Token: 0x06000989 RID: 2441 RVA: 0x00045514 File Offset: 0x00043714
	protected override void OnStart()
	{
		base.OnStart();
		if (this.mLineWidth > 0f)
		{
			this.mMaxLineWidth = Mathf.RoundToInt(this.mLineWidth);
			this.mLineWidth = 0f;
		}
		if (!this.mMultiline)
		{
			this.mMaxLineCount = 1;
			this.mMultiline = true;
		}
		this.mPremultiply = (this.material != null && this.material.shader != null && this.material.shader.name.Contains("Premultiplied"));
		this.ProcessAndRequest();
	}

	// Token: 0x0600098A RID: 2442 RVA: 0x000455BC File Offset: 0x000437BC
	public override void MarkAsChanged()
	{
		this.shouldBeProcessed = true;
		base.MarkAsChanged();
	}

	// Token: 0x0600098B RID: 2443 RVA: 0x000455CC File Offset: 0x000437CC
	public void ProcessText()
	{
		this.ProcessText(false, true);
	}

	// Token: 0x0600098C RID: 2444 RVA: 0x000455D8 File Offset: 0x000437D8
	private void ProcessText(bool legacyMode, bool full)
	{
		if (!this.isValid)
		{
			return;
		}
		this.mChanged = true;
		this.shouldBeProcessed = false;
		float num = this.mDrawRegion.z - this.mDrawRegion.x;
		float num2 = this.mDrawRegion.w - this.mDrawRegion.y;
		NGUIText.rectWidth = ((!legacyMode) ? base.width : ((this.mMaxLineWidth == 0) ? 1000000 : this.mMaxLineWidth));
		NGUIText.rectHeight = ((!legacyMode) ? base.height : ((this.mMaxLineHeight == 0) ? 1000000 : this.mMaxLineHeight));
		NGUIText.regionWidth = ((num == 1f) ? NGUIText.rectWidth : Mathf.RoundToInt((float)NGUIText.rectWidth * num));
		NGUIText.regionHeight = ((num2 == 1f) ? NGUIText.rectHeight : Mathf.RoundToInt((float)NGUIText.rectHeight * num2));
		this.mFinalFontSize = Mathf.Abs((!legacyMode) ? this.defaultFontSize : Mathf.RoundToInt(base.cachedTransform.localScale.x));
		this.mScale = 1f;
		if (NGUIText.regionWidth < 1 || NGUIText.regionHeight < 0)
		{
			this.mProcessedText = string.Empty;
			return;
		}
		bool flag = this.trueTypeFont != null;
		if (flag && this.keepCrisp)
		{
			UIRoot root = base.root;
			if (root != null)
			{
				this.mDensity = ((!(root != null)) ? 1f : root.pixelSizeAdjustment);
			}
		}
		else
		{
			this.mDensity = 1f;
		}
		if (full)
		{
			this.UpdateNGUIText();
		}
		if (this.mOverflow == UILabel.Overflow.ResizeFreely)
		{
			NGUIText.rectWidth = 1000000;
			NGUIText.regionWidth = 1000000;
			if (this.mOverflowWidth > 0)
			{
				NGUIText.rectWidth = Mathf.Min(NGUIText.rectWidth, this.mOverflowWidth);
				NGUIText.regionWidth = Mathf.Min(NGUIText.regionWidth, this.mOverflowWidth);
			}
		}
		if (this.mOverflow == UILabel.Overflow.ResizeFreely || this.mOverflow == UILabel.Overflow.ResizeHeight)
		{
			NGUIText.rectHeight = 1000000;
			NGUIText.regionHeight = 1000000;
		}
		if (this.mFinalFontSize > 0)
		{
			bool keepCrisp = this.keepCrisp;
			for (int i = this.mFinalFontSize; i > 0; i--)
			{
				if (keepCrisp)
				{
					this.mFinalFontSize = i;
					NGUIText.fontSize = this.mFinalFontSize;
				}
				else
				{
					this.mScale = (float)i / (float)this.mFinalFontSize;
					NGUIText.fontScale = ((!flag) ? ((float)this.mFontSize / (float)this.mFont.defaultSize * this.mScale) : this.mScale);
				}
				NGUIText.Update(false);
				bool flag2 = NGUIText.WrapText(this.mText, out this.mProcessedText, true, false, this.mOverflowEllipsis && this.mOverflow == UILabel.Overflow.ClampContent);
				if (this.mOverflow != UILabel.Overflow.ShrinkContent || flag2)
				{
					if (this.mOverflow == UILabel.Overflow.ResizeFreely)
					{
						this.mCalculatedSize = NGUIText.CalculatePrintedSize(this.mProcessedText);
						this.mWidth = Mathf.Max(this.minWidth, Mathf.RoundToInt(this.mCalculatedSize.x));
						if (num != 1f)
						{
							this.mWidth = Mathf.RoundToInt((float)this.mWidth / num);
						}
						this.mHeight = Mathf.Max(this.minHeight, Mathf.RoundToInt(this.mCalculatedSize.y));
						if (num2 != 1f)
						{
							this.mHeight = Mathf.RoundToInt((float)this.mHeight / num2);
						}
						if ((this.mWidth & 1) == 1)
						{
							this.mWidth++;
						}
						if ((this.mHeight & 1) == 1)
						{
							this.mHeight++;
						}
					}
					else if (this.mOverflow == UILabel.Overflow.ResizeHeight)
					{
						this.mCalculatedSize = NGUIText.CalculatePrintedSize(this.mProcessedText);
						this.mHeight = Mathf.Max(this.minHeight, Mathf.RoundToInt(this.mCalculatedSize.y));
						if (num2 != 1f)
						{
							this.mHeight = Mathf.RoundToInt((float)this.mHeight / num2);
						}
						if ((this.mHeight & 1) == 1)
						{
							this.mHeight++;
						}
					}
					else
					{
						this.mCalculatedSize = NGUIText.CalculatePrintedSize(this.mProcessedText);
					}
					if (legacyMode)
					{
						base.width = Mathf.RoundToInt(this.mCalculatedSize.x);
						base.height = Mathf.RoundToInt(this.mCalculatedSize.y);
						base.cachedTransform.localScale = Vector3.one;
					}
					break;
				}
				if (--i <= 1)
				{
					break;
				}
			}
		}
		else
		{
			base.cachedTransform.localScale = Vector3.one;
			this.mProcessedText = string.Empty;
			this.mScale = 1f;
		}
		if (full)
		{
			NGUIText.bitmapFont = null;
			NGUIText.dynamicFont = null;
		}
	}

	// Token: 0x0600098D RID: 2445 RVA: 0x00045B0C File Offset: 0x00043D0C
	public override void MakePixelPerfect()
	{
		if (this.ambigiousFont != null)
		{
			Vector3 localPosition = base.cachedTransform.localPosition;
			localPosition.x = (float)Mathf.RoundToInt(localPosition.x);
			localPosition.y = (float)Mathf.RoundToInt(localPosition.y);
			localPosition.z = (float)Mathf.RoundToInt(localPosition.z);
			base.cachedTransform.localPosition = localPosition;
			base.cachedTransform.localScale = Vector3.one;
			if (this.mOverflow == UILabel.Overflow.ResizeFreely)
			{
				this.AssumeNaturalSize();
			}
			else
			{
				int width = base.width;
				int height = base.height;
				UILabel.Overflow overflow = this.mOverflow;
				if (overflow != UILabel.Overflow.ResizeHeight)
				{
					this.mWidth = 100000;
				}
				this.mHeight = 100000;
				this.mOverflow = UILabel.Overflow.ShrinkContent;
				this.ProcessText(false, true);
				this.mOverflow = overflow;
				int num = Mathf.RoundToInt(this.mCalculatedSize.x);
				int num2 = Mathf.RoundToInt(this.mCalculatedSize.y);
				num = Mathf.Max(num, base.minWidth);
				num2 = Mathf.Max(num2, base.minHeight);
				if ((num & 1) == 1)
				{
					num++;
				}
				if ((num2 & 1) == 1)
				{
					num2++;
				}
				this.mWidth = Mathf.Max(width, num);
				this.mHeight = Mathf.Max(height, num2);
				this.MarkAsChanged();
			}
		}
		else
		{
			base.MakePixelPerfect();
		}
	}

	// Token: 0x0600098E RID: 2446 RVA: 0x00045C7C File Offset: 0x00043E7C
	public void AssumeNaturalSize()
	{
		if (this.ambigiousFont != null)
		{
			this.mWidth = 100000;
			this.mHeight = 100000;
			this.ProcessText(false, true);
			this.mWidth = Mathf.RoundToInt(this.mCalculatedSize.x);
			this.mHeight = Mathf.RoundToInt(this.mCalculatedSize.y);
			if ((this.mWidth & 1) == 1)
			{
				this.mWidth++;
			}
			if ((this.mHeight & 1) == 1)
			{
				this.mHeight++;
			}
			this.MarkAsChanged();
		}
	}

	// Token: 0x0600098F RID: 2447 RVA: 0x00045D24 File Offset: 0x00043F24
	[Obsolete("Use UILabel.GetCharacterAtPosition instead")]
	public int GetCharacterIndex(Vector3 worldPos)
	{
		return this.GetCharacterIndexAtPosition(worldPos, false);
	}

	// Token: 0x06000990 RID: 2448 RVA: 0x00045D30 File Offset: 0x00043F30
	[Obsolete("Use UILabel.GetCharacterAtPosition instead")]
	public int GetCharacterIndex(Vector2 localPos)
	{
		return this.GetCharacterIndexAtPosition(localPos, false);
	}

	// Token: 0x06000991 RID: 2449 RVA: 0x00045D3C File Offset: 0x00043F3C
	public int GetCharacterIndexAtPosition(Vector3 worldPos, bool precise)
	{
		Vector2 localPos = base.cachedTransform.InverseTransformPoint(worldPos);
		return this.GetCharacterIndexAtPosition(localPos, precise);
	}

	// Token: 0x06000992 RID: 2450 RVA: 0x00045D64 File Offset: 0x00043F64
	public int GetCharacterIndexAtPosition(Vector2 localPos, bool precise)
	{
		if (this.isValid)
		{
			string processedText = this.processedText;
			if (string.IsNullOrEmpty(processedText))
			{
				return 0;
			}
			this.UpdateNGUIText();
			if (precise)
			{
				NGUIText.PrintExactCharacterPositions(processedText, UILabel.mTempVerts, UILabel.mTempIndices);
			}
			else
			{
				NGUIText.PrintApproximateCharacterPositions(processedText, UILabel.mTempVerts, UILabel.mTempIndices);
			}
			if (UILabel.mTempVerts.size > 0)
			{
				this.ApplyOffset(UILabel.mTempVerts, 0);
				int result = (!precise) ? NGUIText.GetApproximateCharacterIndex(UILabel.mTempVerts, UILabel.mTempIndices, localPos) : NGUIText.GetExactCharacterIndex(UILabel.mTempVerts, UILabel.mTempIndices, localPos);
				UILabel.mTempVerts.Clear();
				UILabel.mTempIndices.Clear();
				NGUIText.bitmapFont = null;
				NGUIText.dynamicFont = null;
				return result;
			}
			NGUIText.bitmapFont = null;
			NGUIText.dynamicFont = null;
		}
		return 0;
	}

	// Token: 0x06000993 RID: 2451 RVA: 0x00045E3C File Offset: 0x0004403C
	public string GetWordAtPosition(Vector3 worldPos)
	{
		int characterIndexAtPosition = this.GetCharacterIndexAtPosition(worldPos, true);
		return this.GetWordAtCharacterIndex(characterIndexAtPosition);
	}

	// Token: 0x06000994 RID: 2452 RVA: 0x00045E5C File Offset: 0x0004405C
	public string GetWordAtPosition(Vector2 localPos)
	{
		int characterIndexAtPosition = this.GetCharacterIndexAtPosition(localPos, true);
		return this.GetWordAtCharacterIndex(characterIndexAtPosition);
	}

	// Token: 0x06000995 RID: 2453 RVA: 0x00045E7C File Offset: 0x0004407C
	public string GetWordAtCharacterIndex(int characterIndex)
	{
		if (characterIndex != -1 && characterIndex < this.mText.Length)
		{
			int num = this.mText.LastIndexOfAny(new char[]
			{
				' ',
				'\n'
			}, characterIndex) + 1;
			int num2 = this.mText.IndexOfAny(new char[]
			{
				' ',
				'\n',
				',',
				'.'
			}, characterIndex);
			if (num2 == -1)
			{
				num2 = this.mText.Length;
			}
			if (num != num2)
			{
				int num3 = num2 - num;
				if (num3 > 0)
				{
					string text = this.mText.Substring(num, num3);
					return NGUIText.StripSymbols(text);
				}
			}
		}
		return null;
	}

	// Token: 0x06000996 RID: 2454 RVA: 0x00045F1C File Offset: 0x0004411C
	public string GetUrlAtPosition(Vector3 worldPos)
	{
		return this.GetUrlAtCharacterIndex(this.GetCharacterIndexAtPosition(worldPos, true));
	}

	// Token: 0x06000997 RID: 2455 RVA: 0x00045F2C File Offset: 0x0004412C
	public string GetUrlAtPosition(Vector2 localPos)
	{
		return this.GetUrlAtCharacterIndex(this.GetCharacterIndexAtPosition(localPos, true));
	}

	// Token: 0x06000998 RID: 2456 RVA: 0x00045F3C File Offset: 0x0004413C
	public string GetUrlAtCharacterIndex(int characterIndex)
	{
		if (characterIndex != -1 && characterIndex < this.mText.Length - 6)
		{
			int num;
			if (this.mText.get_Chars(characterIndex) == '[' && this.mText.get_Chars(characterIndex + 1) == 'u' && this.mText.get_Chars(characterIndex + 2) == 'r' && this.mText.get_Chars(characterIndex + 3) == 'l' && this.mText.get_Chars(characterIndex + 4) == '=')
			{
				num = characterIndex;
			}
			else
			{
				num = this.mText.LastIndexOf("[url=", characterIndex);
			}
			if (num == -1)
			{
				return null;
			}
			num += 5;
			int num2 = this.mText.IndexOf("]", num);
			if (num2 == -1)
			{
				return null;
			}
			int num3 = this.mText.IndexOf("[/url]", num2);
			if (num3 == -1 || characterIndex <= num3)
			{
				return this.mText.Substring(num, num2 - num);
			}
		}
		return null;
	}

	// Token: 0x06000999 RID: 2457 RVA: 0x0004603C File Offset: 0x0004423C
	public int GetCharacterIndex(int currentIndex, KeyCode key)
	{
		if (this.isValid)
		{
			string processedText = this.processedText;
			if (string.IsNullOrEmpty(processedText))
			{
				return 0;
			}
			int defaultFontSize = this.defaultFontSize;
			this.UpdateNGUIText();
			NGUIText.PrintApproximateCharacterPositions(processedText, UILabel.mTempVerts, UILabel.mTempIndices);
			if (UILabel.mTempVerts.size > 0)
			{
				this.ApplyOffset(UILabel.mTempVerts, 0);
				int i = 0;
				while (i < UILabel.mTempIndices.size)
				{
					if (UILabel.mTempIndices[i] == currentIndex)
					{
						Vector2 pos = UILabel.mTempVerts[i];
						if (key == 273)
						{
							pos.y += (float)defaultFontSize + this.effectiveSpacingY;
						}
						else if (key == 274)
						{
							pos.y -= (float)defaultFontSize + this.effectiveSpacingY;
						}
						else if (key == 278)
						{
							pos.x -= 1000f;
						}
						else if (key == 279)
						{
							pos.x += 1000f;
						}
						int approximateCharacterIndex = NGUIText.GetApproximateCharacterIndex(UILabel.mTempVerts, UILabel.mTempIndices, pos);
						if (approximateCharacterIndex == currentIndex)
						{
							break;
						}
						UILabel.mTempVerts.Clear();
						UILabel.mTempIndices.Clear();
						return approximateCharacterIndex;
					}
					else
					{
						i++;
					}
				}
				UILabel.mTempVerts.Clear();
				UILabel.mTempIndices.Clear();
			}
			NGUIText.bitmapFont = null;
			NGUIText.dynamicFont = null;
			if (key == 273 || key == 278)
			{
				return 0;
			}
			if (key == 274 || key == 279)
			{
				return processedText.Length;
			}
		}
		return currentIndex;
	}

	// Token: 0x0600099A RID: 2458 RVA: 0x000461FC File Offset: 0x000443FC
	public void PrintOverlay(int start, int end, UIGeometry caret, UIGeometry highlight, Color caretColor, Color highlightColor)
	{
		if (caret != null)
		{
			caret.Clear();
		}
		if (highlight != null)
		{
			highlight.Clear();
		}
		if (!this.isValid)
		{
			return;
		}
		string processedText = this.processedText;
		this.UpdateNGUIText();
		int size = caret.verts.size;
		Vector2 item;
		item..ctor(0.5f, 0.5f);
		float finalAlpha = this.finalAlpha;
		if (highlight != null && start != end)
		{
			int size2 = highlight.verts.size;
			NGUIText.PrintCaretAndSelection(processedText, start, end, caret.verts, highlight.verts);
			if (highlight.verts.size > size2)
			{
				this.ApplyOffset(highlight.verts, size2);
				Color32 item2 = new Color(highlightColor.r, highlightColor.g, highlightColor.b, highlightColor.a * finalAlpha);
				for (int i = size2; i < highlight.verts.size; i++)
				{
					highlight.uvs.Add(item);
					highlight.cols.Add(item2);
				}
			}
		}
		else
		{
			NGUIText.PrintCaretAndSelection(processedText, start, end, caret.verts, null);
		}
		this.ApplyOffset(caret.verts, size);
		Color32 item3 = new Color(caretColor.r, caretColor.g, caretColor.b, caretColor.a * finalAlpha);
		for (int j = size; j < caret.verts.size; j++)
		{
			caret.uvs.Add(item);
			caret.cols.Add(item3);
		}
		NGUIText.bitmapFont = null;
		NGUIText.dynamicFont = null;
	}

	// Token: 0x0600099B RID: 2459 RVA: 0x000463AC File Offset: 0x000445AC
	public override void OnFill(BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols)
	{
		if (!this.isValid)
		{
			return;
		}
		int num = verts.size;
		Color color = base.color;
		color.a = this.finalAlpha;
		if (this.mFont != null && this.mFont.premultipliedAlphaShader)
		{
			color = NGUITools.ApplyPMA(color);
		}
		if (QualitySettings.activeColorSpace == 1)
		{
			color.r = Mathf.GammaToLinearSpace(color.r);
			color.g = Mathf.GammaToLinearSpace(color.g);
			color.b = Mathf.GammaToLinearSpace(color.b);
			color.a = Mathf.GammaToLinearSpace(color.a);
		}
		string processedText = this.processedText;
		int size = verts.size;
		this.UpdateNGUIText();
		NGUIText.tint = color;
		NGUIText.Print(processedText, verts, uvs, cols);
		NGUIText.bitmapFont = null;
		NGUIText.dynamicFont = null;
		Vector2 vector = this.ApplyOffset(verts, size);
		if (this.mFont != null && this.mFont.packedFontShader)
		{
			return;
		}
		if (this.effectStyle != UILabel.Effect.None)
		{
			int size2 = verts.size;
			vector.x = this.mEffectDistance.x;
			vector.y = this.mEffectDistance.y;
			this.ApplyShadow(verts, uvs, cols, num, size2, vector.x, -vector.y);
			if (this.effectStyle == UILabel.Effect.Outline || this.effectStyle == UILabel.Effect.Outline8)
			{
				num = size2;
				size2 = verts.size;
				this.ApplyShadow(verts, uvs, cols, num, size2, -vector.x, vector.y);
				num = size2;
				size2 = verts.size;
				this.ApplyShadow(verts, uvs, cols, num, size2, vector.x, vector.y);
				num = size2;
				size2 = verts.size;
				this.ApplyShadow(verts, uvs, cols, num, size2, -vector.x, -vector.y);
				if (this.effectStyle == UILabel.Effect.Outline8)
				{
					num = size2;
					size2 = verts.size;
					this.ApplyShadow(verts, uvs, cols, num, size2, -vector.x, 0f);
					num = size2;
					size2 = verts.size;
					this.ApplyShadow(verts, uvs, cols, num, size2, vector.x, 0f);
					num = size2;
					size2 = verts.size;
					this.ApplyShadow(verts, uvs, cols, num, size2, 0f, vector.y);
					num = size2;
					size2 = verts.size;
					this.ApplyShadow(verts, uvs, cols, num, size2, 0f, -vector.y);
				}
			}
		}
		if (this.onPostFill != null)
		{
			this.onPostFill(this, num, verts, uvs, cols);
		}
	}

	// Token: 0x0600099C RID: 2460 RVA: 0x0004664C File Offset: 0x0004484C
	public Vector2 ApplyOffset(BetterList<Vector3> verts, int start)
	{
		Vector2 pivotOffset = base.pivotOffset;
		float num = Mathf.Lerp(0f, (float)(-(float)this.mWidth), pivotOffset.x);
		float num2 = Mathf.Lerp((float)this.mHeight, 0f, pivotOffset.y) + Mathf.Lerp(this.mCalculatedSize.y - (float)this.mHeight, 0f, pivotOffset.y);
		num = Mathf.Round(num);
		num2 = Mathf.Round(num2);
		for (int i = start; i < verts.size; i++)
		{
			Vector3[] buffer = verts.buffer;
			int num3 = i;
			buffer[num3].x = buffer[num3].x + num;
			Vector3[] buffer2 = verts.buffer;
			int num4 = i;
			buffer2[num4].y = buffer2[num4].y + num2;
		}
		return new Vector2(num, num2);
	}

	// Token: 0x0600099D RID: 2461 RVA: 0x00046718 File Offset: 0x00044918
	public void ApplyShadow(BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols, int start, int end, float x, float y)
	{
		Color color = this.mEffectColor;
		color.a *= this.finalAlpha;
		if (this.bitmapFont != null && this.bitmapFont.premultipliedAlphaShader)
		{
			color = NGUITools.ApplyPMA(color);
		}
		if (QualitySettings.activeColorSpace == 1)
		{
			color.r = Mathf.GammaToLinearSpace(color.r);
			color.g = Mathf.GammaToLinearSpace(color.g);
			color.b = Mathf.GammaToLinearSpace(color.b);
			color.a = Mathf.GammaToLinearSpace(color.a);
		}
		Color32 color2 = color;
		for (int i = start; i < end; i++)
		{
			verts.Add(verts.buffer[i]);
			uvs.Add(uvs.buffer[i]);
			cols.Add(cols.buffer[i]);
			Vector3 vector = verts.buffer[i];
			vector.x += x;
			vector.y += y;
			verts.buffer[i] = vector;
			Color32 color3 = cols.buffer[i];
			if (color3.a == 255)
			{
				cols.buffer[i] = color2;
			}
			else
			{
				Color color4 = color;
				color4.a = (float)color3.a / 255f * color.a;
				if (QualitySettings.activeColorSpace == 1)
				{
					color4.a = Mathf.GammaToLinearSpace(color4.a);
				}
				cols.buffer[i] = color4;
			}
		}
	}

	// Token: 0x0600099E RID: 2462 RVA: 0x000468F4 File Offset: 0x00044AF4
	public int CalculateOffsetToFit(string text)
	{
		this.UpdateNGUIText();
		NGUIText.encoding = false;
		NGUIText.symbolStyle = NGUIText.SymbolStyle.None;
		int result = NGUIText.CalculateOffsetToFit(text);
		NGUIText.bitmapFont = null;
		NGUIText.dynamicFont = null;
		return result;
	}

	// Token: 0x0600099F RID: 2463 RVA: 0x00046928 File Offset: 0x00044B28
	public void SetCurrentProgress()
	{
		if (UIProgressBar.current != null)
		{
			this.text = UIProgressBar.current.value.ToString("F");
		}
	}

	// Token: 0x060009A0 RID: 2464 RVA: 0x00046964 File Offset: 0x00044B64
	public void SetCurrentPercent()
	{
		if (UIProgressBar.current != null)
		{
			this.text = Mathf.RoundToInt(UIProgressBar.current.value * 100f) + "%";
		}
	}

	// Token: 0x060009A1 RID: 2465 RVA: 0x000469AC File Offset: 0x00044BAC
	public void SetCurrentSelection()
	{
		if (UIPopupList.current != null)
		{
			this.text = ((!UIPopupList.current.isLocalized) ? UIPopupList.current.value : Localization.Get(UIPopupList.current.value));
		}
	}

	// Token: 0x060009A2 RID: 2466 RVA: 0x000469FC File Offset: 0x00044BFC
	public bool Wrap(string text, out string final)
	{
		return this.Wrap(text, out final, 1000000);
	}

	// Token: 0x060009A3 RID: 2467 RVA: 0x00046A0C File Offset: 0x00044C0C
	public bool Wrap(string text, out string final, int height)
	{
		this.UpdateNGUIText();
		NGUIText.rectHeight = height;
		NGUIText.regionHeight = height;
		bool result = NGUIText.WrapText(text, out final, false);
		NGUIText.bitmapFont = null;
		NGUIText.dynamicFont = null;
		return result;
	}

	// Token: 0x060009A4 RID: 2468 RVA: 0x00046A44 File Offset: 0x00044C44
	public void UpdateNGUIText()
	{
		Font trueTypeFont = this.trueTypeFont;
		bool flag = trueTypeFont != null;
		NGUIText.fontSize = this.mFinalFontSize;
		NGUIText.fontStyle = this.mFontStyle;
		NGUIText.rectWidth = this.mWidth;
		NGUIText.rectHeight = this.mHeight;
		NGUIText.regionWidth = Mathf.RoundToInt((float)this.mWidth * (this.mDrawRegion.z - this.mDrawRegion.x));
		NGUIText.regionHeight = Mathf.RoundToInt((float)this.mHeight * (this.mDrawRegion.w - this.mDrawRegion.y));
		NGUIText.gradient = (this.mApplyGradient && (this.mFont == null || !this.mFont.packedFontShader));
		NGUIText.gradientTop = this.mGradientTop;
		NGUIText.gradientBottom = this.mGradientBottom;
		NGUIText.encoding = this.mEncoding;
		NGUIText.premultiply = this.mPremultiply;
		NGUIText.symbolStyle = this.mSymbols;
		NGUIText.maxLines = this.mMaxLineCount;
		NGUIText.spacingX = this.effectiveSpacingX;
		NGUIText.spacingY = this.effectiveSpacingY;
		NGUIText.fontScale = ((!flag) ? ((float)this.mFontSize / (float)this.mFont.defaultSize * this.mScale) : this.mScale);
		if (this.mFont != null)
		{
			NGUIText.bitmapFont = this.mFont;
			for (;;)
			{
				UIFont replacement = NGUIText.bitmapFont.replacement;
				if (replacement == null)
				{
					break;
				}
				NGUIText.bitmapFont = replacement;
			}
			if (NGUIText.bitmapFont.isDynamic)
			{
				NGUIText.dynamicFont = NGUIText.bitmapFont.dynamicFont;
				NGUIText.bitmapFont = null;
			}
			else
			{
				NGUIText.dynamicFont = null;
			}
		}
		else
		{
			NGUIText.dynamicFont = trueTypeFont;
			NGUIText.bitmapFont = null;
		}
		if (flag && this.keepCrisp)
		{
			UIRoot root = base.root;
			if (root != null)
			{
				NGUIText.pixelDensity = ((!(root != null)) ? 1f : root.pixelSizeAdjustment);
			}
		}
		else
		{
			NGUIText.pixelDensity = 1f;
		}
		if (this.mDensity != NGUIText.pixelDensity)
		{
			this.ProcessText(false, false);
			NGUIText.rectWidth = this.mWidth;
			NGUIText.rectHeight = this.mHeight;
			NGUIText.regionWidth = Mathf.RoundToInt((float)this.mWidth * (this.mDrawRegion.z - this.mDrawRegion.x));
			NGUIText.regionHeight = Mathf.RoundToInt((float)this.mHeight * (this.mDrawRegion.w - this.mDrawRegion.y));
		}
		if (this.alignment == NGUIText.Alignment.Automatic)
		{
			UIWidget.Pivot pivot = base.pivot;
			if (pivot == UIWidget.Pivot.Left || pivot == UIWidget.Pivot.TopLeft || pivot == UIWidget.Pivot.BottomLeft)
			{
				NGUIText.alignment = NGUIText.Alignment.Left;
			}
			else if (pivot == UIWidget.Pivot.Right || pivot == UIWidget.Pivot.TopRight || pivot == UIWidget.Pivot.BottomRight)
			{
				NGUIText.alignment = NGUIText.Alignment.Right;
			}
			else
			{
				NGUIText.alignment = NGUIText.Alignment.Center;
			}
		}
		else
		{
			NGUIText.alignment = this.alignment;
		}
		NGUIText.Update();
	}

	// Token: 0x060009A5 RID: 2469 RVA: 0x00046D6C File Offset: 0x00044F6C
	private void OnApplicationPause(bool paused)
	{
		if (!paused && this.mTrueTypeFont != null)
		{
			this.Invalidate(false);
		}
	}

	// Token: 0x040008B4 RID: 2228
	public UILabel.Crispness keepCrispWhenShrunk = UILabel.Crispness.OnDesktop;

	// Token: 0x040008B5 RID: 2229
	[SerializeField]
	[HideInInspector]
	private Font mTrueTypeFont;

	// Token: 0x040008B6 RID: 2230
	[SerializeField]
	[HideInInspector]
	private UIFont mFont;

	// Token: 0x040008B7 RID: 2231
	[HideInInspector]
	[SerializeField]
	[Multiline(6)]
	private string mText = string.Empty;

	// Token: 0x040008B8 RID: 2232
	[SerializeField]
	[HideInInspector]
	private int mFontSize = 16;

	// Token: 0x040008B9 RID: 2233
	[HideInInspector]
	[SerializeField]
	private FontStyle mFontStyle;

	// Token: 0x040008BA RID: 2234
	[SerializeField]
	[HideInInspector]
	private NGUIText.Alignment mAlignment;

	// Token: 0x040008BB RID: 2235
	[SerializeField]
	[HideInInspector]
	private bool mEncoding = true;

	// Token: 0x040008BC RID: 2236
	[HideInInspector]
	[SerializeField]
	private int mMaxLineCount;

	// Token: 0x040008BD RID: 2237
	[SerializeField]
	[HideInInspector]
	private UILabel.Effect mEffectStyle;

	// Token: 0x040008BE RID: 2238
	[HideInInspector]
	[SerializeField]
	private Color mEffectColor = Color.black;

	// Token: 0x040008BF RID: 2239
	[SerializeField]
	[HideInInspector]
	private NGUIText.SymbolStyle mSymbols = NGUIText.SymbolStyle.Normal;

	// Token: 0x040008C0 RID: 2240
	[HideInInspector]
	[SerializeField]
	private Vector2 mEffectDistance = Vector2.one;

	// Token: 0x040008C1 RID: 2241
	[HideInInspector]
	[SerializeField]
	private UILabel.Overflow mOverflow;

	// Token: 0x040008C2 RID: 2242
	[HideInInspector]
	[SerializeField]
	private Material mMaterial;

	// Token: 0x040008C3 RID: 2243
	[SerializeField]
	[HideInInspector]
	private bool mApplyGradient;

	// Token: 0x040008C4 RID: 2244
	[SerializeField]
	[HideInInspector]
	private Color mGradientTop = Color.white;

	// Token: 0x040008C5 RID: 2245
	[SerializeField]
	[HideInInspector]
	private Color mGradientBottom = new Color(0.7f, 0.7f, 0.7f);

	// Token: 0x040008C6 RID: 2246
	[HideInInspector]
	[SerializeField]
	private int mSpacingX;

	// Token: 0x040008C7 RID: 2247
	[HideInInspector]
	[SerializeField]
	private int mSpacingY;

	// Token: 0x040008C8 RID: 2248
	[SerializeField]
	[HideInInspector]
	private bool mUseFloatSpacing;

	// Token: 0x040008C9 RID: 2249
	[HideInInspector]
	[SerializeField]
	private float mFloatSpacingX;

	// Token: 0x040008CA RID: 2250
	[SerializeField]
	[HideInInspector]
	private float mFloatSpacingY;

	// Token: 0x040008CB RID: 2251
	[SerializeField]
	[HideInInspector]
	private bool mOverflowEllipsis;

	// Token: 0x040008CC RID: 2252
	[SerializeField]
	[HideInInspector]
	private int mOverflowWidth;

	// Token: 0x040008CD RID: 2253
	[HideInInspector]
	[SerializeField]
	private bool mShrinkToFit;

	// Token: 0x040008CE RID: 2254
	[SerializeField]
	[HideInInspector]
	private int mMaxLineWidth;

	// Token: 0x040008CF RID: 2255
	[HideInInspector]
	[SerializeField]
	private int mMaxLineHeight;

	// Token: 0x040008D0 RID: 2256
	[HideInInspector]
	[SerializeField]
	private float mLineWidth;

	// Token: 0x040008D1 RID: 2257
	[SerializeField]
	[HideInInspector]
	private bool mMultiline = true;

	// Token: 0x040008D2 RID: 2258
	[NonSerialized]
	private Font mActiveTTF;

	// Token: 0x040008D3 RID: 2259
	[NonSerialized]
	private float mDensity = 1f;

	// Token: 0x040008D4 RID: 2260
	[NonSerialized]
	private bool mShouldBeProcessed = true;

	// Token: 0x040008D5 RID: 2261
	[NonSerialized]
	private string mProcessedText;

	// Token: 0x040008D6 RID: 2262
	[NonSerialized]
	private bool mPremultiply;

	// Token: 0x040008D7 RID: 2263
	[NonSerialized]
	private Vector2 mCalculatedSize = Vector2.zero;

	// Token: 0x040008D8 RID: 2264
	[NonSerialized]
	private float mScale = 1f;

	// Token: 0x040008D9 RID: 2265
	[NonSerialized]
	private int mFinalFontSize;

	// Token: 0x040008DA RID: 2266
	[NonSerialized]
	private int mLastWidth;

	// Token: 0x040008DB RID: 2267
	[NonSerialized]
	private int mLastHeight;

	// Token: 0x040008DC RID: 2268
	private static BetterList<UILabel> mList = new BetterList<UILabel>();

	// Token: 0x040008DD RID: 2269
	private static Dictionary<Font, int> mFontUsage = new Dictionary<Font, int>();

	// Token: 0x040008DE RID: 2270
	private static List<UIDrawCall> mTempDrawcalls;

	// Token: 0x040008DF RID: 2271
	private static bool mTexRebuildAdded = false;

	// Token: 0x040008E0 RID: 2272
	private static BetterList<Vector3> mTempVerts = new BetterList<Vector3>();

	// Token: 0x040008E1 RID: 2273
	private static BetterList<int> mTempIndices = new BetterList<int>();

	// Token: 0x02000125 RID: 293
	public enum Effect
	{
		// Token: 0x040008E3 RID: 2275
		None,
		// Token: 0x040008E4 RID: 2276
		Shadow,
		// Token: 0x040008E5 RID: 2277
		Outline,
		// Token: 0x040008E6 RID: 2278
		Outline8
	}

	// Token: 0x02000126 RID: 294
	public enum Overflow
	{
		// Token: 0x040008E8 RID: 2280
		ShrinkContent,
		// Token: 0x040008E9 RID: 2281
		ClampContent,
		// Token: 0x040008EA RID: 2282
		ResizeFreely,
		// Token: 0x040008EB RID: 2283
		ResizeHeight
	}

	// Token: 0x02000127 RID: 295
	public enum Crispness
	{
		// Token: 0x040008ED RID: 2285
		Never,
		// Token: 0x040008EE RID: 2286
		OnDesktop,
		// Token: 0x040008EF RID: 2287
		Always
	}
}
