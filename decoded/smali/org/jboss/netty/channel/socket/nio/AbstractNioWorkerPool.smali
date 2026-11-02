.class public abstract Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;
.super Ljava/lang/Object;
.source "AbstractNioWorkerPool.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/WorkerPool;
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
        "<TE;>;",
        "Lorg/jboss/netty/util/ExternalResourceReleasable;"
    }
.end annotation


# static fields
.field private static final INITIALIZATION_TIMEOUT:I = 0xa

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final workerExecutor:Ljava/util/concurrent/Executor;

.field private final workerIndex:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-class v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;I)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerCount"    # I

    .prologue
    .line 56
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;-><init>(Ljava/util/concurrent/Executor;IZ)V

    .line 57
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;IZ)V
    .locals 3
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerCount"    # I
    .param p3, "autoInit"    # Z

    .prologue
    .line 59
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workerIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 60
    if-nez p1, :cond_0

    .line 61
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "workerExecutor"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_0
    if-gtz p2, :cond_1

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "workerCount ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "must be a positive integer."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_1
    new-array v0, p2, [Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    .line 68
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workerExecutor:Ljava/util/concurrent/Executor;

    .line 69
    if-eqz p3, :cond_2

    .line 70
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->init()V

    .line 72
    :cond_2
    return-void
.end method

.method private waitForWorkerThreads()V
    .locals 18

    .prologue
    .line 87
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    sget-object v14, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v16, 0xa

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v14

    add-long v4, v12, v14

    .line 88
    .local v4, "deadline":J
    const/4 v10, 0x0

    .line 89
    .local v10, "warn":Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    .local v2, "arr$":[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v7, :cond_0

    aget-object v11, v2, v3

    .line 90
    .local v11, "worker":Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    sub-long v8, v4, v12

    .line 92
    .local v8, "waitTime":J
    const-wide/16 v12, 0x0

    cmp-long v12, v8, v12

    if-gtz v12, :cond_2

    .line 93
    :try_start_0
    iget-object v12, v11, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->thread:Ljava/lang/Thread;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v12, :cond_3

    .line 94
    const/4 v10, 0x1

    .line 108
    .end local v8    # "waitTime":J
    .end local v11    # "worker":Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
    :cond_0
    :goto_1
    if-eqz v10, :cond_1

    .line 109
    sget-object v12, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v13, "Failed to get all worker threads ready within 10 second(s). Make sure to specify the executor which has more threads than the requested workerCount. If unsure, use Executors.newCachedThreadPool()."

    invoke-interface {v12, v13}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    .line 114
    :cond_1
    return-void

    .line 97
    .restart local v8    # "waitTime":J
    .restart local v11    # "worker":Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
    :cond_2
    :try_start_1
    iget-object v12, v11, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->startupLatch:Ljava/util/concurrent/CountDownLatch;

    sget-object v13, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v12, v8, v9, v13}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v12

    if-nez v12, :cond_3

    .line 98
    const/4 v10, 0x1

    goto :goto_1

    .line 101
    :catch_0
    move-exception v6

    .line 103
    .local v6, "ignore":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 89
    .end local v6    # "ignore":Ljava/lang/InterruptedException;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected init()V
    .locals 4

    .prologue
    .line 75
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 76
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "initialized already"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 80
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workerExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->newWorker(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    move-result-object v2

    aput-object v2, v1, v0

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 83
    :cond_1
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->waitForWorkerThreads()V

    .line 84
    return-void
.end method

.method protected abstract newWorker(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")TE;"
        }
    .end annotation
.end method

.method public bridge synthetic nextWorker()Lorg/jboss/netty/channel/socket/Worker;
    .locals 1

    .prologue
    .line 34
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->nextWorker()Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    move-result-object v0

    return-object v0
.end method

.method public nextWorker()Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workerIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    array-length v2, v2

    rem-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public rebuildSelectors()V
    .locals 4

    .prologue
    .line 130
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    .local v0, "arr$":[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 131
    .local v3, "worker":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    invoke-virtual {v3}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->rebuildSelector()V

    .line 130
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 133
    .end local v3    # "worker":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    :cond_0
    return-void
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 136
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->shutdown()V

    .line 137
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workerExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lorg/jboss/netty/util/internal/ExecutorUtil;->shutdownNow(Ljava/util/concurrent/Executor;)V

    .line 138
    return-void
.end method

.method public shutdown()V
    .locals 4

    .prologue
    .line 141
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;->workers:[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    .local v0, "arr$":[Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 142
    .local v3, "worker":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    invoke-virtual {v3}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->shutdown()V

    .line 141
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 144
    .end local v3    # "worker":Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    :cond_0
    return-void
.end method
