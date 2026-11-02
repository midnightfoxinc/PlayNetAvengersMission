using System;
using System.Collections;
using System.Collections.Generic;
using emcore.GameData;
using UnityEngine;

// Token: 0x02000162 RID: 354
public class BLEManager : MonoBehaviour
{
	// Token: 0x170001AB RID: 427
	// (get) Token: 0x06000B48 RID: 2888 RVA: 0x00052BD4 File Offset: 0x00050DD4
	public int connectedDevice
	{
		get
		{
			return this._connectedDevice;
		}
	}

	// Token: 0x170001AC RID: 428
	// (get) Token: 0x06000B49 RID: 2889 RVA: 0x00052BDC File Offset: 0x00050DDC
	public ConnectedDevice connectedDevice_data
	{
		get
		{
			if (this.mConnectedDevices.ContainsKey(this._connectedDevice))
			{
				return this.mConnectedDevices[this._connectedDevice];
			}
			return null;
		}
	}

	// Token: 0x06000B4A RID: 2890 RVA: 0x00052C08 File Offset: 0x00050E08
	private void Start()
	{
		globals.debug("Hello BLE");
		if (globals.BLE_manager != this)
		{
			globals.debugWarning("extra BLE Manager destroyed in scene " + NavigationManager.current_scene());
			base.enabled = false;
			Object.Destroy(base.gameObject);
			return;
		}
		if (!globals.bleInitiated)
		{
			globals.bleInitiated = true;
			NativeManager.getNative().setRTOHost(globals.network_manager.server);
			NativeManager.getNative().InitializeDMO();
			this.resetBLE();
		}
	}

	// Token: 0x06000B4B RID: 2891 RVA: 0x00052C8C File Offset: 0x00050E8C
	public void resetBLE()
	{
		base.StartCoroutine(this.resetBLEProcess());
	}

	// Token: 0x06000B4C RID: 2892 RVA: 0x00052C9C File Offset: 0x00050E9C
	private IEnumerator resetBLEProcess()
	{
		if (this.connectedDevice != -1)
		{
			globals.debug("disconnectFromDevice being called - resetBLEProcess  ");
			this.disconnectFromDevice();
			yield return new WaitForSeconds(1f);
		}
		if (this.foundDevices != null)
		{
			NativeManager.getNative().unregisterBLE();
			yield return new WaitForSeconds(2f);
		}
		this.foundDevices = new Dictionary<int, sFoundDevice>();
		NativeManager.getNative().setupBLE(base.name);
		JSONObject data = new JSONObject();
		data.AddField("name", base.name);
		this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.BLE_SETUP, data);
		yield break;
	}

	// Token: 0x06000B4D RID: 2893 RVA: 0x00052CB8 File Offset: 0x00050EB8
	private void OnApplicationPause(bool paused)
	{
		if (paused && globals.retinalScan)
		{
			return;
		}
		if (paused && this.connectedDevice != -1)
		{
			globals.debug("disconnectFromDevice being called - OnApplicationPause");
			this.disconnectFromDevice();
		}
	}

	// Token: 0x06000B4E RID: 2894 RVA: 0x00052CF0 File Offset: 0x00050EF0
	public bool clearContent(int deviceId, List<string> contentIds)
	{
		this._num_to_delete_before_reboot = 0;
		NativeManager.getNative().removeAllCachedPackages(deviceId);
		globals.debug("clearContent start");
		foreach (string text in contentIds)
		{
			globals.player_data.removeDLCContent(deviceId, text);
			globals.debug(string.Concat(new object[]
			{
				"clearContent ",
				deviceId,
				":",
				text
			}));
			this.removeContent(deviceId, text);
		}
		return this._num_to_delete_before_reboot > 0;
	}

	// Token: 0x06000B4F RID: 2895 RVA: 0x00052DB4 File Offset: 0x00050FB4
	public void clearContent(int deviceId, string contentId)
	{
		globals.debug(string.Concat(new object[]
		{
			"clearContent",
			deviceId,
			":",
			contentId
		}));
		NativeManager.getNative().removeAllCachedPackages(deviceId);
		this.removeContent(deviceId, contentId);
		globals.player_data.removeDLCContent(deviceId, contentId);
	}

	// Token: 0x06000B50 RID: 2896 RVA: 0x00052E10 File Offset: 0x00051010
	public void removeContent(int deviceId, string contentId)
	{
		globals.debug(string.Concat(new object[]
		{
			"removeContent ",
			deviceId,
			":",
			contentId
		}));
		if (!this.connectedDevice_data)
		{
			globals.debug("no device connected!");
			return;
		}
		List<int> installedVersions = this.connectedDevice_data.getInstalledVersions(contentId);
		foreach (int num in installedVersions)
		{
			globals.debug(string.Concat(new object[]
			{
				"version id ",
				contentId,
				":",
				num
			}));
			this._num_to_delete_before_reboot++;
			NativeManager.getNative().clearContent(deviceId, contentId, num);
		}
	}

	// Token: 0x06000B51 RID: 2897 RVA: 0x00052F08 File Offset: 0x00051108
	public void contentDeleted(string jsonData)
	{
		globals.debug("contentDeleted " + jsonData);
		JSONObject data = new JSONObject(jsonData, -2, false, false);
		try
		{
			this._num_to_delete_before_reboot--;
			if (this._num_to_delete_before_reboot < 1)
			{
				this._num_to_delete_before_reboot = -1;
				this.rebootDevice(this._connectedDevice);
			}
			this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.CONTENT_DELETED, data);
		}
		catch (Exception ex)
		{
			globals.debug("deviceLeft exception: " + ex.ToString());
		}
	}

	// Token: 0x170001AD RID: 429
	// (get) Token: 0x06000B52 RID: 2898 RVA: 0x00052FA4 File Offset: 0x000511A4
	public int unregistered_devices_count
	{
		get
		{
			int num = 0;
			foreach (KeyValuePair<int, sFoundDevice> keyValuePair in this.foundDevices)
			{
				if (keyValuePair.Value.flags == 0)
				{
					num++;
				}
			}
			return num;
		}
	}

	// Token: 0x06000B53 RID: 2899 RVA: 0x0005301C File Offset: 0x0005121C
	public bool any_unregistered_devices()
	{
		foreach (KeyValuePair<int, sFoundDevice> keyValuePair in this.foundDevices)
		{
			if (keyValuePair.Value.flags == 0)
			{
				return true;
			}
		}
		return false;
	}

	// Token: 0x170001AE RID: 430
	// (get) Token: 0x06000B54 RID: 2900 RVA: 0x00053098 File Offset: 0x00051298
	public Dictionary<int, sFoundDevice> devicesSeen
	{
		get
		{
			return this.foundDevices;
		}
	}

	// Token: 0x06000B55 RID: 2901 RVA: 0x000530A0 File Offset: 0x000512A0
	public void deviceFound(string jsonData)
	{
		JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
		sFoundDevice sFoundDevice = new sFoundDevice();
		sFoundDevice.id = (int)jsonobject["device_id"].n;
		sFoundDevice.type = (int)jsonobject["type"].n;
		sFoundDevice.flags = (int)jsonobject["flags"].n;
		globals.debug(string.Concat(new object[]
		{
			"DEVICE FOUND",
			jsonData,
			":",
			sFoundDevice.id
		}));
		if (!this.foundDevices.ContainsKey(sFoundDevice.id))
		{
			this.foundDevices.Add(sFoundDevice.id, sFoundDevice);
		}
		else
		{
			this.foundDevices[sFoundDevice.id] = sFoundDevice;
		}
		this.resetConnectionRequest();
		this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.DEVICE_LOOKUPDONE, jsonobject);
		if (globals.player_data.owns_device(sFoundDevice.id))
		{
			globals.player_data.getOwnedDevice()[sFoundDevice.id].hide = false;
		}
	}

	// Token: 0x06000B56 RID: 2902 RVA: 0x000531B4 File Offset: 0x000513B4
	public void deviceLeft(string jsonData)
	{
		globals.debug(string.Concat(new object[]
		{
			"device Left ",
			jsonData,
			":",
			this.connectedDevice
		}));
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("device_id"))
			{
				int num = (int)jsonobject["device_id"].n;
				if (this.foundDevices.ContainsKey(num))
				{
					this.foundDevices.Remove(num);
				}
			}
		}
		catch (Exception ex)
		{
			globals.debug("deviceLeft exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B57 RID: 2903 RVA: 0x0005327C File Offset: 0x0005147C
	public bool isDeviceRegistered(int deviceId)
	{
		return !this.devicesSeen.ContainsKey(deviceId) || this.devicesSeen[deviceId].flags != 0;
	}

	// Token: 0x06000B58 RID: 2904 RVA: 0x000532B4 File Offset: 0x000514B4
	public void onDeviceRegistrationSuccess(int deviceId)
	{
		int deviceType = 0;
		globals.debug(string.Concat(new object[]
		{
			"onDeviceRegisterationSuccess ",
			deviceId,
			":",
			this.foundDevices.ContainsKey(deviceId)
		}));
		if (this.mConnectedDevices.ContainsKey(deviceId))
		{
			deviceType = (int)this.mConnectedDevices[deviceId].deviceType;
		}
		this.removeAllCachedPackages(deviceId);
		globals.player_data.addRegisterDevice(deviceId, deviceType);
		if (this.foundDevices.ContainsKey(deviceId))
		{
			this.foundDevices[deviceId].flags = 1;
		}
		globals.autoConnect = true;
		this.getFirmwareVersion(false);
	}

	// Token: 0x06000B59 RID: 2905 RVA: 0x00053368 File Offset: 0x00051568
	public void deviceConnected(string jsonData)
	{
		globals.debug("device connected: " + jsonData);
		JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
		int num = (int)jsonobject["device_id"].n;
		int num2 = (int)jsonobject["device_type"].n;
		string owner = null;
		if (!this.foundDevices.ContainsKey(num))
		{
			sFoundDevice sFoundDevice = new sFoundDevice();
			sFoundDevice.id = num;
			sFoundDevice.type = num2;
			if (jsonobject.HasField("flags"))
			{
				sFoundDevice.flags = (int)jsonobject["flags"].n;
			}
			this.foundDevices.Add(num, sFoundDevice);
		}
		if (this.requestedDeviceId_forJoin == num)
		{
			this._connectedDevice = num;
			this._onConnectPingWait = true;
			if (!this.mConnectedDevices.ContainsKey(num))
			{
				this.mConnectedDevices.Add(num, new ConnectedDevice(num, num2, owner));
				if (globals.player_data.isAuthenticated())
				{
					globals.player_data.setPrimaryDevice(num);
					DMOManager.LogDeviceConnected();
					this.requestedDeviceId_forJoin = -1;
				}
			}
			globals.debug("Connected to " + num);
			globals.isFirmwareUpdateAvailable = false;
			globals.isFirmwareUptodate = false;
			globals.update_snooze = -1f;
			globals.resetReport();
			this.firmwareVersionRecallTries = 0;
			this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.BLE_DEVICE_CONNECT, jsonData);
			if (!this.isDeviceRegistered(this.connectedDevice))
			{
				globals.debug("DeviceEvent.UNREGISTERDEVICE_FOUND");
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_FOUND, jsonData);
			}
			if (globals.gear_daisy && !globals.touring() && globals.FTUE_manager.done)
			{
				globals.gear_daisy.play_sync();
			}
		}
	}

	// Token: 0x06000B5A RID: 2906 RVA: 0x00053510 File Offset: 0x00051710
	public void fetchContentList()
	{
		globals.debug("fetchContentList ________________________________");
		this.mAvailableContent.Clear();
		this.mAvailableSystemUpdate.Clear();
		this.mAvailableFirmwareUpdateId = string.Empty;
		this.getContentEntitlements(this.connectedDevice);
	}

	// Token: 0x06000B5B RID: 2907 RVA: 0x00053554 File Offset: 0x00051754
	public void sendPlayerData(int deviceId = -1)
	{
		if (deviceId < 0)
		{
			deviceId = this.connectedDevice;
		}
		JSONObject jsonobject = globals.player_data.toJsonForToy(deviceId);
		if (jsonobject != null)
		{
			globals.debug("toyData = " + jsonobject.Print(true));
			this.dataSend(deviceId, Constants.ToyDataType.CT_PLAYER_DATA, 0, jsonobject);
		}
	}

	// Token: 0x06000B5C RID: 2908 RVA: 0x000535A4 File Offset: 0x000517A4
	public void deviceJoin(string jsonData)
	{
		globals.debug("Device join ignored, Not in use " + jsonData);
	}

	// Token: 0x06000B5D RID: 2909 RVA: 0x000535B8 File Offset: 0x000517B8
	public void removeConnectedDevice()
	{
		globals.debug("clearConnectedDeviceData ");
		if (this.mConnectedDevices.ContainsKey(this.connectedDevice))
		{
			globals.debug("removing this device:" + this.connectedDevice);
			this.mConnectedDevices.Remove(this.connectedDevice);
			this._connectedDevice = -1;
		}
		this.mConnectedDevices.Clear();
		globals.player_data.missionDownloadProgressState = Constants.ContentDownLoadState.NULL;
		globals.player_data.firmwareDownloadProgressState = Constants.FirmwareDownLoadState.NULL;
	}

	// Token: 0x06000B5E RID: 2910 RVA: 0x0005363C File Offset: 0x0005183C
	public void deviceDisconnected(string jsonData)
	{
		globals.debug(string.Concat(new object[]
		{
			"device disconnected: ",
			jsonData,
			":",
			this.connectedDevice
		}));
		JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
		if (jsonobject.HasField("device_id"))
		{
			int num = (int)jsonobject["device_id"].n;
			if (this.foundDevices.ContainsKey(num))
			{
				this.foundDevices.Remove(num);
			}
			if (num == this.connectedDevice)
			{
				this._onConnectPingWait = false;
				this.mConnectedDevices.Clear();
				this._connectedDevice = -1;
				this.resetConnectionRequest();
				globals.player_data.missionDownloadProgressState = Constants.ContentDownLoadState.NULL;
				globals.player_data.firmwareDownloadProgressState = Constants.FirmwareDownLoadState.NULL;
				globals.analytics_ready_for_upload = -1;
				globals.file_transfer_allowed = -1;
				globals.files_ready_for_upload = -1;
				this._file_tranfer_allowed.Clear();
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.BLE_DEVICE_DISCONNECT, jsonobject);
			}
		}
	}

	// Token: 0x06000B5F RID: 2911 RVA: 0x00053730 File Offset: 0x00051930
	public void getDeviceContentList(int deviceId)
	{
		NativeManager.getNative().getDeviceContentList(deviceId);
	}

	// Token: 0x06000B60 RID: 2912 RVA: 0x00053740 File Offset: 0x00051940
	public void loginWithAccessToken(string accessToken, string cellophaneKey)
	{
		base.StartCoroutine(this.initSDKwithToken(accessToken, cellophaneKey));
	}

	// Token: 0x06000B61 RID: 2913 RVA: 0x00053754 File Offset: 0x00051954
	private IEnumerator initSDKwithToken(string accessToken, string cellophaneKey)
	{
		if (!globals.bleInitiated)
		{
			yield return new WaitForSeconds(3f);
		}
		globals.debug("loginWithAccessToken" + accessToken);
		NativeManager.getNative().loginWithAccessToken(accessToken, cellophaneKey);
		this.getOwnerKey();
		yield break;
	}

	// Token: 0x06000B62 RID: 2914 RVA: 0x0005378C File Offset: 0x0005198C
	public void logout()
	{
		globals.debug("disconnectFromDevice being called - logout");
		this.disconnectFromDevice();
		if (globals.player_data.isAuthenticated())
		{
			NativeManager.getNative().logout();
		}
	}

	// Token: 0x06000B63 RID: 2915 RVA: 0x000537C4 File Offset: 0x000519C4
	public void addDataReceivedCallback(Constants.ToyDataType dataType, BLEManager.DataReceivedDelegate callback)
	{
		if (!this.dataReceivedDelegates.ContainsKey(dataType))
		{
			this.dataReceivedDelegates.Add(dataType, new List<BLEManager.DataReceivedDelegate>());
		}
		this.dataReceivedDelegates[dataType].Add(callback);
	}

	// Token: 0x06000B64 RID: 2916 RVA: 0x00053808 File Offset: 0x00051A08
	public void removeDataReceivedCallback(Constants.ToyDataType dataType, BLEManager.DataReceivedDelegate callback)
	{
		if (this.dataReceivedDelegates.ContainsKey(dataType))
		{
			this.dataReceivedDelegates[dataType].Remove(callback);
		}
	}

	// Token: 0x06000B65 RID: 2917 RVA: 0x0005383C File Offset: 0x00051A3C
	public void addDeviceEventCallback(BLEManager.DeviceEvent eventType, BLEManager.DataReceivedDelegate callback)
	{
		if (!this.deviceEventDelegates.ContainsKey(eventType))
		{
			this.deviceEventDelegates.Add(eventType, new List<BLEManager.DataReceivedDelegate>());
		}
		this.deviceEventDelegates[eventType].Add(callback);
	}

	// Token: 0x06000B66 RID: 2918 RVA: 0x00053880 File Offset: 0x00051A80
	public void removeDeviceEventCallback(BLEManager.DeviceEvent eventType, BLEManager.DataReceivedDelegate callback)
	{
		if (this.deviceEventDelegates.ContainsKey(eventType))
		{
			this.deviceEventDelegates[eventType].Remove(callback);
		}
	}

	// Token: 0x06000B67 RID: 2919 RVA: 0x000538B4 File Offset: 0x00051AB4
	public void SendDeviceEventDataToDelegates(BLEManager.DeviceEvent dEvent, string jsonData)
	{
		this.SendDeviceEventDataToDelegates(dEvent, new JSONObject(jsonData, -2, false, false));
	}

	// Token: 0x06000B68 RID: 2920 RVA: 0x000538C8 File Offset: 0x00051AC8
	public void SendDeviceEventDataToDelegates(BLEManager.DeviceEvent dEvent, JSONObject data)
	{
		try
		{
			if (this.deviceEventDelegates.ContainsKey(dEvent))
			{
				for (int i = 0; i < this.deviceEventDelegates[dEvent].Count; i++)
				{
					this.deviceEventDelegates[dEvent][i](data);
				}
			}
		}
		catch (Exception ex)
		{
			globals.debug(string.Concat(new string[]
			{
				"probably a bad callback 1: ",
				ex.ToString(),
				"@@@@",
				dEvent.ToString(),
				"~~~~~",
				data.Print(false)
			}));
		}
	}

	// Token: 0x06000B69 RID: 2921 RVA: 0x00053990 File Offset: 0x00051B90
	public void RequestNegotiateSessionKey(int deviceId)
	{
		globals.debug("NegotiateSessionKey" + deviceId);
		NativeManager.getNative().negotiateSessionKey(deviceId);
	}

	// Token: 0x06000B6A RID: 2922 RVA: 0x000539C0 File Offset: 0x00051BC0
	public void SendEnterKeyMask(int deviceId, string keyedInput)
	{
		globals.debug("enterKeyMask");
		NativeManager.getNative().enterKeyMask(deviceId, keyedInput);
	}

	// Token: 0x06000B6B RID: 2923 RVA: 0x000539D8 File Offset: 0x00051BD8
	public void sendRegisterDeviceRequest(string playerId, int deviceId)
	{
		NativeManager.getNative().registerDevice(playerId, deviceId);
	}

	// Token: 0x06000B6C RID: 2924 RVA: 0x000539E8 File Offset: 0x00051BE8
	public void registrationStatus(string jsonData)
	{
		globals.debug("registrationStatus Data received: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			int num = 0;
			int num2 = 0;
			if (jsonobject.HasField("device_id"))
			{
				num = (int)jsonobject["device_id"].n;
			}
			if (jsonobject.HasField("event"))
			{
				num2 = (int)jsonobject["event"].n;
			}
			string text = "registrationStatus: " + num.ToString() + ": ";
			Constants.RegistrationEvent registrationEvent = (Constants.RegistrationEvent)num2;
			switch (registrationEvent)
			{
			case Constants.RegistrationEvent.REG_FAIL_GENERAL:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTERFAIL, jsonobject);
				text += "REG_FAIL_GENERAL";
				break;
			default:
				if (registrationEvent != Constants.RegistrationEvent.REG_TOKEN_VERIFIED)
				{
					if (registrationEvent != Constants.RegistrationEvent.UNREG_FROM_RTO_SUCCESS)
					{
						if (registrationEvent != Constants.RegistrationEvent.UNREG_FROM_RTO_FAILURE)
						{
							text = text + "UNKNOWN EVENT #" + num2.ToString();
						}
						else
						{
							this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREG_FROM_RTO_FAILURE, jsonobject);
							text += "UNREG_FROM_RTO_FAILURE";
						}
					}
					else
					{
						if (this.devicesSeen.ContainsKey(num))
						{
							this.devicesSeen[num].flags = 0;
						}
						this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREG_FROM_RTO_SUCCESS, jsonobject);
						text += "UNREG_FROM_RTO_SUCCESS";
					}
				}
				else
				{
					this.onDeviceRegistrationSuccess(num);
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTERSUCCESS, jsonobject);
					text += "REG_TOKEN_VERIFIED";
				}
				break;
			case Constants.RegistrationEvent.REG_FAIL_DECRYPTION:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTERFAILDECRYPTION, jsonobject);
				text += "REG_FAIL_DECRYPTION";
				break;
			case Constants.RegistrationEvent.REG_FAIL_ALREADY_REGISTERED:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_REGISTER_FAIL_ALREADY_REGISTERED, jsonobject);
				break;
			}
			globals.debug(text);
		}
		catch (Exception ex)
		{
			globals.debug("probably a bad callback 2 : " + ex.ToString());
		}
	}

	// Token: 0x06000B6D RID: 2925 RVA: 0x00053BC8 File Offset: 0x00051DC8
	public void synchDevice(string jsonData)
	{
		globals.debug("Sync Data received: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			int num = 0;
			int num2 = 0;
			if (jsonobject.HasField("device_id"))
			{
				num = (int)jsonobject["device_id"].n;
			}
			if (jsonobject.HasField("event"))
			{
				num2 = (int)jsonobject["event"].n;
			}
			if (jsonobject.HasField("payload"))
			{
				jsonobject = jsonobject["payload"];
			}
			globals.debug(jsonobject.Print(false));
			globals.debug(string.Concat(new object[]
			{
				(Constants.SyncEvent)num2,
				":",
				num2,
				":",
				num
			}));
			Constants.SyncEvent syncEvent = (Constants.SyncEvent)num2;
			switch (syncEvent)
			{
			case Constants.SyncEvent.SYNC_APP_INITIATE:
				break;
			default:
				if (syncEvent != Constants.SyncEvent.SYNC_SET_MASKED_KEY)
				{
					if (syncEvent == Constants.SyncEvent.SYNC_APP_WRONG_CODE)
					{
						this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_WRONGCODE, jsonData);
					}
				}
				else
				{
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_KEYMASKREQUEST, jsonData);
				}
				break;
			case Constants.SyncEvent.SYNC_APP_PROMPT_FAIL:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_SYNCAPPPROMPTFAIL, jsonData);
				break;
			case Constants.SyncEvent.SYNC_APP_CONFIRM:
				break;
			case Constants.SyncEvent.SYNC_APP_SUCCESS:
				this.sendRegisterDeviceRequest(globals.player_data.id, this.connectedDevice);
				break;
			case Constants.SyncEvent.SYNC_APP_FAIL:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.UNREGISTERDEVICE_CODEDECLINED, jsonData);
				break;
			}
		}
		catch (Exception ex)
		{
			globals.debug("probably a bad callback 3: " + ex.ToString());
		}
	}

	// Token: 0x06000B6E RID: 2926 RVA: 0x00053D80 File Offset: 0x00051F80
	public void dataReceived(string jsonData)
	{
		globals.debug("Data received: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			int num = 0;
			if (jsonobject.HasField("from"))
			{
				num = (int)jsonobject["from"].n;
			}
			if (jsonobject.HasField("payload"))
			{
				jsonobject = jsonobject["payload"];
			}
			bool flag = globals.player_data.owns_device(num);
			if (!jsonobject.HasField("ct") || !jsonobject.HasField("ck") || !jsonobject.HasField("cd"))
			{
				globals.debug("Data missing required field");
			}
			else
			{
				int num2 = (int)jsonobject["ct"].n;
				switch (num2)
				{
				case 1:
				{
					this.currentMaster = (int)jsonobject["ck"].n;
					JSONObject jsonobject2 = jsonobject["cd"];
					this.enemyIrAddrs = new List<int>();
					Dictionary<int, int> dictionary = new Dictionary<int, int>();
					foreach (JSONObject jsonobject3 in jsonobject2["irNetwork"].list)
					{
						globals.debug("Network item: " + jsonobject3.Count);
						int num3 = (int)jsonobject3.list[1].n;
						int num4 = (int)jsonobject3.list[2].n;
						int num5 = (jsonobject3.Count <= 3) ? 0 : ((int)jsonobject3.list[3].n);
						dictionary[num3] = ((!dictionary.ContainsKey(num3)) ? 1 : (dictionary[num3] + 1));
						if (num3 / 100 == 12)
						{
							this.enemyIrAddrs.Add(num4);
						}
						if (num5 != 0)
						{
							globals.player_data.unlockCharacter(num5);
						}
					}
					globals.player_data.reconcileToyTypes(dictionary);
					break;
				}
				case 8:
					if (flag)
					{
						globals.player_data.reconcileToyPlayerData(num, jsonobject["cd"]);
					}
					else
					{
						globals.debug("Got data for device owned by someone else. Ignoring.");
					}
					break;
				case 9:
					if (flag)
					{
						string str = jsonobject["ck"].str;
						if (globals.player_data.reconcileToyPlayResult(num, jsonobject["cd"]))
						{
							this.dataQuery(num, 9, str);
						}
						else
						{
							globals.debugWarning("Failed to process play results.");
						}
					}
					else
					{
						globals.debug("Got data for device owned by someone else. Ignoring.");
					}
					break;
				}
				try
				{
					if (this.dataReceivedDelegates.ContainsKey((Constants.ToyDataType)num2))
					{
						foreach (BLEManager.DataReceivedDelegate dataReceivedDelegate in this.dataReceivedDelegates[(Constants.ToyDataType)num2])
						{
							dataReceivedDelegate(jsonobject);
						}
					}
				}
				catch (Exception ex)
				{
					globals.debug("probably a bad callback 4: " + ex.ToString());
				}
			}
		}
		catch (Exception ex2)
		{
			globals.debug("Data receive exception: " + ex2.ToString());
		}
	}

	// Token: 0x06000B6F RID: 2927 RVA: 0x00054178 File Offset: 0x00052378
	public void disconnectFromDevice()
	{
		globals.debug("disconnectFromDevice being called ");
		if (this.mConnectedDevices.ContainsKey(this.connectedDevice))
		{
			this.mConnectedDevices.Remove(this.connectedDevice);
		}
		if (this.foundDevices.ContainsKey(this.connectedDevice))
		{
			this.foundDevices.Remove(this.connectedDevice);
		}
		if (this._connectedDevice != -1)
		{
			NativeManager.getNative().disconnectFromDevice();
		}
	}

	// Token: 0x06000B70 RID: 2928 RVA: 0x000541F8 File Offset: 0x000523F8
	public void dataQuery(int dataType, int dataKey)
	{
		if (this.connectedDevice == -1)
		{
			globals.debugWarning("Can not query data - not connected");
			return;
		}
		this.dataQuery(this.connectedDevice, dataType, dataKey);
	}

	// Token: 0x06000B71 RID: 2929 RVA: 0x0005422C File Offset: 0x0005242C
	public void dataQuery(int sendTo, int dataType, int dataKey)
	{
		NativeManager.getNative().sendData(sendTo, 64021, string.Concat(new object[]
		{
			"{ \"ct\": ",
			dataType,
			", \"ck\": ",
			dataKey,
			", \"qf\": ",
			-3,
			" }"
		}));
	}

	// Token: 0x06000B72 RID: 2930 RVA: 0x00054290 File Offset: 0x00052490
	public void dataQuery(int sendTo, int dataType, string dataKey)
	{
		NativeManager.getNative().sendData(sendTo, 64021, string.Concat(new object[]
		{
			"{ \"ct\": ",
			dataType,
			", \"ck\": \"",
			dataKey,
			"\", \"qf\": ",
			-3,
			" }"
		}));
	}

	// Token: 0x06000B73 RID: 2931 RVA: 0x000542F0 File Offset: 0x000524F0
	public void sendSetVolume(int volume)
	{
		if (this.connectedDevice == -1)
		{
			globals.debugWarning("Can not identify device - not connected");
			return;
		}
		if (volume < 0)
		{
			volume = 0;
		}
		if (volume > 100)
		{
			volume = 100;
		}
		JSONObject jsonobject = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject.Add(volume);
		this.dataSend(this.connectedDevice, Constants.ToyDataType.CT_GAME_EVT, 201, jsonobject);
	}

	// Token: 0x06000B74 RID: 2932 RVA: 0x0005434C File Offset: 0x0005254C
	public void sendSetAbility(Ability ability)
	{
		this.dataSend(this.connectedDevice, Constants.ToyDataType.CT_ABIL_LIST, 0, ability.toJSONForToy(-1));
		DMOManager.LogGameAction("ablity_equip", "start", ability.id.ToString(), null);
	}

	// Token: 0x06000B75 RID: 2933 RVA: 0x0005438C File Offset: 0x0005258C
	public void sendUnlockEnvironment(string env)
	{
		globals.player_data.add_unlock(env);
		if (this.connectedDevice < 0)
		{
			return;
		}
		JSONObject jsonobject = new JSONObject();
		JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject2.Add(env);
		jsonobject.AddField("unlocks", jsonobject2);
		globals.debug("unlockData = " + jsonobject.Print(true));
		this.dataSend(this.connectedDevice, Constants.ToyDataType.CT_PLAYER_DATA, 0, jsonobject);
	}

	// Token: 0x06000B76 RID: 2934 RVA: 0x000543F8 File Offset: 0x000525F8
	public void sendSetEnvironment(string env, string missionId = null)
	{
		JSONObject jsonobject = new JSONObject(JSONObject.Type.OBJECT);
		int connectedDevice = this.currentMaster;
		if (connectedDevice == -1)
		{
			connectedDevice = this.connectedDevice;
		}
		this.sendUnlockEnvironment(env);
		jsonobject.AddField("name", env);
		jsonobject.AddField("devId", connectedDevice);
		jsonobject.AddField("fromApp", true);
		jsonobject.AddField("scenario", missionId);
		this.dataSend(connectedDevice, Constants.ToyDataType.CT_ENV_CUR, 1040, jsonobject);
	}

	// Token: 0x06000B77 RID: 2935 RVA: 0x00054468 File Offset: 0x00052668
	public void sendStartMission(string missionId)
	{
		if (this.connectedDevice == -1)
		{
			globals.debugWarning("Can not identify device - not connected");
			return;
		}
		JSONObject jsonobject = new JSONObject();
		jsonobject.Add(missionId);
		this.dataSend(this.connectedDevice, Constants.ToyDataType.CT_GAME_EVT, 204, jsonobject);
	}

	// Token: 0x06000B78 RID: 2936 RVA: 0x000544AC File Offset: 0x000526AC
	public void sendSetEnemyType(int noraId, string mode, string type, int level)
	{
		if (this.connectedDevice == -1)
		{
			globals.debugWarning("Can not set enemy type - not connected");
			return;
		}
		int connectedDevice = this.currentMaster;
		if (connectedDevice == -1)
		{
			connectedDevice = this.connectedDevice;
		}
		JSONObject jsonobject = new JSONObject(JSONObject.Type.ARRAY);
		jsonobject.Add(mode);
		jsonobject.Add(type);
		jsonobject.Add(level);
		if (noraId == 0)
		{
			foreach (int dataKey in this.enemyIrAddrs)
			{
				this.dataSend(connectedDevice, Constants.ToyDataType.CT_ENEMY_INFO, dataKey, jsonobject);
			}
		}
		else
		{
			this.dataSend(connectedDevice, Constants.ToyDataType.CT_ENEMY_INFO, noraId, jsonobject);
		}
	}

	// Token: 0x06000B79 RID: 2937 RVA: 0x00054578 File Offset: 0x00052778
	public void sendIdentifyDevice(int sendTo, int colorId, string audioId)
	{
		if (this.connectedDevice == -1)
		{
			globals.debugWarning("Can not identify device - not connected");
			return;
		}
		if (sendTo == -1)
		{
			sendTo = this.connectedDevice;
		}
		JSONObject jsonobject = new JSONObject(JSONObject.Type.ARRAY);
		JSONObject jsonobject2 = new JSONObject(JSONObject.Type.ARRAY);
		if (colorId % 2 == 1)
		{
			jsonobject2.Add(255);
			jsonobject2.Add(0);
			jsonobject2.Add(0);
		}
		else
		{
			jsonobject2.Add(0);
			jsonobject2.Add(255);
			jsonobject2.Add(0);
		}
		jsonobject2.Add(100);
		jsonobject.Add(jsonobject2);
		jsonobject.Add(audioId);
		this.dataSend(sendTo, Constants.ToyDataType.CT_GAME_EVT, 200, jsonobject);
	}

	// Token: 0x06000B7A RID: 2938 RVA: 0x00054620 File Offset: 0x00052820
	public void dataSend(int sendTo, Constants.ToyDataType dataType, int dataKey, JSONObject data)
	{
		if (globals.mola_downloading(true) || sendTo == -1)
		{
			return;
		}
		JSONObject jsonobject = new JSONObject();
		jsonobject.AddField("ct", (int)dataType);
		jsonobject.AddField("ck", dataKey);
		jsonobject.AddField("cd", data);
		NativeManager.getNative().sendData(sendTo, 64020, jsonobject.ToString());
		globals.debug("data Send " + sendTo.ToString() + " : " + jsonobject.ToString());
	}

	// Token: 0x170001AF RID: 431
	// (get) Token: 0x06000B7B RID: 2939 RVA: 0x000546A4 File Offset: 0x000528A4
	public Dictionary<string, BLEManager.Mission> availableContent
	{
		get
		{
			return this.mAvailableContent;
		}
	}

	// Token: 0x170001B0 RID: 432
	// (get) Token: 0x06000B7C RID: 2940 RVA: 0x000546AC File Offset: 0x000528AC
	public Dictionary<string, BLEManager.SystemUpdate> availableSystemUpdate
	{
		get
		{
			return this.mAvailableSystemUpdate;
		}
	}

	// Token: 0x06000B7D RID: 2941 RVA: 0x000546B4 File Offset: 0x000528B4
	public void contentPresentOnToy(string jsonData)
	{
		globals.debug("contentPresent received: " + jsonData);
		JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
		if (jsonobject.HasField("from") && this.mConnectedDevices.ContainsKey((int)jsonobject["from"].n))
		{
			this.mConnectedDevices[(int)jsonobject["from"].n].SetContent(jsonData);
		}
		this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.CONTENT_PRESENT, jsonobject);
	}

	// Token: 0x06000B7E RID: 2942 RVA: 0x00054738 File Offset: 0x00052938
	public void manifestUpdate(string jsonData)
	{
		globals.debug("Manifest Data received: ");
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			string text = string.Empty;
			if (jsonobject.HasField("status"))
			{
				text = jsonobject["status"].str;
			}
			string text2 = text;
			if (text2 != null)
			{
				if (BLEManager.<>f__switch$map4 == null)
				{
					Dictionary<string, int> dictionary = new Dictionary<string, int>(2);
					dictionary.Add("success", 0);
					dictionary.Add("failed", 1);
					BLEManager.<>f__switch$map4 = dictionary;
				}
				int num;
				if (BLEManager.<>f__switch$map4.TryGetValue(text2, ref num))
				{
					if (num != 0)
					{
						if (num == 1)
						{
							this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.MANIFEST_DOWNLOADEDFAIL, jsonData);
						}
					}
					else
					{
						this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.MANIFEST_DOWNLOADED, jsonData);
					}
				}
			}
		}
		catch (Exception ex)
		{
			globals.debug("probably a bad callback 5: " + ex.ToString());
		}
	}

	// Token: 0x06000B7F RID: 2943 RVA: 0x0005483C File Offset: 0x00052A3C
	public void deviceContent(string jsonData)
	{
		globals.debug("Device content: " + jsonData);
		try
		{
			JSONObject data = new JSONObject();
			this.mAvailableContent = new Dictionary<string, BLEManager.Mission>();
			this.mAvailableSystemUpdate = new Dictionary<string, BLEManager.SystemUpdate>();
			globals.debug("DEVICECONTENTLIST_SUCCESS ");
			this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.DEVICECONTENTLIST_SUCCESS, data);
		}
		catch (Exception ex)
		{
			globals.debug("deviceContent exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B80 RID: 2944 RVA: 0x000548C4 File Offset: 0x00052AC4
	public void download(string jsonData)
	{
		globals.debug("download Data" + jsonData);
		this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.DOWNLOAD, jsonData);
	}

	// Token: 0x06000B81 RID: 2945 RVA: 0x000548E0 File Offset: 0x00052AE0
	public void getSpaceAvailable(int deviceId)
	{
		globals.debug("Requesting Space");
		NativeManager.getNative().getAvailableSpace(deviceId);
		NativeManager.getNative().requestDisplayName(deviceId);
	}

	// Token: 0x06000B82 RID: 2946 RVA: 0x00054910 File Offset: 0x00052B10
	public void spaceAvailable(string jsonData)
	{
		globals.debug("space available received: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("space_available") && jsonobject.HasField("from"))
			{
				int num = (int)jsonobject["from"].n;
				if (this.mConnectedDevices.ContainsKey(num))
				{
					this.mConnectedDevices[num].spaceAvailable = (int)jsonobject["space_available"].n;
				}
			}
			this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.SPACE_AVAILABLE, jsonData);
		}
		catch (Exception ex)
		{
			globals.debug("spaceAvailable exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B83 RID: 2947 RVA: 0x000549E4 File Offset: 0x00052BE4
	public void connectToDevice(int deviceId)
	{
		globals.debug(string.Concat(new object[]
		{
			"connectToDevice  :",
			this.requestedDeviceId,
			":",
			deviceId
		}));
		base.Invoke("resetConnectionRequest", 5f);
		if (this.requestedDeviceId != deviceId)
		{
			globals.debug("connectToDevice~~ " + deviceId);
			this.requestedDeviceId = deviceId;
			this.requestedDeviceId_forJoin = deviceId;
			NativeManager.getNative().connectToDevice(deviceId);
		}
	}

	// Token: 0x06000B84 RID: 2948 RVA: 0x00054A74 File Offset: 0x00052C74
	public void resetConnectionRequest()
	{
		globals.debug("-- requestedDeviceId " + this.requestedDeviceId);
		this.requestedDeviceId = -1;
	}

	// Token: 0x06000B85 RID: 2949 RVA: 0x00054A98 File Offset: 0x00052C98
	public void getFirmwareVersion(bool sendHeartbeatToCloud = true)
	{
		if (this.connectedDevice > -1)
		{
			NativeManager.getNative().requestFirmwareVersion(this.connectedDevice, sendHeartbeatToCloud);
			base.CancelInvoke("isFirmwareVersionRecieved");
			base.Invoke("isFirmwareVersionRecieved", 2f);
		}
	}

	// Token: 0x06000B86 RID: 2950 RVA: 0x00054AE0 File Offset: 0x00052CE0
	public void isFirmwareVersionRecieved()
	{
		base.CancelInvoke("isFirmwareVersionRecieved");
		if (this.firmwareVersionRecallTries == this.firmwareVersionRecallTotalTries)
		{
			globals.debug("Recieved Firmware info or Run out of tries");
		}
		else
		{
			this.firmwareVersionRecallTries++;
			this.getFirmwareVersion(true);
		}
	}

	// Token: 0x06000B87 RID: 2951 RVA: 0x00054B30 File Offset: 0x00052D30
	public void currentFirmwareVersion(string jsonData)
	{
		globals.debug("currentFirmwareVersion jsonData " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			string firmwareId = string.Empty;
			if (jsonobject.HasField("fw_version"))
			{
				firmwareId = jsonobject["fw_version"].str;
				globals.player_data.updateFirmwareVersion(this.connectedDevice, firmwareId);
			}
		}
		catch (Exception ex)
		{
			globals.debug("currentFirmwareVersion exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B88 RID: 2952 RVA: 0x00054BCC File Offset: 0x00052DCC
	public void firmwareUpdate(string jsonData)
	{
		globals.debug("firmwareUpdate jsonData " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			int num = 0;
			string text = string.Empty;
			this.firmwareVersionRecallTries = this.firmwareVersionRecallTotalTries;
			if (jsonobject.HasField("event"))
			{
				num = (int)jsonobject["event"].n;
			}
			if (jsonobject.HasField("fw_version"))
			{
				text = jsonobject["fw_version"].str;
			}
			if (!string.IsNullOrEmpty(text))
			{
				globals.player_data.updateFirmwareVersion(this.connectedDevice, text);
			}
			switch (num)
			{
			case 101:
				globals.isFirmwareUpdateAvailable = true;
				this.mAvailableFirmwareUpdateId = text;
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_AVAILABLE, jsonData);
				break;
			case 102:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_RECEIVED, jsonData);
				break;
			case 103:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_UPLOAD_STATUS, jsonData);
				break;
			case 104:
				globals.player_data.updateFirmwareVersion(this.connectedDevice, text);
				globals.isFirmwareUptodate = true;
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_UPTODATE, jsonData);
				break;
			case 105:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_METADATA_ERROR, jsonData);
				break;
			case 106:
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.FIRMWARE_RECEIVED_ERROR, jsonData);
				break;
			}
		}
		catch (Exception ex)
		{
			globals.debug("firmwareUpdate exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B89 RID: 2953 RVA: 0x00054D48 File Offset: 0x00052F48
	public void packageTransfer(string jsonData)
	{
		globals.debug("packageTransfer jsonData " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			int num = 0;
			int num2 = -1;
			string text = string.Empty;
			int num3 = 0;
			if (jsonobject.HasField("event"))
			{
				num = (int)jsonobject["event"].n;
			}
			if (num == 9015)
			{
				if (jsonobject.HasField("payload"))
				{
					num2 = (int)jsonobject["event"].n;
					num3 = (int)jsonobject["from"].n;
					text = jsonobject["payload"].list[0].str;
					jsonobject.AddField("payloadEvent", num2);
					jsonobject.AddField("deviceId", num3);
					jsonobject.AddField("missionId", text);
					jsonobject.AddField("version", jsonobject["payload"]);
				}
				globals.debug(string.Concat(new object[]
				{
					"payloadEvent",
					num2,
					":",
					num3,
					":",
					text
				}));
				Constants.PackageTransferState packageTransferState = (Constants.PackageTransferState)num2;
				if (packageTransferState == Constants.PackageTransferState.PACKAGE_TRANSFER_COMPLETE_RESPONSE)
				{
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_SUCCESS, jsonobject);
				}
				switch (num2)
				{
				case 0:
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_SUCCESS, jsonobject);
					break;
				case 1:
				case 2:
				case 3:
				case 4:
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.PACKAGEDOWNLOAD_FAIL, jsonobject);
					break;
				}
			}
		}
		catch (Exception ex)
		{
			globals.debug("packageTransfer exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B8A RID: 2954 RVA: 0x00054F14 File Offset: 0x00053114
	public void gearDataUpdate(string jsonData = null)
	{
		this.parse_data_from_gear(jsonData, null);
	}

	// Token: 0x06000B8B RID: 2955 RVA: 0x00054F20 File Offset: 0x00053120
	public void parse_data_from_gear(string jsonData, string deviceData)
	{
		globals.debug("==gearDataUpdate==");
		globals.textdump_string += "[ffff00]==gearDataUpdate==[-]\n";
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			globals.debug("parse_data_from_gear " + jsonData + ":" + deviceData);
			jsonobject.sort();
			globals.debug(jsonobject.Print(true));
			globals.textdump_string = globals.textdump_string + jsonobject.Print(true).Replace("\t", "    ") + "\n";
			if (jsonobject.HasField("complete"))
			{
				globals.add_mission_summary(new missionSummaryClass(jsonobject));
			}
			else if (deviceData == null)
			{
				globals.player_data.parse_player_data_from_gear(jsonobject, null);
			}
			else
			{
				globals.player_data.parse_player_data_from_gear(jsonobject, new PlayerDeviceClass(new JSONObject(deviceData, -2, false, false)));
			}
			this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.GEARDATA_UPLOADED, jsonobject);
		}
		catch (Exception ex)
		{
			globals.debugWarning("gearDataUpdate exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B8C RID: 2956 RVA: 0x00055040 File Offset: 0x00053240
	public bool file_transfer_allowed(int id)
	{
		return this._file_tranfer_allowed.ContainsKey(id) && this._file_tranfer_allowed[id];
	}

	// Token: 0x06000B8D RID: 2957 RVA: 0x00055064 File Offset: 0x00053264
	public int device_type(int id)
	{
		if (this.mConnectedDevices.ContainsKey(id))
		{
			return (int)this.mConnectedDevices[id].deviceType;
		}
		return 0;
	}

	// Token: 0x06000B8E RID: 2958 RVA: 0x00055098 File Offset: 0x00053298
	public int spaceAvailable(int id)
	{
		if (this.mConnectedDevices.ContainsKey(id))
		{
			return this.mConnectedDevices[id].spaceAvailable;
		}
		return 0;
	}

	// Token: 0x06000B8F RID: 2959 RVA: 0x000550CC File Offset: 0x000532CC
	public void devicePingUpdate(string jsonData)
	{
		globals.debug("devicePingUpdate: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("device_id") && (int)jsonobject["device_id"].n == this._connectedDevice)
			{
				if (jsonobject.HasField("analytics_ready_for_upload"))
				{
					globals.analytics_ready_for_upload = (int)jsonobject["analytics_ready_for_upload"].n;
				}
				if (jsonobject.HasField("file_transfer_allowed"))
				{
					globals.file_transfer_allowed = (int)jsonobject["file_transfer_allowed"].n;
				}
				if (jsonobject.HasField("files_ready_for_upload"))
				{
					globals.files_ready_for_upload = (int)jsonobject["files_ready_for_upload"].n;
				}
				if (jsonobject.HasField("toy_registered") && (int)jsonobject["toy_registered"].n == 0 && globals.hq_main && this._connectedDevice == (int)jsonobject["device_id"].n)
				{
					globals.debug("Disconnecting the device since its not registred");
					this.disconnectFromDevice();
					globals.player_data.clearFirmwareflags();
				}
				if (jsonobject.HasField("file_transfer_allowed") && jsonobject.HasField("device_id"))
				{
					int num = (int)jsonobject["device_id"].n;
					bool flag = jsonobject["file_transfer_allowed"].n == 1.0;
					if (this._file_tranfer_allowed.ContainsKey(num))
					{
						this._file_tranfer_allowed[num] = flag;
					}
					else
					{
						this._file_tranfer_allowed.Add(num, flag);
					}
				}
				if (this._onConnectPingWait && jsonobject.HasField("toy_registered") && (int)jsonobject["toy_registered"].n == 1)
				{
					this.getFirmwareVersion(true);
					this.getSpaceAvailable(this._connectedDevice);
					this.sendPlayerData(this._connectedDevice);
					this.getContentOnToy(this._connectedDevice);
					this.getContentEntitlements(this._connectedDevice);
					this.getCachedPackages(this._connectedDevice);
					this._onConnectPingWait = false;
				}
			}
		}
		catch (Exception ex)
		{
			globals.debug("gearDataUpdate exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B90 RID: 2960 RVA: 0x00055334 File Offset: 0x00053534
	public void resetDownload(int deviceId)
	{
		globals.debug("resetDownload");
		if (this.mConnectedDevices.ContainsKey(deviceId))
		{
			ConnectedDevice connectedDevice = this.mConnectedDevices[deviceId];
			globals.player_data.missionDownloadProgressState = Constants.ContentDownLoadState.NULL;
			connectedDevice.resetDownloadState();
		}
		NativeManager.getNative().resetDownload(deviceId);
	}

	// Token: 0x06000B91 RID: 2961 RVA: 0x00055388 File Offset: 0x00053588
	public string getsystemUpdateId()
	{
		return this.mAvailableFirmwareUpdateId;
	}

	// Token: 0x06000B92 RID: 2962 RVA: 0x00055390 File Offset: 0x00053590
	public string getMissionIdIfdownloadInProgress(int deviceId = -1)
	{
		if (deviceId < 0)
		{
			deviceId = this.connectedDevice;
		}
		if (this.mConnectedDevices.ContainsKey(deviceId))
		{
			ConnectedDevice connectedDevice = this.mConnectedDevices[deviceId];
			if (connectedDevice.mDownLoadState.Count > 0)
			{
				using (Dictionary<string, int>.Enumerator enumerator = connectedDevice.mDownLoadState.GetEnumerator())
				{
					if (enumerator.MoveNext())
					{
						KeyValuePair<string, int> keyValuePair = enumerator.Current;
						return keyValuePair.Key;
					}
				}
			}
		}
		return null;
	}

	// Token: 0x06000B93 RID: 2963 RVA: 0x00055440 File Offset: 0x00053640
	public void rebootDevice(int deviceId)
	{
		globals.debug("rebootDevice");
		NativeManager.getNative().sendRebootRequest(deviceId);
	}

	// Token: 0x06000B94 RID: 2964 RVA: 0x00055458 File Offset: 0x00053658
	public void getOwnerKey()
	{
		NativeManager.getNative().getOwnerKey();
	}

	// Token: 0x06000B95 RID: 2965 RVA: 0x00055464 File Offset: 0x00053664
	public void isBluetoothRadioOn()
	{
		globals.debug("isBluetoothRadioOn trace");
		NativeManager.getNative().isBluetoothRadioOn();
	}

	// Token: 0x06000B96 RID: 2966 RVA: 0x0005547C File Offset: 0x0005367C
	public void blueToothEnabled(string jsonData = "")
	{
		globals.debug("blueToothEnabled" + jsonData);
		JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
		jsonobject.AddField("bluetooth_enabled", true);
		this.bluetooth_enabled = true;
		this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.BLE_ENABLED, jsonobject);
	}

	// Token: 0x06000B97 RID: 2967 RVA: 0x000554C0 File Offset: 0x000536C0
	public void blueToothDisabled(string jsonData = "")
	{
		globals.debug("blueToothDisabled" + jsonData);
		JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
		jsonobject.AddField("bluetooth_enabled", false);
		this.bluetooth_enabled = false;
		this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.BLE_DISABLED, jsonobject);
	}

	// Token: 0x06000B98 RID: 2968 RVA: 0x00055504 File Offset: 0x00053704
	public void updateTokens(string jsonData)
	{
		globals.debug("updateTokens: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("accessToken") && !string.IsNullOrEmpty(jsonobject["accessToken"].str))
			{
				WebHandler.getInstance().setTokens(jsonobject["accessToken"].str);
			}
		}
		catch (Exception ex)
		{
			globals.debug("updateTokens exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B99 RID: 2969 RVA: 0x000555AC File Offset: 0x000537AC
	public void onDeviceLowPowerEvent(string jsonData = null)
	{
		globals.debug("LOW BATTERY WARNING " + jsonData);
		globals.lowBatteryWarning();
	}

	// Token: 0x06000B9A RID: 2970 RVA: 0x000555C4 File Offset: 0x000537C4
	public void rtoError(string jsonData)
	{
		globals.debug("RTO ERROR " + jsonData);
		try
		{
			if (string.IsNullOrEmpty(jsonData))
			{
				JSONObject jsonobject = new JSONObject();
				jsonobject.AddField("Error", "Wifi_connection_issue");
				globals.debug("No WIFI");
				PopupAlert.Show(Localization.Get("WIFI_DOWN_HEADER"), Localization.Get("WIFI_DOWN_BODY"), Localization.Get("OKAY"), GameObject.Find("UI Root"), null, 1f);
			}
			else
			{
				JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
				try
				{
					JSONObject jsonobject2 = jsonobject.drill_to(new object[]
					{
						"error",
						"serviceError",
						"details",
						0,
						"code"
					});
					if (jsonobject2 != null && jsonobject2.str == "INSTALLED_NEWER_THAN_AVAILABLE")
					{
						return;
					}
				}
				catch (Exception ex)
				{
					globals.debug("RTO data Error " + ex.ToString());
				}
				if ((jsonobject.HasField("Network Error Code") && (jsonobject["Network Error Code"].str == "401" || jsonobject["Network Error Code"].n == 401.0)) || (jsonobject.HasField("error") && jsonobject["error"].HasField("responseStatusCode") && (jsonobject["error"]["responseStatusCode"].str == "401" || jsonobject["error"]["responseStatusCode"].n == 401.0)))
				{
					globals.debug("Access token not found, loging again");
					globals.DisneyIDManager.onSilentLogin();
				}
				else
				{
					if (jsonobject.HasField("Network Error Code") && (jsonobject["Network Error Code"].str == "0" || jsonobject["Network Error Code"].n == 0.0))
					{
						globals.DisneyIDManager.onInternetDown();
					}
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.RTO_ERROR, jsonobject);
				}
			}
		}
		catch (Exception ex2)
		{
			globals.debug("rtoError " + ex2.ToString());
		}
	}

	// Token: 0x06000B9B RID: 2971 RVA: 0x0005585C File Offset: 0x00053A5C
	private bool isDeviceRegistred(int deviceID)
	{
		if (globals.BLE_manager.devicesSeen.ContainsKey(deviceID))
		{
			sFoundDevice sFoundDevice = this.devicesSeen[deviceID];
			if (sFoundDevice.flags == 0)
			{
				return false;
			}
		}
		return true;
	}

	// Token: 0x06000B9C RID: 2972 RVA: 0x0005589C File Offset: 0x00053A9C
	public void getSDKVersion()
	{
		NativeManager.getNative().libraryVersion();
	}

	// Token: 0x06000B9D RID: 2973 RVA: 0x000558A8 File Offset: 0x00053AA8
	public void bluetoothPopup()
	{
		NativeManager.getNative().bluetoothPopup();
	}

	// Token: 0x06000B9E RID: 2974 RVA: 0x000558B4 File Offset: 0x00053AB4
	public void sdkVersion(string jsonData)
	{
		globals.debug("sdkVersion: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("sdk_version"))
			{
				globals.sdkVersion = jsonobject["sdk_version"].str.Replace("PORTAL_LIBRARY_VERSION_", string.Empty).Replace("-SNAPSHOT", "-S");
			}
		}
		catch (Exception ex)
		{
			globals.debug("updateTokens exception: " + ex.ToString());
		}
	}

	// Token: 0x06000B9F RID: 2975 RVA: 0x0005595C File Offset: 0x00053B5C
	public void getContentOnToy(int deviceID)
	{
		NativeManager.getNative().getContentOnToy(deviceID);
	}

	// Token: 0x06000BA0 RID: 2976 RVA: 0x0005596C File Offset: 0x00053B6C
	public void getContentEntitlements(int deviceID)
	{
		NativeManager.getNative().getContentEntitlements(deviceID);
	}

	// Token: 0x06000BA1 RID: 2977 RVA: 0x0005597C File Offset: 0x00053B7C
	public void receivePackageToMobile(int deviceId, string packageId, int version)
	{
		globals.debug(string.Concat(new object[]
		{
			"receivePackageToMobile ",
			deviceId,
			":",
			packageId,
			":",
			version
		}));
		NativeManager.getNative().receivePackageToMobile(deviceId, packageId, version);
	}

	// Token: 0x06000BA2 RID: 2978 RVA: 0x000559D4 File Offset: 0x00053BD4
	public void getCachedPackages(int deviceID)
	{
		NativeManager.getNative().getCachedPackages(deviceID);
	}

	// Token: 0x06000BA3 RID: 2979 RVA: 0x000559E4 File Offset: 0x00053BE4
	public void sendPackageToToy(int deviceId, string packageId, int version)
	{
		globals.debug(string.Concat(new object[]
		{
			"sendPackageToToy\t",
			deviceId,
			":",
			packageId,
			":",
			version
		}));
		NativeManager.getNative().sendPackageToToy(deviceId, packageId, version);
	}

	// Token: 0x06000BA4 RID: 2980 RVA: 0x00055A3C File Offset: 0x00053C3C
	public void entiledContentAvailable(string jsonData)
	{
		globals.debug("entiledContentAvailable: " + jsonData);
		this.mEntileContentContentAvailable.Clear();
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("payload") && jsonobject.HasField("from"))
			{
				Dictionary<string, EntileContent> dictionary = EntileContent.fromJSON(jsonobject["payload"]);
				this.mEntileContentContentAvailable.Add((int)jsonobject["from"].n, dictionary);
				globals.debug("entiledContentAvailable DATA --- : " + jsonobject["from"]);
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.ENTITLE_PACKAGE_EVENT, jsonobject);
			}
		}
		catch (Exception ex)
		{
			globals.debug("entiledContentAvailable exception: " + ex.ToString());
		}
	}

	// Token: 0x06000BA5 RID: 2981 RVA: 0x00055B1C File Offset: 0x00053D1C
	public void onRecievePackageToMobileSuccess(string jsonData)
	{
		globals.debug("onRecievePackageToMobileSuccess: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("payload"))
			{
				int num = (int)jsonobject["payload"]["status"].n;
				if (num == 0)
				{
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.RECEIVE_PACKAGE_EVENT, jsonobject);
				}
				else if (num == 1)
				{
					this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.RECEIVE_PACKAGE_FAIL_EVENT, jsonobject);
				}
			}
		}
		catch (Exception ex)
		{
			globals.debug("onRecievePackageToMobileSuccess exception: " + ex.ToString());
		}
	}

	// Token: 0x06000BA6 RID: 2982 RVA: 0x00055BD0 File Offset: 0x00053DD0
	public void onCachedPackageEvent(string jsonData)
	{
		globals.debug("onCachedPackageEvent: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("from") && this.mConnectedDevices.ContainsKey((int)jsonobject["from"].n))
			{
				this.mConnectedDevices[(int)jsonobject["from"].n].setCachedPackage(jsonobject);
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.CACHED_PACKAGE_EVENT, jsonobject);
			}
		}
		catch (Exception ex)
		{
			globals.debug("onCachedPackageEvent exception: " + ex.ToString());
		}
	}

	// Token: 0x06000BA7 RID: 2983 RVA: 0x00055C90 File Offset: 0x00053E90
	public void onSendPackageEvent(string jsonData)
	{
		globals.debug("onSendPackageEvent: " + jsonData);
		try
		{
			JSONObject jsonobject = new JSONObject(jsonData, -2, false, false);
			if (jsonobject.HasField("payload"))
			{
				this.SendDeviceEventDataToDelegates(BLEManager.DeviceEvent.SEND_PACKAGE_EVENT, jsonobject);
			}
		}
		catch (Exception ex)
		{
			globals.debug("onSendPackageEvent exception: " + ex.ToString());
		}
	}

	// Token: 0x06000BA8 RID: 2984 RVA: 0x00055D10 File Offset: 0x00053F10
	public int getLatestPackageVersion(int deviceId, string entitlementId)
	{
		int result = -1;
		if (this.mEntileContentContentAvailable.ContainsKey(deviceId))
		{
			Dictionary<string, EntileContent> dictionary = this.mEntileContentContentAvailable[deviceId];
			if (dictionary.ContainsKey(entitlementId))
			{
				result = int.Parse(dictionary[entitlementId].version);
			}
		}
		return result;
	}

	// Token: 0x06000BA9 RID: 2985 RVA: 0x00055D5C File Offset: 0x00053F5C
	public bool isPatchType(string packageId)
	{
		if (this.connectedDevice_data != null && this.mEntileContentContentAvailable.ContainsKey(this.connectedDevice))
		{
			Dictionary<string, EntileContent> dictionary = this.mEntileContentContentAvailable[this.connectedDevice];
			foreach (KeyValuePair<string, EntileContent> keyValuePair in dictionary)
			{
				if (keyValuePair.Key == packageId && (keyValuePair.Value.priority == 3 || keyValuePair.Value.priority == 4))
				{
					return true;
				}
			}
			return false;
		}
		return false;
	}

	// Token: 0x06000BAA RID: 2986 RVA: 0x00055E2C File Offset: 0x0005402C
	public string getAvailablePatchId()
	{
		if (this.connectedDevice_data != null && this.mEntileContentContentAvailable.ContainsKey(this.connectedDevice))
		{
			Dictionary<string, EntileContent> dictionary = this.mEntileContentContentAvailable[this.connectedDevice];
			foreach (KeyValuePair<string, EntileContent> keyValuePair in dictionary)
			{
				if (keyValuePair.Value.priority == 3 || keyValuePair.Value.priority == 4)
				{
					globals.debug(string.Concat(new object[]
					{
						"PATCH KEY ",
						keyValuePair.Key,
						"::",
						keyValuePair.Value.version,
						":",
						this.connectedDevice_data.isContentInstalledWithThisVersion(keyValuePair.Key, int.Parse(keyValuePair.Value.version))
					}));
					if (!this.connectedDevice_data.isContentInstalledWithThisVersion(keyValuePair.Key, int.Parse(keyValuePair.Value.version)))
					{
						return keyValuePair.Key;
					}
				}
			}
		}
		return null;
	}

	// Token: 0x06000BAB RID: 2987 RVA: 0x00055F84 File Offset: 0x00054184
	public List<string> getAllAvailableDLCPatchIds()
	{
		List<string> list = new List<string>();
		if (this.connectedDevice_data != null && this.mEntileContentContentAvailable.ContainsKey(this.connectedDevice))
		{
			Dictionary<string, EntileContent> dictionary = this.mEntileContentContentAvailable[this.connectedDevice];
			foreach (KeyValuePair<string, EntileContent> keyValuePair in dictionary)
			{
				if (keyValuePair.Value.priority == 5 && this.connectedDevice_data.content_installed(keyValuePair.Key))
				{
					globals.debug(string.Concat(new object[]
					{
						"PATCH KEY 2 ",
						keyValuePair.Key,
						"::",
						keyValuePair.Value.version,
						":",
						this.connectedDevice_data.isContentInstalledWithThisVersion(keyValuePair.Key, int.Parse(keyValuePair.Value.version))
					}));
					if (!this.connectedDevice_data.isContentInstalledWithThisVersion(keyValuePair.Key, int.Parse(keyValuePair.Value.version)))
					{
						list.Add(keyValuePair.Key);
					}
				}
			}
		}
		return list;
	}

	// Token: 0x06000BAC RID: 2988 RVA: 0x000560E4 File Offset: 0x000542E4
	public void removeAllCachedPackages(int deviceId)
	{
		NativeManager.getNative().removeAllCachedPackages(deviceId);
	}

	// Token: 0x04000AC5 RID: 2757
	public bool bluetooth_enabled;

	// Token: 0x04000AC6 RID: 2758
	public Dictionary<int, ConnectedDevice> mConnectedDevices = new Dictionary<int, ConnectedDevice>();

	// Token: 0x04000AC7 RID: 2759
	public Dictionary<int, bool> _file_tranfer_allowed = new Dictionary<int, bool>();

	// Token: 0x04000AC8 RID: 2760
	public Dictionary<int, Dictionary<string, EntileContent>> mEntileContentContentAvailable = new Dictionary<int, Dictionary<string, EntileContent>>();

	// Token: 0x04000AC9 RID: 2761
	private Dictionary<int, sFoundDevice> foundDevices = new Dictionary<int, sFoundDevice>();

	// Token: 0x04000ACA RID: 2762
	private Dictionary<string, BLEManager.Mission> mAvailableContent = new Dictionary<string, BLEManager.Mission>();

	// Token: 0x04000ACB RID: 2763
	private Dictionary<string, BLEManager.SystemUpdate> mAvailableSystemUpdate = new Dictionary<string, BLEManager.SystemUpdate>();

	// Token: 0x04000ACC RID: 2764
	private Dictionary<Constants.ToyDataType, List<BLEManager.DataReceivedDelegate>> dataReceivedDelegates = new Dictionary<Constants.ToyDataType, List<BLEManager.DataReceivedDelegate>>();

	// Token: 0x04000ACD RID: 2765
	private Dictionary<BLEManager.DeviceEvent, List<BLEManager.DataReceivedDelegate>> deviceEventDelegates = new Dictionary<BLEManager.DeviceEvent, List<BLEManager.DataReceivedDelegate>>();

	// Token: 0x04000ACE RID: 2766
	public List<int> enemyIrAddrs = new List<int>();

	// Token: 0x04000ACF RID: 2767
	public int currentMaster = -1;

	// Token: 0x04000AD0 RID: 2768
	public string dont_find_gear_scene = string.Empty;

	// Token: 0x04000AD1 RID: 2769
	public string logs = string.Empty;

	// Token: 0x04000AD2 RID: 2770
	private int _num_to_delete_before_reboot = -1;

	// Token: 0x04000AD3 RID: 2771
	private int requestedDeviceId = -1;

	// Token: 0x04000AD4 RID: 2772
	private int requestedDeviceId_forJoin = -1;

	// Token: 0x04000AD5 RID: 2773
	private string mAvailableFirmwareUpdateId = string.Empty;

	// Token: 0x04000AD6 RID: 2774
	private int _connectedDevice = -1;

	// Token: 0x04000AD7 RID: 2775
	private int firmwareVersionRecallTotalTries = 2;

	// Token: 0x04000AD8 RID: 2776
	private int firmwareVersionRecallTries;

	// Token: 0x04000AD9 RID: 2777
	private bool _onConnectPingWait;

	// Token: 0x02000163 RID: 355
	public struct Mission
	{
		// Token: 0x04000ADB RID: 2779
		public string key;

		// Token: 0x04000ADC RID: 2780
		public string value;

		// Token: 0x04000ADD RID: 2781
		public int bundelSize;

		// Token: 0x04000ADE RID: 2782
		public JSONObject files;
	}

	// Token: 0x02000164 RID: 356
	public struct SystemUpdate
	{
		// Token: 0x04000ADF RID: 2783
		public string key;

		// Token: 0x04000AE0 RID: 2784
		public string value;

		// Token: 0x04000AE1 RID: 2785
		public int bundelSize;

		// Token: 0x04000AE2 RID: 2786
		public JSONObject files;

		// Token: 0x04000AE3 RID: 2787
		public string description;
	}

	// Token: 0x02000165 RID: 357
	public enum DeviceEvent
	{
		// Token: 0x04000AE5 RID: 2789
		DEVICE_LOOKUPDONE,
		// Token: 0x04000AE6 RID: 2790
		DEVICE_JOIN,
		// Token: 0x04000AE7 RID: 2791
		DEVICE_LEFT,
		// Token: 0x04000AE8 RID: 2792
		BOT_JOIN,
		// Token: 0x04000AE9 RID: 2793
		BOT_LEFT,
		// Token: 0x04000AEA RID: 2794
		DATA,
		// Token: 0x04000AEB RID: 2795
		DEVICE_CONTENT,
		// Token: 0x04000AEC RID: 2796
		SCENARIO,
		// Token: 0x04000AED RID: 2797
		DOWNLOAD,
		// Token: 0x04000AEE RID: 2798
		BLE_DEVICE_FOUND,
		// Token: 0x04000AEF RID: 2799
		BLE_DEVICE_CONNECT,
		// Token: 0x04000AF0 RID: 2800
		BLE_DEVICE_DISCONNECT,
		// Token: 0x04000AF1 RID: 2801
		BLE_DEVICE_LEFT,
		// Token: 0x04000AF2 RID: 2802
		SPACE_AVAILABLE,
		// Token: 0x04000AF3 RID: 2803
		RTO_ERROR,
		// Token: 0x04000AF4 RID: 2804
		REGISTRATION_STATUS,
		// Token: 0x04000AF5 RID: 2805
		CONTENT_PRESENT,
		// Token: 0x04000AF6 RID: 2806
		CONTENT_DELETED,
		// Token: 0x04000AF7 RID: 2807
		CONTENT_ADDED,
		// Token: 0x04000AF8 RID: 2808
		UNREGISTERDEVICE_FOUND,
		// Token: 0x04000AF9 RID: 2809
		UNREGISTERDEVICE_REQUESTSTARTSYNCH,
		// Token: 0x04000AFA RID: 2810
		UNREGISTERDEVICE_KEYMASKREQUEST,
		// Token: 0x04000AFB RID: 2811
		UNREGISTERDEVICE_SYNCHDISCONNECTED,
		// Token: 0x04000AFC RID: 2812
		UNREGISTERDEVICE_SYNCHFINISHED,
		// Token: 0x04000AFD RID: 2813
		UNREGISTERDEVICE_CODEACCEPTED,
		// Token: 0x04000AFE RID: 2814
		UNREGISTERDEVICE_CODEDECLINED,
		// Token: 0x04000AFF RID: 2815
		UNREGISTERDEVICE_REGISTERSUCCESS,
		// Token: 0x04000B00 RID: 2816
		UNREGISTERDEVICE_SYNCAPPPROMPTFAIL,
		// Token: 0x04000B01 RID: 2817
		UNREGISTERDEVICE_REGISTERFAILDECRYPTION,
		// Token: 0x04000B02 RID: 2818
		UNREGISTERDEVICE_REGISTERFAIL,
		// Token: 0x04000B03 RID: 2819
		UNREGISTERDEVICE_WRONGCODE,
		// Token: 0x04000B04 RID: 2820
		UNREGISTERDEVICE_REGISTER_FAIL_ALREADY_REGISTERED,
		// Token: 0x04000B05 RID: 2821
		UNREG_FROM_RTO_SUCCESS,
		// Token: 0x04000B06 RID: 2822
		UNREG_FROM_RTO_FAILURE,
		// Token: 0x04000B07 RID: 2823
		MANIFEST_DOWNLOADED,
		// Token: 0x04000B08 RID: 2824
		MANIFEST_DOWNLOADEDFAIL,
		// Token: 0x04000B09 RID: 2825
		DEVICECONTENTLIST_SUCCESS,
		// Token: 0x04000B0A RID: 2826
		DEVICECONTENTLIST_FAIL,
		// Token: 0x04000B0B RID: 2827
		FIRMWARE_AVAILABLE,
		// Token: 0x04000B0C RID: 2828
		FIRMWARE_RECEIVED,
		// Token: 0x04000B0D RID: 2829
		FIRMWARE_METADATA_ERROR,
		// Token: 0x04000B0E RID: 2830
		FIRMWARE_UPLOAD_STATUS,
		// Token: 0x04000B0F RID: 2831
		FIRMWARE_UPLOAD_FINISH_NOTIFICATION,
		// Token: 0x04000B10 RID: 2832
		FIRMWARE_UPLOAD_INTERRUPTED,
		// Token: 0x04000B11 RID: 2833
		FIRMWARE_UPTODATE,
		// Token: 0x04000B12 RID: 2834
		FIRMWARE_RECEIVED_ERROR,
		// Token: 0x04000B13 RID: 2835
		PACKAGEDOWNLOAD_FAIL,
		// Token: 0x04000B14 RID: 2836
		PACKAGEDOWNLOAD_SUCCESS,
		// Token: 0x04000B15 RID: 2837
		GEARDATA_UPLOADED,
		// Token: 0x04000B16 RID: 2838
		PING_UPDATE,
		// Token: 0x04000B17 RID: 2839
		BLE_ENABLED,
		// Token: 0x04000B18 RID: 2840
		BLE_DISABLED,
		// Token: 0x04000B19 RID: 2841
		BLE_SETUP,
		// Token: 0x04000B1A RID: 2842
		RECEIVE_PACKAGE_EVENT,
		// Token: 0x04000B1B RID: 2843
		RECEIVE_PACKAGE_FAIL_EVENT,
		// Token: 0x04000B1C RID: 2844
		SEND_PACKAGE_EVENT,
		// Token: 0x04000B1D RID: 2845
		CACHED_PACKAGE_EVENT,
		// Token: 0x04000B1E RID: 2846
		ENTITLE_PACKAGE_EVENT,
		// Token: 0x04000B1F RID: 2847
		SAFE_TO_FIRMWARE,
		// Token: 0x04000B20 RID: 2848
		SAFE_TO_PATCHUI
	}

	// Token: 0x02000360 RID: 864
	// (Invoke) Token: 0x060015A2 RID: 5538
	public delegate void DataReceivedDelegate(JSONObject data);
}
