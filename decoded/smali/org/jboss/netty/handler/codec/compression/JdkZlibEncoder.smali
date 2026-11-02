.class public Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;
.source "JdkZlibEncoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;
    }
.end annotation


# static fields
.field private static final gzipHeader:[B


# instance fields
.field private final crc:Ljava/util/zip/CRC32;

.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private final deflater:Ljava/util/zip/Deflater;

.field private final finished:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private out:[B

.field private final wrapper:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

.field private writeHeader:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/16 v0, 0xa

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->gzipHeader:[B

    return-void

    :array_0
    .array-data 1
        0x1ft
        -0x75t
        0x8t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;-><init>(I)V

    .line 60
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "compressionLevel"    # I

    .prologue
    .line 74
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;I)V

    .line 75
    return-void
.end method

.method public constructor <init>(I[B)V
    .locals 3
    .param p1, "compressionLevel"    # I
    .param p2, "dictionary"    # [B

    .prologue
    .line 149
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->writeHeader:Z

    .line 150
    if-ltz p1, :cond_0

    const/16 v0, 0x9

    if-le p1, v0, :cond_1

    .line 151
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "compressionLevel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 0-9)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 154
    :cond_1
    if-nez p2, :cond_2

    .line 155
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dictionary"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 158
    :cond_2
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->wrapper:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    .line 159
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->crc:Ljava/util/zip/CRC32;

    .line 160
    new-instance v0, Ljava/util/zip/Deflater;

    invoke-direct {v0, p1}, Ljava/util/zip/Deflater;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    .line 161
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0, p2}, Ljava/util/zip/Deflater;->setDictionary([B)V

    .line 162
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)V
    .locals 1
    .param p1, "wrapper"    # Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    .prologue
    .line 84
    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;I)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;I)V
    .locals 3
    .param p1, "wrapper"    # Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;
    .param p2, "compressionLevel"    # I

    .prologue
    const/4 v0, 0x1

    .line 98
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;-><init>()V

    .line 44
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 50
    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->writeHeader:Z

    .line 99
    if-ltz p2, :cond_0

    const/16 v1, 0x9

    if-le p2, v1, :cond_1

    .line 100
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

    .line 103
    :cond_1
    if-nez p1, :cond_2

    .line 104
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "wrapper"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_2
    sget-object v1, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB_OR_NONE:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    if-ne p1, v1, :cond_3

    .line 107
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wrapper \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB_OR_NONE:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' is not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "allowed for compression."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_3
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->wrapper:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    .line 113
    new-instance v1, Ljava/util/zip/Deflater;

    sget-object v2, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    if-eq p1, v2, :cond_4

    :goto_0
    invoke-direct {v1, p2, v0}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    .line 114
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->GZIP:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    if-ne p1, v0, :cond_5

    .line 115
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->crc:Ljava/util/zip/CRC32;

    .line 119
    :goto_1
    return-void

    .line 113
    :cond_4
    const/4 v0, 0x0

    goto :goto_0

    .line 117
    :cond_5
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->crc:Ljava/util/zip/CRC32;

    goto :goto_1
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "dictionary"    # [B

    .prologue
    .line 132
    const/4 v0, 0x6

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;-><init>(I[B)V

    .line 133
    return-void
.end method

.method private deflate(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 8
    .param p1, "out"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v7, 0x2

    const/4 v5, 0x0

    .line 307
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 309
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v2

    .line 310
    .local v2, "writerIndex":I
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v4

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v5

    add-int/2addr v5, v2

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v6

    invoke-virtual {v3, v4, v5, v6, v7}, Ljava/util/zip/Deflater;->deflate([BIII)I

    move-result v0

    .line 313
    .local v0, "numBytes":I
    add-int v3, v2, v0

    invoke-interface {p1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 314
    if-gtz v0, :cond_0

    .line 326
    .end local v2    # "writerIndex":I
    :goto_0
    return-void

    .line 316
    .end local v0    # "numBytes":I
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->out:[B

    .line 317
    .local v1, "tmpOut":[B
    if-nez v1, :cond_2

    .line 318
    const/16 v3, 0x2000

    new-array v1, v3, [B

    .end local v1    # "tmpOut":[B
    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->out:[B

    .line 322
    .restart local v1    # "tmpOut":[B
    :cond_2
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    array-length v4, v1

    invoke-virtual {v3, v1, v5, v4, v7}, Ljava/util/zip/Deflater;->deflate([BIII)I

    move-result v0

    .line 323
    .restart local v0    # "numBytes":I
    invoke-interface {p1, v1, v5, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([BII)V

    .line 324
    if-gtz v0, :cond_2

    goto :goto_0
.end method

.method private estimateCompressedSize(I)I
    .locals 6
    .param p1, "originalSize"    # I

    .prologue
    .line 218
    int-to-double v2, p1

    const-wide v4, 0x3ff004189374bc6aL    # 1.001

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v1, v2

    add-int/lit8 v0, v1, 0xc

    .line 219
    .local v0, "sizeEstimate":I
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->writeHeader:Z

    if-eqz v1, :cond_0

    .line 220
    sget-object v1, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$handler$codec$compression$ZlibWrapper:[I

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->wrapper:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 229
    :cond_0
    :goto_0
    return v0

    .line 222
    :pswitch_0
    sget-object v1, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->gzipHeader:[B

    array-length v1, v1

    add-int/2addr v0, v1

    .line 223
    goto :goto_0

    .line 225
    :pswitch_1
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 220
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private finishEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 10
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    const/4 v8, 0x0

    .line 252
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v6

    invoke-static {v6}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 254
    .local v2, "future":Lorg/jboss/netty/channel/ChannelFuture;
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v7, 0x1

    invoke-virtual {v6, v8, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v6

    if-nez v6, :cond_1

    .line 255
    if-eqz p2, :cond_0

    .line 256
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    :cond_0
    move-object v3, v2

    .line 302
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .local v3, "future":Lorg/jboss/netty/channel/ChannelFuture;
    :goto_0
    return-object v3

    .line 261
    .end local v3    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v6

    invoke-interface {v6}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v6

    invoke-static {v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 262
    .local v1, "footer":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->isGzip()Z

    move-result v4

    .line 263
    .local v4, "gzip":Z
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    monitor-enter v7

    .line 264
    if-eqz v4, :cond_2

    :try_start_0
    iget-boolean v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->writeHeader:Z

    if-eqz v6, :cond_2

    .line 266
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->writeHeader:Z

    .line 267
    sget-object v6, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->gzipHeader:[B

    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 270
    :cond_2
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->finish()V

    .line 271
    :goto_1
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->finished()Z

    move-result v6

    if-nez v6, :cond_3

    .line 272
    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflate(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_1

    .line 287
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .line 274
    :cond_3
    if-eqz v4, :cond_4

    .line 275
    :try_start_1
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v6}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v8

    long-to-int v0, v8

    .line 276
    .local v0, "crcValue":I
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->getTotalIn()I

    move-result v5

    .line 277
    .local v5, "uncBytes":I
    invoke-interface {v1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 278
    ushr-int/lit8 v6, v0, 0x8

    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 279
    ushr-int/lit8 v6, v0, 0x10

    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 280
    ushr-int/lit8 v6, v0, 0x18

    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 281
    invoke-interface {v1, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 282
    ushr-int/lit8 v6, v5, 0x8

    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 283
    ushr-int/lit8 v6, v5, 0x10

    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 284
    ushr-int/lit8 v6, v5, 0x18

    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 286
    .end local v0    # "crcValue":I
    .end local v5    # "uncBytes":I
    :cond_4
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v6}, Ljava/util/zip/Deflater;->end()V

    .line 287
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 289
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 290
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v6

    invoke-static {v6}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    .line 291
    invoke-static {p1, v2, v1}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 294
    :cond_5
    if-eqz p2, :cond_6

    .line 295
    new-instance v6, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$1;

    invoke-direct {v6, p0, p1, p2}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$1;-><init>(Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    invoke-interface {v2, v6}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    :cond_6
    move-object v3, v2

    .line 302
    .end local v2    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .restart local v3    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    goto/16 :goto_0
.end method

.method private isGzip()Z
    .locals 2

    .prologue
    .line 173
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->wrapper:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    sget-object v1, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->GZIP:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 334
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 342
    return-void
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 329
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 330
    return-void
.end method

.method public beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 338
    return-void
.end method

.method public close()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3

    .prologue
    .line 165
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 166
    .local v0, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    if-nez v0, :cond_0

    .line 167
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "not added to a pipeline"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 169
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->finishEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method

.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 182
    instance-of v5, p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_0
    move-object v3, p3

    .line 214
    :cond_1
    :goto_0
    return-object v3

    :cond_2
    move-object v3, p3

    .line 186
    check-cast v3, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 187
    .local v3, "uncompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    .line 188
    .local v4, "uncompressedLen":I
    if-eqz v4, :cond_1

    .line 192
    new-array v1, v4, [B

    .line 193
    .local v1, "in":[B
    invoke-interface {v3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 195
    invoke-direct {p0, v4}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->estimateCompressedSize(I)I

    move-result v2

    .line 196
    .local v2, "sizeEstimate":I
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v5

    invoke-static {v2, v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(ILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 199
    .local v0, "compressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    monitor-enter v6

    .line 200
    :try_start_0
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->isGzip()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 201
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v5, v1}, Ljava/util/zip/CRC32;->update([B)V

    .line 202
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->writeHeader:Z

    if-eqz v5, :cond_3

    .line 203
    sget-object v5, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->gzipHeader:[B

    invoke-interface {v0, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 204
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->writeHeader:Z

    .line 208
    :cond_3
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v5, v1}, Ljava/util/zip/Deflater;->setInput([B)V

    .line 209
    :goto_1
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v5}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v5

    if-nez v5, :cond_4

    .line 210
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->deflate(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_1

    .line 212
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    :cond_4
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v3, v0

    .line 214
    goto :goto_0
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 235
    instance-of v1, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v1, :cond_0

    move-object v0, p2

    .line 236
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 237
    .local v0, "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    sget-object v1, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder$2;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 248
    .end local v0    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;->handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 249
    :goto_0
    return-void

    .line 241
    .restart local v0    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :pswitch_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 242
    :cond_1
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->finishEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 237
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method
