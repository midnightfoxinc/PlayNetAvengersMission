using System;
using System.Collections.Generic;
using UnityEngine;

// Token: 0x0200019F RID: 415
public class GearDetectedMainBehavior : CallbackMonoBehavior
{
	// Token: 0x06000C81 RID: 3201 RVA: 0x0005AD14 File Offset: 0x00058F14
	private void Start()
	{
		this.update_gear_list();
		this.scroll_view.ResetPosition();
		globals.music_jukebox.change_music(this.music, 0.25f);
		globals.autoConnect = false;
		base._callback_handler.addDeviceEventCallback(BLEManager.DeviceEvent.BLE_DISABLED, new BLEManager.DataReceivedDelegate(this.blueToothWarning));
		globals.BLE_manager.isBluetoothRadioOn();
		if (globals.BLE_manager.connectedDevice > -1)
		{
			globals.debug("disconnectFromDevice being called - GearDetectMenu start");
			globals.BLE_manager.disconnectFromDevice();
		}
	}

	// Token: 0x06000C82 RID: 3202 RVA: 0x0005AD94 File Offset: 0x00058F94
	public void blueToothWarning(JSONObject data)
	{
		ConfirmationPopupAlert.Show(Localization.Get("BLUETOOTH_WARNING_LABEL"), Localization.Get("BLUETOOTH_WARNING"), Localization.Get("CANCEL"), Localization.Get("OKAY"), GameObject.Find("UI Root"), null, null);
	}

	// Token: 0x06000C83 RID: 3203 RVA: 0x0005ADDC File Offset: 0x00058FDC
	private void update_gear_list()
	{
		List<sFoundDevice> list = new List<sFoundDevice>();
		foreach (KeyValuePair<int, sFoundDevice> keyValuePair in globals.BLE_manager.devicesSeen)
		{
			if (keyValuePair.Key > 0 && (keyValuePair.Value.flags == 0 || this.show_registered))
			{
				list.Add(keyValuePair.Value);
			}
		}
		while (this.gear_button.Count < list.Count)
		{
			DetectedGearButtonBehavior detectedGearButtonBehavior = this.gear_button[0].CopyInPlace() as DetectedGearButtonBehavior;
			detectedGearButtonBehavior.name = "gear button " + this.gear_button.Count.ToString();
			this.gear_button.Add(detectedGearButtonBehavior);
		}
		for (int i = 0; i < this.gear_button.Count; i++)
		{
			if (i < list.Count)
			{
				this.gear_button[i].set_data(list[i]);
				this.gear_button[i].gameObject.SetActive(true);
			}
			else
			{
				this.gear_button[i].gameObject.SetActive(false);
			}
		}
		if (list.Count != this._previous_gear_count)
		{
			this.gear_button_grid.Reposition();
			this.searching_indicator.SetActive(list.Count < 1);
			this._previous_gear_count = list.Count;
			this.gear_found_count_label.text = list.Count.ToString() + " DEVICES FOUND";
			if (this.gear_found_count_tween)
			{
				this.gear_found_count_tween.ResetToBeginning();
				this.gear_found_count_tween.PlayForward();
			}
			this.title_label.text = ((list.Count <= 0) ? "SEARCHING FOR AVENGER GEAR..." : "WHICH AVENGER GEAR WOULD YOU LIKE TO REGISTER?");
		}
	}

	// Token: 0x06000C84 RID: 3204 RVA: 0x0005B008 File Offset: 0x00059208
	private void Update()
	{
		this.update_gear_list();
		if (Input.GetMouseButtonDown(0) && globals.selectedObject == this.skip_collider.gameObject)
		{
			globals.FTUE_manager.set_state(this.skip_state, true);
		}
		else if (Input.GetKeyDown(27))
		{
			globals.FTUE_manager.set_state(this.skip_state, true);
		}
		if (this.scroll_view && this.scroll_view.isDragging)
		{
			this._dragging = true;
		}
		if (!this._dragging && Input.GetMouseButtonUp(0))
		{
			for (int i = 0; i < this.gear_button.Count; i++)
			{
				if (globals.selectedObject == this.gear_button[i].gameObject)
				{
					globals.BLE_manager.connectToDevice(this.gear_button[i].id);
					globals.FTUE_manager.register_device_id = this.gear_button[i].id;
					globals.FTUE_manager.set_state(this.register_device_state, false);
				}
			}
		}
		if (this._dragging && !Input.GetMouseButton(0))
		{
			this._dragging = false;
		}
	}

	// Token: 0x04000C41 RID: 3137
	public UILabel title_label;

	// Token: 0x04000C42 RID: 3138
	public List<DetectedGearButtonBehavior> gear_button;

	// Token: 0x04000C43 RID: 3139
	public UIGrid gear_button_grid;

	// Token: 0x04000C44 RID: 3140
	public UIScrollView scroll_view;

	// Token: 0x04000C45 RID: 3141
	public GameObject searching_indicator;

	// Token: 0x04000C46 RID: 3142
	public Collider skip_collider;

	// Token: 0x04000C47 RID: 3143
	public UILabel gear_found_count_label;

	// Token: 0x04000C48 RID: 3144
	public UITweener gear_found_count_tween;

	// Token: 0x04000C49 RID: 3145
	public string music;

	// Token: 0x04000C4A RID: 3146
	public string register_device_state = "register device";

	// Token: 0x04000C4B RID: 3147
	public string skip_state = "register later";

	// Token: 0x04000C4C RID: 3148
	public bool show_registered;

	// Token: 0x04000C4D RID: 3149
	protected bool _dragging = true;

	// Token: 0x04000C4E RID: 3150
	private int _previous_gear_count = -1;
}
