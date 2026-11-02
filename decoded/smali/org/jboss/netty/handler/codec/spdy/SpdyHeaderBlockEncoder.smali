.class abstract Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;
.super Ljava/lang/Object;
.source "SpdyHeaderBlockEncoder.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static newInstance(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;III)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;
    .locals 2
    .param p0, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p1, "compressionLevel"    # I
    .param p2, "windowBits"    # I
    .param p3, "memLevel"    # I

    .prologue
    .line 26
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v0

    const/4 v1, 0x7

    if-lt v0, v1, :cond_0

    .line 27
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;

    invoke-direct {v0, p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V

    .line 30
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;III)V

    goto :goto_0
.end method


# virtual methods
.method abstract encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method abstract end()V
.end method
