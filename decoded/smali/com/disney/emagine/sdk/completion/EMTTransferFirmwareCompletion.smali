.class public Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;
.super Ljava/lang/Object;
.source "EMTTransferFirmwareCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;


# instance fields
.field bytesTransferred:J

.field delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field deviceId:I

.field fileLength:J

.field fileName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;ILjava/lang/String;I)V
    .locals 2
    .param p1, "del"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p2, "id"    # I
    .param p3, "fn"    # Ljava/lang/String;
    .param p4, "fl"    # I

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->deviceId:I

    .line 31
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->bytesTransferred:J

    .line 36
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 37
    iput p2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->deviceId:I

    .line 38
    iput-object p3, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->fileName:Ljava/lang/String;

    .line 39
    int-to-long v0, p4

    iput-wide v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->fileLength:J

    .line 40
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 96
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V
    .locals 11
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "offset"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 45
    iget-wide v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->bytesTransferred:J

    int-to-long v8, p3

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->bytesTransferred:J

    .line 47
    iget-wide v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->bytesTransferred:J

    const-wide/16 v8, 0x64

    mul-long/2addr v6, v8

    iget-wide v8, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->fileLength:J

    div-long/2addr v6, v8

    long-to-int v5, v6

    .line 50
    .local v5, "percent":I
    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->fileName:Ljava/lang/String;

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "comps":[Ljava/lang/String;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 53
    .local v3, "jsonObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "name"

    array-length v7, v0

    add-int/lit8 v7, v7, -0x1

    aget-object v7, v0, v7

    invoke-virtual {v3, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    const-string v6, "finished"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-string v6, "device_id"

    iget v7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->deviceId:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v6, "event"

    const/16 v7, 0x67

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v6, "percent"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->code()I

    move-result v6

    const/16 v7, 0xc

    if-eq v6, v7, :cond_0

    .line 61
    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v6

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v7}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Firmware Transfer Error "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->localizedDescription()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 64
    .local v2, "errorObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "code"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->code()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v6, "domain"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->domain()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v6, "description"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->description()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v6, "error"

    invoke-virtual {v3, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateMachine()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v6

    const-string v7, "Send Firmware Done"

    invoke-virtual {v6, v7, v10}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 72
    .end local v2    # "errorObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-static {v3}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 74
    .local v4, "jsonString":Ljava/lang/String;
    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v6

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v7}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    if-nez p1, :cond_2

    .line 79
    if-eqz p2, :cond_2

    .line 81
    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v6

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v7}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v7

    const-string v8, "SEND -----> FIRMWARE_TRANSFER_COMPLETE"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    .line 83
    .local v1, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v1, :cond_1

    .line 84
    invoke-virtual {v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendUpdateFirmware()V

    .line 85
    :cond_1
    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateMachine()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v6

    const-string v7, "Send Firmware Done"

    invoke-virtual {v6, v7, v10}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 89
    .end local v1    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_2
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v6

    const/16 v7, 0x15

    invoke-virtual {v6, v7, v4}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 90
    return-void
.end method
