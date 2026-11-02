.class Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EmagineNetworkClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->downloadFirmware(ILjava/util/HashMap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field final synthetic val$deviceId:I


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/util/HashMap;Ljava/util/HashMap;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .param p2, "id"    # I

    .prologue
    .line 608
    .local p3, "ct":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "md":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iput p5, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->val$deviceId:I

    invoke-direct {p0, p2, p3, p4}, Lcom/disney/emagine/sdk/networking/EMTRestHandler;-><init>(ILjava/util/HashMap;Ljava/util/HashMap;)V

    return-void
.end method


# virtual methods
.method public onFailure(ILjava/util/ArrayList;[BLjava/lang/Throwable;)V
    .locals 4
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
    .line 671
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 672
    .local v0, "appEventDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "event"

    const/16 v3, 0x6a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 676
    .local v1, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    const/16 v3, 0x15

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 679
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v2, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 680
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 17
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
    .line 614
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v11, v11, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v12

    const-string v13, "statusCode:[%d]"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 616
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 618
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->contents:Ljava/util/HashMap;

    const-string v12, "packageIV"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 619
    .local v8, "packageIV":[B
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->contents:Ljava/util/HashMap;

    const-string v12, "packageKey"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 620
    .local v9, "packageKey":[B
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->contents:Ljava/util/HashMap;

    const-string v12, "firmwareHmacSHA1"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v5

    .line 622
    .local v5, "hmacSha1":[B
    array-length v11, v8

    const/16 v12, 0x10

    if-eq v11, v12, :cond_0

    .line 624
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v11, v11, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v12

    const-string v13, "Error package IV wrong size. Actual = [%d], Expected = [%d]"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    array-length v0, v8

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const/16 v16, 0x10

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    :goto_0
    return-void

    .line 629
    :cond_0
    array-length v11, v9

    const/16 v12, 0x10

    if-eq v11, v12, :cond_1

    .line 631
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v11, v11, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v12

    const-string v13, "Error package Key wrong size. Actual = [%d], Expected = [%d]"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    array-length v0, v9

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const/16 v16, 0x10

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 636
    :cond_1
    array-length v11, v5

    const/16 v12, 0x14

    if-eq v11, v12, :cond_2

    .line 638
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v11, v11, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$000()Ljava/lang/String;

    move-result-object v12

    const-string v13, "Error HMAC-SHA1 wrong size. Actual = [%d], Expected = [%d]"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    array-length v0, v5

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const/16 v16, 0x14

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 643
    :cond_2
    move-object/from16 v4, p3

    .line 644
    .local v4, "fwpData":[B
    const/16 v10, 0x10

    .line 646
    .local v10, "payloadNonceLength":I
    const/4 v11, 0x0

    const/16 v12, 0x1c

    array-length v13, v5

    invoke-static {v5, v11, v4, v12, v13}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 648
    array-length v11, v4

    array-length v12, v8

    array-length v13, v9

    add-int/2addr v12, v13

    add-int/2addr v12, v10

    sub-int v6, v11, v12

    .line 649
    .local v6, "ivStart":I
    array-length v11, v8

    add-int v7, v6, v11

    .line 651
    .local v7, "keyStart":I
    const/4 v11, 0x0

    array-length v12, v8

    invoke-static {v8, v11, v4, v6, v12}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 652
    const/4 v11, 0x0

    array-length v12, v9

    invoke-static {v9, v11, v4, v7, v12}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BI[BII)[B

    .line 654
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->contents:Ljava/util/HashMap;

    const-string v13, "firmwareVersion"

    invoke-virtual {v11, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".fwp"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 655
    .local v2, "fileName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->metadata:Ljava/util/HashMap;

    const-string v12, "filePath"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 658
    .local v3, "filePath":Ljava/lang/String;
    :try_start_0
    invoke-static {v4, v3, v2}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 665
    :goto_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->this$0:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;->val$deviceId:I

    invoke-static {v11, v12, v2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->access$100(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/String;)V

    goto/16 :goto_0

    .line 659
    :catch_0
    move-exception v1

    .line 662
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method
