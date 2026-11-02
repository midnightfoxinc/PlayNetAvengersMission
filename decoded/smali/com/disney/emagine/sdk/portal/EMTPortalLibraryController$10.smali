.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EMTPortalLibraryController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->getContentEntitlements(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field final synthetic val$deviceId:I


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 3500
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iput p2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->val$deviceId:I

    invoke-direct {p0}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>()V

    return-void
.end method

.method private outputError(I)V
    .locals 4
    .param p1, "statusCode"    # I

    .prologue
    .line 3503
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->docPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " was not downloaded: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 3504
    return-void
.end method


# virtual methods
.method public onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V
    .locals 1
    .param p1, "statusCode"    # I
    .param p3, "content"    # [B
    .param p4, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;[B",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 3535
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 3536
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 7
    .param p1, "statusCode"    # I
    .param p3, "content"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;[B)V"
        }
    .end annotation

    .prologue
    .line 3510
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 3512
    const/16 v3, 0xc8

    if-ne p1, v3, :cond_0

    .line 3514
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->arrayListFromByteArray([B)Ljava/util/ArrayList;

    move-result-object v2

    .line 3515
    .local v2, "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 3517
    .local v0, "appResponse":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "payload"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3518
    const-string v3, "from"

    new-instance v4, Ljava/lang/Integer;

    iget v5, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->val$deviceId:I

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3520
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v3

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Entitled Packages: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 3522
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 3523
    .local v1, "appResponseString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v3

    const/16 v4, 0x21

    invoke-virtual {v3, v4, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 3529
    .end local v0    # "appResponse":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "appResponseString":Ljava/lang/String;
    .end local v2    # "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 3527
    :cond_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$10;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v3

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getContentEntitlements unexpected server response: ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
