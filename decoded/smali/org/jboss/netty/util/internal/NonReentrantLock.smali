.class public final Lorg/jboss/netty/util/internal/NonReentrantLock;
.super Ljava/util/concurrent/locks/AbstractQueuedSynchronizer;
.source "NonReentrantLock.java"

# interfaces
.implements Ljava/util/concurrent/locks/Lock;


# static fields
.field private static final serialVersionUID:J = -0xb922f40ffce0a42L


# instance fields
.field private owner:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/util/concurrent/locks/AbstractQueuedSynchronizer;-><init>()V

    return-void
.end method


# virtual methods
.method public isHeldByCurrentThread()Z
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->isHeldExclusively()Z

    move-result v0

    return v0
.end method

.method protected isHeldExclusively()Z
    .locals 2

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->getState()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/util/internal/NonReentrantLock;->owner:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lock()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->acquire(I)V

    .line 32
    return-void
.end method

.method public lockInterruptibly()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 35
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->acquireInterruptibly(I)V

    .line 36
    return-void
.end method

.method public newCondition()Ljava/util/concurrent/locks/Condition;
    .locals 1

    .prologue
    .line 56
    new-instance v0, Ljava/util/concurrent/locks/AbstractQueuedSynchronizer$ConditionObject;

    invoke-direct {v0, p0}, Ljava/util/concurrent/locks/AbstractQueuedSynchronizer$ConditionObject;-><init>(Ljava/util/concurrent/locks/AbstractQueuedSynchronizer;)V

    return-object v0
.end method

.method protected tryAcquire(I)Z
    .locals 3
    .param p1, "acquires"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 61
    invoke-virtual {p0, v1, v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->compareAndSetState(II)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 62
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/util/internal/NonReentrantLock;->owner:Ljava/lang/Thread;

    .line 65
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public tryLock()Z
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->tryAcquire(I)Z

    move-result v0

    return v0
.end method

.method public tryLock(JLjava/util/concurrent/TimeUnit;)Z
    .locals 5
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 44
    const/4 v0, 0x1

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    invoke-virtual {p0, v0, v2, v3}, Lorg/jboss/netty/util/internal/NonReentrantLock;->tryAcquireNanos(IJ)Z

    move-result v0

    return v0
.end method

.method protected tryRelease(I)Z
    .locals 2
    .param p1, "releases"    # I

    .prologue
    .line 70
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/util/internal/NonReentrantLock;->owner:Ljava/lang/Thread;

    if-eq v0, v1, :cond_0

    .line 71
    new-instance v0, Ljava/lang/IllegalMonitorStateException;

    invoke-direct {v0}, Ljava/lang/IllegalMonitorStateException;-><init>()V

    throw v0

    .line 73
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/NonReentrantLock;->owner:Ljava/lang/Thread;

    .line 74
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->setState(I)V

    .line 75
    const/4 v0, 0x1

    return v0
.end method

.method public unlock()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;->release(I)Z

    .line 49
    return-void
.end method
