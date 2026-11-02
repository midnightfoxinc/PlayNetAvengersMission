.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$7;
.super Ljava/util/TimerTask;
.source "EMTPortalLibraryController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->startKeycodeTimer(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 2648
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$7;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2652
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$7;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->keycodeFailed()V

    .line 2653
    return-void
.end method
