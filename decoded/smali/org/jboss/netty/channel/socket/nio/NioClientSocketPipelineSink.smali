.class Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioChannelSink;
.source "NioClientSocketPipelineSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink$2;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/channel/socket/nio/BossPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioClientBoss;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->$assertionsDisabled:Z

    .line 36
    const-class v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void

    .line 34
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lorg/jboss/netty/channel/socket/nio/BossPool;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/BossPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioClientBoss;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "bossPool":Lorg/jboss/netty/channel/socket/nio/BossPool;, "Lorg/jboss/netty/channel/socket/nio/BossPool<Lorg/jboss/netty/channel/socket/nio/NioClientBoss;>;"
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannelSink;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;

    .line 43
    return-void
.end method

.method private static bind(Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 92
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->channel:Ljava/nio/channels/SelectableChannel;

    check-cast v1, Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 93
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->boundManually:Z

    .line 94
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->setBound()V

    .line 95
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 96
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 99
    invoke-static {p0, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private connect(Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 4
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;
    .param p2, "cf"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 106
    iput-object p3, p1, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->requestedRemoteAddress:Ljava/net/SocketAddress;

    .line 108
    :try_start_0
    iget-object v2, p1, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->channel:Ljava/nio/channels/SelectableChannel;

    check-cast v2, Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, p3}, Ljava/nio/channels/SocketChannel;->connect(Ljava/net/SocketAddress;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 109
    iget-object v2, p1, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v2, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 134
    :goto_0
    return-void

    .line 111
    :cond_0
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    new-instance v3, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink$1;

    invoke-direct {v3, p0, p2}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink$1;-><init>(Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;Lorg/jboss/netty/channel/ChannelFuture;)V

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 119
    sget-object v2, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE_ON_FAILURE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {p2, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 120
    iput-object p2, p1, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->connectFuture:Lorg/jboss/netty/channel/ChannelFuture;

    .line 121
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->nextBoss()Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lorg/jboss/netty/channel/socket/nio/NioClientBoss;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 124
    :catch_0
    move-exception v1

    .line 125
    .local v1, "t":Ljava/lang/Throwable;
    instance-of v2, v1, Ljava/net/ConnectException;

    if-eqz v2, :cond_1

    .line 126
    new-instance v0, Ljava/net/ConnectException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 127
    .local v0, "newT":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 128
    move-object v1, v0

    .line 130
    .end local v0    # "newT":Ljava/lang/Throwable;
    :cond_1
    invoke-interface {p2, v1}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 131
    invoke-static {p1, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 132
    iget-object v2, p1, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0
.end method

.method private nextBoss()Lorg/jboss/netty/channel/socket/nio/NioClientBoss;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/BossPool;->nextBoss()Lorg/jboss/netty/channel/socket/nio/Boss;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    return-object v0
.end method


# virtual methods
.method public eventSunk(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 8
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    instance-of v6, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v6, :cond_3

    move-object v1, p2

    .line 48
    check-cast v1, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 49
    .local v1, "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    .line 51
    .local v0, "channel":Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 52
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v4

    .line 53
    .local v4, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 55
    .local v5, "value":Ljava/lang/Object;
    sget-object v6, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink$2;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v4}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 86
    .end local v0    # "channel":Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 57
    .restart local v0    # "channel":Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;
    .restart local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .restart local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .restart local v5    # "value":Ljava/lang/Object;
    :pswitch_0
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 58
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v6, v0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 62
    :pswitch_1
    if-eqz v5, :cond_1

    .line 63
    check-cast v5, Ljava/net/SocketAddress;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-static {v0, v2, v5}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->bind(Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 65
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_1
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v6, v0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 69
    :pswitch_2
    if-eqz v5, :cond_2

    .line 70
    check-cast v5, Ljava/net/SocketAddress;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0, v2, v5}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->connect(Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 72
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_2
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v6, v0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 76
    :pswitch_3
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v6, v0, v2, v7}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->setInterestOps(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    goto :goto_0

    .line 79
    .end local v0    # "channel":Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    :cond_3
    instance-of v6, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v6, :cond_0

    move-object v1, p2

    .line 80
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 81
    .local v1, "event":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;

    .line 82
    .local v0, "channel":Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->writeBufferQueue:Ljava/util/Queue;

    invoke-interface {v6, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v3

    .line 83
    .local v3, "offered":Z
    sget-boolean v6, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;->$assertionsDisabled:Z

    if-nez v6, :cond_4

    if-nez v3, :cond_4

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 84
    :cond_4
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v6, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->writeFromUserCode(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    goto :goto_0

    .line 55
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
