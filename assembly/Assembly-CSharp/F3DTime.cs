using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000014 RID: 20
public class F3DTime : MonoBehaviour
{
	// Token: 0x06000089 RID: 137 RVA: 0x00005E44 File Offset: 0x00004044
	private void Awake()
	{
		F3DTime.time = this;
		this.timers = new List<F3DTime.Timer>();
		this.removalPending = new List<int>();
	}

	// Token: 0x0600008A RID: 138 RVA: 0x00005E64 File Offset: 0x00004064
	public int AddTimer(float rate, Action callBack)
	{
		return this.AddTimer(rate, 0, callBack);
	}

	// Token: 0x0600008B RID: 139 RVA: 0x00005E70 File Offset: 0x00004070
	public int AddTimer(float rate, int ticks, Action callBack)
	{
		F3DTime.Timer timer = new F3DTime.Timer(++this.idCounter, rate, ticks, callBack);
		this.timers.Add(timer);
		return timer.id;
	}

	// Token: 0x0600008C RID: 140 RVA: 0x00005EAC File Offset: 0x000040AC
	public void RemoveTimer(int timerId)
	{
		this.removalPending.Add(timerId);
	}

	// Token: 0x0600008D RID: 141 RVA: 0x00005EBC File Offset: 0x000040BC
	private void Remove()
	{
		if (this.removalPending.Count > 0)
		{
			foreach (int num in this.removalPending)
			{
				for (int i = 0; i < this.timers.Count; i++)
				{
					if (this.timers[i].id == num)
					{
						this.timers.RemoveAt(i);
						break;
					}
				}
			}
			this.removalPending.Clear();
		}
	}

	// Token: 0x0600008E RID: 142 RVA: 0x00005F7C File Offset: 0x0000417C
	private void Tick()
	{
		for (int i = 0; i < this.timers.Count; i++)
		{
			this.timers[i].Tick();
		}
	}

	// Token: 0x0600008F RID: 143 RVA: 0x00005FB8 File Offset: 0x000041B8
	private void Update()
	{
		this.Remove();
		this.Tick();
	}

	// Token: 0x040000DF RID: 223
	public static F3DTime time;

	// Token: 0x040000E0 RID: 224
	private List<F3DTime.Timer> timers;

	// Token: 0x040000E1 RID: 225
	private List<int> removalPending;

	// Token: 0x040000E2 RID: 226
	private int idCounter;

	// Token: 0x02000015 RID: 21
	private class Timer
	{
		// Token: 0x06000090 RID: 144 RVA: 0x00005FC8 File Offset: 0x000041C8
		public Timer(int id_, float rate_, int ticks_, Action callback_)
		{
			this.id = id_;
			this.rate = ((rate_ >= 0f) ? rate_ : 0f);
			this.ticks = ((ticks_ >= 0) ? ticks_ : 0);
			this.callBack = callback_;
			this.last = 0f;
			this.ticksElapsed = 0;
			this.isActive = true;
		}

		// Token: 0x06000091 RID: 145 RVA: 0x00006034 File Offset: 0x00004234
		public void Tick()
		{
			this.last += Time.deltaTime;
			if (this.isActive && this.last >= this.rate)
			{
				this.last = 0f;
				this.ticksElapsed++;
				this.callBack.Invoke();
				if (this.ticks > 0 && this.ticks == this.ticksElapsed)
				{
					this.isActive = false;
					F3DTime.time.RemoveTimer(this.id);
				}
			}
		}

		// Token: 0x040000E3 RID: 227
		public int id;

		// Token: 0x040000E4 RID: 228
		public bool isActive;

		// Token: 0x040000E5 RID: 229
		public float rate;

		// Token: 0x040000E6 RID: 230
		public int ticks;

		// Token: 0x040000E7 RID: 231
		public int ticksElapsed;

		// Token: 0x040000E8 RID: 232
		public float last;

		// Token: 0x040000E9 RID: 233
		public Action callBack;
	}
}
