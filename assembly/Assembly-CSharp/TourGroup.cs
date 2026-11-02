using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020001AD RID: 429
public class TourGroup : MonoBehaviour
{
	// Token: 0x06000CC2 RID: 3266 RVA: 0x0005C9E4 File Offset: 0x0005ABE4
	private void Awake()
	{
		if (!this.Manager)
		{
			this.FindManager();
		}
		if (this.EventsInGroup.Count == 0)
		{
			this.EventsInGroup = new List<TourEvent>(base.GetComponentsInChildren<TourEvent>(true));
		}
		if (this.EventsInGroup.Count == 0)
		{
			globals.debugError("No TourEvents found! Aborting!");
			base.gameObject.SetActive(false);
		}
		foreach (TourEvent tourEvent in this.EventsInGroup)
		{
			tourEvent.ParentGroup = this;
			tourEvent.gameObject.SetActive(false);
		}
	}

	// Token: 0x06000CC3 RID: 3267 RVA: 0x0005CAB8 File Offset: 0x0005ACB8
	private bool FindManager()
	{
		globals.debugWarning("No Manager found, searching...");
		int num = 0;
		while (!this.Manager && num < 1000)
		{
			this.Manager = Object.FindObjectOfType<TourManager>();
			num++;
		}
		return this.Manager;
	}

	// Token: 0x06000CC4 RID: 3268 RVA: 0x0005CB0C File Offset: 0x0005AD0C
	private void OnEnable()
	{
		if (!this.Manager)
		{
			this.FindManager();
		}
		if (!this.Manager.IsTourCompleted())
		{
			if (this.ResetOnEnable)
			{
				this.CurrentIndex = 0;
			}
			this.DisplayEvent(this.CurrentIndex, true);
		}
		else
		{
			base.enabled = false;
		}
	}

	// Token: 0x06000CC5 RID: 3269 RVA: 0x0005CB6C File Offset: 0x0005AD6C
	private void OnDisable()
	{
		this.Manager.Shutdown();
	}

	// Token: 0x06000CC6 RID: 3270 RVA: 0x0005CB7C File Offset: 0x0005AD7C
	private void DisplayEvent(int Index, bool Show)
	{
		this.EventsInGroup[Index].gameObject.SetActive(Show);
		if (Show)
		{
			this.CurrentEvent = this.EventsInGroup[Index];
			this.CurrentEvent.BeginEvent();
		}
	}

	// Token: 0x06000CC7 RID: 3271 RVA: 0x0005CBC4 File Offset: 0x0005ADC4
	public void EventComplete(TourEvent Event)
	{
		if (this.CurrentEvent != Event)
		{
			globals.debug(this.CurrentEvent.gameObject.name);
			globals.debug(Event.gameObject.name);
			globals.debugWarning(string.Format("Completed TourEvent index {0} unexpected. Starting at new index.", this.CurrentIndex));
			for (int i = 0; i < this.EventsInGroup.Count - 1; i++)
			{
				if (this.EventsInGroup[i] == Event)
				{
					this.CurrentIndex = i;
					globals.debugWarning(string.Format("New index {0}.", this.CurrentIndex));
					break;
				}
			}
			this.DisplayEvent(this.CurrentIndex, false);
			if (this.CurrentIndex >= this.EventsInGroup.Count - 1)
			{
				this.Manager.CompleteTour(this);
			}
			else
			{
				this.CurrentIndex++;
				this.DisplayEvent(this.CurrentIndex, true);
			}
		}
		else
		{
			this.DisplayEvent(this.CurrentIndex, false);
			if (this.CurrentIndex >= this.EventsInGroup.Count - 1)
			{
				this.Manager.CompleteTour(this);
			}
			else
			{
				this.CurrentIndex++;
				this.DisplayEvent(this.CurrentIndex, true);
			}
		}
	}

	// Token: 0x04000CB5 RID: 3253
	public TourManager Manager;

	// Token: 0x04000CB6 RID: 3254
	public List<TourEvent> EventsInGroup = new List<TourEvent>();

	// Token: 0x04000CB7 RID: 3255
	public bool ResetOnEnable = true;

	// Token: 0x04000CB8 RID: 3256
	private TourEvent CurrentEvent;

	// Token: 0x04000CB9 RID: 3257
	private int CurrentIndex;
}
