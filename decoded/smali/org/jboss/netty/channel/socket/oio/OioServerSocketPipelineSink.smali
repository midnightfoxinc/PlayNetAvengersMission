.class Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;
.super Lorg/jboss/netty/channel/socket/oio/AbstractOioChannelSink;
.source "OioServerSocketPipelineSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$1;,
        Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;
    }
.end annotation


# static fields
.field static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

.field final workerExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 0
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannelSink;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->workerExecutor:Ljava/util/concurrent/Executor;

    .line 49
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    .line 50
    return-void
.end method

.method static synthetic access$000(Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;)Lorg/jboss/netty/util/ThreadNameDeterminer;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    return-object v0
.end method

.method private bind(Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 8
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 128
    const/4 v2, 0x0

    .line 129
    .local v2, "bound":Z
    const/4 v1, 0x0

    .line 131
    .local v1, "bossStarted":Z
    :try_start_0
    iget-object v4, p1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;->getBacklog()I

    move-result v5

    invoke-virtual {v4, p3, v5}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    .line 132
    const/4 v2, 0x1

    .line 134
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 135
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object p3

    .line 136
    invoke-static {p1, p3}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 138
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannelFactory;

    iget-object v0, v4, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannelFactory;->bossExecutor:Ljava/util/concurrent/Executor;

    .line 140
    .local v0, "bossExecutor":Ljava/util/concurrent/Executor;
    new-instance v4, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    new-instance v5, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;

    invoke-direct {v5, p0, p1}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;-><init>(Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Old I/O server boss ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    invoke-direct {v4, v5, v6, v7}, Lorg/jboss/netty/util/ThreadRenamingRunnable;-><init>(Ljava/lang/Runnable;Ljava/lang/String;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    invoke-static {v0, v4}, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->start(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    const/4 v1, 0x1

    .line 151
    if-nez v1, :cond_0

    if-eqz v2, :cond_0

    .line 152
    .end local v0    # "bossExecutor":Ljava/util/concurrent/Executor;
    :goto_0
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->close(Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 155
    :cond_0
    return-void

    .line 147
    :catch_0
    move-exception v3

    .line 148
    .local v3, "t":Ljava/lang/Throwable;
    :try_start_1
    invoke-interface {p2, v3}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 149
    invoke-static {p1, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    if-nez v1, :cond_0

    if-eqz v2, :cond_0

    goto :goto_0

    .end local v3    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v4

    if-nez v1, :cond_1

    if-eqz v2, :cond_1

    .line 152
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->close(Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 151
    :cond_1
    throw v4
.end method

.method private static close(Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 158
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->isBound()Z

    move-result v0

    .line 160
    .local v0, "bound":Z
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->close()V

    .line 165
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->shutdownLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    :try_start_1
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->setClosed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 168
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 169
    if-eqz v0, :cond_0

    .line 170
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 172
    :cond_0
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    :goto_0
    :try_start_2
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->shutdownLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 183
    :goto_1
    return-void

    .line 174
    :cond_1
    :try_start_3
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 177
    :catchall_0
    move-exception v2

    :try_start_4
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->shutdownLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 179
    :catch_0
    move-exception v1

    .line 180
    .local v1, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v1}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 181
    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private static handleAcceptedSocket(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 8
    .param p0, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 91
    instance-of v6, p0, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v6, :cond_1

    move-object v1, p0

    .line 92
    check-cast v1, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 93
    .local v1, "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;

    .line 95
    .local v0, "channel":Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 96
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v4

    .line 97
    .local v4, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 99
    .local v5, "value":Ljava/lang/Object;
    sget-object v6, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v4}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 122
    .end local v0    # "channel":Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 101
    .restart local v0    # "channel":Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;
    .restart local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .restart local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .restart local v5    # "value":Ljava/lang/Object;
    :pswitch_0
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 102
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 107
    :pswitch_1
    if-nez v5, :cond_0

    .line 108
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 112
    :pswitch_2
    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v0, v2, v6}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->setInterestOps(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    goto :goto_0

    .line 115
    .end local v0    # "channel":Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    :cond_1
    instance-of v6, p0, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v6, :cond_0

    move-object v1, p0

    .line 116
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 117
    .local v1, "event":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;

    .line 118
    .local v0, "channel":Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 119
    .restart local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v3

    .line 120
    .local v3, "message":Ljava/lang/Object;
    invoke-static {v0, v2, v3}, Lorg/jboss/netty/channel/socket/oio/OioWorker;->write(Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    goto :goto_0

    .line 99
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private handleServerSocket(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 7
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 63
    instance-of v5, p1, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-nez v5, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v1, p1

    .line 67
    check-cast v1, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 68
    .local v1, "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    .line 70
    .local v0, "channel":Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 71
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v3

    .line 72
    .local v3, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 74
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v3}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    goto :goto_0

    .line 76
    :pswitch_0
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 77
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->close(Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 81
    :pswitch_1
    if-eqz v4, :cond_2

    .line 82
    check-cast v4, Ljava/net/SocketAddress;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0, v2, v4}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->bind(Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 84
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->close(Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 74
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public eventSunk(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 2
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 54
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 55
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    instance-of v1, v0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    if-eqz v1, :cond_1

    .line 56
    invoke-direct {p0, p2}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->handleServerSocket(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 60
    :cond_0
    :goto_0
    return-void

    .line 57
    :cond_1
    instance-of v1, v0, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;

    if-eqz v1, :cond_0

    .line 58
    invoke-static {p2}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->handleAcceptedSocket(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method
