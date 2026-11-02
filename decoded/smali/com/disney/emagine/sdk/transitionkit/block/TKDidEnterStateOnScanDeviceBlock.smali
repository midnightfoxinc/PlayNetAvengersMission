.class public Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnScanDeviceBlock;
.super Ljava/lang/Object;
.source "TKDidEnterStateOnScanDeviceBlock.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;


# instance fields
.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnScanDeviceBlock;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 51
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 9
    .param p1, "state"    # Lcom/disney/emagine/sdk/transitionkit/TKState;
    .param p2, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 19
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    .line 20
    .local v0, "controller":Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    .line 21
    .local v1, "device":Lcom/disney/emagine/sdk/ble/EMTDevice;
    const/4 v2, 0x0

    .line 23
    .local v2, "deviceId":Ljava/lang/Integer;
    if-eqz p2, :cond_1

    iget-object v4, p2, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    if-eqz v4, :cond_1

    .line 24
    iget-object v4, p0, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnScanDeviceBlock;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v5, "DEVICEID"

    const-string v6, "Transition map:"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    iget-object v4, p2, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 26
    .local v3, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v6, p0, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnScanDeviceBlock;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v7, "DEVICEID"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\tkey: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, ", value="

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v7, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 28
    .end local v3    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    iget-object v4, p0, Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnScanDeviceBlock;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v5, "DEVICEID"

    const-string v6, "Transition map end."

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    iget-object v4, p2, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v5, "device_id"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 31
    iget-object v4, p2, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->userInfo:Ljava/util/HashMap;

    const-string v5, "device_id"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "deviceId":Ljava/lang/Integer;
    check-cast v2, Ljava/lang/Integer;

    .line 36
    .restart local v2    # "deviceId":Ljava/lang/Integer;
    :cond_1
    if-eqz p2, :cond_2

    iget-object v4, p2, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    if-eqz v4, :cond_2

    iget-object v4, p2, Lcom/disney/emagine/sdk/transitionkit/TKTransition;->sourceState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v4, v4, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v5, "Registration"

    if-ne v4, v5, :cond_2

    .line 38
    if-eqz v2, :cond_3

    .line 39
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    .line 45
    :cond_2
    :goto_1
    invoke-virtual {v0, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->onScanDevices(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 46
    return-void

    .line 41
    :cond_3
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v4

    const/4 v5, 0x0

    iput-object v5, v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    goto :goto_1
.end method
