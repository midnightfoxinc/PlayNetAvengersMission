using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200028B RID: 651
public class SwitchGearMenuBehavior : GearDaisySubmenuBehavior
{
	// Token: 0x06001160 RID: 4448 RVA: 0x0007BEF8 File Offset: 0x0007A0F8
	private void Start()
	{
		this.scroll_view.panel.SetAnchor(NGUITools.GetRoot(base.gameObject));
		this.scroll_view.ResetPosition();
		this._close_on_disconnect = false;
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTERSUCCESS, new BLEManager.DataReceivedDelegate(this.onDeviceRegister));
	}

	// Token: 0x06001161 RID: 4449 RVA: 0x0007BF4C File Offset: 0x0007A14C
	public override void show(bool b)
	{
		base.gameObject.SetActive(b);
		globals.autoConnect = !b;
		if (b)
		{
			this._dragging = true;
			this.current_gear_highlight.SetActive(false);
			this._previous_devices_seen = -1;
			if (globals.BLE_manager.connectedDevice_data)
			{
				globals.show_confirm_alert(Localization.Get("SWITCH_GEAR_TITLE"), Localization.Get("SWITCH_GEAR_MSG").Replace("$GEAR_NAME", globals.player_data.latest_device_data.nickname), new EventDelegate.Callback(this.switch_yes), null, Localization.Get("YES"), Localization.Get("NO"), false);
			}
			this.refresh_gear_list();
		}
	}

	// Token: 0x06001162 RID: 4450 RVA: 0x0007BFFC File Offset: 0x0007A1FC
	public void onDeviceRegister(JSONObject data)
	{
		this.refresh_gear_list();
	}

	// Token: 0x06001163 RID: 4451 RVA: 0x0007C004 File Offset: 0x0007A204
	private void refresh_gear_list()
	{
		List<int> list = globals.player_data.device_ids();
		while (this.gear_button.Count < list.Count)
		{
			SwitchGearButtonBehavior switchGearButtonBehavior = this.gear_button[0].CopyInPlace() as SwitchGearButtonBehavior;
			switchGearButtonBehavior.name = "gear button " + this.gear_button.Count.ToString();
			this.gear_button.Add(switchGearButtonBehavior);
		}
		for (int i = 0; i < this.gear_button.Count; i++)
		{
			if (i < list.Count)
			{
				int num = list[i];
				this.gear_button[i].set_data(num);
				bool flag = (globals.player_data.getOwnedDevice()[num].hide && globals.BLE_manager.connectedDevice != num) || !globals.player_data.isDeviceRegistered(num);
				if (globals.BLE_manager.devicesSeen.ContainsKey(num) && globals.BLE_manager.devicesSeen[num].flags == 0)
				{
					flag = true;
				}
				this.gear_button[i].gameObject.SetActive(!flag);
			}
			else
			{
				this.gear_button[i].gameObject.SetActive(false);
			}
		}
		this.gear_button_grid.Reposition();
		this.scroll_view.ResetPosition();
	}

	// Token: 0x06001164 RID: 4452 RVA: 0x0007C17C File Offset: 0x0007A37C
	private void hide_yes()
	{
		if (globals.player_data.getOwnedDevice().ContainsKey(this._gear_to_hide))
		{
			globals.player_data.getOwnedDevice()[this._gear_to_hide].hide = true;
			globals.player_data.saveData(false, false);
			this.refresh_gear_list();
		}
		this._gear_to_hide = -1;
		this._dragging = true;
	}

	// Token: 0x06001165 RID: 4453 RVA: 0x0007C1E0 File Offset: 0x0007A3E0
	private void hide_no()
	{
		this._gear_to_hide = -1;
		this._dragging = true;
	}

	// Token: 0x06001166 RID: 4454 RVA: 0x0007C1F0 File Offset: 0x0007A3F0
	private void switch_yes()
	{
		globals.BLE_manager.disconnectFromDevice();
		globals.gear_daisy.play_sync();
	}

	// Token: 0x06001167 RID: 4455 RVA: 0x0007C208 File Offset: 0x0007A408
	protected override void Update()
	{
		base.Update();
		if (globals.BLE_manager.devicesSeen.Count != this._previous_devices_seen)
		{
			this._previous_devices_seen = globals.BLE_manager.devicesSeen.Count;
			this.refresh_gear_list();
		}
		if (this.close_button.clicked)
		{
			this.close(false);
		}
		else if (this.detect_button.clicked && !this._dragging)
		{
			globals.FTUE_manager.detect_gear();
		}
		this.current_gear_highlight.SetActive(false);
		for (int i = 0; i < this.gear_button.Count; i++)
		{
			if (this.gear_button[i].gameObject.activeInHierarchy)
			{
				this.gear_button[i].disabled = !globals.BLE_manager.devicesSeen.ContainsKey(this.gear_button[i].id);
				if (globals.BLE_manager.connectedDevice == this.gear_button[i].id)
				{
					this.current_gear_highlight.transform.position = this.gear_button[i].transform.position;
					this.current_gear_highlight.SetActive(true);
					if (this.gear_button[i].clicked && !this._dragging)
					{
						this.show(true);
					}
				}
				else if (this.gear_button[i].clicked && !this._dragging)
				{
					if (this.gear_button[i].disabled)
					{
						this._gear_to_hide = this.gear_button[i].id;
						globals.show_confirm_alert(Localization.Get("CONFIRM_HIDE_TITLE"), Localization.Get("CONFIRM_HIDE_MSG").Replace("$GEAR_NAME", this.gear_button[i].gear_info_widget.nickname), new EventDelegate.Callback(this.hide_yes), new EventDelegate.Callback(this.hide_no), Localization.Get("YES"), Localization.Get("NO"), false);
					}
					else if (globals.BLE_manager.connectedDevice > -1)
					{
						this._deviceToConnect = this.gear_button[i].id;
						globals.debug("disconnectFromDevice being called -disconnectFromDevice - Switch Gear");
						globals.BLE_manager.disconnectFromDevice();
						base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.DEVICE_LOOKUPDONE, new BLEManager.DataReceivedDelegate(this.onDeviceFound));
						base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceConnect));
					}
					else
					{
						this.sendConnectionRequest(this.gear_button[i].id);
					}
				}
			}
		}
		if (!Input.GetMouseButton(0))
		{
			this._dragging = false;
		}
		else if (this.scroll_view.isDragging)
		{
			this._dragging = true;
		}
	}

	// Token: 0x06001168 RID: 4456 RVA: 0x0007C4F8 File Offset: 0x0007A6F8
	public void onDeviceDisconnect(JSONObject data = null)
	{
	}

	// Token: 0x06001169 RID: 4457 RVA: 0x0007C4FC File Offset: 0x0007A6FC
	private void sendConnectionRequest(int deviceId)
	{
		if (!globals.BLE_manager.isDeviceRegistered(deviceId))
		{
			PopupAlert.Show(string.Empty, Localization.Get("DEVICE_NOT_REGISTERED"), Localization.Get("OKAY"), GameObject.Find("UI Root").transform.gameObject, null, 1f);
		}
		else
		{
			globals.BLE_manager.resetConnectionRequest();
			globals.BLE_manager.connectToDevice(deviceId);
		}
	}

	// Token: 0x0600116A RID: 4458 RVA: 0x0007C56C File Offset: 0x0007A76C
	public void onDeviceFound(JSONObject data)
	{
		int num = (int)data["device_id"].n;
		if (num == this._deviceToConnect)
		{
			this.sendConnectionRequest(this._deviceToConnect);
			base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.DEVICE_LOOKUPDONE, new BLEManager.DataReceivedDelegate(this.onDeviceFound));
		}
	}

	// Token: 0x0600116B RID: 4459 RVA: 0x0007C5BC File Offset: 0x0007A7BC
	public void onDeviceConnect(JSONObject data = null)
	{
		this._deviceToConnect = -1;
		base._callback_handler.removeDeviceEventCallback(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, new BLEManager.DataReceivedDelegate(this.onDeviceConnect));
	}

	// Token: 0x040011D2 RID: 4562
	public buttonBehavior detect_button;

	// Token: 0x040011D3 RID: 4563
	public List<SwitchGearButtonBehavior> gear_button;

	// Token: 0x040011D4 RID: 4564
	public UIGrid gear_button_grid;

	// Token: 0x040011D5 RID: 4565
	public UIScrollView scroll_view;

	// Token: 0x040011D6 RID: 4566
	public GameObject current_gear_highlight;

	// Token: 0x040011D7 RID: 4567
	private bool _dragging = true;

	// Token: 0x040011D8 RID: 4568
	private int _gear_to_hide = -1;

	// Token: 0x040011D9 RID: 4569
	private int _deviceToConnect = -1;

	// Token: 0x040011DA RID: 4570
	private int _previous_devices_seen = -1;
}
