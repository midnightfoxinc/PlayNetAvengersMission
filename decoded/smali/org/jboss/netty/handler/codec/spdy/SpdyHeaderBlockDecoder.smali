.class abstract Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;
.super Ljava/lang/Object;
.source "SpdyHeaderBlockDecoder.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newInstance(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;
    .locals 1
    .param p0, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p1, "maxHeaderSize"    # I

    .prologue
    .line 23
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;

    invoke-direct {v0, p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V

    return-object v0
.end method


# virtual methods
.method abstract decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method abstract end()V
.end method

.method abstract endHeaderBlock(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
