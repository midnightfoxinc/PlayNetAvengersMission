using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x020002C1 RID: 705
public class AvatarSelectPanelBehavior : BackButtonCloseBehavior
{
	// Token: 0x060012B7 RID: 4791 RVA: 0x00085BB0 File Offset: 0x00083DB0
	public void show()
	{
		this.selected_highlight.gameObject.SetActive(false);
		base.gameObject.SetActive(true);
		if (this.sf_data.Count < 1)
		{
			for (int i = 0; i < globals.database_data.item.Count; i++)
			{
				if (globals.database_data.item[i] is SFDBItemClass && (globals.database_data.item[i] as SFDBItemClass).avatar)
				{
					this.sf_data.Add(globals.database_data.item[i] as SFDBItemClass);
				}
			}
		}
		while (this.texture_button.Count < this.sf_data.Count)
		{
			AvatarSelectButtonBehavior avatarSelectButtonBehavior = this.texture_button[0].CopyInPlace() as AvatarSelectButtonBehavior;
			avatarSelectButtonBehavior.name = "avatar " + this.texture_button.Count.ToString();
			this.texture_button.Add(avatarSelectButtonBehavior);
		}
		for (int j = 0; j < this.texture_button.Count; j++)
		{
			if (j < this.sf_data.Count)
			{
				this.texture_button[j].avatar_select_panel = this;
				this.texture_button[j].set_data(this.sf_data[j]);
			}
			else
			{
				this.texture_button[j].gameObject.SetActive(false);
			}
		}
		this.avatar_grid.Reposition();
		this.scroll_view.ResetPosition();
		globals.sfx_master.play(this.show_sfx, null);
		this._dragging = true;
	}

	// Token: 0x060012B8 RID: 4792 RVA: 0x00085D70 File Offset: 0x00083F70
	protected override void Update()
	{
		base.Update();
		if (this.scroll_view && this.scroll_view.isDragging)
		{
			this._dragging = true;
		}
		for (int i = 0; i < this.texture_button.Count; i++)
		{
			if (this.texture_button[i].released && !this._dragging)
			{
				globals.player_data.avatar = this.texture_button[i].sf_data.id;
				globals.player_data.saveData(true, false);
				globals.sfx_master.play(this.change_avatar_sfx, null);
				this.profile_panel.refresh_avatar();
				this.close(false);
			}
			if (this.texture_button[i].gameObject.activeInHierarchy && this.texture_button[i].sf_data.id == globals.player_data.avatar)
			{
				this.selected_highlight.gameObject.SetActive(true);
				this.selected_highlight.transform.position = this.texture_button[i].transform.position;
			}
		}
		if (this.close_button.clicked)
		{
			this.profile_panel.refresh_avatar();
			this.close(false);
		}
		if (this._dragging && !Input.GetMouseButton(0))
		{
			this._dragging = false;
		}
	}

	// Token: 0x040013A0 RID: 5024
	public buttonBehavior close_button;

	// Token: 0x040013A1 RID: 5025
	public List<AvatarSelectButtonBehavior> texture_button;

	// Token: 0x040013A2 RID: 5026
	public UIGrid avatar_grid;

	// Token: 0x040013A3 RID: 5027
	public UIScrollView scroll_view;

	// Token: 0x040013A4 RID: 5028
	public UISprite selected_highlight;

	// Token: 0x040013A5 RID: 5029
	public string show_sfx = "button press";

	// Token: 0x040013A6 RID: 5030
	public string change_avatar_sfx = "advance";

	// Token: 0x040013A7 RID: 5031
	internal ProfilePanelBehavior profile_panel;

	// Token: 0x040013A8 RID: 5032
	private List<SFDBItemClass> sf_data = new List<SFDBItemClass>();

	// Token: 0x040013A9 RID: 5033
	private bool _dragging;
}
