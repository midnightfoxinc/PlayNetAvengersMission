.class public Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;
.super Ljava/lang/Object;
.source "EMTFirmwareCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

.field filename:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;Ljava/lang/String;)V
    .locals 0
    .param p1, "del"    # Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;
    .param p2, "fn"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    .line 27
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->filename:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 48
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->filename:Ljava/lang/String;

    const-string v2, ".fwp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v2}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Firmware %s has been uploaded to your device."

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->filename:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 52
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendUpdateFirmware()V

    .line 55
    .end local v0    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    :cond_0
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V
    .locals 7
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "offset"    # I

    .prologue
    .line 32
    if-eqz p1, :cond_1

    .line 34
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v2}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Firmware Transfer Error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->localizedDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    :cond_0
    :goto_0
    return-void

    .line 36
    :cond_1
    if-eqz p2, :cond_0

    .line 38
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v2}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Firmware %s has been uploaded to your device."

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->filename:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v0

    .line 40
    .local v0, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v0, :cond_0

    .line 41
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->sendUpdateFirmware()V

    goto :goto_0
.end method
