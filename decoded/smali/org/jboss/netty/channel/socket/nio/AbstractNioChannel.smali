.class abstract Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;
.super Lorg/jboss/netty/channel/AbstractChannel;
.source "AbstractNioChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteTask;,
        Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Ljava/nio/channels/SelectableChannel;",
        ":",
        "Ljava/nio/channels/WritableByteChannel;",
        ">",
        "Lorg/jboss/netty/channel/AbstractChannel;"
    }
.end annotation


# instance fields
.field final channel:Ljava/nio/channels/SelectableChannel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field

.field currentWriteBuffer:Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;

.field currentWriteEvent:Lorg/jboss/netty/channel/MessageEvent;

.field final highWaterMarkCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field inWriteNowLoop:Z

.field private volatile localAddress:Ljava/net/InetSocketAddress;

.field volatile remoteAddress:Ljava/net/InetSocketAddress;

.field final worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

.field final writeBufferQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;"
        }
    .end annotation
.end field

.field final writeBufferSize:Ljava/util/concurrent/atomic/AtomicInteger;

.field final writeLock:Ljava/lang/Object;

.field writeSuspended:Z

.field final writeTask:Ljava/lang/Runnable;

.field final writeTaskInTaskQueue:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method protected constructor <init>(Ljava/lang/Integer;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;Ljava/nio/channels/SelectableChannel;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/Integer;
    .param p2, "parent"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p4, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p5, "sink"    # Lorg/jboss/netty/channel/ChannelSink;
    .param p6, "worker"    # Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/channel/Channel;",
            "Lorg/jboss/netty/channel/ChannelFactory;",
            "Lorg/jboss/netty/channel/ChannelPipeline;",
            "Lorg/jboss/netty/channel/ChannelSink;",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;",
            "TC;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    .local p7, "ch":Ljava/nio/channels/SelectableChannel;, "TC;"
    invoke-direct/range {p0 .. p5}, Lorg/jboss/netty/channel/AbstractChannel;-><init>(Ljava/lang/Integer;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeLock:Ljava/lang/Object;

    .line 55
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteTask;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteTask;-><init>(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTask:Ljava/lang/Runnable;

    .line 60
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTaskInTaskQueue:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 65
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;-><init>(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferQueue:Ljava/util/Queue;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferSize:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 76
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->highWaterMarkCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 99
    iput-object p6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    .line 100
    iput-object p7, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->channel:Ljava/nio/channels/SelectableChannel;

    .line 101
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;Ljava/nio/channels/SelectableChannel;)V
    .locals 1
    .param p1, "parent"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p3, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p4, "sink"    # Lorg/jboss/netty/channel/ChannelSink;
    .param p5, "worker"    # Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lorg/jboss/netty/channel/ChannelFactory;",
            "Lorg/jboss/netty/channel/ChannelPipeline;",
            "Lorg/jboss/netty/channel/ChannelSink;",
            "Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;",
            "TC;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    .local p6, "ch":Ljava/nio/channels/SelectableChannel;, "TC;"
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/channel/AbstractChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeLock:Ljava/lang/Object;

    .line 55
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteTask;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteTask;-><init>(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTask:Ljava/lang/Runnable;

    .line 60
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeTaskInTaskQueue:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 65
    new-instance v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;-><init>(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferQueue:Ljava/util/Queue;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferSize:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 76
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->highWaterMarkCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 107
    iput-object p5, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    .line 108
    iput-object p6, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->channel:Ljava/nio/channels/SelectableChannel;

    .line 109
    return-void
.end method

.method static synthetic access$000(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    .prologue
    .line 40
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->setUnwritable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    .prologue
    .line 40
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->setWritable()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public bridge synthetic getConfig()Lorg/jboss/netty/channel/ChannelConfig;
    .locals 1

    .prologue
    .line 40
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;

    move-result-object v0

    return-object v0
.end method

.method public abstract getConfig()Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;
.end method

.method protected getInternalInterestOps()I
    .locals 1

    .prologue
    .line 158
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    invoke-super {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInternalInterestOps()I

    move-result v0

    return v0
.end method

.method public getLocalAddress()Ljava/net/InetSocketAddress;
    .locals 3

    .prologue
    .line 122
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->localAddress:Ljava/net/InetSocketAddress;

    .line 123
    .local v0, "localAddress":Ljava/net/InetSocketAddress;
    if-nez v0, :cond_1

    .line 125
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getLocalSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v2, v0

    .line 137
    :goto_0
    return-object v2

    .line 131
    :cond_0
    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->localAddress:Ljava/net/InetSocketAddress;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    move-object v2, v0

    .line 137
    goto :goto_0

    .line 132
    :catch_0
    move-exception v1

    .line 134
    .local v1, "t":Ljava/lang/Throwable;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getLocalAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 40
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method abstract getLocalSocketAddress()Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public getRemoteAddress()Ljava/net/InetSocketAddress;
    .locals 3

    .prologue
    .line 141
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->remoteAddress:Ljava/net/InetSocketAddress;

    .line 142
    .local v0, "remoteAddress":Ljava/net/InetSocketAddress;
    if-nez v0, :cond_0

    .line 144
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getRemoteSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->remoteAddress:Ljava/net/InetSocketAddress;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    move-object v2, v0

    .line 151
    :goto_0
    return-object v2

    .line 146
    :catch_0
    move-exception v1

    .line 148
    .local v1, "t":Ljava/lang/Throwable;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getRemoteAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 40
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method abstract getRemoteSocketAddress()Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public getWorker()Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;
    .locals 1

    .prologue
    .line 118
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    return-object v0
.end method

.method protected setClosed()Z
    .locals 1

    .prologue
    .line 168
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    invoke-super {p0}, Lorg/jboss/netty/channel/AbstractChannel;->setClosed()Z

    move-result v0

    return v0
.end method

.method protected setInternalInterestOps(I)V
    .locals 0
    .param p1, "interestOps"    # I

    .prologue
    .line 163
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/channel/AbstractChannel;->setInternalInterestOps(I)V

    .line 164
    return-void
.end method
