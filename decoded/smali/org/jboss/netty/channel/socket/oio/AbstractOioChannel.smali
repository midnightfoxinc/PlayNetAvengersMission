.class abstract Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;
.super Lorg/jboss/netty/channel/AbstractChannel;
.source "AbstractOioChannel.java"


# instance fields
.field final interestOpsLock:Ljava/lang/Object;

.field private volatile localAddress:Ljava/net/InetSocketAddress;

.field volatile remoteAddress:Ljava/net/InetSocketAddress;

.field volatile worker:Lorg/jboss/netty/channel/socket/Worker;

.field volatile workerThread:Ljava/lang/Thread;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V
    .locals 1
    .param p1, "parent"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p3, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p4, "sink"    # Lorg/jboss/netty/channel/ChannelSink;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/channel/AbstractChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->interestOpsLock:Ljava/lang/Object;

    .line 44
    return-void
.end method


# virtual methods
.method abstract closeSocket()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected getInternalInterestOps()I
    .locals 1

    .prologue
    .line 53
    invoke-super {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInternalInterestOps()I

    move-result v0

    return v0
.end method

.method public getLocalAddress()Ljava/net/InetSocketAddress;
    .locals 3

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->localAddress:Ljava/net/InetSocketAddress;

    .line 80
    .local v0, "localAddress":Ljava/net/InetSocketAddress;
    if-nez v0, :cond_0

    .line 82
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->getLocalSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->localAddress:Ljava/net/InetSocketAddress;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    move-object v2, v0

    .line 88
    :goto_0
    return-object v2

    .line 83
    :catch_0
    move-exception v1

    .line 85
    .local v1, "t":Ljava/lang/Throwable;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getLocalAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

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
    .line 92
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->remoteAddress:Ljava/net/InetSocketAddress;

    .line 93
    .local v0, "remoteAddress":Ljava/net/InetSocketAddress;
    if-nez v0, :cond_0

    .line 95
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->getRemoteSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->remoteAddress:Ljava/net/InetSocketAddress;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    move-object v2, v0

    .line 102
    :goto_0
    return-object v2

    .line 97
    :catch_0
    move-exception v1

    .line 99
    .local v1, "t":Ljava/lang/Throwable;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic getRemoteAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

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

.method public isBound()Z
    .locals 1

    .prologue
    .line 71
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isSocketBound()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->isSocketConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method abstract isSocketBound()Z
.end method

.method abstract isSocketClosed()Z
.end method

.method abstract isSocketConnected()Z
.end method

.method protected setClosed()Z
    .locals 1

    .prologue
    .line 48
    invoke-super {p0}, Lorg/jboss/netty/channel/AbstractChannel;->setClosed()Z

    move-result v0

    return v0
.end method

.method protected setInternalInterestOps(I)V
    .locals 0
    .param p1, "interestOps"    # I

    .prologue
    .line 58
    invoke-super {p0, p1}, Lorg/jboss/netty/channel/AbstractChannel;->setInternalInterestOps(I)V

    .line 59
    return-void
.end method

.method public write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "message"    # Ljava/lang/Object;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 63
    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 64
    :cond_0
    const/4 v0, 0x0

    invoke-super {p0, p1, v0}, Lorg/jboss/netty/channel/AbstractChannel;->write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 66
    :goto_0
    return-object v0

    :cond_1
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/AbstractChannel;->write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    goto :goto_0
.end method
