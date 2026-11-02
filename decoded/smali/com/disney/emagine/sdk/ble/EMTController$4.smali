.class Lcom/disney/emagine/sdk/ble/EMTController$4;
.super Ljava/lang/Object;
.source "EMTController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTController;->connect()V
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
    .line 390
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$4;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 392
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$4;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$4;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$800(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->peripheral()Landroid/bluetooth/BluetoothDevice;

    move-result-object v1

    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTController$4;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v4}, Lcom/disney/emagine/sdk/ble/EMTController;->access$700(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTGattCallback;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->access$602(Lcom/disney/emagine/sdk/ble/EMTController;Landroid/bluetooth/BluetoothGatt;)Landroid/bluetooth/BluetoothGatt;

    .line 393
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$4;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$600(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    if-nez v0, :cond_0

    .line 397
    :cond_0
    return-void
.end method
