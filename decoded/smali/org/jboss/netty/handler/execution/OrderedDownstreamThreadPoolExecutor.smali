.class public final Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;
.super Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;
.source "OrderedDownstreamThreadPoolExecutor.java"


# direct methods
.method public constructor <init>(I)V
    .locals 6
    .param p1, "corePoolSize"    # I

    .prologue
    const-wide/16 v2, 0x0

    .line 47
    move-object v0, p0

    move v1, p1

    move-wide v4, v2

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;-><init>(IJJ)V

    .line 48
    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;)V
    .locals 10
    .param p1, "corePoolSize"    # I
    .param p2, "keepAliveTime"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v2, 0x0

    .line 59
    move-object v0, p0

    move v1, p1

    move-wide v4, v2

    move-wide v6, p2

    move-object v8, p4

    invoke-direct/range {v0 .. v8}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;-><init>(IJJJLjava/util/concurrent/TimeUnit;)V

    .line 60
    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ThreadFactory;)V
    .locals 10
    .param p1, "corePoolSize"    # I
    .param p2, "keepAliveTime"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    const-wide/16 v2, 0x0

    .line 72
    move-object v0, p0

    move v1, p1

    move-wide v4, v2

    move-wide v6, p2

    move-object v8, p4

    move-object v9, p5

    invoke-direct/range {v0 .. v9}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;-><init>(IJJJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ThreadFactory;)V

    .line 74
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "command"    # Ljava/lang/Runnable;

    .prologue
    .line 130
    instance-of v0, p1, Lorg/jboss/netty/handler/execution/ChannelUpstreamEventRunnable;

    if-eqz v0, :cond_0

    .line 131
    new-instance v0, Ljava/util/concurrent/RejectedExecutionException;

    const-string v1, "command must be enclosed with an downstream event."

    invoke-direct {v0, v1}, Ljava/util/concurrent/RejectedExecutionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_0
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;->doExecute(Ljava/lang/Runnable;)V

    .line 134
    return-void
.end method

.method protected getChildExecutor(Lorg/jboss/netty/channel/ChannelEvent;)Ljava/util/concurrent/Executor;
    .locals 5
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 138
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;->getChildExecutorKey(Lorg/jboss/netty/channel/ChannelEvent;)Ljava/lang/Object;

    move-result-object v1

    .line 139
    .local v1, "key":Ljava/lang/Object;
    iget-object v3, p0, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;->childExecutors:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    .line 140
    .local v0, "executor":Ljava/util/concurrent/Executor;
    if-nez v0, :cond_0

    .line 141
    new-instance v0, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;

    .end local v0    # "executor":Ljava/util/concurrent/Executor;
    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor$ChildExecutor;-><init>(Lorg/jboss/netty/handler/execution/OrderedMemoryAwareThreadPoolExecutor;)V

    .line 142
    .restart local v0    # "executor":Ljava/util/concurrent/Executor;
    iget-object v3, p0, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;->childExecutors:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v1, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    .line 143
    .local v2, "oldExecutor":Ljava/util/concurrent/Executor;
    if-eqz v2, :cond_1

    .line 144
    move-object v0, v2

    .line 156
    .end local v2    # "oldExecutor":Ljava/util/concurrent/Executor;
    :cond_0
    :goto_0
    return-object v0

    .line 147
    .restart local v2    # "oldExecutor":Ljava/util/concurrent/Executor;
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    new-instance v4, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor$1;

    invoke-direct {v4, p0, v1}, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor$1;-><init>(Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;Ljava/lang/Object;)V

    invoke-interface {v3, v4}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0
.end method

.method public getMaxChannelMemorySize()J
    .locals 2

    .prologue
    .line 98
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getMaxTotalMemorySize()J
    .locals 2

    .prologue
    .line 115
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getObjectSizeEstimator()Lorg/jboss/netty/util/ObjectSizeEstimator;
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method public setMaxChannelMemorySize(J)V
    .locals 2
    .param p1, "maxChannelMemorySize"    # J

    .prologue
    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported by this implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setObjectSizeEstimator(Lorg/jboss/netty/util/ObjectSizeEstimator;)V
    .locals 2
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;

    .prologue
    .line 90
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported by this implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected shouldCount(Ljava/lang/Runnable;)Z
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 123
    const/4 v0, 0x0

    return v0
.end method
