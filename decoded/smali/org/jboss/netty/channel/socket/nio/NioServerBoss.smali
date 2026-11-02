.class public final Lorg/jboss/netty/channel/socket/nio/NioServerBoss;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
.source "NioServerBoss.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/Boss;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;-><init>(Ljava/util/concurrent/Executor;)V

    .line 46
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 0
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 50
    return-void
.end method

.method private static registerAcceptedChannel(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Ljava/nio/channels/SocketChannel;Ljava/lang/Thread;)V
    .locals 10
    .param p0, "parent"    # Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;
    .param p1, "acceptedSocket"    # Ljava/nio/channels/SocketChannel;
    .param p2, "currentThread"    # Ljava/lang/Thread;

    .prologue
    .line 133
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelPipeline;->getSink()Lorg/jboss/netty/channel/ChannelSink;

    move-result-object v4

    .line 134
    .local v4, "sink":Lorg/jboss/netty/channel/ChannelSink;
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;->getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelPipelineFactory;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v2

    .line 136
    .local v2, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->nextWorker()Lorg/jboss/netty/channel/socket/Worker;

    move-result-object v6

    check-cast v6, Lorg/jboss/netty/channel/socket/nio/NioWorker;

    .line 137
    .local v6, "worker":Lorg/jboss/netty/channel/socket/nio/NioWorker;
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioAcceptedSocketChannel;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v1

    move-object v3, p0

    move-object v5, p1

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/channel/socket/nio/NioAcceptedSocketChannel;-><init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelSink;Ljava/nio/channels/SocketChannel;Lorg/jboss/netty/channel/socket/nio/NioWorker;Ljava/lang/Thread;)V

    const/4 v1, 0x0

    invoke-virtual {v6, v0, v1}, Lorg/jboss/netty/channel/socket/nio/NioWorker;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    .end local v2    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    .end local v4    # "sink":Lorg/jboss/netty/channel/ChannelSink;
    .end local v6    # "worker":Lorg/jboss/netty/channel/socket/nio/NioWorker;
    :cond_0
    :goto_0
    return-void

    .line 141
    :catch_0
    move-exception v8

    .line 142
    .local v8, "e":Ljava/lang/Exception;
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v0}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 143
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v1, "Failed to initialize an accepted socket."

    invoke-interface {v0, v1, v8}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 148
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Ljava/nio/channels/SocketChannel;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 149
    :catch_1
    move-exception v9

    .line 150
    .local v9, "e2":Ljava/io/IOException;
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v0}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v1, "Failed to close a partially accepted socket."

    invoke-interface {v0, v1, v9}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method bind(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 54
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;-><init>(Lorg/jboss/netty/channel/socket/nio/NioServerBoss;Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    invoke-virtual {p0, v0}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->registerTask(Ljava/lang/Runnable;)V

    .line 55
    return-void
.end method

.method protected close(Ljava/nio/channels/SelectionKey;)V
    .locals 2
    .param p1, "k"    # Ljava/nio/channels/SelectionKey;

    .prologue
    .line 59
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    .line 60
    .local v0, "ch":Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;
    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->close(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 61
    return-void
.end method

.method close(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 64
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->isBound()Z

    move-result v0

    .line 67
    .local v0, "bound":Z
    :try_start_0
    iget-object v2, p1, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->socket:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v2}, Ljava/nio/channels/ServerSocketChannel;->close()V

    .line 68
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->increaseCancelledKeys()V

    .line 70
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->setClosed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 71
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 73
    if-eqz v0, :cond_0

    .line 74
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 76
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V

    .line 84
    :goto_0
    return-void

    .line 78
    :cond_1
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 80
    :catch_0
    move-exception v1

    .line 81
    .local v1, "t":Ljava/lang/Throwable;
    invoke-interface {p2, v1}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 82
    invoke-static {p1, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected createRegisterTask(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)Ljava/lang/Runnable;
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 174
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;

    check-cast p1, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    .end local p1    # "channel":Lorg/jboss/netty/channel/Channel;
    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;-><init>(Lorg/jboss/netty/channel/socket/nio/NioServerBoss;Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    return-object v0
.end method

.method protected newThreadRenamingRunnable(ILorg/jboss/netty/util/ThreadNameDeterminer;)Lorg/jboss/netty/util/ThreadRenamingRunnable;
    .locals 3
    .param p1, "id"    # I
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 168
    new-instance v0, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "New I/O server boss #"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1, p2}, Lorg/jboss/netty/util/ThreadRenamingRunnable;-><init>(Ljava/lang/Runnable;Ljava/lang/String;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    return-object v0
.end method

.method protected process(Ljava/nio/channels/Selector;)V
    .locals 10
    .param p1, "selector"    # Ljava/nio/channels/Selector;

    .prologue
    .line 88
    invoke-virtual {p1}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v5

    .line 89
    .local v5, "selectedKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 128
    :cond_0
    return-void

    .line 92
    :cond_1
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 93
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/channels/SelectionKey;

    .line 94
    .local v4, "k":Ljava/nio/channels/SelectionKey;
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 95
    invoke-virtual {v4}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    .line 100
    .local v1, "channel":Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;
    :goto_1
    :try_start_0
    iget-object v7, v1, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->socket:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v7}, Ljava/nio/channels/ServerSocketChannel;->accept()Ljava/nio/channels/SocketChannel;

    move-result-object v0

    .line 101
    .local v0, "acceptedSocket":Ljava/nio/channels/SocketChannel;
    if-eqz v0, :cond_2

    .line 104
    iget-object v7, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->thread:Ljava/lang/Thread;

    invoke-static {v1, v0, v7}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->registerAcceptedChannel(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Ljava/nio/channels/SocketChannel;Ljava/lang/Thread;)V
    :try_end_0
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 106
    .end local v0    # "acceptedSocket":Ljava/nio/channels/SocketChannel;
    :catch_0
    move-exception v2

    .line 108
    .local v2, "e":Ljava/nio/channels/CancelledKeyException;
    invoke-virtual {v4}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 109
    invoke-virtual {v1}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 115
    .end local v2    # "e":Ljava/nio/channels/CancelledKeyException;
    :catch_1
    move-exception v6

    .line 116
    .local v6, "t":Ljava/lang/Throwable;
    sget-object v7, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v7}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 117
    sget-object v7, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v8, "Failed to accept a connection."

    invoke-interface {v7, v8, v6}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 122
    :cond_3
    const-wide/16 v8, 0x3e8

    :try_start_1
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 123
    :catch_2
    move-exception v7

    goto :goto_0

    .line 113
    .end local v6    # "t":Ljava/lang/Throwable;
    :catch_3
    move-exception v7

    goto :goto_0

    .line 110
    :catch_4
    move-exception v7

    goto :goto_0
.end method

.method public bridge synthetic rebuildSelector()V
    .locals 0

    .prologue
    .line 42
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->rebuildSelector()V

    return-void
.end method

.method public bridge synthetic register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "x1"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 42
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V

    return-void
.end method

.method public bridge synthetic run()V
    .locals 0

    .prologue
    .line 42
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->run()V

    return-void
.end method

.method protected select(Ljava/nio/channels/Selector;)I
    .locals 1
    .param p1, "selector"    # Ljava/nio/channels/Selector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    invoke-virtual {p1}, Ljava/nio/channels/Selector;->select()I

    move-result v0

    return v0
.end method

.method public bridge synthetic shutdown()V
    .locals 0

    .prologue
    .line 42
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->shutdown()V

    return-void
.end method
