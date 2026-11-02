.class abstract Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
.source "AbstractNioWorker.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/Worker;


# instance fields
.field protected final sendBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;-><init>(Ljava/util/concurrent/Executor;)V

    .line 45
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;

    invoke-direct {v0}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->sendBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;

    .line 49
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 45
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;

    invoke-direct {v0}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->sendBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;

    .line 53
    return-void
.end method

.method protected static cleanUpWriteBuffer(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 393
    .local p0, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    const/4 v0, 0x0

    .line 394
    .local v0, "cause":Ljava/lang/Exception;
    const/4 v3, 0x0

    .line 397
    .local v3, "fireExceptionCaught":Z
    iget-object v7, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeLock:Ljava/lang/Object;

    monitor-enter v7

    .line 398
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 399
    .local v2, "evt":Lorg/jboss/netty/channel/MessageEvent;
    if-eqz v2, :cond_1

    .line 402
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->isOpen()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 403
    new-instance v1, Ljava/nio/channels/NotYetConnectedException;

    invoke-direct {v1}, Ljava/nio/channels/NotYetConnectedException;-><init>()V

    .end local v0    # "cause":Ljava/lang/Exception;
    .local v1, "cause":Ljava/lang/Exception;
    move-object v0, v1

    .line 408
    .end local v1    # "cause":Ljava/lang/Exception;
    .restart local v0    # "cause":Ljava/lang/Exception;
    :goto_0
    invoke-interface {v2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    .line 409
    .local v4, "future":Lorg/jboss/netty/channel/ChannelFuture;
    iget-object v6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    if-eqz v6, :cond_0

    .line 410
    iget-object v6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->release()V

    .line 411
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    .line 413
    :cond_0
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 416
    const/4 v2, 0x0

    .line 417
    invoke-interface {v4, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 418
    const/4 v3, 0x1

    .line 421
    .end local v4    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_1
    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferQueue:Ljava/util/Queue;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v5, "writeBuffer":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    move-object v1, v0

    .line 423
    .end local v0    # "cause":Ljava/lang/Exception;
    .restart local v1    # "cause":Ljava/lang/Exception;
    :goto_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    check-cast v2, Lorg/jboss/netty/channel/MessageEvent;

    .line 424
    .restart local v2    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v2, :cond_4

    .line 439
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 441
    if-eqz v3, :cond_2

    .line 442
    invoke-static {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 443
    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 448
    :cond_2
    :goto_2
    return-void

    .line 405
    .end local v1    # "cause":Ljava/lang/Exception;
    .end local v5    # "writeBuffer":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    .restart local v0    # "cause":Ljava/lang/Exception;
    :cond_3
    :try_start_2
    new-instance v1, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v1}, Ljava/nio/channels/ClosedChannelException;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v0    # "cause":Ljava/lang/Exception;
    .restart local v1    # "cause":Ljava/lang/Exception;
    move-object v0, v1

    .end local v1    # "cause":Ljava/lang/Exception;
    .restart local v0    # "cause":Ljava/lang/Exception;
    goto :goto_0

    .line 429
    .end local v0    # "cause":Ljava/lang/Exception;
    .restart local v1    # "cause":Ljava/lang/Exception;
    .restart local v5    # "writeBuffer":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_4
    if-nez v1, :cond_7

    .line 430
    :try_start_3
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->isOpen()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 431
    new-instance v0, Ljava/nio/channels/NotYetConnectedException;

    invoke-direct {v0}, Ljava/nio/channels/NotYetConnectedException;-><init>()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 435
    .end local v1    # "cause":Ljava/lang/Exception;
    .restart local v0    # "cause":Ljava/lang/Exception;
    :goto_3
    const/4 v3, 0x1

    .line 437
    :goto_4
    :try_start_4
    invoke-interface {v2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v6

    invoke-interface {v6, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v1, v0

    .end local v0    # "cause":Ljava/lang/Exception;
    .restart local v1    # "cause":Ljava/lang/Exception;
    goto :goto_1

    .line 433
    :cond_5
    :try_start_5
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .end local v1    # "cause":Ljava/lang/Exception;
    .restart local v0    # "cause":Ljava/lang/Exception;
    goto :goto_3

    .line 439
    .end local v2    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    .end local v5    # "writeBuffer":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    :catchall_0
    move-exception v6

    :goto_5
    :try_start_6
    monitor-exit v7
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v6

    .line 445
    .end local v0    # "cause":Ljava/lang/Exception;
    .restart local v1    # "cause":Ljava/lang/Exception;
    .restart local v2    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v5    # "writeBuffer":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    :cond_6
    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2

    .line 439
    .end local v2    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    :catchall_1
    move-exception v6

    move-object v0, v1

    .end local v1    # "cause":Ljava/lang/Exception;
    .restart local v0    # "cause":Ljava/lang/Exception;
    goto :goto_5

    .end local v0    # "cause":Ljava/lang/Exception;
    .restart local v1    # "cause":Ljava/lang/Exception;
    .restart local v2    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    :cond_7
    move-object v0, v1

    .end local v1    # "cause":Ljava/lang/Exception;
    .restart local v0    # "cause":Ljava/lang/Exception;
    goto :goto_4
.end method

.method static isIoThread(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 306
    .local p0, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    iget-object v1, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->thread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected clearOpWrite(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 329
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->selector:Ljava/nio/channels/Selector;

    .line 330
    .local v2, "selector":Ljava/nio/channels/Selector;
    iget-object v3, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->channel:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v3, v2}, Ljava/nio/channels/SelectableChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v1

    .line 331
    .local v1, "key":Ljava/nio/channels/SelectionKey;
    if-nez v1, :cond_1

    .line 345
    :cond_0
    :goto_0
    return-void

    .line 334
    :cond_1
    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v3

    if-nez v3, :cond_2

    .line 335
    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Ljava/nio/channels/SelectionKey;)V

    goto :goto_0

    .line 339
    :cond_2
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getInternalInterestOps()I

    move-result v0

    .line 340
    .local v0, "interestOps":I
    and-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_0

    .line 341
    and-int/lit8 v0, v0, -0x5

    .line 342
    invoke-virtual {v1, v0}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 343
    invoke-virtual {p1, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->setInternalInterestOps(I)V

    goto :goto_0
.end method

.method protected close(Ljava/nio/channels/SelectionKey;)V
    .locals 2
    .param p1, "k"    # Ljava/nio/channels/SelectionKey;

    .prologue
    .line 78
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    .line 79
    .local v0, "ch":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 80
    return-void
.end method

.method protected close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 5
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;",
            "Lorg/jboss/netty/channel/ChannelFuture;",
            ")V"
        }
    .end annotation

    .prologue
    .line 348
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->isConnected()Z

    move-result v1

    .line 349
    .local v1, "connected":Z
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->isBound()Z

    move-result v0

    .line 350
    .local v0, "bound":Z
    invoke-static {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v2

    .line 353
    .local v2, "iothread":Z
    :try_start_0
    iget-object v4, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->channel:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v4}, Ljava/nio/channels/SelectableChannel;->close()V

    .line 354
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->increaseCancelledKeys()V

    .line 356
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->setClosed()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 357
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 358
    if-eqz v1, :cond_0

    .line 359
    if-eqz v2, :cond_2

    .line 360
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 365
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 366
    if-eqz v2, :cond_3

    .line 367
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 373
    :cond_1
    :goto_1
    invoke-static {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->cleanUpWriteBuffer(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    .line 374
    if-eqz v2, :cond_4

    .line 375
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V

    .line 390
    :goto_2
    return-void

    .line 362
    :cond_2
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnectedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 382
    :catch_0
    move-exception v3

    .line 383
    .local v3, "t":Ljava/lang/Throwable;
    invoke-interface {p2, v3}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 384
    if-eqz v2, :cond_6

    .line 385
    invoke-static {p1, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 369
    .end local v3    # "t":Ljava/lang/Throwable;
    :cond_3
    :try_start_1
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelUnboundLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_1

    .line 377
    :cond_4
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelClosedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2

    .line 380
    :cond_5
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 387
    .restart local v3    # "t":Ljava/lang/Throwable;
    :cond_6
    invoke-static {p1, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2
.end method

.method public executeInIoThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->executeInIoThread(Ljava/lang/Runnable;Z)V

    .line 57
    return-void
.end method

.method public executeInIoThread(Ljava/lang/Runnable;Z)V
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;
    .param p2, "alwaysAsync"    # Z

    .prologue
    .line 69
    if-nez p2, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->isIoThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 74
    :goto_0
    return-void

    .line 72
    :cond_0
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->registerTask(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method protected newThreadRenamingRunnable(ILorg/jboss/netty/util/ThreadNameDeterminer;)Lorg/jboss/netty/util/ThreadRenamingRunnable;
    .locals 3
    .param p1, "id"    # I
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 84
    new-instance v0, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "New I/O worker #"

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
    .locals 6
    .param p1, "selector"    # Ljava/nio/channels/Selector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p1}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v4

    .line 99
    .local v4, "selectedKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 124
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 103
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/channels/SelectionKey;

    .line 104
    .local v2, "k":Ljava/nio/channels/SelectionKey;
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 106
    :try_start_0
    invoke-virtual {v2}, Ljava/nio/channels/SelectionKey;->readyOps()I

    move-result v3

    .line 107
    .local v3, "readyOps":I
    and-int/lit8 v5, v3, 0x1

    if-nez v5, :cond_3

    if-nez v3, :cond_4

    .line 108
    :cond_3
    invoke-virtual {p0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->read(Ljava/nio/channels/SelectionKey;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 113
    :cond_4
    and-int/lit8 v5, v3, 0x4

    if-eqz v5, :cond_5

    .line 114
    invoke-virtual {p0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->writeFromSelectorLoop(Ljava/nio/channels/SelectionKey;)V
    :try_end_0
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v3    # "readyOps":I
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->cleanUpCancelledKeys()Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_0

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/nio/channels/CancelledKeyException;
    invoke-virtual {p0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Ljava/nio/channels/SelectionKey;)V

    goto :goto_1
.end method

.method protected abstract read(Ljava/nio/channels/SelectionKey;)Z
.end method

.method public run()V
    .locals 1

    .prologue
    .line 89
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->run()V

    .line 90
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->sendBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;

    invoke-virtual {v0}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;->releaseExternalResources()V

    .line 91
    return-void
.end method

.method protected abstract scheduleWriteIfNecessary(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)Z"
        }
    .end annotation
.end method

.method setInterestOps(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V
    .locals 11
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "interestOps"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;",
            "Lorg/jboss/netty/channel/ChannelFuture;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 451
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    invoke-static {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v3

    .line 452
    .local v3, "iothread":Z
    if-nez v3, :cond_1

    .line 453
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v8

    new-instance v9, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker$1;

    invoke-direct {v9, p0, p1, p2, p3}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker$1;-><init>(Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    invoke-interface {v8, v9}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 513
    :cond_0
    :goto_0
    return-void

    .line 461
    :cond_1
    const/4 v1, 0x0

    .line 463
    .local v1, "changed":Z
    :try_start_0
    iget-object v6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->selector:Ljava/nio/channels/Selector;

    .line 464
    .local v6, "selector":Ljava/nio/channels/Selector;
    iget-object v8, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->channel:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v8, v6}, Ljava/nio/channels/SelectableChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v4

    .line 467
    .local v4, "key":Ljava/nio/channels/SelectionKey;
    and-int/lit8 v8, p3, -0x5

    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getInternalInterestOps()I

    move-result v9

    and-int/lit8 v9, v9, 0x4

    or-int v5, v8, v9

    .line 469
    .local v5, "newInterestOps":I
    if-eqz v4, :cond_2

    if-nez v6, :cond_5

    .line 470
    :cond_2
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getInternalInterestOps()I

    move-result v8

    if-eq v8, v5, :cond_3

    .line 471
    const/4 v1, 0x1

    .line 476
    :cond_3
    invoke-virtual {p1, v5}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->setInternalInterestOps(I)V

    .line 478
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 479
    if-eqz v1, :cond_0

    .line 480
    if-eqz v3, :cond_4

    .line 481
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChanged(Lorg/jboss/netty/channel/Channel;)V
    :try_end_0
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 504
    .end local v4    # "key":Ljava/nio/channels/SelectionKey;
    .end local v5    # "newInterestOps":I
    .end local v6    # "selector":Ljava/nio/channels/Selector;
    :catch_0
    move-exception v2

    .line 506
    .local v2, "e":Ljava/nio/channels/CancelledKeyException;
    new-instance v0, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v0}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    .line 507
    .local v0, "cce":Ljava/nio/channels/ClosedChannelException;
    invoke-interface {p2, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 508
    invoke-static {p1, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 483
    .end local v0    # "cce":Ljava/nio/channels/ClosedChannelException;
    .end local v2    # "e":Ljava/nio/channels/CancelledKeyException;
    .restart local v4    # "key":Ljava/nio/channels/SelectionKey;
    .restart local v5    # "newInterestOps":I
    .restart local v6    # "selector":Ljava/nio/channels/Selector;
    :cond_4
    :try_start_1
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChangedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_1
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 509
    .end local v4    # "key":Ljava/nio/channels/SelectionKey;
    .end local v5    # "newInterestOps":I
    .end local v6    # "selector":Ljava/nio/channels/Selector;
    :catch_1
    move-exception v7

    .line 510
    .local v7, "t":Ljava/lang/Throwable;
    invoke-interface {p2, v7}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 511
    invoke-static {p1, v7}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 490
    .end local v7    # "t":Ljava/lang/Throwable;
    .restart local v4    # "key":Ljava/nio/channels/SelectionKey;
    .restart local v5    # "newInterestOps":I
    .restart local v6    # "selector":Ljava/nio/channels/Selector;
    :cond_5
    :try_start_2
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getInternalInterestOps()I

    move-result v8

    if-eq v8, v5, :cond_7

    .line 491
    const/4 v1, 0x1

    .line 492
    invoke-virtual {v4, v5}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 493
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    iget-object v9, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->thread:Ljava/lang/Thread;

    if-eq v8, v9, :cond_6

    iget-object v8, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->wakenUp:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 495
    invoke-virtual {v6}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 497
    :cond_6
    invoke-virtual {p1, v5}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->setInternalInterestOps(I)V

    .line 500
    :cond_7
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 501
    if-eqz v1, :cond_0

    .line 502
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChanged(Lorg/jboss/netty/channel/Channel;)V
    :try_end_2
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0
.end method

.method protected setOpWrite(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 310
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->selector:Ljava/nio/channels/Selector;

    .line 311
    .local v2, "selector":Ljava/nio/channels/Selector;
    iget-object v3, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->channel:Ljava/nio/channels/SelectableChannel;

    invoke-virtual {v3, v2}, Ljava/nio/channels/SelectableChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v1

    .line 312
    .local v1, "key":Ljava/nio/channels/SelectionKey;
    if-nez v1, :cond_1

    .line 326
    :cond_0
    :goto_0
    return-void

    .line 315
    :cond_1
    invoke-virtual {v1}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v3

    if-nez v3, :cond_2

    .line 316
    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Ljava/nio/channels/SelectionKey;)V

    goto :goto_0

    .line 320
    :cond_2
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getInternalInterestOps()I

    move-result v0

    .line 321
    .local v0, "interestOps":I
    and-int/lit8 v3, v0, 0x4

    if-nez v3, :cond_0

    .line 322
    or-int/lit8 v0, v0, 0x4

    .line 323
    invoke-virtual {v1, v0}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 324
    invoke-virtual {p1, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->setInternalInterestOps(I)V

    goto :goto_0
.end method

.method protected write0(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    const/16 v21, 0x1

    .line 165
    .local v21, "open":Z
    const/4 v4, 0x0

    .line 166
    .local v4, "addOpWrite":Z
    const/16 v22, 0x0

    .line 167
    .local v22, "removeOpWrite":Z
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v20

    .line 169
    .local v20, "iothread":Z
    const-wide/16 v28, 0x0

    .line 171
    .local v28, "writtenBytes":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->sendBufferPool:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;

    move-object/from16 v23, v0

    .line 172
    .local v23, "sendBufferPool":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->channel:Ljava/nio/channels/SelectableChannel;

    move-object/from16 v16, v0

    check-cast v16, Ljava/nio/channels/WritableByteChannel;

    .line 173
    .local v16, "ch":Ljava/nio/channels/WritableByteChannel;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferQueue:Ljava/util/Queue;

    move-object/from16 v25, v0

    .line 174
    .local v25, "writeBuffer":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/jboss/netty/channel/MessageEvent;>;"
    invoke-virtual/range {p1 .. p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;->getWriteSpinCount()I

    move-result v26

    .line 175
    .local v26, "writeSpinCount":I
    const/4 v14, 0x0

    .line 177
    .local v14, "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeLock:Ljava/lang/Object;

    move-object/from16 v27, v0

    monitor-enter v27

    .line 178
    const/4 v8, 0x1

    :try_start_0
    move-object/from16 v0, p1

    iput-boolean v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->inWriteNowLoop:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v15, v14

    .line 181
    .end local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .local v15, "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :goto_0
    :try_start_1
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    move-object/from16 v17, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 182
    .local v17, "evt":Lorg/jboss/netty/channel/MessageEvent;
    const/4 v12, 0x0

    .line 183
    .local v12, "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    const/4 v5, 0x0

    .line 185
    .local v5, "future":Lorg/jboss/netty/channel/ChannelFuture;
    if-nez v17, :cond_5

    .line 186
    :try_start_2
    invoke-interface/range {v25 .. v25}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    if-nez v17, :cond_2

    .line 187
    const/16 v22, 0x1

    .line 188
    const/4 v8, 0x0

    move-object/from16 v0, p1

    iput-boolean v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z
    :try_end_2
    .catch Ljava/nio/channels/AsynchronousCloseException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 272
    :cond_0
    :goto_1
    const/4 v8, 0x0

    :try_start_3
    move-object/from16 v0, p1

    iput-boolean v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->inWriteNowLoop:Z

    .line 280
    if-eqz v21, :cond_1

    .line 281
    if-eqz v4, :cond_b

    .line 282
    invoke-virtual/range {p0 .. p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->setOpWrite(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    .line 287
    :cond_1
    :goto_2
    monitor-exit v27
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 288
    if-eqz v15, :cond_c

    .line 289
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .local v19, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Throwable;

    .line 291
    .local v13, "cause":Ljava/lang/Throwable;
    move-object/from16 v0, p1

    invoke-static {v0, v13}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 191
    .end local v13    # "cause":Ljava/lang/Throwable;
    .end local v19    # "i$":Ljava/util/Iterator;
    :cond_2
    :try_start_4
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    .line 193
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;->acquire(Ljava/lang/Object;)Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    move-result-object v12

    move-object/from16 v0, p1

    iput-object v12, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    .line 199
    :goto_4
    const-wide/16 v6, 0x0

    .line 200
    .local v6, "localWrittenBytes":J
    move/from16 v18, v26

    .local v18, "i":I
    :goto_5
    if-lez v18, :cond_3

    .line 201
    move-object/from16 v0, v16

    invoke-interface {v12, v0}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->transferTo(Ljava/nio/channels/WritableByteChannel;)J

    move-result-wide v6

    .line 202
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-eqz v8, :cond_6

    .line 203
    add-long v28, v28, v6

    .line 211
    :cond_3
    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->finished()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 213
    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->release()V

    .line 214
    const/4 v8, 0x0

    move-object/from16 v0, p1

    iput-object v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 215
    const/4 v8, 0x0

    move-object/from16 v0, p1

    iput-object v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    .line 218
    const/16 v17, 0x0

    .line 219
    const/4 v12, 0x0

    .line 220
    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    move-object v14, v15

    .end local v6    # "localWrittenBytes":J
    .end local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v18    # "i":I
    .restart local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_4
    :goto_6
    move-object v15, v14

    .line 271
    .end local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    goto/16 :goto_0

    .line 195
    :cond_5
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    .line 196
    move-object/from16 v0, p1

    iget-object v12, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    goto :goto_4

    .line 206
    .restart local v6    # "localWrittenBytes":J
    .restart local v18    # "i":I
    :cond_6
    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->finished()Z

    move-result v8

    if-nez v8, :cond_3

    .line 200
    add-int/lit8 v18, v18, -0x1

    goto :goto_5

    .line 223
    :cond_7
    const/4 v4, 0x1

    .line 224
    const/4 v8, 0x1

    move-object/from16 v0, p1

    iput-boolean v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z

    .line 226
    const-wide/16 v8, 0x0

    cmp-long v8, v28, v8

    if-lez v8, :cond_0

    .line 228
    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->writtenBytes()J

    move-result-wide v8

    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->totalBytes()J

    move-result-wide v10

    invoke-interface/range {v5 .. v11}, Lorg/jboss/netty/channel/ChannelFuture;->setProgress(JJJ)Z
    :try_end_4
    .catch Ljava/nio/channels/AsynchronousCloseException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_1

    .line 234
    .end local v6    # "localWrittenBytes":J
    .end local v18    # "i":I
    :catch_0
    move-exception v8

    move-object v14, v15

    .line 270
    .end local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    goto :goto_6

    .line 236
    .end local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :catch_1
    move-exception v24

    .line 237
    .local v24, "t":Ljava/lang/Throwable;
    if-eqz v12, :cond_8

    .line 238
    :try_start_5
    invoke-interface {v12}, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;->release()V

    .line 240
    :cond_8
    const/4 v8, 0x0

    move-object/from16 v0, p1

    iput-object v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

    .line 241
    const/4 v8, 0x0

    move-object/from16 v0, p1

    iput-object v8, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

    .line 244
    const/4 v12, 0x0

    .line 246
    const/16 v17, 0x0

    .line 247
    if-eqz v5, :cond_9

    .line 248
    move-object/from16 v0, v24

    invoke-interface {v5, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 250
    :cond_9
    if-eqz v20, :cond_a

    .line 255
    if-nez v15, :cond_f

    .line 256
    new-instance v14, Ljava/util/ArrayList;

    const/4 v8, 0x1

    invoke-direct {v14, v8}, Ljava/util/ArrayList;-><init>(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 258
    .end local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :goto_7
    :try_start_6
    move-object/from16 v0, v24

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    :goto_8
    move-object/from16 v0, v24

    instance-of v8, v0, Ljava/io/IOException;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v8, :cond_4

    .line 268
    const/16 v21, 0x0

    goto :goto_6

    .line 260
    .end local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_a
    :try_start_7
    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-object v14, v15

    .end local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    goto :goto_8

    .line 283
    .end local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v24    # "t":Ljava/lang/Throwable;
    .restart local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_b
    if-eqz v22, :cond_1

    .line 284
    invoke-virtual/range {p0 .. p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->clearOpWrite(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_2

    .line 287
    .end local v5    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v12    # "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    .end local v17    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    :catchall_0
    move-exception v8

    move-object v14, v15

    .end local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :goto_9
    :try_start_8
    monitor-exit v27
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v8

    .line 294
    .end local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v5    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v12    # "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    .restart local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v17    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    :cond_c
    if-nez v21, :cond_d

    .line 296
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v8}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 298
    :cond_d
    if-eqz v20, :cond_e

    .line 299
    move-object/from16 v0, p1

    move-wide/from16 v1, v28

    invoke-static {v0, v1, v2}, Lorg/jboss/netty/channel/Channels;->fireWriteComplete(Lorg/jboss/netty/channel/Channel;J)V

    .line 303
    :goto_a
    return-void

    .line 301
    :cond_e
    move-object/from16 v0, p1

    move-wide/from16 v1, v28

    invoke-static {v0, v1, v2}, Lorg/jboss/netty/channel/Channels;->fireWriteCompleteLater(Lorg/jboss/netty/channel/Channel;J)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_a

    .line 287
    .end local v5    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v12    # "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    .end local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v17    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :catchall_1
    move-exception v8

    goto :goto_9

    .end local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v5    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v12    # "buf":Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;
    .restart local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v17    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v24    # "t":Ljava/lang/Throwable;
    :cond_f
    move-object v14, v15

    .end local v15    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v14    # "causes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    goto :goto_7
.end method

.method writeFromSelectorLoop(Ljava/nio/channels/SelectionKey;)V
    .locals 2
    .param p1, "k"    # Ljava/nio/channels/SelectionKey;

    .prologue
    .line 156
    invoke-virtual {p1}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    .line 157
    .local v0, "ch":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z

    .line 158
    invoke-virtual {p0, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->write0(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    .line 159
    return-void
.end method

.method writeFromTaskLoop(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "ch":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    iget-boolean v0, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z

    if-nez v0, :cond_0

    .line 151
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->write0(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    .line 153
    :cond_0
    return-void
.end method

.method writeFromUserCode(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p1, "channel":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<*>;"
    invoke-virtual {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 128
    invoke-static {p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->cleanUpWriteBuffer(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    .line 147
    :cond_0
    :goto_0
    return-void

    .line 132
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->scheduleWriteIfNecessary(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 138
    iget-boolean v0, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeSuspended:Z

    if-nez v0, :cond_0

    .line 142
    iget-boolean v0, p1, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->inWriteNowLoop:Z

    if-nez v0, :cond_0

    .line 146
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->write0(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    goto :goto_0
.end method
