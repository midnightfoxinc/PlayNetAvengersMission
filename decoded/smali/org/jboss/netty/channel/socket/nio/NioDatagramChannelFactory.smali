.class public Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;
.super Ljava/lang/Object;
.source "NioDatagramChannelFactory.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/DatagramChannelFactory;


# instance fields
.field private final family:Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

.field private releasePool:Z

.field private final sink:Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

.field private final workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x0

    check-cast v0, Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;-><init>(Lorg/jboss/netty/channel/socket/InternetProtocolFamily;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 124
    sget v0, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->DEFAULT_IO_THREADS:I

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;-><init>(Ljava/util/concurrent/Executor;I)V

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;I)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerCount"    # I

    .prologue
    .line 140
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorkerPool;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorkerPool;-><init>(Ljava/util/concurrent/Executor;I)V

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;-><init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V

    .line 141
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/channel/socket/InternetProtocolFamily;)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "workerCount"    # I
    .param p3, "family"    # Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

    .prologue
    .line 187
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorkerPool;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorkerPool;-><init>(Ljava/util/concurrent/Executor;I)V

    invoke-direct {p0, v0, p3}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;-><init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;Lorg/jboss/netty/channel/socket/InternetProtocolFamily;)V

    .line 188
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/channel/socket/InternetProtocolFamily;)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "family"    # Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

    .prologue
    .line 171
    sget v0, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->DEFAULT_IO_THREADS:I

    invoke-direct {p0, p1, v0, p2}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;-><init>(Ljava/util/concurrent/Executor;ILorg/jboss/netty/channel/socket/InternetProtocolFamily;)V

    .line 172
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/socket/InternetProtocolFamily;)V
    .locals 3
    .param p1, "family"    # Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorkerPool;

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    sget v2, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->DEFAULT_IO_THREADS:I

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorkerPool;-><init>(Ljava/util/concurrent/Executor;I)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    .line 105
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->family:Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

    .line 106
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-direct {v0, v1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;-><init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->sink:Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->releasePool:Z

    .line 108
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, "workerPool":Lorg/jboss/netty/channel/socket/nio/WorkerPool;, "Lorg/jboss/netty/channel/socket/nio/WorkerPool<Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;-><init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;Lorg/jboss/netty/channel/socket/InternetProtocolFamily;)V

    .line 156
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;Lorg/jboss/netty/channel/socket/InternetProtocolFamily;)V
    .locals 1
    .param p2, "family"    # Lorg/jboss/netty/channel/socket/InternetProtocolFamily;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/socket/nio/WorkerPool",
            "<",
            "Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;",
            ">;",
            "Lorg/jboss/netty/channel/socket/InternetProtocolFamily;",
            ")V"
        }
    .end annotation

    .prologue
    .line 200
    .local p1, "workerPool":Lorg/jboss/netty/channel/socket/nio/WorkerPool;, "Lorg/jboss/netty/channel/socket/nio/WorkerPool<Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    .line 202
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->family:Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

    .line 203
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

    invoke-direct {v0, p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;-><init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->sink:Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

    .line 204
    return-void
.end method

.method private releasePool()V
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    instance-of v0, v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    check-cast v0, Lorg/jboss/netty/util/ExternalResourceReleasable;

    invoke-interface {v0}, Lorg/jboss/netty/util/ExternalResourceReleasable;->releaseExternalResources()V

    .line 226
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 79
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/socket/DatagramChannel;

    move-result-object v0

    return-object v0
.end method

.method public newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/socket/DatagramChannel;
    .locals 6
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 207
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;

    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->sink:Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->sink:Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->nextWorker()Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->family:Lorg/jboss/netty/channel/socket/InternetProtocolFamily;

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;-><init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;Lorg/jboss/netty/channel/socket/InternetProtocolFamily;)V

    return-object v0
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->shutdown()V

    .line 219
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->releasePool()V

    .line 220
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->shutdown()V

    .line 212
    iget-boolean v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->releasePool:Z

    if-eqz v0, :cond_0

    .line 213
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelFactory;->releasePool()V

    .line 215
    :cond_0
    return-void
.end method
