.class Lcom/disney/emagine/sdk/ble/EMTDevice$7;
.super Ljava/lang/Object;
.source "EMTDevice.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTDevice;->onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 2840
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$7;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2841
    new-instance v0, Lcom/disney/emagine/sdk/EMTMessage;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/EMTMessage;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$7;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    return-void
.end method


# virtual methods
.method public init(Lcom/disney/emagine/sdk/EMTMessage;)Ljava/lang/Runnable;
    .locals 0
    .param p1, "message"    # Lcom/disney/emagine/sdk/EMTMessage;

    .prologue
    .line 2844
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$7;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    .line 2845
    return-object p0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 2850
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$7;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$7;->currentMessage:Lcom/disney/emagine/sdk/EMTMessage;

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$1400(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/EMTMessage;)V

    .line 2851
    return-void
.end method
