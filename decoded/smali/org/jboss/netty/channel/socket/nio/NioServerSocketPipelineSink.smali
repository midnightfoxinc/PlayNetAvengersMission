.class Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink;
.super Lorg/jboss/netty/channel/socket/nio/AbstractNioChannelSink;
.source "NioServerSocketPipelineSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink$1;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-class v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannelSink;-><init>()V

    .line 66
    return-void
.end method

.method private static handleAcceptedSocket(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 8
    .param p0, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 71
    instance-of v6, p0, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v6, :cond_1

    move-object v1, p0

    .line 72
    check-cast v1, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 73
    .local v1, "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;

    .line 74
    .local v0, "channel":Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 75
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v4

    .line 76
    .local v4, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 78
    .local v5, "value":Ljava/lang/Object;
    sget-object v6, Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v4}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 101
    .end local v0    # "channel":Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 80
    .restart local v0    # "channel":Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
    .restart local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .restart local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .restart local v5    # "value":Ljava/lang/Object;
    :pswitch_0
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 81
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v6, v0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 86
    :pswitch_1
    if-nez v5, :cond_0

    .line 87
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v6, v0, v2}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 91
    :pswitch_2
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    check-cast v5, Ljava/lang/Integer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v6, v0, v2, v7}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->setInterestOps(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    goto :goto_0

    .line 94
    .end local v0    # "channel":Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    :cond_1
    instance-of v6, p0, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v6, :cond_0

    move-object v1, p0

    .line 95
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 96
    .local v1, "event":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;

    .line 97
    .restart local v0    # "channel":Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->writeBufferQueue:Ljava/util/Queue;

    invoke-interface {v6, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v3

    .line 98
    .local v3, "offered":Z
    sget-boolean v6, Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink;->$assertionsDisabled:Z

    if-nez v6, :cond_2

    if-nez v3, :cond_2

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 99
    :cond_2
    iget-object v6, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    invoke-virtual {v6, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->writeFromUserCode(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V

    goto :goto_0

    .line 78
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static handleServerSocket(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 7
    .param p0, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 41
    instance-of v5, p0, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-nez v5, :cond_1

    .line 68
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v1, p0

    .line 45
    check-cast v1, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 46
    .local v1, "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    .line 48
    .local v0, "channel":Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 49
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v3

    .line 50
    .local v3, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 52
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v3}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    goto :goto_0

    .line 54
    :pswitch_0
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v5, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 55
    iget-object v5, v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->boss:Lorg/jboss/netty/channel/socket/nio/Boss;

    check-cast v5, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    invoke-virtual {v5, v0, v2}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->close(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 59
    :pswitch_1
    if-eqz v4, :cond_2

    .line 60
    iget-object v5, v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->boss:Lorg/jboss/netty/channel/socket/nio/Boss;

    check-cast v5, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    check-cast v4, Ljava/net/SocketAddress;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v5, v0, v2, v4}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->bind(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 62
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_2
    iget-object v5, v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->boss:Lorg/jboss/netty/channel/socket/nio/Boss;

    check-cast v5, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    invoke-virtual {v5, v0, v2}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->close(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 52
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public eventSunk(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 2
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 33
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    instance-of v1, v0, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    if-eqz v1, :cond_1

    .line 34
    invoke-static {p2}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink;->handleServerSocket(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 38
    :cond_0
    :goto_0
    return-void

    .line 35
    :cond_1
    instance-of v1, v0, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;

    if-eqz v1, :cond_0

    .line 36
    invoke-static {p2}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketPipelineSink;->handleAcceptedSocket(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method
