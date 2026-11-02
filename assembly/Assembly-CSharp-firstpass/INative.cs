using System;

// Token: 0x0200000D RID: 13
public interface INative
{
	// Token: 0x060000B0 RID: 176
	void displayPopup(string title, string message, string button, string callbackObject);

	// Token: 0x060000B1 RID: 177
	void setupDisneyId(string name, string clientID, string country, string languageSelection, string environment, string coreEnvironment, bool javascriptDebugState);

	// Token: 0x060000B2 RID: 178
	void setupBLE(string callbackObject);

	// Token: 0x060000B3 RID: 179
	void unregisterBLE();

	// Token: 0x060000B4 RID: 180
	void getDevices();

	// Token: 0x060000B5 RID: 181
	void sendData(int deviceId, ushort eventType, string jsonData);

	// Token: 0x060000B6 RID: 182
	void imHereMessageReceived(string callbackObj);

	// Token: 0x060000B7 RID: 183
	void sendMission(int deviceId, string jsonData);

	// Token: 0x060000B8 RID: 184
	void getContentList(int deviceId);

	// Token: 0x060000B9 RID: 185
	void connectToDevice(int deviceId);

	// Token: 0x060000BA RID: 186
	void disconnectFromDevice();

	// Token: 0x060000BB RID: 187
	void getLogs();

	// Token: 0x060000BC RID: 188
	void crash();

	// Token: 0x060000BD RID: 189
	void registerDevice(string ownerId, int deviceId);

	// Token: 0x060000BE RID: 190
	void unregisterDevice(int deviceId);

	// Token: 0x060000BF RID: 191
	void setEncryptionKey(string key);

	// Token: 0x060000C0 RID: 192
	void getEncryptionKey(string callbackObj);

	// Token: 0x060000C1 RID: 193
	void getAvailableSpace(int deviceId);

	// Token: 0x060000C2 RID: 194
	void loginWithAccessToken(string accessToken, string cellophaneKey);

	// Token: 0x060000C3 RID: 195
	void logout();

	// Token: 0x060000C4 RID: 196
	void uploadAnalytics(int deviceId);

	// Token: 0x060000C5 RID: 197
	void sendRebootRequest(int deviceId);

	// Token: 0x060000C6 RID: 198
	void clearContent(int deviceId, string contentId, int version);

	// Token: 0x060000C7 RID: 199
	void getDeviceContentList(int deviceId);

	// Token: 0x060000C8 RID: 200
	void requestDisplayName(int deviceId);

	// Token: 0x060000C9 RID: 201
	void getBuildNumber(string callbackObj);

	// Token: 0x060000CA RID: 202
	void sendPersonlizationRequest(string fname);

	// Token: 0x060000CB RID: 203
	void personlizeDevice(int deviceId);

	// Token: 0x060000CC RID: 204
	void optOutPersonlization(int deviceId);

	// Token: 0x060000CD RID: 205
	void negotiateSessionKey(int deviceId);

	// Token: 0x060000CE RID: 206
	void enterKeyMask(int deviceId, string keyedInput);

	// Token: 0x060000CF RID: 207
	void setRTOHost(string url);

	// Token: 0x060000D0 RID: 208
	void transferManifest(int deviceId, string packageId);

	// Token: 0x060000D1 RID: 209
	void requestFirmwareVersion(int deviceId, bool sendHeartbeatToCloud);

	// Token: 0x060000D2 RID: 210
	void requestFirmware(int deviceId);

	// Token: 0x060000D3 RID: 211
	void uploadFirmware(int deviceId, string fwpFilename);

	// Token: 0x060000D4 RID: 212
	void resetDownload(int deviceId);

	// Token: 0x060000D5 RID: 213
	void getOwnerKey();

	// Token: 0x060000D6 RID: 214
	void isBluetoothRadioOn();

	// Token: 0x060000D7 RID: 215
	void libraryVersion();

	// Token: 0x060000D8 RID: 216
	void bluetoothPopup();

	// Token: 0x060000D9 RID: 217
	void launchDisIdLoginPage();

	// Token: 0x060000DA RID: 218
	void onSilentLogin();

	// Token: 0x060000DB RID: 219
	void onForceRefreshToken();

	// Token: 0x060000DC RID: 220
	void onDisidLogout();

	// Token: 0x060000DD RID: 221
	void getContentOnToy(int deviceId);

	// Token: 0x060000DE RID: 222
	void getContentEntitlements(int deviceId);

	// Token: 0x060000DF RID: 223
	void receivePackageToMobile(int deviceId, string packageId, int version);

	// Token: 0x060000E0 RID: 224
	void getCachedPackages(int deviceId);

	// Token: 0x060000E1 RID: 225
	void sendPackageToToy(int deviceId, string packageId, int version);

	// Token: 0x060000E2 RID: 226
	void enable_unity_logging();

	// Token: 0x060000E3 RID: 227
	void unityLog(string log);

	// Token: 0x060000E4 RID: 228
	void removeAllCachedPackages(int deviceId);

	// Token: 0x060000E5 RID: 229
	void beginScan();

	// Token: 0x060000E6 RID: 230
	void InitializeDMO();
}
