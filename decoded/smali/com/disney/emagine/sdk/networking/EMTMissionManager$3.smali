.class Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EMTMissionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getEntitlements(ISLcom/disney/emagine/sdk/completion/EMTManifestSuccess;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field final synthetic val$deviceType:S

.field final synthetic val$success:Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/Runnable;SLcom/disney/emagine/sdk/completion/EMTManifestSuccess;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .param p2, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 411
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iput-short p3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->val$deviceType:S

    iput-object p4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->val$success:Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;

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
    .line 464
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 465
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
    .line 418
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v6

    invoke-virtual {v6, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 420
    invoke-static {p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v3

    .line 421
    .local v3, "missionsToLoad":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v5

    .line 422
    .local v5, "values":[Ljava/lang/Object;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 424
    .local v2, "missions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 426
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_0

    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 428
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 431
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_3

    .line 433
    iget-object v7, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    iget-short v8, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->val$deviceType:S

    invoke-virtual {v7, v6, v8}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->generateManifest(Ljava/util/HashMap;S)Ljava/util/HashMap;

    move-result-object v1

    .line 435
    .local v1, "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "files"

    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_1

    .line 431
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 440
    :cond_1
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    const/4 v7, 0x0

    invoke-virtual {v6, v1, v7}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->saveManifestToPath(Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v4

    .line 442
    .local v4, "success":Z
    if-nez v4, :cond_2

    .line 444
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v6

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to save manifest "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v9, v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestFileName(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to the filesystem"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 447
    :cond_2
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 450
    .end local v1    # "manifestItem":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "success":Z
    :cond_3
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->val$success:Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;

    if-eqz v6, :cond_4

    .line 452
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->val$success:Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;->run()V

    .line 458
    :goto_2
    return-void

    .line 456
    :cond_4
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v6

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Received Manifest"

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method
