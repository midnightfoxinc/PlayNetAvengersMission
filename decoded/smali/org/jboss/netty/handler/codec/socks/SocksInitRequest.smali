.class public final Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;
.super Lorg/jboss/netty/handler/codec/socks/SocksRequest;
.source "SocksInitRequest.java"


# instance fields
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


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p1, "authSchemes":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;>;"
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;->INIT:Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksRequest;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;)V

    .line 34
    if-nez p1, :cond_0

    .line 35
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "authSchemes"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;->authSchemes:Ljava/util/List;

    .line 38
    return-void
.end method


# virtual methods
.method public encodeAsByteBuf(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 3
    .param p1, "channelBuffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;->getProtocolVersion()Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$ProtocolVersion;->getByteValue()B

    move-result v2

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 51
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;->authSchemes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 52
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;->authSchemes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;

    .line 53
    .local v0, "authScheme":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;->getByteValue()B

    move-result v2

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    goto :goto_0

    .line 55
    .end local v0    # "authScheme":Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;
    :cond_0
    return-void
.end method

.method public getAuthSchemes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/socks/SocksMessage$AuthScheme;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/socks/SocksInitRequest;->authSchemes:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
