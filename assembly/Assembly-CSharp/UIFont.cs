using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200011D RID: 285
[ExecuteInEditMode]
[AddComponentMenu("NGUI/UI/NGUI Font")]
public class UIFont : MonoBehaviour
{
	// Token: 0x17000115 RID: 277
	// (get) Token: 0x060008D3 RID: 2259 RVA: 0x00041810 File Offset: 0x0003FA10
	// (set) Token: 0x060008D4 RID: 2260 RVA: 0x0004183C File Offset: 0x0003FA3C
	public BMFont bmFont
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.mFont : this.mReplacement.bmFont;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.bmFont = value;
			}
			else
			{
				this.mFont = value;
			}
		}
	}

	// Token: 0x17000116 RID: 278
	// (get) Token: 0x060008D5 RID: 2261 RVA: 0x00041868 File Offset: 0x0003FA68
	// (set) Token: 0x060008D6 RID: 2262 RVA: 0x000418A8 File Offset: 0x0003FAA8
	public int texWidth
	{
		get
		{
			return (!(this.mReplacement != null)) ? ((this.mFont == null) ? 1 : this.mFont.texWidth) : this.mReplacement.texWidth;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.texWidth = value;
			}
			else if (this.mFont != null)
			{
				this.mFont.texWidth = value;
			}
		}
	}

	// Token: 0x17000117 RID: 279
	// (get) Token: 0x060008D7 RID: 2263 RVA: 0x000418E4 File Offset: 0x0003FAE4
	// (set) Token: 0x060008D8 RID: 2264 RVA: 0x00041924 File Offset: 0x0003FB24
	public int texHeight
	{
		get
		{
			return (!(this.mReplacement != null)) ? ((this.mFont == null) ? 1 : this.mFont.texHeight) : this.mReplacement.texHeight;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.texHeight = value;
			}
			else if (this.mFont != null)
			{
				this.mFont.texHeight = value;
			}
		}
	}

	// Token: 0x17000118 RID: 280
	// (get) Token: 0x060008D9 RID: 2265 RVA: 0x00041960 File Offset: 0x0003FB60
	public bool hasSymbols
	{
		get
		{
			return (!(this.mReplacement != null)) ? (this.mSymbols != null && this.mSymbols.Count != 0) : this.mReplacement.hasSymbols;
		}
	}

	// Token: 0x17000119 RID: 281
	// (get) Token: 0x060008DA RID: 2266 RVA: 0x000419B0 File Offset: 0x0003FBB0
	public List<BMSymbol> symbols
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.mSymbols : this.mReplacement.symbols;
		}
	}

	// Token: 0x1700011A RID: 282
	// (get) Token: 0x060008DB RID: 2267 RVA: 0x000419DC File Offset: 0x0003FBDC
	// (set) Token: 0x060008DC RID: 2268 RVA: 0x00041A08 File Offset: 0x0003FC08
	public UIAtlas atlas
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.mAtlas : this.mReplacement.atlas;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.atlas = value;
			}
			else if (this.mAtlas != value)
			{
				this.mPMA = -1;
				this.mAtlas = value;
				if (this.mAtlas != null)
				{
					this.mMat = this.mAtlas.spriteMaterial;
					if (this.sprite != null)
					{
						this.mUVRect = this.uvRect;
					}
				}
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700011B RID: 283
	// (get) Token: 0x060008DD RID: 2269 RVA: 0x00041A98 File Offset: 0x0003FC98
	// (set) Token: 0x060008DE RID: 2270 RVA: 0x00041B5C File Offset: 0x0003FD5C
	public Material material
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.material;
			}
			if (this.mAtlas != null)
			{
				return this.mAtlas.spriteMaterial;
			}
			if (this.mMat != null)
			{
				if (this.mDynamicFont != null && this.mMat != this.mDynamicFont.material)
				{
					this.mMat.mainTexture = this.mDynamicFont.material.mainTexture;
				}
				return this.mMat;
			}
			if (this.mDynamicFont != null)
			{
				return this.mDynamicFont.material;
			}
			return null;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.material = value;
			}
			else if (this.mMat != value)
			{
				this.mPMA = -1;
				this.mMat = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x1700011C RID: 284
	// (get) Token: 0x060008DF RID: 2271 RVA: 0x00041BB0 File Offset: 0x0003FDB0
	[Obsolete("Use UIFont.premultipliedAlphaShader instead")]
	public bool premultipliedAlpha
	{
		get
		{
			return this.premultipliedAlphaShader;
		}
	}

	// Token: 0x1700011D RID: 285
	// (get) Token: 0x060008E0 RID: 2272 RVA: 0x00041BB8 File Offset: 0x0003FDB8
	public bool premultipliedAlphaShader
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.premultipliedAlphaShader;
			}
			if (this.mAtlas != null)
			{
				return this.mAtlas.premultipliedAlpha;
			}
			if (this.mPMA == -1)
			{
				Material material = this.material;
				this.mPMA = ((!(material != null) || !(material.shader != null) || !material.shader.name.Contains("Premultiplied")) ? 0 : 1);
			}
			return this.mPMA == 1;
		}
	}

	// Token: 0x1700011E RID: 286
	// (get) Token: 0x060008E1 RID: 2273 RVA: 0x00041C60 File Offset: 0x0003FE60
	public bool packedFontShader
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.packedFontShader;
			}
			if (this.mAtlas != null)
			{
				return false;
			}
			if (this.mPacked == -1)
			{
				Material material = this.material;
				this.mPacked = ((!(material != null) || !(material.shader != null) || !material.shader.name.Contains("Packed")) ? 0 : 1);
			}
			return this.mPacked == 1;
		}
	}

	// Token: 0x1700011F RID: 287
	// (get) Token: 0x060008E2 RID: 2274 RVA: 0x00041D00 File Offset: 0x0003FF00
	public Texture2D texture
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.texture;
			}
			Material material = this.material;
			return (!(material != null)) ? null : (material.mainTexture as Texture2D);
		}
	}

	// Token: 0x17000120 RID: 288
	// (get) Token: 0x060008E3 RID: 2275 RVA: 0x00041D50 File Offset: 0x0003FF50
	// (set) Token: 0x060008E4 RID: 2276 RVA: 0x00041DBC File Offset: 0x0003FFBC
	public Rect uvRect
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.uvRect;
			}
			return (!(this.mAtlas != null) || this.sprite == null) ? new Rect(0f, 0f, 1f, 1f) : this.mUVRect;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.uvRect = value;
			}
			else if (this.sprite == null && this.mUVRect != value)
			{
				this.mUVRect = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000121 RID: 289
	// (get) Token: 0x060008E5 RID: 2277 RVA: 0x00041E14 File Offset: 0x00040014
	// (set) Token: 0x060008E6 RID: 2278 RVA: 0x00041E50 File Offset: 0x00040050
	public string spriteName
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.mFont.spriteName : this.mReplacement.spriteName;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.spriteName = value;
			}
			else if (this.mFont.spriteName != value)
			{
				this.mFont.spriteName = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000122 RID: 290
	// (get) Token: 0x060008E7 RID: 2279 RVA: 0x00041EA8 File Offset: 0x000400A8
	public bool isValid
	{
		get
		{
			return this.mDynamicFont != null || this.mFont.isValid;
		}
	}

	// Token: 0x17000123 RID: 291
	// (get) Token: 0x060008E8 RID: 2280 RVA: 0x00041ECC File Offset: 0x000400CC
	// (set) Token: 0x060008E9 RID: 2281 RVA: 0x00041ED4 File Offset: 0x000400D4
	[Obsolete("Use UIFont.defaultSize instead")]
	public int size
	{
		get
		{
			return this.defaultSize;
		}
		set
		{
			this.defaultSize = value;
		}
	}

	// Token: 0x17000124 RID: 292
	// (get) Token: 0x060008EA RID: 2282 RVA: 0x00041EE0 File Offset: 0x000400E0
	// (set) Token: 0x060008EB RID: 2283 RVA: 0x00041F34 File Offset: 0x00040134
	public int defaultSize
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.defaultSize;
			}
			if (this.isDynamic || this.mFont == null)
			{
				return this.mDynamicFontSize;
			}
			return this.mFont.charSize;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.defaultSize = value;
			}
			else
			{
				this.mDynamicFontSize = value;
			}
		}
	}

	// Token: 0x17000125 RID: 293
	// (get) Token: 0x060008EC RID: 2284 RVA: 0x00041F60 File Offset: 0x00040160
	public UISpriteData sprite
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.sprite;
			}
			if (this.mSprite == null && this.mAtlas != null && !string.IsNullOrEmpty(this.mFont.spriteName))
			{
				this.mSprite = this.mAtlas.GetSprite(this.mFont.spriteName);
				if (this.mSprite == null)
				{
					this.mSprite = this.mAtlas.GetSprite(base.name);
				}
				if (this.mSprite == null)
				{
					this.mFont.spriteName = null;
				}
				else
				{
					this.UpdateUVRect();
				}
				int i = 0;
				int count = this.mSymbols.Count;
				while (i < count)
				{
					this.symbols[i].MarkAsChanged();
					i++;
				}
			}
			return this.mSprite;
		}
	}

	// Token: 0x17000126 RID: 294
	// (get) Token: 0x060008ED RID: 2285 RVA: 0x00042050 File Offset: 0x00040250
	// (set) Token: 0x060008EE RID: 2286 RVA: 0x00042058 File Offset: 0x00040258
	public UIFont replacement
	{
		get
		{
			return this.mReplacement;
		}
		set
		{
			UIFont uifont = value;
			if (uifont == this)
			{
				uifont = null;
			}
			if (this.mReplacement != uifont)
			{
				if (uifont != null && uifont.replacement == this)
				{
					uifont.replacement = null;
				}
				if (this.mReplacement != null)
				{
					this.MarkAsChanged();
				}
				this.mReplacement = uifont;
				if (uifont != null)
				{
					this.mPMA = -1;
					this.mMat = null;
					this.mFont = null;
					this.mDynamicFont = null;
				}
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000127 RID: 295
	// (get) Token: 0x060008EF RID: 2287 RVA: 0x000420F8 File Offset: 0x000402F8
	public bool isDynamic
	{
		get
		{
			return (!(this.mReplacement != null)) ? (this.mDynamicFont != null) : this.mReplacement.isDynamic;
		}
	}

	// Token: 0x17000128 RID: 296
	// (get) Token: 0x060008F0 RID: 2288 RVA: 0x00042128 File Offset: 0x00040328
	// (set) Token: 0x060008F1 RID: 2289 RVA: 0x00042154 File Offset: 0x00040354
	public Font dynamicFont
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.mDynamicFont : this.mReplacement.dynamicFont;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.dynamicFont = value;
			}
			else if (this.mDynamicFont != value)
			{
				if (this.mDynamicFont != null)
				{
					this.material = null;
				}
				this.mDynamicFont = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x17000129 RID: 297
	// (get) Token: 0x060008F2 RID: 2290 RVA: 0x000421BC File Offset: 0x000403BC
	// (set) Token: 0x060008F3 RID: 2291 RVA: 0x000421E8 File Offset: 0x000403E8
	public FontStyle dynamicFontStyle
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.mDynamicFontStyle : this.mReplacement.dynamicFontStyle;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.dynamicFontStyle = value;
			}
			else if (this.mDynamicFontStyle != value)
			{
				this.mDynamicFontStyle = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x060008F4 RID: 2292 RVA: 0x00042228 File Offset: 0x00040428
	private void Trim()
	{
		Texture texture = this.mAtlas.texture;
		if (texture != null && this.mSprite != null)
		{
			Rect rect = NGUIMath.ConvertToPixels(this.mUVRect, this.texture.width, this.texture.height, true);
			Rect rect2;
			rect2..ctor((float)this.mSprite.x, (float)this.mSprite.y, (float)this.mSprite.width, (float)this.mSprite.height);
			int xMin = Mathf.RoundToInt(rect2.xMin - rect.xMin);
			int yMin = Mathf.RoundToInt(rect2.yMin - rect.yMin);
			int xMax = Mathf.RoundToInt(rect2.xMax - rect.xMin);
			int yMax = Mathf.RoundToInt(rect2.yMax - rect.yMin);
			this.mFont.Trim(xMin, yMin, xMax, yMax);
		}
	}

	// Token: 0x060008F5 RID: 2293 RVA: 0x0004231C File Offset: 0x0004051C
	private bool References(UIFont font)
	{
		return !(font == null) && (font == this || (this.mReplacement != null && this.mReplacement.References(font)));
	}

	// Token: 0x060008F6 RID: 2294 RVA: 0x00042368 File Offset: 0x00040568
	public static bool CheckIfRelated(UIFont a, UIFont b)
	{
		return !(a == null) && !(b == null) && ((a.isDynamic && b.isDynamic && a.dynamicFont.fontNames[0] == b.dynamicFont.fontNames[0]) || a == b || a.References(b) || b.References(a));
	}

	// Token: 0x1700012A RID: 298
	// (get) Token: 0x060008F7 RID: 2295 RVA: 0x000423F0 File Offset: 0x000405F0
	private Texture dynamicTexture
	{
		get
		{
			if (this.mReplacement)
			{
				return this.mReplacement.dynamicTexture;
			}
			if (this.isDynamic)
			{
				return this.mDynamicFont.material.mainTexture;
			}
			return null;
		}
	}

	// Token: 0x060008F8 RID: 2296 RVA: 0x00042438 File Offset: 0x00040638
	public void MarkAsChanged()
	{
		if (this.mReplacement != null)
		{
			this.mReplacement.MarkAsChanged();
		}
		this.mSprite = null;
		UILabel[] array = NGUITools.FindActive<UILabel>();
		int i = 0;
		int num = array.Length;
		while (i < num)
		{
			UILabel uilabel = array[i];
			if (uilabel.enabled && NGUITools.GetActive(uilabel.gameObject) && UIFont.CheckIfRelated(this, uilabel.bitmapFont))
			{
				UIFont bitmapFont = uilabel.bitmapFont;
				uilabel.bitmapFont = null;
				uilabel.bitmapFont = bitmapFont;
			}
			i++;
		}
		int j = 0;
		int count = this.symbols.Count;
		while (j < count)
		{
			this.symbols[j].MarkAsChanged();
			j++;
		}
	}

	// Token: 0x060008F9 RID: 2297 RVA: 0x00042504 File Offset: 0x00040704
	public void UpdateUVRect()
	{
		if (this.mAtlas == null)
		{
			return;
		}
		Texture texture = this.mAtlas.texture;
		if (texture != null)
		{
			this.mUVRect = new Rect((float)(this.mSprite.x - this.mSprite.paddingLeft), (float)(this.mSprite.y - this.mSprite.paddingTop), (float)(this.mSprite.width + this.mSprite.paddingLeft + this.mSprite.paddingRight), (float)(this.mSprite.height + this.mSprite.paddingTop + this.mSprite.paddingBottom));
			this.mUVRect = NGUIMath.ConvertToTexCoords(this.mUVRect, texture.width, texture.height);
			if (this.mSprite.hasPadding)
			{
				this.Trim();
			}
		}
	}

	// Token: 0x060008FA RID: 2298 RVA: 0x000425F4 File Offset: 0x000407F4
	private BMSymbol GetSymbol(string sequence, bool createIfMissing)
	{
		int i = 0;
		int count = this.mSymbols.Count;
		while (i < count)
		{
			BMSymbol bmsymbol = this.mSymbols[i];
			if (bmsymbol.sequence == sequence)
			{
				return bmsymbol;
			}
			i++;
		}
		if (createIfMissing)
		{
			BMSymbol bmsymbol2 = new BMSymbol();
			bmsymbol2.sequence = sequence;
			this.mSymbols.Add(bmsymbol2);
			return bmsymbol2;
		}
		return null;
	}

	// Token: 0x060008FB RID: 2299 RVA: 0x00042664 File Offset: 0x00040864
	public BMSymbol MatchSymbol(string text, int offset, int textLength)
	{
		int count = this.mSymbols.Count;
		if (count == 0)
		{
			return null;
		}
		textLength -= offset;
		for (int i = 0; i < count; i++)
		{
			BMSymbol bmsymbol = this.mSymbols[i];
			int length = bmsymbol.length;
			if (length != 0 && textLength >= length)
			{
				bool flag = true;
				for (int j = 0; j < length; j++)
				{
					if (text.get_Chars(offset + j) != bmsymbol.sequence.get_Chars(j))
					{
						flag = false;
						break;
					}
				}
				if (flag && bmsymbol.Validate(this.atlas))
				{
					return bmsymbol;
				}
			}
		}
		return null;
	}

	// Token: 0x060008FC RID: 2300 RVA: 0x0004271C File Offset: 0x0004091C
	public void AddSymbol(string sequence, string spriteName)
	{
		BMSymbol symbol = this.GetSymbol(sequence, true);
		symbol.spriteName = spriteName;
		this.MarkAsChanged();
	}

	// Token: 0x060008FD RID: 2301 RVA: 0x00042740 File Offset: 0x00040940
	public void RemoveSymbol(string sequence)
	{
		BMSymbol symbol = this.GetSymbol(sequence, false);
		if (symbol != null)
		{
			this.symbols.Remove(symbol);
		}
		this.MarkAsChanged();
	}

	// Token: 0x060008FE RID: 2302 RVA: 0x00042770 File Offset: 0x00040970
	public void RenameSymbol(string before, string after)
	{
		BMSymbol symbol = this.GetSymbol(before, false);
		if (symbol != null)
		{
			symbol.sequence = after;
		}
		this.MarkAsChanged();
	}

	// Token: 0x060008FF RID: 2303 RVA: 0x0004279C File Offset: 0x0004099C
	public bool UsesSprite(string s)
	{
		if (!string.IsNullOrEmpty(s))
		{
			if (s.Equals(this.spriteName))
			{
				return true;
			}
			int i = 0;
			int count = this.symbols.Count;
			while (i < count)
			{
				BMSymbol bmsymbol = this.symbols[i];
				if (s.Equals(bmsymbol.spriteName))
				{
					return true;
				}
				i++;
			}
		}
		return false;
	}

	// Token: 0x04000864 RID: 2148
	[HideInInspector]
	[SerializeField]
	private Material mMat;

	// Token: 0x04000865 RID: 2149
	[HideInInspector]
	[SerializeField]
	private Rect mUVRect = new Rect(0f, 0f, 1f, 1f);

	// Token: 0x04000866 RID: 2150
	[HideInInspector]
	[SerializeField]
	private BMFont mFont = new BMFont();

	// Token: 0x04000867 RID: 2151
	[SerializeField]
	[HideInInspector]
	private UIAtlas mAtlas;

	// Token: 0x04000868 RID: 2152
	[SerializeField]
	[HideInInspector]
	private UIFont mReplacement;

	// Token: 0x04000869 RID: 2153
	[HideInInspector]
	[SerializeField]
	private List<BMSymbol> mSymbols = new List<BMSymbol>();

	// Token: 0x0400086A RID: 2154
	[HideInInspector]
	[SerializeField]
	private Font mDynamicFont;

	// Token: 0x0400086B RID: 2155
	[SerializeField]
	[HideInInspector]
	private int mDynamicFontSize = 16;

	// Token: 0x0400086C RID: 2156
	[SerializeField]
	[HideInInspector]
	private FontStyle mDynamicFontStyle;

	// Token: 0x0400086D RID: 2157
	[NonSerialized]
	private UISpriteData mSprite;

	// Token: 0x0400086E RID: 2158
	private int mPMA = -1;

	// Token: 0x0400086F RID: 2159
	private int mPacked = -1;
}
