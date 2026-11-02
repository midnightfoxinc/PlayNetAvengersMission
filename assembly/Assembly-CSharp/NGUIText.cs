using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using UnityEngine;

// Token: 0x020000DF RID: 223
public static class NGUIText
{
	// Token: 0x06000610 RID: 1552 RVA: 0x00029E9C File Offset: 0x0002809C
	public static void Update()
	{
		NGUIText.Update(true);
	}

	// Token: 0x06000611 RID: 1553 RVA: 0x00029EA4 File Offset: 0x000280A4
	public static void Update(bool request)
	{
		NGUIText.finalSize = Mathf.RoundToInt((float)NGUIText.fontSize / NGUIText.pixelDensity);
		NGUIText.finalSpacingX = NGUIText.spacingX * NGUIText.fontScale;
		NGUIText.finalLineHeight = ((float)NGUIText.fontSize + NGUIText.spacingY) * NGUIText.fontScale;
		NGUIText.useSymbols = (NGUIText.bitmapFont != null && NGUIText.bitmapFont.hasSymbols && NGUIText.encoding && NGUIText.symbolStyle != NGUIText.SymbolStyle.None);
		Font font = NGUIText.dynamicFont;
		if (font != null && request)
		{
			font.RequestCharactersInTexture(")_-", NGUIText.finalSize, NGUIText.fontStyle);
			if (!font.GetCharacterInfo(')', ref NGUIText.mTempChar, NGUIText.finalSize, NGUIText.fontStyle) || (float)NGUIText.mTempChar.maxY == 0f)
			{
				font.RequestCharactersInTexture("A", NGUIText.finalSize, NGUIText.fontStyle);
				if (!font.GetCharacterInfo('A', ref NGUIText.mTempChar, NGUIText.finalSize, NGUIText.fontStyle))
				{
					NGUIText.baseline = 0f;
					return;
				}
			}
			float num = (float)NGUIText.mTempChar.maxY;
			float num2 = (float)NGUIText.mTempChar.minY;
			NGUIText.baseline = Mathf.Round(num + ((float)NGUIText.finalSize - num + num2) * 0.5f);
		}
	}

	// Token: 0x06000612 RID: 1554 RVA: 0x00029FF8 File Offset: 0x000281F8
	public static void Prepare(string text)
	{
		if (NGUIText.dynamicFont != null)
		{
			NGUIText.dynamicFont.RequestCharactersInTexture(text, NGUIText.finalSize, NGUIText.fontStyle);
		}
	}

	// Token: 0x06000613 RID: 1555 RVA: 0x0002A020 File Offset: 0x00028220
	public static BMSymbol GetSymbol(string text, int index, int textLength)
	{
		return (!(NGUIText.bitmapFont != null)) ? null : NGUIText.bitmapFont.MatchSymbol(text, index, textLength);
	}

	// Token: 0x06000614 RID: 1556 RVA: 0x0002A048 File Offset: 0x00028248
	public static float GetGlyphWidth(int ch, int prev)
	{
		if (NGUIText.bitmapFont != null)
		{
			bool flag = false;
			if (ch == 8201)
			{
				flag = true;
				ch = 32;
			}
			BMGlyph bmglyph = NGUIText.bitmapFont.bmFont.GetGlyph(ch);
			if (bmglyph != null)
			{
				int num = bmglyph.advance;
				if (flag)
				{
					num >>= 1;
				}
				return NGUIText.fontScale * (float)((prev == 0) ? bmglyph.advance : (num + bmglyph.GetKerning(prev)));
			}
		}
		else if (NGUIText.dynamicFont != null && NGUIText.dynamicFont.GetCharacterInfo((char)ch, ref NGUIText.mTempChar, NGUIText.finalSize, NGUIText.fontStyle))
		{
			return (float)NGUIText.mTempChar.advance * NGUIText.fontScale * NGUIText.pixelDensity;
		}
		return 0f;
	}

	// Token: 0x06000615 RID: 1557 RVA: 0x0002A114 File Offset: 0x00028314
	public static NGUIText.GlyphInfo GetGlyph(int ch, int prev)
	{
		if (NGUIText.bitmapFont != null)
		{
			bool flag = false;
			if (ch == 8201)
			{
				flag = true;
				ch = 32;
			}
			BMGlyph bmglyph = NGUIText.bitmapFont.bmFont.GetGlyph(ch);
			if (bmglyph != null)
			{
				int num = (prev == 0) ? 0 : bmglyph.GetKerning(prev);
				NGUIText.glyph.v0.x = (float)((prev == 0) ? bmglyph.offsetX : (bmglyph.offsetX + num));
				NGUIText.glyph.v1.y = (float)(-(float)bmglyph.offsetY);
				NGUIText.glyph.v1.x = NGUIText.glyph.v0.x + (float)bmglyph.width;
				NGUIText.glyph.v0.y = NGUIText.glyph.v1.y - (float)bmglyph.height;
				NGUIText.glyph.u0.x = (float)bmglyph.x;
				NGUIText.glyph.u0.y = (float)(bmglyph.y + bmglyph.height);
				NGUIText.glyph.u2.x = (float)(bmglyph.x + bmglyph.width);
				NGUIText.glyph.u2.y = (float)bmglyph.y;
				NGUIText.glyph.u1.x = NGUIText.glyph.u0.x;
				NGUIText.glyph.u1.y = NGUIText.glyph.u2.y;
				NGUIText.glyph.u3.x = NGUIText.glyph.u2.x;
				NGUIText.glyph.u3.y = NGUIText.glyph.u0.y;
				int num2 = bmglyph.advance;
				if (flag)
				{
					num2 >>= 1;
				}
				NGUIText.glyph.advance = (float)(num2 + num);
				NGUIText.glyph.channel = bmglyph.channel;
				if (NGUIText.fontScale != 1f)
				{
					NGUIText.glyph.v0 *= NGUIText.fontScale;
					NGUIText.glyph.v1 *= NGUIText.fontScale;
					NGUIText.glyph.advance *= NGUIText.fontScale;
				}
				return NGUIText.glyph;
			}
		}
		else if (NGUIText.dynamicFont != null && NGUIText.dynamicFont.GetCharacterInfo((char)ch, ref NGUIText.mTempChar, NGUIText.finalSize, NGUIText.fontStyle))
		{
			NGUIText.glyph.v0.x = (float)NGUIText.mTempChar.minX;
			NGUIText.glyph.v1.x = (float)NGUIText.mTempChar.maxX;
			NGUIText.glyph.v0.y = (float)NGUIText.mTempChar.maxY - NGUIText.baseline;
			NGUIText.glyph.v1.y = (float)NGUIText.mTempChar.minY - NGUIText.baseline;
			NGUIText.glyph.u0 = NGUIText.mTempChar.uvTopLeft;
			NGUIText.glyph.u1 = NGUIText.mTempChar.uvBottomLeft;
			NGUIText.glyph.u2 = NGUIText.mTempChar.uvBottomRight;
			NGUIText.glyph.u3 = NGUIText.mTempChar.uvTopRight;
			NGUIText.glyph.advance = (float)NGUIText.mTempChar.advance;
			NGUIText.glyph.channel = 0;
			NGUIText.glyph.v0.x = Mathf.Round(NGUIText.glyph.v0.x);
			NGUIText.glyph.v0.y = Mathf.Round(NGUIText.glyph.v0.y);
			NGUIText.glyph.v1.x = Mathf.Round(NGUIText.glyph.v1.x);
			NGUIText.glyph.v1.y = Mathf.Round(NGUIText.glyph.v1.y);
			float num3 = NGUIText.fontScale * NGUIText.pixelDensity;
			if (num3 != 1f)
			{
				NGUIText.glyph.v0 *= num3;
				NGUIText.glyph.v1 *= num3;
				NGUIText.glyph.advance *= num3;
			}
			return NGUIText.glyph;
		}
		return null;
	}

	// Token: 0x06000616 RID: 1558 RVA: 0x0002A570 File Offset: 0x00028770
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static float ParseAlpha(string text, int index)
	{
		int num = NGUIMath.HexToDecimal(text.get_Chars(index + 1)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(index + 2));
		return Mathf.Clamp01((float)num / 255f);
	}

	// Token: 0x06000617 RID: 1559 RVA: 0x0002A5AC File Offset: 0x000287AC
	[DebuggerStepThrough]
	[DebuggerHidden]
	public static Color ParseColor(string text, int offset = 0)
	{
		return NGUIText.ParseColor24(text, offset);
	}

	// Token: 0x06000618 RID: 1560 RVA: 0x0002A5B8 File Offset: 0x000287B8
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static Color ParseColor24(string text, int offset = 0)
	{
		int num = NGUIMath.HexToDecimal(text.get_Chars(offset)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(offset + 1));
		int num2 = NGUIMath.HexToDecimal(text.get_Chars(offset + 2)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(offset + 3));
		int num3 = NGUIMath.HexToDecimal(text.get_Chars(offset + 4)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(offset + 5));
		float num4 = 0.003921569f;
		return new Color(num4 * (float)num, num4 * (float)num2, num4 * (float)num3);
	}

	// Token: 0x06000619 RID: 1561 RVA: 0x0002A63C File Offset: 0x0002883C
	[DebuggerStepThrough]
	[DebuggerHidden]
	public static Color ParseColor32(string text, int offset)
	{
		int num = NGUIMath.HexToDecimal(text.get_Chars(offset)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(offset + 1));
		int num2 = NGUIMath.HexToDecimal(text.get_Chars(offset + 2)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(offset + 3));
		int num3 = NGUIMath.HexToDecimal(text.get_Chars(offset + 4)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(offset + 5));
		int num4 = NGUIMath.HexToDecimal(text.get_Chars(offset + 6)) << 4 | NGUIMath.HexToDecimal(text.get_Chars(offset + 7));
		float num5 = 0.003921569f;
		return new Color(num5 * (float)num, num5 * (float)num2, num5 * (float)num3, num5 * (float)num4);
	}

	// Token: 0x0600061A RID: 1562 RVA: 0x0002A6E8 File Offset: 0x000288E8
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static string EncodeColor(Color c)
	{
		return NGUIText.EncodeColor24(c);
	}

	// Token: 0x0600061B RID: 1563 RVA: 0x0002A6F0 File Offset: 0x000288F0
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static string EncodeColor(string text, Color c)
	{
		return string.Concat(new string[]
		{
			"[c][",
			NGUIText.EncodeColor24(c),
			"]",
			text,
			"[-][/c]"
		});
	}

	// Token: 0x0600061C RID: 1564 RVA: 0x0002A730 File Offset: 0x00028930
	[DebuggerStepThrough]
	[DebuggerHidden]
	public static string EncodeAlpha(float a)
	{
		int num = Mathf.Clamp(Mathf.RoundToInt(a * 255f), 0, 255);
		return NGUIMath.DecimalToHex8(num);
	}

	// Token: 0x0600061D RID: 1565 RVA: 0x0002A75C File Offset: 0x0002895C
	[DebuggerStepThrough]
	[DebuggerHidden]
	public static string EncodeColor24(Color c)
	{
		int num = 16777215 & NGUIMath.ColorToInt(c) >> 8;
		return NGUIMath.DecimalToHex24(num);
	}

	// Token: 0x0600061E RID: 1566 RVA: 0x0002A780 File Offset: 0x00028980
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static string EncodeColor32(Color c)
	{
		int num = NGUIMath.ColorToInt(c);
		return NGUIMath.DecimalToHex32(num);
	}

	// Token: 0x0600061F RID: 1567 RVA: 0x0002A79C File Offset: 0x0002899C
	public static bool ParseSymbol(string text, ref int index)
	{
		int num = 1;
		bool flag = false;
		bool flag2 = false;
		bool flag3 = false;
		bool flag4 = false;
		bool flag5 = false;
		return NGUIText.ParseSymbol(text, ref index, null, false, ref num, ref flag, ref flag2, ref flag3, ref flag4, ref flag5);
	}

	// Token: 0x06000620 RID: 1568 RVA: 0x0002A7CC File Offset: 0x000289CC
	[DebuggerHidden]
	[DebuggerStepThrough]
	public static bool IsHex(char ch)
	{
		return (ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F');
	}

	// Token: 0x06000621 RID: 1569 RVA: 0x0002A810 File Offset: 0x00028A10
	public static bool ParseSymbol(string text, ref int index, BetterList<Color> colors, bool premultiply, ref int sub, ref bool bold, ref bool italic, ref bool underline, ref bool strike, ref bool ignoreColor)
	{
		int length = text.Length;
		if (index + 3 > length || text.get_Chars(index) != '[')
		{
			return false;
		}
		int num;
		if (text.get_Chars(index + 2) == ']')
		{
			if (text.get_Chars(index + 1) == '-')
			{
				if (colors != null && colors.size > 1)
				{
					colors.RemoveAt(colors.size - 1);
				}
				index += 3;
				return true;
			}
			string text2 = text.Substring(index, 3);
			string text3 = text2;
			if (text3 != null)
			{
				if (NGUIText.<>f__switch$map0 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(5);
					dictionary.Add("[b]", 0);
					dictionary.Add("[i]", 1);
					dictionary.Add("[u]", 2);
					dictionary.Add("[s]", 3);
					dictionary.Add("[c]", 4);
					NGUIText.<>f__switch$map0 = dictionary;
				}
				if (NGUIText.<>f__switch$map0.TryGetValue(text3, ref num))
				{
					switch (num)
					{
					case 0:
						bold = true;
						index += 3;
						return true;
					case 1:
						italic = true;
						index += 3;
						return true;
					case 2:
						underline = true;
						index += 3;
						return true;
					case 3:
						strike = true;
						index += 3;
						return true;
					case 4:
						ignoreColor = true;
						index += 3;
						return true;
					}
				}
			}
		}
		if (index + 4 > length)
		{
			return false;
		}
		if (text.get_Chars(index + 3) == ']')
		{
			string text4 = text.Substring(index, 4);
			string text3 = text4;
			if (text3 != null)
			{
				if (NGUIText.<>f__switch$map1 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(5);
					dictionary.Add("[/b]", 0);
					dictionary.Add("[/i]", 1);
					dictionary.Add("[/u]", 2);
					dictionary.Add("[/s]", 3);
					dictionary.Add("[/c]", 4);
					NGUIText.<>f__switch$map1 = dictionary;
				}
				if (NGUIText.<>f__switch$map1.TryGetValue(text3, ref num))
				{
					switch (num)
					{
					case 0:
						bold = false;
						index += 4;
						return true;
					case 1:
						italic = false;
						index += 4;
						return true;
					case 2:
						underline = false;
						index += 4;
						return true;
					case 3:
						strike = false;
						index += 4;
						return true;
					case 4:
						ignoreColor = false;
						index += 4;
						return true;
					}
				}
			}
			char ch = text.get_Chars(index + 1);
			char ch2 = text.get_Chars(index + 2);
			if (NGUIText.IsHex(ch) && NGUIText.IsHex(ch2))
			{
				int num2 = NGUIMath.HexToDecimal(ch) << 4 | NGUIMath.HexToDecimal(ch2);
				NGUIText.mAlpha = (float)num2 / 255f;
				index += 4;
				return true;
			}
		}
		if (index + 5 > length)
		{
			return false;
		}
		if (text.get_Chars(index + 4) == ']')
		{
			string text5 = text.Substring(index, 5);
			string text3 = text5;
			if (text3 != null)
			{
				if (NGUIText.<>f__switch$map2 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
					dictionary.Add("[sub]", 0);
					dictionary.Add("[sup]", 1);
					NGUIText.<>f__switch$map2 = dictionary;
				}
				if (NGUIText.<>f__switch$map2.TryGetValue(text3, ref num))
				{
					if (num == 0)
					{
						sub = 1;
						index += 5;
						return true;
					}
					if (num == 1)
					{
						sub = 2;
						index += 5;
						return true;
					}
				}
			}
		}
		if (index + 6 > length)
		{
			return false;
		}
		if (text.get_Chars(index + 5) == ']')
		{
			string text6 = text.Substring(index, 6);
			string text3 = text6;
			if (text3 != null)
			{
				if (NGUIText.<>f__switch$map3 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(3);
					dictionary.Add("[/sub]", 0);
					dictionary.Add("[/sup]", 1);
					dictionary.Add("[/url]", 2);
					NGUIText.<>f__switch$map3 = dictionary;
				}
				if (NGUIText.<>f__switch$map3.TryGetValue(text3, ref num))
				{
					switch (num)
					{
					case 0:
						sub = 0;
						index += 6;
						return true;
					case 1:
						sub = 0;
						index += 6;
						return true;
					case 2:
						index += 6;
						return true;
					}
				}
			}
		}
		if (text.get_Chars(index + 1) == 'u' && text.get_Chars(index + 2) == 'r' && text.get_Chars(index + 3) == 'l' && text.get_Chars(index + 4) == '=')
		{
			int num3 = text.IndexOf(']', index + 4);
			if (num3 != -1)
			{
				index = num3 + 1;
				return true;
			}
			index = text.Length;
			return true;
		}
		else
		{
			if (index + 8 > length)
			{
				return false;
			}
			if (text.get_Chars(index + 7) == ']')
			{
				Color color = NGUIText.ParseColor24(text, index + 1);
				if (NGUIText.EncodeColor24(color) != text.Substring(index + 1, 6).ToUpper())
				{
					return false;
				}
				if (colors != null)
				{
					color.a = colors[colors.size - 1].a;
					if (premultiply && color.a != 1f)
					{
						color = Color.Lerp(NGUIText.mInvisible, color, color.a);
					}
					colors.Add(color);
				}
				index += 8;
				return true;
			}
			else
			{
				if (index + 10 > length)
				{
					return false;
				}
				if (text.get_Chars(index + 9) != ']')
				{
					return false;
				}
				Color color2 = NGUIText.ParseColor32(text, index + 1);
				if (NGUIText.EncodeColor32(color2) != text.Substring(index + 1, 8).ToUpper())
				{
					return false;
				}
				if (colors != null)
				{
					if (premultiply && color2.a != 1f)
					{
						color2 = Color.Lerp(NGUIText.mInvisible, color2, color2.a);
					}
					colors.Add(color2);
				}
				index += 10;
				return true;
			}
		}
	}

	// Token: 0x06000622 RID: 1570 RVA: 0x0002ADC8 File Offset: 0x00028FC8
	public static string StripSymbols(string text)
	{
		if (text != null)
		{
			int i = 0;
			int length = text.Length;
			while (i < length)
			{
				char c = text.get_Chars(i);
				if (c == '[')
				{
					int num = 0;
					bool flag = false;
					bool flag2 = false;
					bool flag3 = false;
					bool flag4 = false;
					bool flag5 = false;
					int num2 = i;
					if (NGUIText.ParseSymbol(text, ref num2, null, false, ref num, ref flag, ref flag2, ref flag3, ref flag4, ref flag5))
					{
						text = text.Remove(i, num2 - i);
						length = text.Length;
						continue;
					}
				}
				i++;
			}
		}
		return text;
	}

	// Token: 0x06000623 RID: 1571 RVA: 0x0002AE50 File Offset: 0x00029050
	public static void Align(BetterList<Vector3> verts, int indexOffset, float printedWidth, int elements = 4)
	{
		switch (NGUIText.alignment)
		{
		case NGUIText.Alignment.Center:
		{
			float num = ((float)NGUIText.rectWidth - printedWidth) * 0.5f;
			if (num < 0f)
			{
				return;
			}
			int num2 = Mathf.RoundToInt((float)NGUIText.rectWidth - printedWidth);
			int num3 = Mathf.RoundToInt((float)NGUIText.rectWidth);
			bool flag = (num2 & 1) == 1;
			bool flag2 = (num3 & 1) == 1;
			if ((flag && !flag2) || (!flag && flag2))
			{
				num += 0.5f * NGUIText.fontScale;
			}
			for (int i = indexOffset; i < verts.size; i++)
			{
				Vector3[] buffer = verts.buffer;
				int num4 = i;
				buffer[num4].x = buffer[num4].x + num;
			}
			break;
		}
		case NGUIText.Alignment.Right:
		{
			float num5 = (float)NGUIText.rectWidth - printedWidth;
			if (num5 < 0f)
			{
				return;
			}
			for (int j = indexOffset; j < verts.size; j++)
			{
				Vector3[] buffer2 = verts.buffer;
				int num6 = j;
				buffer2[num6].x = buffer2[num6].x + num5;
			}
			break;
		}
		case NGUIText.Alignment.Justified:
		{
			if (printedWidth < (float)NGUIText.rectWidth * 0.65f)
			{
				return;
			}
			float num7 = ((float)NGUIText.rectWidth - printedWidth) * 0.5f;
			if (num7 < 1f)
			{
				return;
			}
			int num8 = (verts.size - indexOffset) / elements;
			if (num8 < 1)
			{
				return;
			}
			float num9 = 1f / (float)(num8 - 1);
			float num10 = (float)NGUIText.rectWidth / printedWidth;
			int k = indexOffset + elements;
			int num11 = 1;
			while (k < verts.size)
			{
				float num12 = verts.buffer[k].x;
				float num13 = verts.buffer[k + elements / 2].x;
				float num14 = num13 - num12;
				float num15 = num12 * num10;
				float num16 = num15 + num14;
				float num17 = num13 * num10;
				float num18 = num17 - num14;
				float num19 = (float)num11 * num9;
				num13 = Mathf.Lerp(num16, num17, num19);
				num12 = Mathf.Lerp(num15, num18, num19);
				num12 = Mathf.Round(num12);
				num13 = Mathf.Round(num13);
				if (elements == 4)
				{
					verts.buffer[k++].x = num12;
					verts.buffer[k++].x = num12;
					verts.buffer[k++].x = num13;
					verts.buffer[k++].x = num13;
				}
				else if (elements == 2)
				{
					verts.buffer[k++].x = num12;
					verts.buffer[k++].x = num13;
				}
				else if (elements == 1)
				{
					verts.buffer[k++].x = num12;
				}
				num11++;
			}
			break;
		}
		}
	}

	// Token: 0x06000624 RID: 1572 RVA: 0x0002B148 File Offset: 0x00029348
	public static int GetExactCharacterIndex(BetterList<Vector3> verts, BetterList<int> indices, Vector2 pos)
	{
		for (int i = 0; i < indices.size; i++)
		{
			int num = i << 1;
			int i2 = num + 1;
			float x = verts[num].x;
			if (pos.x >= x)
			{
				float x2 = verts[i2].x;
				if (pos.x <= x2)
				{
					float y = verts[num].y;
					if (pos.y >= y)
					{
						float y2 = verts[i2].y;
						if (pos.y <= y2)
						{
							return indices[i];
						}
					}
				}
			}
		}
		return 0;
	}

	// Token: 0x06000625 RID: 1573 RVA: 0x0002B210 File Offset: 0x00029410
	public static int GetApproximateCharacterIndex(BetterList<Vector3> verts, BetterList<int> indices, Vector2 pos)
	{
		float num = float.MaxValue;
		float num2 = float.MaxValue;
		int i = 0;
		for (int j = 0; j < verts.size; j++)
		{
			float num3 = Mathf.Abs(pos.y - verts[j].y);
			if (num3 <= num2)
			{
				float num4 = Mathf.Abs(pos.x - verts[j].x);
				if (num3 < num2)
				{
					num2 = num3;
					num = num4;
					i = j;
				}
				else if (num4 < num)
				{
					num = num4;
					i = j;
				}
			}
		}
		return indices[i];
	}

	// Token: 0x06000626 RID: 1574 RVA: 0x0002B2B8 File Offset: 0x000294B8
	[DebuggerStepThrough]
	[DebuggerHidden]
	private static bool IsSpace(int ch)
	{
		return ch == 32 || ch == 8202 || ch == 8203 || ch == 8201;
	}

	// Token: 0x06000627 RID: 1575 RVA: 0x0002B2E4 File Offset: 0x000294E4
	[DebuggerStepThrough]
	[DebuggerHidden]
	public static void EndLine(ref StringBuilder s)
	{
		int num = s.Length - 1;
		if (num > 0 && NGUIText.IsSpace((int)s.get_Chars(num)))
		{
			s.set_Chars(num, '\n');
		}
		else
		{
			s.Append('\n');
		}
	}

	// Token: 0x06000628 RID: 1576 RVA: 0x0002B330 File Offset: 0x00029530
	[DebuggerStepThrough]
	[DebuggerHidden]
	private static void ReplaceSpaceWithNewline(ref StringBuilder s)
	{
		int num = s.Length - 1;
		if (num > 0 && NGUIText.IsSpace((int)s.get_Chars(num)))
		{
			s.set_Chars(num, '\n');
		}
	}

	// Token: 0x06000629 RID: 1577 RVA: 0x0002B36C File Offset: 0x0002956C
	public static Vector2 CalculatePrintedSize(string text)
	{
		Vector2 zero = Vector2.zero;
		if (!string.IsNullOrEmpty(text))
		{
			if (NGUIText.encoding)
			{
				text = NGUIText.StripSymbols(text);
			}
			NGUIText.Prepare(text);
			float num = 0f;
			float num2 = 0f;
			float num3 = 0f;
			int length = text.Length;
			int prev = 0;
			for (int i = 0; i < length; i++)
			{
				int num4 = (int)text.get_Chars(i);
				if (num4 == 10)
				{
					if (num > num3)
					{
						num3 = num;
					}
					num = 0f;
					num2 += NGUIText.finalLineHeight;
				}
				else if (num4 >= 32)
				{
					BMSymbol bmsymbol = (!NGUIText.useSymbols) ? null : NGUIText.GetSymbol(text, i, length);
					if (bmsymbol == null)
					{
						float num5 = NGUIText.GetGlyphWidth(num4, prev);
						if (num5 != 0f)
						{
							num5 += NGUIText.finalSpacingX;
							if (Mathf.RoundToInt(num + num5) > NGUIText.regionWidth)
							{
								if (num > num3)
								{
									num3 = num - NGUIText.finalSpacingX;
								}
								num = num5;
								num2 += NGUIText.finalLineHeight;
							}
							else
							{
								num += num5;
							}
							prev = num4;
						}
					}
					else
					{
						float num6 = NGUIText.finalSpacingX + (float)bmsymbol.advance * NGUIText.fontScale;
						if (Mathf.RoundToInt(num + num6) > NGUIText.regionWidth)
						{
							if (num > num3)
							{
								num3 = num - NGUIText.finalSpacingX;
							}
							num = num6;
							num2 += NGUIText.finalLineHeight;
						}
						else
						{
							num += num6;
						}
						i += bmsymbol.sequence.Length - 1;
						prev = 0;
					}
				}
			}
			zero.x = ((num <= num3) ? num3 : (num - NGUIText.finalSpacingX));
			zero.y = num2 + NGUIText.finalLineHeight;
		}
		return zero;
	}

	// Token: 0x0600062A RID: 1578 RVA: 0x0002B528 File Offset: 0x00029728
	public static int CalculateOffsetToFit(string text)
	{
		if (string.IsNullOrEmpty(text) || NGUIText.regionWidth < 1)
		{
			return 0;
		}
		NGUIText.Prepare(text);
		int length = text.Length;
		int prev = 0;
		int i = 0;
		int length2 = text.Length;
		while (i < length2)
		{
			BMSymbol bmsymbol = (!NGUIText.useSymbols) ? null : NGUIText.GetSymbol(text, i, length);
			if (bmsymbol == null)
			{
				int num = (int)text.get_Chars(i);
				float glyphWidth = NGUIText.GetGlyphWidth(num, prev);
				if (glyphWidth != 0f)
				{
					NGUIText.mSizes.Add(NGUIText.finalSpacingX + glyphWidth);
				}
				prev = num;
			}
			else
			{
				NGUIText.mSizes.Add(NGUIText.finalSpacingX + (float)bmsymbol.advance * NGUIText.fontScale);
				int j = 0;
				int num2 = bmsymbol.sequence.Length - 1;
				while (j < num2)
				{
					NGUIText.mSizes.Add(0f);
					j++;
				}
				i += bmsymbol.sequence.Length - 1;
				prev = 0;
			}
			i++;
		}
		float num3 = (float)NGUIText.regionWidth;
		int num4 = NGUIText.mSizes.size;
		while (num4 > 0 && num3 > 0f)
		{
			num3 -= NGUIText.mSizes[--num4];
		}
		NGUIText.mSizes.Clear();
		if (num3 < 0f)
		{
			num4++;
		}
		return num4;
	}

	// Token: 0x0600062B RID: 1579 RVA: 0x0002B698 File Offset: 0x00029898
	public static string GetEndOfLineThatFits(string text)
	{
		int length = text.Length;
		int num = NGUIText.CalculateOffsetToFit(text);
		return text.Substring(num, length - num);
	}

	// Token: 0x0600062C RID: 1580 RVA: 0x0002B6C0 File Offset: 0x000298C0
	public static bool WrapText(string text, out string finalText, bool wrapLineColors = false)
	{
		return NGUIText.WrapText(text, out finalText, false, wrapLineColors, false);
	}

	// Token: 0x0600062D RID: 1581 RVA: 0x0002B6CC File Offset: 0x000298CC
	public static bool WrapText(string text, out string finalText, bool keepCharCount, bool wrapLineColors, bool useEllipsis = false)
	{
		if (NGUIText.regionWidth < 1 || NGUIText.regionHeight < 1 || NGUIText.finalLineHeight < 1f)
		{
			finalText = string.Empty;
			return false;
		}
		float num = (NGUIText.maxLines <= 0) ? ((float)NGUIText.regionHeight) : Mathf.Min((float)NGUIText.regionHeight, NGUIText.finalLineHeight * (float)NGUIText.maxLines);
		int num2 = (NGUIText.maxLines <= 0) ? 1000000 : NGUIText.maxLines;
		num2 = Mathf.FloorToInt(Mathf.Min((float)num2, num / NGUIText.finalLineHeight) + 0.01f);
		if (num2 == 0)
		{
			finalText = string.Empty;
			return false;
		}
		if (string.IsNullOrEmpty(text))
		{
			text = " ";
		}
		NGUIText.Prepare(text);
		StringBuilder stringBuilder = new StringBuilder();
		int length = text.Length;
		float num3 = (float)NGUIText.regionWidth;
		int num4 = 0;
		int i = 0;
		int num5 = 1;
		int prev = 0;
		bool flag = true;
		bool flag2 = true;
		bool flag3 = false;
		Color color = NGUIText.tint;
		int num6 = 0;
		bool flag4 = false;
		bool flag5 = false;
		bool flag6 = false;
		bool flag7 = false;
		bool flag8 = false;
		if (!NGUIText.useSymbols)
		{
			wrapLineColors = false;
		}
		if (wrapLineColors)
		{
			NGUIText.mColors.Add(color);
			stringBuilder.Append("[");
			stringBuilder.Append(NGUIText.EncodeColor(color));
			stringBuilder.Append("]");
		}
		while (i < length)
		{
			char c = text.get_Chars(i);
			if (c > '⿿')
			{
				flag3 = true;
			}
			if (c == '\n')
			{
				if (num5 == num2)
				{
					break;
				}
				num3 = (float)NGUIText.regionWidth;
				if (num4 < i)
				{
					stringBuilder.Append(text.Substring(num4, i - num4 + 1));
				}
				else
				{
					stringBuilder.Append(c);
				}
				if (wrapLineColors)
				{
					for (int j = 0; j < NGUIText.mColors.size; j++)
					{
						stringBuilder.Insert(stringBuilder.Length - 1, "[-]");
					}
					for (int k = 0; k < NGUIText.mColors.size; k++)
					{
						stringBuilder.Append("[");
						stringBuilder.Append(NGUIText.EncodeColor(NGUIText.mColors[k]));
						stringBuilder.Append("]");
					}
				}
				flag = true;
				num5++;
				num4 = i + 1;
				prev = 0;
			}
			else
			{
				if (NGUIText.encoding)
				{
					if (!wrapLineColors)
					{
						if (NGUIText.ParseSymbol(text, ref i))
						{
							i--;
							goto IL_7EC;
						}
					}
					else if (NGUIText.ParseSymbol(text, ref i, NGUIText.mColors, NGUIText.premultiply, ref num6, ref flag4, ref flag5, ref flag6, ref flag7, ref flag8))
					{
						if (flag8)
						{
							color = NGUIText.mColors[NGUIText.mColors.size - 1];
							color.a *= NGUIText.mAlpha * NGUIText.tint.a;
						}
						else
						{
							color = NGUIText.tint * NGUIText.mColors[NGUIText.mColors.size - 1];
							color.a *= NGUIText.mAlpha;
						}
						int l = 0;
						int num7 = NGUIText.mColors.size - 2;
						while (l < num7)
						{
							color.a *= NGUIText.mColors[l].a;
							l++;
						}
						i--;
						goto IL_7EC;
					}
				}
				BMSymbol bmsymbol = (!NGUIText.useSymbols) ? null : NGUIText.GetSymbol(text, i, length);
				float num8;
				if (bmsymbol == null)
				{
					float glyphWidth = NGUIText.GetGlyphWidth((int)c, prev);
					if (glyphWidth == 0f && !NGUIText.IsSpace((int)c))
					{
						goto IL_7EC;
					}
					num8 = NGUIText.finalSpacingX + glyphWidth;
				}
				else
				{
					num8 = NGUIText.finalSpacingX + (float)bmsymbol.advance * NGUIText.fontScale;
				}
				num3 -= num8;
				if (NGUIText.IsSpace((int)c) && !flag3 && num4 < i)
				{
					int num9 = i - num4 + 1;
					if (num5 == num2 && num3 <= 0f && i < length)
					{
						char c2 = text.get_Chars(i);
						if (c2 < ' ' || NGUIText.IsSpace((int)c2))
						{
							num9--;
						}
					}
					stringBuilder.Append(text.Substring(num4, num9));
					flag = false;
					num4 = i + 1;
				}
				if (Mathf.RoundToInt(num3) < 0)
				{
					if (flag || num5 == num2)
					{
						if (useEllipsis && num5 == num2 && i > 1)
						{
							float num10 = NGUIText.GetGlyphWidth(46, 46) * 3f;
							if (num10 < (float)NGUIText.regionWidth)
							{
								num3 += num8;
								int num11 = i;
								int num12 = 0;
								while (num11 > 1 && num3 < num10)
								{
									num11--;
									char prev2 = text.get_Chars(num11 - 1);
									char ch = text.get_Chars(num11);
									bool flag9 = num3 == 0f && NGUIText.IsSpace((int)ch);
									num3 += NGUIText.GetGlyphWidth((int)ch, (int)prev2);
									if (num11 < num4 && !flag9)
									{
										num12++;
									}
								}
								if (num3 >= num10)
								{
									if (num12 > 0)
									{
										stringBuilder.Length = Mathf.Max(0, stringBuilder.Length - num12);
									}
									stringBuilder.Append(text.Substring(num4, Mathf.Max(0, num11 - num4)));
									while (stringBuilder.Length > 0 && NGUIText.IsSpace((int)stringBuilder.get_Chars(stringBuilder.Length - 1)))
									{
										stringBuilder.Length--;
									}
									stringBuilder.Append("...");
									num5++;
									i = (num4 = num11);
									break;
								}
							}
						}
						stringBuilder.Append(text.Substring(num4, Mathf.Max(0, i - num4)));
						bool flag10 = NGUIText.IsSpace((int)c);
						if (!flag10 && !flag3)
						{
							flag2 = false;
						}
						if (wrapLineColors && NGUIText.mColors.size > 0)
						{
							stringBuilder.Append("[-]");
						}
						if (num5++ == num2)
						{
							num4 = i;
							break;
						}
						if (keepCharCount)
						{
							NGUIText.ReplaceSpaceWithNewline(ref stringBuilder);
						}
						else
						{
							NGUIText.EndLine(ref stringBuilder);
						}
						if (wrapLineColors)
						{
							for (int m = 0; m < NGUIText.mColors.size; m++)
							{
								stringBuilder.Insert(stringBuilder.Length - 1, "[-]");
							}
							for (int n = 0; n < NGUIText.mColors.size; n++)
							{
								stringBuilder.Append("[");
								stringBuilder.Append(NGUIText.EncodeColor(NGUIText.mColors[n]));
								stringBuilder.Append("]");
							}
						}
						flag = true;
						if (flag10)
						{
							num4 = i + 1;
							num3 = (float)NGUIText.regionWidth;
						}
						else
						{
							num4 = i;
							num3 = (float)NGUIText.regionWidth - num8;
						}
						prev = 0;
					}
					else
					{
						flag = true;
						num3 = (float)NGUIText.regionWidth;
						i = num4 - 1;
						prev = 0;
						if (num5++ == num2)
						{
							break;
						}
						if (keepCharCount)
						{
							NGUIText.ReplaceSpaceWithNewline(ref stringBuilder);
						}
						else
						{
							NGUIText.EndLine(ref stringBuilder);
						}
						if (wrapLineColors)
						{
							for (int num13 = 0; num13 < NGUIText.mColors.size; num13++)
							{
								stringBuilder.Insert(stringBuilder.Length - 1, "[-]");
							}
							for (int num14 = 0; num14 < NGUIText.mColors.size; num14++)
							{
								stringBuilder.Append("[");
								stringBuilder.Append(NGUIText.EncodeColor(NGUIText.mColors[num14]));
								stringBuilder.Append("]");
							}
						}
						goto IL_7EC;
					}
				}
				else
				{
					prev = (int)c;
				}
				if (bmsymbol != null)
				{
					i += bmsymbol.length - 1;
					prev = 0;
				}
			}
			IL_7EC:
			i++;
		}
		if (num4 < i)
		{
			stringBuilder.Append(text.Substring(num4, i - num4));
		}
		if (wrapLineColors && NGUIText.mColors.size > 0)
		{
			stringBuilder.Append("[-]");
		}
		finalText = stringBuilder.ToString();
		NGUIText.mColors.Clear();
		return flag2 && (i == length || num5 <= Mathf.Min(NGUIText.maxLines, num2));
	}

	// Token: 0x0600062E RID: 1582 RVA: 0x0002BF4C File Offset: 0x0002A14C
	public static void Print(string text, BetterList<Vector3> verts, BetterList<Vector2> uvs, BetterList<Color32> cols)
	{
		if (string.IsNullOrEmpty(text))
		{
			return;
		}
		int size = verts.size;
		NGUIText.Prepare(text);
		NGUIText.mColors.Add(Color.white);
		NGUIText.mAlpha = 1f;
		int prev = 0;
		float num = 0f;
		float num2 = 0f;
		float num3 = 0f;
		float num4 = (float)NGUIText.finalSize;
		Color color = NGUIText.tint * NGUIText.gradientBottom;
		Color color2 = NGUIText.tint * NGUIText.gradientTop;
		Color32 color3 = NGUIText.tint;
		int length = text.Length;
		Rect rect = default(Rect);
		float num5 = 0f;
		float num6 = 0f;
		float num7 = num4 * NGUIText.pixelDensity;
		bool flag = false;
		int num8 = 0;
		bool flag2 = false;
		bool flag3 = false;
		bool flag4 = false;
		bool flag5 = false;
		bool flag6 = false;
		if (NGUIText.bitmapFont != null)
		{
			rect = NGUIText.bitmapFont.uvRect;
			num5 = rect.width / (float)NGUIText.bitmapFont.texWidth;
			num6 = rect.height / (float)NGUIText.bitmapFont.texHeight;
		}
		for (int i = 0; i < length; i++)
		{
			int num9 = (int)text.get_Chars(i);
			float num10 = num;
			if (num9 == 10)
			{
				if (num > num3)
				{
					num3 = num;
				}
				if (NGUIText.alignment != NGUIText.Alignment.Left)
				{
					NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 4);
					size = verts.size;
				}
				num = 0f;
				num2 += NGUIText.finalLineHeight;
				prev = 0;
			}
			else if (num9 < 32)
			{
				prev = num9;
			}
			else if (NGUIText.encoding && NGUIText.ParseSymbol(text, ref i, NGUIText.mColors, NGUIText.premultiply, ref num8, ref flag2, ref flag3, ref flag4, ref flag5, ref flag6))
			{
				Color color4;
				if (flag6)
				{
					color4 = NGUIText.mColors[NGUIText.mColors.size - 1];
					color4.a *= NGUIText.mAlpha * NGUIText.tint.a;
				}
				else
				{
					color4 = NGUIText.tint * NGUIText.mColors[NGUIText.mColors.size - 1];
					color4.a *= NGUIText.mAlpha;
				}
				color3 = color4;
				int j = 0;
				int num11 = NGUIText.mColors.size - 2;
				while (j < num11)
				{
					color4.a *= NGUIText.mColors[j].a;
					j++;
				}
				if (NGUIText.gradient)
				{
					color = NGUIText.gradientBottom * color4;
					color2 = NGUIText.gradientTop * color4;
				}
				i--;
			}
			else
			{
				BMSymbol bmsymbol = (!NGUIText.useSymbols) ? null : NGUIText.GetSymbol(text, i, length);
				if (bmsymbol != null)
				{
					float num12 = num + (float)bmsymbol.offsetX * NGUIText.fontScale;
					float num13 = num12 + (float)bmsymbol.width * NGUIText.fontScale;
					float num14 = -(num2 + (float)bmsymbol.offsetY * NGUIText.fontScale);
					float num15 = num14 - (float)bmsymbol.height * NGUIText.fontScale;
					if (Mathf.RoundToInt(num + (float)bmsymbol.advance * NGUIText.fontScale) > NGUIText.regionWidth)
					{
						if (num == 0f)
						{
							return;
						}
						if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
						{
							NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 4);
							size = verts.size;
						}
						num12 -= num;
						num13 -= num;
						num15 -= NGUIText.finalLineHeight;
						num14 -= NGUIText.finalLineHeight;
						num = 0f;
						num2 += NGUIText.finalLineHeight;
					}
					verts.Add(new Vector3(num12, num15));
					verts.Add(new Vector3(num12, num14));
					verts.Add(new Vector3(num13, num14));
					verts.Add(new Vector3(num13, num15));
					num += NGUIText.finalSpacingX + (float)bmsymbol.advance * NGUIText.fontScale;
					i += bmsymbol.length - 1;
					prev = 0;
					if (uvs != null)
					{
						Rect uvRect = bmsymbol.uvRect;
						float xMin = uvRect.xMin;
						float yMin = uvRect.yMin;
						float xMax = uvRect.xMax;
						float yMax = uvRect.yMax;
						uvs.Add(new Vector2(xMin, yMin));
						uvs.Add(new Vector2(xMin, yMax));
						uvs.Add(new Vector2(xMax, yMax));
						uvs.Add(new Vector2(xMax, yMin));
					}
					if (cols != null)
					{
						if (NGUIText.symbolStyle == NGUIText.SymbolStyle.Colored)
						{
							for (int k = 0; k < 4; k++)
							{
								cols.Add(color3);
							}
						}
						else
						{
							Color32 item = Color.white;
							item.a = color3.a;
							for (int l = 0; l < 4; l++)
							{
								cols.Add(item);
							}
						}
					}
				}
				else
				{
					NGUIText.GlyphInfo glyphInfo = NGUIText.GetGlyph(num9, prev);
					if (glyphInfo != null)
					{
						prev = num9;
						if (num8 != 0)
						{
							NGUIText.GlyphInfo glyphInfo2 = glyphInfo;
							glyphInfo2.v0.x = glyphInfo2.v0.x * 0.75f;
							NGUIText.GlyphInfo glyphInfo3 = glyphInfo;
							glyphInfo3.v0.y = glyphInfo3.v0.y * 0.75f;
							NGUIText.GlyphInfo glyphInfo4 = glyphInfo;
							glyphInfo4.v1.x = glyphInfo4.v1.x * 0.75f;
							NGUIText.GlyphInfo glyphInfo5 = glyphInfo;
							glyphInfo5.v1.y = glyphInfo5.v1.y * 0.75f;
							if (num8 == 1)
							{
								NGUIText.GlyphInfo glyphInfo6 = glyphInfo;
								glyphInfo6.v0.y = glyphInfo6.v0.y - NGUIText.fontScale * (float)NGUIText.fontSize * 0.4f;
								NGUIText.GlyphInfo glyphInfo7 = glyphInfo;
								glyphInfo7.v1.y = glyphInfo7.v1.y - NGUIText.fontScale * (float)NGUIText.fontSize * 0.4f;
							}
							else
							{
								NGUIText.GlyphInfo glyphInfo8 = glyphInfo;
								glyphInfo8.v0.y = glyphInfo8.v0.y + NGUIText.fontScale * (float)NGUIText.fontSize * 0.05f;
								NGUIText.GlyphInfo glyphInfo9 = glyphInfo;
								glyphInfo9.v1.y = glyphInfo9.v1.y + NGUIText.fontScale * (float)NGUIText.fontSize * 0.05f;
							}
						}
						float num12 = glyphInfo.v0.x + num;
						float num15 = glyphInfo.v0.y - num2;
						float num13 = glyphInfo.v1.x + num;
						float num14 = glyphInfo.v1.y - num2;
						float num16 = glyphInfo.advance;
						if (NGUIText.finalSpacingX < 0f)
						{
							num16 += NGUIText.finalSpacingX;
						}
						if (Mathf.RoundToInt(num + num16) > NGUIText.regionWidth)
						{
							if (num == 0f)
							{
								return;
							}
							if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
							{
								NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 4);
								size = verts.size;
							}
							num12 -= num;
							num13 -= num;
							num15 -= NGUIText.finalLineHeight;
							num14 -= NGUIText.finalLineHeight;
							num = 0f;
							num2 += NGUIText.finalLineHeight;
							num10 = 0f;
						}
						if (NGUIText.IsSpace(num9))
						{
							if (flag4)
							{
								num9 = 95;
							}
							else if (flag5)
							{
								num9 = 45;
							}
						}
						num += ((num8 != 0) ? ((NGUIText.finalSpacingX + glyphInfo.advance) * 0.75f) : (NGUIText.finalSpacingX + glyphInfo.advance));
						if (num8 != 0)
						{
							num = Mathf.Round(num);
						}
						if (!NGUIText.IsSpace(num9))
						{
							if (uvs != null)
							{
								if (NGUIText.bitmapFont != null)
								{
									glyphInfo.u0.x = rect.xMin + num5 * glyphInfo.u0.x;
									glyphInfo.u2.x = rect.xMin + num5 * glyphInfo.u2.x;
									glyphInfo.u0.y = rect.yMax - num6 * glyphInfo.u0.y;
									glyphInfo.u2.y = rect.yMax - num6 * glyphInfo.u2.y;
									glyphInfo.u1.x = glyphInfo.u0.x;
									glyphInfo.u1.y = glyphInfo.u2.y;
									glyphInfo.u3.x = glyphInfo.u2.x;
									glyphInfo.u3.y = glyphInfo.u0.y;
								}
								int m = 0;
								int num17 = (!flag2) ? 1 : 4;
								while (m < num17)
								{
									uvs.Add(glyphInfo.u0);
									uvs.Add(glyphInfo.u1);
									uvs.Add(glyphInfo.u2);
									uvs.Add(glyphInfo.u3);
									m++;
								}
							}
							if (cols != null)
							{
								if (glyphInfo.channel == 0 || glyphInfo.channel == 15)
								{
									if (NGUIText.gradient)
									{
										float num18 = num7 + glyphInfo.v0.y / NGUIText.fontScale;
										float num19 = num7 + glyphInfo.v1.y / NGUIText.fontScale;
										num18 /= num7;
										num19 /= num7;
										NGUIText.s_c0 = Color.Lerp(color, color2, num18);
										NGUIText.s_c1 = Color.Lerp(color, color2, num19);
										int n = 0;
										int num20 = (!flag2) ? 1 : 4;
										while (n < num20)
										{
											cols.Add(NGUIText.s_c0);
											cols.Add(NGUIText.s_c1);
											cols.Add(NGUIText.s_c1);
											cols.Add(NGUIText.s_c0);
											n++;
										}
									}
									else
									{
										int num21 = 0;
										int num22 = (!flag2) ? 4 : 16;
										while (num21 < num22)
										{
											cols.Add(color3);
											num21++;
										}
									}
								}
								else
								{
									Color color5 = color3;
									color5 *= 0.49f;
									switch (glyphInfo.channel)
									{
									case 1:
										color5.b += 0.51f;
										break;
									case 2:
										color5.g += 0.51f;
										break;
									case 4:
										color5.r += 0.51f;
										break;
									case 8:
										color5.a += 0.51f;
										break;
									}
									Color32 item2 = color5;
									int num23 = 0;
									int num24 = (!flag2) ? 4 : 16;
									while (num23 < num24)
									{
										cols.Add(item2);
										num23++;
									}
								}
							}
							if (!flag2)
							{
								if (!flag3)
								{
									verts.Add(new Vector3(num12, num15));
									verts.Add(new Vector3(num12, num14));
									verts.Add(new Vector3(num13, num14));
									verts.Add(new Vector3(num13, num15));
								}
								else
								{
									float num25 = (float)NGUIText.fontSize * 0.1f * ((num14 - num15) / (float)NGUIText.fontSize);
									verts.Add(new Vector3(num12 - num25, num15));
									verts.Add(new Vector3(num12 + num25, num14));
									verts.Add(new Vector3(num13 + num25, num14));
									verts.Add(new Vector3(num13 - num25, num15));
								}
							}
							else
							{
								for (int num26 = 0; num26 < 4; num26++)
								{
									float num27 = NGUIText.mBoldOffset[num26 * 2];
									float num28 = NGUIText.mBoldOffset[num26 * 2 + 1];
									float num29 = (!flag3) ? 0f : ((float)NGUIText.fontSize * 0.1f * ((num14 - num15) / (float)NGUIText.fontSize));
									verts.Add(new Vector3(num12 + num27 - num29, num15 + num28));
									verts.Add(new Vector3(num12 + num27 + num29, num14 + num28));
									verts.Add(new Vector3(num13 + num27 + num29, num14 + num28));
									verts.Add(new Vector3(num13 + num27 - num29, num15 + num28));
								}
							}
							if (flag4 || flag5)
							{
								NGUIText.GlyphInfo glyphInfo10 = NGUIText.GetGlyph((!flag5) ? 95 : 45, prev);
								if (glyphInfo10 != null)
								{
									if (uvs != null)
									{
										if (NGUIText.bitmapFont != null)
										{
											glyphInfo10.u0.x = rect.xMin + num5 * glyphInfo10.u0.x;
											glyphInfo10.u2.x = rect.xMin + num5 * glyphInfo10.u2.x;
											glyphInfo10.u0.y = rect.yMax - num6 * glyphInfo10.u0.y;
											glyphInfo10.u2.y = rect.yMax - num6 * glyphInfo10.u2.y;
										}
										float num30 = (glyphInfo10.u0.x + glyphInfo10.u2.x) * 0.5f;
										int num31 = 0;
										int num32 = (!flag2) ? 1 : 4;
										while (num31 < num32)
										{
											uvs.Add(new Vector2(num30, glyphInfo10.u0.y));
											uvs.Add(new Vector2(num30, glyphInfo10.u2.y));
											uvs.Add(new Vector2(num30, glyphInfo10.u2.y));
											uvs.Add(new Vector2(num30, glyphInfo10.u0.y));
											num31++;
										}
									}
									if (flag && flag5)
									{
										num15 = (-num2 + glyphInfo10.v0.y) * 0.75f;
										num14 = (-num2 + glyphInfo10.v1.y) * 0.75f;
									}
									else
									{
										num15 = -num2 + glyphInfo10.v0.y;
										num14 = -num2 + glyphInfo10.v1.y;
									}
									if (flag2)
									{
										for (int num33 = 0; num33 < 4; num33++)
										{
											float num34 = NGUIText.mBoldOffset[num33 * 2];
											float num35 = NGUIText.mBoldOffset[num33 * 2 + 1];
											verts.Add(new Vector3(num10 + num34, num15 + num35));
											verts.Add(new Vector3(num10 + num34, num14 + num35));
											verts.Add(new Vector3(num + num34, num14 + num35));
											verts.Add(new Vector3(num + num34, num15 + num35));
										}
									}
									else
									{
										verts.Add(new Vector3(num10, num15));
										verts.Add(new Vector3(num10, num14));
										verts.Add(new Vector3(num, num14));
										verts.Add(new Vector3(num, num15));
									}
									if (NGUIText.gradient)
									{
										float num36 = num7 + glyphInfo10.v0.y / NGUIText.fontScale;
										float num37 = num7 + glyphInfo10.v1.y / NGUIText.fontScale;
										num36 /= num7;
										num37 /= num7;
										NGUIText.s_c0 = Color.Lerp(color, color2, num36);
										NGUIText.s_c1 = Color.Lerp(color, color2, num37);
										int num38 = 0;
										int num39 = (!flag2) ? 1 : 4;
										while (num38 < num39)
										{
											cols.Add(NGUIText.s_c0);
											cols.Add(NGUIText.s_c1);
											cols.Add(NGUIText.s_c1);
											cols.Add(NGUIText.s_c0);
											num38++;
										}
									}
									else
									{
										int num40 = 0;
										int num41 = (!flag2) ? 4 : 16;
										while (num40 < num41)
										{
											cols.Add(color3);
											num40++;
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
		{
			NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 4);
			size = verts.size;
		}
		NGUIText.mColors.Clear();
	}

	// Token: 0x0600062F RID: 1583 RVA: 0x0002CF70 File Offset: 0x0002B170
	public static void PrintApproximateCharacterPositions(string text, BetterList<Vector3> verts, BetterList<int> indices)
	{
		if (string.IsNullOrEmpty(text))
		{
			text = " ";
		}
		NGUIText.Prepare(text);
		float num = 0f;
		float num2 = 0f;
		float num3 = 0f;
		float num4 = (float)NGUIText.fontSize * NGUIText.fontScale * 0.5f;
		int length = text.Length;
		int size = verts.size;
		int prev = 0;
		for (int i = 0; i < length; i++)
		{
			int num5 = (int)text.get_Chars(i);
			verts.Add(new Vector3(num, -num2 - num4));
			indices.Add(i);
			if (num5 == 10)
			{
				if (num > num3)
				{
					num3 = num;
				}
				if (NGUIText.alignment != NGUIText.Alignment.Left)
				{
					NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 1);
					size = verts.size;
				}
				num = 0f;
				num2 += NGUIText.finalLineHeight;
				prev = 0;
			}
			else if (num5 < 32)
			{
				prev = 0;
			}
			else if (NGUIText.encoding && NGUIText.ParseSymbol(text, ref i))
			{
				i--;
			}
			else
			{
				BMSymbol bmsymbol = (!NGUIText.useSymbols) ? null : NGUIText.GetSymbol(text, i, length);
				if (bmsymbol == null)
				{
					float num6 = NGUIText.GetGlyphWidth(num5, prev);
					if (num6 != 0f)
					{
						num6 += NGUIText.finalSpacingX;
						if (Mathf.RoundToInt(num + num6) > NGUIText.regionWidth)
						{
							if (num == 0f)
							{
								return;
							}
							if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
							{
								NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 1);
								size = verts.size;
							}
							num = num6;
							num2 += NGUIText.finalLineHeight;
						}
						else
						{
							num += num6;
						}
						verts.Add(new Vector3(num, -num2 - num4));
						indices.Add(i + 1);
						prev = num5;
					}
				}
				else
				{
					float num7 = (float)bmsymbol.advance * NGUIText.fontScale + NGUIText.finalSpacingX;
					if (Mathf.RoundToInt(num + num7) > NGUIText.regionWidth)
					{
						if (num == 0f)
						{
							return;
						}
						if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
						{
							NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 1);
							size = verts.size;
						}
						num = num7;
						num2 += NGUIText.finalLineHeight;
					}
					else
					{
						num += num7;
					}
					verts.Add(new Vector3(num, -num2 - num4));
					indices.Add(i + 1);
					i += bmsymbol.sequence.Length - 1;
					prev = 0;
				}
			}
		}
		if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
		{
			NGUIText.Align(verts, size, num - NGUIText.finalSpacingX, 1);
		}
	}

	// Token: 0x06000630 RID: 1584 RVA: 0x0002D224 File Offset: 0x0002B424
	public static void PrintExactCharacterPositions(string text, BetterList<Vector3> verts, BetterList<int> indices)
	{
		if (string.IsNullOrEmpty(text))
		{
			text = " ";
		}
		NGUIText.Prepare(text);
		float num = (float)NGUIText.fontSize * NGUIText.fontScale;
		float num2 = 0f;
		float num3 = 0f;
		float num4 = 0f;
		int length = text.Length;
		int size = verts.size;
		int prev = 0;
		for (int i = 0; i < length; i++)
		{
			int num5 = (int)text.get_Chars(i);
			if (num5 == 10)
			{
				if (num2 > num4)
				{
					num4 = num2;
				}
				if (NGUIText.alignment != NGUIText.Alignment.Left)
				{
					NGUIText.Align(verts, size, num2 - NGUIText.finalSpacingX, 2);
					size = verts.size;
				}
				num2 = 0f;
				num3 += NGUIText.finalLineHeight;
				prev = 0;
			}
			else if (num5 < 32)
			{
				prev = 0;
			}
			else if (NGUIText.encoding && NGUIText.ParseSymbol(text, ref i))
			{
				i--;
			}
			else
			{
				BMSymbol bmsymbol = (!NGUIText.useSymbols) ? null : NGUIText.GetSymbol(text, i, length);
				if (bmsymbol == null)
				{
					float glyphWidth = NGUIText.GetGlyphWidth(num5, prev);
					if (glyphWidth != 0f)
					{
						float num6 = glyphWidth + NGUIText.finalSpacingX;
						if (Mathf.RoundToInt(num2 + num6) > NGUIText.regionWidth)
						{
							if (num2 == 0f)
							{
								return;
							}
							if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
							{
								NGUIText.Align(verts, size, num2 - NGUIText.finalSpacingX, 2);
								size = verts.size;
							}
							num2 = 0f;
							num3 += NGUIText.finalLineHeight;
							prev = 0;
							i--;
						}
						else
						{
							indices.Add(i);
							verts.Add(new Vector3(num2, -num3 - num));
							verts.Add(new Vector3(num2 + num6, -num3));
							prev = num5;
							num2 += num6;
						}
					}
				}
				else
				{
					float num7 = (float)bmsymbol.advance * NGUIText.fontScale + NGUIText.finalSpacingX;
					if (Mathf.RoundToInt(num2 + num7) > NGUIText.regionWidth)
					{
						if (num2 == 0f)
						{
							return;
						}
						if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
						{
							NGUIText.Align(verts, size, num2 - NGUIText.finalSpacingX, 2);
							size = verts.size;
						}
						num2 = 0f;
						num3 += NGUIText.finalLineHeight;
						prev = 0;
						i--;
					}
					else
					{
						indices.Add(i);
						verts.Add(new Vector3(num2, -num3 - num));
						verts.Add(new Vector3(num2 + num7, -num3));
						i += bmsymbol.sequence.Length - 1;
						num2 += num7;
						prev = 0;
					}
				}
			}
		}
		if (NGUIText.alignment != NGUIText.Alignment.Left && size < verts.size)
		{
			NGUIText.Align(verts, size, num2 - NGUIText.finalSpacingX, 2);
		}
	}

	// Token: 0x06000631 RID: 1585 RVA: 0x0002D4F0 File Offset: 0x0002B6F0
	public static void PrintCaretAndSelection(string text, int start, int end, BetterList<Vector3> caret, BetterList<Vector3> highlight)
	{
		if (string.IsNullOrEmpty(text))
		{
			text = " ";
		}
		NGUIText.Prepare(text);
		int num = end;
		if (start > end)
		{
			end = start;
			start = num;
		}
		float num2 = 0f;
		float num3 = 0f;
		float num4 = 0f;
		float num5 = (float)NGUIText.fontSize * NGUIText.fontScale;
		int indexOffset = (caret == null) ? 0 : caret.size;
		int num6 = (highlight == null) ? 0 : highlight.size;
		int length = text.Length;
		int i = 0;
		int prev = 0;
		bool flag = false;
		bool flag2 = false;
		Vector2 zero = Vector2.zero;
		Vector2 zero2 = Vector2.zero;
		while (i < length)
		{
			if (caret != null && !flag2 && num <= i)
			{
				flag2 = true;
				caret.Add(new Vector3(num2 - 1f, -num3 - num5));
				caret.Add(new Vector3(num2 - 1f, -num3));
				caret.Add(new Vector3(num2 + 1f, -num3));
				caret.Add(new Vector3(num2 + 1f, -num3 - num5));
			}
			int num7 = (int)text.get_Chars(i);
			if (num7 == 10)
			{
				if (num2 > num4)
				{
					num4 = num2;
				}
				if (caret != null && flag2)
				{
					if (NGUIText.alignment != NGUIText.Alignment.Left)
					{
						NGUIText.Align(caret, indexOffset, num2 - NGUIText.finalSpacingX, 4);
					}
					caret = null;
				}
				if (highlight != null)
				{
					if (flag)
					{
						flag = false;
						highlight.Add(zero2);
						highlight.Add(zero);
					}
					else if (start <= i && end > i)
					{
						highlight.Add(new Vector3(num2, -num3 - num5));
						highlight.Add(new Vector3(num2, -num3));
						highlight.Add(new Vector3(num2 + 2f, -num3));
						highlight.Add(new Vector3(num2 + 2f, -num3 - num5));
					}
					if (NGUIText.alignment != NGUIText.Alignment.Left && num6 < highlight.size)
					{
						NGUIText.Align(highlight, num6, num2 - NGUIText.finalSpacingX, 4);
						num6 = highlight.size;
					}
				}
				num2 = 0f;
				num3 += NGUIText.finalLineHeight;
				prev = 0;
			}
			else if (num7 < 32)
			{
				prev = 0;
			}
			else if (NGUIText.encoding && NGUIText.ParseSymbol(text, ref i))
			{
				i--;
			}
			else
			{
				BMSymbol bmsymbol = (!NGUIText.useSymbols) ? null : NGUIText.GetSymbol(text, i, length);
				float num8 = (bmsymbol == null) ? NGUIText.GetGlyphWidth(num7, prev) : ((float)bmsymbol.advance * NGUIText.fontScale);
				if (num8 != 0f)
				{
					float num9 = num2;
					float num10 = num2 + num8;
					float num11 = -num3 - num5;
					float num12 = -num3;
					if (Mathf.RoundToInt(num10 + NGUIText.finalSpacingX) > NGUIText.regionWidth)
					{
						if (num2 == 0f)
						{
							return;
						}
						if (num2 > num4)
						{
							num4 = num2;
						}
						if (caret != null && flag2)
						{
							if (NGUIText.alignment != NGUIText.Alignment.Left)
							{
								NGUIText.Align(caret, indexOffset, num2 - NGUIText.finalSpacingX, 4);
							}
							caret = null;
						}
						if (highlight != null)
						{
							if (flag)
							{
								flag = false;
								highlight.Add(zero2);
								highlight.Add(zero);
							}
							else if (start <= i && end > i)
							{
								highlight.Add(new Vector3(num2, -num3 - num5));
								highlight.Add(new Vector3(num2, -num3));
								highlight.Add(new Vector3(num2 + 2f, -num3));
								highlight.Add(new Vector3(num2 + 2f, -num3 - num5));
							}
							if (NGUIText.alignment != NGUIText.Alignment.Left && num6 < highlight.size)
							{
								NGUIText.Align(highlight, num6, num2 - NGUIText.finalSpacingX, 4);
								num6 = highlight.size;
							}
						}
						num9 -= num2;
						num10 -= num2;
						num11 -= NGUIText.finalLineHeight;
						num12 -= NGUIText.finalLineHeight;
						num2 = 0f;
						num3 += NGUIText.finalLineHeight;
					}
					num2 += num8 + NGUIText.finalSpacingX;
					if (highlight != null)
					{
						if (start > i || end <= i)
						{
							if (flag)
							{
								flag = false;
								highlight.Add(zero2);
								highlight.Add(zero);
							}
						}
						else if (!flag)
						{
							flag = true;
							highlight.Add(new Vector3(num9, num11));
							highlight.Add(new Vector3(num9, num12));
						}
					}
					zero..ctor(num10, num11);
					zero2..ctor(num10, num12);
					prev = num7;
				}
			}
			i++;
		}
		if (caret != null)
		{
			if (!flag2)
			{
				caret.Add(new Vector3(num2 - 1f, -num3 - num5));
				caret.Add(new Vector3(num2 - 1f, -num3));
				caret.Add(new Vector3(num2 + 1f, -num3));
				caret.Add(new Vector3(num2 + 1f, -num3 - num5));
			}
			if (NGUIText.alignment != NGUIText.Alignment.Left)
			{
				NGUIText.Align(caret, indexOffset, num2 - NGUIText.finalSpacingX, 4);
			}
		}
		if (highlight != null)
		{
			if (flag)
			{
				highlight.Add(zero2);
				highlight.Add(zero);
			}
			else if (start < i && end == i)
			{
				highlight.Add(new Vector3(num2, -num3 - num5));
				highlight.Add(new Vector3(num2, -num3));
				highlight.Add(new Vector3(num2 + 2f, -num3));
				highlight.Add(new Vector3(num2 + 2f, -num3 - num5));
			}
			if (NGUIText.alignment != NGUIText.Alignment.Left && num6 < highlight.size)
			{
				NGUIText.Align(highlight, num6, num2 - NGUIText.finalSpacingX, 4);
			}
		}
	}

	// Token: 0x06000632 RID: 1586 RVA: 0x0002DAD8 File Offset: 0x0002BCD8
	public static bool ReplaceLink(ref string text, ref int index, string prefix)
	{
		if (index == -1)
		{
			return false;
		}
		index = text.IndexOf(prefix, index);
		if (index == -1)
		{
			return false;
		}
		int num = index + prefix.Length;
		int num2 = text.IndexOf(' ', num);
		if (num2 == -1)
		{
			num2 = text.Length;
		}
		int num3 = text.IndexOfAny(new char[]
		{
			'/',
			' '
		}, num);
		if (num3 == -1 || num3 == num)
		{
			index += 7;
			return true;
		}
		string text2 = text.Substring(0, index);
		string text3 = text.Substring(index, num2 - index);
		string text4 = text.Substring(num2);
		string text5 = text.Substring(num, num3 - num);
		text = string.Concat(new string[]
		{
			text2,
			"[url=",
			text3,
			"][u]",
			text5,
			"[/u][/url]"
		});
		index = text.Length;
		text += text4;
		return true;
	}

	// Token: 0x06000633 RID: 1587 RVA: 0x0002DBD4 File Offset: 0x0002BDD4
	public static bool InsertHyperlink(ref string text, ref int index, string keyword, string link)
	{
		int num = text.IndexOf(keyword, index, 1);
		if (num == -1)
		{
			return false;
		}
		string text2 = text.Substring(0, num);
		string text3 = "[url=" + link + "][u]";
		string text4 = text.Substring(num, keyword.Length) + "[/u][/url]";
		string text5 = text.Substring(num + keyword.Length);
		text = text2 + text3 + text4;
		index = text.Length;
		text += text5;
		return true;
	}

	// Token: 0x06000634 RID: 1588 RVA: 0x0002DC5C File Offset: 0x0002BE5C
	public static void ReplaceLinks(ref string text)
	{
		int i = 0;
		while (i < text.Length)
		{
			if (!NGUIText.ReplaceLink(ref text, ref i, "http://"))
			{
				break;
			}
		}
		int j = 0;
		while (j < text.Length)
		{
			if (!NGUIText.ReplaceLink(ref text, ref j, "https://"))
			{
				break;
			}
		}
	}

	// Token: 0x04000615 RID: 1557
	public static UIFont bitmapFont;

	// Token: 0x04000616 RID: 1558
	public static Font dynamicFont;

	// Token: 0x04000617 RID: 1559
	public static NGUIText.GlyphInfo glyph = new NGUIText.GlyphInfo();

	// Token: 0x04000618 RID: 1560
	public static int fontSize = 16;

	// Token: 0x04000619 RID: 1561
	public static float fontScale = 1f;

	// Token: 0x0400061A RID: 1562
	public static float pixelDensity = 1f;

	// Token: 0x0400061B RID: 1563
	public static FontStyle fontStyle = 0;

	// Token: 0x0400061C RID: 1564
	public static NGUIText.Alignment alignment = NGUIText.Alignment.Left;

	// Token: 0x0400061D RID: 1565
	public static Color tint = Color.white;

	// Token: 0x0400061E RID: 1566
	public static int rectWidth = 1000000;

	// Token: 0x0400061F RID: 1567
	public static int rectHeight = 1000000;

	// Token: 0x04000620 RID: 1568
	public static int regionWidth = 1000000;

	// Token: 0x04000621 RID: 1569
	public static int regionHeight = 1000000;

	// Token: 0x04000622 RID: 1570
	public static int maxLines = 0;

	// Token: 0x04000623 RID: 1571
	public static bool gradient = false;

	// Token: 0x04000624 RID: 1572
	public static Color gradientBottom = Color.white;

	// Token: 0x04000625 RID: 1573
	public static Color gradientTop = Color.white;

	// Token: 0x04000626 RID: 1574
	public static bool encoding = false;

	// Token: 0x04000627 RID: 1575
	public static float spacingX = 0f;

	// Token: 0x04000628 RID: 1576
	public static float spacingY = 0f;

	// Token: 0x04000629 RID: 1577
	public static bool premultiply = false;

	// Token: 0x0400062A RID: 1578
	public static NGUIText.SymbolStyle symbolStyle;

	// Token: 0x0400062B RID: 1579
	public static int finalSize = 0;

	// Token: 0x0400062C RID: 1580
	public static float finalSpacingX = 0f;

	// Token: 0x0400062D RID: 1581
	public static float finalLineHeight = 0f;

	// Token: 0x0400062E RID: 1582
	public static float baseline = 0f;

	// Token: 0x0400062F RID: 1583
	public static bool useSymbols = false;

	// Token: 0x04000630 RID: 1584
	private static Color mInvisible = new Color(0f, 0f, 0f, 0f);

	// Token: 0x04000631 RID: 1585
	private static BetterList<Color> mColors = new BetterList<Color>();

	// Token: 0x04000632 RID: 1586
	private static float mAlpha = 1f;

	// Token: 0x04000633 RID: 1587
	private static CharacterInfo mTempChar;

	// Token: 0x04000634 RID: 1588
	private static BetterList<float> mSizes = new BetterList<float>();

	// Token: 0x04000635 RID: 1589
	private static Color32 s_c0;

	// Token: 0x04000636 RID: 1590
	private static Color32 s_c1;

	// Token: 0x04000637 RID: 1591
	private static float[] mBoldOffset = new float[]
	{
		-0.25f,
		0f,
		0.25f,
		0f,
		0f,
		-0.25f,
		0f,
		0.25f
	};

	// Token: 0x020000E0 RID: 224
	public enum Alignment
	{
		// Token: 0x0400063D RID: 1597
		Automatic,
		// Token: 0x0400063E RID: 1598
		Left,
		// Token: 0x0400063F RID: 1599
		Center,
		// Token: 0x04000640 RID: 1600
		Right,
		// Token: 0x04000641 RID: 1601
		Justified
	}

	// Token: 0x020000E1 RID: 225
	public enum SymbolStyle
	{
		// Token: 0x04000643 RID: 1603
		None,
		// Token: 0x04000644 RID: 1604
		Normal,
		// Token: 0x04000645 RID: 1605
		Colored
	}

	// Token: 0x020000E2 RID: 226
	public class GlyphInfo
	{
		// Token: 0x04000646 RID: 1606
		public Vector2 v0;

		// Token: 0x04000647 RID: 1607
		public Vector2 v1;

		// Token: 0x04000648 RID: 1608
		public Vector2 u0;

		// Token: 0x04000649 RID: 1609
		public Vector2 u1;

		// Token: 0x0400064A RID: 1610
		public Vector2 u2;

		// Token: 0x0400064B RID: 1611
		public Vector2 u3;

		// Token: 0x0400064C RID: 1612
		public float advance;

		// Token: 0x0400064D RID: 1613
		public int channel;
	}
}
