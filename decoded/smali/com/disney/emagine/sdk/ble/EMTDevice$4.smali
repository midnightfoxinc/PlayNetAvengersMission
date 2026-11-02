.class Lcom/disney/emagine/sdk/ble/EMTDevice$4;
.super Ljava/util/TimerTask;
.source "EMTDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTDevice;->setWatchDogTimer()V
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
    .line 1418
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$4;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1422
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$4;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v0}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$500(Lcom/disney/emagine/sdk/ble/EMTDevice;)V

    .line 1423
    return-void
.end method
