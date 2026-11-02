.class public final Lorg/jboss/netty/handler/codec/socks/UnknownSocksRequest;
.super Lorg/jboss/netty/handler/codec/socks/SocksRequest;
.source "UnknownSocksRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;->UNKNOWN:Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/socks/SocksRequest;-><init>(Lorg/jboss/netty/handler/codec/socks/SocksRequest$SocksRequestType;)V

    .line 31
    return-void
.end method


# virtual methods
.method public encodeAsByteBuf(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 0
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 36
    return-void
.end method
