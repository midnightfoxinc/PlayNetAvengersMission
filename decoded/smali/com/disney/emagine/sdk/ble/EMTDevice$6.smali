.class Lcom/disney/emagine/sdk/ble/EMTDevice$6;
.super Ljava/lang/Object;
.source "EMTDevice.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTDevice;->onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 2639
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2641
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$6;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$1300(Lcom/disney/emagine/sdk/ble/EMTDevice;)Z

    .line 2642
    return-void
.end method
