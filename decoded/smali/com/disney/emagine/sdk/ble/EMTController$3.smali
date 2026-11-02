.class Lcom/disney/emagine/sdk/ble/EMTController$3;
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
    .line 262
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 265
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    const-string v1, "EMTController"

    const-string v2, "LE scan for 60000 ms."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$100(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 267
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    const-string v1, "EMTController"

    const-string v2, "mStartScanRunnable is already running."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    :cond_0
    :goto_0
    return-void

    .line 271
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$300(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTScanCallback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$102(Lcom/disney/emagine/sdk/ble/EMTController;Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    .line 273
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->startTimer(I)V

    .line 275
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$200(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$100(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothAdapter;->startLeScan(Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$102(Lcom/disney/emagine/sdk/ble/EMTController;Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Landroid/bluetooth/BluetoothAdapter$LeScanCallback;

    .line 278
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$500(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$400(Lcom/disney/emagine/sdk/ble/EMTController;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 279
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$000(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    const-string v1, "EMTController"

    const-string v2, "startLeScan aborted."

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$3;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->stopTimer()V

    goto :goto_0
.end method
