.class Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;
.super Ljava/lang/Object;
.source "GrizzlyConnectionPool.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DelayedRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V
    .locals 0

    .prologue
    .line 332
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$1;

    .prologue
    .line 332
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 337
    :goto_0
    iget-object v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v8}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$100(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 338
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v0

    .line 340
    .local v0, "currentTimeMs":J
    iget-object v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v8}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/concurrent/BlockingQueue;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;

    .line 341
    .local v2, "delayQueue":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    iget-object v8, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v8}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 343
    iget-object v6, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->resolver:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;

    .line 345
    .local v6, "resolver":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;
    iget-object v8, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v8}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/glassfish/grizzly/Connection;>;"
    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 346
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/glassfish/grizzly/Connection;

    .line 347
    .local v3, "element":Lorg/glassfish/grizzly/Connection;
    invoke-virtual {v6, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->getTimeoutMs(Lorg/glassfish/grizzly/Connection;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 349
    .local v7, "timeoutMs":Ljava/lang/Long;
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const-wide/16 v10, -0x1

    cmp-long v8, v8, v10

    if-nez v8, :cond_2

    .line 350
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    .line 351
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {v6, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->getTimeoutMs(Lorg/glassfish/grizzly/Connection;)J

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$900(JJ)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 353
    iget-object v8, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v8, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_1

    .line 355
    :cond_2
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sub-long v8, v0, v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-ltz v8, :cond_1

    .line 356
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    .line 357
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {v6, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;->getTimeoutMs(Lorg/glassfish/grizzly/Connection;)J

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$900(JJ)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 359
    iget-object v8, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v8, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_1

    .line 362
    :cond_3
    :try_start_0
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->access$000()Lorg/slf4j/Logger;

    move-result-object v8

    invoke-interface {v8}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 363
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool;->access$000()Lorg/slf4j/Logger;

    move-result-object v8

    const-string v9, "Idle connection ({}) detected.  Removing from cache."

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 365
    :cond_4
    iget-object v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v8}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$1000(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 366
    invoke-interface {v3}, Lorg/glassfish/grizzly/Connection;->close()Lorg/glassfish/grizzly/GrizzlyFuture;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 367
    :catch_0
    move-exception v8

    goto :goto_1

    .line 374
    .end local v2    # "delayQueue":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$IdleConnectionQueue;
    .end local v3    # "element":Lorg/glassfish/grizzly/Connection;
    .end local v5    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/glassfish/grizzly/Connection;>;"
    .end local v6    # "resolver":Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$TimeoutResolver;
    .end local v7    # "timeoutMs":Ljava/lang/Long;
    :cond_5
    iget-object v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v8}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$1100(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/lang/Object;

    move-result-object v9

    monitor-enter v9

    .line 375
    :try_start_1
    iget-object v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v8}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$100(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Z

    move-result v8

    if-nez v8, :cond_7

    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 383
    .end local v0    # "currentTimeMs":J
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_6
    return-void

    .line 378
    .restart local v0    # "currentTimeMs":J
    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_7
    :try_start_2
    iget-object v8, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v8}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$1100(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)Ljava/lang/Object;

    move-result-object v8

    iget-object v10, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor$DelayedRunnable;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;

    invoke-static {v10}, Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;->access$1200(Lcom/ning/http/client/providers/grizzly/GrizzlyConnectionPool$DelayedExecutor;)J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 381
    :goto_2
    :try_start_3
    monitor-exit v9

    goto/16 :goto_0

    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v8

    .line 379
    :catch_1
    move-exception v8

    goto :goto_2
.end method
