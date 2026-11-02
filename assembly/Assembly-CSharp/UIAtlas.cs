using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000111 RID: 273
[AddComponentMenu("NGUI/UI/Atlas")]
public class UIAtlas : MonoBehaviour
{
	// Token: 0x170000F7 RID: 247
	// (get) Token: 0x06000863 RID: 2147 RVA: 0x0003C6F0 File Offset: 0x0003A8F0
	// (set) Token: 0x06000864 RID: 2148 RVA: 0x0003C71C File Offset: 0x0003A91C
	public Material spriteMaterial
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.material : this.mReplacement.spriteMaterial;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.spriteMaterial = value;
			}
			else if (this.material == null)
			{
				this.mPMA = 0;
				this.material = value;
			}
			else
			{
				this.MarkAsChanged();
				this.mPMA = -1;
				this.material = value;
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x170000F8 RID: 248
	// (get) Token: 0x06000865 RID: 2149 RVA: 0x0003C78C File Offset: 0x0003A98C
	public bool premultipliedAlpha
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.premultipliedAlpha;
			}
			if (this.mPMA == -1)
			{
				Material spriteMaterial = this.spriteMaterial;
				this.mPMA = ((!(spriteMaterial != null) || !(spriteMaterial.shader != null) || !spriteMaterial.shader.name.Contains("Premultiplied")) ? 0 : 1);
			}
			return this.mPMA == 1;
		}
	}

	// Token: 0x170000F9 RID: 249
	// (get) Token: 0x06000866 RID: 2150 RVA: 0x0003C818 File Offset: 0x0003AA18
	// (set) Token: 0x06000867 RID: 2151 RVA: 0x0003C860 File Offset: 0x0003AA60
	public List<UISpriteData> spriteList
	{
		get
		{
			if (this.mReplacement != null)
			{
				return this.mReplacement.spriteList;
			}
			if (this.mSprites.Count == 0)
			{
				this.Upgrade();
			}
			return this.mSprites;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.spriteList = value;
			}
			else
			{
				this.mSprites = value;
			}
		}
	}

	// Token: 0x170000FA RID: 250
	// (get) Token: 0x06000868 RID: 2152 RVA: 0x0003C88C File Offset: 0x0003AA8C
	public Texture texture
	{
		get
		{
			return (!(this.mReplacement != null)) ? ((!(this.material != null)) ? null : this.material.mainTexture) : this.mReplacement.texture;
		}
	}

	// Token: 0x170000FB RID: 251
	// (get) Token: 0x06000869 RID: 2153 RVA: 0x0003C8DC File Offset: 0x0003AADC
	// (set) Token: 0x0600086A RID: 2154 RVA: 0x0003C908 File Offset: 0x0003AB08
	public float pixelSize
	{
		get
		{
			return (!(this.mReplacement != null)) ? this.mPixelSize : this.mReplacement.pixelSize;
		}
		set
		{
			if (this.mReplacement != null)
			{
				this.mReplacement.pixelSize = value;
			}
			else
			{
				float num = Mathf.Clamp(value, 0.25f, 4f);
				if (this.mPixelSize != num)
				{
					this.mPixelSize = num;
					this.MarkAsChanged();
				}
			}
		}
	}

	// Token: 0x170000FC RID: 252
	// (get) Token: 0x0600086B RID: 2155 RVA: 0x0003C964 File Offset: 0x0003AB64
	// (set) Token: 0x0600086C RID: 2156 RVA: 0x0003C96C File Offset: 0x0003AB6C
	public UIAtlas replacement
	{
		get
		{
			return this.mReplacement;
		}
		set
		{
			UIAtlas uiatlas = value;
			if (uiatlas == this)
			{
				uiatlas = null;
			}
			if (this.mReplacement != uiatlas)
			{
				if (uiatlas != null && uiatlas.replacement == this)
				{
					uiatlas.replacement = null;
				}
				if (this.mReplacement != null)
				{
					this.MarkAsChanged();
				}
				this.mReplacement = uiatlas;
				if (uiatlas != null)
				{
					this.material = null;
				}
				this.MarkAsChanged();
			}
		}
	}

	// Token: 0x0600086D RID: 2157 RVA: 0x0003C9F8 File Offset: 0x0003ABF8
	public UISpriteData GetSprite(string name)
	{
		if (this.mReplacement != null)
		{
			return this.mReplacement.GetSprite(name);
		}
		if (!string.IsNullOrEmpty(name))
		{
			if (this.mSprites.Count == 0)
			{
				this.Upgrade();
			}
			if (this.mSprites.Count == 0)
			{
				return null;
			}
			if (this.mSpriteIndices.Count != this.mSprites.Count)
			{
				this.MarkSpriteListAsChanged();
			}
			int num;
			if (this.mSpriteIndices.TryGetValue(name, ref num))
			{
				if (num > -1 && num < this.mSprites.Count)
				{
					return this.mSprites[num];
				}
				this.MarkSpriteListAsChanged();
				return (!this.mSpriteIndices.TryGetValue(name, ref num)) ? null : this.mSprites[num];
			}
			else
			{
				int i = 0;
				int count = this.mSprites.Count;
				while (i < count)
				{
					UISpriteData uispriteData = this.mSprites[i];
					if (!string.IsNullOrEmpty(uispriteData.name) && name == uispriteData.name)
					{
						this.MarkSpriteListAsChanged();
						return uispriteData;
					}
					i++;
				}
			}
		}
		return null;
	}

	// Token: 0x0600086E RID: 2158 RVA: 0x0003CB34 File Offset: 0x0003AD34
	public string GetRandomSprite(string startsWith)
	{
		if (this.GetSprite(startsWith) == null)
		{
			List<UISpriteData> spriteList = this.spriteList;
			List<string> list = new List<string>();
			foreach (UISpriteData uispriteData in spriteList)
			{
				if (uispriteData.name.StartsWith(startsWith))
				{
					list.Add(uispriteData.name);
				}
			}
			return (list.Count <= 0) ? null : list[Random.Range(0, list.Count)];
		}
		return startsWith;
	}

	// Token: 0x0600086F RID: 2159 RVA: 0x0003CBEC File Offset: 0x0003ADEC
	public void MarkSpriteListAsChanged()
	{
		this.mSpriteIndices.Clear();
		int i = 0;
		int count = this.mSprites.Count;
		while (i < count)
		{
			this.mSpriteIndices[this.mSprites[i].name] = i;
			i++;
		}
	}

	// Token: 0x06000870 RID: 2160 RVA: 0x0003CC40 File Offset: 0x0003AE40
	public void SortAlphabetically()
	{
		this.mSprites.Sort((UISpriteData s1, UISpriteData s2) => s1.name.CompareTo(s2.name));
	}

	// Token: 0x06000871 RID: 2161 RVA: 0x0003CC78 File Offset: 0x0003AE78
	public BetterList<string> GetListOfSprites()
	{
		if (this.mReplacement != null)
		{
			return this.mReplacement.GetListOfSprites();
		}
		if (this.mSprites.Count == 0)
		{
			this.Upgrade();
		}
		BetterList<string> betterList = new BetterList<string>();
		int i = 0;
		int count = this.mSprites.Count;
		while (i < count)
		{
			UISpriteData uispriteData = this.mSprites[i];
			if (uispriteData != null && !string.IsNullOrEmpty(uispriteData.name))
			{
				betterList.Add(uispriteData.name);
			}
			i++;
		}
		return betterList;
	}

	// Token: 0x06000872 RID: 2162 RVA: 0x0003CD10 File Offset: 0x0003AF10
	public BetterList<string> GetListOfSprites(string match)
	{
		if (this.mReplacement)
		{
			return this.mReplacement.GetListOfSprites(match);
		}
		if (string.IsNullOrEmpty(match))
		{
			return this.GetListOfSprites();
		}
		if (this.mSprites.Count == 0)
		{
			this.Upgrade();
		}
		BetterList<string> betterList = new BetterList<string>();
		int i = 0;
		int count = this.mSprites.Count;
		while (i < count)
		{
			UISpriteData uispriteData = this.mSprites[i];
			if (uispriteData != null && !string.IsNullOrEmpty(uispriteData.name) && string.Equals(match, uispriteData.name, 5))
			{
				betterList.Add(uispriteData.name);
				return betterList;
			}
			i++;
		}
		string[] array = match.Split(new char[]
		{
			' '
		}, 1);
		for (int j = 0; j < array.Length; j++)
		{
			array[j] = array[j].ToLower();
		}
		int k = 0;
		int count2 = this.mSprites.Count;
		while (k < count2)
		{
			UISpriteData uispriteData2 = this.mSprites[k];
			if (uispriteData2 != null && !string.IsNullOrEmpty(uispriteData2.name))
			{
				string text = uispriteData2.name.ToLower();
				int num = 0;
				for (int l = 0; l < array.Length; l++)
				{
					if (text.Contains(array[l]))
					{
						num++;
					}
				}
				if (num == array.Length)
				{
					betterList.Add(uispriteData2.name);
				}
			}
			k++;
		}
		return betterList;
	}

	// Token: 0x06000873 RID: 2163 RVA: 0x0003CEAC File Offset: 0x0003B0AC
	private bool References(UIAtlas atlas)
	{
		return !(atlas == null) && (atlas == this || (this.mReplacement != null && this.mReplacement.References(atlas)));
	}

	// Token: 0x06000874 RID: 2164 RVA: 0x0003CEF8 File Offset: 0x0003B0F8
	public static bool CheckIfRelated(UIAtlas a, UIAtlas b)
	{
		return !(a == null) && !(b == null) && (a == b || a.References(b) || b.References(a));
	}

	// Token: 0x06000875 RID: 2165 RVA: 0x0003CF44 File Offset: 0x0003B144
	public void MarkAsChanged()
	{
		if (this.mReplacement != null)
		{
			this.mReplacement.MarkAsChanged();
		}
		UISprite[] array = NGUITools.FindActive<UISprite>();
		int i = 0;
		int num = array.Length;
		while (i < num)
		{
			UISprite uisprite = array[i];
			if (UIAtlas.CheckIfRelated(this, uisprite.atlas))
			{
				UIAtlas atlas = uisprite.atlas;
				uisprite.atlas = null;
				uisprite.atlas = atlas;
			}
			i++;
		}
		UIFont[] array2 = Resources.FindObjectsOfTypeAll(typeof(UIFont)) as UIFont[];
		int j = 0;
		int num2 = array2.Length;
		while (j < num2)
		{
			UIFont uifont = array2[j];
			if (UIAtlas.CheckIfRelated(this, uifont.atlas))
			{
				UIAtlas atlas2 = uifont.atlas;
				uifont.atlas = null;
				uifont.atlas = atlas2;
			}
			j++;
		}
		UILabel[] array3 = NGUITools.FindActive<UILabel>();
		int k = 0;
		int num3 = array3.Length;
		while (k < num3)
		{
			UILabel uilabel = array3[k];
			if (uilabel.bitmapFont != null && UIAtlas.CheckIfRelated(this, uilabel.bitmapFont.atlas))
			{
				UIFont bitmapFont = uilabel.bitmapFont;
				uilabel.bitmapFont = null;
				uilabel.bitmapFont = bitmapFont;
			}
			k++;
		}
	}

	// Token: 0x06000876 RID: 2166 RVA: 0x0003D08C File Offset: 0x0003B28C
	private bool Upgrade()
	{
		if (this.mReplacement)
		{
			return this.mReplacement.Upgrade();
		}
		if (this.mSprites.Count == 0 && this.sprites.Count > 0 && this.material)
		{
			Texture mainTexture = this.material.mainTexture;
			int width = (!(mainTexture != null)) ? 512 : mainTexture.width;
			int height = (!(mainTexture != null)) ? 512 : mainTexture.height;
			for (int i = 0; i < this.sprites.Count; i++)
			{
				UIAtlas.Sprite sprite = this.sprites[i];
				Rect outer = sprite.outer;
				Rect inner = sprite.inner;
				if (this.mCoordinates == UIAtlas.Coordinates.TexCoords)
				{
					NGUIMath.ConvertToPixels(outer, width, height, true);
					NGUIMath.ConvertToPixels(inner, width, height, true);
				}
				UISpriteData uispriteData = new UISpriteData();
				uispriteData.name = sprite.name;
				uispriteData.x = Mathf.RoundToInt(outer.xMin);
				uispriteData.y = Mathf.RoundToInt(outer.yMin);
				uispriteData.width = Mathf.RoundToInt(outer.width);
				uispriteData.height = Mathf.RoundToInt(outer.height);
				uispriteData.paddingLeft = Mathf.RoundToInt(sprite.paddingLeft * outer.width);
				uispriteData.paddingRight = Mathf.RoundToInt(sprite.paddingRight * outer.width);
				uispriteData.paddingBottom = Mathf.RoundToInt(sprite.paddingBottom * outer.height);
				uispriteData.paddingTop = Mathf.RoundToInt(sprite.paddingTop * outer.height);
				uispriteData.borderLeft = Mathf.RoundToInt(inner.xMin - outer.xMin);
				uispriteData.borderRight = Mathf.RoundToInt(outer.xMax - inner.xMax);
				uispriteData.borderBottom = Mathf.RoundToInt(outer.yMax - inner.yMax);
				uispriteData.borderTop = Mathf.RoundToInt(inner.yMin - outer.yMin);
				this.mSprites.Add(uispriteData);
			}
			this.sprites.Clear();
			return true;
		}
		return false;
	}

	// Token: 0x040007B7 RID: 1975
	[SerializeField]
	[HideInInspector]
	private Material material;

	// Token: 0x040007B8 RID: 1976
	[SerializeField]
	[HideInInspector]
	private List<UISpriteData> mSprites = new List<UISpriteData>();

	// Token: 0x040007B9 RID: 1977
	[HideInInspector]
	[SerializeField]
	private float mPixelSize = 1f;

	// Token: 0x040007BA RID: 1978
	[SerializeField]
	[HideInInspector]
	private UIAtlas mReplacement;

	// Token: 0x040007BB RID: 1979
	[HideInInspector]
	[SerializeField]
	private UIAtlas.Coordinates mCoordinates;

	// Token: 0x040007BC RID: 1980
	[SerializeField]
	[HideInInspector]
	private List<UIAtlas.Sprite> sprites = new List<UIAtlas.Sprite>();

	// Token: 0x040007BD RID: 1981
	private int mPMA = -1;

	// Token: 0x040007BE RID: 1982
	private Dictionary<string, int> mSpriteIndices = new Dictionary<string, int>();

	// Token: 0x02000112 RID: 274
	[Serializable]
	private class Sprite
	{
		// Token: 0x170000FD RID: 253
		// (get) Token: 0x06000879 RID: 2169 RVA: 0x0003D350 File Offset: 0x0003B550
		public bool hasPadding
		{
			get
			{
				return this.paddingLeft != 0f || this.paddingRight != 0f || this.paddingTop != 0f || this.paddingBottom != 0f;
			}
		}

		// Token: 0x040007C0 RID: 1984
		public string name = "Unity Bug";

		// Token: 0x040007C1 RID: 1985
		public Rect outer = new Rect(0f, 0f, 1f, 1f);

		// Token: 0x040007C2 RID: 1986
		public Rect inner = new Rect(0f, 0f, 1f, 1f);

		// Token: 0x040007C3 RID: 1987
		public bool rotated;

		// Token: 0x040007C4 RID: 1988
		public float paddingLeft;

		// Token: 0x040007C5 RID: 1989
		public float paddingRight;

		// Token: 0x040007C6 RID: 1990
		public float paddingTop;

		// Token: 0x040007C7 RID: 1991
		public float paddingBottom;
	}

	// Token: 0x02000113 RID: 275
	private enum Coordinates
	{
		// Token: 0x040007C9 RID: 1993
		Pixels,
		// Token: 0x040007CA RID: 1994
		TexCoords
	}
}
