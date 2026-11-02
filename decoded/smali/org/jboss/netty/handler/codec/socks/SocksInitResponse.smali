.class public final Lorg/jboss/netty/handler/codec/socks/SocksInitResponse;
.super Lorg/jboss/netty/handler/codec/socks/SocksResponse;
.source "SocksInitResponse.java"


# instance fields
.field private final authScheme:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;)V
    .locals 2
    .param p1, "authScheme"    # Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    .prologue
    .line 30
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksResponse$SocksResponseType;->INIT:Lorg/jboss/netty/handler/codec/socks/SocksResponse$SocksResponseType;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksResponse;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksResponse$SocksResponseType;)V

    .line 31
    if-nez p1, :cond_0

    .line 32
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "authScheme"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitResponse;->authScheme:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    .line 35
    return-void
.end method


# virtual methods
.method public encodeAsByteBuf(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "channelBuffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 46
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/socks/SocksInitResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 47
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitResponse;->authScheme:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->getByteValue()B

    move-result v0

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 48
    return-void
.end method

.method public getAuthScheme()Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitResponse;->authScheme:Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    return-object v0
.end method
