.class public Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;
.super Ljava/lang/Object;
.source "EMTOwnerIdRequestCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V
    .locals 0
    .param p1, "del"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 21
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 31
    return-void
.end method

.method public run(Ljava/lang/String;)V
    .locals 4
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    return-void
.end method
