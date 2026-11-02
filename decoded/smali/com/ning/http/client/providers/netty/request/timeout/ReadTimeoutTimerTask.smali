.class public Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;
.super Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;
.source "ReadTimeoutTimerTask.java"


# instance fields
.field private final readTimeout:J

.field private final requestTimeoutInstant:J


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;JJ)V
    .locals 2
    .param p2, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;
    .param p3, "timeoutsHolder"    # Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;
    .param p4, "requestTimeout"    # J
    .param p6, "readTimeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/providers/netty/request/NettyRequestSender;",
            "Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;",
            "JJ)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p1, "nettyResponseFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;-><init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;)V

    .line 34
    iput-wide p6, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->readTimeout:J

    .line 35
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-ltz v0, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getStart()J

    move-result-wide v0

    add-long/2addr v0, p4

    :goto_0
    iput-wide v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->requestTimeoutInstant:J

    .line 36
    return-void

    .line 35
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    goto :goto_0
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 14
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v7

    if-nez v7, :cond_0

    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v7}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->isClosed()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 43
    :cond_1
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v7}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 44
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    invoke-virtual {v7}, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->cancel()V

    goto :goto_0

    .line 48
    :cond_2
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v8

    .line 50
    .local v8, "now":J
    iget-wide v10, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->readTimeout:J

    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v7}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getLastTouch()J

    move-result-wide v12

    add-long v0, v10, v12

    .line 51
    .local v0, "currentReadTimeoutInstant":J
    sub-long v2, v0, v8

    .line 53
    .local v2, "durationBeforeCurrentReadTimeout":J
    const-wide/16 v10, 0x0

    cmp-long v7, v2, v10

    if-gtz v7, :cond_3

    .line 55
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Read timeout to "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v10, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->remoteAddress:Ljava/lang/String;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " of "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v10, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->readTimeout:J

    invoke-virtual {v7, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " ms"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 56
    .local v6, "message":Ljava/lang/String;
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v7}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getLastTouch()J

    move-result-wide v10

    sub-long v4, v8, v10

    .line 57
    .local v4, "durationSinceLastTouch":J
    invoke-virtual {p0, v6, v4, v5}, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->expire(Ljava/lang/String;J)V

    .line 59
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    invoke-virtual {v7}, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->cancel()V

    goto :goto_0

    .line 61
    .end local v4    # "durationSinceLastTouch":J
    .end local v6    # "message":Ljava/lang/String;
    :cond_3
    iget-wide v10, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->requestTimeoutInstant:J

    cmp-long v7, v0, v10

    if-gez v7, :cond_4

    .line 63
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 64
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    iget-object v10, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v10, p0, v2, v3}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->newTimeout(Lorg/jboss/netty/util/TimerTask;J)Lorg/jboss/netty/util/Timeout;

    move-result-object v10

    iput-object v10, v7, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->readTimeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0

    .line 68
    :cond_4
    iget-object v7, p0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    const/4 v10, 0x0

    iput-object v10, v7, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->readTimeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0
.end method
