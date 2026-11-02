.class Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EMTMissionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EMTMissionManager;->receivePackageZipFromUrl(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field final synthetic val$packageId:Ljava/lang/String;

.field final synthetic val$sha1:[B

.field final synthetic val$version:I


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/String;I[B)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .prologue
    .line 1242
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iput-object p2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$packageId:Ljava/lang/String;

    iput p3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$version:I

    iput-object p4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$sha1:[B

    invoke-direct {p0}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>()V

    return-void
.end method

.method private outputError(I)V
    .locals 5
    .param p1, "statusCode"    # I

    .prologue
    .line 1245
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->docPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " was not downloaded: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1248
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"payload\":{\"packageId\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$packageId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\",\"version\":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$version:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",\"status\":1}}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 1250
    .local v0, "json":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v1

    const/16 v2, 0x1f

    invoke-virtual {v1, v2, v0}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1251
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
    .line 1326
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 1327
    invoke-direct {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->outputError(I)V

    .line 1328
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 9
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
    .line 1256
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v5

    invoke-virtual {v5, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 1258
    const/16 v5, 0xc8

    if-ne p1, v5, :cond_3

    .line 1261
    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->docPath:Ljava/lang/String;

    invoke-static {p3, v5}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;)V

    .line 1269
    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->docPath:Ljava/lang/String;

    invoke-static {v5}, Lcom/disney/emagine/sdk/EMTFileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1271
    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v5

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed. "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->docPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " was NOT downloaded. writeToFile failed"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1272
    const/16 v5, 0x3e6

    invoke-direct {p0, v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->outputError(I)V

    .line 1320
    :goto_0
    return-void

    .line 1281
    :cond_0
    if-eqz p3, :cond_2

    .line 1283
    const/4 v2, 0x0

    .line 1284
    .local v2, "md":Ljava/security/MessageDigest;
    const/4 v3, 0x0

    .line 1288
    .local v3, "mdBytes":[B
    :try_start_0
    const-string v5, "SHA1"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 1290
    invoke-virtual {v2, p3}, Ljava/security/MessageDigest;->update([B)V

    .line 1292
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 1299
    :goto_1
    if-eqz v3, :cond_1

    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$sha1:[B

    const/16 v6, 0x14

    invoke-static {v3, v5, v6}, Lcom/disney/emagine/sdk/EMTData;->isEqual([B[BI)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v4, 0x1

    .line 1301
    .local v4, "shaIsValid":Z
    :goto_2
    if-nez v4, :cond_2

    .line 1303
    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v5

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed. "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->docPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " was NOT downloaded. SHA1 did not match"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1304
    const/16 v5, 0x3e7

    invoke-direct {p0, v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->outputError(I)V

    goto :goto_0

    .line 1294
    .end local v4    # "shaIsValid":Z
    :catch_0
    move-exception v0

    .line 1296
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_1

    .line 1299
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :cond_1
    const/4 v4, 0x0

    goto :goto_2

    .line 1309
    .end local v2    # "md":Ljava/security/MessageDigest;
    .end local v3    # "mdBytes":[B
    :cond_2
    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-static {v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v5

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Succeeded. "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->docPath:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " was downloaded: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1312
    new-instance v1, Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "{\"payload\":{\"packageId\":\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$packageId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\",\"version\":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->val$version:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",\"status\":0}}"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 1314
    .local v1, "json":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v5

    const/16 v6, 0x1f

    invoke-virtual {v5, v6, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 1318
    .end local v1    # "json":Ljava/lang/String;
    :cond_3
    invoke-direct {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;->outputError(I)V

    goto/16 :goto_0
.end method
