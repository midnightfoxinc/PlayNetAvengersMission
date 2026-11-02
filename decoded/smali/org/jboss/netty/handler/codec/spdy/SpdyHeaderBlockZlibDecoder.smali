.class final Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;
.super Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;
.source "SpdyHeaderBlockZlibDecoder.java"


# static fields
.field private static final DEFAULT_BUFFER_CAPACITY:I = 0x1000

.field private static final INVALID_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;


# instance fields
.field private decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private final decompressor:Ljava/util/zip/Inflater;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 29
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    const-string v1, "Invalid Header Block"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->INVALID_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    return-void
.end method

.method constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V
    .locals 1
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "maxHeaderSize"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V

    .line 32
    new-instance v0, Ljava/util/zip/Inflater;

    invoke-direct {v0}, Ljava/util/zip/Inflater;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    .line 38
    return-void
.end method

.method private decompress(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)I
    .locals 6
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->ensureBuffer()V

    .line 82
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v3

    .line 83
    .local v3, "out":[B
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v5

    add-int v2, v4, v5

    .line 85
    .local v2, "off":I
    :try_start_0
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v5

    invoke-virtual {v4, v3, v2, v5}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v1

    .line 86
    .local v1, "numBytes":I
    if-nez v1, :cond_0

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    invoke-virtual {v4}, Ljava/util/zip/Inflater;->needsDictionary()Z
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-eqz v4, :cond_0

    .line 88
    :try_start_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    sget-object v5, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->SPDY_DICT:[B

    invoke-virtual {v4, v5}, Ljava/util/zip/Inflater;->setDictionary([B)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 92
    :try_start_2
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v5

    invoke-virtual {v4, v3, v2, v5}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v1

    .line 95
    :cond_0
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v5

    add-int/2addr v5, v1

    invoke-interface {v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 96
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-super {p0, v4, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->decodeHeaderBlock(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 97
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->discardReadBytes()V

    .line 99
    return v1

    .line 89
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->INVALID_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    throw v4
    :try_end_2
    .catch Ljava/util/zip/DataFormatException; {:try_start_2 .. :try_end_2} :catch_1

    .line 100
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v1    # "numBytes":I
    :catch_1
    move-exception v0

    .line 101
    .local v0, "e":Ljava/util/zip/DataFormatException;
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->INVALID_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    throw v4
.end method

.method private ensureBuffer()V
    .locals 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v0, :cond_0

    .line 107
    const/16 v0, 0x1000

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 109
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->ensureWritableBytes(I)V

    .line 110
    return-void
.end method

.method private setInput(Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 6
    .param p1, "compressed"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 67
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 69
    .local v1, "len":I
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 70
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v3

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v4

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 77
    :goto_0
    return v1

    .line 72
    :cond_0
    new-array v0, v1, [B

    .line 73
    .local v0, "in":[B
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    invoke-interface {p1, v2, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[B)V

    .line 74
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v2, v0, v3, v4}, Ljava/util/zip/Inflater;->setInput([BII)V

    goto :goto_0
.end method


# virtual methods
.method decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 4
    .param p1, "headerBlock"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    if-nez p1, :cond_0

    .line 43
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "headerBlock"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 45
    :cond_0
    if-nez p2, :cond_1

    .line 46
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "frame"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 49
    :cond_1
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->setInput(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v0

    .line 53
    .local v0, "len":I
    :cond_2
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompress(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)I

    move-result v1

    .line 54
    .local v1, "numBytes":I
    if-gtz v1, :cond_2

    .line 58
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v2

    if-eqz v2, :cond_3

    .line 60
    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->INVALID_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    throw v2

    .line 63
    :cond_3
    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 64
    return-void
.end method

.method public end()V
    .locals 1

    .prologue
    .line 120
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->end()V

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 122
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressor:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 123
    return-void
.end method

.method endHeaderBlock(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 1
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 114
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->endHeaderBlock(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 115
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockZlibDecoder;->decompressed:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 116
    return-void
.end method
