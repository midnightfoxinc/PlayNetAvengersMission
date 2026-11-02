.class public Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;
.super Ljava/lang/Object;
.source "EMTManifestCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/transitionkit/TKConstants;
.implements Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;ILjava/util/HashMap;)V
    .locals 1
    .param p1, "del"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p2, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;",
            "I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p3, "item":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->deviceId:I

    .line 33
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 34
    iput p2, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->deviceId:I

    .line 35
    iput-object p3, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->manifestItem:Ljava/util/HashMap;

    .line 36
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 98
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZII)V
    .locals 11
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "percentage"    # I
    .param p4, "remainingTime"    # I

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x7

    .line 41
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 43
    .local v2, "jsonObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "name"

    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v6, "name"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    const-string v4, "id"

    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v6, "id"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    const-string v4, "type"

    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v6, "type"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v4, "percent"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v4, "device_id"

    iget v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->deviceId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    const-string v4, "remaining_time"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    invoke-static {v2}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "jsonString":Ljava/lang/String;
    sget-boolean v4, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    if-nez v3, :cond_0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 53
    :cond_0
    if-eqz p1, :cond_1

    .line 55
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 57
    .local v1, "errorObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "code"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->code()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v4, "domain"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->domain()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    const-string v4, "description"

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->description()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v4, "error"

    invoke-virtual {v2, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    invoke-static {v2}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 65
    .local v0, "data":[B
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v3

    .line 67
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v4

    invoke-virtual {v4, v9, v3}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 69
    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateMachine()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v4

    const-string v5, "Device Ready"

    invoke-virtual {v4, v5, v10}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 93
    .end local v0    # "data":[B
    .end local v1    # "errorObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-void

    .line 74
    :cond_1
    if-eqz p2, :cond_2

    .line 76
    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Success in sending "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->manifestItem:Ljava/util/HashMap;

    const-string v8, "name"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    if-nez p1, :cond_2

    .line 81
    const/16 v4, 0x64

    if-lt p3, v4, :cond_2

    .line 83
    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v5

    const-string v6, "SEND -----> PACKAGE_TRANSFER_COMPLETE"

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->deviceId:I

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->manifestItem:Ljava/util/HashMap;

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->packageTransferComplete(ILjava/util/HashMap;)V

    .line 87
    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTManifestCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v4}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->stateMachine()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v4

    const-string v5, "Send Mission Done"

    invoke-virtual {v4, v5, v10}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 92
    :cond_2
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v4

    invoke-virtual {v4, v9, v3}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0
.end method
