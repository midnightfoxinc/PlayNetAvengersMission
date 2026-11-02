using System;

// Token: 0x020002A4 RID: 676
public class TextDumpPanelBehavior : HQMenuPanelBehavior
{
	// Token: 0x0600124D RID: 4685 RVA: 0x00082064 File Offset: 0x00080264
	public override void show(bool b)
	{
		base.show(b);
		if (b)
		{
			globals.debug(globals.textdump_string);
		}
	}

	// Token: 0x0600124E RID: 4686 RVA: 0x00082080 File Offset: 0x00080280
	protected override void Update()
	{
		base.Update();
		this.textdump_label.text = globals.textdump_string;
		if (this.clear_button.hit)
		{
			globals.textdump_string = string.Empty;
		}
		else if (this.copy_button.hit)
		{
			NGUITools.clipboard = globals.textdump_string;
			this.copied_indicator.ResetToBeginning();
			this.copied_indicator.PlayForward();
		}
	}

	// Token: 0x040012D0 RID: 4816
	public UILabel textdump_label;

	// Token: 0x040012D1 RID: 4817
	public buttonBehavior clear_button;

	// Token: 0x040012D2 RID: 4818
	public buttonBehavior copy_button;

	// Token: 0x040012D3 RID: 4819
	public UITweener copied_indicator;
}
