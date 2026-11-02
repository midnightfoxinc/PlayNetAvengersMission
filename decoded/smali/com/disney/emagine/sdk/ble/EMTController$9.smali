.class Lcom/disney/emagine/sdk/ble/EMTController$9;
.super Ljava/util/TimerTask;
.source "EMTController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTController;->startTimer(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTController;

.field timer:Ljava/util/Timer;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 818
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$9;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 819
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$9;->timer:Ljava/util/Timer;

    return-void
.end method


# virtual methods
.method public TimerTask(Ljava/util/Timer;)Ljava/util/TimerTask;
    .locals 0
    .param p1, "tm"    # Ljava/util/Timer;

    .prologue
    .line 825
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$9;->timer:Ljava/util/Timer;

    .line 827
    return-object p0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 831
    iget-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTController$9;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    iget-object v1, p0, Lcom/disney/emagine/sdk/ble/EMTController$9;->timer:Ljava/util/Timer;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/ble/EMTController;->onTick(Ljava/util/Timer;)V

    .line 832
    return-void
.end method
