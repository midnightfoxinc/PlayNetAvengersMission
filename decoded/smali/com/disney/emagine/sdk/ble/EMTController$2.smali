.class Lcom/disney/emagine/sdk/ble/EMTController$2;
.super Ljava/lang/Object;
.source "EMTController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/ble/EMTController;
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
    .line 241
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 244
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    const-string v2, "EMTController"

    const-string v3, "LE scan stopped"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$100(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    move-result-object v1

    if-nez v1, :cond_1

    .line 246
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    const-string v2, "EMTController"

    const-string v3, "mLeScanCallbackActive == null"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    :cond_0
    :goto_0
    return-void

    .line 249
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->stopTimer()V

    .line 250
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    const-string v2, "EMTController"

    const-string v3, "calling mBluetoothAdapter.stopLeScan"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$200(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->access$100(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/bluetooth/BluetoothAdapter;->stopLeScan(Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)V

    .line 252
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1, v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$102(Lcom/disney/emagine/sdk/ble/EMTController;Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    .line 254
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v0

    .line 255
    .local v0, "tkStateMachine":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    const-string v1, "Scanning"

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 256
    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    const-string v2, "EMTController"

    const-string v3, "LE scan rescan"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    const-string v1, "Rescan"

    invoke-virtual {v0, v1, v4}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    goto :goto_0
.end method
