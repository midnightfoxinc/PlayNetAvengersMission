.class Lcom/disney/emagine/sdk/ble/EMTDevice$2;
.super Ljava/lang/Object;
.source "EMTDevice.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTDevice;->ackTimeout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private device:Lcom/disney/emagine/sdk/ble/EMTDevice;

.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 1290
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$2;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1291
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$2;->device:Lcom/disney/emagine/sdk/ble/EMTDevice;

    return-void
.end method


# virtual methods
.method public init(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/lang/Runnable;
    .locals 0
    .param p1, "d"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 1294
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$2;->device:Lcom/disney/emagine/sdk/ble/EMTDevice;

    .line 1296
    return-object p0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 1301
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$2;->device:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$400(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 1302
    return-void
.end method
