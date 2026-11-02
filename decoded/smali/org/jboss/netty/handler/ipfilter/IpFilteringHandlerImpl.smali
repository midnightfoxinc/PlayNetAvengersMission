.class public abstract Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;
.super Ljava/lang/Object;
.source "IpFilteringHandlerImpl.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;
.implements Lorg/jboss/netty/handler/ipfilter/IpFilteringHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl$1;
    }
.end annotation


# instance fields
.field private listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    return-void
.end method


# virtual methods
.method protected abstract accept(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected continues(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/handler/ipfilter/IpFilterListener;->continues(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z

    move-result v0

    .line 94
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected handleAllowedChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p3, "inetSocketAddress"    # Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    if-nez v0, :cond_0

    .line 66
    const/4 v0, 0x0

    .line 68
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/handler/ipfilter/IpFilterListener;->allowed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    goto :goto_0
.end method

.method protected handleRefusedChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p3, "inetSocketAddress"    # Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    if-nez v0, :cond_0

    .line 58
    const/4 v0, 0x0

    .line 60
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/handler/ipfilter/IpFilterListener;->refused(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    goto :goto_0
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 99
    instance-of v3, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v3, :cond_0

    move-object v0, p2

    .line 100
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 101
    .local v0, "evt":Lorg/jboss/netty/channel/ChannelStateEvent;
    sget-object v3, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl$1;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 149
    .end local v0    # "evt":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    :goto_0
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->isBlocked(Lorg/jboss/netty/channel/ChannelHandlerContext;)Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->continues(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 155
    :cond_1
    :goto_1
    return-void

    .line 104
    .restart local v0    # "evt":Lorg/jboss/netty/channel/ChannelStateEvent;
    :pswitch_0
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-eq v3, v4, :cond_2

    .line 105
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_1

    .line 111
    :cond_2
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->isBlocked(Lorg/jboss/netty/channel/ChannelHandlerContext;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->continues(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 115
    :cond_3
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_1

    .line 119
    :pswitch_1
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 121
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    check-cast v2, Ljava/net/InetSocketAddress;

    .line 122
    .local v2, "inetSocketAddress":Ljava/net/InetSocketAddress;
    invoke-virtual {p0, p1, p2, v2}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->accept(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 123
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p1, v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 124
    invoke-virtual {p0, p1, p2, v2}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->handleRefusedChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 125
    .local v1, "future":Lorg/jboss/netty/channel/ChannelFuture;
    if-eqz v1, :cond_5

    .line 126
    sget-object v3, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v1, v3}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 130
    :goto_2
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->isBlocked(Lorg/jboss/netty/channel/ChannelHandlerContext;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->continues(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 138
    .end local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_4
    :goto_3
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    goto :goto_0

    .line 128
    .restart local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_5
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-static {v3}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2

    .line 135
    .end local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_6
    invoke-virtual {p0, p1, p2, v2}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->handleAllowedChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;Ljava/net/InetSocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_3

    .line 141
    .end local v2    # "inetSocketAddress":Ljava/net/InetSocketAddress;
    :cond_7
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->isBlocked(Lorg/jboss/netty/channel/ChannelHandlerContext;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->continues(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 154
    .end local v0    # "evt":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_8
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_1

    .line 101
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected isBlocked(Lorg/jboss/netty/channel/ChannelHandlerContext;)Z
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 77
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeIpFilterListener()V
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    .line 163
    return-void
.end method

.method public setIpFilterListener(Lorg/jboss/netty/handler/ipfilter/IpFilterListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/jboss/netty/handler/ipfilter/IpFilteringHandlerImpl;->listener:Lorg/jboss/netty/handler/ipfilter/IpFilterListener;

    .line 159
    return-void
.end method
