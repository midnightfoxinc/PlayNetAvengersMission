.class final Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;
.super Ljava/lang/Object;
.source "TrafficCounter.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/TrafficCounter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TrafficMonitoringTask"
.end annotation


# instance fields
.field private final counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

.field private final trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;


# direct methods
.method protected constructor <init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/handler/traffic/TrafficCounter;)V
    .locals 0
    .param p1, "trafficShapingHandler"    # Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
    .param p2, "counter"    # Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .prologue
    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    .line 183
    iput-object p2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .line 184
    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 4
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-boolean v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->monitorActive:Z

    if-nez v0, :cond_0

    .line 196
    :goto_0
    return-void

    .line 190
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    .line 191
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    if-eqz v0, :cond_1

    .line 192
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->trafficShapingHandler1:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->doAccounting(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    .line 195
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;->counter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-object v1, v1, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p0, v2, v3, v1}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    goto :goto_0
.end method
