.class public Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;
.super Ljava/lang/Object;
.source "EMTTransferManifestSuccess.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field deviceId:I


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V
    .locals 1
    .param p1, "del"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p2, "id"    # I

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->deviceId:I

    .line 24
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 25
    iput p2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->deviceId:I

    .line 26
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 39
    return-void
.end method

.method public run(Ljava/util/HashMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p1, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->deviceId:I

    invoke-virtual {v0, v1, p1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageTransferStart(ILjava/util/HashMap;)V

    .line 35
    return-void
.end method
