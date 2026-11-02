using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002B8 RID: 696
public class MonthPickerBehavior : MonoBehaviour
{
	// Token: 0x06001295 RID: 4757 RVA: 0x00084718 File Offset: 0x00082918
	private void Start()
	{
		this.button[0].label.text = month_enum.JAN.ToString();
		for (int i = 1; i < 12; i++)
		{
			MonthButtonBehavior monthButtonBehavior = this.button[0].CopyInPlace() as MonthButtonBehavior;
			monthButtonBehavior.month = i + month_enum.JAN;
			monthButtonBehavior.name = "month button " + monthButtonBehavior.month;
			this.button.Add(monthButtonBehavior);
		}
		this.grid.Reposition();
	}

	// Token: 0x06001296 RID: 4758 RVA: 0x000847AC File Offset: 0x000829AC
	public void show(bool b)
	{
		base.gameObject.SetActive(b);
		if (b)
		{
			this.month = 0;
		}
	}

	// Token: 0x06001297 RID: 4759 RVA: 0x000847C8 File Offset: 0x000829C8
	private void Update()
	{
		for (int i = 0; i < this.button.Count; i++)
		{
			if (this.button[i].hit)
			{
				this.month = i + 1;
				this.show(false);
			}
		}
		if (Input.GetMouseButtonDown(0) && globals.selectedObject == this.close_button.gameObject)
		{
			this.show(false);
			globals.sfx_master.play(this.close_sfx, null);
		}
	}

	// Token: 0x0400135A RID: 4954
	public Collider close_button;

	// Token: 0x0400135B RID: 4955
	public List<MonthButtonBehavior> button;

	// Token: 0x0400135C RID: 4956
	public UIGrid grid;

	// Token: 0x0400135D RID: 4957
	public string close_sfx;

	// Token: 0x0400135E RID: 4958
	public int month;
}
