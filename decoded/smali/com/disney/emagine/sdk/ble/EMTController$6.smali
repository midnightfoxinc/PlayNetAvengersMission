.class Lcom/disney/emagine/sdk/ble/EMTController$6;
.super Ljava/lang/Object;
.source "EMTController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTController;->closeDevice()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTController;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 465
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 467
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$600(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v4

    if-nez v4, :cond_1

    .line 468
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    const-string v5, "EMTController"

    const-string v6, "in run()... device is closed.  Did you call open()?"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    :cond_0
    :goto_0
    return-void

    .line 472
    :cond_1
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    invoke-static {}, Lcom/disney/emagine/sdk/ble/EMTController;->access$900()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Closing GATT"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$600(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v4

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothGatt;->close()V

    .line 474
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4, v8}, Lcom/disney/emagine/sdk/ble/EMTController;->access$602(Lcom/disney/emagine/sdk/ble/EMTController;Landroid/bluetooth/BluetoothGatt;)Landroid/bluetooth/BluetoothGatt;

    .line 475
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$800(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v4

    iget-wide v4, v4, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v0, v4

    .line 476
    .local v0, "deviceId":I
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    invoke-static {}, Lcom/disney/emagine/sdk/ble/EMTController;->access$900()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "deviceId = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4, v8}, Lcom/disney/emagine/sdk/ble/EMTController;->access$802(Lcom/disney/emagine/sdk/ble/EMTController;Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 478
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->clearKnownDevices()V

    .line 480
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v2

    .line 481
    .local v2, "tkStateMachine":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v4

    iget-object v4, v4, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->currentState:Lcom/disney/emagine/sdk/transitionkit/TKState;

    iget-object v4, v4, Lcom/disney/emagine/sdk/transitionkit/TKState;->name:Ljava/lang/String;

    const-string v5, "Registration"

    .line 483
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 485
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v4

    iget-object v1, v4, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->reconnectDeviceId:Ljava/lang/Integer;

    .line 486
    .local v1, "reconnectDeviceId":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    .line 490
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 492
    .local v3, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "device_id"

    invoke-virtual {v3, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    const-string v4, "Register Done"

    invoke-virtual {v2, v4, v3}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    goto :goto_0

    .line 496
    .end local v1    # "reconnectDeviceId":Ljava/lang/Integer;
    .end local v3    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    invoke-static {}, Lcom/disney/emagine/sdk/ble/EMTController;->access$900()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Calling disconnect with deviceId = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->disconnect(I)V

    goto/16 :goto_0
.end method
