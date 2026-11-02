.class Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;
.super Ljava/lang/Object;
.source "ChannelBufferByteInput.java"

# interfaces
.implements Lorg/jboss/marshalling/ByteInput;


# instance fields
.field private final buffer:Lorg/jboss/netty/buffer/ChannelBuffer;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 0
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 34
    return-void
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    return-void
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    .line 48
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "array"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 2
    .param p1, "dst"    # [B
    .param p2, "dstIndex"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->available()I

    move-result v0

    .line 57
    .local v0, "available":I
    if-nez v0, :cond_0

    .line 58
    const/4 v1, -0x1

    .line 63
    :goto_0
    return v1

    .line 61
    :cond_0
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 62
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v1, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([BII)V

    move v1, p3

    .line 63
    goto :goto_0
.end method

.method public skip(J)J
    .locals 5
    .param p1, "bytes"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    .line 68
    .local v0, "readable":I
    int-to-long v2, v0

    cmp-long v1, v2, p1

    if-gez v1, :cond_0

    .line 69
    int-to-long p1, v0

    .line 71
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteInput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v2, p1

    long-to-int v2, v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 72
    return-wide p1
.end method
