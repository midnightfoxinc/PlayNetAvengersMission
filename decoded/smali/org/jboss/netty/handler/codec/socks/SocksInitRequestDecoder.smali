.class public Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;
.super Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.source "SocksInitRequestDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$1;,
        Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;",
        ">;"
    }
.end annotation


# instance fields
.field private authSchemeNum:B

.field private final authSchemes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;",
            ">;"
        }
    .end annotation
.end field

.field private msg:Lorg/jboss/netty/handler/codec/socks/SocksRequest;

.field private version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;->CHECK_PROTOCOL_VERSION:Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;)V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->authSchemes:Ljava/util/List;

    .line 35
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->UNKNOWN_SOCKS_REQUEST:Lorg/jboss/netty/handler/codec/socks/SocksRequest;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksRequest;

    .line 39
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
    .line 30
    check-cast p4, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;)Ljava/lang/Object;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$socks$SocksInitRequestDecoder$State:[I

    invoke-virtual {p4}, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 62
    :cond_0
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    invoke-interface {v1, p0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 63
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksRequest;

    return-object v1

    .line 46
    :pswitch_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v1

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    .line 47
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    sget-object v2, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->SOCKS5:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    if-ne v1, v2, :cond_0

    .line 50
    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;->READ_AUTH_SCHEMES:Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder$State;

    invoke-virtual {p0, v1}, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 53
    :pswitch_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->authSchemes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 54
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v1

    iput-byte v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->authSchemeNum:B

    .line 55
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-byte v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->authSchemeNum:B

    if-ge v0, v1, :cond_1

    .line 56
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->authSchemes:Ljava/util/List;

    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v2

    invoke-static {v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 58
    :cond_1
    new-instance v1, Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->authSchemes:Ljava/util/List;

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;-><init>(Ljava/util/List;)V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequestDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksRequest;

    goto :goto_0

    .line 44
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
