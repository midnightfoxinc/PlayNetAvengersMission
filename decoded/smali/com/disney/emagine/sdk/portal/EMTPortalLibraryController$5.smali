.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;
.super Ljava/util/TimerTask;
.source "EMTPortalLibraryController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->startTimer(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field timer:Ljava/util/Timer;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 2556
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 2557
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;->timer:Ljava/util/Timer;

    return-void
.end method


# virtual methods
.method public TimerTask(Ljava/util/Timer;)Ljava/util/TimerTask;
    .locals 0
    .param p1, "tm"    # Ljava/util/Timer;

    .prologue
    .line 2563
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;->timer:Ljava/util/Timer;

    .line 2565
    return-object p0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 2569
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$5;->timer:Ljava/util/Timer;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->onTick(Ljava/util/Timer;)V

    .line 2570
    return-void
.end method
