.class public abstract Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;
.super Ljava/lang/Object;
.source "OneToOneDecoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method


# virtual methods
.method protected abstract decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 59
    instance-of v3, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-nez v3, :cond_1

    .line 60
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 72
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v1, p2

    .line 64
    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 65
    .local v1, "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    .line 66
    .local v2, "originalMessage":Ljava/lang/Object;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-virtual {p0, p1, v3, v2}, Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 67
    .local v0, "decodedMessage":Ljava/lang/Object;
    if-ne v2, v0, :cond_2

    .line 68
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 69
    :cond_2
    if-eqz v0, :cond_0

    .line 70
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-static {p1, v0, v3}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_0
.end method
