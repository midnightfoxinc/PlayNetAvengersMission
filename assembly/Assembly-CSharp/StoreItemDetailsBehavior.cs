using System;
using UnityEngine;

// Token: 0x020001E6 RID: 486
public abstract class StoreItemDetailsBehavior : BackButtonCloseBehavior
{
	// Token: 0x170001D5 RID: 469
	// (get) Token: 0x06000E1F RID: 3615 RVA: 0x00063CA0 File Offset: 0x00061EA0
	public string id
	{
		get
		{
			if (!this._data)
			{
				return string.Empty;
			}
			return this._data.id;
		}
	}

	// Token: 0x06000E20 RID: 3616 RVA: 0x00063CC4 File Offset: 0x00061EC4
	public bool is_DLC()
	{
		return this._data.type == StoreItemDataClass.type_enum.location;
	}

	// Token: 0x06000E21 RID: 3617 RVA: 0x00063CD4 File Offset: 0x00061ED4
	protected virtual void cleanup()
	{
		Resources.UnloadAsset(this.portrait_texture.mainTexture);
	}

	// Token: 0x06000E22 RID: 3618 RVA: 0x00063CE8 File Offset: 0x00061EE8
	public override void close(bool silent = false)
	{
		base.close(silent);
		this.cleanup();
	}

	// Token: 0x06000E23 RID: 3619 RVA: 0x00063CF8 File Offset: 0x00061EF8
	public void set_data(string id)
	{
		if (string.IsNullOrEmpty(id))
		{
			return;
		}
		this.set_data(globals.store_data.item_by_id(id, true));
	}

	// Token: 0x06000E24 RID: 3620 RVA: 0x00063D18 File Offset: 0x00061F18
	public virtual void set_data(StoreItemDataClass d)
	{
		this._data = d;
		this.name_label.text = this._data.name;
		this.description_label.text = this._data.description.Replace("\\n", "\n");
		if (this._data.type == StoreItemDataClass.type_enum.physical)
		{
			this.legalese_label.text = "Actual product and colors may vary. Other accessories each sold separately.";
		}
		else
		{
			this.legalese_label.text = string.Empty;
		}
		if (this._data.starter_pack)
		{
			this.requires_label.text = string.Empty;
			UILabel uilabel = this.legalese_label;
			uilabel.text += " Batteries sold separately.";
		}
		else if (this._data.id == "1101")
		{
			this.requires_label.text = "REQUIRES AVENGER GEAR AVAILABLE IN STARTER PACK. SOLD SEPARATELY.";
			UILabel uilabel2 = this.legalese_label;
			uilabel2.text += " Batteries sold separately.";
		}
		else if (this._data.id == "2101" || this._data.id == "2111")
		{
			this.requires_label.text = "REQUIRES POWER ACTIVATOR AVAILABLE IN STARTER PACK. SOLD SEPARATELY.";
			UILabel uilabel3 = this.legalese_label;
			uilabel3.text += " Batteries sold separately.";
		}
		else if (this._data.id == "257" || this._data.id == "321" || this._data.id == "300")
		{
			this.requires_label.text = "REQUIRES POWER ACTIVATOR AND AVENGER GEAR AVAILABLE IN STARTER PACK.";
		}
		else
		{
			this.requires_label.text = "REQUIRES POWER ACTIVATOR AND AVENGER GEAR AVAILABLE IN STARTER PACK. SOLD SEPARATELY.";
		}
		if (this._data.type == StoreItemDataClass.type_enum.physical)
		{
			this.portrait_texture.mainTexture = Resources.Load<Texture>(this.physical_texture_prefix + this.id);
			base.gameObject.SetActive(true);
			globals.sfx_master.play(this.show_sfx, null);
		}
		else if (this._data.type == StoreItemDataClass.type_enum.location)
		{
			this.portrait_texture.mainTexture = Resources.Load<Texture>(this.DLC_texture_prefix + this.id);
			base.gameObject.SetActive(true);
			globals.sfx_master.play(this.show_sfx, null);
		}
		else
		{
			globals.debugWarning("invalid id: " + this.id);
		}
		if (this.description_scroll)
		{
			this.description_scroll.ResetPosition();
		}
	}

	// Token: 0x06000E25 RID: 3621 RVA: 0x00063FD8 File Offset: 0x000621D8
	protected override void Update()
	{
		base.Update();
		if (Input.GetMouseButtonUp(0) && globals.selectedObject == this.close_button.gameObject)
		{
			this.close(false);
		}
		if (!Input.GetMouseButton(0))
		{
			this._is_dragging = false;
		}
		else if (this.description_scroll.isDragging)
		{
			this._is_dragging = true;
		}
	}

	// Token: 0x04000DCA RID: 3530
	public string show_sfx = "db show";

	// Token: 0x04000DCB RID: 3531
	public UILabel name_label;

	// Token: 0x04000DCC RID: 3532
	public Collider close_button;

	// Token: 0x04000DCD RID: 3533
	public UILabel requires_label;

	// Token: 0x04000DCE RID: 3534
	public UILabel legalese_label;

	// Token: 0x04000DCF RID: 3535
	public UILabel description_label;

	// Token: 0x04000DD0 RID: 3536
	public UITexture portrait_texture;

	// Token: 0x04000DD1 RID: 3537
	public UIScrollView description_scroll;

	// Token: 0x04000DD2 RID: 3538
	public bool disable_related;

	// Token: 0x04000DD3 RID: 3539
	private string physical_texture_prefix = "store/physical/store_phys_";

	// Token: 0x04000DD4 RID: 3540
	private string DLC_texture_prefix = "store/DLC/store_dlc_";

	// Token: 0x04000DD5 RID: 3541
	protected StoreItemDataClass _data;

	// Token: 0x04000DD6 RID: 3542
	protected bool _is_dragging;
}
