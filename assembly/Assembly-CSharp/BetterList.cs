using System;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

// Token: 0x020000D8 RID: 216
public class BetterList<T>
{
	// Token: 0x06000576 RID: 1398 RVA: 0x00025308 File Offset: 0x00023508
	public IEnumerator<T> GetEnumerator()
	{
		if (this.buffer != null)
		{
			for (int i = 0; i < this.size; i++)
			{
				yield return this.buffer[i];
			}
		}
		yield break;
	}

	// Token: 0x1700006F RID: 111
	[DebuggerHidden]
	public T this[int i]
	{
		get
		{
			return this.buffer[i];
		}
		set
		{
			this.buffer[i] = value;
		}
	}

	// Token: 0x06000579 RID: 1401 RVA: 0x00025344 File Offset: 0x00023544
	private void AllocateMore()
	{
		T[] array = (this.buffer == null) ? new T[32] : new T[Mathf.Max(this.buffer.Length << 1, 32)];
		if (this.buffer != null && this.size > 0)
		{
			this.buffer.CopyTo(array, 0);
		}
		this.buffer = array;
	}

	// Token: 0x0600057A RID: 1402 RVA: 0x000253AC File Offset: 0x000235AC
	private void Trim()
	{
		if (this.size > 0)
		{
			if (this.size < this.buffer.Length)
			{
				T[] array = new T[this.size];
				for (int i = 0; i < this.size; i++)
				{
					array[i] = this.buffer[i];
				}
				this.buffer = array;
			}
		}
		else
		{
			this.buffer = null;
		}
	}

	// Token: 0x0600057B RID: 1403 RVA: 0x00025424 File Offset: 0x00023624
	public void Clear()
	{
		this.size = 0;
	}

	// Token: 0x0600057C RID: 1404 RVA: 0x00025430 File Offset: 0x00023630
	public void Release()
	{
		this.size = 0;
		this.buffer = null;
	}

	// Token: 0x0600057D RID: 1405 RVA: 0x00025440 File Offset: 0x00023640
	public void Add(T item)
	{
		if (this.buffer == null || this.size == this.buffer.Length)
		{
			this.AllocateMore();
		}
		this.buffer[this.size++] = item;
	}

	// Token: 0x0600057E RID: 1406 RVA: 0x00025490 File Offset: 0x00023690
	public void Insert(int index, T item)
	{
		if (this.buffer == null || this.size == this.buffer.Length)
		{
			this.AllocateMore();
		}
		if (index > -1 && index < this.size)
		{
			for (int i = this.size; i > index; i--)
			{
				this.buffer[i] = this.buffer[i - 1];
			}
			this.buffer[index] = item;
			this.size++;
		}
		else
		{
			this.Add(item);
		}
	}

	// Token: 0x0600057F RID: 1407 RVA: 0x0002552C File Offset: 0x0002372C
	public bool Contains(T item)
	{
		if (this.buffer == null)
		{
			return false;
		}
		for (int i = 0; i < this.size; i++)
		{
			if (this.buffer[i].Equals(item))
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x06000580 RID: 1408 RVA: 0x00025584 File Offset: 0x00023784
	public int IndexOf(T item)
	{
		if (this.buffer == null)
		{
			return -1;
		}
		for (int i = 0; i < this.size; i++)
		{
			if (this.buffer[i].Equals(item))
			{
				return i;
			}
		}
		return -1;
	}

	// Token: 0x06000581 RID: 1409 RVA: 0x000255DC File Offset: 0x000237DC
	public bool Remove(T item)
	{
		if (this.buffer != null)
		{
			EqualityComparer<T> @default = EqualityComparer<T>.Default;
			for (int i = 0; i < this.size; i++)
			{
				if (@default.Equals(this.buffer[i], item))
				{
					this.size--;
					this.buffer[i] = default(T);
					for (int j = i; j < this.size; j++)
					{
						this.buffer[j] = this.buffer[j + 1];
					}
					this.buffer[this.size] = default(T);
					return true;
				}
			}
		}
		return false;
	}

	// Token: 0x06000582 RID: 1410 RVA: 0x0002569C File Offset: 0x0002389C
	public void RemoveAt(int index)
	{
		if (this.buffer != null && index > -1 && index < this.size)
		{
			this.size--;
			this.buffer[index] = default(T);
			for (int i = index; i < this.size; i++)
			{
				this.buffer[i] = this.buffer[i + 1];
			}
			this.buffer[this.size] = default(T);
		}
	}

	// Token: 0x06000583 RID: 1411 RVA: 0x00025738 File Offset: 0x00023938
	public T Pop()
	{
		if (this.buffer != null && this.size != 0)
		{
			T result = this.buffer[--this.size];
			this.buffer[this.size] = default(T);
			return result;
		}
		return default(T);
	}

	// Token: 0x06000584 RID: 1412 RVA: 0x000257A0 File Offset: 0x000239A0
	public T[] ToArray()
	{
		this.Trim();
		return this.buffer;
	}

	// Token: 0x06000585 RID: 1413 RVA: 0x000257B0 File Offset: 0x000239B0
	[DebuggerStepThrough]
	[DebuggerHidden]
	public void Sort(BetterList<T>.CompareFunc comparer)
	{
		int num = 0;
		int num2 = this.size - 1;
		bool flag = true;
		while (flag)
		{
			flag = false;
			for (int i = num; i < num2; i++)
			{
				if (comparer(this.buffer[i], this.buffer[i + 1]) > 0)
				{
					T t = this.buffer[i];
					this.buffer[i] = this.buffer[i + 1];
					this.buffer[i + 1] = t;
					flag = true;
				}
				else if (!flag)
				{
					num = ((i != 0) ? (i - 1) : 0);
				}
			}
		}
	}

	// Token: 0x040005F1 RID: 1521
	public T[] buffer;

	// Token: 0x040005F2 RID: 1522
	public int size;

	// Token: 0x0200033D RID: 829
	// (Invoke) Token: 0x06001516 RID: 5398
	public delegate int CompareFunc(T left, T right);
}
