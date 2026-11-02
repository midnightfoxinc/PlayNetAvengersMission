using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

// Token: 0x020000D9 RID: 217
public class ByteReader
{
	// Token: 0x06000586 RID: 1414 RVA: 0x00025864 File Offset: 0x00023A64
	public ByteReader(byte[] bytes)
	{
		this.mBuffer = bytes;
	}

	// Token: 0x06000587 RID: 1415 RVA: 0x00025874 File Offset: 0x00023A74
	public ByteReader(TextAsset asset)
	{
		this.mBuffer = asset.bytes;
	}

	// Token: 0x06000589 RID: 1417 RVA: 0x00025894 File Offset: 0x00023A94
	public static ByteReader Open(string path)
	{
		FileStream fileStream = File.OpenRead(path);
		if (fileStream != null)
		{
			fileStream.Seek(0L, 2);
			byte[] array = new byte[fileStream.Position];
			fileStream.Seek(0L, 0);
			fileStream.Read(array, 0, array.Length);
			fileStream.Close();
			return new ByteReader(array);
		}
		return null;
	}

	// Token: 0x17000070 RID: 112
	// (get) Token: 0x0600058A RID: 1418 RVA: 0x000258EC File Offset: 0x00023AEC
	public bool canRead
	{
		get
		{
			return this.mBuffer != null && this.mOffset < this.mBuffer.Length;
		}
	}

	// Token: 0x0600058B RID: 1419 RVA: 0x0002590C File Offset: 0x00023B0C
	private static string ReadLine(byte[] buffer, int start, int count)
	{
		return Encoding.UTF8.GetString(buffer, start, count);
	}

	// Token: 0x0600058C RID: 1420 RVA: 0x0002591C File Offset: 0x00023B1C
	public string ReadLine()
	{
		return this.ReadLine(true);
	}

	// Token: 0x0600058D RID: 1421 RVA: 0x00025928 File Offset: 0x00023B28
	public string ReadLine(bool skipEmptyLines)
	{
		int num = this.mBuffer.Length;
		if (skipEmptyLines)
		{
			while (this.mOffset < num && this.mBuffer[this.mOffset] < 32)
			{
				this.mOffset++;
			}
		}
		int i = this.mOffset;
		if (i < num)
		{
			while (i < num)
			{
				int num2 = (int)this.mBuffer[i++];
				if (num2 == 10 || num2 == 13)
				{
					IL_87:
					string result = ByteReader.ReadLine(this.mBuffer, this.mOffset, i - this.mOffset - 1);
					this.mOffset = i;
					return result;
				}
			}
			i++;
			goto IL_87;
		}
		this.mOffset = num;
		return null;
	}

	// Token: 0x0600058E RID: 1422 RVA: 0x000259F0 File Offset: 0x00023BF0
	public Dictionary<string, string> ReadDictionary()
	{
		Dictionary<string, string> dictionary = new Dictionary<string, string>();
		char[] array = new char[]
		{
			'='
		};
		while (this.canRead)
		{
			string text = this.ReadLine();
			if (text == null)
			{
				break;
			}
			if (!text.StartsWith("//"))
			{
				string[] array2 = text.Split(array, 2, 1);
				if (array2.Length == 2)
				{
					string text2 = array2[0].Trim();
					string text3 = array2[1].Trim().Replace("\\n", "\n");
					dictionary[text2] = text3;
				}
			}
		}
		return dictionary;
	}

	// Token: 0x0600058F RID: 1423 RVA: 0x00025A88 File Offset: 0x00023C88
	public BetterList<string> ReadCSV()
	{
		ByteReader.mTemp.Clear();
		string text = string.Empty;
		bool flag = false;
		int num = 0;
		while (this.canRead)
		{
			if (flag)
			{
				string text2 = this.ReadLine(false);
				if (text2 == null)
				{
					return null;
				}
				text2 = text2.Replace("\\n", "\n");
				text = text + "\n" + text2;
			}
			else
			{
				text = this.ReadLine(true);
				if (text == null)
				{
					return null;
				}
				text = text.Replace("\\n", "\n");
				num = 0;
			}
			int i = num;
			int length = text.Length;
			while (i < length)
			{
				char c = text.get_Chars(i);
				if (c == ',')
				{
					if (!flag)
					{
						ByteReader.mTemp.Add(text.Substring(num, i - num));
						num = i + 1;
					}
				}
				else if (c == '"')
				{
					if (flag)
					{
						if (i + 1 >= length)
						{
							ByteReader.mTemp.Add(text.Substring(num, i - num).Replace("\"\"", "\""));
							return ByteReader.mTemp;
						}
						if (text.get_Chars(i + 1) != '"')
						{
							ByteReader.mTemp.Add(text.Substring(num, i - num).Replace("\"\"", "\""));
							flag = false;
							if (text.get_Chars(i + 1) == ',')
							{
								i++;
								num = i + 1;
							}
						}
						else
						{
							i++;
						}
					}
					else
					{
						num = i + 1;
						flag = true;
					}
				}
				i++;
			}
			if (num < text.Length)
			{
				if (flag)
				{
					continue;
				}
				ByteReader.mTemp.Add(text.Substring(num, text.Length - num));
			}
			return ByteReader.mTemp;
		}
		return null;
	}

	// Token: 0x040005F3 RID: 1523
	private byte[] mBuffer;

	// Token: 0x040005F4 RID: 1524
	private int mOffset;

	// Token: 0x040005F5 RID: 1525
	private static BetterList<string> mTemp = new BetterList<string>();
}
