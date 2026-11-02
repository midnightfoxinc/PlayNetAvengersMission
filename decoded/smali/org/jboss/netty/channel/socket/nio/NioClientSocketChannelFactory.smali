.class public Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;
.super Ljava/lang/Object;
.source "NioClientSocketChannelFactory.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;


# static fields
.field private static final DEFAULT_BOSS_COUNT:I = 0x1


# instance fields
.field private final bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/channel/socket/nio/BossPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioClientBoss;",
            ">;"
        }
    .end annotation
.end field

.field private releasePools:Z

.field private final sink:Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;

.field private final workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioWorker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 98
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->releasePools:Z

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/channel/socket/nio/WorkerPool;)V
    .locals 1
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "bossCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "I",
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioWorker;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 167
    .local p3, "workerPool":Lorg/jboss/netty/channel/socket/nio/WorkerPool;, "Lorg/jboss/netty/channel/socket/nio/WorkerPool<Lorg/jboss/netty/channel/socket/nio/NioWorker;>;"
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;-><init>(Ljava/util/concurrent/Executor;I)V

    invoke-direct {p0, v0, p3}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;-><init>(Lorg/jboss/netty/channel/socket/nio/BossPool;Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V

    .line 168
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/channel/socket/nio/WorkerPool;Lorg/jboss/netty/util/Timer;)V
    .locals 2
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "bossCount"    # I
    .param p4, "timer"    # Lorg/jboss/netty/util/Timer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "I",
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioWorker;",
            ">;",
            "Lorg/jboss/netty/util/Timer;",
            ")V"
        }
    .end annotation

    .prologue
    .line 185
    .local p3, "workerPool":Lorg/jboss/netty/channel/socket/nio/WorkerPool;, "Lorg/jboss/netty/channel/socket/nio/WorkerPool<Lorg/jboss/netty/channel/socket/nio/NioWorker;>;"
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p4, v1}, Lorg/jboss/netty/channel/socket/nio/NioClientBossPool;-><init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/util/Timer;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    invoke-direct {p0, v0, p3}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;-><init>(Lorg/jboss/netty/channel/socket/nio/BossPool;Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V

    .line 186
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 116
    const/4 v0, 0x1

    sget v1, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->DEFAULT_IO_THREADS:I

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;II)V

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;I)V
    .locals 1
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "workerCount"    # I

    .prologue
    .line 133
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;II)V

    .line 134
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;II)V
    .locals 1
    .param p1, "bossExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "bossCount"    # I
    .param p4, "workerCount"    # I

    .prologue
    .line 151
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;

    invoke-direct {v0, p2, p4}, Lorg/jboss/netty/channel/socket/nio/NioWorkerPool;-><init>(Ljava/util/concurrent/Executor;I)V

    invoke-direct {p0, p1, p3, v0}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;-><init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/channel/socket/nio/WorkerPool;)V

    .line 152
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/socket/nio/BossPool;Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/BossPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioClientBoss;",
            ">;",
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioWorker;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 198
    .local p1, "bossPool":Lorg/jboss/netty/channel/socket/nio/BossPool;, "Lorg/jboss/netty/channel/socket/nio/BossPool<Lorg/jboss/netty/channel/socket/nio/NioClientBoss;>;"
    .local p2, "workerPool":Lorg/jboss/netty/channel/socket/nio/WorkerPool;, "Lorg/jboss/netty/channel/socket/nio/WorkerPool<Lorg/jboss/netty/channel/socket/nio/NioWorker;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    if-nez p1, :cond_0

    .line 201
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bossPool"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 203
    :cond_0
    if-nez p2, :cond_1

    .line 204
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "workerPool"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;

    .line 207
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    .line 208
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;

    invoke-direct {v0, p1}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;-><init>(Lorg/jboss/netty/channel/socket/nio/BossPool;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->sink:Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;

    .line 209
    return-void
.end method

.method private releasePools()V
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;

    instance-of v0, v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;

    check-cast v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    invoke-interface {v0}, Lorg/jboss/netty/util/ExternalResourceReleasable;->releaseExternalResources()V

    .line 233
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    instance-of v0, v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    if-eqz v0, :cond_1

    .line 234
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    check-cast v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    invoke-interface {v0}, Lorg/jboss/netty/util/ExternalResourceReleasable;->releaseExternalResources()V

    .line 236
    :cond_1
    return-void
.end method


# virtual methods
.method public bridge synthetic newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/socket/SocketChannel;

    move-result-object v0

    return-object v0
.end method

.method public newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/socket/SocketChannel;
    .locals 3
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 212
    new-instance v1, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->sink:Lorg/jboss/netty/channel/socket/nio/NioClientSocketPipelineSink;

    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->nextWorker()Lorg/jboss/netty/channel/socket/Worker;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioWorker;

    invoke-direct {v1, p0, p1, v2, v0}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;-><init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Lorg/jboss/netty/channel/socket/nio/NioWorker;)V

    return-object v1
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/BossPool;->shutdown()V

    .line 225
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->shutdown()V

    .line 226
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->releasePools()V

    .line 227
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->bossPool:Lorg/jboss/netty/channel/socket/nio/BossPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/BossPool;->shutdown()V

    .line 217
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->shutdown()V

    .line 218
    iget-boolean v0, p0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->releasePools:Z

    if-eqz v0, :cond_0

    .line 219
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannelFactory;->releasePools()V

    .line 221
    :cond_0
    return-void
.end method
