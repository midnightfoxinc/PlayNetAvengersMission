.class public Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;
.source "NioWorkerPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool",
        "<",
        "Lorg/jboss/netty/channel/socket/nio/NioWorker;",
        ">;"
    }
.end annotation


# instance fields
.field private final determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;I)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerCount"    # I

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;-><init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerCount"    # I
    .param p3, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorkerPool;-><init>(Ljava/util/concurrent/Executor;IZ)V

    .line 38
    iput-object p3, p0, Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    .line 39
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;->init()V

    .line 40
    return-void
.end method


# virtual methods
.method protected bridge synthetic newWorker(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    .locals 1
    .param p1, "x0"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;->newWorker(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/NioWorker;

    move-result-object v0

    return-object v0
.end method

.method protected newWorker(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/NioWorker;
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 44
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioWorker;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    invoke-direct {v0, p1, v1}, Lorg/jboss/netty/channel/socket/nio/NioWorker;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    return-object v0
.end method
