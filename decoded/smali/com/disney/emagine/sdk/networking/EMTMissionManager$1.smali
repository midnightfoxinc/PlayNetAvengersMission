.class Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;
.super Lcom/disney/emagine/sdk/networking/EMTRestHandler;
.source "EMTMissionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/networking/EMTMissionManager;->getContentMetadata(Ljava/lang/String;ILcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field final synthetic val$experienceId:Ljava/lang/String;

.field final synthetic val$success:Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/Runnable;Ljava/lang/String;Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .param p2, "fu"    # Ljava/lang/Runnable;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iput-object p3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$experienceId:Ljava/lang/String;

    iput-object p4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$success:Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;

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
    .line 281
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->handleNetworkError(I[B)V

    .line 282
    return-void
.end method

.method public onSuccess(ILjava/util/ArrayList;[B)V
    .locals 26
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
    .line 184
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->checkAndUpdateAccessToken(Ljava/util/ArrayList;)V

    .line 186
    invoke-static/range {p3 .. p3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v17

    .line 188
    .local v17, "metaData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v17, :cond_1

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v21

    const-string v22, "Error: getContentMetadata - Failed to retrieve Manifest for the device. This is a server error. Please fix the database!!!"

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    :cond_0
    :goto_0
    return-void

    .line 195
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v21

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "ExperienceID = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$experienceId:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    if-nez v20, :cond_2

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v21

    const-string v22, "Error: Missing Content List, need to call GetContentList method first."

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$success:Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;->run(Z)V

    .line 204
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_3
    :goto_1
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_0

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 206
    .local v4, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v20, "id"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 207
    .local v15, "manifestItemId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v22

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Experience ID = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$experienceId:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, " Manifest Item Id = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$experienceId:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string v20, "id"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v20

    if-nez v20, :cond_3

    .line 210
    const-string v20, "url"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 211
    .local v19, "url":Ljava/lang/String;
    const-string v20, "downloadUrl"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 212
    .local v5, "downloadUrl":Ljava/lang/String;
    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v20

    if-eqz v20, :cond_4

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v22

    const-string v23, "Error: The urls don\'t match up."

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    :cond_4
    const-string v20, "hmac-key"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    .line 218
    .local v10, "hmacKeyBase64":[B
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-static {v10, v0}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v9

    .line 219
    .local v9, "hmacKey":[B
    const-string v20, "hmac-key"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    const-string v20, "hmac-sha1"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    .line 222
    .local v12, "hmacSha1Base64":[B
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-static {v12, v0}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v11

    .line 223
    .local v11, "hmacSha1":[B
    const-string v20, "hmac-sha1"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    const-string v20, "manifest"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    .line 227
    .local v14, "manifestDataBase64":[B
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-static {v14, v0}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v13

    .line 228
    .local v13, "manifestData":[B
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 229
    .local v3, "destinationPath":Ljava/lang/String;
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$experienceId:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v22, ".pmp"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 230
    .local v8, "fileName":Ljava/lang/String;
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v22, "/"

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 233
    .local v16, "manifestPath":Ljava/lang/String;
    :try_start_0
    invoke-static {v13, v3, v8}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    :goto_2
    const-string v20, "manifest-path"

    move-object/from16 v0, v20

    invoke-virtual {v4, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    const-string v20, "packageKey"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/HashMap;

    .line 246
    .local v18, "package1":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_1
    const-string v22, "packageIV"

    const-string v20, "packageIV"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    const-string v22, "packageKey"

    const-string v20, "packageKey"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    const-string v22, "packageSHA1"

    const-string v20, "packageSHA1"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v20

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 257
    array-length v0, v13

    move/from16 v20, v0

    if-nez v20, :cond_5

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v21

    const-string v22, "Error: Manifest for %s length is zero"

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->val$experienceId:Ljava/lang/String;

    move-object/from16 v25, v0

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 234
    .end local v18    # "package1":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v6

    .line 236
    .local v6, "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 250
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v18    # "package1":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_1
    move-exception v7

    .line 252
    .local v7, "exception":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v22

    const-string v23, "Warning: The backend should be returning a packageSHA1. Error with %s."

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput-object v8, v24, v25

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 264
    .end local v7    # "exception":Ljava/lang/Exception;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v20

    if-nez v20, :cond_0

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->access$000()Ljava/lang/String;

    move-result-object v21

    const-string v22, "Error, the self.currentDevice is null."

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
