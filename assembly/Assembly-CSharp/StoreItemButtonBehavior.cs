using System;

// Token: 0x02000301 RID: 769
public class StoreItemButtonBehavior : LabelledButtonBehavior
{
	// Token: 0x17000237 RID: 567
	// (get) Token: 0x06001427 RID: 5159 RVA: 0x000910AC File Offset: 0x0008F2AC
	// (set) Token: 0x06001428 RID: 5160 RVA: 0x000910B4 File Offset: 0x0008F2B4
	public virtual StoreItemDataClass data
	{
		get
		{
			return this._data;
		}
		set
		{
			this._data = value;
			if (this.label)
			{
				this.label.text = value.name;
			}
			StoreItemDataClass.type_enum type = value.type;
			if (type != StoreItemDataClass.type_enum.physical)
			{
				if (type == StoreItemDataClass.type_enum.location)
				{
					this.sprite.atlas = globals.store_main.location_atlas;
					this.sprite.spriteName = this.dlc_prefix + value.id;
				}
			}
			else
			{
				if (globals.database_data.item_by_id(this._data.id, true) is SFDBItemClass)
				{
					this.sprite.atlas = globals.store_main.SF_atlas;
				}
				else
				{
					this.sprite.atlas = globals.store_main.gear_atlas;
				}
				this.sprite.spriteName = this.physical_prefix + value.id;
			}
			this.sprite.MakePixelPerfect();
		}
	}

	// Token: 0x17000238 RID: 568
	// (get) Token: 0x06001429 RID: 5161 RVA: 0x000911B4 File Offset: 0x0008F3B4
	public string id
	{
		get
		{
			return this.data.id;
		}
	}

	// Token: 0x04001618 RID: 5656
	public string dlc_prefix = "DLC_";

	// Token: 0x04001619 RID: 5657
	public string physical_prefix = "phys_";

	// Token: 0x0400161A RID: 5658
	protected StoreItemDataClass _data;
}
