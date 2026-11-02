.class final Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
.super Ljava/lang/Object;
.source "HashedWheelTimer.java"

# interfaces
.implements Lorg/jboss/netty/util/Timeout;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/HashedWheelTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HashedWheelTimeout"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;",
            ">;"
        }
    .end annotation
.end field

.field private static final ST_CANCELLED:I = 0x2

.field private static final ST_EXPIRED:I = 0x3

.field private static final ST_INIT:I = 0x0

.field private static final ST_IN_BUCKET:I = 0x1


# instance fields
.field bucket:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

.field private final deadline:J

.field next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

.field prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

.field remainingRounds:J

.field private volatile state:I

.field private final task:Lorg/jboss/netty/util/TimerTask;

.field private final timer:Lorg/jboss/netty/util/HashedWheelTimer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 459
    const-class v0, Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->$assertionsDisabled:Z

    .line 465
    const-class v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    const-string v1, "state"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void

    .line 459
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lorg/jboss/netty/util/HashedWheelTimer;Lorg/jboss/netty/util/TimerTask;J)V
    .locals 1
    .param p1, "timer"    # Lorg/jboss/netty/util/HashedWheelTimer;
    .param p2, "task"    # Lorg/jboss/netty/util/TimerTask;
    .param p3, "deadline"    # J

    .prologue
    .line 487
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 472
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->state:I

    .line 488
    iput-object p1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->timer:Lorg/jboss/netty/util/HashedWheelTimer;

    .line 489
    iput-object p2, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->task:Lorg/jboss/netty/util/TimerTask;

    .line 490
    iput-wide p3, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->deadline:J

    .line 491
    return-void
.end method

.method static synthetic access$800(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)J
    .locals 2
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .prologue
    .line 459
    iget-wide v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->deadline:J

    return-wide v0
.end method


# virtual methods
.method public cancel()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x2

    .line 502
    invoke-virtual {p0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->state()I

    move-result v0

    .line 503
    .local v0, "state":I
    if-lt v0, v2, :cond_1

    .line 521
    :cond_0
    :goto_0
    return-void

    .line 507
    :cond_1
    if-eq v0, v3, :cond_2

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->compareAndSetState(II)Z

    move-result v1

    if-nez v1, :cond_0

    .line 514
    :cond_2
    invoke-virtual {p0, v3, v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->compareAndSetState(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 520
    iget-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->timer:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v1}, Lorg/jboss/netty/util/HashedWheelTimer;->access$700(Lorg/jboss/netty/util/HashedWheelTimer;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public compareAndSetState(II)Z
    .locals 1
    .param p1, "expected"    # I
    .param p2, "state"    # I

    .prologue
    .line 530
    sget-object v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    return v0
.end method

.method public expire()V
    .locals 4

    .prologue
    .line 550
    const/4 v1, 0x1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->compareAndSetState(II)Z

    move-result v1

    if-nez v1, :cond_0

    .line 551
    sget-boolean v1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->state()I

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 556
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->task:Lorg/jboss/netty/util/TimerTask;

    invoke-interface {v1, p0}, Lorg/jboss/netty/util/TimerTask;->run(Lorg/jboss/netty/util/Timeout;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 562
    :cond_1
    :goto_0
    return-void

    .line 557
    :catch_0
    move-exception v0

    .line 558
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lorg/jboss/netty/util/HashedWheelTimer;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 559
    sget-object v1, Lorg/jboss/netty/util/HashedWheelTimer;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "An exception was thrown by "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-class v3, Lorg/jboss/netty/util/TimerTask;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getTask()Lorg/jboss/netty/util/TimerTask;
    .locals 1

    .prologue
    .line 498
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->task:Lorg/jboss/netty/util/TimerTask;

    return-object v0
.end method

.method public getTimer()Lorg/jboss/netty/util/Timer;
    .locals 1

    .prologue
    .line 494
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->timer:Lorg/jboss/netty/util/HashedWheelTimer;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 2

    .prologue
    .line 538
    iget v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isExpired()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 542
    iget v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->state:I

    if-le v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 524
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->bucket:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    if-eqz v0, :cond_0

    .line 525
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->bucket:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    invoke-virtual {v0, p0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->remove(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)V

    .line 527
    :cond_0
    return-void
.end method

.method public state()I
    .locals 1

    .prologue
    .line 534
    iget v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->state:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    .line 566
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 567
    .local v2, "currentTime":J
    iget-wide v6, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->deadline:J

    sub-long/2addr v6, v2

    iget-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->timer:Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v1}, Lorg/jboss/netty/util/HashedWheelTimer;->access$200(Lorg/jboss/netty/util/HashedWheelTimer;)J

    move-result-wide v8

    add-long v4, v6, v8

    .line 569
    .local v4, "remaining":J
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xc0

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 570
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 573
    const-string v1, "deadline: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    cmp-long v1, v4, v10

    if-lez v1, :cond_1

    .line 575
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 576
    const-string v1, " ns later"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    :goto_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 585
    const-string v1, ", cancelled"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 588
    :cond_0
    const-string v1, ", task: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 589
    invoke-virtual {p0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->getTask()Lorg/jboss/netty/util/TimerTask;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 591
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 577
    :cond_1
    cmp-long v1, v4, v10

    if-gez v1, :cond_2

    .line 578
    neg-long v6, v4

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 579
    const-string v1, " ns ago"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 581
    :cond_2
    const-string v1, "now"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public value()Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    .locals 0

    .prologue
    .line 546
    return-object p0
.end method
