.class Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;
.super Ljava/lang/Object;
.source "EMTGattCallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTGattCallback;->onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

.field final synthetic val$gatt:Landroid/bluetooth/BluetoothGatt;

.field final synthetic val$newState:I

.field final synthetic val$status:I


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTGattCallback;Landroid/bluetooth/BluetoothGatt;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    iput-object p2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$gatt:Landroid/bluetooth/BluetoothGatt;

    iput p3, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$newState:I

    iput p4, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$status:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    .line 60
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$000(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v2

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGatt;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/ble/EMTController;->validateCurrentDevice(Landroid/bluetooth/BluetoothDevice;)V

    .line 62
    iget v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$newState:I

    if-ne v2, v6, :cond_1

    iget v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$status:I

    if-nez v2, :cond_1

    .line 64
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    .line 68
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    .line 69
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$000(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceDidConnect()V

    .line 70
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$000(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v2

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGatt;->readRemoteRssi()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/ble/EMTController;->onReadRemoteRssi(Z)V

    .line 93
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    iget v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$newState:I

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$status:I

    const/16 v3, 0x85

    if-ne v2, v3, :cond_0

    .line 73
    :cond_2
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$100(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v2

    const-string v3, "GATT"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EMTGattCallback.onConnectionStateChange status="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->val$status:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "newState = STATE_DISCONNECT"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->isConnected:Z

    .line 77
    new-instance v1, Lcom/disney/emagine/sdk/apple/NSError;

    const-string v2, "com.disney.eMagine"

    const-string v3, "Device disconnected."

    invoke-direct {v1, v2, v6, v3}, Lcom/disney/emagine/sdk/apple/NSError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .local v1, "error":Lcom/disney/emagine/sdk/apple/NSError;
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$000(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceDidDisconnectWithError(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 83
    :try_start_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$000(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->closeDevice()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    :goto_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$200(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 90
    :try_start_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTGattCallback$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTGattCallback;->access$200(Lcom/disney/emagine/sdk/ble/EMTGattCallback;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 91
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 84
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method
