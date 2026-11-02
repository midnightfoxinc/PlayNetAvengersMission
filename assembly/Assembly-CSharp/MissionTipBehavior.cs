using System;

// Token: 0x020002B2 RID: 690
public class MissionTipBehavior : LabelledButtonBehavior
{
	// Token: 0x0600127E RID: 4734 RVA: 0x00083CB8 File Offset: 0x00081EB8
	public void set_data(missionTipDataClass d)
	{
		this.id = d.action;
		this.label.text = d.text;
	}

	// Token: 0x0400132C RID: 4908
	public UISprite icon;

	// Token: 0x0400132D RID: 4909
	public string id;
}
