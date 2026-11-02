using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x02000294 RID: 660
public class MissionManagerMissionBehavior : LabelledButtonBehavior
{
	// Token: 0x17000206 RID: 518
	// (get) Token: 0x060011BD RID: 4541 RVA: 0x0007F384 File Offset: 0x0007D584
	// (set) Token: 0x060011BE RID: 4542 RVA: 0x0007F38C File Offset: 0x0007D58C
	public missionDataClass data
	{
		get
		{
			return this._data;
		}
		set
		{
			this._data = value;
			if (this._data.rated)
			{
				UIAtlas uiatlas = Resources.Load<UIAtlas>(this.atlas_name_prefix + value.location.id);
				if (uiatlas)
				{
					this.sprite.atlas = uiatlas;
				}
				this.sprite.spriteName = this.cover_sprite_prefix + this._data.id.ToString();
				base.gameObject.SetActive(true);
				if (this.label)
				{
					this.label.text = this._data.name;
				}
				return;
			}
			base.gameObject.SetActive(false);
		}
	}

	// Token: 0x17000207 RID: 519
	// (get) Token: 0x060011BF RID: 4543 RVA: 0x0007F450 File Offset: 0x0007D650
	// (set) Token: 0x060011C0 RID: 4544 RVA: 0x0007F458 File Offset: 0x0007D658
	public MissionManagerMissionBehavior.state_enum state
	{
		get
		{
			return this._state;
		}
		set
		{
			this._state = value;
			this.ready_frame.gameObject.SetActive(this._state == MissionManagerMissionBehavior.state_enum.ready);
			this.get_frame.gameObject.SetActive(this._state == MissionManagerMissionBehavior.state_enum.get);
			this.missing_frame.gameObject.SetActive(this._state == MissionManagerMissionBehavior.state_enum.missing);
			this.downloading_frame.gameObject.SetActive(this._state == MissionManagerMissionBehavior.state_enum.downloading);
			this.install_frame.gameObject.SetActive(this._state == MissionManagerMissionBehavior.state_enum.install);
			this.installing_frame.gameObject.SetActive(this._state == MissionManagerMissionBehavior.state_enum.installing);
			this.disabled = (this._state == MissionManagerMissionBehavior.state_enum.get || this._state == MissionManagerMissionBehavior.state_enum.missing);
		}
	}

	// Token: 0x060011C1 RID: 4545 RVA: 0x0007F520 File Offset: 0x0007D720
	protected override void Update()
	{
		base.Update();
		if (!this._data)
		{
			return;
		}
		if (globals.BLE_manager.connectedDevice_data)
		{
			this.getCurrentState(globals.BLE_manager.connectedDevice);
		}
		else if (this._data.location.embedded)
		{
			this.state = MissionManagerMissionBehavior.state_enum.ready;
		}
		else
		{
			this.state = MissionManagerMissionBehavior.state_enum.missing;
		}
	}

	// Token: 0x060011C2 RID: 4546 RVA: 0x0007F598 File Offset: 0x0007D798
	private void getCurrentState(int deviceId)
	{
		if (globals.BLE_manager.mEntileContentContentAvailable.ContainsKey(deviceId))
		{
			Dictionary<string, EntileContent> dictionary = globals.BLE_manager.mEntileContentContentAvailable[deviceId];
			locationDataItemClass locationDataItemClass = globals.location_data.location_of_mission(this._data.id);
			if (locationDataItemClass.embedded)
			{
				this.state = MissionManagerMissionBehavior.state_enum.ready;
				return;
			}
			string version = string.Empty;
			if (dictionary.ContainsKey(this._data.entitlements))
			{
				version = dictionary[this._data.entitlements].version;
			}
			MissionManager instance = MissionManager.getInstance();
			if (instance.isPackageInstalled(deviceId, this._data.entitlements, true) || this._data.location.embedded)
			{
				this.state = MissionManagerMissionBehavior.state_enum.ready;
			}
			else if (instance.isPackageReadyToGet(deviceId, this._data.entitlements, version))
			{
				if (this._data.location.requires_purchase())
				{
					this.state = MissionManagerMissionBehavior.state_enum.get;
				}
				else
				{
					this.state = MissionManagerMissionBehavior.state_enum.missing;
				}
			}
			else if (instance.isPackageDownloading(deviceId, this._data.entitlements, version))
			{
				this.state = MissionManagerMissionBehavior.state_enum.downloading;
			}
			else if (instance.isPackageInstalling(deviceId, this._data.entitlements, version))
			{
				this.state = MissionManagerMissionBehavior.state_enum.installing;
			}
			else if (instance.isPackageReadytoInsall(deviceId, this._data.entitlements, version))
			{
				this.state = MissionManagerMissionBehavior.state_enum.install;
			}
			else
			{
				this.state = MissionManagerMissionBehavior.state_enum.missing;
			}
		}
	}

	// Token: 0x04001226 RID: 4646
	public UISprite ready_frame;

	// Token: 0x04001227 RID: 4647
	public UISprite get_frame;

	// Token: 0x04001228 RID: 4648
	public UISprite missing_frame;

	// Token: 0x04001229 RID: 4649
	public UISprite downloading_frame;

	// Token: 0x0400122A RID: 4650
	public UISprite install_frame;

	// Token: 0x0400122B RID: 4651
	public UISprite installing_frame;

	// Token: 0x0400122C RID: 4652
	public UISprite downloading_fill;

	// Token: 0x0400122D RID: 4653
	public UISprite installing_fill;

	// Token: 0x0400122E RID: 4654
	public string atlas_name_prefix = "mission cover atlas/mission cover atlas ";

	// Token: 0x0400122F RID: 4655
	public string cover_sprite_prefix = "cover_";

	// Token: 0x04001230 RID: 4656
	private missionDataClass _data;

	// Token: 0x04001231 RID: 4657
	private MissionManagerMissionBehavior.state_enum _state;

	// Token: 0x02000295 RID: 661
	public enum state_enum
	{
		// Token: 0x04001233 RID: 4659
		ready,
		// Token: 0x04001234 RID: 4660
		get,
		// Token: 0x04001235 RID: 4661
		missing,
		// Token: 0x04001236 RID: 4662
		downloading,
		// Token: 0x04001237 RID: 4663
		install,
		// Token: 0x04001238 RID: 4664
		installing
	}
}
