using System;
using UnityEngine;

// Token: 0x0200015F RID: 351
[Serializable]
public class sfx_set_class : IComparable
{
	// Token: 0x06000B36 RID: 2870 RVA: 0x0005261C File Offset: 0x0005081C
	public sfx_set_class(string name, AudioClip[] sfx)
	{
		this.name = name;
		this.sfx = sfx;
	}

	// Token: 0x06000B37 RID: 2871 RVA: 0x0005263C File Offset: 0x0005083C
	public AudioClip random_sfx()
	{
		if (this.sfx == null || this.sfx.Length < 1)
		{
			globals.debug("empty sfx set referenced: " + this.name);
			return null;
		}
		if (this.sfx.Length == 1)
		{
			return this.sfx[0];
		}
		int num;
		do
		{
			num = Random.Range(0, this.sfx.Length);
		}
		while (num == this._last_sfx);
		this._last_sfx = num;
		return this.sfx[num];
	}

	// Token: 0x06000B38 RID: 2872 RVA: 0x000526BC File Offset: 0x000508BC
	public int CompareTo(object obj)
	{
		if (obj == null)
		{
			return 1;
		}
		sfx_set_class sfx_set_class = obj as sfx_set_class;
		return this.name.CompareTo(sfx_set_class.name);
	}

	// Token: 0x04000AB8 RID: 2744
	public string name;

	// Token: 0x04000AB9 RID: 2745
	public sfx_priority_enum priority;

	// Token: 0x04000ABA RID: 2746
	public AudioClip[] sfx;

	// Token: 0x04000ABB RID: 2747
	private int _last_sfx = -1;
}
