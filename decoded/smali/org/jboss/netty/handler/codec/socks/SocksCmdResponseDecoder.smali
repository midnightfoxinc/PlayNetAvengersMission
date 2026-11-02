.class public Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;
.super Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.source "SocksCmdResponseDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$1;,
        Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
        "<",
        "Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;",
        ">;"
    }
.end annotation


# instance fields
.field private addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

.field private cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

.field private fieldLength:I

.field private host:Ljava/lang/String;

.field private msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

.field private port:I

.field private reserved:B

.field private version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;->CHECK_PROTOCOL_VERSION:Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;)V

    .line 37
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->UNKNOWN_SOCKS_RESPONSE:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    .line 41
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
    .line 28
    check-cast p4, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;)Ljava/lang/Object;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$socks$SocksCmdResponseDecoder$State:[I

    invoke-virtual {p4}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 86
    :cond_0
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 87
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    return-object v0

    .line 48
    :pswitch_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    .line 49
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->version:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    sget-object v1, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->SOCKS5:Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    if-ne v0, v1, :cond_0

    .line 52
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;->READ_CMD_HEADER:Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 55
    :pswitch_1
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;->fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    .line 56
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    iput-byte v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->reserved:B

    .line 57
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;->fromByte(B)Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    .line 58
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;->READ_CMD_ADDRESS:Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$State;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 61
    :pswitch_2
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$socks$SocksMessage$AddressType:[I

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 63
    :pswitch_3
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readInt()I

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->intToIp(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->host:Ljava/lang/String;

    .line 64
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->port:I

    .line 65
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    goto :goto_0

    .line 69
    :pswitch_4
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->fieldLength:I

    .line 70
    iget v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->fieldLength:I

    invoke-interface {p3, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->host:Ljava/lang/String;

    .line 71
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->port:I

    .line 72
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    goto/16 :goto_0

    .line 76
    :pswitch_5
    const/16 v0, 0x10

    invoke-interface {p3, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/socks/SocksCommonUtils;->ipv6toStr([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->host:Ljava/lang/String;

    .line 77
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->port:I

    .line 78
    new-instance v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponseDecoder;->msg:Lorg/jboss/netty/handler/codec/socks/SocksResponse;

    goto/16 :goto_0

    .line 46
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 61
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
