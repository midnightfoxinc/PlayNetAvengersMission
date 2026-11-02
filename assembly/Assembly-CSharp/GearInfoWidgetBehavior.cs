using System;
using UnityEngine;

// Token: 0x02000287 RID: 647
public class GearInfoWidgetBehavior : MonoBehaviour
{
	// Token: 0x17000200 RID: 512
	// (get) Token: 0x06001146 RID: 4422 RVA: 0x0007B300 File Offset: 0x00079500
	public int id
	{
		get
		{
			return this._id;
		}
	}

	// Token: 0x17000201 RID: 513
	// (get) Token: 0x06001147 RID: 4423 RVA: 0x0007B308 File Offset: 0x00079508
	public string nickname
	{
		get
		{
			return this._nickname;
		}
	}

	// Token: 0x06001148 RID: 4424 RVA: 0x0007B310 File Offset: 0x00079510
	public void set_data(int id)
	{
		if (globals.player_data.getOwnedDevice().ContainsKey(id))
		{
			this.set_data(globals.player_data.getOwnedDevice()[id]);
		}
		else
		{
			globals.debugWarning("can't find owned device with id #" + id.ToString());
			this.set_data(null);
		}
	}

	// Token: 0x06001149 RID: 4425 RVA: 0x0007B36C File Offset: 0x0007956C
	public void set_data(PlayerDeviceClass d)
	{
		if (d)
		{
			this._id = d.id;
			this._nickname = d.nickname;
			if (this.label)
			{
				this.label.text = d.nickname;
			}
			this.gear_icon.spriteName = this.gear_icon_prefix + d.type.ToString();
			int xp = d.xp;
			int level = globals.gear_level_from_xp(xp);
			this.level_widget.set_level(level, globals.gear_xp_to_fill(xp), d.type);
		}
		else
		{
			this._id = -1;
			if (this.label)
			{
				this.label.text = string.Empty;
			}
			this.gear_icon.spriteName = string.Empty;
			this.level_widget.hide();
		}
	}

	// Token: 0x040011AF RID: 4527
	public UISprite gear_icon;

	// Token: 0x040011B0 RID: 4528
	public UILabel label;

	// Token: 0x040011B1 RID: 4529
	public LevelWidgetBehavior level_widget;

	// Token: 0x040011B2 RID: 4530
	public string gear_icon_prefix = "icon_";

	// Token: 0x040011B3 RID: 4531
	private int _id = -1;

	// Token: 0x040011B4 RID: 4532
	private string _nickname;
}
