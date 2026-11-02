using System;

// Token: 0x020002FE RID: 766
public class GetGearPopupBehavior : BackButtonCloseBehavior
{
	// Token: 0x06001419 RID: 5145 RVA: 0x00090878 File Offset: 0x0008EA78
	public void show()
	{
		base.gameObject.SetActive(true);
	}

	// Token: 0x0600141A RID: 5146 RVA: 0x00090888 File Offset: 0x0008EA88
	protected override void Update()
	{
		if (this.physical_button.clicked)
		{
			this.close(false);
			globals.store_main.option_panel.set_physical();
			globals.store_main.digital_item_details.close(false);
		}
		else if (this.register_button.clicked)
		{
			globals.FTUE_manager.detect_gear();
		}
		else if (this.cancel_button.clicked)
		{
			this.close(false);
		}
		base.Update();
	}

	// Token: 0x04001602 RID: 5634
	public buttonBehavior physical_button;

	// Token: 0x04001603 RID: 5635
	public buttonBehavior register_button;

	// Token: 0x04001604 RID: 5636
	public buttonBehavior cancel_button;
}
