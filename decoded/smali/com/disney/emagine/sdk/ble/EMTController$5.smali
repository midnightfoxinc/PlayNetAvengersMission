.class Lcom/disney/emagine/sdk/ble/EMTController$5;
.super Ljava/lang/Object;
.source "EMTController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTController;->disconnectDevice()V
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
    .line 442
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 444
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$600(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 445
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->access$600(Lcom/disney/emagine/sdk/ble/EMTController;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 447
    :cond_0
    return-void
.end method
