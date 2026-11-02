.class public final Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
.super Ljava/lang/Object;
.source "SimpleAsyncHttpClient.java"

# interfaces
.implements Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/SimpleAsyncHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private ahc:Lcom/ning/http/client/AsyncHttpClient;

.field private final configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

.field private defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

.field private enableResumableDownload:Z

.field private errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

.field private listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

.field private providerClass:Ljava/lang/String;

.field private proxyHost:Ljava/lang/String;

.field private proxyPassword:Ljava/lang/String;

.field private proxyPort:I

.field private proxyPrincipal:Ljava/lang/String;

.field private proxyProtocol:Lcom/ning/http/client/ProxyServer$Protocol;

.field private realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

.field private final requestBuilder:Lcom/ning/http/client/RequestBuilder;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 414
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 400
    new-instance v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-direct {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 401
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

    .line 402
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyProtocol:Lcom/ning/http/client/ProxyServer$Protocol;

    .line 403
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyHost:Ljava/lang/String;

    .line 404
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPrincipal:Ljava/lang/String;

    .line 405
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPassword:Ljava/lang/String;

    .line 406
    const/16 v0, 0x50

    iput v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPort:I

    .line 407
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    .line 408
    iput-boolean v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->enableResumableDownload:Z

    .line 409
    sget-object v0, Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;->WRITE:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    .line 410
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->ahc:Lcom/ning/http/client/AsyncHttpClient;

    .line 411
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .line 412
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->providerClass:Ljava/lang/String;

    .line 415
    new-instance v0, Lcom/ning/http/client/RequestBuilder;

    const-string v1, "GET"

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/RequestBuilder;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    .line 416
    return-void
.end method

.method private constructor <init>(Lcom/ning/http/client/SimpleAsyncHttpClient;)V
    .locals 2
    .param p1, "client"    # Lcom/ning/http/client/SimpleAsyncHttpClient;

    .prologue
    const/4 v1, 0x0

    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 400
    new-instance v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-direct {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 401
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

    .line 402
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyProtocol:Lcom/ning/http/client/ProxyServer$Protocol;

    .line 403
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyHost:Ljava/lang/String;

    .line 404
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPrincipal:Ljava/lang/String;

    .line 405
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPassword:Ljava/lang/String;

    .line 406
    const/16 v0, 0x50

    iput v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPort:I

    .line 407
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    .line 408
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->enableResumableDownload:Z

    .line 409
    sget-object v0, Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;->WRITE:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    .line 410
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->ahc:Lcom/ning/http/client/AsyncHttpClient;

    .line 411
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .line 412
    iput-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->providerClass:Ljava/lang/String;

    .line 419
    new-instance v0, Lcom/ning/http/client/RequestBuilder;

    invoke-static {p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->access$100(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    .line 420
    invoke-static {p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->access$200(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/ThrowableHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    .line 421
    invoke-static {p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->access$300(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    .line 422
    invoke-static {p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->access$400(Lcom/ning/http/client/SimpleAsyncHttpClient;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->enableResumableDownload:Z

    .line 423
    invoke-static {p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->access$500(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/AsyncHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->ahc:Lcom/ning/http/client/AsyncHttpClient;

    .line 424
    invoke-static {p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->access$600(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .line 425
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/SimpleAsyncHttpClient;Lcom/ning/http/client/SimpleAsyncHttpClient$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/SimpleAsyncHttpClient;
    .param p2, "x1"    # Lcom/ning/http/client/SimpleAsyncHttpClient$1;

    .prologue
    .line 397
    invoke-direct {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;-><init>(Lcom/ning/http/client/SimpleAsyncHttpClient;)V

    return-void
.end method

.method private realm()Lcom/ning/http/client/Realm$RealmBuilder;
    .locals 1

    .prologue
    .line 632
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

    if-nez v0, :cond_0

    .line 633
    new-instance v0, Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-direct {v0}, Lcom/ning/http/client/Realm$RealmBuilder;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

    .line 635
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

    return-object v0
.end method


# virtual methods
.method public addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "part"    # Lcom/ning/http/client/multipart/Part;

    .prologue
    .line 428
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilder;

    .line 429
    return-object p0
.end method

.method public bridge synthetic addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/multipart/Part;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "cookie"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 433
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilder;

    .line 434
    return-object p0
.end method

.method public bridge synthetic addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 443
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 444
    return-object p0
.end method

.method public bridge synthetic addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 397
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 438
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 439
    return-object p0
.end method

.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 397
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 448
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 449
    return-object p0
.end method

.method public bridge synthetic addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 397
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/ning/http/client/SimpleAsyncHttpClient;
    .locals 10

    .prologue
    .line 669
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

    if-eqz v1, :cond_0

    .line 670
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    iget-object v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realmBuilder:Lcom/ning/http/client/Realm$RealmBuilder;

    invoke-virtual {v2}, Lcom/ning/http/client/Realm$RealmBuilder;->build()Lcom/ning/http/client/Realm;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setRealm(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 673
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyHost:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 674
    iget-object v6, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    new-instance v0, Lcom/ning/http/client/ProxyServer;

    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyProtocol:Lcom/ning/http/client/ProxyServer$Protocol;

    iget-object v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyHost:Ljava/lang/String;

    iget v3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPort:I

    iget-object v4, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPrincipal:Ljava/lang/String;

    iget-object v5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPassword:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/ProxyServer;-><init>(Lcom/ning/http/client/ProxyServer$Protocol;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 677
    :cond_1
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    new-instance v2, Lcom/ning/http/client/resumable/ResumableIOExceptionFilter;

    invoke-direct {v2}, Lcom/ning/http/client/resumable/ResumableIOExceptionFilter;-><init>()V

    invoke-virtual {v1, v2}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->addIOExceptionFilter(Lcom/ning/http/client/filter/IOExceptionFilter;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 679
    new-instance v0, Lcom/ning/http/client/SimpleAsyncHttpClient;

    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->build()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    iget-object v3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    iget-object v4, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    iget-boolean v5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->enableResumableDownload:Z

    iget-object v6, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->ahc:Lcom/ning/http/client/AsyncHttpClient;

    iget-object v7, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    iget-object v8, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->providerClass:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct/range {v0 .. v9}, Lcom/ning/http/client/SimpleAsyncHttpClient;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/ThrowableHandler;Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;ZLcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/simple/SimpleAHCTransferListener;Ljava/lang/String;Lcom/ning/http/client/SimpleAsyncHttpClient$1;)V

    .line 681
    .local v0, "sc":Lcom/ning/http/client/SimpleAsyncHttpClient;
    return-object v0
.end method

.method public setAcceptAnyCertificate(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "acceptAnyCertificate"    # Z

    .prologue
    .line 663
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setAcceptAnyCertificate(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 664
    return-object p0
.end method

.method public setAllowPoolingConnections(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "allowPoolingConnections"    # Z

    .prologue
    .line 533
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setAllowPoolingConnections(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 534
    return-object p0
.end method

.method public setCompressionEnforced(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "compressionEnabled"    # Z

    .prologue
    .line 523
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setCompressionEnforced(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 524
    return-object p0
.end method

.method public setConnectTimeout(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "connectTimeout"    # I

    .prologue
    .line 503
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setConnectTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 504
    return-object p0
.end method

.method public setDefaultThrowableHandler(Lcom/ning/http/client/ThrowableHandler;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;

    .prologue
    .line 608
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    .line 609
    return-object p0
.end method

.method public setErrorDocumentBehaviour(Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "behaviour"    # Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    .prologue
    .line 618
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    .line 619
    return-object p0
.end method

.method public setExecutorService(Ljava/util/concurrent/ExecutorService;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "applicationThreadPool"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 538
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setExecutorService(Ljava/util/concurrent/ExecutorService;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 539
    return-object p0
.end method

.method public setFollowRedirects(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "followRedirects"    # Z

    .prologue
    .line 488
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setFollowRedirects(Z)Lcom/ning/http/client/RequestBuilder;

    .line 489
    return-object p0
.end method

.method public bridge synthetic setFollowRedirects(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Z

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setFollowRedirects(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setFormParams(Ljava/util/List;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;"
        }
    .end annotation

    .prologue
    .line 468
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilder;

    .line 469
    return-object p0
.end method

.method public setFormParams(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;"
        }
    .end annotation

    .prologue
    .line 473
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;

    .line 474
    return-object p0
.end method

.method public bridge synthetic setFormParams(Ljava/util/List;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setFormParams(Ljava/util/List;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setFormParams(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setFormParams(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 453
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 454
    return-object p0
.end method

.method public bridge synthetic setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 397
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 458
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilder;

    .line 459
    return-object p0
.end method

.method public setHeaders(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;"
        }
    .end annotation

    .prologue
    .line 463
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;

    .line 464
    return-object p0
.end method

.method public bridge synthetic setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setHeaders(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setHeaders(Ljava/util/Map;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setListener(Lcom/ning/http/client/simple/SimpleAHCTransferListener;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "listener"    # Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .prologue
    .line 642
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .line 643
    return-object p0
.end method

.method public setMaxRequestRetry(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "maxRequestRetry"    # I

    .prologue
    .line 653
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setMaxRequestRetry(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 654
    return-object p0
.end method

.method public setMaximumConnectionsPerHost(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "defaultMaxConnectionPerHost"    # I

    .prologue
    .line 498
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setMaxConnectionsPerHost(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 499
    return-object p0
.end method

.method public setMaximumConnectionsTotal(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "defaultMaxTotalConnections"    # I

    .prologue
    .line 493
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setMaxConnections(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 494
    return-object p0
.end method

.method public setMaximumNumberOfRedirects(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "maxDefaultRedirects"    # I

    .prologue
    .line 518
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setMaxRedirects(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 519
    return-object p0
.end method

.method public setPooledConnectionIdleTimeout(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "pooledConnectionIdleTimeout"    # I

    .prologue
    .line 508
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setPooledConnectionIdleTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 509
    return-object p0
.end method

.method public setProviderClass(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "providerClass"    # Ljava/lang/String;

    .prologue
    .line 658
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->providerClass:Ljava/lang/String;

    .line 659
    return-object p0
.end method

.method public setProxyHost(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 588
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyHost:Ljava/lang/String;

    .line 589
    return-object p0
.end method

.method public setProxyPassword(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 598
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPassword:Ljava/lang/String;

    .line 599
    return-object p0
.end method

.method public setProxyPort(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 603
    iput p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPort:I

    .line 604
    return-object p0
.end method

.method public setProxyPrincipal(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "principal"    # Ljava/lang/String;

    .prologue
    .line 593
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyPrincipal:Ljava/lang/String;

    .line 594
    return-object p0
.end method

.method public setProxyProtocol(Lcom/ning/http/client/ProxyServer$Protocol;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "protocol"    # Lcom/ning/http/client/ProxyServer$Protocol;

    .prologue
    .line 583
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->proxyProtocol:Lcom/ning/http/client/ProxyServer$Protocol;

    .line 584
    return-object p0
.end method

.method public setRealmCharset(Ljava/nio/charset/Charset;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 578
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realm()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Realm$RealmBuilder;->setCharset(Ljava/nio/charset/Charset;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 579
    return-object p0
.end method

.method public setRealmName(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "realmName"    # Ljava/lang/String;

    .prologue
    .line 568
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realm()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Realm$RealmBuilder;->setRealmName(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 569
    return-object p0
.end method

.method public setRealmNtlmDomain(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "ntlmDomain"    # Ljava/lang/String;

    .prologue
    .line 548
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realm()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Realm$RealmBuilder;->setNtlmDomain(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 549
    return-object p0
.end method

.method public setRealmPassword(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 558
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realm()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Realm$RealmBuilder;->setPassword(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 559
    return-object p0
.end method

.method public setRealmPrincipal(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "principal"    # Ljava/lang/String;

    .prologue
    .line 553
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realm()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Realm$RealmBuilder;->setPrincipal(Ljava/lang/String;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 554
    return-object p0
.end method

.method public setRealmScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "scheme"    # Lcom/ning/http/client/Realm$AuthScheme;

    .prologue
    .line 563
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realm()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Realm$RealmBuilder;->setScheme(Lcom/ning/http/client/Realm$AuthScheme;)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 564
    return-object p0
.end method

.method public setRealmUsePreemptiveAuth(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "usePreemptiveAuth"    # Z

    .prologue
    .line 573
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->realm()Lcom/ning/http/client/Realm$RealmBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Realm$RealmBuilder;->setUsePreemptiveAuth(Z)Lcom/ning/http/client/Realm$RealmBuilder;

    .line 574
    return-object p0
.end method

.method public setRequestTimeout(I)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "defaultRequestTimeout"    # I

    .prologue
    .line 513
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setRequestTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 514
    return-object p0
.end method

.method public setResumableDownload(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 0
    .param p1, "enableResumableDownload"    # Z

    .prologue
    .line 627
    iput-boolean p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->enableResumableDownload:Z

    .line 628
    return-object p0
.end method

.method public bridge synthetic setResumableDownload(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Z

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setResumableDownload(Z)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setSSLContext(Ljavax/net/ssl/SSLContext;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 543
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setSSLContext(Ljavax/net/ssl/SSLContext;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 544
    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 478
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 479
    return-object p0
.end method

.method public bridge synthetic setUrl(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setUserAgent(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 528
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->configBuilder:Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setUserAgent(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    .line 529
    return-object p0
.end method

.method public setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;
    .locals 1
    .param p1, "virtualHost"    # Ljava/lang/String;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 484
    return-object p0
.end method

.method public bridge synthetic setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 397
    invoke-virtual {p0, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;->setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method
