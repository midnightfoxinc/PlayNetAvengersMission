.class public abstract Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;
.super Ljava/lang/Object;
.source "AbstractNioBossPool.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/BossPool;
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E::",
        "Lorg/jboss/netty/channel/socket/nio/Boss;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/channel/socket/nio/BossPool",
        "<TE;>;",
        "Lorg/jboss/netty/util/ExternalResourceReleasable;"
    }
.end annotation


# static fields
.field private static final INITIALIZATION_TIMEOUT:I = 0xa

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final bossExecutor:Ljava/util/concurrent/Executor;

.field private final bossIndex:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

.field private final initialized:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;I)V
    .locals 1
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "bossCount"    # I

    .prologue
    .line 50
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;-><init>(Ljava/util/concurrent/Executor;IZ)V

    .line 51
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;IZ)V
    .locals 3
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "bossCount"    # I
    .param p3, "autoInit"    # Z

    .prologue
    .line 53
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bossIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 54
    if-nez p1, :cond_0

    .line 55
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bossExecutor"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_0
    if-gtz p2, :cond_1

    .line 58
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bossCount ("

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

    .line 62
    :cond_1
    new-array v0, p2, [Lorg/jboss/netty/channel/socket/nio/Boss;

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

    .line 63
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bossExecutor:Ljava/util/concurrent/Executor;

    .line 64
    if-eqz p3, :cond_2

    .line 65
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->init()V

    .line 67
    :cond_2
    return-void
.end method

.method private waitForBossThreads()V
    .locals 18

    .prologue
    .line 82
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    sget-object v13, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v16, 0xa

    move-wide/from16 v0, v16

    invoke-virtual {v13, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v16

    add-long v4, v14, v16

    .line 83
    .local v4, "deadline":J
    const/4 v12, 0x0

    .line 84
    .local v12, "warn":Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

    .local v2, "arr$":[Lorg/jboss/netty/channel/socket/nio/Boss;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-ge v6, v8, :cond_2

    aget-object v3, v2, v6

    .line 85
    .local v3, "boss":Lorg/jboss/netty/channel/socket/nio/Boss;
    instance-of v13, v3, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;

    if-nez v13, :cond_1

    .line 84
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    move-object v9, v3

    .line 89
    check-cast v9, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;

    .line 90
    .local v9, "selector":Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    sub-long v10, v4, v14

    .line 92
    .local v10, "waitTime":J
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-gtz v13, :cond_4

    .line 93
    :try_start_0
    iget-object v13, v9, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->thread:Ljava/lang/Thread;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v13, :cond_0

    .line 94
    const/4 v12, 0x1

    .line 108
    .end local v3    # "boss":Lorg/jboss/netty/channel/socket/nio/Boss;
    .end local v9    # "selector":Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
    .end local v10    # "waitTime":J
    :cond_2
    :goto_1
    if-eqz v12, :cond_3

    .line 109
    sget-object v13, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v14, "Failed to get all boss threads ready within 10 second(s). Make sure to specify the executor which has more threads than the requested bossCount. If unsure, use Executors.newCachedThreadPool()."

    invoke-interface {v13, v14}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    .line 114
    :cond_3
    return-void

    .line 97
    .restart local v3    # "boss":Lorg/jboss/netty/channel/socket/nio/Boss;
    .restart local v9    # "selector":Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;
    .restart local v10    # "waitTime":J
    :cond_4
    :try_start_1
    iget-object v13, v9, Lorg/jboss/netty/channel/socket/nio/AbstractNioSelector;->startupLatch:Ljava/util/concurrent/CountDownLatch;

    sget-object v14, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v13, v10, v11, v14}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v13

    if-nez v13, :cond_0

    .line 98
    const/4 v12, 0x1

    goto :goto_1

    .line 101
    :catch_0
    move-exception v7

    .line 103
    .local v7, "ignore":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1
.end method


# virtual methods
.method protected init()V
    .locals 4

    .prologue
    .line 70
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->initialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 71
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "initialized already"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 74
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 75
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bossExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->newBoss(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/Boss;

    move-result-object v2

    aput-object v2, v1, v0

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 78
    :cond_1
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->waitForBossThreads()V

    .line 79
    return-void
.end method

.method protected abstract newBoss(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/Boss;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            ")TE;"
        }
    .end annotation
.end method

.method public nextBoss()Lorg/jboss/netty/channel/socket/nio/Boss;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bossIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

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
    .line 131
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

    .local v0, "arr$":[Lorg/jboss/netty/channel/socket/nio/Boss;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 132
    .local v1, "boss":Lorg/jboss/netty/channel/socket/nio/Boss;
    invoke-interface {v1}, Lorg/jboss/netty/channel/socket/nio/Boss;->rebuildSelector()V

    .line 131
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 134
    .end local v1    # "boss":Lorg/jboss/netty/channel/socket/nio/Boss;
    :cond_0
    return-void
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 137
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->shutdown()V

    .line 138
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bossExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lorg/jboss/netty/util/internal/ExecutorUtil;->shutdownNow(Ljava/util/concurrent/Executor;)V

    .line 139
    return-void
.end method

.method public shutdown()V
    .locals 4

    .prologue
    .line 142
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->bosses:[Lorg/jboss/netty/channel/socket/nio/Boss;

    .local v0, "arr$":[Lorg/jboss/netty/channel/socket/nio/Boss;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 143
    .local v1, "boss":Lorg/jboss/netty/channel/socket/nio/Boss;
    invoke-interface {v1}, Lorg/jboss/netty/channel/socket/nio/Boss;->shutdown()V

    .line 142
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 145
    .end local v1    # "boss":Lorg/jboss/netty/channel/socket/nio/Boss;
    :cond_0
    return-void
.end method
