.class public Lcom/ning/http/client/AsyncHttpClientConfigBean;
.super Lcom/ning/http/client/AsyncHttpClientConfig;
.source "AsyncHttpClientConfigBean.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/ning/http/client/AsyncHttpClientConfig;-><init>()V

    .line 36
    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClientConfigBean;->configureExecutors()V

    .line 37
    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClientConfigBean;->configureDefaults()V

    .line 38
    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClientConfigBean;->configureFilters()V

    .line 39
    return-void
.end method


# virtual methods
.method public addIoExceptionFilters(Lcom/ning/http/client/filter/IOExceptionFilter;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 1
    .param p1, "ioExceptionFilter"    # Lcom/ning/http/client/filter/IOExceptionFilter;

    .prologue
    .line 195
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->ioExceptionFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    return-object p0
.end method

.method public addRequestFilter(Lcom/ning/http/client/filter/RequestFilter;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 1
    .param p1, "requestFilter"    # Lcom/ning/http/client/filter/RequestFilter;

    .prologue
    .line 185
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->requestFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    return-object p0
.end method

.method public addResponseFilters(Lcom/ning/http/client/filter/ResponseFilter;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 1
    .param p1, "responseFilter"    # Lcom/ning/http/client/filter/ResponseFilter;

    .prologue
    .line 190
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->responseFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    return-object p0
.end method

.method configureDefaults()V
    .locals 1

    .prologue
    .line 48
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxConnections()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxConnections:I

    .line 49
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxConnectionsPerHost()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxConnectionsPerHost:I

    .line 50
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultConnectTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->connectTimeout:I

    .line 51
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultWebSocketTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->webSocketTimeout:I

    .line 52
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultPooledConnectionIdleTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->pooledConnectionIdleTimeout:I

    .line 53
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultReadTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->readTimeout:I

    .line 54
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultRequestTimeout()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->requestTimeout:I

    .line 55
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultConnectionTTL()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->connectionTTL:I

    .line 56
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultFollowRedirect()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->followRedirect:Z

    .line 57
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxRedirects()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxRedirects:I

    .line 58
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultCompressionEnforced()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->compressionEnforced:Z

    .line 59
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUserAgent()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->userAgent:Ljava/lang/String;

    .line 60
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAllowPoolingConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->allowPoolingConnections:Z

    .line 61
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseRelativeURIsWithConnectProxies()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->useRelativeURIsWithConnectProxies:Z

    .line 62
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultMaxRequestRetry()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxRequestRetry:I

    .line 63
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultIoThreadMultiplier()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->ioThreadMultiplier:I

    .line 64
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAllowPoolingSslConnections()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->allowPoolingSslConnections:Z

    .line 65
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultDisableUrlEncodingForBoundRequests()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->disableUrlEncodingForBoundRequests:Z

    .line 66
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultStrict302Handling()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->strict302Handling:Z

    .line 67
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultAcceptAnyCertificate()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->acceptAnyCertificate:Z

    .line 69
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseProxySelector()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 70
    invoke-static {}, Lcom/ning/http/util/ProxyUtils;->getJdkDefaultProxyServerSelector()Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 74
    :cond_0
    :goto_0
    return-void

    .line 71
    :cond_1
    invoke-static {}, Lcom/ning/http/client/AsyncHttpClientConfigDefaults;->defaultUseProxyProperties()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Ljava/util/Properties;)Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    goto :goto_0
.end method

.method configureExecutors()V
    .locals 1

    .prologue
    .line 77
    new-instance v0, Lcom/ning/http/client/AsyncHttpClientConfigBean$1;

    invoke-direct {v0, p0}, Lcom/ning/http/client/AsyncHttpClientConfigBean$1;-><init>(Lcom/ning/http/client/AsyncHttpClientConfigBean;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 84
    return-void
.end method

.method configureFilters()V
    .locals 1

    .prologue
    .line 42
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->requestFilters:Ljava/util/List;

    .line 43
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->responseFilters:Ljava/util/List;

    .line 44
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->ioExceptionFilters:Ljava/util/List;

    .line 45
    return-void
.end method

.method public setAcceptAnyCertificate(Z)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "acceptAnyCertificate"    # Z

    .prologue
    .line 225
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->acceptAnyCertificate:Z

    .line 226
    return-object p0
.end method

.method public setAllowPoolingConnection(Z)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "allowPoolingConnection"    # Z

    .prologue
    .line 147
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->allowPoolingConnections:Z

    .line 148
    return-object p0
.end method

.method public setAllowSslConnectionPool(Z)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "allowSslConnectionPool"    # Z

    .prologue
    .line 205
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->allowPoolingSslConnections:Z

    .line 206
    return-object p0
.end method

.method public setApplicationThreadPool(Ljava/util/concurrent/ExecutorService;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 1
    .param p1, "applicationThreadPool"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 155
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->applicationThreadPool:Ljava/util/concurrent/ExecutorService;

    .line 156
    return-object p0
.end method

.method public setCompressionEnforced(Z)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "compressionEnforced"    # Z

    .prologue
    .line 137
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->compressionEnforced:Z

    .line 138
    return-object p0
.end method

.method public setConnectionTimeOut(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "connectionTimeOut"    # I

    .prologue
    .line 97
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->connectTimeout:I

    .line 98
    return-object p0
.end method

.method public setDisableUrlEncodingForBoundRequests(Z)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "disableUrlEncodingForBoundRequests"    # Z

    .prologue
    .line 210
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->disableUrlEncodingForBoundRequests:Z

    .line 211
    return-object p0
.end method

.method public setFollowRedirect(Z)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "followRedirect"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->followRedirect:Z

    .line 128
    return-object p0
.end method

.method public setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "hostnameVerifier"    # Ljavax/net/ssl/HostnameVerifier;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 216
    return-object p0
.end method

.method public setIdleConnectionInPoolTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "idleConnectionInPoolTimeout"    # I

    .prologue
    .line 102
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->pooledConnectionIdleTimeout:I

    .line 103
    return-object p0
.end method

.method public setIoThreadMultiplier(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "ioThreadMultiplier"    # I

    .prologue
    .line 220
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->ioThreadMultiplier:I

    .line 221
    return-object p0
.end method

.method public setMaxConnectionLifeTime(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "maxConnectionLifeTime"    # I

    .prologue
    .line 122
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->connectionTTL:I

    .line 123
    return-object p0
.end method

.method public setMaxConnectionPerHost(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "maxConnectionPerHost"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxConnectionsPerHost:I

    .line 93
    return-object p0
.end method

.method public setMaxRedirects(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "maxRedirects"    # I

    .prologue
    .line 132
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxRedirects:I

    .line 133
    return-object p0
.end method

.method public setMaxRequestRetry(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "maxRequestRetry"    # I

    .prologue
    .line 200
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxRequestRetry:I

    .line 201
    return-object p0
.end method

.method public setMaxTotalConnections(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "maxTotalConnections"    # I

    .prologue
    .line 87
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->maxConnections:I

    .line 88
    return-object p0
.end method

.method public setProviderConfig(Lcom/ning/http/client/AsyncHttpProviderConfig;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHttpProviderConfig",
            "<**>;)",
            "Lcom/ning/http/client/AsyncHttpClientConfigBean;"
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "providerConfig":Lcom/ning/http/client/AsyncHttpProviderConfig;, "Lcom/ning/http/client/AsyncHttpProviderConfig<**>;"
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->providerConfig:Lcom/ning/http/client/AsyncHttpProviderConfig;

    .line 176
    return-object p0
.end method

.method public setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 1
    .param p1, "proxyServer"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 160
    invoke-static {p1}, Lcom/ning/http/util/ProxyUtils;->createProxyServerSelector(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/ProxyServerSelector;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 161
    return-object p0
.end method

.method public setProxyServerSelector(Lcom/ning/http/client/ProxyServerSelector;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "proxyServerSelector"    # Lcom/ning/http/client/ProxyServerSelector;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->proxyServerSelector:Lcom/ning/http/client/ProxyServerSelector;

    .line 166
    return-object p0
.end method

.method public setReadTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "readTimeout"    # I

    .prologue
    .line 112
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->readTimeout:I

    .line 113
    return-object p0
.end method

.method public setRealm(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "realm"    # Lcom/ning/http/client/Realm;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->realm:Lcom/ning/http/client/Realm;

    .line 181
    return-object p0
.end method

.method public setRequestTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "requestTimeout"    # I

    .prologue
    .line 117
    iput p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->requestTimeout:I

    .line 118
    return-object p0
.end method

.method public setSslContext(Ljavax/net/ssl/SSLContext;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "sslContext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->sslContext:Ljavax/net/ssl/SSLContext;

    .line 171
    return-object p0
.end method

.method public setStrict302Handling(Z)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "strict302Handling"    # Z

    .prologue
    .line 107
    iput-boolean p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->strict302Handling:Z

    .line 108
    return-object p0
.end method

.method public setUserAgent(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClientConfigBean;
    .locals 0
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClientConfigBean;->userAgent:Ljava/lang/String;

    .line 143
    return-object p0
.end method
