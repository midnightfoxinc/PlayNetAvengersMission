.class public final Lcom/ning/http/client/providers/netty/request/NettyRequestSender;
.super Ljava/lang/Object;
.source "NettyRequestSender.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final nettyTimer:Lorg/jboss/netty/util/Timer;

.field private final requestFactory:Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    const-class v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lorg/jboss/netty/util/Timer;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 1
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .param p3, "channelManager"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;
    .param p4, "nettyTimer"    # Lorg/jboss/netty/util/Timer;
    .param p5, "closed"    # Ljava/util/concurrent/atomic/AtomicBoolean;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 82
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .line 83
    iput-object p4, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->nettyTimer:Lorg/jboss/netty/util/Timer;

    .line 84
    iput-object p5, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 85
    new-instance v0, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;

    invoke-direct {v0, p1, p2}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->requestFactory:Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;

    .line 86
    return-void
.end method

.method private configureTransferAdapter(Lcom/ning/http/client/AsyncHandler;Lorg/jboss/netty/handler/codec/http/HttpRequest;)V
    .locals 5
    .param p2, "httpRequest"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;",
            "Lorg/jboss/netty/handler/codec/http/HttpRequest;",
            ")V"
        }
    .end annotation

    .prologue
    .line 375
    .local p1, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    new-instance v1, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    .line 376
    .local v1, "h":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 377
    .local v0, "entries":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 380
    .end local v0    # "entries":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const-class v3, Lcom/ning/http/client/listener/TransferCompletionHandler;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/listener/TransferCompletionHandler;

    invoke-virtual {v3, v1}, Lcom/ning/http/client/listener/TransferCompletionHandler;->headers(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    .line 381
    return-void
.end method

.method private connect(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZLorg/jboss/netty/bootstrap/ClientBootstrap;Lcom/ning/http/client/AsyncHandler;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 4
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p4, "useProxy"    # Z
    .param p5, "bootstrap"    # Lorg/jboss/netty/bootstrap/ClientBootstrap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ProxyServer;",
            "Z",
            "Lorg/jboss/netty/bootstrap/ClientBootstrap;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;)",
            "Lorg/jboss/netty/channel/ChannelFuture;"
        }
    .end annotation

    .prologue
    .line 363
    .local p6, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->remoteAddress(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Z)Ljava/net/InetSocketAddress;

    move-result-object v0

    .line 365
    .local v0, "remoteAddress":Ljava/net/InetSocketAddress;
    instance-of v1, p6, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v1, :cond_0

    .line 366
    const-class v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-virtual {v1, p6}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v1}, Lcom/ning/http/client/AsyncHandlerExtensions;->onDnsResolved()V

    .line 368
    :cond_0
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 369
    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-virtual {p5, v0, v1}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->connect(Ljava/net/SocketAddress;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 371
    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {p5, v0}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    goto :goto_0
.end method

.method private getCachedChannel(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ConnectionPoolPartitioning;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/AsyncHandler;)Lorg/jboss/netty/channel/Channel;
    .locals 1
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "partitioning"    # Lcom/ning/http/client/ConnectionPoolPartitioning;
    .param p4, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ConnectionPoolPartitioning;",
            "Lcom/ning/http/client/ProxyServer;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;)",
            "Lorg/jboss/netty/channel/Channel;"
        }
    .end annotation

    .prologue
    .line 193
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    .local p5, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->reuseChannel()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 196
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p2, p4, p3, p5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->pollAndVerifyCachedChannel(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/ConnectionPoolPartitioning;Lcom/ning/http/client/AsyncHandler;)Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    goto :goto_0
.end method

.method private newNettyRequestAndResponseFuture(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Z)Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .locals 6
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p4, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p5, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p6, "forceConnect"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ProxyServer;",
            "Z)",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    .local p3, "originalFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->requestFactory:Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;

    invoke-virtual {v0, p1, p4, p6, p5}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->newNettyRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;ZLcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v4

    .line 181
    .local v4, "nettyRequest":Lcom/ning/http/client/providers/netty/request/NettyRequest;
    if-nez p3, :cond_0

    move-object v0, p0

    move-object v1, p4

    move-object v2, p1

    move-object v3, p2

    move-object v5, p5

    .line 182
    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->newNettyResponseFuture(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/request/NettyRequest;Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    move-result-object p3

    .line 186
    .end local p3    # "originalFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    :goto_0
    return-object p3

    .line 184
    .restart local p3    # "originalFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    :cond_0
    invoke-virtual {p3, v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setNettyRequest(Lcom/ning/http/client/providers/netty/request/NettyRequest;)V

    .line 185
    invoke-virtual {p3, p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setRequest(Lcom/ning/http/client/Request;)V

    goto :goto_0
.end method

.method private newNettyResponseFuture(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/request/NettyRequest;Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .locals 9
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p4, "nettyRequest"    # Lcom/ning/http/client/providers/netty/request/NettyRequest;
    .param p5, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/netty/request/NettyRequest;",
            "Lcom/ning/http/client/ProxyServer;",
            ")",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 299
    .local p3, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    new-instance v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxRequestRetry()I

    move-result v5

    invoke-interface {p2}, Lcom/ning/http/client/Request;->getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;

    move-result-object v6

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/request/NettyRequest;ILcom/ning/http/client/ConnectionPoolPartitioning;Lcom/ning/http/client/ProxyServer;)V

    .line 308
    .local v0, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v1

    const-string v2, "Expect"

    invoke-virtual {v1, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 309
    .local v8, "expectHeader":Ljava/lang/String;
    if-eqz v8, :cond_0

    const-string v1, "100-continue"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 310
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setDontWriteBodyBecauseExpectContinue(Z)V

    .line 311
    :cond_0
    return-object v0
.end method

.method private remoteAddress(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Z)Ljava/net/InetSocketAddress;
    .locals 3
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p4, "useProxy"    # Z

    .prologue
    .line 352
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 353
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-static {p2}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getDefaultPort(Lcom/ning/http/client/uri/Uri;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 359
    :goto_0
    return-object v0

    .line 355
    :cond_0
    if-eqz p4, :cond_1

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Lcom/ning/http/util/ProxyUtils;->avoidProxy(Lcom/ning/http/client/ProxyServer;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 356
    :cond_1
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-virtual {p2}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getDefaultPort(Lcom/ning/http/client/uri/Uri;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    goto :goto_0

    .line 359
    :cond_2
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-virtual {p3}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Lcom/ning/http/client/ProxyServer;->getPort()I

    move-result v2

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private scheduleTimeouts(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "nettyResponseFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v6, -0x1

    .line 385
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch()V

    .line 386
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->requestTimeout(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)I

    move-result v11

    .line 387
    .local v11, "requestTimeoutInMs":I
    new-instance v3, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    invoke-direct {v3}, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;-><init>()V

    .line 388
    .local v3, "timeoutsHolder":Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;
    if-eq v11, v6, :cond_0

    .line 389
    new-instance v0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;

    int-to-long v4, v11

    move-object v1, p1

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;-><init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;J)V

    int-to-long v4, v11

    invoke-virtual {p0, v0, v4, v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->newTimeout(Lorg/jboss/netty/util/TimerTask;J)Lorg/jboss/netty/util/Timeout;

    move-result-object v10

    .line 391
    .local v10, "requestTimeout":Lorg/jboss/netty/util/Timeout;
    iput-object v10, v3, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->requestTimeout:Lorg/jboss/netty/util/Timeout;

    .line 394
    .end local v10    # "requestTimeout":Lorg/jboss/netty/util/Timeout;
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig;->getReadTimeout()I

    move-result v9

    .line 395
    .local v9, "readTimeoutValue":I
    if-eq v9, v6, :cond_1

    if-ge v9, v11, :cond_1

    .line 397
    new-instance v0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;

    int-to-long v4, v11

    int-to-long v6, v9

    move-object v1, p1

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;-><init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;JJ)V

    int-to-long v4, v9

    invoke-virtual {p0, v0, v4, v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->newTimeout(Lorg/jboss/netty/util/TimerTask;J)Lorg/jboss/netty/util/Timeout;

    move-result-object v8

    .line 399
    .local v8, "readTimeout":Lorg/jboss/netty/util/Timeout;
    iput-object v8, v3, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->readTimeout:Lorg/jboss/netty/util/Timeout;

    .line 401
    .end local v8    # "readTimeout":Lorg/jboss/netty/util/Timeout;
    :cond_1
    invoke-virtual {p1, v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setTimeoutsHolder(Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;)V

    .line 402
    return-void
.end method

.method private sendRequestThroughSslProxy(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/ListenableFuture;
    .locals 16
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p4, "reclaimCache"    # Z
    .param p5, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p6, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;Z",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ProxyServer;",
            ")",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    .local p3, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    const/4 v15, 0x0

    .line 158
    .local v15, "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    const/4 v14, 0x0

    .local v14, "i":I
    const/4 v0, 0x3

    if-ge v14, v0, :cond_0

    .line 159
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->getCachedChannel(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ConnectionPoolPartitioning;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/AsyncHandler;)Lorg/jboss/netty/channel/Channel;

    move-result-object v13

    .line 160
    .local v13, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-static {v13}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 161
    if-nez v15, :cond_2

    .line 162
    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->newNettyRequestAndResponseFuture(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Z)Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    move-result-object v4

    .line 164
    .end local v15    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    .local v4, "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    :goto_0
    invoke-static {v13}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    if-eqz v0, :cond_1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v5, p2

    move-object v6, v13

    .line 166
    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequestWithCachedChannel(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lorg/jboss/netty/channel/Channel;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    .line 173
    .end local v13    # "channel":Lorg/jboss/netty/channel/Channel;
    :goto_1
    return-object v0

    .end local v4    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    .restart local v15    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    :cond_0
    move-object v4, v15

    .line 172
    .end local v15    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    .restart local v4    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    :cond_1
    const/4 v11, 0x1

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    invoke-direct/range {v5 .. v11}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->newNettyRequestAndResponseFuture(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Z)Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    move-result-object v4

    .line 173
    const/4 v9, 0x1

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object v10, v4

    move-object/from16 v11, p2

    move/from16 v12, p4

    invoke-direct/range {v5 .. v12}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequestWithNewChannel(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZLcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Z)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    goto :goto_1

    .end local v4    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    .restart local v13    # "channel":Lorg/jboss/netty/channel/Channel;
    .restart local v15    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    :cond_2
    move-object v4, v15

    .end local v15    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    .restart local v4    # "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    goto :goto_0
.end method

.method private sendRequestWithCachedChannel(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lorg/jboss/netty/channel/Channel;)Lcom/ning/http/client/ListenableFuture;
    .locals 6
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p6, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ProxyServer;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lorg/jboss/netty/channel/Channel;",
            ")",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    .local p4, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    .local p5, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    instance-of v3, p5, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v3, :cond_0

    .line 203
    const-class v3, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-virtual {v3, p5}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v3}, Lcom/ning/http/client/AsyncHandlerExtensions;->onConnectionPooled()V

    .line 205
    :cond_0
    sget-object v3, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->POOLED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-virtual {p4, v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setState(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;)V

    .line 206
    const/4 v3, 0x0

    invoke-virtual {p4, p6, v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->attachChannel(Lorg/jboss/netty/channel/Channel;Z)V

    .line 208
    sget-object v3, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v4, "Using cached Channel {}\n for request \n{}\n"

    invoke-virtual {p4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v5

    invoke-interface {v3, v4, p6, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 210
    invoke-static {p6}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 211
    invoke-static {p6, p4}, Lcom/ning/http/client/providers/netty/channel/Channels;->setAttribute(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 214
    :try_start_0
    invoke-virtual {p0, p4, p6}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->writeRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    :goto_0
    return-object p4

    .line 215
    :catch_0
    move-exception v0

    .line 217
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v4, "writeRequest failure"

    invoke-interface {v3, v4, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 218
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const-string v4, "SSLEngine"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 221
    sget-object v3, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v4, "SSLEngine failure"

    invoke-interface {v3, v4, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 222
    const/4 p4, 0x0

    goto :goto_0

    .line 225
    :cond_1
    :try_start_1
    invoke-interface {p5, v0}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 229
    :goto_1
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 230
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 231
    throw v1

    .line 226
    .end local v1    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 227
    .local v2, "t":Ljava/lang/Throwable;
    sget-object v3, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v4, "doConnect.writeRequest()"

    invoke-interface {v3, v4, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 237
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {p0, p6, p4}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->handleUnexpectedClosedChannel(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    goto :goto_0
.end method

.method private sendRequestWithCertainForceConnect(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZZ)Lcom/ning/http/client/ListenableFuture;
    .locals 15
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p4, "reclaimCache"    # Z
    .param p5, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p6, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p7, "useProxy"    # Z
    .param p8, "forceConnect"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;Z",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ProxyServer;",
            "ZZ)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    .local p3, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move/from16 v6, p8

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->newNettyRequestAndResponseFuture(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Z)Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    move-result-object v12

    .line 135
    .local v12, "newFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;

    move-result-object v3

    move-object v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->getCachedChannel(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ConnectionPoolPartitioning;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/AsyncHandler;)Lorg/jboss/netty/channel/Channel;

    move-result-object v6

    .line 137
    .local v6, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-static {v6}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object v4, v12

    move-object/from16 v5, p2

    .line 138
    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequestWithCachedChannel(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lorg/jboss/netty/channel/Channel;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    .line 140
    :goto_0
    return-object v0

    :cond_0
    move-object v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    move/from16 v11, p7

    move-object/from16 v13, p2

    move/from16 v14, p4

    invoke-direct/range {v7 .. v14}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequestWithNewChannel(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZLcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Z)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    goto :goto_0
.end method

.method private sendRequestWithNewChannel(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZLcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Z)Lcom/ning/http/client/ListenableFuture;
    .locals 22
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p4, "useProxy"    # Z
    .param p7, "reclaimCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ProxyServer;",
            "Z",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;Z)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    .local p5, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    .local p6, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    invoke-static/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->isSecure(Lcom/ning/http/client/uri/Uri;)Z

    move-result v4

    if-eqz v4, :cond_3

    if-nez p4, :cond_3

    const/16 v21, 0x1

    .line 254
    .local v21, "useSSl":Z
    :goto_0
    invoke-virtual/range {p5 .. p5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    .line 255
    .local v17, "headers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v19

    .line 256
    .local v19, "realm":Lcom/ning/http/client/Realm;
    :goto_1
    invoke-virtual/range {p5 .. p5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v18

    .line 257
    .local v18, "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->requestFactory:Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->requestFactory:Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, v19

    invoke-virtual {v5, v0, v1, v2, v3}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->firstRequestOnlyAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Realm;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->addAuthorizationHeader(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Ljava/lang/String;)V

    .line 258
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->requestFactory:Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->requestFactory:Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, v18

    invoke-virtual {v5, v0, v1, v2}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->firstRequestOnlyProxyAuthorizationHeader(Lcom/ning/http/client/Request;Lcom/ning/http/client/ProxyServer;Lorg/jboss/netty/handler/codec/http/HttpMethod;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v4, v0, v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestFactory;->setProxyAuthorizationHeader(Lorg/jboss/netty/handler/codec/http/HttpHeaders;Ljava/lang/String;)V

    .line 263
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    move/from16 v0, p4

    move/from16 v1, v21

    invoke-virtual {v4, v5, v0, v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->getBootstrap(Ljava/lang/String;ZZ)Lorg/jboss/netty/bootstrap/ClientBootstrap;

    move-result-object v9

    .line 265
    .local v9, "bootstrap":Lorg/jboss/netty/bootstrap/ClientBootstrap;
    const/4 v14, 0x0

    .line 266
    .local v14, "channelPreempted":Z
    const/4 v15, 0x0

    .line 270
    .local v15, "partition":Ljava/lang/String;
    if-nez p7, :cond_1

    .line 273
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v4}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnectionsPerHost()I

    move-result v4

    if-lez v4, :cond_0

    .line 274
    invoke-virtual/range {p5 .. p5}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getPartition()Ljava/lang/String;

    move-result-object v15

    .line 275
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v4, v15}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->preemptChannel(Ljava/lang/String;)V

    .line 277
    const/4 v14, 0x1

    .line 280
    :cond_1
    move-object/from16 v0, p6

    instance-of v4, v0, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v4, :cond_2

    .line 281
    const-class v4, Lcom/ning/http/client/AsyncHandlerExtensions;

    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v4}, Lcom/ning/http/client/AsyncHandlerExtensions;->onOpenConnection()V

    :cond_2
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move/from16 v8, p4

    move-object/from16 v10, p6

    .line 283
    invoke-direct/range {v4 .. v10}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->connect(Lcom/ning/http/client/Request;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZLorg/jboss/netty/bootstrap/ClientBootstrap;Lcom/ning/http/client/AsyncHandler;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v16

    .line 284
    .local v16, "channelFuture":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v10, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    move-object/from16 v11, p5

    move-object/from16 v12, p0

    invoke-direct/range {v10 .. v15}, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;-><init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/channel/ChannelManager;ZLjava/lang/String;)V

    move-object/from16 v0, v16

    invoke-interface {v0, v10}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 293
    .end local v16    # "channelFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :goto_2
    return-object p5

    .line 251
    .end local v9    # "bootstrap":Lorg/jboss/netty/bootstrap/ClientBootstrap;
    .end local v14    # "channelPreempted":Z
    .end local v15    # "partition":Ljava/lang/String;
    .end local v17    # "headers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .end local v18    # "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    .end local v19    # "realm":Lcom/ning/http/client/Realm;
    .end local v21    # "useSSl":Z
    :cond_3
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 255
    .restart local v17    # "headers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .restart local v21    # "useSSl":Z
    :cond_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v4}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v19

    goto/16 :goto_1

    .line 286
    .restart local v9    # "bootstrap":Lorg/jboss/netty/bootstrap/ClientBootstrap;
    .restart local v14    # "channelPreempted":Z
    .restart local v15    # "partition":Ljava/lang/String;
    .restart local v18    # "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    .restart local v19    # "realm":Lcom/ning/http/client/Realm;
    :catch_0
    move-exception v20

    .line 287
    .local v20, "t":Ljava/lang/Throwable;
    if-eqz v14, :cond_5

    .line 288
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v4, v15}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->abortChannelPreemption(Ljava/lang/String;)V

    .line 290
    :cond_5
    const/4 v4, 0x0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-nez v5, :cond_6

    .end local v20    # "t":Ljava/lang/Throwable;
    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, v20

    invoke-virtual {v0, v4, v1, v2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_2

    .restart local v20    # "t":Ljava/lang/Throwable;
    :cond_6
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v20

    goto :goto_3
.end method

.method private validateWebSocketRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Z
    .locals 2
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 491
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->GET:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 410
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    if-eqz p1, :cond_0

    .line 411
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 413
    :cond_0
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_1

    .line 414
    sget-object v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Aborting Future {}\n"

    invoke-interface {v0, v1, p2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 415
    sget-object v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 416
    invoke-virtual {p2, p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->abort(Ljava/lang/Throwable;)V

    .line 418
    :cond_1
    return-void
.end method

.method public applyIoExceptionFiltersAndReplayRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/io/IOException;Lorg/jboss/netty/channel/Channel;)Z
    .locals 7
    .param p2, "e"    # Ljava/io/IOException;
    .param p3, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Ljava/io/IOException;",
            "Lorg/jboss/netty/channel/Channel;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 463
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v4, 0x0

    .line 466
    .local v4, "replayed":Z
    new-instance v5, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct {v5}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->ioException(Ljava/io/IOException;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object v2

    .line 468
    .local v2, "fc":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<*>;"
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v5}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIOExceptionFilters()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/filter/IOExceptionFilter;

    .line 470
    .local v0, "asyncFilter":Lcom/ning/http/client/filter/IOExceptionFilter;
    :try_start_0
    invoke-interface {v0, v2}, Lcom/ning/http/client/filter/IOExceptionFilter;->filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;

    move-result-object v2

    .line 471
    if-nez v2, :cond_0

    .line 472
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "FilterContext is null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Lcom/ning/http/client/filter/FilterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 474
    :catch_0
    move-exception v1

    .line 475
    .local v1, "efe":Lcom/ning/http/client/filter/FilterException;
    invoke-virtual {p0, p3, p1, v1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 479
    .end local v0    # "asyncFilter":Lcom/ning/http/client/filter/IOExceptionFilter;
    .end local v1    # "efe":Lcom/ning/http/client/filter/FilterException;
    :cond_1
    invoke-virtual {v2}, Lcom/ning/http/client/filter/FilterContext;->replayRequest()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->canBeReplayed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 480
    invoke-virtual {p0, p1, v2, p3}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->replayRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/filter/FilterContext;Lorg/jboss/netty/channel/Channel;)V

    .line 481
    const/4 v4, 0x1

    .line 483
    :cond_2
    return v4
.end method

.method public handleUnexpectedClosedChannel(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 421
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 422
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 426
    :cond_0
    :goto_0
    return-void

    .line 424
    :cond_1
    invoke-virtual {p0, p2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->retry(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 425
    sget-object v0, Lcom/ning/http/util/AsyncHttpProviderUtils;->REMOTELY_CLOSED_EXCEPTION:Ljava/io/IOException;

    invoke-virtual {p0, p1, p2, v0}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 534
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public newTimeout(Lorg/jboss/netty/util/TimerTask;J)Lorg/jboss/netty/util/Timeout;
    .locals 2
    .param p1, "task"    # Lorg/jboss/netty/util/TimerTask;
    .param p2, "delay"    # J

    .prologue
    .line 405
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->nettyTimer:Lorg/jboss/netty/util/Timer;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p1, p2, p3, v1}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public pollAndVerifyCachedChannel(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/ConnectionPoolPartitioning;Lcom/ning/http/client/AsyncHandler;)Lorg/jboss/netty/channel/Channel;
    .locals 5
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p3, "connectionPoolPartitioning"    # Lcom/ning/http/client/ConnectionPoolPartitioning;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/ProxyServer;",
            "Lcom/ning/http/client/ConnectionPoolPartitioning;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;)",
            "Lorg/jboss/netty/channel/Channel;"
        }
    .end annotation

    .prologue
    .line 496
    .local p4, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    instance-of v2, p4, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v2, :cond_0

    .line 497
    const-class v2, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-virtual {v2, p4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v2}, Lcom/ning/http/client/AsyncHandlerExtensions;->onPoolConnection()V

    .line 499
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v2, p1, p2, p3}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->poll(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/ConnectionPoolPartitioning;)Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 501
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    if-eqz v0, :cond_1

    .line 502
    sget-object v2, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Using cached Channel {}\n for uri {}\n"

    invoke-interface {v2, v3, v0, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 508
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v3

    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->verifyChannelPipeline(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 513
    :cond_1
    :goto_0
    return-object v0

    .line 509
    :catch_0
    move-exception v1

    .line 510
    .local v1, "ex":Ljava/lang/Exception;
    sget-object v2, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public replayRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/filter/FilterContext;Lorg/jboss/netty/channel/Channel;)V
    .locals 3
    .param p2, "fc"    # Lcom/ning/http/client/filter/FilterContext;
    .param p3, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/filter/FilterContext;",
            "Lorg/jboss/netty/channel/Channel;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {p2}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v0

    .line 520
    .local v0, "newRequest":Lcom/ning/http/client/Request;
    invoke-virtual {p2}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setAsyncHandler(Lcom/ning/http/client/AsyncHandler;)V

    .line 521
    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-virtual {p1, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setState(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;)V

    .line 522
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch()V

    .line 524
    sget-object v1, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "\n\nReplaying Request {}\n for Future {}\n"

    invoke-interface {v1, v2, v0, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 525
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v1

    instance-of v1, v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v1, :cond_0

    .line 526
    const-class v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v1}, Lcom/ning/http/client/AsyncHandlerExtensions;->onRetry()V

    .line 528
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v1, p3, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->drainChannelAndOffer(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 529
    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendNextRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 530
    return-void
.end method

.method public retry(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v2, 0x0

    .line 430
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    .line 456
    :goto_0
    return v1

    .line 436
    :cond_0
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->canBeReplayed()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 437
    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->RECONNECTED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-virtual {p1, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setState(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;)V

    .line 439
    sget-object v1, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Trying to recover request {}\n"

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 440
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v1

    instance-of v1, v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v1, :cond_1

    .line 441
    const-class v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v1}, Lcom/ning/http/client/AsyncHandlerExtensions;->onRetry()V

    .line 444
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendNextRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 445
    const/4 v1, 0x1

    goto :goto_0

    .line 447
    :catch_0
    move-exception v0

    .line 448
    .local v0, "iox":Ljava/io/IOException;
    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->CLOSED:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-virtual {p1, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setState(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;)V

    .line 449
    invoke-virtual {p1, v0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->abort(Ljava/lang/Throwable;)V

    .line 450
    sget-object v1, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Remotely closed, unable to recover"

    invoke-interface {v1, v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v1, v2

    .line 451
    goto :goto_0

    .line 455
    .end local v0    # "iox":Ljava/io/IOException;
    :cond_2
    sget-object v1, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Unable to recover future {}\n"

    invoke-interface {v1, v3, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    move v1, v2

    .line 456
    goto :goto_0
.end method

.method public sendNextRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .locals 2
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 487
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, p2, v1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;

    .line 488
    return-void
.end method

.method public sendRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    .locals 11
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .param p4, "reclaimCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;Z)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    .local p3, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 93
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_0
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v5

    .line 99
    .local v5, "uri":Lcom/ning/http/client/uri/Uri;
    invoke-virtual {v5}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ws"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->validateWebSocketRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 100
    new-instance v0, Ljava/io/IOException;

    const-string v1, "WebSocket method must be a GET"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-static {v0, p1}, Lcom/ning/http/util/ProxyUtils;->getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;

    move-result-object v6

    .line 103
    .local v6, "proxyServer":Lcom/ning/http/client/ProxyServer;
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    if-ne v0, v1, :cond_2

    move v9, v7

    .line 105
    .local v9, "resultOfAConnect":Z
    :goto_0
    if-eqz v6, :cond_3

    if-nez v9, :cond_3

    move v10, v7

    .line 107
    .local v10, "useProxy":Z
    :goto_1
    if-eqz v10, :cond_5

    invoke-static {v5}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->useProxyConnect(Lcom/ning/http/client/uri/Uri;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 109
    if-eqz p3, :cond_4

    invoke-virtual {p3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isConnectAllowed()Z

    move-result v0

    if-eqz v0, :cond_4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v8, v7

    .line 111
    invoke-direct/range {v0 .. v8}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequestWithCertainForceConnect(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZZ)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    .line 115
    :goto_2
    return-object v0

    .end local v9    # "resultOfAConnect":Z
    .end local v10    # "useProxy":Z
    :cond_2
    move v9, v8

    .line 103
    goto :goto_0

    .restart local v9    # "resultOfAConnect":Z
    :cond_3
    move v10, v8

    .line 105
    goto :goto_1

    .restart local v10    # "useProxy":Z
    :cond_4
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 113
    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequestThroughSslProxy(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    goto :goto_2

    :cond_5
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v7, v10

    .line 115
    invoke-direct/range {v0 .. v8}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequestWithCertainForceConnect(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;ZZ)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    goto :goto_2
.end method

.method public writeRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;)V
    .locals 9
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;",
            "Lorg/jboss/netty/channel/Channel;",
            ")V"
        }
    .end annotation

    .prologue
    .line 316
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v2

    .line 317
    .local v2, "nettyRequest":Lcom/ning/http/client/providers/netty/request/NettyRequest;
    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v1

    .line 318
    .local v1, "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v0

    .line 323
    .local v0, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 349
    :cond_0
    :goto_0
    return-void

    .line 327
    :cond_1
    :try_start_0
    instance-of v4, v0, Lcom/ning/http/client/listener/TransferCompletionHandler;

    if-eqz v4, :cond_2

    .line 328
    invoke-direct {p0, v0, v1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->configureTransferAdapter(Lcom/ning/http/client/AsyncHandler;Lorg/jboss/netty/handler/codec/http/HttpRequest;)V

    .line 330
    :cond_2
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isHeadersAlreadyWrittenOnContinue()Z

    move-result v4

    if-nez v4, :cond_4

    .line 331
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v4

    instance-of v4, v4, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v4, :cond_3

    .line 332
    const-class v4, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v4, v2}, Lcom/ning/http/client/AsyncHandlerExtensions;->onSendRequest(Ljava/lang/Object;)V

    .line 333
    :cond_3
    invoke-interface {p2, v1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    new-instance v5, Lcom/ning/http/client/providers/netty/request/ProgressListener;

    iget-object v6, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v7

    const/4 v8, 0x1

    invoke-direct {v5, v6, v7, p1, v8}, Lcom/ning/http/client/providers/netty/request/ProgressListener;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)V

    invoke-interface {v4, v5}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 337
    :cond_4
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDontWriteBodyBecauseExpectContinue()Z

    move-result v4

    if-nez v4, :cond_5

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v4

    sget-object v5, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getBody()Lcom/ning/http/client/providers/netty/request/body/NettyBody;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 339
    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getBody()Lcom/ning/http/client/providers/netty/request/body/NettyBody;

    move-result-object v4

    iget-object v5, p0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-interface {v4, p2, p1, v5}, Lcom/ning/http/client/providers/netty/request/body/NettyBody;->write(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 342
    :cond_5
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 343
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->scheduleTimeouts(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 345
    :catch_0
    move-exception v3

    .line 346
    .local v3, "t":Ljava/lang/Throwable;
    sget-object v4, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Can\'t write request"

    invoke-interface {v4, v5, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 347
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0
.end method
