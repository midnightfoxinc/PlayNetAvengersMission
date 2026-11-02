.class final Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;
.super Ljava/lang/Object;
.source "GlobalChannelTrafficCounter.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MixedTrafficMonitoringTask"
.end annotation


# instance fields
.field private final counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

.field private final trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/handler/traffic/TrafficCounter;)V
    .locals 0
    .param p1, "trafficShapingHandler"    # Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;
    .param p2, "counter"    # Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    .line 69
    iput-object p2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .line 70
    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 8
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-boolean v4, v4, Lorg/jboss/netty/handler/traffic/TrafficCounter;->monitorActive:Z

    if-nez v4, :cond_0

    .line 84
    :goto_0
    return-void

    .line 77
    :cond_0
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    .line 78
    .local v2, "newLastTime":J
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    .line 79
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    iget-object v4, v4, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 80
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    iget-object v4, v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    goto :goto_1

    .line 82
    .end local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    :cond_1
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    iget-object v5, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v5}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->doAccounting(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    .line 83
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-object v4, v4, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v5, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter$MixedTrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-object v5, v5, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, p0, v6, v7, v5}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    goto :goto_0
.end method
