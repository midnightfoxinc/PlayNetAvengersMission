.class public Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
.super Ljava/lang/Object;
.source "AsyncHttpClientConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/AsyncHttpClientConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private acceptAnyCertificate:Z

.field private allowPoolingConnections:Z

.field private allowPoolingSslConnections:Z

.field private applicationThreadPool:Ljava/util/concurrent/ExecutorService;

.field private compressionEnforced:Z

.field private connectTimeout:I

.field private connectionTTL:I

.field private disableUrlEncodingForBoundedRequests:Z

.field private enabledCipherSuites:[Ljava/lang/String;

.field private enabledProtocols:[Ljava/lang/String;

.field private followRedirect:Z

.field private hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private final ioExceptionFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/IOExceptionFilter;",
            ">;"
        }
    .end annotation
.end field

.field private ioThreadMultiplier:I

.field private maxConnections:I

.field private maxConnectionsPerHost:I

.field private maxRedirects:I

.field private maxRequestRetry:I

.field private pooledConnectionIdleTimeout:I

.field private providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHttpProviderConfig",
            "<**>;"
        }
    .end annotation
.end field

.field private proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

.field private readTimeout:I

.field private realm:Lcom/ning/http/client/Realm;

.field private final requestFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/RequestFilter;",
            ">;"
        }
    .end annotation
.end field

.field private requestTimeout:I

.field private final responseFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/ResponseFilter;",
            ">;"
        }
    .end annotation
.end field

.field private sslContext:Ljavax/net/ssl/SSLContext;

.field private strict302Handling:Z

.field private useProxyProperties:Z

.field private useProxySelector:Z

.field private useRelativeURIsWithConnectProxies:Z

.field private userAgent:Ljava/lang/String;

.field private webSocketTimeout:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 493
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 459
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultConnectTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectTimeout:I

    .line 460
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxConnections()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnections:I

    .line 461
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxConnectionsPerHost()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnectionsPerHost:I

    .line 462
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultRequestTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestTimeout:I

    .line 463
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultReadTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->readTimeout:I

    .line 464
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultWebSocketTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->webSocketTimeout:I

    .line 465
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAllowPoolingConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingConnections:Z

    .line 466
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAllowPoolingSslConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingSslConnections:Z

    .line 467
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultPooledConnectionIdleTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->pooledConnectionIdleTimeout:I

    .line 468
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultConnectionTTL()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectionTTL:I

    .line 471
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAcceptAnyCertificate()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->acceptAnyCertificate:Z

    .line 472
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultFollowRedirect()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->followRedirect:Z

    .line 473
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxRedirects()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRedirects:I

    .line 474
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultStrict302Handling()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->strict302Handling:Z

    .line 475
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 476
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseProxySelector()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxySelector:Z

    .line 477
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseProxyProperties()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxyProperties:Z

    .line 478
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseRelativeURIsWithConnectProxies()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useRelativeURIsWithConnectProxies:Z

    .line 479
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultCompressionEnforced()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->compressionEnforced:Z

    .line 480
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUserAgent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->userAgent:Ljava/lang/String;

    .line 483
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestFilters:Ljava/util/List;

    .line 484
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->responseFilters:Ljava/util/List;

    .line 485
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioExceptionFilters:Ljava/util/List;

    .line 486
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxRequestRetry()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRequestRetry:I

    .line 487
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultDisableUrlEncodingForBoundRequests()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->disableUrlEncodingForBoundedRequests:Z

    .line 488
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultIoThreadMultiplier()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioThreadMultiplier:I

    .line 494
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 2
    .param p1, "prototype"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 908
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 459
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultConnectTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectTimeout:I

    .line 460
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxConnections()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnections:I

    .line 461
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxConnectionsPerHost()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnectionsPerHost:I

    .line 462
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultRequestTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestTimeout:I

    .line 463
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultReadTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->readTimeout:I

    .line 464
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultWebSocketTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->webSocketTimeout:I

    .line 465
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAllowPoolingConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingConnections:Z

    .line 466
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAllowPoolingSslConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingSslConnections:Z

    .line 467
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultPooledConnectionIdleTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->pooledConnectionIdleTimeout:I

    .line 468
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultConnectionTTL()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectionTTL:I

    .line 471
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAcceptAnyCertificate()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->acceptAnyCertificate:Z

    .line 472
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultFollowRedirect()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->followRedirect:Z

    .line 473
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxRedirects()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRedirects:I

    .line 474
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultStrict302Handling()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->strict302Handling:Z

    .line 475
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 476
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseProxySelector()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxySelector:Z

    .line 477
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseProxyProperties()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxyProperties:Z

    .line 478
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseRelativeURIsWithConnectProxies()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useRelativeURIsWithConnectProxies:Z

    .line 479
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultCompressionEnforced()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->compressionEnforced:Z

    .line 480
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUserAgent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->userAgent:Ljava/lang/String;

    .line 483
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestFilters:Ljava/util/List;

    .line 484
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->responseFilters:Ljava/util/List;

    .line 485
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioExceptionFilters:Ljava/util/List;

    .line 486
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxRequestRetry()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRequestRetry:I

    .line 487
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultDisableUrlEncodingForBoundRequests()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->disableUrlEncodingForBoundedRequests:Z

    .line 488
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultIoThreadMultiplier()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioThreadMultiplier:I

    .line 909
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAllowPoolingConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingConnections:Z

    .line 910
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;

    .line 911
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectTimeout:I

    .line 912
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getPooledConnectionIdleTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->pooledConnectionIdleTimeout:I

    .line 913
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getReadTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->readTimeout:I

    .line 914
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnectionsPerHost()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnectionsPerHost:I

    .line 915
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectionTTL()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectionTTL:I

    .line 916
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRedirects()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRedirects:I

    .line 917
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnections:I

    .line 918
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getProxyServerSelector()Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 919
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->realm:Lcom/ning/http/client/Realm;

    .line 920
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRequestTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestTimeout:I

    .line 921
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 922
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getUserAgent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->userAgent:Ljava/lang/String;

    .line 923
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isFollowRedirect()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->followRedirect:Z

    .line 924
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isCompressionEnforced()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->compressionEnforced:Z

    .line 925
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 927
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 928
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->responseFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 929
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioExceptionFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 931
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestFilters:Ljava/util/List;

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRequestFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 932
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->responseFilters:Ljava/util/List;

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getResponseFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 933
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioExceptionFilters:Ljava/util/List;

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIOExceptionFilters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 935
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isDisableUrlEncodingForBoundedRequests()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->disableUrlEncodingForBoundedRequests:Z

    .line 936
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIoThreadMultiplier()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioThreadMultiplier:I

    .line 937
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRequestRetry()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRequestRetry:I

    .line 938
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAllowPoolingConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingSslConnections:Z

    .line 939
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 940
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isStrict302Handling()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->strict302Handling:Z

    .line 941
    iget-object v0, p1, Lcom/ning/http/client/AsyncHttpClientConfig;->enabledProtocols:[Ljava/lang/String;

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->enabledProtocols:[Ljava/lang/String;

    .line 942
    iget-object v0, p1, Lcom/ning/http/client/AsyncHttpClientConfig;->enabledCipherSuites:[Ljava/lang/String;

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->enabledCipherSuites:[Ljava/lang/String;

    .line 943
    iget-boolean v0, p1, Lcom/ning/http/client/AsyncHttpClientConfig;->acceptAnyCertificate:Z

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->acceptAnyCertificate:Z

    .line 944
    return-void
.end method


# virtual methods
.method public addIOExceptionFilter(Lcom/ning/http/client/filter/IOExceptionFilter;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 1
    .param p1, "ioExceptionFilter"    # Lcom/ning/http/client/filter/IOExceptionFilter;

    .prologue
    .line 755
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioExceptionFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 756
    return-object p0
.end method

.method public addRequestFilter(Lcom/ning/http/client/filter/RequestFilter;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 1
    .param p1, "requestFilter"    # Lcom/ning/http/client/filter/RequestFilter;

    .prologue
    .line 708
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 709
    return-object p0
.end method

.method public addResponseFilter(Lcom/ning/http/client/filter/ResponseFilter;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 1
    .param p1, "responseFilter"    # Lcom/ning/http/client/filter/ResponseFilter;

    .prologue
    .line 731
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->responseFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 732
    return-object p0
.end method

.method public build()Lcom/ning/http/client/AsyncHttpClientConfig;
    .locals 34

    .prologue
    .line 952
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    if-nez v1, :cond_0

    .line 953
    new-instance v1, Lcom/ning/http/client/AsyncHttpClientConfig$Builder$1;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder$1;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig$Builder;)V

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 962
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    if-nez v1, :cond_1

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxySelector:Z

    if-eqz v1, :cond_1

    .line 963
    invoke-static {}, Lcom/ning/http/util/ProxyUtils;->getJdkDefaultProxyServerSelector()Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 965
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    if-nez v1, :cond_2

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxyProperties:Z

    if-eqz v1, :cond_2

    .line 966
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Ljava/util/Properties;)Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 968
    :cond_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    if-nez v1, :cond_3

    .line 969
    sget-object v1, Lcom/ning/http/client/ProxyServerSelector;->NO_PROXY_SELECTOR:Lcom/ning/http/client/ProxyServerSelector;

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 971
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->acceptAnyCertificate:Z

    if-eqz v1, :cond_4

    .line 972
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 974
    :cond_4
    new-instance v1, Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectTimeout:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnections:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnectionsPerHost:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestTimeout:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->readTimeout:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->webSocketTimeout:I

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingConnections:Z

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingSslConnections:Z

    move-object/from16 v0, p0

    iget v10, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->pooledConnectionIdleTimeout:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectionTTL:I

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->sslContext:Ljavax/net/ssl/SSLContext;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->acceptAnyCertificate:Z

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->followRedirect:Z

    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRedirects:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->strict302Handling:Z

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useRelativeURIsWithConnectProxies:Z

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->compressionEnforced:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->userAgent:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->realm:Lcom/ning/http/client/Realm;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestFilters:Ljava/util/List;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->responseFilters:Ljava/util/List;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioExceptionFilters:Ljava/util/List;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRequestRetry:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->disableUrlEncodingForBoundedRequests:Z

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioThreadMultiplier:I

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->enabledProtocols:[Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->enabledCipherSuites:[Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-direct/range {v1 .. v33}, Lcom/ning/http/client/AsyncHttpClientConfig;-><init>(IIIIIIZZIILjavax/net/ssl/SSLContext;Ljavax/net/ssl/HostnameVerifier;ZZIZLjava/util/concurrent/ExecutorService;Lcom/ning/http/client/ProxyServerSelector;ZZLjava/lang/String;Lcom/ning/http/client/Realm;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZI[Ljava/lang/String;[Ljava/lang/String;Lcom/ning/http/client/AsyncHttpProviderConfig;Lcom/ning/http/client/AsyncHttpClientConfig$1;)V

    return-object v1
.end method

.method public removeIOExceptionFilter(Lcom/ning/http/client/filter/IOExceptionFilter;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 1
    .param p1, "ioExceptionFilter"    # Lcom/ning/http/client/filter/IOExceptionFilter;

    .prologue
    .line 767
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioExceptionFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 768
    return-object p0
.end method

.method public removeRequestFilter(Lcom/ning/http/client/filter/RequestFilter;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 1
    .param p1, "requestFilter"    # Lcom/ning/http/client/filter/RequestFilter;

    .prologue
    .line 719
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 720
    return-object p0
.end method

.method public removeResponseFilter(Lcom/ning/http/client/filter/ResponseFilter;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 1
    .param p1, "responseFilter"    # Lcom/ning/http/client/filter/ResponseFilter;

    .prologue
    .line 743
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->responseFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 744
    return-object p0
.end method

.method public setAcceptAnyCertificate(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "acceptAnyCertificate"    # Z

    .prologue
    .line 889
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->acceptAnyCertificate:Z

    .line 890
    return-object p0
.end method

.method public setAllowPoolingConnections(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "allowPoolingConnections"    # Z

    .prologue
    .line 629
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingConnections:Z

    .line 630
    return-object p0
.end method

.method public setAllowPoolingSslConnections(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "allowPoolingSslConnections"    # Z

    .prologue
    .line 789
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->allowPoolingSslConnections:Z

    .line 790
    return-object p0
.end method

.method public setAsyncHttpClientProviderConfig(Lcom/ning/http/client/AsyncHttpProviderConfig;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHttpProviderConfig",
            "<**>;)",
            "Lcom/ning/http/client/AsyncHttpClientConfig$Builder;"
        }
    .end annotation

    .prologue
    .line 686
    .local p1, "providerConfig":Lcom/ning/http/client/AsyncHttpProviderConfig;, "Lcom/ning/http/client/AsyncHttpProviderConfig<**>;"
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;

    .line 687
    return-object p0
.end method

.method public setCompressionEnforced(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "compressionEnforced"    # Z

    .prologue
    .line 607
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->compressionEnforced:Z

    .line 608
    return-object p0
.end method

.method public setConnectTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "connectTimeOut"    # I

    .prologue
    .line 525
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectTimeout:I

    .line 526
    return-object p0
.end method

.method public setConnectionTTL(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "connectionTTL"    # I

    .prologue
    .line 884
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->connectionTTL:I

    .line 885
    return-object p0
.end method

.method public setDisableUrlEncodingForBoundedRequests(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "disableUrlEncodingForBoundedRequests"    # Z

    .prologue
    .line 800
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->disableUrlEncodingForBoundedRequests:Z

    .line 801
    return-object p0
.end method

.method public setEnabledCipherSuites([Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "enabledCipherSuites"    # [Ljava/lang/String;

    .prologue
    .line 899
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->enabledCipherSuites:[Ljava/lang/String;

    .line 900
    return-object p0
.end method

.method public setEnabledProtocols([Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "enabledProtocols"    # [Ljava/lang/String;

    .prologue
    .line 894
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->enabledProtocols:[Ljava/lang/String;

    .line 895
    return-object p0
.end method

.method public setExecutorService(Ljava/util/concurrent/ExecutorService;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "applicationThreadPool"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 642
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 643
    return-object p0
.end method

.method public setFollowRedirect(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "followRedirect"    # Z

    .prologue
    .line 585
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->followRedirect:Z

    .line 586
    return-object p0
.end method

.method public setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "hostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;

    .prologue
    .line 845
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 846
    return-object p0
.end method

.method public setIOThreadMultiplier(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "multiplier"    # I

    .prologue
    .line 834
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->ioThreadMultiplier:I

    .line 835
    return-object p0
.end method

.method public setMaxConnections(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "maxConnections"    # I

    .prologue
    .line 503
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnections:I

    .line 504
    return-object p0
.end method

.method public setMaxConnectionsPerHost(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "maxConnectionsPerHost"    # I

    .prologue
    .line 514
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxConnectionsPerHost:I

    .line 515
    return-object p0
.end method

.method public setMaxRedirects(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "maxRedirects"    # I

    .prologue
    .line 596
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRedirects:I

    .line 597
    return-object p0
.end method

.method public setMaxRequestRetry(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "maxRequestRetry"    # I

    .prologue
    .line 778
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->maxRequestRetry:I

    .line 779
    return-object p0
.end method

.method public setPooledConnectionIdleTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "pooledConnectionIdleTimeout"    # I

    .prologue
    .line 563
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->pooledConnectionIdleTimeout:I

    .line 564
    return-object p0
.end method

.method public setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 1
    .param p1, "proxyServer"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 664
    invoke-static {p1}, Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 665
    return-object p0
.end method

.method public setProxyServerSelector(Lcom/ning/http/client/ProxyServerSelector;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "proxyServerSelector"    # Lcom/ning/http/client/ProxyServerSelector;

    .prologue
    .line 653
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 654
    return-object p0
.end method

.method public setReadTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "readTimeout"    # I

    .prologue
    .line 549
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->readTimeout:I

    .line 550
    return-object p0
.end method

.method public setRealm(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "realm"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 697
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->realm:Lcom/ning/http/client/Realm;

    .line 698
    return-object p0
.end method

.method public setRequestTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "requestTimeout"    # I

    .prologue
    .line 574
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->requestTimeout:I

    .line 575
    return-object p0
.end method

.method public setSSLContext(Ljavax/net/ssl/SSLContext;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 675
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 676
    return-object p0
.end method

.method public setStrict302Handling(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "strict302Handling"    # Z

    .prologue
    .line 860
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->strict302Handling:Z

    .line 861
    return-object p0
.end method

.method public setUseProxyProperties(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "useProxyProperties"    # Z

    .prologue
    .line 829
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxyProperties:Z

    .line 830
    return-object p0
.end method

.method public setUseProxySelector(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "useProxySelector"    # Z

    .prologue
    .line 813
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useProxySelector:Z

    .line 814
    return-object p0
.end method

.method public setUseRelativeURIsWithConnectProxies(Z)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "useRelativeURIsWithConnectProxies"    # Z

    .prologue
    .line 873
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->useRelativeURIsWithConnectProxies:Z

    .line 874
    return-object p0
.end method

.method public setUserAgent(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 618
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->userAgent:Ljava/lang/String;

    .line 619
    return-object p0
.end method

.method public setWebSocketTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    .locals 0
    .param p1, "webSocketTimeout"    # I

    .prologue
    .line 537
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->webSocketTimeout:I

    .line 538
    return-object p0
.end method
