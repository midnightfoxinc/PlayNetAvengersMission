.class public final Lorg/jboss/netty/channel/Channels;
.super Ljava/lang/Object;
.source "Channels.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 849
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 851
    return-void
.end method

.method public static bind(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 557
    if-nez p1, :cond_0

    .line 558
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "localAddress"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 560
    :cond_0
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 561
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    sget-object v3, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v2, p0, v0, v3, p1}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 563
    return-object v0
.end method

.method public static bind(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 579
    if-nez p2, :cond_0

    .line 580
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "localAddress"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 582
    :cond_0
    new-instance v0, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v0, v1, p1, v2, p2}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 584
    return-void
.end method

.method public static close(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 5
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 811
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 812
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    sget-object v3, Lorg/jboss/netty/channel/ChannelState;->OPEN:Lorg/jboss/netty/channel/ChannelState;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v2, p0, v0, v3, v4}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 814
    return-object v0
.end method

.method public static close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 828
    new-instance v0, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->OPEN:Lorg/jboss/netty/channel/ChannelState;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, p1, v2, v3}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 830
    return-void
.end method

.method public static connect(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 630
    if-nez p1, :cond_0

    .line 631
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "remoteAddress"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 633
    :cond_0
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;Z)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 634
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    sget-object v3, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v2, p0, v0, v3, p1}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 636
    return-object v0
.end method

.method public static connect(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 652
    if-nez p2, :cond_0

    .line 653
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "remoteAddress"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 655
    :cond_0
    new-instance v0, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v0, v1, p1, v2, p2}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 657
    return-void
.end method

.method public static disconnect(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 5
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 780
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 781
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    sget-object v3, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    const/4 v4, 0x0

    invoke-direct {v2, p0, v0, v3, v4}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 783
    return-object v0
.end method

.method public static disconnect(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 797
    new-instance v0, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x0

    invoke-direct {v0, v1, p1, v2, v3}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 799
    return-void
.end method

.method public static failedFuture(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 153
    new-instance v0, Lorg/jboss/netty/channel/FailedChannelFuture;

    invoke-direct {v0, p0, p1}, Lorg/jboss/netty/channel/FailedChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method private static filterDownstreamInterestOps(I)I
    .locals 1
    .param p0, "interestOps"    # I

    .prologue
    .line 846
    and-int/lit8 v0, p0, -0x5

    return v0
.end method

.method public static fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V
    .locals 3
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 199
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v1, p0, v2, p1}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 202
    return-void
.end method

.method public static fireChannelBound(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 214
    new-instance v0, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v0, v1, v2, p1}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 216
    return-void
.end method

.method public static fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 468
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->OPEN:Lorg/jboss/netty/channel/ChannelState;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v1, p0, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 473
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 474
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-static {v0, p0}, Lorg/jboss/netty/channel/Channels;->fireChildChannelStateChanged(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/Channel;)V

    .line 476
    :cond_0
    return-void
.end method

.method public static fireChannelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 485
    new-instance v0, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->OPEN:Lorg/jboss/netty/channel/ChannelState;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 488
    return-void
.end method

.method public static fireChannelClosedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 454
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/Channels$6;

    invoke-direct {v1, p0}, Lorg/jboss/netty/channel/Channels$6;-><init>(Lorg/jboss/netty/channel/Channel;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static fireChannelConnected(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V
    .locals 3
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 227
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v1, p0, v2, p1}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 230
    return-void
.end method

.method public static fireChannelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 243
    new-instance v0, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    invoke-direct {v0, v1, v2, p1}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 245
    return-void
.end method

.method public static fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 396
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 399
    return-void
.end method

.method public static fireChannelDisconnected(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 408
    new-instance v0, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 410
    return-void
.end method

.method public static fireChannelDisconnectedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 383
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/Channels$4;

    invoke-direct {v1, p0}, Lorg/jboss/netty/channel/Channels$4;-><init>(Lorg/jboss/netty/channel/Channel;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static fireChannelInterestChanged(Lorg/jboss/netty/channel/Channel;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 358
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 361
    return-void
.end method

.method public static fireChannelInterestChanged(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 372
    new-instance v0, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 375
    return-void
.end method

.method public static fireChannelInterestChangedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 344
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/Channels$3;

    invoke-direct {v1, p0}, Lorg/jboss/netty/channel/Channels$3;-><init>(Lorg/jboss/netty/channel/Channel;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static fireChannelOpen(Lorg/jboss/netty/channel/Channel;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 166
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 167
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-static {v0, p0}, Lorg/jboss/netty/channel/Channels;->fireChildChannelStateChanged(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/Channel;)V

    .line 170
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->OPEN:Lorg/jboss/netty/channel/ChannelState;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v1, p0, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 173
    return-void
.end method

.method public static fireChannelOpen(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 186
    new-instance v0, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->OPEN:Lorg/jboss/netty/channel/ChannelState;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 188
    return-void
.end method

.method public static fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 432
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 434
    return-void
.end method

.method public static fireChannelUnbound(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 444
    new-instance v0, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 446
    return-void
.end method

.method public static fireChannelUnboundLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 418
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/Channels$5;

    invoke-direct {v1, p0}, Lorg/jboss/netty/channel/Channels$5;-><init>(Lorg/jboss/netty/channel/Channel;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method private static fireChildChannelStateChanged(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/Channel;)V
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "childChannel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 541
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/DefaultChildChannelStateEvent;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/channel/DefaultChildChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/Channel;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 543
    return-void
.end method

.method public static fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 525
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/DefaultExceptionEvent;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/channel/DefaultExceptionEvent;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 527
    return-void
.end method

.method public static fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 536
    new-instance v0, Lorg/jboss/netty/channel/DefaultExceptionEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/jboss/netty/channel/DefaultExceptionEvent;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 537
    return-void
.end method

.method public static fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 496
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/Channels$7;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/channel/Channels$7;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static fireExceptionCaughtLater(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 511
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/Channels$8;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/channel/Channels$8;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 255
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 256
    return-void
.end method

.method public static fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)V
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "message"    # Ljava/lang/Object;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 268
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/UpstreamMessageEvent;

    invoke-direct {v1, p0, p1, p2}, Lorg/jboss/netty/channel/UpstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 270
    return-void
.end method

.method public static fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 281
    new-instance v0, Lorg/jboss/netty/channel/UpstreamMessageEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lorg/jboss/netty/channel/UpstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 282
    return-void
.end method

.method public static fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V
    .locals 2
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "message"    # Ljava/lang/Object;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 296
    new-instance v0, Lorg/jboss/netty/channel/UpstreamMessageEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lorg/jboss/netty/channel/UpstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 298
    return-void
.end method

.method public static fireWriteComplete(Lorg/jboss/netty/channel/Channel;J)V
    .locals 3
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "amount"    # J

    .prologue
    .line 320
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 326
    :goto_0
    return-void

    .line 324
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/DefaultWriteCompletionEvent;

    invoke-direct {v1, p0, p1, p2}, Lorg/jboss/netty/channel/DefaultWriteCompletionEvent;-><init>(Lorg/jboss/netty/channel/Channel;J)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method

.method public static fireWriteComplete(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "amount"    # J

    .prologue
    .line 335
    new-instance v0, Lorg/jboss/netty/channel/DefaultWriteCompletionEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2}, Lorg/jboss/netty/channel/DefaultWriteCompletionEvent;-><init>(Lorg/jboss/netty/channel/Channel;J)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 336
    return-void
.end method

.method public static fireWriteCompleteLater(Lorg/jboss/netty/channel/Channel;J)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "amount"    # J

    .prologue
    .line 306
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/Channels$2;

    invoke-direct {v1, p0, p1, p2}, Lorg/jboss/netty/channel/Channels$2;-><init>(Lorg/jboss/netty/channel/Channel;J)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 121
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;Z)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static future(Lorg/jboss/netty/channel/Channel;Z)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "cancellable"    # Z

    .prologue
    .line 131
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelFuture;

    invoke-direct {v0, p0, p1}, Lorg/jboss/netty/channel/DefaultChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Z)V

    return-object v0
.end method

.method public static pipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    .locals 1

    .prologue
    .line 58
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline;

    invoke-direct {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;-><init>()V

    return-object v0
.end method

.method public static pipeline(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/ChannelPipeline;
    .locals 5
    .param p0, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 91
    invoke-static {}, Lorg/jboss/netty/channel/Channels;->pipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v2

    .line 92
    .local v2, "newPipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelPipeline;->toMap()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 93
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/channel/ChannelHandler;

    invoke-interface {v2, v3, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    goto :goto_0

    .line 95
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;>;"
    :cond_0
    return-object v2
.end method

.method public static varargs pipeline([Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelPipeline;
    .locals 5
    .param p0, "handlers"    # [Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 69
    if-nez p0, :cond_0

    .line 70
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "handlers"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 73
    :cond_0
    invoke-static {}, Lorg/jboss/netty/channel/Channels;->pipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v2

    .line 74
    .local v2, "newPipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_1

    .line 75
    aget-object v0, p0, v1

    .line 76
    .local v0, "h":Lorg/jboss/netty/channel/ChannelHandler;
    if-nez v0, :cond_2

    .line 81
    .end local v0    # "h":Lorg/jboss/netty/channel/ChannelHandler;
    :cond_1
    return-object v2

    .line 79
    .restart local v0    # "h":Lorg/jboss/netty/channel/ChannelHandler;
    :cond_2
    invoke-static {v1}, Lorg/jboss/netty/util/internal/ConversionUtil;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 74
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static pipelineFactory(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/ChannelPipelineFactory;
    .locals 1
    .param p0, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;

    .prologue
    .line 107
    new-instance v0, Lorg/jboss/netty/channel/Channels$1;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/Channels$1;-><init>(Lorg/jboss/netty/channel/ChannelPipeline;)V

    return-object v0
.end method

.method public static setInterestOps(Lorg/jboss/netty/channel/Channel;I)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 5
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "interestOps"    # I

    .prologue
    .line 741
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->validateInterestOps(I)V

    .line 742
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->filterDownstreamInterestOps(I)I

    move-result p1

    .line 744
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 745
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    sget-object v3, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, p0, v0, v3, v4}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 747
    return-object v0
.end method

.method public static setInterestOps(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;I)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "interestOps"    # I

    .prologue
    .line 762
    invoke-static {p2}, Lorg/jboss/netty/channel/Channels;->validateInterestOps(I)V

    .line 763
    invoke-static {p2}, Lorg/jboss/netty/channel/Channels;->filterDownstreamInterestOps(I)I

    move-result p2

    .line 765
    new-instance v0, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v0, v1, p1, v2, v3}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 768
    return-void
.end method

.method public static succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 139
    instance-of v0, p0, Lorg/jboss/netty/channel/AbstractChannel;

    if-eqz v0, :cond_0

    .line 140
    check-cast p0, Lorg/jboss/netty/channel/AbstractChannel;

    .end local p0    # "channel":Lorg/jboss/netty/channel/Channel;
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getSucceededFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 142
    .restart local p0    # "channel":Lorg/jboss/netty/channel/Channel;
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jboss/netty/channel/SucceededChannelFuture;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/SucceededChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0
.end method

.method public static unbind(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 5
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 612
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 613
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    sget-object v3, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    const/4 v4, 0x0

    invoke-direct {v2, p0, v0, v3, v4}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 615
    return-object v0
.end method

.method public static unbind(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 597
    new-instance v0, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/channel/ChannelState;->BOUND:Lorg/jboss/netty/channel/ChannelState;

    const/4 v3, 0x0

    invoke-direct {v0, v1, p1, v2, v3}, Lorg/jboss/netty/channel/DownstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 599
    return-void
.end method

.method private static validateInterestOps(I)V
    .locals 3
    .param p0, "interestOps"    # I

    .prologue
    .line 833
    packed-switch p0, :pswitch_data_0

    .line 840
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid interestOps: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 843
    :pswitch_1
    return-void

    .line 833
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static write(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 671
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public static write(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p1, "message"    # Ljava/lang/Object;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 703
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 704
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/DownstreamMessageEvent;

    invoke-direct {v2, p0, v0, p1, p2}, Lorg/jboss/netty/channel/DownstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 706
    return-object v0
.end method

.method public static write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V
    .locals 1
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "message"    # Ljava/lang/Object;

    .prologue
    .line 686
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 687
    return-void
.end method

.method public static write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V
    .locals 2
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "message"    # Ljava/lang/Object;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 725
    new-instance v0, Lorg/jboss/netty/channel/DownstreamMessageEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-direct {v0, v1, p1, p2, p3}, Lorg/jboss/netty/channel/DownstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 727
    return-void
.end method
