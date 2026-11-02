.class public Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;
.super Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.source "SocksAuthResponseDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$1;,
        Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;",
        ">;"
    }
.end annotation


# instance fields
.field private authStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

.field private msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

.field private version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;->CHECK_PROTOCOL_VERSION:Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;)V

    .line 31
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->UNKNOWN_SOCKS_RESPONSE:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    .line 35
    return-void
.end method


# virtual methods
.method protected bridge synthetic decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x2"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "x3"    # Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 27
    check-cast p4, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;)Ljava/lang/Object;
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$socks$SocksAuthResponseDecoder$State:[I

    invoke-virtual {p4}, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 53
    :cond_0
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 54
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    return-object v0

    .line 42
    :pswitch_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    .line 43
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;->AUTH_PASSWORD:Lorg/jboss/netty/handler/codec/socks/SocksMessage$SubnegotiationVersion;

    if-ne v0, v1, :cond_0

    .line 46
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;->READ_AUTH_RESPONSE:Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder$State;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 49
    :pswitch_1
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;->fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->authStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    .line 50
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponse;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->authStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponse;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthStatus;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksAuthResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    goto :goto_0

    .line 40
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
