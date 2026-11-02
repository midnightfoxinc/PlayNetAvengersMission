.class public Lorg/jboss/netty/handler/ipfilter/OneIpFilterHandler;
.super Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;
.source "OneIpFilterHandler.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# instance fields
.field private final connectedSet:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/net/InetAddress;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;-><init>()V

    .line 41
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/ipfilter/OneIpFilterHandler;->connectedSet:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method


# virtual methods
.method protected accept(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Z
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p3, "inetSocketAddress"    # Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    invoke-virtual {p3}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 47
    .local v0, "inetAddress":Ljava/net/InetAddress;
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/OneIpFilterHandler;->connectedSet:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 48
    const/4 v1, 0x0

    .line 51
    :goto_0
    return v1

    .line 50
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/OneIpFilterHandler;->connectedSet:Ljava/util/concurrent/ConcurrentMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, v0, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 58
    instance-of v2, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v2, :cond_0

    move-object v0, p2

    .line 59
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 60
    .local v0, "evt":Lorg/jboss/netty/channel/ChannelStateEvent;
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v2

    sget-object v3, Lorg/jboss/netty/channel/ChannelState;->CONNECTED:Lorg/jboss/netty/channel/ChannelState;

    if-ne v2, v3, :cond_0

    .line 61
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 63
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/OneIpFilterHandler;->isBlocked(Lorg/jboss/netty/channel/ChannelHandlerContext;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 65
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v1

    check-cast v1, Ljava/net/InetSocketAddress;

    .line 66
    .local v1, "inetSocketAddress":Ljava/net/InetSocketAddress;
    iget-object v2, p0, Lorg/jboss/netty/handler/ipfilter/OneIpFilterHandler;->connectedSet:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .end local v0    # "evt":Lorg/jboss/netty/channel/ChannelStateEvent;
    .end local v1    # "inetSocketAddress":Ljava/net/InetSocketAddress;
    :cond_0
    return-void
.end method
