.class public Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
.source "NioDatagramWorker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker$ChannelRegistionTask;
    }
.end annotation


# instance fields
.field private final bufferAllocator:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;-><init>(Ljava/util/concurrent/Executor;)V

    .line 45
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    invoke-direct {v0}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->bufferAllocator:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    .line 55
    return-void
.end method

.method static disconnect(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 127
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->isConnected()Z

    move-result v0

    .line 128
    .local v0, "connected":Z
    invoke-static {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->isIoThread(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v1

    .line 130
    .local v1, "iothread":Z
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getDatagramChannel()Ljava/nio/channels/DatagramChannel;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/channels/DatagramChannel;->disconnect()Ljava/nio/channels/DatagramChannel;

    .line 131
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 132
    if-eqz v0, :cond_0

    .line 133
    if-eqz v1, :cond_1

    .line 134
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 136
    :cond_1
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnectedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 139
    :catch_0
    move-exception v2

    .line 140
    .local v2, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 141
    if-eqz v1, :cond_2

    .line 142
    invoke-static {p0, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 144
    :cond_2
    invoke-static {p0, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0
.end method


# virtual methods
.method protected createRegisterTask(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)Ljava/lang/Runnable;
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 151
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker$ChannelRegistionTask;

    check-cast p1, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;

    .end local p1    # "channel":Lorg/jboss/netty/channel/Channel;
    invoke-direct {v0, p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker$ChannelRegistionTask;-><init>(Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    return-object v0
.end method

.method public bridge synthetic executeInIoThread(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Runnable;

    .prologue
    .line 43
    invoke-super {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->executeInIoThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public bridge synthetic executeInIoThread(Ljava/lang/Runnable;Z)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Runnable;
    .param p2, "x1"    # Z

    .prologue
    .line 43
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->executeInIoThread(Ljava/lang/Runnable;Z)V

    return-void
.end method

.method protected read(Ljava/nio/channels/SelectionKey;)Z
    .locals 14
    .param p1, "key"    # Ljava/nio/channels/SelectionKey;

    .prologue
    const/4 v11, 0x0

    .line 59
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;

    .line 60
    .local v3, "channel":Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;
    invoke-virtual {v3}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelConfig;

    move-result-object v12

    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelConfig;->getReceiveBufferSizePredictor()Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    move-result-object v7

    .line 62
    .local v7, "predictor":Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    invoke-virtual {v3}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelConfig;

    move-result-object v12

    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v1

    .line 63
    .local v1, "bufferFactory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v5

    check-cast v5, Ljava/nio/channels/DatagramChannel;

    .line 64
    .local v5, "nioChannel":Ljava/nio/channels/DatagramChannel;
    invoke-interface {v7}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;->nextReceiveBufferSize()I

    move-result v6

    .line 66
    .local v6, "predictedRecvBufSize":I
    iget-object v12, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->bufferAllocator:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    invoke-virtual {v12, v6}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->get(I)Ljava/nio/ByteBuffer;

    move-result-object v12

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getDefaultOrder()Ljava/nio/ByteOrder;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 68
    .local v2, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v4, 0x1

    .line 69
    .local v4, "failure":Z
    const/4 v9, 0x0

    .line 73
    .local v9, "remoteAddress":Ljava/net/SocketAddress;
    :try_start_0
    invoke-virtual {v5, v2}, Ljava/nio/channels/DatagramChannel;->receive(Ljava/nio/ByteBuffer;)Ljava/net/SocketAddress;
    :try_end_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 74
    const/4 v4, 0x0

    .line 81
    :goto_0
    if-eqz v9, :cond_0

    .line 83
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 85
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    .line 86
    .local v8, "readBytes":I
    if-lez v8, :cond_0

    .line 88
    invoke-interface {v7, v8}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;->previousReceiveBufferSize(I)V

    .line 90
    invoke-interface {v1, v8}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 91
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0, v11, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/ByteBuffer;)V

    .line 92
    invoke-interface {v0, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 95
    invoke-interface {v7, v8}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;->previousReceiveBufferSize(I)V

    .line 98
    invoke-static {v3, v0, v9}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 103
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v8    # "readBytes":I
    :cond_0
    if-eqz v4, :cond_1

    .line 104
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 105
    invoke-static {v3}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v12

    invoke-virtual {p0, v3, v12}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 109
    :goto_1
    return v11

    .line 77
    :catch_0
    move-exception v10

    .line 78
    .local v10, "t":Ljava/lang/Throwable;
    invoke-static {v3, v10}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 109
    .end local v10    # "t":Ljava/lang/Throwable;
    :cond_1
    const/4 v11, 0x1

    goto :goto_1

    .line 75
    :catch_1
    move-exception v12

    goto :goto_0
.end method

.method public bridge synthetic rebuildSelector()V
    .locals 0

    .prologue
    .line 43
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->rebuildSelector()V

    return-void
.end method

.method public bridge synthetic register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "x1"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 43
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V

    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 343
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->run()V

    .line 344
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->bufferAllocator:Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;

    invoke-virtual {v0}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->releaseExternalResources()V

    .line 345
    return-void
.end method

.method protected scheduleWriteIfNecessary(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z
    .locals 4
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

    const/4 v1, 0x0

    .line 114
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->thread:Ljava/lang/Thread;

    .line 115
    .local v0, "workerThread":Ljava/lang/Thread;
    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    if-eq v3, v0, :cond_2

    .line 116
    :cond_0
    iget-object v3, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTaskInTaskQueue:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 118
    iget-object v1, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTask:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->registerTask(Ljava/lang/Runnable;)V

    :cond_1
    move v1, v2

    .line 123
    :cond_2
    return v1
.end method

.method public bridge synthetic shutdown()V
    .locals 0

    .prologue
    .line 43
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->shutdown()V

    return-void
.end method

.method protected write0(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 236
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    const/4 v4, 0x0

    .line 237
    .local v4, "addOpWrite":Z
    const/4 v13, 0x0

    .line 239
    .local v13, "removeOpWrite":Z
    const-wide/16 v18, 0x0

    .line 241
    .local v18, "writtenBytes":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->sendBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;

    .local v14, "sendBufferPool":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;
    move-object/from16 v20, p1

    .line 242
    check-cast v20, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;

    invoke-virtual/range {v20 .. v20}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getDatagramChannel()Ljava/nio/channels/DatagramChannel;

    move-result-object v6

    .line 243
    .local v6, "ch":Ljava/nio/channels/DatagramChannel;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferQueue:Ljava/util/Queue;

    move-object/from16 v16, v0

    .line 244
    .local v16, "writeBuffer":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    invoke-virtual/range {p1 .. p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;->getWriteSpinCount()I

    move-result v17

    .line 245
    .local v17, "writeSpinCount":I
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeLock:Ljava/lang/Object;

    move-object/from16 v21, v0

    monitor-enter v21

    .line 247
    const/16 v20, 0x1

    :try_start_0
    move/from16 v0, v20

    move-object/from16 v1, p1

    iput-boolean v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->inWriteNowLoop:Z

    .line 251
    :goto_0
    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 253
    .local v7, "evt":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v7, :cond_4

    .line 254
    invoke-interface/range {v16 .. v16}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    check-cast v7, Lorg/jboss/netty/channel/MessageEvent;

    .restart local v7    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    move-object/from16 v0, p1

    iput-object v7, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    if-nez v7, :cond_1

    .line 255
    const/4 v13, 0x1

    .line 256
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p1

    iput-boolean v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z

    .line 323
    :goto_1
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p1

    iput-boolean v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->inWriteNowLoop:Z

    .line 331
    if-eqz v4, :cond_9

    .line 332
    invoke-virtual/range {p0 .. p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->setOpWrite(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    .line 336
    :cond_0
    :goto_2
    monitor-exit v21
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 338
    move-object/from16 v0, p1

    move-wide/from16 v1, v18

    invoke-static {v0, v1, v2}, Lorg/jboss/netty/channel/Channels;->fireWriteComplete(Lorg/jboss/netty/channel/Channel;J)V

    .line 339
    return-void

    .line 260
    :cond_1
    :try_start_1
    invoke-interface {v7}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;->acquire(Ljava/lang/Object;)Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    move-result-object v5

    .local v5, "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 266
    :goto_3
    const-wide/16 v10, 0x0

    .line 267
    .local v10, "localWrittenBytes":J
    :try_start_2
    invoke-interface {v7}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v12

    .line 268
    .local v12, "raddr":Ljava/net/SocketAddress;
    if-nez v12, :cond_6

    .line 269
    move/from16 v9, v17

    .local v9, "i":I
    :goto_4
    if-lez v9, :cond_2

    .line 270
    invoke-interface {v5, v6}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->transferTo(Ljava/nio/channels/WritableByteChannel;)J

    move-result-wide v10

    .line 271
    const-wide/16 v22, 0x0

    cmp-long v20, v10, v22

    if-eqz v20, :cond_5

    .line 272
    add-long v18, v18, v10

    .line 292
    :cond_2
    :goto_5
    const-wide/16 v22, 0x0

    cmp-long v20, v10, v22

    if-gtz v20, :cond_3

    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->finished()Z

    move-result v20

    if-eqz v20, :cond_8

    .line 294
    :cond_3
    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->release()V

    .line 295
    invoke-interface {v7}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    .line 296
    .local v8, "future":Lorg/jboss/netty/channel/ChannelFuture;
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 297
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    .line 298
    const/4 v7, 0x0

    .line 299
    const/4 v5, 0x0

    .line 300
    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z
    :try_end_2
    .catch Ljava/nio/channels/AsynchronousCloseException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 307
    .end local v8    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v9    # "i":I
    .end local v12    # "raddr":Ljava/net/SocketAddress;
    :catch_0
    move-exception v20

    goto/16 :goto_0

    .line 262
    .end local v5    # "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    .end local v10    # "localWrittenBytes":J
    :cond_4
    :try_start_3
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .restart local v5    # "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    goto :goto_3

    .line 275
    .restart local v9    # "i":I
    .restart local v10    # "localWrittenBytes":J
    .restart local v12    # "raddr":Ljava/net/SocketAddress;
    :cond_5
    :try_start_4
    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->finished()Z

    move-result v20

    if-nez v20, :cond_2

    .line 269
    add-int/lit8 v9, v9, -0x1

    goto :goto_4

    .line 280
    .end local v9    # "i":I
    :cond_6
    move/from16 v9, v17

    .restart local v9    # "i":I
    :goto_6
    if-lez v9, :cond_2

    .line 281
    invoke-interface {v5, v6, v12}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->transferTo(Ljava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;)J

    move-result-wide v10

    .line 282
    const-wide/16 v22, 0x0

    cmp-long v20, v10, v22

    if-eqz v20, :cond_7

    .line 283
    add-long v18, v18, v10

    .line 284
    goto :goto_5

    .line 286
    :cond_7
    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->finished()Z

    move-result v20

    if-nez v20, :cond_2

    .line 280
    add-int/lit8 v9, v9, -0x1

    goto :goto_6

    .line 303
    :cond_8
    const/4 v4, 0x1

    .line 304
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p1

    iput-boolean v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z
    :try_end_4
    .catch Ljava/nio/channels/AsynchronousCloseException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_1

    .line 309
    .end local v9    # "i":I
    .end local v12    # "raddr":Ljava/net/SocketAddress;
    :catch_1
    move-exception v15

    .line 310
    .local v15, "t":Ljava/lang/Throwable;
    :try_start_5
    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->release()V

    .line 311
    invoke-interface {v7}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    .line 312
    .restart local v8    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 313
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    .line 316
    const/4 v5, 0x0

    .line 318
    const/4 v7, 0x0

    .line 319
    invoke-interface {v8, v15}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 320
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 336
    .end local v5    # "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    .end local v7    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    .end local v8    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v10    # "localWrittenBytes":J
    .end local v15    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v20

    monitor-exit v21
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v20

    .line 333
    .restart local v7    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    :cond_9
    if-eqz v13, :cond_0

    .line 334
    :try_start_6
    invoke-virtual/range {p0 .. p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->clearOpWrite(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_2
.end method

.method public writeFromUserCode(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 211
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->isBound()Z

    move-result v0

    if-nez v0, :cond_1

    .line 212
    invoke-static {p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->cleanUpWriteBuffer(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    .line 231
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->scheduleWriteIfNecessary(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 222
    iget-boolean v0, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z

    if-nez v0, :cond_0

    .line 226
    iget-boolean v0, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->inWriteNowLoop:Z

    if-nez v0, :cond_0

    .line 230
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->write0(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    goto :goto_0
.end method
