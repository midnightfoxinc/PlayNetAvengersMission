.class public Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateOnAnalyticsBlock;
.super Ljava/lang/Object;
.source "TKDidEnterStateOnAnalyticsBlock.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/transitionkit/block/TKDidEnterStateDelegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 17
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/transitionkit/TKState;Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
    .locals 1
    .param p1, "state"    # Lcom/disney/emagine/sdk/transitionkit/TKState;
    .param p2, "transition"    # Lcom/disney/emagine/sdk/transitionkit/TKTransition;

    .prologue
    .line 11
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->onAnalytics(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V

    .line 12
    return-void
.end method
