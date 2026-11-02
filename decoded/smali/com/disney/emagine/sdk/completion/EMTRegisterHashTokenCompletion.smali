.class public Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;
.super Ljava/lang/Object;
.source "EMTRegisterHashTokenCompletion.java"

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
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->deviceId:I

    .line 40
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 41
    iput p2, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->deviceId:I

    .line 42
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 152
    return-void
.end method

.method public run(Ljava/util/HashMap;)V
    .locals 27
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
    .line 68
    .local p1, "responseObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v21

    sget-object v22, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v23, "responseObject===%s"

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    invoke-static/range {v22 .. v24}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    move-object/from16 v8, p1

    .line 71
    .local v8, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v20, "appOwnerKey"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    .line 73
    .local v7, "appOwnerKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v7, :cond_0

    .line 75
    const-string v20, "id"

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 76
    .local v19, "swid":Ljava/lang/String;
    const-string v20, "ownerKey"

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 77
    .local v10, "encryptedOwnerKeyString":Ljava/lang/String;
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-static {v10, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v9

    .line 79
    .local v9, "encryptedOwnerKey":[B
    const-string v20, "ownerKeyHashed"

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 80
    .local v17, "ownerKeyHashString":Ljava/lang/String;
    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v16

    .line 82
    .local v16, "ownerKeyHash":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, v16

    invoke-virtual {v0, v9, v1, v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->decryptVerifyAndStoreOwnerKey([BLjava/lang/String;[B)I

    move-result v11

    .line 84
    .local v11, "errorCode":I
    if-eqz v11, :cond_0

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v21

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Error: decryptVerifyAndStoreOwnerKey. error code = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 90
    .local v5, "appEventDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v20, "event"

    const/16 v21, 0x53

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v20, "from"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->deviceId:I

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v20, "code"

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    invoke-static {v5}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 96
    .local v13, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v20

    const/16 v21, 0xd

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v13}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 148
    .end local v5    # "appEventDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9    # "encryptedOwnerKey":[B
    .end local v10    # "encryptedOwnerKeyString":Ljava/lang/String;
    .end local v11    # "errorCode":I
    .end local v13    # "jsonString":Ljava/lang/String;
    .end local v16    # "ownerKeyHash":[B
    .end local v17    # "ownerKeyHashString":Ljava/lang/String;
    .end local v19    # "swid":Ljava/lang/String;
    :goto_0
    return-void

    .line 102
    :cond_0
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 104
    .local v12, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v20, "displayName"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_1

    .line 106
    const-string v20, "displayName"

    const-string v21, "displayName"

    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    :goto_1
    const-string v20, "signedOwnerId"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/HashMap;

    .line 115
    .local v18, "pan":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v21, "ownerId"

    const-string v20, "ownerId"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v20

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v21, "ownerIdHash"

    const-string v20, "ownerIdSha1Hmac"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v20

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const-string v20, "signedOwnerKey"

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/HashMap;

    .line 120
    .local v15, "ownerKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v21, "encryptedOwnerKey"

    const-string v20, "encryptedOwnerKey"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v20

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    const-string v21, "ownerKeySHA"

    const-string v20, "ownerKeySHA"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v20

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->deviceId:I

    move/from16 v21, v0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v12}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->registerDevice(ILjava/util/HashMap;)V

    .line 126
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 128
    .local v4, "appEvent":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v20, "event"

    const/16 v21, 0x3

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const-string v20, "device_id"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;->deviceId:I

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    const-string v20, "displayName"

    const-string v21, "displayName"

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    invoke-static {v4}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 136
    .local v6, "appEventJson":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/disney/emagine/app/EmagineApplication;->backgroundHandler()Landroid/os/Handler;

    move-result-object v14

    .line 137
    .local v14, "mHandler":Landroid/os/Handler;
    new-instance v20, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion$1;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion$1;-><init>(Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V

    const-wide/16 v22, 0x1f4

    move-object/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-virtual {v14, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 147
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v20

    const/16 v21, 0xd

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v0, v1, v6}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 110
    .end local v4    # "appEvent":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "appEventJson":Ljava/lang/String;
    .end local v14    # "mHandler":Landroid/os/Handler;
    .end local v15    # "ownerKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v18    # "pan":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    const-string v20, "displayName"

    const-string v21, " "

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1
.end method
