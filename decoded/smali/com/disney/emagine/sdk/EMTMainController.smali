.class public Lcom/disney/emagine/sdk/EMTMainController;
.super Ljava/lang/Object;
.source "EMTMainController.java"

# interfaces
.implements Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;
.implements Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private delegate:Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;

.field private error:Lcom/disney/emagine/sdk/apple/NSError;

.field private fileName:Ljava/lang/String;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private final mController:Lcom/disney/emagine/sdk/ble/EMTController;

.field private missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field private startTime:J

.field private transferredBytes:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lcom/disney/emagine/sdk/EMTMainController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTMainController;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 1
    .param p1, "controller"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .line 54
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 55
    iput-object p1, p0, Lcom/disney/emagine/sdk/EMTMainController;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    .line 56
    return-void
.end method


# virtual methods
.method public TAG()Ljava/lang/String;
    .locals 1

    .prologue
    .line 391
    sget-object v0, Lcom/disney/emagine/sdk/EMTMainController;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public addLineToConsole(Ljava/lang/String;)V
    .locals 0
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 412
    return-void
.end method

.method public bleController()Lcom/disney/emagine/sdk/ble/EMTController;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    return-object v0
.end method

.method public console()Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method public currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;
    .locals 1

    .prologue
    .line 415
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    return-object v0
.end method

.method public delegate()Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->delegate:Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;

    return-object v0
.end method

.method public deviceDidBecomeAvailable(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 8
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 353
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Discovered device %04d (type %d, flags %d)"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-wide v6, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceType:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    iget-byte v5, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceFlags:B

    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 355
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidBecomeAvailable(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 356
    return-void
.end method

.method public deviceDidBecomeReady(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 2
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 386
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "Device ready for use."

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 387
    return-void
.end method

.method public deviceDidDisconnectWithError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 3
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EMTMainController"

    const-string v2, "deviceDidDisconnectWithError"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    return-void
.end method

.method public deviceDidExperienceProtocolError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 3
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 380
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EMTMainController"

    const-string v2, "deviceDidExperienceProtocolError"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    return-void
.end method

.method public deviceDidFailToConnectWithError(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 1
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 365
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    if-ne p1, v0, :cond_0

    if-eqz p2, :cond_0

    .line 369
    :cond_0
    return-void
.end method

.method public deviceDidReceiveBroadcastEvent(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
    .locals 1
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "payload"    # [B

    .prologue
    .line 422
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->deviceDidReceiveBroadcastEvent(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V

    .line 423
    return-void
.end method

.method public deviceDidReceiveComplexPayload(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)V
    .locals 16
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;
    .param p2, "payload"    # [B

    .prologue
    .line 174
    const/4 v9, 0x0

    const/4 v10, 0x4

    move-object/from16 v0, p2

    invoke-static {v0, v9, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v9

    invoke-static {v9}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v9

    invoke-static {v9}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v8

    .line 175
    .local v8, "src_device_id":I
    const/4 v9, 0x4

    const/4 v10, 0x6

    move-object/from16 v0, p2

    invoke-static {v0, v9, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v9

    invoke-static {v9}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v9

    invoke-static {v9}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v4

    .line 176
    .local v4, "event":S
    const/16 v9, 0x8

    move-object/from16 v0, p2

    array-length v10, v0

    move-object/from16 v0, p2

    invoke-static {v0, v9, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v2

    .line 177
    .local v2, "data":[B
    new-instance v7, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-direct {v7}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;-><init>()V

    .line 178
    .local v7, "serializer":Lcom/disney/emagine/sdk/marshal/EMTSerializer;
    invoke-virtual {v7, v2}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeWithData([B)Ljava/lang/Object;

    move-result-object v6

    .line 180
    .local v6, "pmpObj":Ljava/lang/Object;
    if-eqz v4, :cond_0

    if-lez v8, :cond_0

    if-eqz v6, :cond_0

    .line 182
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 184
    .local v3, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v9, "from"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    const-string v9, "event"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    const-string v9, "payload"

    invoke-virtual {v3, v9, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    invoke-virtual {v7, v3}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->jsonStringFromObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 191
    .local v5, "json":Ljava/lang/String;
    int-to-long v10, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v10, v11, v5}, Lcom/disney/emagine/sdk/EMTMainController;->handleDRTCommand(IJLjava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 198
    .end local v3    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "json":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 196
    .restart local v3    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v5    # "json":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v10, Lcom/disney/emagine/sdk/EMTMainController;->TAG:Ljava/lang/String;

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "Unhandled custom event: %d fromDevice: %d withJson: %s"

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    aput-object v5, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public didConnectDevice(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 8
    .param p1, "device"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 360
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Connected to device %04d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-wide v6, p1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 361
    return-void
.end method

.method public disconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->disconnectDevice()V

    .line 323
    return-void
.end method

.method public filePickerControllerDidPickFile(Ljava/lang/String;[B)V
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 83
    if-eqz p1, :cond_0

    .line 87
    :try_start_0
    new-instance v1, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;

    invoke-direct {v1, p0, p1}, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2, v1}, Lcom/disney/emagine/sdk/EMTMainController;->sendFileWithCompletion(Ljava/lang/String;[BLcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public handleAnalyticsFile(Ljava/lang/String;J[B)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "deviceId"    # J
    .param p4, "data"    # [B

    .prologue
    .line 435
    return-void
.end method

.method public handleDRTCommand(IJLjava/lang/String;)Z
    .locals 1
    .param p1, "command"    # I
    .param p2, "deviceId"    # J
    .param p4, "json"    # Ljava/lang/String;

    .prologue
    .line 202
    const/4 v0, 0x0

    .line 204
    .local v0, "wasHandled":Z
    sparse-switch p1, :sswitch_data_0

    .line 217
    const/4 v0, 0x0

    .line 223
    :goto_0
    return v0

    .line 210
    :sswitch_0
    const/4 v0, 0x1

    .line 212
    goto :goto_0

    .line 204
    :sswitch_data_0
    .sparse-switch
        0x1646 -> :sswitch_0
        0x1649 -> :sswitch_0
        0x1f49 -> :sswitch_0
    .end sparse-switch
.end method

.method public handlePackagesPresentFile(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "string"    # Ljava/lang/String;
    .param p3, "data"    # [B

    .prologue
    .line 459
    return-void
.end method

.method public handlePlayerDataFile(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "string"    # Ljava/lang/String;
    .param p3, "data"    # [B

    .prologue
    .line 447
    return-void
.end method

.method public isAnalyticsFile(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 428
    const/4 v0, 0x0

    return v0
.end method

.method public isPackagesPresentFile(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 452
    const/4 v0, 0x0

    return v0
.end method

.method public isPlayerDataFile(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 440
    const/4 v0, 0x0

    return v0
.end method

.method public loopbackButton(Ljava/lang/Object;)V
    .locals 9
    .param p1, "sender"    # Ljava/lang/Object;

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v6

    .line 119
    .local v6, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v6, :cond_0

    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 124
    :cond_1
    const/4 v0, 0x6

    new-array v8, v0, [B

    fill-array-data v8, :array_0

    .line 126
    .local v8, "pingData":[B
    const/4 v7, 0x0

    .local v7, "loop":I
    :goto_1
    const/16 v0, 0x1e

    if-ge v7, v0, :cond_2

    .line 128
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 130
    .local v2, "startTime":J
    new-instance v0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;

    add-int/lit8 v4, v7, 0x1

    array-length v5, v8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;JII)V

    invoke-virtual {v6, v8, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->loopbackWithCompletion([BLcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;)V

    .line 126
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 133
    .end local v2    # "startTime":J
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "Loopback complete..."

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    goto :goto_0

    .line 124
    nop

    :array_0
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
    .end array-data
.end method

.method public missionPickerControllerDidPickMission(Ljava/util/HashMap;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "mission":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-wide/16 v2, 0x0

    .line 108
    .local v2, "deviceId":J
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 109
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 110
    iget-wide v2, v0, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    .line 112
    :cond_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMainController;->missionManager:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    long-to-int v4, v2

    new-instance v5, Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;

    invoke-direct {v5, p0}, Lcom/disney/emagine/sdk/completion/EMTPercentCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;)V

    invoke-virtual {v1, p1, v4, v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sendMission(Ljava/util/HashMap;ILcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;)V

    .line 113
    return-void
.end method

.method public pingDevice()Z
    .locals 7

    .prologue
    const/4 v4, 0x1

    .line 138
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v6

    .line 140
    .local v6, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v6, :cond_0

    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mController:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    :cond_0
    const/4 v4, 0x0

    .line 152
    :goto_0
    return v4

    .line 145
    :cond_1
    const/16 v5, 0x8

    .line 146
    .local v5, "aByte":B
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 148
    .local v2, "startTime":J
    new-instance v0, Lcom/disney/emagine/sdk/completion/EMTPingCompletion;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/disney/emagine/sdk/completion/EMTPingCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;JII)V

    invoke-virtual {v6, v5, v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->pingWithCompletion(BLcom/disney/emagine/sdk/completion/EMTPingCompletion;)V

    .line 150
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "Ping complete..."

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public sendFileWithCompletion(Ljava/lang/String;Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;)V
    .locals 23
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "completion"    # Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 229
    .local v19, "file":Ljava/io/File;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v21

    .line 230
    .local v21, "parts":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v2, v21, v3

    .line 231
    .local v2, "base":Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v18, v21, v3

    .line 232
    .local v18, "extension":Ljava/lang/String;
    const/16 v20, 0x0

    .line 234
    .local v20, "fileName":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x8

    if-le v3, v4, :cond_0

    .line 236
    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 239
    :cond_0
    if-eqz v18, :cond_2

    .line 241
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x3

    if-le v3, v4, :cond_1

    .line 243
    const/4 v3, 0x0

    const/4 v4, 0x3

    move-object/from16 v0, v18

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    .line 246
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 249
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/content/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 250
    .local v14, "destination":Ljava/lang/String;
    invoke-static {v14}, Lcom/disney/emagine/sdk/EMTFileManager;->bytesFromFile(Ljava/lang/String;)[B

    move-result-object v5

    .line 252
    .local v5, "data":[B
    array-length v3, v5

    if-nez v3, :cond_3

    .line 254
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/EMTMainController;->TAG:Ljava/lang/String;

    const-string v6, "Empty or missing file, aborting transfer."

    invoke-virtual {v3, v4, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    :goto_0
    return-void

    .line 258
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/EMTMainController;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Beginning file transfer to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/disney/emagine/sdk/EMTMainController;->startTime:J

    .line 261
    const-wide/16 v6, 0x0

    move-object/from16 v0, p0

    iput-wide v6, v0, Lcom/disney/emagine/sdk/EMTMainController;->transferredBytes:J

    .line 263
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v15

    .line 264
    .local v15, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    iget-wide v0, v15, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    move-wide/from16 v16, v0

    .line 265
    .local v16, "deviceId":J
    const/16 v22, 0x0

    .line 267
    .local v22, "version":I
    const/4 v12, 0x1

    new-instance v3, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/disney/emagine/sdk/EMTMainController;->startTime:J

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/disney/emagine/sdk/EMTMainController;->transferredBytes:J

    move-object/from16 v4, p0

    move-object/from16 v10, p2

    invoke-direct/range {v3 .. v10}, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;[BJJLcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;)V

    move-object v6, v15

    move-object v7, v14

    move-object v8, v5

    move/from16 v9, v22

    move-wide/from16 v10, v16

    move-object v13, v3

    invoke-virtual/range {v6 .. v13}, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferFile(Ljava/lang/String;[BIJZLcom/disney/emagine/sdk/delegate/EMTTransferDelegate;)V

    goto :goto_0
.end method

.method public sendFileWithCompletion(Ljava/lang/String;[BLcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;)V
    .locals 20
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "completion"    # Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    move-object/from16 v0, p2

    array-length v3, v0

    if-nez v3, :cond_1

    .line 274
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v4, "Missing file name or data is empty, aborting file transfer."

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 316
    :goto_0
    return-void

    .line 278
    :cond_1
    const-string v3, "."

    invoke-static {v3}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    .line 279
    .local v18, "parts":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v2, v18, v3

    .line 280
    .local v2, "base":Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v16, v18, v3

    .line 281
    .local v16, "extension":Ljava/lang/String;
    const/16 v17, 0x0

    .line 283
    .local v17, "fileName":Ljava/lang/String;
    move-object/from16 v0, p2

    array-length v3, v0

    if-nez v3, :cond_2

    .line 285
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/EMTMainController;->TAG:Ljava/lang/String;

    const-string v5, "Empty or missing file, aborting transfer."

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 289
    :cond_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x8

    if-le v3, v4, :cond_3

    .line 291
    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 294
    :cond_3
    if-eqz v16, :cond_5

    .line 296
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x3

    if-le v3, v4, :cond_4

    .line 298
    const/4 v3, 0x0

    const/4 v4, 0x3

    move-object/from16 v0, v16

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 301
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 304
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/content/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 306
    .local v12, "destination":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Beginning file transfer to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 308
    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/disney/emagine/sdk/EMTMainController;->startTime:J

    .line 309
    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/disney/emagine/sdk/EMTMainController;->transferredBytes:J

    .line 311
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v13

    .line 312
    .local v13, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    iget-wide v14, v13, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    .line 313
    .local v14, "deviceId":J
    const/16 v19, 0x0

    .line 315
    .local v19, "version":I
    const/4 v11, 0x1

    new-instance v3, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/disney/emagine/sdk/EMTMainController;->startTime:J

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/disney/emagine/sdk/EMTMainController;->transferredBytes:J

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    move-object/from16 v10, p3

    invoke-direct/range {v3 .. v10}, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;-><init>(Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;[BJJLcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;)V

    move-object v4, v13

    move-object v5, v12

    move-object/from16 v6, p2

    move/from16 v7, v19

    move-wide v8, v14

    move v10, v11

    move-object v11, v3

    invoke-virtual/range {v4 .. v11}, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferFile(Ljava/lang/String;[BIJZLcom/disney/emagine/sdk/delegate/EMTTransferDelegate;)V

    goto/16 :goto_0
.end method

.method public sendToken(Ljava/lang/String;I)V
    .locals 7
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "deviceId"    # I

    .prologue
    .line 157
    iget-object v3, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/EMTMainController;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Sending token: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .local v0, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 165
    .local v2, "jsonString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    .line 166
    .local v1, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v1, :cond_0

    .line 167
    const/16 v3, 0x1645

    invoke-virtual {v1, v3, p2, v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendDataEvent(SILjava/lang/String;)V

    .line 169
    :cond_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v4, "Send token complete..."

    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method public sendUpdateFirmware()V
    .locals 1

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMainController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 99
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendUpdateFirmware()V

    .line 101
    :cond_0
    return-void
.end method

.method public setDelegate(Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;)V
    .locals 0
    .param p1, "activity"    # Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/disney/emagine/sdk/EMTMainController;->delegate:Lcom/disney/emagine/sdk/delegate/EMTActivityDelegate;

    .line 67
    return-void
.end method

.method public setError(Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 0
    .param p1, "err"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 396
    iput-object p1, p0, Lcom/disney/emagine/sdk/EMTMainController;->error:Lcom/disney/emagine/sdk/apple/NSError;

    .line 397
    return-void
.end method

.method public setStartTime(J)V
    .locals 1
    .param p1, "st"    # J

    .prologue
    .line 401
    iput-wide p1, p0, Lcom/disney/emagine/sdk/EMTMainController;->startTime:J

    .line 402
    return-void
.end method

.method public setTransferredBytes(J)V
    .locals 1
    .param p1, "tb"    # J

    .prologue
    .line 406
    iput-wide p1, p0, Lcom/disney/emagine/sdk/EMTMainController;->transferredBytes:J

    .line 407
    return-void
.end method

.method public showAlert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 345
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMainController;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ERROR: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 348
    return-void
.end method

.method public showErrorWithTitle(Lcom/disney/emagine/sdk/apple/NSError;Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "overrideTitle"    # Ljava/lang/String;

    .prologue
    .line 327
    move-object v0, p2

    .line 329
    .local v0, "title":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 331
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->domain()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.disney.eMagine"

    if-ne v1, v2, :cond_1

    .line 333
    const-string v0, "eMagine Error"

    .line 341
    :cond_0
    :goto_0
    return-void

    .line 336
    :cond_1
    const-string v0, "Core Bluetooth Error"

    goto :goto_0
.end method
