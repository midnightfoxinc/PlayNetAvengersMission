.class public Lorg/jboss/netty/channel/socket/nio/NioWorker;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
.source "NioWorker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/nio/NioWorker$RegisterTask;
    }
.end annotation


# instance fields
.field private final recvBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;-><init>(Ljava/util/concurrent/Executor;)V

    .line 38
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    invoke-direct {v0}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioWorker;->recvBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 38
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    invoke-direct {v0}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioWorker;->recvBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    .line 46
    return-void
.end method


# virtual methods
.method protected createRegisterTask(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)Ljava/lang/Runnable;
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 117
    instance-of v1, p1, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 118
    .local v0, "server":Z
    :goto_0
    new-instance v1, Lorg/jboss/netty/channel/socket/nio/NioWorker$RegisterTask;

    check-cast p1, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;

    .end local p1    # "channel":Lorg/jboss/netty/channel/Channel;
    invoke-direct {v1, p0, p1, p2, v0}, Lorg/jboss/netty/channel/socket/nio/NioWorker$RegisterTask;-><init>(Lorg/jboss/netty/channel/socket/nio/NioWorker;Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Z)V

    return-object v1

    .line 117
    .end local v0    # "server":Z
    .restart local p1    # "channel":Lorg/jboss/netty/channel/Channel;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic executeInIoThread(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Runnable;

    .prologue
    .line 36
    invoke-super {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->executeInIoThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public bridge synthetic executeInIoThread(Ljava/lang/Runnable;Z)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Runnable;
    .param p2, "x1"    # Z

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->executeInIoThread(Ljava/lang/Runnable;Z)V

    return-void
.end method

.method protected read(Ljava/nio/channels/SelectionKey;)Z
    .locals 14
    .param p1, "k"    # Ljava/nio/channels/SelectionKey;

    .prologue
    const/4 v11, 0x0

    .line 50
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    check-cast v3, Ljava/nio/channels/SocketChannel;

    .line 51
    .local v3, "ch":Ljava/nio/channels/SocketChannel;
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;

    .line 53
    .local v4, "channel":Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;

    move-result-object v12

    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;->getReceiveBufferSizePredictor()Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    move-result-object v7

    .line 55
    .local v7, "predictor":Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    invoke-interface {v7}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;->nextReceiveBufferSize()I

    move-result v6

    .line 56
    .local v6, "predictedRecvBufSize":I
    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;

    move-result-object v12

    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v2

    .line 58
    .local v2, "bufferFactory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    const/4 v9, 0x0

    .line 59
    .local v9, "ret":I
    const/4 v8, 0x0

    .line 60
    .local v8, "readBytes":I
    const/4 v5, 0x1

    .line 62
    .local v5, "failure":Z
    iget-object v12, p0, Lorg/jboss/netty/channel/socket/nio/NioWorker;->recvBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    invoke-virtual {v12, v6}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->get(I)Ljava/nio/ByteBuffer;

    move-result-object v12

    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getDefaultOrder()Ljava/nio/ByteOrder;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 64
    .local v0, "bb":Ljava/nio/ByteBuffer;
    :cond_0
    :try_start_0
    invoke-virtual {v3, v0}, Ljava/nio/channels/SocketChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v9

    if-lez v9, :cond_1

    .line 65
    add-int/2addr v8, v9

    .line 66
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z
    :try_end_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    if-nez v12, :cond_0

    .line 70
    :cond_1
    const/4 v5, 0x0

    .line 77
    :goto_0
    if-lez v8, :cond_2

    .line 78
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 80
    invoke-interface {v2, v8}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 81
    .local v1, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1, v11, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/ByteBuffer;)V

    .line 82
    invoke-interface {v1, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 85
    invoke-interface {v7, v8}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;->previousReceiveBufferSize(I)V

    .line 88
    invoke-static {v4, v1}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 91
    .end local v1    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
    if-ltz v9, :cond_3

    if-eqz v5, :cond_4

    .line 92
    :cond_3
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 93
    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v12

    invoke-virtual {p0, v4, v12}, Lorg/jboss/netty/channel/socket/nio/NioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 97
    :goto_1
    return v11

    .line 73
    :catch_0
    move-exception v10

    .line 74
    .local v10, "t":Ljava/lang/Throwable;
    invoke-static {v4, v10}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 97
    .end local v10    # "t":Ljava/lang/Throwable;
    :cond_4
    const/4 v11, 0x1

    goto :goto_1

    .line 71
    :catch_1
    move-exception v12

    goto :goto_0
.end method

.method public bridge synthetic rebuildSelector()V
    .locals 0

    .prologue
    .line 36
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->rebuildSelector()V

    return-void
.end method

.method public bridge synthetic register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "x1"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V

    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 178
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->run()V

    .line 179
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioWorker;->recvBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    invoke-virtual {v0}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->releaseExternalResources()V

    .line 180
    return-void
.end method

.method protected scheduleWriteIfNecessary(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 102
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 103
    .local v0, "currentThread":Ljava/lang/Thread;
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/NioWorker;->thread:Ljava/lang/Thread;

    .line 104
    .local v1, "workerThread":Ljava/lang/Thread;
    if-eq v0, v1, :cond_1

    .line 105
    iget-object v4, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTaskInTaskQueue:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v3, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 106
    iget-object v3, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lorg/jboss/netty/channel/socket/nio/NioWorker;->registerTask(Ljava/lang/Runnable;)V

    .line 112
    :cond_0
    :goto_0
    return v2

    :cond_1
    move v2, v3

    goto :goto_0
.end method

.method public bridge synthetic shutdown()V
    .locals 0

    .prologue
    .line 36
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->shutdown()V

    return-void
.end method
