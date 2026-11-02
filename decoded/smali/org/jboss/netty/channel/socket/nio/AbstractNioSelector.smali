.class abstract Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
.super Ljava/lang/Object;
.source "AbstractNioSelector.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/NioSelector;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CLEANUP_INTERVAL:I = 0x100

.field protected static final logger:Lorg/jboss/netty/logging/InternalLogger;

.field private static final nextId:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private volatile cancelledKeys:I

.field private final executor:Ljava/util/concurrent/Executor;

.field private final id:I

.field protected volatile selector:Ljava/nio/channels/Selector;

.field private volatile shutdown:Z

.field private final shutdownLatch:Ljava/util/concurrent/CountDownLatch;

.field final startupLatch:Ljava/util/concurrent/CountDownLatch;

.field private final taskQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected volatile thread:Ljava/lang/Thread;

.field protected final wakenUp:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-class v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->$assertionsDisabled:Z

    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 52
    const-class v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void

    .line 43
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 95
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 96
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    const/4 v1, 0x1

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->id:I

    .line 72
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->startupLatch:Ljava/util/concurrent/CountDownLatch;

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->wakenUp:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 87
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->taskQueue:Ljava/util/Queue;

    .line 91
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->shutdownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 99
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->executor:Ljava/util/concurrent/Executor;

    .line 100
    invoke-direct {p0, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->openSelector(Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 101
    return-void
.end method

.method private openSelector(Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 6
    .param p1, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    const/4 v5, 0x0

    .line 360
    :try_start_0
    invoke-static {}, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->open()Ljava/nio/channels/Selector;

    move-result-object v2

    iput-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 366
    const/4 v0, 0x0

    .line 368
    .local v0, "success":Z
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->executor:Ljava/util/concurrent/Executor;

    iget v3, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->id:I

    invoke-virtual {p0, v3, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->newThreadRenamingRunnable(ILorg/jboss/netty/util/ThreadNameDeterminer;)Lorg/jboss/netty/util/ThreadRenamingRunnable;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->start(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 369
    const/4 v0, 0x1

    .line 371
    if-nez v0, :cond_0

    .line 374
    :try_start_2
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 378
    :goto_0
    iput-object v5, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 382
    :cond_0
    sget-boolean v2, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->$assertionsDisabled:Z

    if-nez v2, :cond_3

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->isOpen()Z

    move-result v2

    if-nez v2, :cond_3

    :cond_1
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 361
    .end local v0    # "success":Z
    :catch_0
    move-exception v1

    .line 362
    .local v1, "t":Ljava/lang/Throwable;
    new-instance v2, Lorg/jboss/netty/channel/ChannelException;

    const-string v3, "Failed to create a selector."

    invoke-direct {v2, v3, v1}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 375
    .end local v1    # "t":Ljava/lang/Throwable;
    .restart local v0    # "success":Z
    :catch_1
    move-exception v1

    .line 376
    .restart local v1    # "t":Ljava/lang/Throwable;
    sget-object v2, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v3, "Failed to close a selector."

    invoke-interface {v2, v3, v1}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 371
    .end local v1    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v2

    if-nez v0, :cond_2

    .line 374
    :try_start_3
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v3}, Ljava/nio/channels/Selector;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    .line 378
    :goto_1
    iput-object v5, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    :cond_2
    throw v2

    .line 375
    :catch_2
    move-exception v1

    .line 376
    .restart local v1    # "t":Ljava/lang/Throwable;
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v4, "Failed to close a selector."

    invoke-interface {v3, v4, v1}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 383
    .end local v1    # "t":Ljava/lang/Throwable;
    :cond_3
    return-void
.end method

.method private processTaskQueue()V
    .locals 2

    .prologue
    .line 387
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->taskQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 388
    .local v0, "task":Ljava/lang/Runnable;
    if-nez v0, :cond_0

    .line 398
    return-void

    .line 391
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 393
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->cleanUpCancelledKeys()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 394
    :catch_0
    move-exception v1

    goto :goto_0
.end method


# virtual methods
.method protected final cleanUpCancelledKeys()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 405
    iget v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->cancelledKeys:I

    const/16 v2, 0x100

    if-lt v1, v2, :cond_0

    .line 406
    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->cancelledKeys:I

    .line 407
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->selectNow()I

    .line 408
    const/4 v0, 0x1

    .line 410
    :cond_0
    return v0
.end method

.method protected abstract close(Ljava/nio/channels/SelectionKey;)V
.end method

.method protected abstract createRegisterTask(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)Ljava/lang/Runnable;
.end method

.method protected final increaseCancelledKeys()V
    .locals 1

    .prologue
    .line 401
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->cancelledKeys:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->cancelledKeys:I

    .line 402
    return-void
.end method

.method protected final isIoThread()Z
    .locals 2

    .prologue
    .line 126
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->thread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract newThreadRenamingRunnable(ILorg/jboss/netty/util/ThreadNameDeterminer;)Lorg/jboss/netty/util/ThreadRenamingRunnable;
.end method

.method protected abstract process(Ljava/nio/channels/Selector;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public rebuildSelector()V
    .locals 11

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->isIoThread()Z

    move-result v8

    if-nez v8, :cond_1

    .line 131
    iget-object v8, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->taskQueue:Ljava/util/Queue;

    new-instance v9, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector$1;

    invoke-direct {v9, p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector$1;-><init>(Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;)V

    invoke-interface {v8, v9}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    iget-object v6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 142
    .local v6, "oldSelector":Ljava/nio/channels/Selector;
    if-eqz v6, :cond_0

    .line 147
    :try_start_0
    invoke-static {}, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->open()Ljava/nio/channels/Selector;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 154
    .local v5, "newSelector":Ljava/nio/channels/Selector;
    const/4 v4, 0x0

    .line 157
    .local v4, "nChannels":I
    :goto_1
    :try_start_1
    invoke-virtual {v6}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/channels/SelectionKey;
    :try_end_1
    .catch Ljava/util/ConcurrentModificationException; {:try_start_1 .. :try_end_1} :catch_2

    .line 159
    .local v3, "key":Ljava/nio/channels/SelectionKey;
    :try_start_2
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/nio/channels/SelectableChannel;->keyFor(Ljava/nio/channels/Selector;)Ljava/nio/channels/SelectionKey;

    move-result-object v8

    if-nez v8, :cond_2

    .line 163
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->interestOps()I

    move-result v2

    .line 164
    .local v2, "interestOps":I
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 165
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v8

    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v5, v2, v9}, Ljava/nio/channels/SelectableChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/util/ConcurrentModificationException; {:try_start_2 .. :try_end_2} :catch_2

    .line 166
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 148
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "interestOps":I
    .end local v3    # "key":Ljava/nio/channels/SelectionKey;
    .end local v4    # "nChannels":I
    .end local v5    # "newSelector":Ljava/nio/channels/Selector;
    :catch_0
    move-exception v0

    .line 149
    .local v0, "e":Ljava/lang/Exception;
    sget-object v8, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v9, "Failed to create a new Selector."

    invoke-interface {v8, v9, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 167
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v3    # "key":Ljava/nio/channels/SelectionKey;
    .restart local v4    # "nChannels":I
    .restart local v5    # "newSelector":Ljava/nio/channels/Selector;
    :catch_1
    move-exception v0

    .line 168
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v8, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v9, "Failed to re-register a Channel to the new Selector,"

    invoke-interface {v8, v9, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 169
    invoke-virtual {p0, v3}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->close(Ljava/nio/channels/SelectionKey;)V
    :try_end_3
    .catch Ljava/util/ConcurrentModificationException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    .line 172
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "key":Ljava/nio/channels/SelectionKey;
    :catch_2
    move-exception v0

    .line 174
    .local v0, "e":Ljava/util/ConcurrentModificationException;
    goto :goto_1

    .line 180
    .end local v0    # "e":Ljava/util/ConcurrentModificationException;
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    iput-object v5, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 184
    :try_start_4
    invoke-virtual {v6}, Ljava/nio/channels/Selector;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    .line 191
    :cond_4
    :goto_3
    sget-object v8, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Migrated "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " channel(s) to the new Selector,"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/jboss/netty/logging/InternalLogger;->info(Ljava/lang/String;)V

    goto :goto_0

    .line 185
    :catch_3
    move-exception v7

    .line 186
    .local v7, "t":Ljava/lang/Throwable;
    sget-object v8, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v8}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 187
    sget-object v8, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v9, "Failed to close the old Selector."

    invoke-interface {v8, v9, v7}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 104
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->createRegisterTask(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)Ljava/lang/Runnable;

    move-result-object v0

    .line 105
    .local v0, "task":Ljava/lang/Runnable;
    invoke-virtual {p0, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->registerTask(Ljava/lang/Runnable;)V

    .line 106
    return-void
.end method

.method protected final registerTask(Ljava/lang/Runnable;)V
    .locals 4
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 109
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->taskQueue:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 111
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 113
    .local v0, "selector":Ljava/nio/channels/Selector;
    if-eqz v0, :cond_1

    .line 114
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->wakenUp:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 123
    :cond_0
    return-void

    .line 118
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->taskQueue:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 120
    new-instance v1, Ljava/util/concurrent/RejectedExecutionException;

    const-string v2, "Worker has already been shutdown"

    invoke-direct {v1, v2}, Ljava/util/concurrent/RejectedExecutionException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public run()V
    .locals 24

    .prologue
    .line 195
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->thread:Ljava/lang/Thread;

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->startupLatch:Ljava/util/concurrent/CountDownLatch;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 198
    const/4 v12, 0x0

    .line 199
    .local v12, "selectReturnsImmediately":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 201
    .local v14, "selector":Ljava/nio/channels/Selector;
    if-nez v14, :cond_0

    .line 352
    :goto_0
    return-void

    .line 205
    :cond_0
    sget-wide v20, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->SELECT_TIMEOUT_NANOS:J

    const-wide/16 v22, 0x50

    mul-long v20, v20, v22

    const-wide/16 v22, 0x64

    div-long v10, v20, v22

    .line 206
    .local v10, "minSelectTimeout":J
    const/16 v18, 0x0

    .line 208
    .local v18, "wakenupFromLoop":Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->wakenUp:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 211
    :try_start_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 212
    .local v2, "beforeSelect":J
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->select(Ljava/nio/channels/Selector;)I

    move-result v13

    .line 213
    .local v13, "selected":I
    if-nez v13, :cond_9

    if-nez v18, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->wakenUp:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v19

    if-nez v19, :cond_9

    .line 214
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v20

    sub-long v16, v20, v2

    .line 215
    .local v16, "timeBlocked":J
    cmp-long v19, v16, v10

    if-gez v19, :cond_8

    .line 216
    const/4 v9, 0x0

    .line 218
    .local v9, "notConnected":Z
    invoke-virtual {v14}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/nio/channels/SelectionKey;

    .line 219
    .local v8, "key":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v8}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 221
    .local v4, "ch":Ljava/nio/channels/SelectableChannel;
    :try_start_1
    instance-of v0, v4, Ljava/nio/channels/DatagramChannel;

    move/from16 v19, v0

    if-eqz v19, :cond_2

    invoke-virtual {v4}, Ljava/nio/channels/SelectableChannel;->isOpen()Z

    move-result v19

    if-eqz v19, :cond_3

    :cond_2
    instance-of v0, v4, Ljava/nio/channels/SocketChannel;

    move/from16 v19, v0

    if-eqz v19, :cond_1

    move-object v0, v4

    check-cast v0, Ljava/nio/channels/SocketChannel;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/nio/channels/SocketChannel;->isConnected()Z

    move-result v19

    if-nez v19, :cond_1

    check-cast v4, Ljava/nio/channels/SocketChannel;

    .end local v4    # "ch":Ljava/nio/channels/SelectableChannel;
    invoke-virtual {v4}, Ljava/nio/channels/SocketChannel;->isConnectionPending()Z

    move-result v19

    if-nez v19, :cond_1

    .line 226
    :cond_3
    const/4 v9, 0x1

    .line 228
    invoke-virtual {v8}, Ljava/nio/channels/SelectionKey;->cancel()V
    :try_end_1
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 230
    :catch_0
    move-exception v19

    goto :goto_2

    .line 234
    .end local v8    # "key":Ljava/nio/channels/SelectionKey;
    :cond_4
    if-eqz v9, :cond_5

    .line 235
    const/4 v12, 0x0

    .line 262
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "notConnected":Z
    .end local v16    # "timeBlocked":J
    :goto_3
    :try_start_2
    sget-boolean v19, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->EPOLL_BUG_WORKAROUND:Z

    if-eqz v19, :cond_a

    .line 263
    const/16 v19, 0x400

    move/from16 v0, v19

    if-ne v12, v0, :cond_b

    .line 267
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->rebuildSelector()V

    .line 268
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 269
    const/4 v12, 0x0

    .line 270
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 237
    .restart local v6    # "i$":Ljava/util/Iterator;
    .restart local v9    # "notConnected":Z
    .restart local v16    # "timeBlocked":J
    :cond_5
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v19

    if-eqz v19, :cond_7

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->shutdown:Z

    move/from16 v19, v0

    if-nez v19, :cond_7

    .line 243
    sget-object v19, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 244
    sget-object v19, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v20, "Selector.select() returned prematurely because the I/O thread has been interrupted. Use shutdown() to shut the NioSelector down."

    invoke-interface/range {v19 .. v20}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 247
    :cond_6
    const/4 v12, 0x0

    goto :goto_3

    .line 252
    :cond_7
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 256
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "notConnected":Z
    :cond_8
    const/4 v12, 0x0

    goto :goto_3

    .line 259
    .end local v16    # "timeBlocked":J
    :cond_9
    const/4 v12, 0x0

    goto :goto_3

    .line 276
    :cond_a
    const/4 v12, 0x0

    .line 307
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->wakenUp:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v19

    if-eqz v19, :cond_c

    .line 308
    const/16 v18, 0x1

    .line 309
    invoke-virtual {v14}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 314
    :goto_4
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->cancelledKeys:I

    .line 315
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->processTaskQueue()V

    .line 316
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 318
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->shutdown:Z

    move/from16 v19, v0

    if-eqz v19, :cond_e

    .line 319
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 322
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->processTaskQueue()V

    .line 324
    invoke-virtual {v14}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_d

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/nio/channels/SelectionKey;

    .line 325
    .local v7, "k":Ljava/nio/channels/SelectionKey;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->close(Ljava/nio/channels/SelectionKey;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_5

    .line 339
    .end local v2    # "beforeSelect":J
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "k":Ljava/nio/channels/SelectionKey;
    .end local v13    # "selected":I
    :catch_1
    move-exception v15

    .line 340
    .local v15, "t":Ljava/lang/Throwable;
    sget-object v19, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v20, "Unexpected exception in the selector loop."

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v1, v15}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 346
    const-wide/16 v20, 0x3e8

    :try_start_3
    invoke-static/range {v20 .. v21}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_1

    .line 347
    :catch_2
    move-exception v19

    goto/16 :goto_1

    .line 311
    .end local v15    # "t":Ljava/lang/Throwable;
    .restart local v2    # "beforeSelect":J
    .restart local v13    # "selected":I
    :cond_c
    const/16 v18, 0x0

    goto :goto_4

    .line 329
    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_d
    :try_start_4
    invoke-virtual {v14}, Ljava/nio/channels/Selector;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    .line 334
    :goto_6
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->shutdownLatch:Ljava/util/concurrent/CountDownLatch;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto/16 :goto_0

    .line 330
    :catch_3
    move-exception v5

    .line 331
    .local v5, "e":Ljava/io/IOException;
    sget-object v19, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v20, "Failed to close a selector."

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v1, v5}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 337
    .end local v5    # "e":Ljava/io/IOException;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_e
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->process(Ljava/nio/channels/Selector;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_1
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
    .line 434
    invoke-static {p1}, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->select(Ljava/nio/channels/Selector;)I

    move-result v0

    return v0
.end method

.method public shutdown()V
    .locals 5

    .prologue
    .line 414
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->isIoThread()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 415
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Must not be called from a I/O-Thread to prevent deadlocks!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 418
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->selector:Ljava/nio/channels/Selector;

    .line 419
    .local v1, "selector":Ljava/nio/channels/Selector;
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->shutdown:Z

    .line 420
    if-eqz v1, :cond_1

    .line 421
    invoke-virtual {v1}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 424
    :cond_1
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->shutdownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 429
    :goto_0
    return-void

    .line 425
    :catch_0
    move-exception v0

    .line 426
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v2, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Interrupted while wait for resources to be released #"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->id:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->error(Ljava/lang/String;)V

    .line 427
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0
.end method
