.class public Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;
.super Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;
.source "RequestTimeoutTimerTask.java"


# instance fields
.field private final requestTimeout:J


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;J)V
    .locals 0
    .param p2, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;
    .param p3, "timeoutsHolder"    # Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;
    .param p4, "requestTimeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/providers/netty/request/NettyRequestSender;",
            "Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "nettyResponseFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;-><init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;)V

    .line 32
    iput-wide p4, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->requestTimeout:J

    .line 33
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
    .line 37
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 49
    :cond_0
    :goto_0
    return-void

    .line 41
    :cond_1
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->cancel()V

    .line 43
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v3

    if-nez v3, :cond_0

    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Request timed out to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->remoteAddress:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->requestTimeout:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 47
    .local v2, "message":Ljava/lang/String;
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v4

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getStart()J

    move-result-wide v6

    sub-long v0, v4, v6

    .line 48
    .local v0, "age":J
    invoke-virtual {p0, v2, v0, v1}, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->expire(Ljava/lang/String;J)V

    goto :goto_0
.end method
