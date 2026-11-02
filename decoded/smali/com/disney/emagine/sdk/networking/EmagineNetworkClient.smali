.class public Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
.super Ljava/lang/Object;
.source "EmagineNetworkClient.java"


# static fields
.field public static final ACCESSTOKEN_KEY:Ljava/lang/String; = "lastUsedAccessToken"

.field public static final ANALYTICS_DICTIONARY_KEY:Ljava/lang/String; = "EM_ANALYTICS_FILES"

.field public static final ANALYTICS_KEYCHAIN_SERVICE:Ljava/lang/String; = "EM_ANALYTICS_SERVICE"

.field public static final KEYCHAIN_SERVICE:Ljava/lang/String; = "eMagine"

.field public static final RTO_HOST:Ljava/lang/String; = "stage.emagine.starwave.com"

.field public static final RTO_PORT:Ljava/lang/String; = ""

.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;


# instance fields
.field private PRODUCTION_RELEASE:Z

.field public accessToken:Ljava/lang/String;

.field private final mClients:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/disney/emagine/sdk/networking/EMTRestClient;",
            ">;"
        }
    .end annotation
.end field

.field public mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field public proxyToken:Ljava/lang/String;

.field public rtoHost:Ljava/lang/String;

.field private rtoHostWhiteList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public rtoPort:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-boolean v6, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->PRODUCTION_RELEASE:Z

    .line 72
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mClients:Ljava/util/List;

    .line 76
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->PRODUCTION_RELEASE:Z

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "stage.emagine.starwave.com"

    aput-object v2, v1, v6

    const-string v2, "int.api.disney.private/dev/playmation"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "int.api.disney.private/stage/playmation"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "int.api.disney.private/qa/playmation"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHostWhiteList:Ljava/util/ArrayList;

    .line 89
    :goto_0
    new-instance v0, Ljava/lang/String;

    const-string v1, "stage.emagine.starwave.com"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    .line 90
    new-instance v0, Ljava/lang/String;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoPort:Ljava/lang/String;

    .line 91
    const-string v0, "lastUsedAccessToken"

    const-string v1, "eMagine"

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->stringForKeyService(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->accessToken:Ljava/lang/String;

    .line 92
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 94
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Retrieved from keychain: accessToken = \"%s\""

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->accessToken:Ljava/lang/String;

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-void

    .line 85
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "api.disney.com/playmation"

    aput-object v2, v1, v6

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHostWhiteList:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->notifyAppFirmwareReady(ILjava/lang/String;)V

    return-void
.end method

.method private notifyAppFirmwareReady(ILjava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 565
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 567
    .local v0, "appEventDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "device_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    const-string v2, "event"

    const/16 v3, 0x66

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    const-string v2, "fwpFilename"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 573
    .local v1, "jsonString":Ljava/lang/String;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    const/16 v3, 0x15

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 576
    return-void
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .locals 1

    .prologue
    .line 99
    sget-object v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->instance:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->instance:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    .line 104
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->instance:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 5

    .prologue
    .line 208
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cancelling "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mClients:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " EMTRestClient objects."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mClients:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .line 210
    .local v0, "client":Lcom/disney/emagine/sdk/networking/EMTRestClient;
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->cancel()V

    goto :goto_0

    .line 212
    .end local v0    # "client":Lcom/disney/emagine/sdk/networking/EMTRestClient;
    :cond_0
    return-void
.end method

.method public checkAndUpdateAccessToken(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p1, "arrayPair":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    return-void
.end method

.method public downloadFirmware(ILjava/util/HashMap;)V
    .locals 10
    .param p1, "deviceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 588
    .local p2, "metadata":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 589
    .local v7, "filePath":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "firmwareName"

    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".fwp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 591
    .local v6, "fileName":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTFileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 593
    invoke-direct {p0, p1, v6}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->notifyAppFirmwareReady(ILjava/lang/String;)V

    .line 684
    :goto_0
    return-void

    .line 597
    :cond_0
    const-string v1, "filePath"

    invoke-virtual {p2, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    const-string v1, "downloadUrl"

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 601
    .local v9, "url":Ljava/lang/String;
    const-string v1, "firmwareData"

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 603
    .local v3, "contents":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v8, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v8}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 605
    .local v8, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v8}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 608
    new-instance v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;

    move-object v1, p0

    move v2, p1

    move-object v4, p2

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$8;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/util/HashMap;Ljava/util/HashMap;I)V

    .line 683
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    const/4 v2, 0x0

    invoke-virtual {v8}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v1, v9, v2, v4, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    goto :goto_0
.end method

.method public getContentDictionaryFromKeychain()Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 688
    const-string v2, "EM_ANALYTICS_FILES"

    const-string v3, "EM_ANALYTICS_SERVICE"

    invoke-static {v2, v3}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->dataForKeyService(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 690
    .local v0, "data":[B
    const/4 v1, 0x0

    .line 692
    .local v1, "dataDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 694
    new-instance v1, Ljava/util/HashMap;

    .end local v1    # "dataDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 701
    .restart local v1    # "dataDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-object v1

    .line 698
    :cond_0
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromByteArray([B)Ljava/util/HashMap;

    move-result-object v1

    goto :goto_0
.end method

.method public getOwnerKey()V
    .locals 8

    .prologue
    .line 713
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/runtimeorchestrator/v1/user/ownerKey"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 715
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    const-string v5, "sending GET: [%s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 717
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 719
    .local v1, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 721
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 722
    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 724
    new-instance v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$9;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$9;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    .line 774
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v3, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v3, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    const/4 v4, 0x0

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v3, v2, v4, v5, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 775
    return-void
.end method

.method public getRegisterUserTokenWithOwnerId(Ljava/lang/String;ISLcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;)V
    .locals 12
    .param p1, "ownerId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I
    .param p3, "deviceType"    # S
    .param p4, "success"    # Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;

    .prologue
    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/runtimeorchestrator/v1/register/registerDevice/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 230
    .local v11, "url":Ljava/lang/String;
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 232
    .local v10, "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "deviceType"

    new-instance v2, Ljava/lang/Short;

    invoke-direct {v2, p3}, Ljava/lang/Short;-><init>(S)V

    invoke-virtual {v10, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    invoke-static {v10}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 236
    .local v9, "jsonContent":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "sending POST: [%s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v11, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    new-instance v8, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v8}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 240
    .local v8, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v8}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 242
    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v8, v1, v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 244
    new-instance v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;

    move-object v1, p0

    move v2, p2

    move v3, p3

    move-object v4, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p4

    move v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$2;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ISLjava/lang/String;Ljava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;I)V

    .line 289
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    const/4 v3, 0x0

    invoke-virtual {v8}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v4

    move-object v2, v11

    move-object v5, v9

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->postAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 290
    return-void
.end method

.method public handleNetworkError(I[B)V
    .locals 6
    .param p1, "statusCode"    # I
    .param p2, "content"    # [B

    .prologue
    .line 141
    invoke-static {p2}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v1

    .line 143
    .local v1, "response":Ljava/lang/String;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Network Error Code    = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Localized Description = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    const/16 v2, 0x191

    if-ne p1, v2, :cond_0

    const/16 v0, 0x26

    .line 148
    .local v0, "appEvent":I
    :goto_0
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 149
    return-void

    .line 146
    .end local v0    # "appEvent":I
    :cond_0
    const/16 v0, 0xc

    goto :goto_0
.end method

.method removeRestClient(Lcom/disney/emagine/sdk/networking/EMTRestClient;)V
    .locals 1
    .param p1, "client"    # Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mClients:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 219
    return-void
.end method

.method public requestFirmwareMetadata(I)V
    .locals 9
    .param p1, "deviceId"    # I

    .prologue
    const/4 v8, 0x0

    .line 505
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/runtimeorchestrator/v1/entitlement/firmware/metadata/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 507
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    const-string v5, "sending GET: [%s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 511
    .local v1, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 513
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 514
    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 516
    new-instance v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;

    invoke-direct {v0, p0, p1, v8, p1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$7;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;I)V

    .line 560
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v3, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v3, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v3, v2, v8, v4, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 561
    return-void
.end method

.method public reregisterDeviceId(I)V
    .locals 11
    .param p1, "deviceId"    # I

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 297
    const-string v4, "register/info"

    .line 298
    .local v4, "registerPath":Ljava/lang/String;
    const-string v5, "https://%s/runtimeorchestrator/v1/%s/%d"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    aput-object v7, v6, v10

    const-string v7, "register/info"

    aput-object v7, v6, v9

    const/4 v7, 0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 299
    .local v1, "getURL":Ljava/lang/String;
    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "sending GET: [%s]"

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    new-instance v3, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v3}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 303
    .local v3, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 305
    const-string v5, "Content-Type"

    const-string v6, "application/json"

    invoke-virtual {v3, v5, v6}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 306
    new-instance v0, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v5

    invoke-direct {v0, v5, p1}, Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V

    .line 308
    .local v0, "completion":Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;
    new-instance v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$3;

    invoke-direct {v2, p0, p1, v0, v0}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$3;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V

    .line 330
    .local v2, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v5, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v5, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    const/4 v6, 0x0

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v5, v1, v6, v7, v2}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 331
    return-void
.end method

.method public sendHeartbeat(II)V
    .locals 10
    .param p1, "deviceId"    # I
    .param p2, "firmwareVersion"    # I

    .prologue
    const/4 v3, 0x0

    .line 425
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/runtimeorchestrator/v1/experience/hasNewFirmware/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 427
    .local v9, "url":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    const-string v4, "sending PUT: [%s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v9, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    new-instance v7, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v7}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 431
    .local v7, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v7}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 433
    const-string v1, "Accept"

    const-string v2, "application/json"

    invoke-virtual {v7, v1, v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 434
    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v7, v1, v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 436
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{\"installedFirmware\":\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\"}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 438
    .local v8, "jsonBody":Ljava/lang/String;
    new-instance v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;

    move-object v1, p0

    move v2, p1

    move v4, p2

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$6;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;II)V

    .line 500
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v1, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    invoke-virtual {v7}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v4

    move-object v2, v9

    move-object v5, v8

    move-object v6, v0

    invoke-virtual/range {v1 .. v6}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->putAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 501
    return-void
.end method

.method public sendOwnerIdRequest(Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;)V
    .locals 8
    .param p1, "completion"    # Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;

    .prologue
    .line 386
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/runtimeorchestrator/v1/register/getOwnerId"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 388
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    const-string v5, "sending GET: [%s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 392
    .local v1, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 394
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 395
    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 397
    new-instance v0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$5;

    invoke-direct {v0, p0, p1, p1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$5;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;Ljava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTOwnerIdRequestCompletion;)V

    .line 420
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v3, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v3, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    const/4 v4, 0x0

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v3, v2, v4, v5, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 421
    return-void
.end method

.method public sendRegisterHashToken(Ljava/lang/String;ILcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V
    .locals 11
    .param p1, "hashToken"    # Ljava/lang/String;
    .param p2, "deviceId"    # I
    .param p3, "completion"    # Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;

    .prologue
    .line 335
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/runtimeorchestrator/v1/register/verifyTokenHash/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 337
    .local v1, "url":Ljava/lang/String;
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "sending POST: [%s]"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-static {v3, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 341
    .local v7, "jsonDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "tokenHash"

    invoke-virtual {v7, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    invoke-static {v7}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 345
    .local v4, "jsonContent":Ljava/lang/String;
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "jsonRequest is "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    new-instance v6, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v6}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 349
    .local v6, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v6}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 351
    const-string v0, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v6, v0, v2}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 353
    new-instance v5, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;

    invoke-direct {v5, p0, p2, p3, p3}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$4;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTRegisterHashTokenCompletion;)V

    .line 381
    .local v5, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    const/4 v2, 0x0

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual/range {v0 .. v5}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->postAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 382
    return-void
.end method

.method public setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V
    .locals 3
    .param p1, "httpHeaders"    # Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    .prologue
    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FD ACFE12B9-B9FA-4256-A4E9-8646EFAA51B1:C1D65B3197B8854CBC0DA2092D3B55F4722B0EFB6CF9A988, BEARER "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->accessToken:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    .local v0, "authorization":Ljava/lang/String;
    const-string v1, "Authorization"

    invoke-virtual {p1, v1, v0}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 137
    return-void
.end method

.method public unregisterDevice(ILcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;)V
    .locals 11
    .param p1, "deviceId"    # I
    .param p2, "success"    # Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;

    .prologue
    const/4 v2, 0x0

    .line 153
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/runtimeorchestrator/v1/register/unregisterDevice/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 155
    .local v1, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "sending GET: [%s]"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v4, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    new-instance v6, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v6}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 159
    .local v6, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0, v6}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 161
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v6, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 162
    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v6, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 164
    new-instance v5, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;

    invoke-direct {v5, p0, p1, p2, p2}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient$1;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;ILjava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;)V

    .line 202
    .local v5, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    .line 203
    .local v0, "client":Lcom/disney/emagine/sdk/networking/EMTRestClient;
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->mClients:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    invoke-virtual {v6}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v3

    move-object v4, v2

    invoke-virtual/range {v0 .. v5}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->postAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 205
    return-void
.end method

.method public updateAccessToken(Ljava/lang/String;)V
    .locals 1
    .param p1, "accToken"    # Ljava/lang/String;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->accessToken:Ljava/lang/String;

    .line 111
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->accessToken:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->accessToken:Ljava/lang/String;

    .line 115
    :cond_0
    return-void
.end method

.method public updateAccessToken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p2, "proxToken"    # Ljava/lang/String;

    .prologue
    .line 119
    iput-object p2, p0, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->proxyToken:Ljava/lang/String;

    .line 121
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->updateAccessToken(Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method public writeContentDictionaryToKeychain(Ljava/util/HashMap;)V
    .locals 3
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
    .line 706
    .local p1, "contentDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p1}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 708
    .local v0, "contentData":[B
    const-string v1, "EM_ANALYTICS_FILES"

    const-string v2, "EM_ANALYTICS_SERVICE"

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/keystore/UICKeyChainStore;->setDataForKeyService([BLjava/lang/String;Ljava/lang/String;)Z

    .line 709
    return-void
.end method
