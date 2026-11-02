.class public Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;
.super Lorg/jboss/netty/handler/traffic/TrafficCounter;
.source "GlobalChannelTrafficCounter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;
    }
.end annotation


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/util/Timer;Ljava/lang/String;J)V
    .locals 2
    .param p1, "trafficShapingHandler"    # Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "checkInterval"    # J

    .prologue
    .line 40
    invoke-direct/range {p0 .. p5}, Lorg/jboss/netty/handler/traffic/TrafficCounter;-><init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/util/Timer;Ljava/lang/String;J)V

    .line 41
    if-nez p2, :cond_0

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Timer must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    return-void
.end method


# virtual methods
.method public resetCumulativeTime()V
    .locals 3

    .prologue
    .line 123
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    check-cast v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    iget-object v2, v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 124
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    iget-object v2, v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v2}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetCumulativeTime()V

    goto :goto_0

    .line 126
    .end local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    :cond_0
    invoke-super {p0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetCumulativeTime()V

    .line 127
    return-void
.end method

.method public declared-synchronized start()V
    .locals 7

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->monitorActive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    .line 103
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 94
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->milliSecondFromNano()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 95
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 96
    .local v0, "localCheckInterval":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 97
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->monitorActive:Z

    .line 98
    new-instance v3, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;

    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    check-cast v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    invoke-direct {v3, v2, p0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;-><init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    iput-object v3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->timerTask:Lorg/jboss/netty/util/TimerTask;

    .line 101
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->timerTask:Lorg/jboss/netty/util/TimerTask;

    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v3, v4, v5, v6}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v2

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->timeout:Lorg/jboss/netty/util/Timeout;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 91
    .end local v0    # "localCheckInterval":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized stop()V
    .locals 2

    .prologue
    .line 109
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->monitorActive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    .line 118
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 112
    :cond_1
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->monitorActive:Z

    .line 113
    invoke-static {}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->milliSecondFromNano()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->resetAccounting(J)V

    .line 114
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    invoke-virtual {v0, p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->doAccounting(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    .line 115
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->timeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;->timeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 109
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
