.class final Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "IdleConnectionQueue"
.end annotation


# instance fields
.field final count:Ljava/util/concurrent/atomic/AtomicInteger;

.field final maxConnectionLifeTime:J

.field final queue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;"
        }
    .end annotation
.end field

.field final resolver:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;

.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

.field final timeout:J


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;JJ)V
    .locals 2
    .param p2, "timeout"    # J
    .param p4, "maxConnectionLifeTime"    # J

    .prologue
    .line 401
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 393
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;

    invoke-direct {v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->resolver:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;

    .line 395
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 402
    iput-wide p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    .line 403
    iput-wide p4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->maxConnectionLifeTime:J

    .line 404
    return-void
.end method


# virtual methods
.method destroy()V
    .locals 3

    .prologue
    .line 457
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/glassfish/grizzly/Connection;

    .line 458
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    invoke-interface {v0}, Lorg/glassfish/grizzly/Connection;->close()Lorg/glassfish/grizzly/GrizzlyFuture;

    goto :goto_0

    .line 460
    .end local v0    # "c":Lorg/glassfish/grizzly/Connection;
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 461
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/concurrent/BlockingQueue;->remove(Ljava/lang/Object;)Z

    .line 462
    return-void
.end method

.method isEmpty()Z
    .locals 1

    .prologue
    .line 453
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method offer(Lorg/glassfish/grizzly/Connection;)V
    .locals 10
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    const-wide/16 v8, 0x0

    .line 411
    const-wide/16 v4, -0x1

    .line 412
    .local v4, "timeoutMs":J
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v0

    .line 413
    .local v0, "currentTime":J
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->maxConnectionLifeTime:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_1

    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_1

    .line 414
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    add-long v4, v0, v6

    .line 429
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->resolver:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;

    invoke-virtual {v6, p1, v4, v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->setTimeoutMs(Lorg/glassfish/grizzly/Connection;J)V

    .line 430
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v6, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 431
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 432
    return-void

    .line 415
    :cond_1
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->maxConnectionLifeTime:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    .line 416
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->resolver:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;

    invoke-virtual {v6, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->getTimeoutMs(Lorg/glassfish/grizzly/Connection;)J

    move-result-wide v2

    .line 417
    .local v2, "t":J
    const-wide/16 v6, -0x1

    cmp-long v6, v2, v6

    if-nez v6, :cond_3

    .line 418
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_2

    .line 419
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->maxConnectionLifeTime:J

    iget-wide v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    add-long v4, v0, v6

    goto :goto_0

    .line 421
    :cond_2
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->maxConnectionLifeTime:J

    add-long v4, v0, v6

    goto :goto_0

    .line 424
    :cond_3
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    .line 425
    iget-wide v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    add-long/2addr v6, v0

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    goto :goto_0
.end method

.method poll()Lorg/glassfish/grizzly/Connection;
    .locals 1

    .prologue
    .line 435
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 436
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/glassfish/grizzly/Connection;

    return-object v0
.end method

.method remove(Lorg/glassfish/grizzly/Connection;)Z
    .locals 4
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 440
    iget-wide v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->timeout:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 441
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->resolver:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->removeTimeout(Lorg/glassfish/grizzly/Connection;)Z

    .line 444
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 445
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method size()I
    .locals 1

    .prologue
    .line 449
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->count:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method
