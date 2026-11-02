.class Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;
.super Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;
.source "SpdyHeaderBlockZlibEncoder.java"


# instance fields
.field private final compressor:Ljava/util/zip/Deflater;

.field private finished:Z


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V
    .locals 3
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "compressionLevel"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V

    .line 33
    if-ltz p2, :cond_0

    const/16 v0, 0x9

    if-le p2, v0, :cond_1

    .line 34
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "compressionLevel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 0-9)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_1
    new-instance v0, Ljava/util/zip/Deflater;

    invoke-direct {v0, p2}, Ljava/util/zip/Deflater;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->compressor:Ljava/util/zip/Deflater;

    .line 38
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->compressor:Ljava/util/zip/Deflater;

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->SPDY_DICT:[B

    invoke-virtual {v0, v1}, Ljava/util/zip/Deflater;->setDictionary([B)V

    .line 39
    return-void
.end method

.method private compressInto(Lorg/jboss/netty/buffer/ChannelBuffer;)Z
    .locals 6
    .param p1, "compressed"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 63
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v2

    .line 64
    .local v2, "out":[B
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v5

    add-int v1, v4, v5

    .line 65
    .local v1, "off":I
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v3

    .line 66
    .local v3, "toWrite":I
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->compressor:Ljava/util/zip/Deflater;

    const/4 v5, 0x2

    invoke-virtual {v4, v2, v1, v3, v5}, Ljava/util/zip/Deflater;->deflate([BIII)I

    move-result v0

    .line 67
    .local v0, "numBytes":I
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v4

    add-int/2addr v4, v0

    invoke-interface {p1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 68
    if-ne v0, v3, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private encode(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "compressed"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 56
    :goto_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->compressInto(Lorg/jboss/netty/buffer/ChannelBuffer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->ensureWritableBytes(I)V

    goto :goto_0

    .line 60
    :cond_0
    return-void
.end method

.method private setInput(Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 6
    .param p1, "decompressed"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 42
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 44
    .local v1, "len":I
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 45
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->compressor:Ljava/util/zip/Deflater;

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v3

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 52
    :goto_0
    return v1

    .line 47
    :cond_0
    new-array v0, v1, [B

    .line 48
    .local v0, "in":[B
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    invoke-interface {p1, v2, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[B)V

    .line 49
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->compressor:Ljava/util/zip/Deflater;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v2, v0, v3, v4}, Ljava/util/zip/Deflater;->setInput([BII)V

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 5
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 73
    monitor-enter p0

    if-nez p1, :cond_0

    .line 74
    :try_start_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "frame"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 77
    :cond_0
    :try_start_1
    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->finished:Z

    if-eqz v3, :cond_1

    .line 78
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    :goto_0
    monitor-exit p0

    return-object v0

    .line 81
    :cond_1
    :try_start_2
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 82
    .local v1, "decompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    if-nez v3, :cond_2

    .line 83
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 86
    :cond_2
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    invoke-static {v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 87
    .local v0, "compressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->setInput(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v2

    .line 88
    .local v2, "len":I
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 89
    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized end()V
    .locals 1

    .prologue
    .line 96
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->finished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 102
    :goto_0
    monitor-exit p0

    return-void

    .line 99
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->finished:Z

    .line 100
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibEncoder;->compressor:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 101
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->end()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
