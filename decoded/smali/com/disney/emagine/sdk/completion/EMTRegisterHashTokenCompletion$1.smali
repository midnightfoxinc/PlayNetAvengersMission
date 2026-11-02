.class Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion$1;
.super Ljava/lang/Object;
.source "EMTRegisterHashTokenCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->run(Ljava/util/HashMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion$1;->this$0:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 141
    invoke-static {}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->sharedInstance()Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->setKeyForSlot([BB)V

    .line 142
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion$1;->this$0:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion$1;->this$0:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    iget-object v1, v1, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sendCloseBLEConnection"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion$1;->this$0:Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendCloseBLEConnection()V

    .line 144
    return-void
.end method
