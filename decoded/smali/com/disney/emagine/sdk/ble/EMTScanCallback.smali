.class public Lcom/disney/emagine/sdk/ble/EMTScanCallback;
.super Ljava/lang/Object;
.source "EMTScanCallback.java"

# interfaces
.implements Landroid/bluetooth/BluetoothAdapter$LeScanCallback;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mController:Lcom/disney/emagine/sdk/ble/EMTController;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-void
.end method


# virtual methods
.method public onLeScan(Landroid/bluetooth/BluetoothDevice;I[B)V
    .locals 18
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;
    .param p2, "rssi"    # I
    .param p3, "scanRecord"    # [B

    .prologue
    .line 30
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .local v11, "sb":Ljava/lang/StringBuilder;
    const-string v12, "scan "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    invoke-static/range {p3 .. p3}, Lcom/disney/emagine/sdk/EMTAdvertisementData;->parse([B)Landroid/os/Bundle;

    move-result-object v2

    .line 36
    .local v2, "adv":Landroid/os/Bundle;
    const-string v12, "COMPANYCODE"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v9

    .line 38
    .local v9, "mfgCode":[B
    if-eqz v9, :cond_0

    sget-object v12, Lcom/disney/emagine/sdk/EMTConstants;->EMAGINE_MFG_ID:[B

    invoke-static {v9, v12}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v12

    if-nez v12, :cond_1

    .line 106
    :cond_0
    :goto_0
    return-void

    .line 43
    :cond_1
    const-string v12, "MANUDATA"

    invoke-virtual {v2, v12}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v10

    .line 45
    .local v10, "mfgData":[B
    array-length v12, v10

    const/4 v13, 0x2

    if-le v12, v13, :cond_0

    .line 47
    const/4 v8, 0x0

    .line 48
    .local v8, "isNew":Z
    const/4 v12, 0x1

    const/4 v13, 0x5

    invoke-static {v10, v12, v13}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v12

    int-to-long v4, v12

    .line 49
    .local v4, "deviceId":J
    const-wide/16 v12, 0x0

    cmp-long v12, v4, v12

    if-nez v12, :cond_2

    .line 50
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->TAG:Ljava/lang/String;

    const-string v14, "Skipping ZERO deviceId"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 55
    :cond_2
    const/4 v6, 0x0

    .line 57
    .local v6, "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    monitor-enter v13

    .line 59
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceForPeripheral(Landroid/bluetooth/BluetoothDevice;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v6

    .line 61
    if-nez v6, :cond_3

    .line 63
    const/4 v8, 0x1

    .line 64
    new-instance v7, Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;-><init>(Landroid/bluetooth/BluetoothDevice;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .end local v6    # "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .local v7, "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    const/4 v12, 0x5

    const/4 v14, 0x7

    :try_start_1
    invoke-static {v10, v12, v14}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v12

    invoke-static {v12}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v3

    .line 70
    .local v3, "deviceType":S
    const/4 v12, 0x0

    iput-short v12, v7, Lcom/disney/emagine/sdk/ble/EMTDevice;->imHereFlags:S

    .line 71
    iput-wide v4, v7, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    .line 72
    iput v3, v7, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    .line 73
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v12, v7}, Lcom/disney/emagine/sdk/ble/EMTController;->addToDeviceCache(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v6, v7

    .line 78
    .end local v3    # "deviceType":S
    .end local v7    # "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .restart local v6    # "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_3
    const/4 v12, 0x0

    const/4 v14, 0x1

    :try_start_2
    invoke-static {v10, v12, v14}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v12

    const/4 v14, 0x0

    aget-byte v12, v12, v14

    iput-byte v12, v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceFlags:B

    .line 80
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    iput-wide v14, v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->lastTimeMsgReceived:J

    .line 81
    move/from16 v0, p2

    int-to-long v14, v0

    iput-wide v14, v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->RSSI:J

    .line 83
    if-eqz v8, :cond_4

    .line 84
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    iget-wide v14, v12, Lcom/disney/emagine/sdk/ble/EMTController;->blacklistedDeviceId:J

    cmp-long v12, v4, v14

    if-nez v12, :cond_5

    .line 85
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Skipping black-listed deviceId: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    move-object/from16 v0, p1

    iput-object v0, v12, Lcom/disney/emagine/sdk/ble/EMTController;->blacklistedPeripheral:Landroid/bluetooth/BluetoothDevice;

    .line 103
    :cond_4
    :goto_1
    monitor-exit v13

    goto/16 :goto_0

    :catchall_0
    move-exception v12

    :goto_2
    monitor-exit v13
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v12

    .line 89
    :cond_5
    :try_start_3
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidBecomeAvailable(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 90
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    const/16 v14, 0x8

    new-instance v15, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v15, v6, v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;-><init>(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;[B)V

    invoke-virtual {v12, v14, v15}, Lcom/disney/emagine/sdk/ble/EMTController;->postToHandler(ILcom/disney/emagine/sdk/ble/EMTDevice$EMTDeviceMessage;)V

    .line 91
    const-string v12, " deviceFlags="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    iget-byte v12, v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceFlags:B

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    const-string v12, " device_id="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    iget-wide v14, v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-virtual {v11, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 95
    const-string v12, " deviceType="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    iget v12, v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    const-string v12, " RSSI="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    iget-wide v14, v6, Lcom/disney/emagine/sdk/ble/EMTDevice;->RSSI:J

    invoke-virtual {v11, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 99
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v12

    sget-object v14, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->TAG:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 103
    .end local v6    # "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .restart local v7    # "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :catchall_1
    move-exception v12

    move-object v6, v7

    .end local v7    # "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .restart local v6    # "emtDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    goto :goto_2
.end method

.method setController(Lcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 0
    .param p1, "controller"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTScanCallback;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    .line 24
    return-void
.end method
