.class public Lcom/ning/http/client/providers/netty/channel/ChannelManager;
.super Ljava/lang/Object;
.source "ChannelManager.java"


# static fields
.field public static final CHUNKED_WRITER_HANDLER:Ljava/lang/String; = "chunkedWriter"

.field public static final DEFLATER_HANDLER:Ljava/lang/String; = "deflater"

.field public static final HTTP_HANDLER:Ljava/lang/String; = "httpHandler"

.field public static final HTTP_PROCESSOR:Ljava/lang/String; = "httpProcessor"

.field public static final INFLATER_HANDLER:Ljava/lang/String; = "inflater"

.field private static final LOGGER:Lorg/slf4j/Logger;

.field public static final SSL_HANDLER:Ljava/lang/String; = "sslHandler"

.field public static final WS_DECODER_HANDLER:Ljava/lang/String; = "ws-decoder"

.field public static final WS_ENCODER_HANDLER:Ljava/lang/String; = "ws-encoder"

.field public static final WS_FRAME_AGGREGATOR:Ljava/lang/String; = "ws-aggregator"

.field public static final WS_PROCESSOR:Ljava/lang/String; = "wsProcessor"


# instance fields
.field private final allowReleaseSocketChannelFactory:Z

.field private final channelId2Partition:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final freeChannels:Ljava/util/concurrent/Semaphore;

.field private final freeChannelsPerHost:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/Semaphore;",
            ">;"
        }
    .end annotation
.end field

.field private final handshakeTimeout:J

.field private final maxConnectionsPerHostEnabled:Z

.field private final maxTotalConnectionsEnabled:Z

.field private final nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

.field private final nettyTimer:Lorg/jboss/netty/util/Timer;

.field private final openChannels:Lorg/jboss/netty/channel/group/ChannelGroup;

.field private final plainBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

.field private final poolAlreadyClosed:Ljava/io/IOException;

.field private final secureBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

.field private final secureWebSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

.field private final socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

.field private final sslEngineFactory:Lcom/ning/http/client/SSLEngineFactory;

.field private final tooManyConnections:Ljava/io/IOException;

.field private final tooManyConnectionsPerHost:Ljava/io/IOException;

.field private final webSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

.field private wsProcessor:Lcom/ning/http/client/providers/netty/handler/Processor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const-class v0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lorg/jboss/netty/util/Timer;)V
    .locals 11
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .param p3, "nettyTimer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 114
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .line 115
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyTimer:Lorg/jboss/netty/util/Timer;

    .line 116
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getSslEngineFactory()Lcom/ning/http/client/SSLEngineFactory;

    move-result-object v7

    if-eqz v7, :cond_2

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getSslEngineFactory()Lcom/ning/http/client/SSLEngineFactory;

    move-result-object v7

    :goto_0
    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->sslEngineFactory:Lcom/ning/http/client/SSLEngineFactory;

    .line 118
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getChannelPool()Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    move-result-object v0

    .line 119
    .local v0, "channelPool":Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    if-nez v0, :cond_3

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAllowPoolingConnections()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 120
    new-instance v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    .end local v0    # "channelPool":Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    invoke-direct {v0, p1, p3}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lorg/jboss/netty/util/Timer;)V

    .line 124
    .restart local v0    # "channelPool":Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    :cond_0
    :goto_1
    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    .line 126
    const-string v7, "Too many connections %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/ning/http/util/MiscUtils;->buildStaticException(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v7

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tooManyConnections:Ljava/io/IOException;

    .line 127
    const-string v7, "Too many connections per host %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnectionsPerHost()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/ning/http/util/MiscUtils;->buildStaticException(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v7

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tooManyConnectionsPerHost:Ljava/io/IOException;

    .line 128
    const-string v7, "Pool is already closed"

    invoke-static {v7}, Lcom/ning/http/util/MiscUtils;->buildStaticException(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v7

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->poolAlreadyClosed:Ljava/io/IOException;

    .line 129
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v7

    if-lez v7, :cond_4

    const/4 v7, 0x1

    :goto_2
    iput-boolean v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxTotalConnectionsEnabled:Z

    .line 130
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnectionsPerHost()I

    move-result v7

    if-lez v7, :cond_5

    const/4 v7, 0x1

    :goto_3
    iput-boolean v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxConnectionsPerHostEnabled:Z

    .line 132
    iget-boolean v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxTotalConnectionsEnabled:Z

    if-eqz v7, :cond_6

    .line 133
    new-instance v7, Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;

    const-string v8, "asyncHttpClient"

    invoke-direct {v7, p0, v8}, Lcom/ning/http/client/providers/netty/channel/ChannelManager$1;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Ljava/lang/String;)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->openChannels:Lorg/jboss/netty/channel/group/ChannelGroup;

    .line 151
    new-instance v7, Ljava/util/concurrent/Semaphore;

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v8

    invoke-direct {v7, v8}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannels:Ljava/util/concurrent/Semaphore;

    .line 157
    :goto_4
    iget-boolean v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxConnectionsPerHostEnabled:Z

    if-eqz v7, :cond_7

    .line 158
    new-instance v7, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v7}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannelsPerHost:Ljava/util/concurrent/ConcurrentHashMap;

    .line 159
    new-instance v7, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v7}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelId2Partition:Ljava/util/concurrent/ConcurrentHashMap;

    .line 165
    :goto_5
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getHandshakeTimeout()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->handshakeTimeout:J

    .line 167
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getSocketChannelFactory()Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;

    move-result-object v7

    if-eqz v7, :cond_8

    .line 168
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getSocketChannelFactory()Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;

    move-result-object v7

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    .line 170
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->allowReleaseSocketChannelFactory:Z

    .line 182
    :goto_6
    new-instance v7, Lorg/jboss/netty/bootstrap/ClientBootstrap;

    iget-object v8, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    invoke-direct {v7, v8}, Lorg/jboss/netty/bootstrap/ClientBootstrap;-><init>(Lorg/jboss/netty/channel/ChannelFactory;)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->plainBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    .line 183
    new-instance v7, Lorg/jboss/netty/bootstrap/ClientBootstrap;

    iget-object v8, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    invoke-direct {v7, v8}, Lorg/jboss/netty/bootstrap/ClientBootstrap;-><init>(Lorg/jboss/netty/channel/ChannelFactory;)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    .line 184
    new-instance v7, Lorg/jboss/netty/bootstrap/ClientBootstrap;

    iget-object v8, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    invoke-direct {v7, v8}, Lorg/jboss/netty/bootstrap/ClientBootstrap;-><init>(Lorg/jboss/netty/channel/ChannelFactory;)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->webSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    .line 185
    new-instance v7, Lorg/jboss/netty/bootstrap/ClientBootstrap;

    iget-object v8, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    invoke-direct {v7, v8}, Lorg/jboss/netty/bootstrap/ClientBootstrap;-><init>(Lorg/jboss/netty/channel/ChannelFactory;)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureWebSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    .line 187
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->isUseDeadLockChecker()Z

    move-result v7

    invoke-static {v7}, Lorg/jboss/netty/channel/DefaultChannelFuture;->setUseDeadLockChecker(Z)V

    .line 190
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectTimeout()I

    move-result v7

    if-lez v7, :cond_1

    .line 191
    const-string v7, "connectTimeoutMillis"

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectTimeout()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p2, v7, v8}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->addProperty(Ljava/lang/String;Ljava/lang/Object;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .line 192
    :cond_1
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->propertiesSet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 193
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 194
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    .line 195
    .local v6, "value":Ljava/lang/Object;
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->plainBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v7, v4, v6}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setOption(Ljava/lang/String;Ljava/lang/Object;)V

    .line 196
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->webSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v7, v4, v6}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setOption(Ljava/lang/String;Ljava/lang/Object;)V

    .line 197
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v7, v4, v6}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setOption(Ljava/lang/String;Ljava/lang/Object;)V

    .line 198
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureWebSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v7, v4, v6}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setOption(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_7

    .line 116
    .end local v0    # "channelPool":Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_2
    new-instance v7, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;

    invoke-direct {v7, p1}, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V

    goto/16 :goto_0

    .line 121
    .restart local v0    # "channelPool":Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    :cond_3
    if-nez v0, :cond_0

    .line 122
    new-instance v0, Lcom/ning/http/client/providers/netty/channel/pool/NoopChannelPool;

    .end local v0    # "channelPool":Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    invoke-direct {v0}, Lcom/ning/http/client/providers/netty/channel/pool/NoopChannelPool;-><init>()V

    .restart local v0    # "channelPool":Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
    goto/16 :goto_1

    .line 129
    :cond_4
    const/4 v7, 0x0

    goto/16 :goto_2

    .line 130
    :cond_5
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 153
    :cond_6
    new-instance v7, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;

    const-string v8, "asyncHttpClient"

    invoke-direct {v7, v8}, Lcom/ning/http/client/providers/netty/channel/CleanupChannelGroup;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->openChannels:Lorg/jboss/netty/channel/group/ChannelGroup;

    .line 154
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannels:Ljava/util/concurrent/Semaphore;

    goto/16 :goto_4

    .line 161
    :cond_7
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannelsPerHost:Ljava/util/concurrent/ConcurrentHashMap;

    .line 162
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelId2Partition:Ljava/util/concurrent/ConcurrentHashMap;

    goto/16 :goto_5

    .line 173
    :cond_8
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getBossExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    .line 174
    .local v1, "e":Ljava/util/concurrent/ExecutorService;
    if-nez v1, :cond_9

    .line 175
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    .line 176
    :cond_9
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIoThreadMultiplier()I

    move-result v7

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v8

    mul-int v5, v7, v8

    .line 177
    .local v5, "numWorkers":I
    sget-object v7, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->LOGGER:Lorg/slf4j/Logger;

    const-string v8, "Number of application\'s worker threads is {}"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;Ljava/lang/Object;)V

    .line 178
    new-instance v7, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v8

    invoke-direct {v7, v1, v8, v5}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;I)V

    iput-object v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    .line 179
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->allowReleaseSocketChannelFactory:Z

    goto/16 :goto_6

    .line 200
    .end local v1    # "e":Ljava/util/concurrent/ExecutorService;
    .end local v5    # "numWorkers":I
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_a
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Ljava/util/concurrent/Semaphore;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannels:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$100(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxConnectionsPerHostEnabled:Z

    return v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelId2Partition:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$300(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannelsPerHost:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lorg/jboss/netty/handler/codec/http/HttpClientCodec;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newHttpClientCodec()Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newHttpContentDecompressor()Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    return-object v0
.end method

.method static synthetic access$700(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)Lcom/ning/http/client/providers/netty/handler/Processor;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->wsProcessor:Lcom/ning/http/client/providers/netty/handler/Processor;

    return-object v0
.end method

.method private getFreeConnectionsForHost(Ljava/lang/String;)Ljava/util/concurrent/Semaphore;
    .locals 3
    .param p1, "partition"    # Ljava/lang/String;

    .prologue
    .line 312
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannelsPerHost:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Semaphore;

    .line 313
    .local v0, "freeConnections":Ljava/util/concurrent/Semaphore;
    if-nez v0, :cond_0

    .line 315
    new-instance v1, Ljava/util/concurrent/Semaphore;

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnectionsPerHost()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 316
    .local v1, "newFreeConnections":Ljava/util/concurrent/Semaphore;
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannelsPerHost:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "freeConnections":Ljava/util/concurrent/Semaphore;
    check-cast v0, Ljava/util/concurrent/Semaphore;

    .line 317
    .restart local v0    # "freeConnections":Ljava/util/concurrent/Semaphore;
    if-nez v0, :cond_0

    .line 318
    move-object v0, v1

    .line 320
    .end local v1    # "newFreeConnections":Ljava/util/concurrent/Semaphore;
    :cond_0
    return-object v0
.end method

.method public static getSslHandler(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/handler/ssl/SslHandler;
    .locals 1
    .param p0, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 408
    const-string v0, "sslHandler"

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    return-object v0
.end method

.method public static isSslHandlerConfigured(Lorg/jboss/netty/channel/ChannelPipeline;)Z
    .locals 1
    .param p0, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 412
    const-string v0, "sslHandler"

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private newHttpClientCodec()Lorg/jboss/netty/handler/codec/http/HttpClientCodec;
    .locals 4

    .prologue
    .line 392
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getHttpClientCodecMaxInitialLineLength()I

    move-result v1

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getHttpClientCodecMaxHeaderSize()I

    move-result v2

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getHttpClientCodecMaxChunkSize()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;-><init>(III)V

    return-object v0
.end method

.method private newHttpContentDecompressor()Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->isKeepEncodingHeader()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    new-instance v0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$6;

    invoke-direct {v0, p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager$6;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V

    .line 282
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/HttpContentDecompressor;-><init>()V

    goto :goto_0
.end method

.method private tryAcquireGlobal()Z
    .locals 1

    .prologue
    .line 308
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxTotalConnectionsEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannels:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

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

.method private tryAcquirePerHost(Ljava/lang/String;)Z
    .locals 1
    .param p1, "partition"    # Ljava/lang/String;

    .prologue
    .line 324
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxConnectionsPerHostEnabled:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->getFreeConnectionsForHost(Ljava/lang/String;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

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


# virtual methods
.method public abortChannelPreemption(Ljava/lang/String;)V
    .locals 1
    .param p1, "partition"    # Ljava/lang/String;

    .prologue
    .line 378
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxTotalConnectionsEnabled:Z

    if-eqz v0, :cond_0

    .line 379
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannels:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 380
    :cond_0
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxConnectionsPerHostEnabled:Z

    if-eqz v0, :cond_1

    .line 381
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->getFreeConnectionsForHost(Ljava/lang/String;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 382
    :cond_1
    return-void
.end method

.method public close()V
    .locals 5

    .prologue
    .line 341
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    invoke-interface {v4}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;->destroy()V

    .line 342
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->openChannels:Lorg/jboss/netty/channel/group/ChannelGroup;

    invoke-interface {v4}, Lorg/jboss/netty/channel/group/ChannelGroup;->close()Lorg/jboss/netty/channel/group/ChannelGroupFuture;

    .line 344
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->openChannels:Lorg/jboss/netty/channel/group/ChannelGroup;

    invoke-interface {v4}, Lorg/jboss/netty/channel/group/ChannelGroup;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/Channel;

    .line 345
    .local v1, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-static {v1}, Lcom/ning/http/client/providers/netty/channel/Channels;->getAttribute(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v0

    .line 346
    .local v0, "attribute":Ljava/lang/Object;
    instance-of v4, v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    if-eqz v4, :cond_0

    move-object v2, v0

    .line 347
    check-cast v2, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 348
    .local v2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->cancelTimeouts()V

    goto :goto_0

    .line 353
    .end local v0    # "attribute":Ljava/lang/Object;
    .end local v1    # "channel":Lorg/jboss/netty/channel/Channel;
    .end local v2    # "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    :cond_1
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v4}, Lcom/ning/http/client/AsyncHttpClientConfig;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 354
    iget-boolean v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->allowReleaseSocketChannelFactory:Z

    if-eqz v4, :cond_2

    .line 355
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->socketChannelFactory:Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    invoke-interface {v4}, Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;->releaseExternalResources()V

    .line 356
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->plainBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->releaseExternalResources()V

    .line 357
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->releaseExternalResources()V

    .line 358
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->webSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->releaseExternalResources()V

    .line 359
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureWebSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    invoke-virtual {v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->releaseExternalResources()V

    .line 361
    :cond_2
    return-void
.end method

.method public closeChannel(Lorg/jboss/netty/channel/Channel;)V
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 366
    sget-object v1, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "Closing Channel {} "

    invoke-interface {v1, v2, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 368
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->removeAll(Lorg/jboss/netty/channel/Channel;)Z

    .line 369
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->setDiscard(Lorg/jboss/netty/channel/Channel;)V

    .line 370
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 374
    :goto_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->openChannels:Lorg/jboss/netty/channel/group/ChannelGroup;

    invoke-interface {v1, p1}, Lorg/jboss/netty/channel/group/ChannelGroup;->remove(Ljava/lang/Object;)Z

    .line 375
    return-void

    .line 371
    :catch_0
    move-exception v0

    .line 372
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "Error closing a connection"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public configureBootstraps(Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 5
    .param p1, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;
    .param p2, "closed"    # Ljava/util/concurrent/atomic/AtomicBoolean;

    .prologue
    .line 204
    new-instance v1, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct {v1, p0, v3, v4, p1}, Lcom/ning/http/client/providers/netty/handler/HttpProtocol;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;)V

    .line 205
    .local v1, "httpProtocol":Lcom/ning/http/client/providers/netty/handler/Protocol;
    new-instance v0, Lcom/ning/http/client/providers/netty/handler/Processor;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-direct {v0, v3, p0, p1, v1}, Lcom/ning/http/client/providers/netty/handler/Processor;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/handler/Protocol;)V

    .line 207
    .local v0, "httpProcessor":Lcom/ning/http/client/providers/netty/handler/Processor;
    new-instance v2, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-direct {v2, p0, v3, v4, p1}, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;)V

    .line 208
    .local v2, "wsProtocol":Lcom/ning/http/client/providers/netty/handler/Protocol;
    new-instance v3, Lcom/ning/http/client/providers/netty/handler/Processor;

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-direct {v3, v4, p0, p1, v2}, Lcom/ning/http/client/providers/netty/handler/Processor;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/handler/Protocol;)V

    iput-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->wsProcessor:Lcom/ning/http/client/providers/netty/handler/Processor;

    .line 210
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->plainBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    new-instance v4, Lcom/ning/http/client/providers/netty/channel/ChannelManager$2;

    invoke-direct {v4, p0, v0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager$2;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/handler/Processor;)V

    invoke-virtual {v3, v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V

    .line 226
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->webSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    new-instance v4, Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;

    invoke-direct {v4, p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager$3;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V

    invoke-virtual {v3, v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V

    .line 240
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    new-instance v4, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;

    invoke-direct {v4, p0, v0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager$4;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/handler/Processor;)V

    invoke-virtual {v3, v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V

    .line 257
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureWebSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    new-instance v4, Lcom/ning/http/client/providers/netty/channel/ChannelManager$5;

    invoke-direct {v4, p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager$5;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V

    invoke-virtual {v3, v4}, Lorg/jboss/netty/bootstrap/ClientBootstrap;->setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V

    .line 271
    return-void
.end method

.method public createSslHandler(Ljava/lang/String;I)Lorg/jboss/netty/handler/ssl/SslHandler;
    .locals 9
    .param p1, "peerHost"    # Ljava/lang/String;
    .param p2, "peerPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 399
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->sslEngineFactory:Lcom/ning/http/client/SSLEngineFactory;

    invoke-interface {v1, p1, p2}, Lcom/ning/http/client/SSLEngineFactory;->newSSLEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;

    move-result-object v2

    .line 400
    .local v2, "sslEngine":Ljavax/net/ssl/SSLEngine;
    iget-wide v4, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->handshakeTimeout:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-lez v1, :cond_0

    new-instance v1, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {}, Lorg/jboss/netty/handler/ssl/SslHandler;->getDefaultBufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-result-object v3

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyTimer:Lorg/jboss/netty/util/Timer;

    iget-wide v6, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->handshakeTimeout:J

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/ssl/SslHandler;-><init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;ZLorg/jboss/netty/util/Timer;J)V

    move-object v0, v1

    .line 402
    .local v0, "sslHandler":Lorg/jboss/netty/handler/ssl/SslHandler;
    :goto_0
    invoke-virtual {v0, v8}, Lorg/jboss/netty/handler/ssl/SslHandler;->setIssueHandshake(Z)V

    .line 403
    invoke-virtual {v0, v8}, Lorg/jboss/netty/handler/ssl/SslHandler;->setCloseOnSSLException(Z)V

    .line 404
    return-object v0

    .line 400
    .end local v0    # "sslHandler":Lorg/jboss/netty/handler/ssl/SslHandler;
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-direct {v0, v2}, Lorg/jboss/netty/handler/ssl/SslHandler;-><init>(Ljavax/net/ssl/SSLEngine;)V

    goto :goto_0
.end method

.method public drainChannelAndOffer(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .locals 2
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
    .line 473
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isKeepAlive()Z

    move-result v0

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getPartition()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->drainChannelAndOffer(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLjava/lang/String;)V

    .line 474
    return-void
.end method

.method public drainChannelAndOffer(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLjava/lang/String;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "keepAlive"    # Z
    .param p4, "partition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 477
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {p0, p2, p1, p3, p4}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newDrainCallback(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)Lcom/ning/http/client/providers/netty/Callback;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ning/http/client/providers/netty/channel/Channels;->setAttribute(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 478
    return-void
.end method

.method public flushPartition(Ljava/lang/String;)V
    .locals 1
    .param p1, "partitionId"    # Ljava/lang/String;

    .prologue
    .line 481
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    invoke-interface {v0, p1}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;->flushPartition(Ljava/lang/String;)V

    .line 482
    return-void
.end method

.method public flushPartitions(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;)V
    .locals 1
    .param p1, "selector"    # Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;

    .prologue
    .line 485
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    invoke-interface {v0, p1}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;->flushPartitions(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;)V

    .line 486
    return-void
.end method

.method public getBootstrap(Ljava/lang/String;ZZ)Lorg/jboss/netty/bootstrap/ClientBootstrap;
    .locals 1
    .param p1, "scheme"    # Ljava/lang/String;
    .param p2, "useProxy"    # Z
    .param p3, "useSSl"    # Z

    .prologue
    .line 449
    const-string v0, "ws"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_1

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureWebSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->webSocketBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    goto :goto_0

    :cond_1
    if-eqz p3, :cond_2

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->secureBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->plainBootstrap:Lorg/jboss/netty/bootstrap/ClientBootstrap;

    goto :goto_0
.end method

.method public final newDrainCallback(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)Lcom/ning/http/client/providers/netty/Callback;
    .locals 6
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "keepAlive"    # Z
    .param p4, "partition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lorg/jboss/netty/channel/Channel;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Lcom/ning/http/client/providers/netty/Callback;"
        }
    .end annotation

    .prologue
    .line 464
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    new-instance v0, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/channel/ChannelManager$7;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)V

    return-object v0
.end method

.method public poll(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/ConnectionPoolPartitioning;)Lorg/jboss/netty/channel/Channel;
    .locals 2
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "proxy"    # Lcom/ning/http/client/ProxyServer;
    .param p3, "connectionPoolPartitioning"    # Lcom/ning/http/client/ConnectionPoolPartitioning;

    .prologue
    .line 299
    invoke-interface {p3, p1, p2}, Lcom/ning/http/client/ConnectionPoolPartitioning;->getPartitionId(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v0

    .line 300
    .local v0, "partitionId":Ljava/lang/String;
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    invoke-interface {v1, v0}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;->poll(Ljava/lang/String;)Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    return-object v1
.end method

.method public preemptChannel(Ljava/lang/String;)V
    .locals 1
    .param p1, "partition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 328
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    invoke-interface {v0}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 329
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->poolAlreadyClosed:Ljava/io/IOException;

    throw v0

    .line 330
    :cond_0
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tryAcquireGlobal()Z

    move-result v0

    if-nez v0, :cond_1

    .line 331
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tooManyConnections:Ljava/io/IOException;

    throw v0

    .line 332
    :cond_1
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tryAcquirePerHost(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 333
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxTotalConnectionsEnabled:Z

    if-eqz v0, :cond_2

    .line 334
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->freeChannels:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 336
    :cond_2
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->tooManyConnectionsPerHost:Ljava/io/IOException;

    throw v0

    .line 338
    :cond_3
    return-void
.end method

.method public registerOpenChannel(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "partition"    # Ljava/lang/String;

    .prologue
    .line 385
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->openChannels:Lorg/jboss/netty/channel/group/ChannelGroup;

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/group/ChannelGroup;->add(Ljava/lang/Object;)Z

    .line 386
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxConnectionsPerHostEnabled:Z

    if-eqz v0, :cond_0

    .line 387
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelId2Partition:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    :cond_0
    return-void
.end method

.method public removeAll(Lorg/jboss/netty/channel/Channel;)Z
    .locals 1
    .param p1, "connection"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 304
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    invoke-interface {v0, p1}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;->removeAll(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    return v0
.end method

.method public final tryToOfferChannelToPool(Lorg/jboss/netty/channel/Channel;ZLjava/lang/String;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "keepAlive"    # Z
    .param p3, "partition"    # Ljava/lang/String;

    .prologue
    .line 286
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 287
    sget-object v0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Adding key: {} for channel {}"

    invoke-interface {v0, v1, p3, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 288
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelPool:Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;

    invoke-interface {v0, p1, p3}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;->offer(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)Z

    .line 289
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->maxConnectionsPerHostEnabled:Z

    if-eqz v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->channelId2Partition:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    :cond_0
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->setDiscard(Lorg/jboss/netty/channel/Channel;)V

    .line 296
    :goto_0
    return-void

    .line 294
    :cond_1
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0
.end method

.method public upgradePipelineForWebSockets(Lorg/jboss/netty/channel/ChannelPipeline;)V
    .locals 7
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    const/4 v6, 0x0

    .line 454
    const-string v0, "httpHandler"

    const-string v1, "ws-encoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;-><init>(Z)V

    invoke-interface {p1, v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 455
    const-string v0, "httpHandler"

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 456
    const-string v0, "wsProcessor"

    const-string v1, "ws-decoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getWebSocketMaxFrameSize()I

    move-result v3

    int-to-long v4, v3

    invoke-direct {v2, v6, v6, v4, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;-><init>(ZZJ)V

    invoke-interface {p1, v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addBefore(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 458
    const-string v0, "ws-decoder"

    const-string v1, "ws-aggregator"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getWebSocketMaxBufferSize()I

    move-result v3

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrameAggregator;-><init>(I)V

    invoke-interface {p1, v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 459
    return-void
.end method

.method public upgradeProtocol(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "scheme"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 417
    const-string v0, "httpHandler"

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 418
    const-string v0, "httpHandler"

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 420
    :cond_0
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->isSecure(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 421
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->isSslHandlerConfigured(Lorg/jboss/netty/channel/ChannelPipeline;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 422
    const-string v0, "sslHandler"

    const-string v1, "httpHandler"

    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newHttpClientCodec()Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 430
    :goto_0
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->isWebSocket(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 431
    const-string v0, "httpProcessor"

    const-string v1, "wsProcessor"

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->wsProcessor:Lcom/ning/http/client/providers/netty/handler/Processor;

    invoke-interface {p1, v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 432
    const-string v0, "httpProcessor"

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 434
    :cond_1
    return-void

    .line 424
    :cond_2
    const-string v0, "httpHandler"

    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newHttpClientCodec()Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->addFirst(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 425
    const-string v0, "sslHandler"

    invoke-virtual {p0, p3, p4}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->createSslHandler(Ljava/lang/String;I)Lorg/jboss/netty/handler/ssl/SslHandler;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->addFirst(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    goto :goto_0

    .line 428
    :cond_3
    const-string v0, "httpHandler"

    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->newHttpClientCodec()Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->addFirst(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    goto :goto_0
.end method

.method public verifyChannelPipeline(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/String;)V
    .locals 3
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "scheme"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 438
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->isSslHandlerConfigured(Lorg/jboss/netty/channel/ChannelPipeline;)Z

    move-result v0

    .line 440
    .local v0, "sslHandlerConfigured":Z
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/util/HttpUtils;->isSecure(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 441
    if-nez v0, :cond_0

    .line 442
    const-string v1, "sslHandler"

    new-instance v2, Lcom/ning/http/client/providers/netty/channel/SslInitializer;

    invoke-direct {v2, p0}, Lcom/ning/http/client/providers/netty/channel/SslInitializer;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;)V

    invoke-interface {p1, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addFirst(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 446
    :cond_0
    :goto_0
    return-void

    .line 444
    :cond_1
    if-eqz v0, :cond_0

    .line 445
    const-string v1, "sslHandler"

    invoke-interface {p1, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    goto :goto_0
.end method
