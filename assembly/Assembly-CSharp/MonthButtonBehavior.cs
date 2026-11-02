using System;

// Token: 0x020002B6 RID: 694
public class MonthButtonBehavior : buttonBehavior
{
	// Token: 0x17000229 RID: 553
	// (get) Token: 0x06001292 RID: 4754 RVA: 0x000846E8 File Offset: 0x000828E8
	// (set) Token: 0x06001293 RID: 4755 RVA: 0x000846F0 File Offset: 0x000828F0
	public month_enum month
	{
		get
		{
			return this._month;
		}
		set
		{
			this._month = value;
			this.label.text = value.ToString();
		}
	}

	// Token: 0x0400134A RID: 4938
	public UILabel label;

	// Token: 0x0400134B RID: 4939
	private month_enum _month;
}
