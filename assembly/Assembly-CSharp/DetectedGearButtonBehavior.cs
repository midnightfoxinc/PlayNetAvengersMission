using System;

// Token: 0x02000198 RID: 408
public class DetectedGearButtonBehavior : buttonBehavior
{
	// Token: 0x06000C6F RID: 3183 RVA: 0x0005A8C4 File Offset: 0x00058AC4
	public void set_data(sFoundDevice data)
	{
		this.id = data.id;
		this.sprite.spriteName = this.spritename_prefix + data.type.ToString();
		GearDBItemClass gearDBItemClass = globals.database_data.item_by_id(data.type.ToString(), true) as GearDBItemClass;
		if (gearDBItemClass)
		{
			this.name_label.text = gearDBItemClass.name;
		}
		this.id_label.text = data.id.ToString();
	}

	// Token: 0x06000C70 RID: 3184 RVA: 0x0005A94C File Offset: 0x00058B4C
	protected override void Update()
	{
		base.Update();
	}

	// Token: 0x04000C1D RID: 3101
	public UILabel name_label;

	// Token: 0x04000C1E RID: 3102
	public UILabel id_label;

	// Token: 0x04000C1F RID: 3103
	public int id = -1;

	// Token: 0x04000C20 RID: 3104
	public DetectedGearButtonBehavior.reg_enum registered;

	// Token: 0x04000C21 RID: 3105
	public string spritename_prefix = "gearfound_";

	// Token: 0x02000199 RID: 409
	public enum reg_enum
	{
		// Token: 0x04000C23 RID: 3107
		unregistered,
		// Token: 0x04000C24 RID: 3108
		mine,
		// Token: 0x04000C25 RID: 3109
		not_mine
	}
}
