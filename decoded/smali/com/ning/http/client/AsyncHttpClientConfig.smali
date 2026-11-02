.class public Lcom/ning/http/client/AsyncHttpClientConfig;
.super Ljava/lang/Object;
.source "AsyncHttpClientConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/AsyncHttpClientConfig$1;,
        Lcom/ning/http/client/AsyncHttpClientConfig$Builder;
    }
.end annotation


# instance fields
.field protected acceptAnyCertificate:Z

.field protected allowPoolingConnections:Z

.field protected allowPoolingSslConnections:Z

.field protected applicationThreadPool:Ljava/util/concurrent/ExecutorService;

.field protected compressionEnforced:Z

.field protected connectTimeout:I

.field protected connectionTTL:I

.field protected disableUrlEncodingForBoundRequests:Z

.field protected enabledCipherSuites:[Ljava/lang/String;

.field protected enabledProtocols:[Ljava/lang/String;

.field protected followRedirect:Z

.field protected hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field protected ioExceptionFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/IOExceptionFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected ioThreadMultiplier:I

.field protected maxConnections:I

.field protected maxConnectionsPerHost:I

.field protected maxRedirects:I

.field protected maxRequestRetry:I

.field protected pooledConnectionIdleTimeout:I

.field protected providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHttpProviderConfig",
            "<**>;"
        }
    .end annotation
.end field

.field protected proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

.field protected readTimeout:I

.field protected realm:Lcom/ning/http/client/Realm;

.field protected requestFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/RequestFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected requestTimeout:I

.field protected responseFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/ResponseFilter;",
            ">;"
        }
    .end annotation
.end field

.field protected sslContext:Ljavax/net/ssl/SSLContext;

.field protected strict302Handling:Z

.field protected useRelativeURIsWithConnectProxies:Z

.field protected userAgent:Ljava/lang/String;

.field protected webSocketTimeout:I


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    return-void
.end method

.method private constructor <init>(IIIIIIZZIILjavax/net/ssl/SSLContext;Ljavax/net/ssl/HostnameVerifier;ZZIZLjava/util/concurrent/ExecutorService;Lcom/ning/http/client/ProxyServerSelector;ZZLjava/lang/String;Lcom/ning/http/client/Realm;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZI[Ljava/lang/String;[Ljava/lang/String;Lcom/ning/http/client/AsyncHttpProviderConfig;)V
    .locals 1
    .param p1, "connectTimeout"    # I
    .param p2, "maxConnections"    # I
    .param p3, "maxConnectionsPerHost"    # I
    .param p4, "requestTimeout"    # I
    .param p5, "readTimeout"    # I
    .param p6, "webSocketIdleTimeout"    # I
    .param p7, "allowPoolingConnection"    # Z
    .param p8, "allowSslConnectionPool"    # Z
    .param p9, "idleConnectionInPoolTimeout"    # I
    .param p10, "maxConnectionLifeTime"    # I
    .param p11, "sslContext"    # Ljavax/net/ssl/SSLContext;
    .param p12, "hostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;
    .param p13, "acceptAnyCertificate"    # Z
    .param p14, "followRedirect"    # Z
    .param p15, "maxRedirects"    # I
    .param p16, "strict302Handling"    # Z
    .param p17, "applicationThreadPool"    # Ljava/util/concurrent/ExecutorService;
    .param p18, "proxyServerSelector"    # Lcom/ning/http/client/ProxyServerSelector;
    .param p19, "useRelativeURIsWithConnectProxies"    # Z
    .param p20, "compressionEnforced"    # Z
    .param p21, "userAgent"    # Ljava/lang/String;
    .param p22, "realm"    # Lcom/ning/http/client/Realm;
    .param p26, "maxRequestRetry"    # I
    .param p27, "disableUrlEncodingForBoundedRequests"    # Z
    .param p28, "ioThreadMultiplier"    # I
    .param p29, "enabledProtocols"    # [Ljava/lang/String;
    .param p30, "enabledCipherSuites"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIIIIZZII",
            "Ljavax/net/ssl/SSLContext;",
            "Ljavax/net/ssl/HostnameVerifier;",
            "ZZIZ",
            "Ljava/util/concurrent/ExecutorService;",
            "Lcom/ning/http/client/ProxyServerSelector;",
            "ZZ",
            "Ljava/lang/String;",
            "Lcom/ning/http/client/Realm;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/RequestFilter;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/ResponseFilter;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/IOExceptionFilter;",
            ">;IZI[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Lcom/ning/http/client/AsyncHttpProviderConfig",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p23, "requestFilters":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/filter/RequestFilter;>;"
    .local p24, "responseFilters":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/filter/ResponseFilter;>;"
    .local p25, "ioExceptionFilters":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/filter/IOExceptionFilter;>;"
    .local p31, "providerConfig":Lcom/ning/http/client/AsyncHttpProviderConfig;, "Lcom/ning/http/client/AsyncHttpProviderConfig<**>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->connectTimeout:I

    .line 119
    iput p2, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxConnections:I

    .line 120
    iput p3, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxConnectionsPerHost:I

    .line 121
    iput p4, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->requestTimeout:I

    .line 122
    iput p5, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->readTimeout:I

    .line 123
    iput p6, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->webSocketTimeout:I

    .line 124
    iput-boolean p7, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->allowPoolingConnections:Z

    .line 125
    iput-boolean p8, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->allowPoolingSslConnections:Z

    .line 126
    iput p9, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->pooledConnectionIdleTimeout:I

    .line 127
    iput p10, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->connectionTTL:I

    .line 128
    iput-object p11, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 129
    iput-object p12, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 130
    iput-boolean p13, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->acceptAnyCertificate:Z

    .line 131
    iput-boolean p14, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->followRedirect:Z

    .line 132
    move/from16 v0, p15

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxRedirects:I

    .line 133
    move/from16 v0, p16

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->strict302Handling:Z

    .line 134
    move-object/from16 v0, p18

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 135
    move/from16 v0, p19

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->useRelativeURIsWithConnectProxies:Z

    .line 136
    move/from16 v0, p20

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->compressionEnforced:Z

    .line 137
    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->userAgent:Ljava/lang/String;

    .line 138
    if-nez p17, :cond_0

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object p17

    .end local p17    # "applicationThreadPool":Ljava/util/concurrent/ExecutorService;
    :cond_0
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 139
    move-object/from16 v0, p22

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->realm:Lcom/ning/http/client/Realm;

    .line 140
    move-object/from16 v0, p23

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->requestFilters:Ljava/util/List;

    .line 141
    move-object/from16 v0, p24

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->responseFilters:Ljava/util/List;

    .line 142
    move-object/from16 v0, p25

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->ioExceptionFilters:Ljava/util/List;

    .line 143
    move/from16 v0, p26

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxRequestRetry:I

    .line 144
    move/from16 v0, p27

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->disableUrlEncodingForBoundRequests:Z

    .line 145
    move/from16 v0, p28

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->ioThreadMultiplier:I

    .line 146
    move-object/from16 v0, p29

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->enabledProtocols:[Ljava/lang/String;

    .line 147
    move-object/from16 v0, p30

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->enabledCipherSuites:[Ljava/lang/String;

    .line 148
    move-object/from16 v0, p31

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;

    .line 149
    return-void
.end method

.method synthetic constructor <init>(IIIIIIZZIILjavax/net/ssl/SSLContext;Ljavax/net/ssl/HostnameVerifier;ZZIZLjava/util/concurrent/ExecutorService;Lcom/ning/http/client/ProxyServerSelector;ZZLjava/lang/String;Lcom/ning/http/client/Realm;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZI[Ljava/lang/String;[Ljava/lang/String;Lcom/ning/http/client/AsyncHttpProviderConfig;Lcom/ning/http/client/AsyncHttpClientConfig$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # Z
    .param p8, "x7"    # Z
    .param p9, "x8"    # I
    .param p10, "x9"    # I
    .param p11, "x10"    # Ljavax/net/ssl/SSLContext;
    .param p12, "x11"    # Ljavax/net/ssl/HostnameVerifier;
    .param p13, "x12"    # Z
    .param p14, "x13"    # Z
    .param p15, "x14"    # I
    .param p16, "x15"    # Z
    .param p17, "x16"    # Ljava/util/concurrent/ExecutorService;
    .param p18, "x17"    # Lcom/ning/http/client/ProxyServerSelector;
    .param p19, "x18"    # Z
    .param p20, "x19"    # Z
    .param p21, "x20"    # Ljava/lang/String;
    .param p22, "x21"    # Lcom/ning/http/client/Realm;
    .param p23, "x22"    # Ljava/util/List;
    .param p24, "x23"    # Ljava/util/List;
    .param p25, "x24"    # Ljava/util/List;
    .param p26, "x25"    # I
    .param p27, "x26"    # Z
    .param p28, "x27"    # I
    .param p29, "x28"    # [Ljava/lang/String;
    .param p30, "x29"    # [Ljava/lang/String;
    .param p31, "x30"    # Lcom/ning/http/client/AsyncHttpProviderConfig;
    .param p32, "x31"    # Lcom/ning/http/client/AsyncHttpClientConfig$1;

    .prologue
    .line 42
    invoke-direct/range {p0 .. p31}, Lcom/ning/http/client/AsyncHttpClientConfig;-><init>(IIIIIIZZIILjavax/net/ssl/SSLContext;Ljavax/net/ssl/HostnameVerifier;ZZIZLjava/util/concurrent/ExecutorService;Lcom/ning/http/client/ProxyServerSelector;ZZLjava/lang/String;Lcom/ning/http/client/Realm;Ljava/util/List;Ljava/util/List;Ljava/util/List;IZI[Ljava/lang/String;[Ljava/lang/String;Lcom/ning/http/client/AsyncHttpProviderConfig;)V

    return-void
.end method


# virtual methods
.method public executorService()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/ning/http/client/AsyncHttpProviderConfig",
            "<**>;"
        }
    .end annotation

    .prologue
    .line 295
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;

    return-object v0
.end method

.method public getConnectTimeout()I
    .locals 1

    .prologue
    .line 175
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->connectTimeout:I

    return v0
.end method

.method public getConnectionTTL()I
    .locals 1

    .prologue
    .line 431
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->connectionTTL:I

    return v0
.end method

.method public getEnabledCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 452
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->enabledCipherSuites:[Ljava/lang/String;

    return-object v0
.end method

.method public getEnabledProtocols()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 445
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->enabledProtocols:[Ljava/lang/String;

    return-object v0
.end method

.method public getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    .prologue
    .line 382
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->acceptAnyCertificate:Z

    if-nez v0, :cond_1

    .line 383
    monitor-enter p0

    .line 384
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    if-nez v0, :cond_0

    .line 385
    new-instance v0, Lcom/ning/http/util/DefaultHostnameVerifier;

    invoke-direct {v0}, Lcom/ning/http/util/DefaultHostnameVerifier;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 386
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 388
    :cond_1
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0

    .line 386
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getIOExceptionFilters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/IOExceptionFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 331
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->ioExceptionFilters:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getIoThreadMultiplier()I
    .locals 1

    .prologue
    .line 395
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->ioThreadMultiplier:I

    return v0
.end method

.method public getMaxConnections()I
    .locals 1

    .prologue
    .line 157
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxConnections:I

    return v0
.end method

.method public getMaxConnectionsPerHost()I
    .locals 1

    .prologue
    .line 166
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxConnectionsPerHost:I

    return v0
.end method

.method public getMaxRedirects()I
    .locals 1

    .prologue
    .line 230
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxRedirects:I

    return v0
.end method

.method public getMaxRequestRetry()I
    .locals 1

    .prologue
    .line 340
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->maxRequestRetry:I

    return v0
.end method

.method public getPooledConnectionIdleTimeout()I
    .locals 1

    .prologue
    .line 203
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->pooledConnectionIdleTimeout:I

    return v0
.end method

.method public getProxyServerSelector()Lcom/ning/http/client/ProxyServerSelector;
    .locals 1

    .prologue
    .line 277
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    return-object v0
.end method

.method public getReadTimeout()I
    .locals 1

    .prologue
    .line 192
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->readTimeout:I

    return v0
.end method

.method public getRealm()Lcom/ning/http/client/Realm;
    .locals 1

    .prologue
    .line 304
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->realm:Lcom/ning/http/client/Realm;

    return-object v0
.end method

.method public getRequestFilters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/RequestFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 313
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->requestFilters:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRequestTimeout()I
    .locals 1

    .prologue
    .line 212
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->requestTimeout:I

    return v0
.end method

.method public getResponseFilters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/filter/ResponseFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 322
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->responseFilters:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSSLContext()Ljavax/net/ssl/SSLContext;
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->sslContext:Ljavax/net/ssl/SSLContext;

    return-object v0
.end method

.method public getUserAgent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->userAgent:Ljava/lang/String;

    return-object v0
.end method

.method public getWebSocketTimeout()I
    .locals 1

    .prologue
    .line 183
    iget v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->webSocketTimeout:I

    return v0
.end method

.method public isAcceptAnyCertificate()Z
    .locals 1

    .prologue
    .line 438
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->acceptAnyCertificate:Z

    return v0
.end method

.method public isAllowPoolingConnections()Z
    .locals 1

    .prologue
    .line 239
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->allowPoolingConnections:Z

    return v0
.end method

.method public isAllowPoolingSslConnections()Z
    .locals 1

    .prologue
    .line 349
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->allowPoolingSslConnections:Z

    return v0
.end method

.method public isCompressionEnforced()Z
    .locals 1

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->compressionEnforced:Z

    return v0
.end method

.method public isDisableUrlEncodingForBoundedRequests()Z
    .locals 1

    .prologue
    .line 356
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->disableUrlEncodingForBoundRequests:Z

    return v0
.end method

.method public isFollowRedirect()Z
    .locals 1

    .prologue
    .line 221
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->followRedirect:Z

    return v0
.end method

.method public isStrict302Handling()Z
    .locals 1

    .prologue
    .line 412
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->strict302Handling:Z

    return v0
.end method

.method public isUseRelativeURIsWithConnectProxies()Z
    .locals 1

    .prologue
    .line 422
    iget-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->useRelativeURIsWithConnectProxies:Z

    return v0
.end method

.method public isValid()Z
    .locals 2

    .prologue
    .line 367
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/AsyncHttpClientConfig;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 372
    :goto_0
    return v1

    .line 368
    :catch_0
    move-exception v0

    .line 372
    .local v0, "ignore":Ljava/lang/Exception;
    const/4 v1, 0x1

    goto :goto_0
.end method
