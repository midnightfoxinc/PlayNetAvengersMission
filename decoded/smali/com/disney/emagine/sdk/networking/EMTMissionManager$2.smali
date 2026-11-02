.class Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EMTMissionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EMTMissionManager;->download(Ljava/lang/String;Ljava/lang/String;[BLcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field final synthetic val$success:Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .param p2, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 346
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iput-object p3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->val$success:Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;

    invoke-direct {p0, p2}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>(Ljava/lang/Runnable;)V

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
    .line 390
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 391
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 10
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
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    const/4 v9, 0x0

    .line 352
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 354
    const/16 v4, 0xc8

    if-ne p1, v4, :cond_2

    .line 356
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->docPath:Ljava/lang/String;

    invoke-static {p3, v4}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;)V

    .line 358
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Success downloading "

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->docPath:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->docPath:Ljava/lang/String;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 363
    .local v0, "comps":[Ljava/lang/String;
    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    aget-object v4, v0, v4

    const-string v5, "\\."

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 365
    aget-object v2, v0, v9

    .line 367
    .local v2, "fileName":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 369
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 371
    .local v1, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "name"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_1

    .line 373
    const-string v4, "path"

    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->docPath:Ljava/lang/String;

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->val$success:Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;

    invoke-virtual {v4, v1}, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->run(Ljava/util/HashMap;)V

    .line 384
    .end local v0    # "comps":[Ljava/lang/String;
    .end local v1    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "i":I
    :cond_0
    :goto_1
    return-void

    .line 367
    .restart local v0    # "comps":[Ljava/lang/String;
    .restart local v1    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "i":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 382
    .end local v0    # "comps":[Ljava/lang/String;
    .end local v1    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "i":I
    :cond_2
    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed. "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;->docPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " was not downloaded."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
