.class Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;
.super Lorg/jboss/netty/channel/socket/oio/AbstractOioChannelSink;
.source "OioDatagramPipelineSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink$1;
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
    .line 39
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannelSink;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->workerExecutor:Ljava/util/concurrent/Executor;

    .line 41
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    .line 42
    return-void
.end method

.method private bind(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 8
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 86
    const/4 v0, 0x0

    .line 87
    .local v0, "bound":Z
    const/4 v2, 0x0

    .line 89
    .local v2, "workerStarted":Z
    :try_start_0
    iget-object v3, p1, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->socket:Ljava/net/MulticastSocket;

    invoke-virtual {v3, p3}, Ljava/net/MulticastSocket;->bind(Ljava/net/SocketAddress;)V

    .line 90
    const/4 v0, 0x1

    .line 93
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 94
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v3

    invoke-static {p1, v3}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 97
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->workerExecutor:Ljava/util/concurrent/Executor;

    new-instance v4, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    new-instance v5, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;

    invoke-direct {v5, p1}, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;-><init>(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Old I/O datagram worker ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    invoke-direct {v4, v5, v6, v7}, Lorg/jboss/netty/util/ThreadRenamingRunnable;-><init>(Ljava/lang/Runnable;Ljava/lang/String;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    invoke-static {v3, v4}, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->start(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    const/4 v2, 0x1

    .line 108
    if-eqz v0, :cond_0

    if-nez v2, :cond_0

    .line 109
    :goto_0
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 112
    :cond_0
    return-void

    .line 104
    :catch_0
    move-exception v1

    .line 105
    .local v1, "t":Ljava/lang/Throwable;
    :try_start_1
    invoke-interface {p2, v1}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 106
    invoke-static {p1, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    if-eqz v0, :cond_0

    if-nez v2, :cond_0

    goto :goto_0

    .end local v1    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_1

    if-nez v2, :cond_1

    .line 109
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 108
    :cond_1
    throw v3
.end method

.method private connect(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 10
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 118
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->isBound()Z

    move-result v0

    .line 119
    .local v0, "bound":Z
    const/4 v1, 0x0

    .line 120
    .local v1, "connected":Z
    const/4 v4, 0x0

    .line 122
    .local v4, "workerStarted":Z
    sget-object v6, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE_ON_FAILURE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {p2, v6}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 126
    const/4 v6, 0x0

    iput-object v6, p1, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->remoteAddress:Ljava/net/InetSocketAddress;

    .line 129
    :try_start_0
    iget-object v6, p1, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->socket:Ljava/net/MulticastSocket;

    invoke-virtual {v6, p3}, Ljava/net/MulticastSocket;->connect(Ljava/net/SocketAddress;)V

    .line 130
    const/4 v1, 0x1

    .line 133
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 134
    if-nez v0, :cond_0

    .line 135
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v6

    invoke-static {p1, v6}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 137
    :cond_0
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v6

    invoke-static {p1, v6}, Lorg/jboss/netty/channel/Channels;->fireChannelConnected(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 139
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Old I/O datagram worker ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 140
    .local v3, "threadName":Ljava/lang/String;
    if-nez v0, :cond_3

    .line 142
    iget-object v6, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->workerExecutor:Ljava/util/concurrent/Executor;

    new-instance v7, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    new-instance v8, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;

    invoke-direct {v8, p1}, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;-><init>(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;)V

    iget-object v9, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    invoke-direct {v7, v8, v3, v9}, Lorg/jboss/netty/util/ThreadRenamingRunnable;-><init>(Ljava/lang/Runnable;Ljava/lang/String;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    invoke-static {v6, v7}, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->start(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    :cond_1
    :goto_0
    const/4 v4, 0x1

    .line 163
    if-eqz v1, :cond_2

    if-nez v4, :cond_2

    .line 164
    .end local v3    # "threadName":Ljava/lang/String;
    :goto_1
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 167
    :cond_2
    return-void

    .line 148
    .restart local v3    # "threadName":Ljava/lang/String;
    :cond_3
    :try_start_1
    iget-object v5, p1, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->workerThread:Ljava/lang/Thread;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    .local v5, "workerThread":Ljava/lang/Thread;
    if-eqz v5, :cond_1

    .line 151
    :try_start_2
    invoke-virtual {v5, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 152
    :catch_0
    move-exception v6

    goto :goto_0

    .line 159
    .end local v3    # "threadName":Ljava/lang/String;
    .end local v5    # "workerThread":Ljava/lang/Thread;
    :catch_1
    move-exception v2

    .line 160
    .local v2, "t":Ljava/lang/Throwable;
    :try_start_3
    invoke-interface {p2, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 161
    invoke-static {p1, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 163
    if-eqz v1, :cond_2

    if-nez v4, :cond_2

    goto :goto_1

    .end local v2    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v6

    if-eqz v1, :cond_4

    if-nez v4, :cond_4

    .line 164
    invoke-static {p1, p2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 163
    :cond_4
    throw v6
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
    .line 46
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;

    .line 47
    .local v0, "channel":Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 48
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    instance-of v6, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v6, :cond_3

    move-object v4, p2

    .line 49
    check-cast v4, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 50
    .local v4, "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v3

    .line 51
    .local v3, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 52
    .local v5, "value":Ljava/lang/Object;
    sget-object v6, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v3}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 81
    .end local v3    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v4    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 54
    .restart local v3    # "state":Lorg/jboss/netty/channel/ChannelState;
    .restart local v4    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    .restart local v5    # "value":Ljava/lang/Object;
    :pswitch_0
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 55
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 59
    :pswitch_1
    if-eqz v5, :cond_1

    .line 60
    check-cast v5, Ljava/net/SocketAddress;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0, v2, v5}, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->bind(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 62
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_1
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->close(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 66
    :pswitch_2
    if-eqz v5, :cond_2

    .line 67
    check-cast v5, Ljava/net/SocketAddress;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0, v2, v5}, Lorg/jboss/netty/channel/socket/oio/OioDatagramPipelineSink;->connect(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 69
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->disconnect(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 73
    :pswitch_3
    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static {v0, v2, v6}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->setInterestOps(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    goto :goto_0

    .line 76
    .end local v3    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v4    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_3
    instance-of v6, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v6, :cond_0

    move-object v1, p2

    .line 77
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 78
    .local v1, "evt":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v7

    invoke-static {v0, v2, v6, v7}, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->write(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 52
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
