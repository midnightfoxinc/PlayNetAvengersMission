.class public abstract Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;
.super Ljava/lang/Object;
.source "TimeoutTimerTask.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field protected final done:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected volatile nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;"
        }
    .end annotation
.end field

.field protected final remoteAddress:Ljava/lang/String;

.field protected final requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

.field protected final timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;)V
    .locals 2
    .param p2, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;
    .param p3, "timeoutsHolder"    # Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/providers/netty/request/NettyRequestSender;",
            "Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p1, "nettyResponseFuture":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v1, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 37
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 38
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .line 39
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    .line 41
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getChannelRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v0

    .line 42
    .local v0, "sa":Ljava/net/SocketAddress;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->remoteAddress:Ljava/lang/String;

    .line 43
    return-void

    .line 42
    :cond_0
    const-string v1, "not-connected"

    goto :goto_0
.end method


# virtual methods
.method public clean()V
    .locals 3

    .prologue
    .line 55
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 57
    :cond_0
    return-void
.end method

.method protected expire(Ljava/lang/String;J)V
    .locals 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "time"    # J

    .prologue
    .line 46
    sget-object v0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "{} for {} after {} ms"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 47
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutTimerTask;->nettyResponseFuture:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    new-instance v3, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v3, p1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    .line 48
    return-void
.end method
