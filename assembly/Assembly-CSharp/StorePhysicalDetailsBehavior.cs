using System;
using UnityEngine;

// Token: 0x02000309 RID: 777
public class StorePhysicalDetailsBehavior : StoreItemDetailsBehavior
{
	// Token: 0x06001440 RID: 5184 RVA: 0x00091B8C File Offset: 0x0008FD8C
	protected override void cleanup()
	{
		Resources.UnloadAsset(this.location_texture.mainTexture);
		base.cleanup();
	}

	// Token: 0x06001441 RID: 5185 RVA: 0x00091BA4 File Offset: 0x0008FDA4
	public override void set_data(StoreItemDataClass d)
	{
		base.set_data(d);
		if (this.tds_button)
		{
			this.tds_button.gameObject.SetActive(!string.IsNullOrEmpty(d.tds_id));
		}
		this.location_texture.mainTexture = null;
		this.location_texture.gameObject.SetActive(false);
		this.location_id = string.Empty;
		DBItemClass dbitemClass = d.db_item();
		if (dbitemClass)
		{
			locationDataItemClass locationDataItemClass = globals.location_data.location_by_requires(dbitemClass.id);
			if (locationDataItemClass)
			{
				this.location_texture.mainTexture = (Resources.Load("location bg/loc_bg_" + locationDataItemClass.id) as Texture);
				this.frame_button.label.text = "Location Acquired**: [b]" + locationDataItemClass.name + "[/b]";
				this.location_texture.gameObject.SetActive(true);
				this.location_id = locationDataItemClass.id;
			}
		}
		if (this.description_scroll)
		{
			this.description_scroll.ResetPosition();
		}
	}

	// Token: 0x06001442 RID: 5186 RVA: 0x00091CC0 File Offset: 0x0008FEC0
	protected override void Update()
	{
		base.Update();
		if (this.tds_button && this.tds_button.clicked)
		{
			DMOManager.LogNavigation("disney_store", base.id, NavigationManager.store_scene, base.id);
			globals.URL_roster.open_TDS_page(this._data.tds_id);
		}
		else if (this.retailer_button.clicked)
		{
			globals.URL_roster.show_retailer_loc();
		}
		else if (this.frame_button.clicked && !string.IsNullOrEmpty(this.location_id) && !this._is_dragging)
		{
			globals.location_id = this.location_id;
			NavigationManager.load_scene(NavigationManager.location_scene);
		}
	}

	// Token: 0x0400163D RID: 5693
	public buttonBehavior retailer_button;

	// Token: 0x0400163E RID: 5694
	public buttonBehavior tds_button;

	// Token: 0x0400163F RID: 5695
	public UITexture location_texture;

	// Token: 0x04001640 RID: 5696
	public LabelledButtonBehavior frame_button;

	// Token: 0x04001641 RID: 5697
	private string location_id = string.Empty;
}
