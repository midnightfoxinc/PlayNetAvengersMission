.class public Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "MemoryAwareThreadPoolExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$1;,
        Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;,
        Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$MemoryAwareRunnable;,
        Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$NewThreadRunsPolicy;,
        Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;
    }
.end annotation


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;

.field private static final misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;


# instance fields
.field private final channelCounters:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Lorg/jboss/netty/channel/Channel;",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            ">;"
        }
    .end annotation
.end field

.field private volatile notifyOnShutdown:Z

.field private volatile settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

.field private final totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 141
    const-class v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 144
    new-instance v0, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    const-class v1, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;

    invoke-direct {v0, v1}, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    return-void
.end method

.method public constructor <init>(IJJ)V
    .locals 10
    .param p1, "corePoolSize"    # I
    .param p2, "maxChannelMemorySize"    # J
    .param p4, "maxTotalMemorySize"    # J

    .prologue
    .line 167
    const-wide/16 v6, 0x1e

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v8}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;-><init>(IJJJLjava/util/concurrent/TimeUnit;)V

    .line 168
    return-void
.end method

.method public constructor <init>(IJJJLjava/util/concurrent/TimeUnit;)V
    .locals 10
    .param p1, "corePoolSize"    # I
    .param p2, "maxChannelMemorySize"    # J
    .param p4, "maxTotalMemorySize"    # J
    .param p6, "keepAliveTime"    # J
    .param p8, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 185
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v9

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-wide/from16 v6, p6

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;-><init>(IJJJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ThreadFactory;)V

    .line 188
    return-void
.end method

.method public constructor <init>(IJJJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ThreadFactory;)V
    .locals 12
    .param p1, "corePoolSize"    # I
    .param p2, "maxChannelMemorySize"    # J
    .param p4, "maxTotalMemorySize"    # J
    .param p6, "keepAliveTime"    # J
    .param p8, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p9, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 206
    new-instance v9, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;

    invoke-direct {v9}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;-><init>()V

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move-object/from16 v8, p8

    move-object/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;-><init>(IJJJLjava/util/concurrent/TimeUnit;Lorg/jboss/netty/util/ObjectSizeEstimator;Ljava/util/concurrent/ThreadFactory;)V

    .line 209
    return-void
.end method

.method public constructor <init>(IJJJLjava/util/concurrent/TimeUnit;Lorg/jboss/netty/util/ObjectSizeEstimator;Ljava/util/concurrent/ThreadFactory;)V
    .locals 16
    .param p1, "corePoolSize"    # I
    .param p2, "maxChannelMemorySize"    # J
    .param p4, "maxTotalMemorySize"    # J
    .param p6, "keepAliveTime"    # J
    .param p8, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p9, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p10, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 229
    new-instance v11, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v11}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v13, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$NewThreadRunsPolicy;

    const/4 v5, 0x0

    invoke-direct {v13, v5}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$NewThreadRunsPolicy;-><init>(Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$1;)V

    move-object/from16 v5, p0

    move/from16 v6, p1

    move/from16 v7, p1

    move-wide/from16 v8, p6

    move-object/from16 v10, p8

    move-object/from16 v12, p10

    invoke-direct/range {v5 .. v13}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 149
    new-instance v5, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-direct {v5}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->channelCounters:Ljava/util/concurrent/ConcurrentMap;

    .line 232
    if-nez p9, :cond_0

    .line 233
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "objectSizeEstimator"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 235
    :cond_0
    const-wide/16 v6, 0x0

    cmp-long v5, p2, v6

    if-gez v5, :cond_1

    .line 236
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "maxChannelMemorySize: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, p2

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 239
    :cond_1
    const-wide/16 v6, 0x0

    cmp-long v5, p4, v6

    if-gez v5, :cond_2

    .line 240
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "maxTotalMemorySize: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, p4

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 247
    :cond_2
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "allowCoreThreadTimeOut"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 248
    .local v4, "m":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    aput-object v7, v5, v6

    move-object/from16 v0, p0

    invoke-virtual {v4, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    .end local v4    # "m":Ljava/lang/reflect/Method;
    :goto_0
    new-instance v5, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    move-object/from16 v0, p9

    move-wide/from16 v1, p2

    invoke-direct {v5, v0, v1, v2}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;J)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    .line 259
    const-wide/16 v6, 0x0

    cmp-long v5, p4, v6

    if-nez v5, :cond_3

    .line 260
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    .line 266
    :goto_1
    sget-object v5, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    invoke-virtual {v5}, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;->increase()V

    .line 267
    return-void

    .line 249
    :catch_0
    move-exception v14

    .line 251
    .local v14, "t":Ljava/lang/Throwable;
    sget-object v5, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v6, "ThreadPoolExecutor.allowCoreThreadTimeOut() is not supported in this platform."

    invoke-interface {v5, v6}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 262
    .end local v14    # "t":Ljava/lang/Throwable;
    :cond_3
    new-instance v5, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    move-wide/from16 v0, p4

    invoke-direct {v5, v0, v1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;-><init>(J)V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    goto :goto_1
.end method

.method private getChannelCounter(Lorg/jboss/netty/channel/Channel;)Ljava/util/concurrent/atomic/AtomicLong;
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 537
    iget-object v2, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->channelCounters:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 538
    .local v0, "counter":Ljava/util/concurrent/atomic/AtomicLong;
    if-nez v0, :cond_0

    .line 539
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .end local v0    # "counter":Ljava/util/concurrent/atomic/AtomicLong;
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 540
    .restart local v0    # "counter":Ljava/util/concurrent/atomic/AtomicLong;
    iget-object v2, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->channelCounters:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 541
    .local v1, "oldCounter":Ljava/util/concurrent/atomic/AtomicLong;
    if-eqz v1, :cond_0

    .line 542
    move-object v0, v1

    .line 547
    .end local v1    # "oldCounter":Ljava/util/concurrent/atomic/AtomicLong;
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v2

    if-nez v2, :cond_1

    .line 548
    iget-object v2, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->channelCounters:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 550
    :cond_1
    return-object v0
.end method


# virtual methods
.method protected beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 449
    invoke-super {p0, p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V

    .line 450
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->decreaseCounter(Ljava/lang/Runnable;)V

    .line 451
    return-void
.end method

.method protected decreaseCounter(Ljava/lang/Runnable;)V
    .locals 13
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    const/4 v12, 0x1

    .line 490
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->shouldCount(Ljava/lang/Runnable;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 534
    :cond_0
    :goto_0
    return-void

    .line 494
    :cond_1
    iget-object v8, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    .line 495
    .local v8, "settings":Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;
    iget-wide v6, v8, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;->maxChannelMemorySize:J

    .line 498
    .local v6, "maxChannelMemorySize":J
    instance-of v9, p1, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    if-eqz v9, :cond_3

    move-object v9, p1

    .line 499
    check-cast v9, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    iget v5, v9, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;->estimatedSize:I

    .line 504
    .local v5, "increment":I
    :goto_1
    iget-object v9, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    if-eqz v9, :cond_2

    .line 505
    iget-object v9, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    int-to-long v10, v5

    invoke-virtual {v9, v10, v11}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;->decrease(J)V

    .line 508
    :cond_2
    instance-of v9, p1, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    if-eqz v9, :cond_0

    move-object v4, p1

    .line 509
    check-cast v4, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    .line 510
    .local v4, "eventTask":Lorg/jboss/netty/handler/execution/ChannelEventRunnable;
    invoke-virtual {v4}, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;->getEvent()Lorg/jboss/netty/channel/ChannelEvent;

    move-result-object v9

    invoke-interface {v9}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 511
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->getChannelCounter(Lorg/jboss/netty/channel/Channel;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v9

    neg-int v10, v5

    int-to-long v10, v10

    invoke-virtual {v9, v10, v11}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v2

    .line 513
    .local v2, "channelCounter":J
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-eqz v9, :cond_0

    cmp-long v9, v2, v6

    if-gez v9, :cond_0

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 514
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v9

    if-nez v9, :cond_0

    .line 516
    invoke-virtual {v4}, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;->getContext()Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v1

    .line 517
    .local v1, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v9

    instance-of v9, v9, Lorg/jboss/netty/handler/execution/ExecutionHandler;

    if-eqz v9, :cond_4

    .line 523
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 525
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 526
    invoke-interface {v0, v12}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .end local v0    # "channel":Lorg/jboss/netty/channel/Channel;
    .end local v1    # "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    .end local v2    # "channelCounter":J
    .end local v4    # "eventTask":Lorg/jboss/netty/handler/execution/ChannelEventRunnable;
    .end local v5    # "increment":I
    :cond_3
    move-object v9, p1

    .line 501
    check-cast v9, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$MemoryAwareRunnable;

    iget v5, v9, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$MemoryAwareRunnable;->estimatedSize:I

    .restart local v5    # "increment":I
    goto :goto_1

    .line 529
    .restart local v0    # "channel":Lorg/jboss/netty/channel/Channel;
    .restart local v1    # "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    .restart local v2    # "channelCounter":J
    .restart local v4    # "eventTask":Lorg/jboss/netty/handler/execution/ChannelEventRunnable;
    :cond_4
    invoke-interface {v0, v12}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0
.end method

.method protected doExecute(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 428
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->doUnorderedExecute(Ljava/lang/Runnable;)V

    .line 429
    return-void
.end method

.method protected final doUnorderedExecute(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 435
    invoke-super {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 436
    return-void
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "command"    # Ljava/lang/Runnable;

    .prologue
    .line 412
    instance-of v1, p1, Lorg/jboss/netty/handler/execution/ChannelDownstreamEventRunnable;

    if-eqz v1, :cond_0

    .line 413
    new-instance v1, Ljava/util/concurrent/RejectedExecutionException;

    const-string v2, "command must be enclosed with an upstream event."

    invoke-direct {v1, v2}, Ljava/util/concurrent/RejectedExecutionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 415
    :cond_0
    instance-of v1, p1, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    if-nez v1, :cond_1

    .line 416
    new-instance v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$MemoryAwareRunnable;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$MemoryAwareRunnable;-><init>(Ljava/lang/Runnable;)V

    .end local p1    # "command":Ljava/lang/Runnable;
    .local v0, "command":Ljava/lang/Runnable;
    move-object p1, v0

    .line 419
    .end local v0    # "command":Ljava/lang/Runnable;
    .restart local p1    # "command":Ljava/lang/Runnable;
    :cond_1
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->increaseCounter(Ljava/lang/Runnable;)V

    .line 420
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->doExecute(Ljava/lang/Runnable;)V

    .line 421
    return-void
.end method

.method public getMaxChannelMemorySize()J
    .locals 2

    .prologue
    .line 355
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    iget-wide v0, v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;->maxChannelMemorySize:J

    return-wide v0
.end method

.method public getMaxTotalMemorySize()J
    .locals 2

    .prologue
    .line 382
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    if-nez v0, :cond_0

    .line 383
    const-wide/16 v0, 0x0

    .line 385
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    iget-wide v0, v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;->limit:J

    goto :goto_0
.end method

.method public getNotifyChannelFuturesOnShutdown()Z
    .locals 1

    .prologue
    .line 407
    iget-boolean v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->notifyOnShutdown:Z

    return v0
.end method

.method public getObjectSizeEstimator()Lorg/jboss/netty/util/ObjectSizeEstimator;
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    iget-object v0, v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;->objectSizeEstimator:Lorg/jboss/netty/util/ObjectSizeEstimator;

    return-object v0
.end method

.method protected increaseCounter(Ljava/lang/Runnable;)V
    .locals 12
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 454
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->shouldCount(Ljava/lang/Runnable;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 487
    .end local p1    # "task":Ljava/lang/Runnable;
    :cond_0
    :goto_0
    return-void

    .line 458
    .restart local p1    # "task":Ljava/lang/Runnable;
    :cond_1
    iget-object v8, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    .line 459
    .local v8, "settings":Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;
    iget-wide v6, v8, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;->maxChannelMemorySize:J

    .line 461
    .local v6, "maxChannelMemorySize":J
    iget-object v9, v8, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;->objectSizeEstimator:Lorg/jboss/netty/util/ObjectSizeEstimator;

    invoke-interface {v9, p1}, Lorg/jboss/netty/util/ObjectSizeEstimator;->estimateSize(Ljava/lang/Object;)I

    move-result v5

    .line 463
    .local v5, "increment":I
    instance-of v9, p1, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    if-eqz v9, :cond_4

    move-object v4, p1

    .line 464
    check-cast v4, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    .line 465
    .local v4, "eventTask":Lorg/jboss/netty/handler/execution/ChannelEventRunnable;
    iput v5, v4, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;->estimatedSize:I

    .line 466
    invoke-virtual {v4}, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;->getEvent()Lorg/jboss/netty/channel/ChannelEvent;

    move-result-object v9

    invoke-interface {v9}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 467
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->getChannelCounter(Lorg/jboss/netty/channel/Channel;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v9

    int-to-long v10, v5

    invoke-virtual {v9, v10, v11}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v2

    .line 469
    .local v2, "channelCounter":J
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-eqz v9, :cond_3

    cmp-long v9, v2, v6

    if-ltz v9, :cond_3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 470
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 472
    invoke-virtual {v4}, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;->getContext()Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v1

    .line 473
    .local v1, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v9

    instance-of v9, v9, Lorg/jboss/netty/handler/execution/ExecutionHandler;

    if-eqz v9, :cond_2

    .line 475
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, v9}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 477
    :cond_2
    const/4 v9, 0x0

    invoke-interface {v0, v9}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    .line 484
    .end local v0    # "channel":Lorg/jboss/netty/channel/Channel;
    .end local v1    # "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    .end local v2    # "channelCounter":J
    .end local v4    # "eventTask":Lorg/jboss/netty/handler/execution/ChannelEventRunnable;
    .end local p1    # "task":Ljava/lang/Runnable;
    :cond_3
    :goto_1
    iget-object v9, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    if-eqz v9, :cond_0

    .line 485
    iget-object v9, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->totalLimiter:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;

    int-to-long v10, v5

    invoke-virtual {v9, v10, v11}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Limiter;->increase(J)V

    goto :goto_0

    .line 481
    .restart local p1    # "task":Ljava/lang/Runnable;
    :cond_4
    check-cast p1, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$MemoryAwareRunnable;

    .end local p1    # "task":Ljava/lang/Runnable;
    iput v5, p1, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$MemoryAwareRunnable;->estimatedSize:I

    goto :goto_1
.end method

.method public remove(Ljava/lang/Runnable;)Z
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 440
    invoke-super {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->remove(Ljava/lang/Runnable;)Z

    move-result v0

    .line 441
    .local v0, "removed":Z
    if-eqz v0, :cond_0

    .line 442
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->decreaseCounter(Ljava/lang/Runnable;)V

    .line 444
    :cond_0
    return v0
.end method

.method public setMaxChannelMemorySize(J)V
    .locals 5
    .param p1, "maxChannelMemorySize"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 363
    cmp-long v0, p1, v2

    if-gez v0, :cond_0

    .line 364
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxChannelMemorySize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 368
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->getTaskCount()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 369
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can\'t be changed after a task is executed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 373
    :cond_1
    new-instance v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    iget-object v1, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    iget-object v1, v1, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;->objectSizeEstimator:Lorg/jboss/netty/util/ObjectSizeEstimator;

    invoke-direct {v0, v1, p1, p2}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;J)V

    iput-object v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    .line 376
    return-void
.end method

.method public setNotifyChannelFuturesOnShutdown(Z)V
    .locals 0
    .param p1, "notifyOnShutdown"    # Z

    .prologue
    .line 399
    iput-boolean p1, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->notifyOnShutdown:Z

    .line 400
    return-void
.end method

.method public setObjectSizeEstimator(Lorg/jboss/netty/util/ObjectSizeEstimator;)V
    .locals 4
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;

    .prologue
    .line 342
    if-nez p1, :cond_0

    .line 343
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "objectSizeEstimator"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    iget-object v1, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    iget-wide v2, v1, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;->maxChannelMemorySize:J

    invoke-direct {v0, p1, v2, v3}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;J)V

    iput-object v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->settings:Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor$Settings;

    .line 349
    return-void
.end method

.method protected shouldCount(Ljava/lang/Runnable;)Z
    .locals 5
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    const/4 v2, 0x0

    .line 560
    instance-of v3, p1, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;

    if-eqz v3, :cond_2

    move-object v1, p1

    .line 561
    check-cast v1, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;

    .line 562
    .local v1, "r":Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;
    invoke-virtual {v1}, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;->getEvent()Lorg/jboss/netty/channel/ChannelEvent;

    move-result-object v0

    .line 563
    .local v0, "e":Lorg/jboss/netty/channel/ChannelEvent;
    instance-of v3, v0, Lorg/jboss/netty/channel/WriteCompletionEvent;

    if-eqz v3, :cond_1

    .line 571
    .end local v0    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    .end local v1    # "r":Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;
    :cond_0
    :goto_0
    return v2

    .line 565
    .restart local v0    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    .restart local v1    # "r":Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;
    :cond_1
    instance-of v3, v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v3, :cond_2

    .line 566
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .end local v0    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v3

    sget-object v4, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    if-eq v3, v4, :cond_0

    .line 571
    .end local v1    # "r":Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public shutdownNow()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 280
    iget-boolean v0, p0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->notifyOnShutdown:Z

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->shutdownNow(Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public shutdownNow(Z)Ljava/util/List;
    .locals 8
    .param p1, "notify"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 296
    if-nez p1, :cond_1

    .line 297
    invoke-super {p0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    move-result-object v6

    .line 328
    :cond_0
    return-object v6

    .line 299
    :cond_1
    const/4 v0, 0x0

    .line 300
    .local v0, "cause":Ljava/lang/Throwable;
    const/4 v2, 0x0

    .line 302
    .local v2, "channels":Ljava/util/Set;, "Ljava/util/Set<Lorg/jboss/netty/channel/Channel;>;"
    invoke-super {p0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    move-result-object v6

    .line 305
    .local v6, "tasks":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Runnable;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Runnable;

    .line 306
    .local v5, "task":Ljava/lang/Runnable;
    instance-of v7, v5, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    if-eqz v7, :cond_2

    .line 307
    if-nez v0, :cond_3

    .line 308
    new-instance v0, Ljava/io/IOException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    const-string v7, "Unable to process queued event"

    invoke-direct {v0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 310
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_3
    check-cast v5, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;

    .end local v5    # "task":Ljava/lang/Runnable;
    invoke-virtual {v5}, Lorg/jboss/netty/handler/execution/ChannelEventRunnable;->getEvent()Lorg/jboss/netty/channel/ChannelEvent;

    move-result-object v3

    .line 311
    .local v3, "event":Lorg/jboss/netty/channel/ChannelEvent;
    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v7

    invoke-interface {v7, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 313
    if-nez v2, :cond_4

    .line 314
    new-instance v2, Ljava/util/HashSet;

    .end local v2    # "channels":Ljava/util/Set;, "Ljava/util/Set<Lorg/jboss/netty/channel/Channel;>;"
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 318
    .restart local v2    # "channels":Ljava/util/Set;, "Ljava/util/Set<Lorg/jboss/netty/channel/Channel;>;"
    :cond_4
    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 323
    .end local v3    # "event":Lorg/jboss/netty/channel/ChannelEvent;
    :cond_5
    if-eqz v2, :cond_0

    .line 324
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/Channel;

    .line 325
    .local v1, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_1
.end method

.method protected terminated()V
    .locals 1

    .prologue
    .line 271
    invoke-super {p0}, Ljava/util/concurrent/ThreadPoolExecutor;->terminated()V

    .line 272
    sget-object v0, Lorg/jboss/netty/handler/execution/MemoryAwareThreadPoolExecutor;->misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;->decrease()V

    .line 273
    return-void
.end method
