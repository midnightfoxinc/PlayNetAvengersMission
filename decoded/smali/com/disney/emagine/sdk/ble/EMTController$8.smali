.class Lcom/disney/emagine/sdk/ble/EMTController$8;
.super Ljava/lang/Object;
.source "EMTController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTController;->deviceDidDiscoverCharacteristicsForService(Landroid/bluetooth/BluetoothGattService;)V
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
    .line 772
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$8;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 775
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTController$8;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->access$800(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTController$8;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->access$800(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v2

    iget-object v2, v2, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    if-eqz v2, :cond_1

    .line 777
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTController$8;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->access$800(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v2

    iget-object v2, v2, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    sget-object v3, Lcom/disney/emagine/sdk/EMTConstants;->NOTIFICATION_DESCRIPTOR_UUID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptor(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;

    move-result-object v0

    .line 779
    .local v0, "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    if-eqz v0, :cond_1

    .line 781
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTController$8;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->access$800(Lcom/disney/emagine/sdk/ble/EMTController;)Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v2

    iget-object v2, v2, Lcom/disney/emagine/sdk/ble/EMTDevice;->mNotifyCharacteristic:Landroid/bluetooth/BluetoothGattCharacteristic;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v1

    .line 783
    .local v1, "properties":I
    and-int/lit8 v2, v1, 0x10

    if-lez v2, :cond_2

    .line 785
    sget-object v2, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_NOTIFICATION_VALUE:[B

    invoke-virtual {v0, v2}, Landroid/bluetooth/BluetoothGattDescriptor;->setValue([B)Z

    .line 792
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTController$8;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTController;->access$600(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/bluetooth/BluetoothGatt;->writeDescriptor(Landroid/bluetooth/BluetoothGattDescriptor;)Z

    .line 796
    .end local v0    # "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    .end local v1    # "properties":I
    :cond_1
    return-void

    .line 787
    .restart local v0    # "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    .restart local v1    # "properties":I
    :cond_2
    and-int/lit8 v2, v1, 0x20

    if-lez v2, :cond_0

    .line 789
    sget-object v2, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_INDICATION_VALUE:[B

    invoke-virtual {v0, v2}, Landroid/bluetooth/BluetoothGattDescriptor;->setValue([B)Z

    goto :goto_0
.end method
