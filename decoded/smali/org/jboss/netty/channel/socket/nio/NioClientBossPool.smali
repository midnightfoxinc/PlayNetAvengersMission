.class public Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;
.source "NioClientBossPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool",
        "<",
        "Lorg/jboss/netty/channel/socket/nio/NioClientBoss;",
        ">;"
    }
.end annotation


# instance fields
.field private final determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

.field private stopTimer:Z

.field private final timer:Lorg/jboss/netty/util/Timer;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;I)V
    .locals 2
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "bossCount"    # I

    .prologue
    .line 55
    new-instance v0, Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-direct {v0}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;-><init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/util/Timer;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->stopTimer:Z

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/util/Timer;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 1
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "bossCount"    # I
    .param p3, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p4, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;-><init>(Ljava/util/concurrent/Executor;IZ)V

    .line 43
    iput-object p4, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    .line 44
    iput-object p3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->timer:Lorg/jboss/netty/util/Timer;

    .line 45
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->init()V

    .line 46
    return-void
.end method


# virtual methods
.method protected bridge synthetic newBoss(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/Boss;
    .locals 1
    .param p1, "x0"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->newBoss(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    move-result-object v0

    return-object v0
.end method

.method protected newBoss(Ljava/util/concurrent/Executor;)Lorg/jboss/netty/channel/socket/nio/NioClientBoss;
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 61
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->determiner:Lorg/jboss/netty/util/ThreadNameDeterminer;

    invoke-direct {v0, p1, v1, v2}, Lorg/jboss/netty/channel/socket/nio/NioClientBoss;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/Timer;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    return-object v0
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->releaseExternalResources()V

    .line 75
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->timer:Lorg/jboss/netty/util/Timer;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timer;->stop()Ljava/util/Set;

    .line 76
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 66
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioBossPool;->shutdown()V

    .line 67
    iget-boolean v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->stopTimer:Z

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;->timer:Lorg/jboss/netty/util/Timer;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timer;->stop()Ljava/util/Set;

    .line 70
    :cond_0
    return-void
.end method
