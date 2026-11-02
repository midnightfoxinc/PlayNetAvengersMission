using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000291 RID: 657
public class MissionManagerLocationBehavior : MonoBehaviour
{
	// Token: 0x17000204 RID: 516
	// (get) Token: 0x060011B4 RID: 4532 RVA: 0x0007EE4C File Offset: 0x0007D04C
	public bool clicked
	{
		get
		{
			return this.button.clicked;
		}
	}

	// Token: 0x17000205 RID: 517
	// (get) Token: 0x060011B5 RID: 4533 RVA: 0x0007EE5C File Offset: 0x0007D05C
	// (set) Token: 0x060011B6 RID: 4534 RVA: 0x0007EE64 File Offset: 0x0007D064
	public locationDataItemClass data
	{
		get
		{
			return this._data;
		}
		set
		{
			this._data = value;
			this.title_lbl.text = value.name.ToUpper();
			this.embedded_lbl_go.SetActive(this._data.embedded);
			this.refresh();
		}
	}

	// Token: 0x060011B7 RID: 4535 RVA: 0x0007EEA0 File Offset: 0x0007D0A0
	public void refresh()
	{
		if (this._data.embedded || MissionManager.getInstance().locationPartiallyOnGearAndCanRemove(this._data.id))
		{
			this.gear_sprite.gameObject.SetActive(true);
			if (globals.player_data.latest_device_data)
			{
				int type = globals.player_data.latest_device_data.type;
				if (type != 2101)
				{
					if (type != 2111)
					{
						this.gear_sprite.gameObject.SetActive(false);
					}
					else
					{
						this.gear_sprite.spriteName = "icon_2111";
					}
				}
				else
				{
					this.gear_sprite.spriteName = "icon_2101";
				}
			}
			else
			{
				this.gear_sprite.gameObject.SetActive(false);
			}
		}
		else
		{
			this.gear_sprite.gameObject.SetActive(false);
		}
		int num = 0;
		if (!this._data.embedded)
		{
			int num2 = 0;
			List<string> allAvailableDLCPatchIds = globals.BLE_manager.getAllAvailableDLCPatchIds();
			List<string> downloadableContentList = MissionManager.getInstance().getDownloadableContentList(this._data.id);
			foreach (string text in downloadableContentList)
			{
				if (allAvailableDLCPatchIds.Contains(text))
				{
					num++;
				}
				if (globals.BLE_manager.connectedDevice_data && !globals.BLE_manager.connectedDevice_data.content_installed(text))
				{
					num2++;
				}
			}
			if (num2 < downloadableContentList.Count && !MissionManager.getInstance().isLocationUnderInstall(this.data.id) && !MissionManager.getInstance().isLocationDownloadPending(this.data.id))
			{
				num += num2;
			}
		}
		this.update_count_lbl.text = num.ToString();
		this.update_count_lbl.gameObject.SetActive(num > 0);
		this.set_color();
	}

	// Token: 0x060011B8 RID: 4536 RVA: 0x0007F0CC File Offset: 0x0007D2CC
	public void set_color()
	{
		Color color;
		if (MissionManager.getInstance().isLocationUnderInstall(this._data.id))
		{
			color = MissionManagerBehavior.MM_blue;
		}
		else if (this._data.embedded || MissionManager.getInstance().locationPartiallyOnGearAndCanRemove(this._data.id))
		{
			color = MissionManagerBehavior.MM_green;
		}
		else
		{
			color = MissionManagerBehavior.MM_light_blue;
		}
		this.bg_sprite.color = color;
	}

	// Token: 0x060011B9 RID: 4537 RVA: 0x0007F148 File Offset: 0x0007D348
	public void select(bool b)
	{
		this.selected_sprite.gameObject.SetActive(b);
		if (b && this.mission_manager)
		{
			if (!base.gameObject.activeInHierarchy)
			{
				base.gameObject.SetActive(true);
				this.mission_manager.location_grid.Reposition();
				this.mission_manager.location_scroll_view.ResetPosition();
			}
			this.mission_manager.button_link.SetAnchor(this.button.gameObject);
		}
	}

	// Token: 0x0400120E RID: 4622
	public buttonBehavior button;

	// Token: 0x0400120F RID: 4623
	public UISprite selected_sprite;

	// Token: 0x04001210 RID: 4624
	public UILabel title_lbl;

	// Token: 0x04001211 RID: 4625
	public UISprite bg_sprite;

	// Token: 0x04001212 RID: 4626
	public GameObject container;

	// Token: 0x04001213 RID: 4627
	public UISprite gear_sprite;

	// Token: 0x04001214 RID: 4628
	public GameObject embedded_lbl_go;

	// Token: 0x04001215 RID: 4629
	public UILabel update_count_lbl;

	// Token: 0x04001216 RID: 4630
	internal MissionManagerBehavior mission_manager;

	// Token: 0x04001217 RID: 4631
	private locationDataItemClass _data;
}
