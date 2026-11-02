.class Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;
.super Ljava/lang/Object;
.source "ReplayingDecoderBuffer.java"

# interfaces
.implements Lorg/jboss/netty/buffer/ChannelBuffer;


# static fields
.field private static final REPLAY:Ljava/lang/Error;


# instance fields
.field private final parent:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
            "<*>;"
        }
    .end annotation
.end field

.field private terminated:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/ReplayError;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/ReplayError;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    return-void
.end method

.method constructor <init>(Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "parent":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->parent:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;

    .line 40
    return-void
.end method

.method private buf()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->parent:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->internalBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method private checkIndex(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 640
    add-int v0, p1, p2

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 641
    sget-object v0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v0

    .line 643
    :cond_0
    return-void
.end method

.method private checkReadableBytes(I)V
    .locals 1
    .param p1, "readableBytes"    # I

    .prologue
    .line 646
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    if-ge v0, p1, :cond_0

    .line 647
    sget-object v0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v0

    .line 649
    :cond_0
    return-void
.end method


# virtual methods
.method public array()[B
    .locals 1

    .prologue
    .line 67
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public arrayOffset()I
    .locals 1

    .prologue
    .line 71
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bytesBefore(B)I
    .locals 2
    .param p1, "value"    # B

    .prologue
    .line 228
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->bytesBefore(B)I

    move-result v0

    .line 229
    .local v0, "bytes":I
    if-gez v0, :cond_0

    .line 230
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 232
    :cond_0
    return v0
.end method

.method public bytesBefore(IB)I
    .locals 2
    .param p1, "length"    # I
    .param p2, "value"    # B

    .prologue
    .line 244
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 245
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->bytesBefore(IB)I

    move-result v0

    .line 246
    .local v0, "bytes":I
    if-gez v0, :cond_0

    .line 247
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 249
    :cond_0
    return v0
.end method

.method public bytesBefore(IIB)I
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I
    .param p3, "value"    # B

    .prologue
    .line 262
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->bytesBefore(IIB)I

    move-result v0

    .line 263
    .local v0, "bytes":I
    if-gez v0, :cond_0

    .line 264
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 266
    :cond_0
    return v0
.end method

.method public bytesBefore(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I
    .param p3, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 271
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->bytesBefore(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    .line 272
    .local v0, "bytes":I
    if-gez v0, :cond_0

    .line 273
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 275
    :cond_0
    return v0
.end method

.method public bytesBefore(ILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 2
    .param p1, "length"    # I
    .param p2, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 253
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 254
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->bytesBefore(ILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    .line 255
    .local v0, "bytes":I
    if-gez v0, :cond_0

    .line 256
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 258
    :cond_0
    return v0
.end method

.method public bytesBefore(Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 2
    .param p1, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 236
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->bytesBefore(Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    .line 237
    .local v0, "bytes":I
    if-gez v0, :cond_0

    .line 238
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 240
    :cond_0
    return v0
.end method

.method public capacity()I
    .locals 1

    .prologue
    .line 51
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->terminated:Z

    if-eqz v0, :cond_0

    .line 52
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v0

    .line 54
    :goto_0
    return v0

    :cond_0
    const v0, 0x7fffffff

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 75
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->compareTo(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 1
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 84
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public copy()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 88
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 93
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public discardReadBytes()V
    .locals 1

    .prologue
    .line 97
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 105
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public ensureWritableBytes(I)V
    .locals 1
    .param p1, "writableBytes"    # I

    .prologue
    .line 101
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 80
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .locals 1

    .prologue
    .line 287
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    return-object v0
.end method

.method public getByte(I)B
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 109
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 110
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v0

    return v0
.end method

.method public getBytes(ILjava/nio/channels/GatheringByteChannel;I)I
    .locals 1
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public getBytes(ILjava/io/OutputStream;I)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public getBytes(ILjava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 129
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 142
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "length"    # I

    .prologue
    .line 138
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 133
    invoke-direct {p0, p1, p4}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 134
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 135
    return-void
.end method

.method public getBytes(I[B)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # [B

    .prologue
    .line 124
    array-length v0, p2

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 125
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[B)V

    .line 126
    return-void
.end method

.method public getBytes(I[BII)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # [B
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 119
    invoke-direct {p0, p1, p4}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 120
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[BII)V

    .line 121
    return-void
.end method

.method public getChar(I)C
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 191
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 192
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getChar(I)C

    move-result v0

    return v0
.end method

.method public getDouble(I)D
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 201
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 202
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getDouble(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat(I)F
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 196
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 197
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getFloat(I)F

    move-result v0

    return v0
.end method

.method public getInt(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 156
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 157
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getLong(I)J
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 166
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 167
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMedium(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 171
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 172
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getMedium(I)I

    move-result v0

    return v0
.end method

.method public getShort(I)S
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 181
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 182
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getUnsignedByte(I)S
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 114
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 115
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v0

    return v0
.end method

.method public getUnsignedInt(I)J
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 161
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 162
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedInt(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getUnsignedMedium(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 176
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 177
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedMedium(I)I

    move-result v0

    return v0
.end method

.method public getUnsignedShort(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 186
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 187
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedShort(I)I

    move-result v0

    return v0
.end method

.method public hasArray()Z
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 207
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public indexOf(IIB)I
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "value"    # B

    .prologue
    .line 211
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->indexOf(IIB)I

    move-result v0

    .line 212
    .local v0, "endIndex":I
    if-gez v0, :cond_0

    .line 213
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 215
    :cond_0
    return v0
.end method

.method public indexOf(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 220
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->indexOf(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    .line 221
    .local v0, "endIndex":I
    if-gez v0, :cond_0

    .line 222
    sget-object v1, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->REPLAY:Ljava/lang/Error;

    throw v1

    .line 224
    :cond_0
    return v0
.end method

.method public isDirect()Z
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->isDirect()Z

    move-result v0

    return v0
.end method

.method public markReaderIndex()V
    .locals 1

    .prologue
    .line 279
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->markReaderIndex()V

    .line 280
    return-void
.end method

.method public markWriterIndex()V
    .locals 1

    .prologue
    .line 283
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public order()Ljava/nio/ByteOrder;
    .locals 1

    .prologue
    .line 291
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    return-object v0
.end method

.method public readByte()B
    .locals 1

    .prologue
    .line 307
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 308
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    return v0
.end method

.method public readBytes(Ljava/nio/channels/GatheringByteChannel;I)I
    .locals 1
    .param p1, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 349
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 350
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public readBytes(Ljava/io/OutputStream;I)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public readBytes(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 327
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 340
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 1
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "length"    # I

    .prologue
    .line 336
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "dstIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 331
    invoke-direct {p0, p3}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 332
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 333
    return-void
.end method

.method public readBytes([B)V
    .locals 1
    .param p1, "dst"    # [B

    .prologue
    .line 322
    array-length v0, p1

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 323
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 324
    return-void
.end method

.method public readBytes([BII)V
    .locals 1
    .param p1, "dst"    # [B
    .param p2, "dstIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 317
    invoke-direct {p0, p3}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 318
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([BII)V

    .line 319
    return-void
.end method

.method public readChar()C
    .locals 1

    .prologue
    .line 406
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 407
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readChar()C

    move-result v0

    return v0
.end method

.method public readDouble()D
    .locals 2

    .prologue
    .line 416
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 417
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1

    .prologue
    .line 411
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 412
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readFloat()F

    move-result v0

    return v0
.end method

.method public readInt()I
    .locals 1

    .prologue
    .line 371
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 372
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readInt()I

    move-result v0

    return v0
.end method

.method public readLong()J
    .locals 2

    .prologue
    .line 381
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 382
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readMedium()I
    .locals 1

    .prologue
    .line 386
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 387
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readMedium()I

    move-result v0

    return v0
.end method

.method public readShort()S
    .locals 1

    .prologue
    .line 396
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 397
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readShort()S

    move-result v0

    return v0
.end method

.method public readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 354
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 355
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public readUnsignedByte()S
    .locals 1

    .prologue
    .line 312
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 313
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedByte()S

    move-result v0

    return v0
.end method

.method public readUnsignedInt()J
    .locals 2

    .prologue
    .line 376
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 377
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedInt()J

    move-result-wide v0

    return-wide v0
.end method

.method public readUnsignedMedium()I
    .locals 1

    .prologue
    .line 391
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 392
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedMedium()I

    move-result v0

    return v0
.end method

.method public readUnsignedShort()I
    .locals 1

    .prologue
    .line 401
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 402
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedShort()I

    move-result v0

    return v0
.end method

.method public readable()Z
    .locals 1

    .prologue
    .line 295
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->terminated:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public readableBytes()I
    .locals 2

    .prologue
    .line 299
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->terminated:Z

    if-eqz v0, :cond_0

    .line 300
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    .line 302
    :goto_0
    return v0

    :cond_0
    const v0, 0x7fffffff

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public readerIndex()I
    .locals 1

    .prologue
    .line 363
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    return v0
.end method

.method public readerIndex(I)V
    .locals 1
    .param p1, "readerIndex"    # I

    .prologue
    .line 367
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 368
    return-void
.end method

.method public resetReaderIndex()V
    .locals 1

    .prologue
    .line 421
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->resetReaderIndex()V

    .line 422
    return-void
.end method

.method public resetWriterIndex()V
    .locals 1

    .prologue
    .line 425
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setByte(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 429
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(ILjava/io/InputStream;I)I
    .locals 1
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I
    .locals 1
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 467
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(ILjava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 441
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 453
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "length"    # I

    .prologue
    .line 449
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 445
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(I[B)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # [B

    .prologue
    .line 437
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setBytes(I[BII)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # [B
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 433
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setChar(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 491
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setDouble(ID)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # D

    .prologue
    .line 499
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setFloat(IF)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # F

    .prologue
    .line 495
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setIndex(II)V
    .locals 1
    .param p1, "readerIndex"    # I
    .param p2, "writerIndex"    # I

    .prologue
    .line 471
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setInt(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 475
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setLong(IJ)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # J

    .prologue
    .line 479
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setMedium(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 483
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setShort(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 487
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public setZero(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 462
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public skipBytes(I)V
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 503
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkReadableBytes(I)V

    .line 504
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 505
    return-void
.end method

.method public slice()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 508
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 512
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 513
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method terminate()V
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->terminated:Z

    .line 48
    return-void
.end method

.method public toByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 517
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public toByteBuffer(II)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 521
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 522
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toByteBuffers()[Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 526
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public toByteBuffers(II)[Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 530
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 531
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffers(II)[Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 545
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ridx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->readerIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "widx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->writerIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(IILjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 535
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->checkIndex(II)V

    .line 536
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "charsetName"    # Ljava/nio/charset/Charset;

    .prologue
    .line 540
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writable()Z
    .locals 1

    .prologue
    .line 555
    const/4 v0, 0x0

    return v0
.end method

.method public writableBytes()I
    .locals 1

    .prologue
    .line 559
    const/4 v0, 0x0

    return v0
.end method

.method public writeByte(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 563
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes(Ljava/io/InputStream;I)I
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 591
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes(Ljava/nio/channels/ScatteringByteChannel;I)I
    .locals 1
    .param p1, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 596
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 575
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 587
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 1
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "length"    # I

    .prologue
    .line 583
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 579
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes([B)V
    .locals 1
    .param p1, "src"    # [B

    .prologue
    .line 571
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeBytes([BII)V
    .locals 1
    .param p1, "src"    # [B
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 567
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeChar(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 628
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeDouble(D)V
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 636
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeFloat(F)V
    .locals 1
    .param p1, "value"    # F

    .prologue
    .line 632
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeInt(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 600
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeLong(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 604
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeMedium(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 608
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeShort(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 624
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writeZero(I)V
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 612
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method

.method public writerIndex()I
    .locals 1

    .prologue
    .line 616
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->buf()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v0

    return v0
.end method

.method public writerIndex(I)V
    .locals 1
    .param p1, "writerIndex"    # I

    .prologue
    .line 620
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/replay/UnreplayableOperationException;-><init>()V

    throw v0
.end method
