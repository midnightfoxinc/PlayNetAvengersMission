.class public final Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;
.super Lorg/jboss/netty/handler/codec/socks/SocksResponse;
.source "SocksCmdResponse.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse$1;
    }
.end annotation


# static fields
.field private static final IPv4_HOSTNAME_ZEROED:[B

.field private static final IPv6_HOSTNAME_ZEROED:[B


# instance fields
.field private final addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

.field private final cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->IPv4_HOSTNAME_ZEROED:[B

    .line 32
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->IPv6_HOSTNAME_ZEROED:[B

    return-void

    .line 31
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 32
    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;)V
    .locals 2
    .param p1, "cmdStatus"    # Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;
    .param p2, "addressType"    # Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    .prologue
    .line 38
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksResponse$SocksResponseType;->CMD:Lorg/jboss/netty/handler/codec/socks/SocksResponse$SocksResponseType;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksResponse;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksResponse$SocksResponseType;)V

    .line 39
    if-nez p1, :cond_0

    .line 40
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cmdStatus"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    if-nez p2, :cond_1

    .line 43
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "addressType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    .line 46
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    .line 47
    return-void
.end method


# virtual methods
.method public encodeAsByteBuf(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 3
    .param p1, "channelBuffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 70
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 71
    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 72
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 73
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse$1;->$SwitchMap$org$jboss$netty$handler$codec$socks$SocksMessage$AddressType:[I

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 91
    :goto_0
    return-void

    .line 75
    :pswitch_0
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->IPv4_HOSTNAME_ZEROED:[B

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 76
    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    goto :goto_0

    .line 80
    :pswitch_1
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 81
    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 82
    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    goto :goto_0

    .line 86
    :pswitch_2
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->IPv6_HOSTNAME_ZEROED:[B

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 87
    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    goto :goto_0

    .line 73
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
    .line 64
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->addressType:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AddressType;

    return-object v0
.end method

.method public getCmdStatus()Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksCmdResponse;->cmdStatus:Lorg/jboss/netty/handler/codec/socks/SocksMessage$CmdStatus;

    return-object v0
.end method
