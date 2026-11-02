.class Lcom/ning/http/client/providers/grizzly/ConnectionManager;
.super Ljava/lang/Object;
.source "ConnectionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/ConnectionManager$NonCachingPool;,
        Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;
    }
.end annotation


# static fields
.field private static final DO_NOT_CACHE:Lorg/glassfish/grizzly/attributes/Attribute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/attributes/Attribute",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final connectionHandler:Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;

.field private final connectionMonitor:Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;

.field private final pool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

.field private final provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 44
    sget-object v0, Lorg/glassfish/grizzly/Grizzly;->DEFAULT_ATTRIBUTE_BUILDER:Lorg/glassfish/grizzly/attributes/AttributeBuilder;

    const-class v1, Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/attributes/AttributeBuilder;->createAttribute(Ljava/lang/String;)Lorg/glassfish/grizzly/attributes/Attribute;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->DO_NOT_CACHE:Lorg/glassfish/grizzly/attributes/Attribute;

    return-void
.end method

.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;)V
    .locals 4
    .param p1, "provider"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "transport"    # Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;
    .param p3, "providerConfig"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    .prologue
    const/4 v2, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .line 60
    invoke-virtual {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->getClientConfig()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 63
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAllowPoolingConnections()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 64
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->getConnectionPool()Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    move-result-object v2

    .line 67
    .local v2, "providedPool":Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    :cond_0
    if-eqz v2, :cond_1

    move-object v0, v2

    .line 73
    .end local v2    # "providedPool":Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    .local v0, "connectionPool":Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    :goto_0
    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->pool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    .line 74
    invoke-static {p2}, Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;->builder(Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;)Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler$Builder;->build()Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionHandler:Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;

    .line 75
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v1

    .line 76
    .local v1, "maxConns":I
    new-instance v3, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;

    invoke-direct {v3, v1}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;-><init>(I)V

    iput-object v3, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionMonitor:Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;

    .line 77
    return-void

    .line 67
    .end local v0    # "connectionPool":Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    .end local v1    # "maxConns":I
    .restart local v2    # "providedPool":Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    :cond_1
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-direct {v0, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V

    goto :goto_0

    .line 71
    .end local v2    # "providedPool":Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    :cond_2
    new-instance v0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$NonCachingPool;

    invoke-direct {v0, v2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$NonCachingPool;-><init>(Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;)V

    .restart local v0    # "connectionPool":Lcom/ning/http/client/providers/grizzly/ConnectionPool;
    goto :goto_0
.end method

.method static synthetic access$100(Lcom/ning/http/client/providers/grizzly/ConnectionManager;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    return-object v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/providers/grizzly/ConnectionManager;)Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionMonitor:Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;

    return-object v0
.end method

.method private static getPartitionId(Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;
    .locals 2
    .param p0, "request"    # Lcom/ning/http/client/Request;
    .param p1, "proxyServer"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 231
    invoke-interface {p0}, Lcom/ning/http/client/Request;->getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;

    move-result-object v0

    invoke-interface {p0}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/ning/http/client/ConnectionPoolPartitioning;->getPartitionId(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getPort(Lcom/ning/http/client/uri/Uri;I)I
    .locals 5
    .param p0, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p1, "p"    # I

    .prologue
    .line 236
    move v0, p1

    .line 237
    .local v0, "port":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 238
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 239
    .local v1, "protocol":Ljava/lang/String;
    const-string v2, "http"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "ws"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 240
    :cond_0
    const/16 v0, 0x50

    .line 247
    .end local v1    # "protocol":Ljava/lang/String;
    :cond_1
    :goto_0
    return v0

    .line 241
    .restart local v1    # "protocol":Ljava/lang/String;
    :cond_2
    const-string v2, "https"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "wss"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 242
    :cond_3
    const/16 v0, 0x1bb

    goto :goto_0

    .line 244
    :cond_4
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown protocol: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static isConnectionCacheable(Lorg/glassfish/grizzly/Connection;)Z
    .locals 2
    .param p0, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 85
    sget-object v1, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->DO_NOT_CACHE:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v1, p0}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 86
    .local v0, "canCache":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static markConnectionAsDoNotCache(Lorg/glassfish/grizzly/Connection;)V
    .locals 2
    .param p0, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 81
    sget-object v0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->DO_NOT_CACHE:Lorg/glassfish/grizzly/attributes/Attribute;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0, v1}, Lorg/glassfish/grizzly/attributes/Attribute;->set(Lorg/glassfish/grizzly/attributes/AttributeStorage;Ljava/lang/Object;)V

    .line 82
    return-void
.end method

.method private obtainConnection0(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/Connection;
    .locals 10
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "requestFuture"    # Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v6

    .line 153
    .local v6, "uri":Lcom/ning/http/client/uri/Uri;
    invoke-virtual {p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->getProxy()Lcom/ning/http/client/ProxyServer;

    move-result-object v5

    .line 154
    .local v5, "proxy":Lcom/ning/http/client/ProxyServer;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 155
    .local v3, "host":Ljava/lang/String;
    :goto_0
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Lcom/ning/http/client/ProxyServer;->getPort()I

    move-result v4

    .line 156
    .local v4, "port":I
    :goto_1
    iget-object v7, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v7}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectTimeout()I

    move-result v0

    .line 157
    .local v0, "cTimeout":I
    invoke-static {}, Lorg/glassfish/grizzly/utils/Futures;->createSafeFuture()Lorg/glassfish/grizzly/impl/FutureImpl;

    move-result-object v2

    .line 158
    .local v2, "future":Lorg/glassfish/grizzly/impl/FutureImpl;, "Lorg/glassfish/grizzly/impl/FutureImpl<Lorg/glassfish/grizzly/Connection;>;"
    const/4 v7, 0x0

    invoke-virtual {p0, p1, p2, v7}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->createConnectionCompletionHandler(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v7

    invoke-static {v2, v7}, Lorg/glassfish/grizzly/utils/Futures;->toCompletionHandler(Lorg/glassfish/grizzly/impl/FutureImpl;Lorg/glassfish/grizzly/CompletionHandler;)Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v1

    .line 160
    .local v1, "ch":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    if-lez v0, :cond_2

    .line 161
    iget-object v7, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionHandler:Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;

    new-instance v8, Ljava/net/InetSocketAddress;

    invoke-static {v6, v4}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->getPort(Lcom/ning/http/client/uri/Uri;I)I

    move-result v9

    invoke-direct {v8, v3, v9}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v7, v8, v1}, Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;->connect(Ljava/net/SocketAddress;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 163
    int-to-long v8, v0

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v8, v9, v7}, Lorg/glassfish/grizzly/impl/FutureImpl;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/glassfish/grizzly/Connection;

    .line 167
    :goto_2
    return-object v7

    .line 154
    .end local v0    # "cTimeout":I
    .end local v1    # "ch":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    .end local v2    # "future":Lorg/glassfish/grizzly/impl/FutureImpl;, "Lorg/glassfish/grizzly/impl/FutureImpl<Lorg/glassfish/grizzly/Connection;>;"
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "port":I
    :cond_0
    invoke-virtual {v6}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 155
    .restart local v3    # "host":Ljava/lang/String;
    :cond_1
    invoke-virtual {v6}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v4

    goto :goto_1

    .line 165
    .restart local v0    # "cTimeout":I
    .restart local v1    # "ch":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    .restart local v2    # "future":Lorg/glassfish/grizzly/impl/FutureImpl;, "Lorg/glassfish/grizzly/impl/FutureImpl<Lorg/glassfish/grizzly/Connection;>;"
    .restart local v4    # "port":I
    :cond_2
    iget-object v7, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionHandler:Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;

    new-instance v8, Ljava/net/InetSocketAddress;

    invoke-static {v6, v4}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->getPort(Lcom/ning/http/client/uri/Uri;I)I

    move-result v9

    invoke-direct {v8, v3, v9}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v7, v8, v1}, Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;->connect(Ljava/net/SocketAddress;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 167
    invoke-interface {v2}, Lorg/glassfish/grizzly/impl/FutureImpl;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/glassfish/grizzly/Connection;

    goto :goto_2
.end method


# virtual methods
.method canReturnConnection(Lorg/glassfish/grizzly/Connection;)Z
    .locals 1
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 184
    sget-object v0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->DO_NOT_CACHE:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->pool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    invoke-interface {v0}, Lcom/ning/http/client/providers/grizzly/ConnectionPool;->canCacheConnection()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method createConnectionCompletionHandler(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)Lorg/glassfish/grizzly/CompletionHandler;
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "future"    # Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;)",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    .local p3, "wrappedHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    new-instance v0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;

    invoke-direct {v0, p0, p3, p2, p1}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;-><init>(Lcom/ning/http/client/providers/grizzly/ConnectionManager;Lorg/glassfish/grizzly/CompletionHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;)V

    return-object v0
.end method

.method destroy()V
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->pool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    invoke-interface {v0}, Lcom/ning/http/client/providers/grizzly/ConnectionPool;->destroy()V

    .line 189
    return-void
.end method

.method doAsyncConnect(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)V
    .locals 11
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "requestFuture"    # Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 121
    .local p3, "connectHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    invoke-virtual {p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->getProxy()Lcom/ning/http/client/ProxyServer;

    move-result-object v3

    .line 122
    .local v3, "proxy":Lcom/ning/http/client/ProxyServer;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v4

    .line 123
    .local v4, "uri":Lcom/ning/http/client/uri/Uri;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "host":Ljava/lang/String;
    :goto_0
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/ning/http/client/ProxyServer;->getPort()I

    move-result v2

    .line 125
    .local v2, "port":I
    :goto_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->createConnectionCompletionHandler(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v0

    .line 129
    .local v0, "completionHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v6}, Lcom/ning/http/client/AsyncHttpClientConfig;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v5

    .line 130
    .local v5, "verifier":Ljavax/net/ssl/HostnameVerifier;
    invoke-static {v4}, Lcom/ning/http/client/providers/grizzly/Utils;->isSecure(Lcom/ning/http/client/uri/Uri;)Z

    move-result v6

    if-eqz v6, :cond_0

    if-eqz v5, :cond_0

    .line 131
    invoke-virtual {v4}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v5, v6}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->wrapWithHostnameVerifierHandler(Lorg/glassfish/grizzly/CompletionHandler;Ljavax/net/ssl/HostnameVerifier;Ljava/lang/String;)Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v0

    .line 135
    :cond_0
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 136
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionHandler:Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;

    new-instance v7, Ljava/net/InetSocketAddress;

    invoke-static {v4, v2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->getPort(Lcom/ning/http/client/uri/Uri;I)I

    move-result v8

    invoke-direct {v7, v1, v8}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    new-instance v8, Ljava/net/InetSocketAddress;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v9, v10}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {v6, v7, v8, v0}, Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;->connect(Ljava/net/SocketAddress;Ljava/net/SocketAddress;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 145
    :goto_2
    return-void

    .line 123
    .end local v0    # "completionHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    .end local v1    # "host":Ljava/lang/String;
    .end local v2    # "port":I
    .end local v5    # "verifier":Ljavax/net/ssl/HostnameVerifier;
    :cond_1
    invoke-virtual {v4}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 124
    .restart local v1    # "host":Ljava/lang/String;
    :cond_2
    invoke-virtual {v4}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v2

    goto :goto_1

    .line 141
    .restart local v0    # "completionHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    .restart local v2    # "port":I
    .restart local v5    # "verifier":Ljavax/net/ssl/HostnameVerifier;
    :cond_3
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionHandler:Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;

    new-instance v7, Ljava/net/InetSocketAddress;

    invoke-static {v4, v2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->getPort(Lcom/ning/http/client/uri/Uri;I)I

    move-result v8

    invoke-direct {v7, v1, v8}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v6, v7, v0}, Lorg/glassfish/grizzly/nio/transport/TCPNIOConnectorHandler;->connect(Ljava/net/SocketAddress;Lorg/glassfish/grizzly/CompletionHandler;)V

    goto :goto_2
.end method

.method doAsyncTrackedConnection(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)V
    .locals 3
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "requestFuture"    # Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 94
    .local p3, "connectHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->pool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    invoke-virtual {p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->getProxy()Lcom/ning/http/client/ProxyServer;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->getPartitionId(Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/ning/http/client/providers/grizzly/ConnectionPool;->poll(Ljava/lang/String;)Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 95
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    if-nez v0, :cond_1

    .line 96
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->connectionMonitor:Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;->acquire()Z

    move-result v1

    if-nez v1, :cond_0

    .line 97
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Max connections exceeded"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 99
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->doAsyncConnect(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 104
    :goto_0
    return-void

    .line 101
    :cond_1
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-virtual {v1, v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->touchConnection(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;)V

    .line 102
    invoke-interface {p3, v0}, Lorg/glassfish/grizzly/CompletionHandler;->completed(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method obtainConnection(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/Connection;
    .locals 3
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "requestFuture"    # Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->obtainConnection0(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 112
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    sget-object v1, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->DO_NOT_CACHE:Lorg/glassfish/grizzly/attributes/Attribute;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Lorg/glassfish/grizzly/attributes/Attribute;->set(Lorg/glassfish/grizzly/attributes/AttributeStorage;Ljava/lang/Object;)V

    .line 113
    return-object v0
.end method

.method returnConnection(Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/Connection;)Z
    .locals 6
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 172
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-static {v2, p1}, Lcom/ning/http/util/ProxyUtils;->getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;

    move-result-object v0

    .line 173
    .local v0, "proxyServer":Lcom/ning/http/client/ProxyServer;
    sget-object v2, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->DO_NOT_CACHE:Lorg/glassfish/grizzly/attributes/Attribute;

    invoke-virtual {v2, p2}, Lorg/glassfish/grizzly/attributes/Attribute;->get(Lorg/glassfish/grizzly/attributes/AttributeStorage;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->pool:Lcom/ning/http/client/providers/grizzly/ConnectionPool;

    invoke-static {p1, v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->getPartitionId(Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, p2}, Lcom/ning/http/client/providers/grizzly/ConnectionPool;->offer(Ljava/lang/String;Lorg/glassfish/grizzly/Connection;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    .line 175
    .local v1, "result":Z
    :goto_0
    if-eqz v1, :cond_0

    .line 176
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v2, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    if-eqz v2, :cond_0

    .line 177
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v2, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    sget-object v3, Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;->FOREVER:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v2, p2, v4, v5}, Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;->setTimeoutMillis(Ljava/lang/Object;J)V

    .line 180
    :cond_0
    return v1

    .line 173
    .end local v1    # "result":Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
