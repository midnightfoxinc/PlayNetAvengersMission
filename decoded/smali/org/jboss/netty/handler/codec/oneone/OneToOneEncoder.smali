.class public abstract Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.super Ljava/lang/Object;
.source "OneToOneEncoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method


# virtual methods
.method protected doEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)Z
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    .line 66
    .local v1, "originalMessage":Ljava/lang/Object;
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {p0, p1, v2, v1}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;->encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 67
    .local v0, "encodedMessage":Ljava/lang/Object;
    if-ne v1, v0, :cond_0

    .line 68
    const/4 v2, 0x0

    .line 73
    :goto_0
    return v2

    .line 70
    :cond_0
    if-eqz v0, :cond_1

    .line 71
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-static {p1, v2, v0, v3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 73
    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method protected abstract encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 53
    instance-of v1, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-nez v1, :cond_1

    .line 54
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 62
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v0, p2

    .line 58
    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    .line 59
    .local v0, "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;->doEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 60
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method
