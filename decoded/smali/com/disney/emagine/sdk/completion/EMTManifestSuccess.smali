.class public Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;
.super Ljava/lang/Object;
.source "EMTManifestSuccess.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/transitionkit/TKConstants;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V
    .locals 0
    .param p1, "del"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 26
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->manifestSuccess()V

    .line 46
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 3
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .local v0, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    .line 34
    const-string v1, "error"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    :cond_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateMachine()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v1

    const-string v2, "Send Manifest Done"

    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 39
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->manifestSuccess()V

    .line 40
    return-void
.end method
