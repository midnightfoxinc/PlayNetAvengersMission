.class final Lorg/jboss/netty/channel/local/LocalServerChannelSink;
.super Lorg/jboss/netty/channel/AbstractChannelSink;
.source "LocalServerChannelSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/local/LocalServerChannelSink$1;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lorg/jboss/netty/channel/local/LocalServerChannelSink;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/local/LocalServerChannelSink;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/jboss/netty/channel/AbstractChannelSink;-><init>()V

    .line 64
    return-void
.end method

.method private static bind(Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/local/LocalAddress;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "localAddress"    # Lorg/jboss/netty/channel/local/LocalAddress;

    .prologue
    .line 104
    :try_start_0
    invoke-static {p2, p0}, Lorg/jboss/netty/channel/local/LocalChannelRegistry;->register(Lorg/jboss/netty/channel/local/LocalAddress;Lorg/jboss/netty/channel/Channel;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 105
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "address already in use: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "t":Ljava/lang/Throwable;
    invoke-static {p2}, Lorg/jboss/netty/channel/local/LocalChannelRegistry;->unregister(Lorg/jboss/netty/channel/local/LocalAddress;)Z

    .line 116
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 117
    invoke-static {p0, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 119
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_0
    return-void

    .line 107
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;->bound:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-nez v1, :cond_1

    .line 108
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    const-string v2, "already bound"

    invoke-direct {v1, v2}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 111
    :cond_1
    iput-object p2, p0, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;->localAddress:Lorg/jboss/netty/channel/local/LocalAddress;

    .line 112
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 113
    invoke-static {p0, p2}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private static close(Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 5
    .param p0, "channel"    # Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 123
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;->setClosed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 124
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 125
    iget-object v0, p0, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;->localAddress:Lorg/jboss/netty/channel/local/LocalAddress;

    .line 126
    .local v0, "localAddress":Lorg/jboss/netty/channel/local/LocalAddress;
    iget-object v2, p0, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;->bound:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 127
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;->localAddress:Lorg/jboss/netty/channel/local/LocalAddress;

    .line 128
    invoke-static {v0}, Lorg/jboss/netty/channel/local/LocalChannelRegistry;->unregister(Lorg/jboss/netty/channel/local/LocalAddress;)Z

    .line 129
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 131
    :cond_0
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V

    .line 139
    .end local v0    # "localAddress":Lorg/jboss/netty/channel/local/LocalAddress;
    :goto_0
    return-void

    .line 133
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v1

    .line 136
    .local v1, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v1}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 137
    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static handleAcceptedChannel(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 8
    .param p0, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 69
    instance-of v6, p0, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v6, :cond_1

    move-object v1, p0

    .line 70
    check-cast v1, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 71
    .local v1, "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 72
    .local v0, "channel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 73
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v4

    .line 74
    .local v4, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 76
    .local v5, "value":Ljava/lang/Object;
    sget-object v6, Lorg/jboss/netty/channel/local/LocalServerChannelSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-virtual {v4}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 100
    .end local v0    # "channel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 78
    .restart local v0    # "channel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    .restart local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .restart local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .restart local v5    # "value":Ljava/lang/Object;
    :pswitch_0
    sget-object v6, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 79
    invoke-virtual {v0, v2}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->closeNow(Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 84
    :pswitch_1
    if-nez v5, :cond_0

    .line 85
    invoke-virtual {v0, v2}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->closeNow(Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 90
    :pswitch_2
    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    goto :goto_0

    .line 93
    .end local v0    # "channel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    .end local v1    # "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v4    # "state":Lorg/jboss/netty/channel/ChannelState;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v6, p0, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v6, :cond_0

    move-object v1, p0

    .line 94
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 95
    .local v1, "event":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    .line 96
    .restart local v0    # "channel":Lorg/jboss/netty/channel/local/DefaultLocalChannel;
    iget-object v6, v0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->writeBuffer:Ljava/util/Queue;

    invoke-interface {v6, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v3

    .line 97
    .local v3, "offered":Z
    sget-boolean v6, Lorg/jboss/netty/channel/local/LocalServerChannelSink;->$assertionsDisabled:Z

    if-nez v6, :cond_2

    if-nez v3, :cond_2

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 98
    :cond_2
    invoke-virtual {v0}, Lorg/jboss/netty/channel/local/DefaultLocalChannel;->flushWriteBuffer()V

    goto :goto_0

    .line 76
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static handleServerChannel(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 7
    .param p0, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 42
    instance-of v5, p0, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-nez v5, :cond_1

    .line 66
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v1, p0

    .line 46
    check-cast v1, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 47
    .local v1, "event":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;

    .line 49
    .local v0, "channel":Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 50
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v3

    .line 51
    .local v3, "state":Lorg/jboss/netty/channel/ChannelState;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 52
    .local v4, "value":Ljava/lang/Object;
    sget-object v5, Lorg/jboss/netty/channel/local/LocalServerChannelSink$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

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
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/local/LocalServerChannelSink;->close(Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 59
    :pswitch_1
    if-eqz v4, :cond_2

    .line 60
    check-cast v4, Lorg/jboss/netty/channel/local/LocalAddress;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-static {v0, v2, v4}, Lorg/jboss/netty/channel/local/LocalServerChannelSink;->bind(Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/local/LocalAddress;)V

    goto :goto_0

    .line 62
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_2
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/local/LocalServerChannelSink;->close(Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

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
    .line 33
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 34
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    instance-of v1, v0, Lorg/jboss/netty/channel/local/DefaultLocalServerChannel;

    if-eqz v1, :cond_1

    .line 35
    invoke-static {p2}, Lorg/jboss/netty/channel/local/LocalServerChannelSink;->handleServerChannel(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 39
    :cond_0
    :goto_0
    return-void

    .line 36
    :cond_1
    instance-of v1, v0, Lorg/jboss/netty/channel/local/DefaultLocalChannel;

    if-eqz v1, :cond_0

    .line 37
    invoke-static {p2}, Lorg/jboss/netty/channel/local/LocalServerChannelSink;->handleAcceptedChannel(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method
