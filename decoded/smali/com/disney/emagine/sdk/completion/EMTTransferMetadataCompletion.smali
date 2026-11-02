.class public Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;
.super Ljava/lang/Object;
.source "EMTTransferMetadataCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;


# instance fields
.field private final MAX_RETRIES:I

.field delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field manifestItem:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private manifestRetryCount:I

.field success:Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;Ljava/util/HashMap;)V
    .locals 1
    .param p1, "callback"    # Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p2, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->manifestRetryCount:I

    .line 27
    const/4 v0, 0x3

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->MAX_RETRIES:I

    .line 31
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 32
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->success:Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;

    .line 33
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->manifestItem:Ljava/util/HashMap;

    .line 34
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 62
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V
    .locals 4
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "offset"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 39
    if-eqz p1, :cond_2

    .line 41
    iget v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->manifestRetryCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->manifestRetryCount:I

    const/4 v1, 0x3

    if-le v0, v1, :cond_1

    .line 43
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->resendFileTransferStart()V

    .line 56
    :cond_0
    :goto_0
    return-void

    .line 47
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Manifest Transfer Error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->localizedDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 51
    :cond_2
    if-eqz p2, :cond_0

    .line 53
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Manifest has been sent to successfully to device"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->success:Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;->manifestItem:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->run(Ljava/util/HashMap;)V

    goto :goto_0
.end method
