.class Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioChannelSink;
.source "NioDatagramPipelineSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink$1;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lorg/jboss/netty/channel/socket/nio/WorkerPool;)V
    .locals 0
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
    .line 50
    .local p1, "workerPool":Lorg/jboss/netty/channel/socket/nio/WorkerPool;, "Lorg/jboss/netty/channel/socket/nio/WorkerPool<Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;>;"
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannelSink;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    .line 52
    return-void
.end method

.method private static bind(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/InetSocketAddress;)V
    .locals 5
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "address"    # Ljava/net/InetSocketAddress;

    .prologue
    .line 125
    const/4 v0, 0x0

    .line 126
    .local v0, "bound":Z
    const/4 v1, 0x0

    .line 129
    .local v1, "started":Z
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getDatagramChannel()Ljava/nio/channels/DatagramChannel;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/net/DatagramSocket;->bind(Ljava/net/SocketAddress;)V

    .line 130
    const/4 v0, 0x1

    .line 132
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 133
    invoke-static {p0, p2}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 135
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    const/4 v4, 0x0

    invoke-virtual {v3, p0, v4}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    const/4 v1, 0x1

    .line 141
    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 142
    :goto_0
    invoke-static {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->close(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 145
    :cond_0
    return-void

    .line 137
    :catch_0
    move-exception v2

    .line 138
    .local v2, "t":Ljava/lang/Throwable;
    :try_start_1
    invoke-interface {p1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 139
    invoke-static {p0, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    goto :goto_0

    .end local v2    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v3

    if-nez v1, :cond_1

    if-eqz v0, :cond_1

    .line 142
    invoke-static {p0, p1}, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->close(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 141
    :cond_1
    throw v3
.end method

.method private static close(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 103
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getDatagramChannel()Ljava/nio/channels/DatagramChannel;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->close()V

    .line 104
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->setClosed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 105
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 106
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->isBound()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 107
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 109
    :cond_0
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V

    .line 117
    :goto_0
    return-void

    .line 111
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 115
    invoke-static {p0, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static connect(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/InetSocketAddress;)V
    .locals 6
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "remoteAddress"    # Ljava/net/InetSocketAddress;

    .prologue
    .line 151
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->isBound()Z

    move-result v0

    .line 152
    .local v0, "bound":Z
    const/4 v1, 0x0

    .line 153
    .local v1, "connected":Z
    const/4 v3, 0x0

    .line 155
    .local v3, "workerStarted":Z
    sget-object v4, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE_ON_FAILURE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {p1, v4}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 159
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->remoteAddress:Ljava/net/InetSocketAddress;

    .line 162
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getDatagramChannel()Ljava/nio/channels/DatagramChannel;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/nio/channels/DatagramChannel;->connect(Ljava/net/SocketAddress;)Ljava/nio/channels/DatagramChannel;

    .line 163
    const/4 v1, 0x1

    .line 166
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 167
    if-nez v0, :cond_0

    .line 168
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v4

    invoke-static {p0, v4}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 170
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v4

    invoke-static {p0, v4}, Lorg/jboss/netty/channel/Channels;->fireChannelConnected(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 172
    if-nez v0, :cond_1

    .line 173
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v4, p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->register(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    :cond_1
    const/4 v3, 0x1

    .line 181
    if-eqz v1, :cond_2

    if-nez v3, :cond_2

    .line 182
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    :goto_0
    invoke-virtual {v4, p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 185
    :cond_2
    return-void

    .line 177
    :catch_0
    move-exception v2

    .line 178
    .local v2, "t":Ljava/lang/Throwable;
    :try_start_1
    invoke-interface {p1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 179
    invoke-static {p0, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    if-eqz v1, :cond_2

    if-nez v3, :cond_2

    .line 182
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    goto :goto_0

    .line 181
    .end local v2    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v4

    if-eqz v1, :cond_3

    if-nez v3, :cond_3

    .line 182
    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v5, p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 181
    :cond_3
    throw v4
.end method


# virtual methods
.method public eventSunk(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 9
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;

    .line 64
    .local v0, "channel":Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 65
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    instance-of v7, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v7, :cond_3

    move-object v5, p2

    .line 66
    check-cast v5, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 67
    .local v5, "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v4

    .line 68
    .local v4, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v6

    .line 69
    .local v6, "value":Ljava/lang/Object;
    sget-object v7, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v4}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 99
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v5    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 71
    .restart local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .restart local v5    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    .restart local v6    # "value":Ljava/lang/Object;
    :pswitch_0
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 72
    iget-object v7, v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v7, v0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 76
    :pswitch_1
    if-eqz v6, :cond_1

    .line 77
    check-cast v6, Ljava/net/InetSocketAddress;

    .end local v6    # "value":Ljava/lang/Object;
    invoke-static {v0, v2, v6}, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->bind(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/InetSocketAddress;)V

    goto :goto_0

    .line 79
    .restart local v6    # "value":Ljava/lang/Object;
    :cond_1
    iget-object v7, v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v7, v0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 83
    :pswitch_2
    if-eqz v6, :cond_2

    .line 84
    check-cast v6, Ljava/net/InetSocketAddress;

    .end local v6    # "value":Ljava/lang/Object;
    invoke-static {v0, v2, v6}, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->connect(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/InetSocketAddress;)V

    goto :goto_0

    .line 86
    .restart local v6    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;->disconnect(Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 90
    :pswitch_3
    iget-object v7, v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    check-cast v6, Ljava/lang/Integer;

    .end local v6    # "value":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v7, v0, v2, v8}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->setInterestOps(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    goto :goto_0

    .line 93
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v5    # "stateEvent":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_3
    instance-of v7, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v7, :cond_0

    move-object v1, p2

    .line 94
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 95
    .local v1, "event":Lorg/jboss/netty/channel/MessageEvent;
    iget-object v7, v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->writeBufferQueue:Ljava/util/Queue;

    invoke-interface {v7, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v3

    .line 96
    .local v3, "offered":Z
    sget-boolean v7, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->$assertionsDisabled:Z

    if-nez v7, :cond_4

    if-nez v3, :cond_4

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 97
    :cond_4
    iget-object v7, v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v7, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->writeFromUserCode(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    goto :goto_0

    .line 69
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method nextWorker()Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/NioDatagramPipelineSink;->workerPool:Lorg/jboss/netty/channel/socket/nio/WorkerPool;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/nio/WorkerPool;->nextWorker()Lorg/jboss/netty/channel/socket/Worker;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioDatagramWorker;

    return-object v0
.end method
