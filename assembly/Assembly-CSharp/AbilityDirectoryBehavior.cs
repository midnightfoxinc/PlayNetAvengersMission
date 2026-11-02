using System;
using UnityEngine;

// Token: 0x02000215 RID: 533
public class AbilityDirectoryBehavior : MonoBehaviour
{
	// Token: 0x06000F01 RID: 3841 RVA: 0x0006AEC8 File Offset: 0x000690C8
	public void init()
	{
		this.ability_type_panel.ability_directory = this;
		this.ability_type_panel.init();
	}

	// Token: 0x06000F02 RID: 3842 RVA: 0x0006AEE4 File Offset: 0x000690E4
	public void set_buttons()
	{
		if (this.ability_type_panel.current_option())
		{
			ArmoryOptionBehavior armoryOptionBehavior = this.ability_type_panel.current_option();
			if (armoryOptionBehavior.atlas)
			{
				this.ability_button_L.set_atlas(armoryOptionBehavior.atlas);
				this.ability_button_C.set_atlas(armoryOptionBehavior.atlas);
				this.ability_button_R.set_atlas(armoryOptionBehavior.atlas);
			}
			this.ability_button_C.set_data(armoryOptionBehavior.ability_at(armoryOptionBehavior.current_index));
			this.ability_button_L.set_data(armoryOptionBehavior.ability_at(armoryOptionBehavior.current_index - 1));
			this.ability_button_R.set_data(armoryOptionBehavior.ability_at(armoryOptionBehavior.current_index + 1));
			this.ability_select_panel.set_ability(this.ability_button_C.data);
		}
	}

	// Token: 0x06000F03 RID: 3843 RVA: 0x0006AFB4 File Offset: 0x000691B4
	private void Update()
	{
		if (this.ability_type_panel.current != this._current)
		{
			this._current = this.ability_type_panel.current;
			this.set_buttons();
		}
		if (this.NextButton.hit && !this.NextButton.disabled)
		{
			this.NextButton.play_sfx();
			this.MoveList(true);
		}
		else if (this.PrevButton.hit && !this.PrevButton.disabled)
		{
			this.PrevButton.play_sfx();
			this.MoveList(false);
		}
		if (this.InfoButton.hit)
		{
			globals.debug("Info button hit");
			this.InfoButton.play_sfx();
			globals.poster_album.show(this.ability_button_C.data);
		}
		if (this.ability_type_panel.current_option().ability.Count == 1)
		{
			this.PrevButton.gameObject.SetActive(false);
			this.NextButton.gameObject.SetActive(false);
		}
		else
		{
			this.PrevButton.gameObject.SetActive(true);
			this.NextButton.gameObject.SetActive(true);
			this.NextButton.disabled = this.ability_type_panel.current_option().last_selected();
			this.PrevButton.disabled = this.ability_type_panel.current_option().first_selected();
		}
	}

	// Token: 0x06000F04 RID: 3844 RVA: 0x0006B12C File Offset: 0x0006932C
	private void MoveList(bool next)
	{
		if (this.ability_type_panel.current_option())
		{
			this.ability_type_panel.current_option().advance(next);
			this.set_buttons();
		}
	}

	// Token: 0x04000F76 RID: 3958
	public AbilityTypePanelBehavior ability_type_panel;

	// Token: 0x04000F77 RID: 3959
	public buttonBehavior NextButton;

	// Token: 0x04000F78 RID: 3960
	public buttonBehavior PrevButton;

	// Token: 0x04000F79 RID: 3961
	public buttonBehavior InfoButton;

	// Token: 0x04000F7A RID: 3962
	public UILabel name_label;

	// Token: 0x04000F7B RID: 3963
	public AbilityDirectoryButtonBehavior ability_button_L;

	// Token: 0x04000F7C RID: 3964
	public AbilityDirectoryButtonBehavior ability_button_C;

	// Token: 0x04000F7D RID: 3965
	public AbilityDirectoryButtonBehavior ability_button_R;

	// Token: 0x04000F7E RID: 3966
	internal AbilitySelectPanelBehavior ability_select_panel;

	// Token: 0x04000F7F RID: 3967
	private int _current = -1;
}
