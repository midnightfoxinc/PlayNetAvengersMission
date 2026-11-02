.class public final Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;
.super Ljava/lang/Object;
.source "ShareableWorkerPool.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/WorkerPool;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E::",
        "Lorg/jboss/netty/channel/socket/Worker;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final wrapped:Lorg/jboss/netty/channel/socket/nio/WorkerPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool<TE;>;"
    .local p1, "wrapped":Lorg/jboss/netty/channel/socket/nio/WorkerPool;, "Lorg/jboss/netty/channel/socket/nio/WorkerPool<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;->wrapped:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    .line 34
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .prologue
    .line 48
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;->wrapped:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->shutdown()V

    .line 49
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;->wrapped:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    instance-of v0, v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;->wrapped:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    check-cast v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    invoke-interface {v0}, Lorg/jboss/netty/util/ExternalResourceReleasable;->releaseExternalResources()V

    .line 52
    :cond_0
    return-void
.end method

.method public nextWorker()Lorg/jboss/netty/channel/socket/Worker;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;->wrapped:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->nextWorker()Lorg/jboss/netty/channel/socket/Worker;

    move-result-object v0

    return-object v0
.end method

.method public rebuildSelectors()V
    .locals 1

    .prologue
    .line 41
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;->wrapped:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->rebuildSelectors()V

    .line 42
    return-void
.end method

.method public shutdown()V
    .locals 0

    .prologue
    .line 56
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool;, "Lorg/jboss/netty/channel/socket/nio/ShareableWorkerPool<TE;>;"
    return-void
.end method
