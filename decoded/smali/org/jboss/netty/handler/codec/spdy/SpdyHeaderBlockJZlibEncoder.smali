.class Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;
.super Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;
.source "SpdyHeaderBlockJZlibEncoder.java"


# instance fields
.field private finished:Z

.field private final z:Lorg/jboss/netty/util/internal/jzlib/ZStream;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;III)V
    .locals 4
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "compressionLevel"    # I
    .param p3, "windowBits"    # I
    .param p4, "memLevel"    # I

    .prologue
    const/16 v2, 0x9

    .line 34
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V

    .line 28
    new-instance v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-direct {v1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .line 35
    if-ltz p2, :cond_0

    if-le p2, v2, :cond_1

    .line 36
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "compressionLevel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 0-9)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_1
    if-lt p3, v2, :cond_2

    const/16 v1, 0xf

    if-le p3, v1, :cond_3

    .line 40
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "windowBits: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 9-15)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 43
    :cond_3
    const/4 v1, 0x1

    if-lt p4, v1, :cond_4

    if-le p4, v2, :cond_5

    .line 44
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "memLevel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 1-9)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    :cond_5
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    sget-object v2, Lorg/jboss/netty/util/internal/jzlib/JZlib;->W_ZLIB:Ljava/lang/Enum;

    invoke-virtual {v1, p2, p3, p4, v2}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateInit(IIILjava/lang/Enum;)I

    move-result v0

    .line 50
    .local v0, "resultCode":I
    if-eqz v0, :cond_6

    .line 51
    new-instance v1, Lorg/jboss/netty/handler/codec/compression/CompressionException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to initialize an SPDY header block deflater: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/compression/CompressionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_6
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->SPDY_DICT:[B

    sget-object v3, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->SPDY_DICT:[B

    array-length v3, v3

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateSetDictionary([BI)I

    move-result v0

    .line 55
    if-eqz v0, :cond_7

    .line 56
    new-instance v1, Lorg/jboss/netty/handler/codec/compression/CompressionException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to set the SPDY dictionary: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/compression/CompressionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_7
    return-void
.end method

.method private encode(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 7
    .param p1, "compressed"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v6, 0x0

    .line 72
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget-object v2, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    array-length v2, v2

    int-to-double v2, v2

    const-wide v4, 0x3ff004189374bc6aL    # 1.001

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    add-int/lit8 v2, v2, 0xc

    new-array v0, v2, [B

    .line 73
    .local v0, "out":[B
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v0, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 74
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v3, 0x0

    iput v3, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    .line 75
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v3, v0

    iput v3, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 77
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflate(I)I

    move-result v1

    .line 78
    .local v1, "resultCode":I
    if-eqz v1, :cond_0

    .line 79
    new-instance v2, Lorg/jboss/netty/handler/codec/compression/CompressionException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "compression failure: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/compression/CompressionException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .end local v0    # "out":[B
    .end local v1    # "resultCode":I
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v6, v3, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 91
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v6, v3, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 90
    throw v2

    .line 82
    .restart local v0    # "out":[B
    .restart local v1    # "resultCode":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v2, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    if-eqz v2, :cond_1

    .line 83
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v3, v3, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    invoke-interface {p1, v0, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v6, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 91
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v6, v2, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 93
    return-void
.end method

.method private setInput(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 3
    .param p1, "decompressed"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 63
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    new-array v0, v1, [B

    .line 64
    .local v0, "in":[B
    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 65
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v0, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 66
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v2, 0x0

    iput v2, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 67
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v2, v0

    iput v2, v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 68
    return-void
.end method


# virtual methods
.method public declared-synchronized encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    monitor-enter p0

    if-nez p1, :cond_0

    .line 98
    :try_start_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "frame"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 101
    :cond_0
    :try_start_1
    iget-boolean v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->finished:Z

    if-eqz v2, :cond_1

    .line 102
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    :goto_0
    monitor-exit p0

    return-object v0

    .line 105
    :cond_1
    :try_start_2
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 106
    .local v1, "decompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    if-nez v2, :cond_2

    .line 107
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 110
    :cond_2
    invoke-static {}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 111
    .local v0, "compressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->setInput(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 112
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized end()V
    .locals 2

    .prologue
    .line 118
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->finished:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 125
    :goto_0
    monitor-exit p0

    return-void

    .line 121
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->finished:Z

    .line 122
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateEnd()I

    .line 123
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 124
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockJZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 118
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
