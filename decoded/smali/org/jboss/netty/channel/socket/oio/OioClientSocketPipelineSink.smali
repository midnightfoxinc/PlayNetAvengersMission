.class Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;
.super Lorg/jboss/netty/channel/socket/oio/AbstractOioChannelSink;
.source "OioClientSocketPipelineSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink$1;
    }
.end annotation


# instance fields
.field private final determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

.field private final workerExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 0
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannelSink;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;->workerExecutor:Ljava/util/concurrent/Executor;

    .line 43
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    .line 44
    return-void
.end method

.method private static bind(Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 89
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v1, p2}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 90
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 91
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :goto_0
    return-void

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 94
    invoke-static {p0, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private connect(Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 10
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 102
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->isBound()Z

    move-result v0

    .line 103
    .local v0, "bound":Z
    const/4 v1, 0x0

    .line 104
    .local v1, "connected":Z
    const/4 v4, 0x0

    .line 106
    .local v4, "workerStarted":Z
    sget-object v5, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE_ON_FAILURE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {p2, v5}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 109
    :try_start_0
    iget-object v5, p1, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/SocketChannelConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/jboss/netty/channel/socket/SocketChannelConfig;->getConnectTimeoutMillis()I

    move-result v6

    invoke-virtual {v5, p3, v6}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 111
    const/4 v1, 0x1

    .line 114
    new-instance v5, Ljava/io/PushbackInputStream;

    iget-object v6, p1, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x1

    invoke-direct {v5, v6, v7}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v5, p1, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->in:Ljava/io/PushbackInputStream;

    .line 115
    iget-object v5, p1, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    iput-object v5, p1, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->out:Ljava/io/OutputStream;

    .line 118
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 119
    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v5

    invoke-static {p1, v5}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 122
    :cond_0
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v5

    invoke-static {p1, v5}, Lorg/jboss/netty/channel/Channels;->fireChannelConnected(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 125
    iget-object v5, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;->workerExecutor:Ljava/util/concurrent/Executor;

    new-instance v6, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    new-instance v7, Lorg/jboss/netty/channel/socket/oio/OioWorker;

    invoke-direct {v7, p1}, Lorg/jboss/netty/channel/socket/oio/OioWorker;-><init>(Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Old I/O client worker ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x29

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    invoke-direct {v6, v7, v8, v9}, Lorg/jboss/netty/util/ThreadRenamingRunnable;-><init>(Ljava/lang/Runnable;Ljava/lang/String;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    invoke-static {v5, v6}, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->start(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    const/4 v4, 0x1

    .line 143
    if-eqz v1, :cond_1

    if-nez v4, :cond_1

    .line 144
    :goto_0
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 147
    :cond_1
    return-void

    .line 132
    :catch_0
    move-exception v3

    .line 133
    .local v3, "t":Ljava/lang/Throwable;
    :try_start_1
    instance-of v5, v3, Ljava/net/ConnectException;

    if-eqz v5, :cond_2

    .line 134
    instance-of v5, v3, Ljava/net/ConnectException;

    if-eqz v5, :cond_2

    .line 135
    new-instance v2, Ljava/net/ConnectException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 136
    .local v2, "newT":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 137
    move-object v3, v2

    .line 140
    .end local v2    # "newT":Ljava/lang/Throwable;
    :cond_2
    invoke-interface {p2, v3}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 141
    invoke-static {p1, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    if-eqz v1, :cond_1

    if-nez v4, :cond_1

    goto :goto_0

    .end local v3    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v5

    if-eqz v1, :cond_3

    if-nez v4, :cond_3

    .line 144
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 143
    :cond_3
    throw v5
.end method


# virtual methods
.method public eventSunk(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 7
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 48
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;

    .line 49
    .local v0, "channel":Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 50
    .local v1, "future":Lorg/jboss/netty/channel/ChannelFuture;
    instance-of v5, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v5, :cond_3

    move-object v3, p2

    .line 51
    check-cast v3, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 52
    .local v3, "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v2

    .line 53
    .local v2, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 54
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v2}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 83
    .end local v2    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v3    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v4    # "value":Ljava/lang/Object;
    .end local p2    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    :cond_0
    :goto_0
    return-void

    .line 56
    .restart local v2    # "state":Lorg/jboss/netty/channel/ChannelState;
    .restart local v3    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    .restart local v4    # "value":Ljava/lang/Object;
    .restart local p2    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    :pswitch_0
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 57
    invoke-static {v0, v1}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 61
    :pswitch_1
    if-eqz v4, :cond_1

    .line 62
    check-cast v4, Ljava/net/SocketAddress;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-static {v0, v1, v4}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;->bind(Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 64
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_1
    invoke-static {v0, v1}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 68
    :pswitch_2
    if-eqz v4, :cond_2

    .line 69
    check-cast v4, Ljava/net/SocketAddress;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0, v1, v4}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;->connect(Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 71
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {v0, v1}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 75
    :pswitch_3
    check-cast v4, Ljava/lang/Integer;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v0, v1, v5}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->setInterestOps(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    goto :goto_0

    .line 78
    .end local v2    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v3    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_3
    instance-of v5, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v5, :cond_0

    .line 79
    check-cast p2, Lorg/jboss/netty/channel/MessageEvent;

    .end local p2    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v0, v1, v5}, Lorg/jboss/netty/channel/socket/oio/OioWorker;->write(Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    goto :goto_0

    .line 54
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
