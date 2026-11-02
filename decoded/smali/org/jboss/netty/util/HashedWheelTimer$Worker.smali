.class final Lorg/jboss/netty/util/HashedWheelTimer$Worker;
.super Ljava/lang/Object;
.source "HashedWheelTimer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/HashedWheelTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Worker"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/util/HashedWheelTimer;

.field private tick:J

.field private final unprocessedTimeouts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jboss/netty/util/Timeout;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lorg/jboss/netty/util/HashedWheelTimer;)V
    .locals 1

    .prologue
    .line 347
    iput-object p1, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 348
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->unprocessedTimeouts:Ljava/util/Set;

    return-void
.end method

.method synthetic constructor <init>(Lorg/jboss/netty/util/HashedWheelTimer;Lorg/jboss/netty/util/HashedWheelTimer$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;
    .param p2, "x1"    # Lorg/jboss/netty/util/HashedWheelTimer$1;

    .prologue
    .line 347
    invoke-direct {p0, p1}, Lorg/jboss/netty/util/HashedWheelTimer$Worker;-><init>(Lorg/jboss/netty/util/HashedWheelTimer;)V

    return-void
.end method

.method private transferTimeoutsToBuckets()V
    .locals 14

    .prologue
    .line 390
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const v10, 0x186a0

    if-ge v1, v10, :cond_0

    .line 391
    iget-object v10, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v10}, Lorg/jboss/netty/util/HashedWheelTimer;->access$700(Lorg/jboss/netty/util/HashedWheelTimer;)Ljava/util/Queue;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 392
    .local v7, "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    if-nez v7, :cond_1

    .line 413
    .end local v7    # "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :cond_0
    return-void

    .line 396
    .restart local v7    # "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :cond_1
    invoke-virtual {v7}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->state()I

    move-result v10

    const/4 v11, 0x2

    if-eq v10, v11, :cond_2

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-virtual {v7, v10, v11}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->compareAndSetState(II)Z

    move-result v10

    if-nez v10, :cond_3

    .line 400
    :cond_2
    invoke-virtual {v7}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->remove()V

    .line 390
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 403
    :cond_3
    invoke-static {v7}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->access$800(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)J

    move-result-wide v10

    iget-object v12, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v12}, Lorg/jboss/netty/util/HashedWheelTimer;->access$900(Lorg/jboss/netty/util/HashedWheelTimer;)J

    move-result-wide v12

    div-long v2, v10, v12

    .line 404
    .local v2, "calculated":J
    iget-wide v10, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->tick:J

    sub-long v10, v2, v10

    iget-object v12, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v12}, Lorg/jboss/netty/util/HashedWheelTimer;->access$400(Lorg/jboss/netty/util/HashedWheelTimer;)[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    move-result-object v12

    array-length v12, v12

    int-to-long v12, v12

    div-long v4, v10, v12

    .line 405
    .local v4, "remainingRounds":J
    iput-wide v4, v7, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->remainingRounds:J

    .line 407
    iget-wide v10, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->tick:J

    invoke-static {v2, v3, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    .line 408
    .local v8, "ticks":J
    iget-object v10, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v10}, Lorg/jboss/netty/util/HashedWheelTimer;->access$500(Lorg/jboss/netty/util/HashedWheelTimer;)I

    move-result v10

    int-to-long v10, v10

    and-long/2addr v10, v8

    long-to-int v6, v10

    .line 410
    .local v6, "stopIndex":I
    iget-object v10, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v10}, Lorg/jboss/netty/util/HashedWheelTimer;->access$400(Lorg/jboss/netty/util/HashedWheelTimer;)[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    move-result-object v10

    aget-object v0, v10, v6

    .line 411
    .local v0, "bucket":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    invoke-virtual {v0, v7}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->addTimeout(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)V

    goto :goto_1
.end method

.method private waitForNextTick()J
    .locals 14

    .prologue
    .line 421
    iget-object v5, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v5}, Lorg/jboss/netty/util/HashedWheelTimer;->access$900(Lorg/jboss/netty/util/HashedWheelTimer;)J

    move-result-wide v8

    iget-wide v10, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->tick:J

    const-wide/16 v12, 0x1

    add-long/2addr v10, v12

    mul-long v2, v8, v10

    .line 424
    .local v2, "deadline":J
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    iget-object v5, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v5}, Lorg/jboss/netty/util/HashedWheelTimer;->access$200(Lorg/jboss/netty/util/HashedWheelTimer;)J

    move-result-wide v10

    sub-long v0, v8, v10

    .line 425
    .local v0, "currentTime":J
    sub-long v8, v2, v0

    const-wide/32 v10, 0xf423f

    add-long/2addr v8, v10

    const-wide/32 v10, 0xf4240

    div-long v6, v8, v10

    .line 427
    .local v6, "sleepTimeMs":J
    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-gtz v5, :cond_2

    .line 428
    const-wide/high16 v8, -0x8000000000000000L

    cmp-long v5, v0, v8

    if-nez v5, :cond_1

    .line 429
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 448
    .end local v0    # "currentTime":J
    :cond_1
    :goto_1
    return-wide v0

    .line 440
    .restart local v0    # "currentTime":J
    :cond_2
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->isWindows()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 441
    const-wide/16 v8, 0xa

    div-long v8, v6, v8

    const-wide/16 v10, 0xa

    mul-long v6, v8, v10

    .line 445
    :cond_3
    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 446
    :catch_0
    move-exception v4

    .line 447
    .local v4, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Lorg/jboss/netty/util/HashedWheelTimer;->access$600()Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v5

    iget-object v8, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-virtual {v5, v8}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v5

    const/4 v8, 0x2

    if-ne v5, v8, :cond_0

    .line 448
    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 354
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    invoke-static {v7, v8, v9}, Lorg/jboss/netty/util/HashedWheelTimer;->access$202(Lorg/jboss/netty/util/HashedWheelTimer;J)J

    .line 355
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v7}, Lorg/jboss/netty/util/HashedWheelTimer;->access$200(Lorg/jboss/netty/util/HashedWheelTimer;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-nez v7, :cond_0

    .line 357
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    const-wide/16 v8, 0x1

    invoke-static {v7, v8, v9}, Lorg/jboss/netty/util/HashedWheelTimer;->access$202(Lorg/jboss/netty/util/HashedWheelTimer;J)J

    .line 361
    :cond_0
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v7}, Lorg/jboss/netty/util/HashedWheelTimer;->access$300(Lorg/jboss/netty/util/HashedWheelTimer;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 364
    :cond_1
    invoke-direct {p0}, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->waitForNextTick()J

    move-result-wide v2

    .line 365
    .local v2, "deadline":J
    const-wide/16 v8, 0x0

    cmp-long v7, v2, v8

    if-lez v7, :cond_2

    .line 366
    invoke-direct {p0}, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->transferTimeoutsToBuckets()V

    .line 367
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v7}, Lorg/jboss/netty/util/HashedWheelTimer;->access$400(Lorg/jboss/netty/util/HashedWheelTimer;)[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    move-result-object v7

    iget-wide v8, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->tick:J

    iget-object v10, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v10}, Lorg/jboss/netty/util/HashedWheelTimer;->access$500(Lorg/jboss/netty/util/HashedWheelTimer;)I

    move-result v10

    int-to-long v10, v10

    and-long/2addr v8, v10

    long-to-int v8, v8

    aget-object v1, v7, v8

    .line 369
    .local v1, "bucket":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->expireTimeouts(J)V

    .line 370
    iget-wide v8, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->tick:J

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->tick:J

    .line 372
    .end local v1    # "bucket":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    :cond_2
    invoke-static {}, Lorg/jboss/netty/util/HashedWheelTimer;->access$600()Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v7

    iget-object v8, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-virtual {v7, v8}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v7

    const/4 v8, 0x1

    if-eq v7, v8, :cond_1

    .line 375
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v7}, Lorg/jboss/netty/util/HashedWheelTimer;->access$400(Lorg/jboss/netty/util/HashedWheelTimer;)[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    move-result-object v0

    .local v0, "arr$":[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_4

    aget-object v1, v0, v4

    .line 376
    .restart local v1    # "bucket":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->unprocessedTimeouts:Ljava/util/Set;

    invoke-virtual {v1, v7}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->clearTimeouts(Ljava/util/Set;)V

    .line 375
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 383
    .end local v1    # "bucket":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    .local v6, "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :cond_3
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->unprocessedTimeouts:Ljava/util/Set;

    invoke-interface {v7, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 379
    .end local v6    # "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :cond_4
    iget-object v7, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->this$0:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v7}, Lorg/jboss/netty/util/HashedWheelTimer;->access$700(Lorg/jboss/netty/util/HashedWheelTimer;)Ljava/util/Queue;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 380
    .restart local v6    # "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    if-nez v6, :cond_3

    .line 385
    return-void
.end method

.method public unprocessedTimeouts()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/jboss/netty/util/Timeout;",
            ">;"
        }
    .end annotation

    .prologue
    .line 455
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->unprocessedTimeouts:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
