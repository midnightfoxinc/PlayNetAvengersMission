.class public Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;
.super Ljava/lang/Object;
.source "TimeoutsHolder.java"


# instance fields
.field private final cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public volatile readTimeout:Lorg/jboss/netty/util/Timeout;

.field public volatile requestTimeout:Lorg/jboss/netty/util/Timeout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 26
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 27
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->requestTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v0, :cond_0

    .line 28
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->requestTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 29
    const-class v0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->requestTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v1}, Lorg/jboss/netty/util/Timeout;->getTask()Lorg/jboss/netty/util/TimerTask;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/request/timeout/RequestTimeoutTimerTask;->clean()V

    .line 30
    iput-object v3, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->requestTimeout:Lorg/jboss/netty/util/Timeout;

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->readTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v0, :cond_1

    .line 33
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->readTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 34
    const-class v0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->readTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v1}, Lorg/jboss/netty/util/Timeout;->getTask()Lorg/jboss/netty/util/TimerTask;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/request/timeout/ReadTimeoutTimerTask;->clean()V

    .line 35
    iput-object v3, p0, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->readTimeout:Lorg/jboss/netty/util/Timeout;

    .line 38
    :cond_1
    return-void
.end method
