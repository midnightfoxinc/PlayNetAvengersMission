.class public final Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;
.super Lorg/jboss/netty/handler/codec/socks/SocksRequest;
.source "SocksCmdRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest$1;
    }
.end annotation


# instance fields
.field private final addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

.field private final cmdType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

.field private final host:Ljava/lang/String;

.field private final port:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;Ljava/lang/String;I)V
    .locals 3
    .param p1, "cmdType"    # Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    .param p2, "addressType"    # Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I

    .prologue
    .line 37
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;->CMD:Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksRequest;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;)V

    .line 38
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v0

    const/4 v1, 0x6

    if-ge v0, v1, :cond_0

    .line 39
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Only supported with Java version 6+"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_0
    if-nez p1, :cond_1

    .line 42
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cmdType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_1
    if-nez p2, :cond_2

    .line 45
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "addressType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_2
    if-nez p3, :cond_3

    .line 48
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "host"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_3
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest$1;->$SwitchMap$org$jboss$netty$handler$codec$socks$SocksMessage$AddressType:[I

    invoke-virtual {p2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 69
    :cond_4
    if-lez p4, :cond_5

    const/high16 v0, 0x10000

    if-lt p4, v0, :cond_6

    .line 70
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not in bounds 0 < x < 65536"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :pswitch_0
    invoke-static {p3}, Lorg/jboss/netty/util/NetUtil;->isValidIpV4Address(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 53
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a valid IPv4 address"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :pswitch_1
    invoke-static {p3}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-le v0, v1, :cond_4

    .line 58
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " IDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " exceeds 255 char limit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :pswitch_2
    invoke-static {p3}, Lorg/jboss/netty/util/NetUtil;->isValidIpV6Address(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 63
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a valid IPv6 address"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_6
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->cmdType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    .line 73
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    .line 74
    invoke-static {p3}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->host:Ljava/lang/String;

    .line 75
    iput p4, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->port:I

    .line 76
    return-void

    .line 50
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public encodeAsByteBuf(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p1, "channelBuffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->getProtocolVersion()Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 109
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->cmdType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 110
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 111
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 112
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest$1;->$SwitchMap$org$jboss$netty$handler$codec$socks$SocksMessage$AddressType:[I

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 132
    :goto_0
    return-void

    .line 114
    :pswitch_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->host:Ljava/lang/String;

    invoke-static {v0}, Lorg/jboss/netty/util/NetUtil;->createByteArrayFromIpAddressString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 115
    iget v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->port:I

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    goto :goto_0

    .line 120
    :pswitch_1
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->host:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 121
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->host:Ljava/lang/String;

    const-string v1, "US-ASCII"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 122
    iget v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->port:I

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    goto :goto_0

    .line 127
    :pswitch_2
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->host:Ljava/lang/String;

    invoke-static {v0}, Lorg/jboss/netty/util/NetUtil;->createByteArrayFromIpAddressString(Ljava/lang/String;)[B

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 128
    iget v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->port:I

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    goto :goto_0

    .line 112
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getAddressType()Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    return-object v0
.end method

.method public getCmdType()Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->cmdType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdType;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->host:Ljava/lang/String;

    invoke-static {v0}, Ljava/net/IDN;->toUnicode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdRequest;->port:I

    return v0
.end method
