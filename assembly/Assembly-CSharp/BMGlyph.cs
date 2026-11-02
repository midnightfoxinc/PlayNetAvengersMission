using System;
using System.Collections.Generic;

// Token: 0x020000D6 RID: 214
[Serializable]
public class BMGlyph
{
	// Token: 0x06000568 RID: 1384 RVA: 0x00024F78 File Offset: 0x00023178
	public int GetKerning(int previousChar)
	{
		if (this.kerning != null && previousChar != 0)
		{
			int i = 0;
			int count = this.kerning.Count;
			while (i < count)
			{
				if (this.kerning[i] == previousChar)
				{
					return this.kerning[i + 1];
				}
				i += 2;
			}
		}
		return 0;
	}

	// Token: 0x06000569 RID: 1385 RVA: 0x00024FD8 File Offset: 0x000231D8
	public void SetKerning(int previousChar, int amount)
	{
		if (this.kerning == null)
		{
			this.kerning = new List<int>();
		}
		for (int i = 0; i < this.kerning.Count; i += 2)
		{
			if (this.kerning[i] == previousChar)
			{
				this.kerning[i + 1] = amount;
				return;
			}
		}
		this.kerning.Add(previousChar);
		this.kerning.Add(amount);
	}

	// Token: 0x0600056A RID: 1386 RVA: 0x00025054 File Offset: 0x00023254
	public void Trim(int xMin, int yMin, int xMax, int yMax)
	{
		int num = this.x + this.width;
		int num2 = this.y + this.height;
		if (this.x < xMin)
		{
			int num3 = xMin - this.x;
			this.x += num3;
			this.width -= num3;
			this.offsetX += num3;
		}
		if (this.y < yMin)
		{
			int num4 = yMin - this.y;
			this.y += num4;
			this.height -= num4;
			this.offsetY += num4;
		}
		if (num > xMax)
		{
			this.width -= num - xMax;
		}
		if (num2 > yMax)
		{
			this.height -= num2 - yMax;
		}
	}

	// Token: 0x040005DC RID: 1500
	public int index;

	// Token: 0x040005DD RID: 1501
	public int x;

	// Token: 0x040005DE RID: 1502
	public int y;

	// Token: 0x040005DF RID: 1503
	public int width;

	// Token: 0x040005E0 RID: 1504
	public int height;

	// Token: 0x040005E1 RID: 1505
	public int offsetX;

	// Token: 0x040005E2 RID: 1506
	public int offsetY;

	// Token: 0x040005E3 RID: 1507
	public int advance;

	// Token: 0x040005E4 RID: 1508
	public int channel;

	// Token: 0x040005E5 RID: 1509
	public List<int> kerning;
}
