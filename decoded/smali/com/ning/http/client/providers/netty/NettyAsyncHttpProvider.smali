.class public Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "NettyAsyncHttpProvider.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHttpProvider;


# static fields
.field static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final allowStopNettyTimer:Z

.field private final channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

.field private final nettyTimer:Lorg/jboss/netty/util/Timer;

.field private final requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 6
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 38
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 48
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 49
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v0

    instance-of v0, v0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    :goto_0
    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .line 53
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getNettyTimer()Lorg/jboss/netty/util/Timer;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->allowStopNettyTimer:Z

    .line 54
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->allowStopNettyTimer:Z

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->newNettyTimer()Lorg/jboss/netty/util/Timer;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyTimer:Lorg/jboss/netty/util/Timer;

    .line 56
    new-instance v0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyTimer:Lorg/jboss/netty/util/Timer;

    invoke-direct {v0, p1, v1, v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lorg/jboss/netty/util/Timer;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .line 57
    new-instance v0, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyTimer:Lorg/jboss/netty/util/Timer;

    iget-object v5, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lorg/jboss/netty/util/Timer;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .line 58
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1, v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->configureBootstraps(Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 59
    return-void

    .line 49
    :cond_0
    new-instance v0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct {v0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;-><init>()V

    goto :goto_0

    :cond_1
    move v0, v1

    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getNettyTimer()Lorg/jboss/netty/util/Timer;

    move-result-object v0

    goto :goto_2
.end method

.method private newNettyTimer()Lorg/jboss/netty/util/Timer;
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-direct {v0}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>()V

    .line 63
    .local v0, "timer":Lorg/jboss/netty/util/HashedWheelTimer;
    invoke-virtual {v0}, Lorg/jboss/netty/util/HashedWheelTimer;->start()V

    .line 64
    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 4

    .prologue
    .line 68
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->close()V

    .line 73
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 75
    iget-boolean v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->allowStopNettyTimer:Z

    if-eqz v1, :cond_0

    .line 76
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->nettyTimer:Lorg/jboss/netty/util/Timer;

    invoke-interface {v1}, Lorg/jboss/netty/util/Timer;->stop()Ljava/util/Set;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "Unexpected error on close"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;
    .locals 4
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 87
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, p1, p2, v2, v3}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->sendRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 90
    :goto_0
    return-object v1

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/Exception;
    invoke-interface {p2, v0}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V

    .line 90
    new-instance v1, Lcom/ning/http/client/ListenableFuture$CompletedFailure;

    invoke-direct {v1, v0}, Lcom/ning/http/client/ListenableFuture$CompletedFailure;-><init>(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public flushChannelPoolPartition(Ljava/lang/String;)V
    .locals 1
    .param p1, "partitionId"    # Ljava/lang/String;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->flushPartition(Ljava/lang/String;)V

    .line 96
    return-void
.end method

.method public flushChannelPoolPartitions(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;)V
    .locals 1
    .param p1, "selector"    # Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProvider;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->flushPartitions(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;)V

    .line 100
    return-void
.end method
