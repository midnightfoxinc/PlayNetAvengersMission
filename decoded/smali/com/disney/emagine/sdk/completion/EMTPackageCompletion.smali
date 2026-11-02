.class public Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;
.super Ljava/lang/Object;
.source "EMTPackageCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

.field deviceId:I

.field manifestItem:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;Ljava/util/HashMap;I)V
    .locals 1
    .param p1, "del"    # Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;
    .param p3, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->deviceId:I

    .line 33
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    .line 34
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->manifestItem:Ljava/util/HashMap;

    .line 35
    iput p3, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->deviceId:I

    .line 36
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 94
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZII)V
    .locals 12
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "percentage"    # I
    .param p4, "remainingTime"    # I

    .prologue
    .line 41
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 43
    .local v3, "jsonObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "name"

    iget-object v8, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v9, "name"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    const-string v7, "id"

    iget-object v8, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v9, "id"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    const-string v7, "type"

    iget-object v8, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v9, "type"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v7, "percent"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v7, "device_id"

    iget v8, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->deviceId:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    const-string v7, "remaining_time"

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->code()I

    move-result v7

    const/16 v8, 0xc

    if-eq v7, v8, :cond_0

    .line 52
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 54
    .local v2, "errorObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "code"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->code()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-string v7, "domain"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->domain()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v7, "code"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->description()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v7, "error"

    invoke-virtual {v3, v7, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .end local v2    # "errorObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-static {v3}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 61
    .local v0, "data":[B
    const/4 v4, 0x0

    .line 65
    .local v4, "jsonString":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/lang/String;

    const-string v7, "UTF-8"

    invoke-direct {v5, v0, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .end local v4    # "jsonString":Ljava/lang/String;
    .local v5, "jsonString":Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 75
    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    invoke-interface {v7}, Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v7

    iget-object v8, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    invoke-interface {v8}, Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Success in sending "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v11, "name"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    if-nez p1, :cond_1

    .line 80
    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    invoke-interface {v7}, Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v7

    iget-object v8, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    invoke-interface {v8}, Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v8

    const-string v9, "SEND -----> PACKAGE_TRANSFER_COMPLETE"

    invoke-virtual {v7, v8, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    move-result-object v6

    .line 84
    .local v6, "manager":Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    iget-object v8, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;

    iget v9, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->deviceId:I

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->manifestItem:Ljava/util/HashMap;

    invoke-virtual {v6, v7}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestFileName(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v10

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTPackageCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v11, "id"

    invoke-virtual {v7, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v8, v9, v10, v7}, Lcom/disney/emagine/sdk/delegate/EMTMissionCompletionDelegate;->packageTransferComplete(ILjava/lang/String;Ljava/lang/String;)V

    .line 88
    .end local v6    # "manager":Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    :cond_1
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v7

    const/4 v8, 0x7

    invoke-virtual {v7, v8, v5}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    move-object v4, v5

    .line 89
    .end local v5    # "jsonString":Ljava/lang/String;
    .restart local v4    # "jsonString":Ljava/lang/String;
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method
