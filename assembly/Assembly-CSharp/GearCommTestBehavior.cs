using System;
using emcore.GameData;
using UnityEngine;

// Token: 0x02000282 RID: 642
public class GearCommTestBehavior : CallbackMonoBehavior
{
	// Token: 0x06001126 RID: 4390 RVA: 0x0007A540 File Offset: 0x00078740
	private void Start()
	{
		if (this.test_button && globals.build_type != build_type_enum.development)
		{
			this.test_button.gameObject.SetActive(false);
			base.enabled = false;
		}
	}

	// Token: 0x06001127 RID: 4391 RVA: 0x0007A580 File Offset: 0x00078780
	private void get_scenario_list()
	{
		base._callback_handler.addDataReceivedCallback(Constants.ToyDataType.CT_SCN_LIST, new BLEManager.DataReceivedDelegate(this.OnScnListReceived));
		globals.BLE_manager.dataQuery(5, 0);
	}

	// Token: 0x06001128 RID: 4392 RVA: 0x0007A5B4 File Offset: 0x000787B4
	private void get_ability_list()
	{
		globals.debug("querying for abilities");
		base._callback_handler.addDataReceivedCallback(Constants.ToyDataType.CT_ABIL_LIST, new BLEManager.DataReceivedDelegate(this.OnAbilListReceived));
		globals.BLE_manager.dataQuery(3, 0);
	}

	// Token: 0x06001129 RID: 4393 RVA: 0x0007A5F0 File Offset: 0x000787F0
	private void send_ability(string abil)
	{
		globals.debug("sending ability");
		Ability ability = new Ability();
		ability.isCustom = false;
		ability.toyid = "AbilData." + abil;
		ability.armloc = 2;
		globals.BLE_manager.sendSetAbility(ability);
	}

	// Token: 0x0600112A RID: 4394 RVA: 0x0007A638 File Offset: 0x00078838
	private void ping_connected_device()
	{
		switch (this._ping_presses)
		{
		default:
			globals.BLE_manager.sendIdentifyDevice(globals.BLE_manager.connectedDevice, 2, "MISSIONACCEPT");
			this._ping_presses = 4;
			break;
		case 1:
			globals.BLE_manager.sendSetEnemyType(0, "enemy", "EXPLODING_BOT_V2", 14);
			this._ping_presses = 2;
			break;
		case 2:
			globals.BLE_manager.sendSetEnemyType(0, "enemy", "ZOMBOT_RAPTOR_V1", 18);
			this._ping_presses = 9;
			break;
		case 3:
			globals.debug("querying for environments");
			base._callback_handler.addDataReceivedCallback(Constants.ToyDataType.CT_ENV_LIST, new BLEManager.DataReceivedDelegate(this.OnEnvListReceived));
			globals.BLE_manager.dataQuery(4, 0);
			this._ping_presses++;
			break;
		case 4:
			globals.debug("sending environment change: RF");
			globals.BLE_manager.sendSetEnvironment("RF", null);
			this._ping_presses = 5;
			break;
		case 5:
			globals.debug("sending environment change: NY");
			globals.BLE_manager.sendSetEnvironment("NY", null);
			this._ping_presses = 6;
			break;
		case 6:
			globals.BLE_manager.sendSetEnvironment("WK", null);
			this._ping_presses = 0;
			break;
		case 9:
		{
			Ability ability = new Ability();
			ability.armloc = 2;
			ability.isCustom = false;
			ability.toyid = "AbilData.FreezRay";
			globals.BLE_manager.sendSetAbility(ability);
			this._ping_presses = 14;
			break;
		}
		case 10:
		{
			Ability ability2 = new Ability();
			ability2.armloc = 2;
			ability2.isCustom = false;
			ability2.toyid = "AbilData.HomMis";
			globals.BLE_manager.sendSetAbility(ability2);
			this._ping_presses = 13;
			break;
		}
		case 11:
			this.get_ability_list();
			this._ping_presses = 0;
			break;
		case 12:
		{
			Ability ability3 = new Ability();
			ability3.armloc = 2;
			ability3.behavior = 1;
			ability3.core = 1;
			ability3.energy = 3;
			ability3.id = 225;
			ability3.isCustom = true;
			ability3.lightColor1 = new Color(1f, 0.5f, 0.5f, 1f);
			ability3.lightColor2 = new Color(0.5f, 0.5f, 0.5f, 1f);
			ability3.lightPattern = 1;
			ability3.name = "tim";
			ability3.nameid1 = 1;
			ability3.nameid2 = 2;
			ability3.nameid3 = 3;
			ability3.power = 20;
			ability3.speed = 1;
			ability3.toyid = "someName";
			this._ping_presses = 0;
			globals.BLE_manager.sendSetAbility(ability3);
			break;
		}
		case 13:
		{
			Ability ability4 = new Ability();
			ability4.armloc = 4;
			ability4.isCustom = false;
			ability4.toyid = "AbilData.Stinger";
			globals.BLE_manager.sendSetAbility(ability4);
			this._ping_presses = 11;
			break;
		}
		case 14:
		{
			Ability ability5 = new Ability();
			ability5.armloc = 2;
			ability5.isCustom = false;
			ability5.toyid = "AbilData.RepBar";
			globals.BLE_manager.sendSetAbility(ability5);
			this._ping_presses = 13;
			break;
		}
		}
	}

	// Token: 0x0600112B RID: 4395 RVA: 0x0007A968 File Offset: 0x00078B68
	protected void OnAbilListReceived(JSONObject data)
	{
		globals.debug("OnAbilListReceived: " + data.Print(true));
		base._callback_handler.removeDataReceivedCallback(Constants.ToyDataType.CT_ABIL_LIST, new BLEManager.DataReceivedDelegate(this.OnAbilListReceived));
		data = data["cd"];
		foreach (JSONObject jsonobject in data.list)
		{
			int num = (int)jsonobject["armLoc"].n;
			string str = jsonobject["toyid"].str;
			Ability ability = GameData.getInstance().getAbility(str);
			if (ability != null)
			{
				globals.debug("Found a match with unlocked weapon");
			}
			else
			{
				globals.debug(string.Concat(new object[]
				{
					"Can't find ability ",
					str,
					" in list. Slot = ",
					num
				}));
			}
		}
	}

	// Token: 0x0600112C RID: 4396 RVA: 0x0007AA78 File Offset: 0x00078C78
	protected void OnEnvListReceived(JSONObject data)
	{
		globals.debug("OnEnvListReceived: " + data);
		base._callback_handler.removeDataReceivedCallback(Constants.ToyDataType.CT_ENV_LIST, new BLEManager.DataReceivedDelegate(this.OnEnvListReceived));
	}

	// Token: 0x0600112D RID: 4397 RVA: 0x0007AAB0 File Offset: 0x00078CB0
	protected void OnScnListReceived(JSONObject data)
	{
		globals.debug("OnScnListReceived: " + data);
		base._callback_handler.removeDataReceivedCallback(Constants.ToyDataType.CT_SCN_LIST, new BLEManager.DataReceivedDelegate(this.OnScnListReceived));
	}

	// Token: 0x0600112E RID: 4398 RVA: 0x0007AAE8 File Offset: 0x00078CE8
	private void Update()
	{
		if (this.test_button != null && this.test_button.hit)
		{
			if (!string.IsNullOrEmpty(this.ability_name))
			{
				this.send_ability(this.ability_name);
			}
			else
			{
				this.get_ability_list();
			}
		}
	}

	// Token: 0x04001175 RID: 4469
	public buttonBehavior test_button;

	// Token: 0x04001176 RID: 4470
	public string ability_name = string.Empty;

	// Token: 0x04001177 RID: 4471
	private int _ping_presses;

	// Token: 0x02000283 RID: 643
	public enum test_msg_enum
	{
		// Token: 0x04001179 RID: 4473
		SEND_PING,
		// Token: 0x0400117A RID: 4474
		SEND_BOMB_BOT,
		// Token: 0x0400117B RID: 4475
		SEND_RAPTOR,
		// Token: 0x0400117C RID: 4476
		QUERY_LOCATION,
		// Token: 0x0400117D RID: 4477
		SEND_RAFT,
		// Token: 0x0400117E RID: 4478
		SEND_NEW_YORK,
		// Token: 0x0400117F RID: 4479
		SEND_WAKANDA,
		// Token: 0x04001180 RID: 4480
		SEND_FREEZE = 9,
		// Token: 0x04001181 RID: 4481
		SEND_MISSLE,
		// Token: 0x04001182 RID: 4482
		QUERY_ABILITIES,
		// Token: 0x04001183 RID: 4483
		SEND_CUSTOM,
		// Token: 0x04001184 RID: 4484
		SEND_STINGER,
		// Token: 0x04001185 RID: 4485
		SEND_REPBAR
	}
}
