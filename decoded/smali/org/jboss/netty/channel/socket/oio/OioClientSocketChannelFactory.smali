.class public Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;
.super Ljava/lang/Object;
.source "OioClientSocketChannelFactory.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;


# instance fields
.field private shutdownExecutor:Z

.field final sink:Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;

.field private final workerExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 88
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;-><init>(Ljava/util/concurrent/Executor;)V

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->shutdownExecutor:Z

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V
    .locals 2
    .param p1, "workerExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    if-nez p1, :cond_0

    .line 113
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "workerExecutor"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->workerExecutor:Ljava/util/concurrent/Executor;

    .line 116
    new-instance v0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;-><init>(Ljava/util/concurrent/Executor;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->sink:Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;

    .line 117
    return-void
.end method


# virtual methods
.method public bridge synthetic newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 76
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/socket/SocketChannel;

    move-result-object v0

    return-object v0
.end method

.method public newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/socket/SocketChannel;
    .locals 2
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 120
    new-instance v0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->sink:Lorg/jboss/netty/channel/socket/oio/OioClientSocketPipelineSink;

    invoke-direct {v0, p0, p1, v1}, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannel;-><init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    return-object v0
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->workerExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lorg/jboss/netty/util/internal/ExecutorUtil;->shutdownNow(Ljava/util/concurrent/Executor;)V

    .line 131
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 124
    iget-boolean v0, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->shutdownExecutor:Z

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioClientSocketChannelFactory;->workerExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Lorg/jboss/netty/util/internal/ExecutorUtil;->shutdownNow(Ljava/util/concurrent/Executor;)V

    .line 127
    :cond_0
    return-void
.end method
