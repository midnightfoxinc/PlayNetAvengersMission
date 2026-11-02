.class public Lorg/jboss/netty/buffer/DynamicChannelBuffer;
.super Lorg/jboss/netty/buffer/AbstractChannelBuffer;
.source "DynamicChannelBuffer.java"


# instance fields
.field private buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private final endianness:Ljava/nio/ByteOrder;

.field private final factory:Lorg/jboss/netty/buffer/ChannelBufferFactory;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "estimatedLength"    # I

    .prologue
    .line 39
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;-><init>(Ljava/nio/ByteOrder;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteOrder;I)V
    .locals 1
    .param p1, "endianness"    # Ljava/nio/ByteOrder;
    .param p2, "estimatedLength"    # I

    .prologue
    .line 43
    invoke-static {p1}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance(Ljava/nio/ByteOrder;)Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;-><init>(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)V
    .locals 3
    .param p1, "endianness"    # Ljava/nio/ByteOrder;
    .param p2, "estimatedLength"    # I
    .param p3, "factory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;-><init>()V

    .line 47
    if-gez p2, :cond_0

    .line 48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "estimatedLength: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_0
    if-nez p1, :cond_1

    .line 51
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "endianness"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_1
    if-nez p3, :cond_2

    .line 54
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "factory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_2
    iput-object p3, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->factory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .line 57
    iput-object p1, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->endianness:Ljava/nio/ByteOrder;

    .line 58
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-interface {p3, v0, p2}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 59
    return-void
.end method


# virtual methods
.method public array()[B
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public arrayOffset()I
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v0

    return v0
.end method

.method public capacity()I
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v0

    return v0
.end method

.method public copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 275
    new-instance v0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    const/16 v2, 0x40

    invoke-static {p2, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;-><init>(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)V

    .line 276
    .local v0, "copiedBuffer":Lorg/jboss/netty/buffer/DynamicChannelBuffer;
    iget-object v1, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    iput-object v1, v0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 277
    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->setIndex(II)V

    .line 278
    return-object v0
.end method

.method public duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 271
    new-instance v0, Lorg/jboss/netty/buffer/DuplicatedChannelBuffer;

    invoke-direct {v0, p0}, Lorg/jboss/netty/buffer/DuplicatedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    return-object v0
.end method

.method public ensureWritableBytes(I)V
    .locals 6
    .param p1, "minWritableBytes"    # I

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->writableBytes()I

    move-result v3

    if-gt p1, v3, :cond_0

    .line 89
    :goto_0
    return-void

    .line 68
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->capacity()I

    move-result v3

    if-nez v3, :cond_2

    .line 69
    const/4 v2, 0x1

    .line 73
    .local v2, "newCapacity":I
    :goto_1
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->writerIndex()I

    move-result v3

    add-int v0, v3, p1

    .line 74
    .local v0, "minNewCapacity":I
    :cond_1
    if-ge v2, v0, :cond_3

    .line 75
    shl-int/lit8 v2, v2, 0x1

    .line 81
    if-nez v2, :cond_1

    .line 82
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Maximum size of 2gb exceeded"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 71
    .end local v0    # "minNewCapacity":I
    .end local v2    # "newCapacity":I
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->capacity()I

    move-result v2

    .restart local v2    # "newCapacity":I
    goto :goto_1

    .line 86
    .restart local v0    # "minNewCapacity":I
    :cond_3
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 87
    .local v1, "newBuffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v3, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->writerIndex()I

    move-result v5

    invoke-interface {v1, v3, v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 88
    iput-object v1, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0
.end method

.method public factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->factory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    return-object v0
.end method

.method public getByte(I)B
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 120
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

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
    .line 153
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/nio/channels/GatheringByteChannel;I)I

    move-result v0

    return v0
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
    .line 158
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/io/OutputStream;I)V

    .line 159
    return-void
.end method

.method public getBytes(ILjava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 148
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/nio/ByteBuffer;)V

    .line 149
    return-void
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 144
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 145
    return-void
.end method

.method public getBytes(I[BII)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # [B
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[BII)V

    .line 141
    return-void
.end method

.method public getInt(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getLong(I)J
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getShort(I)S
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 124
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getUnsignedMedium(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 128
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedMedium(I)I

    move-result v0

    return v0
.end method

.method public hasArray()Z
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v0

    return v0
.end method

.method public isDirect()Z
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->isDirect()Z

    move-result v0

    return v0
.end method

.method public order()Ljava/nio/ByteOrder;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->endianness:Ljava/nio/ByteOrder;

    return-object v0
.end method

.method public setByte(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 162
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 163
    return-void
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
    .line 195
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/io/InputStream;I)I

    move-result v0

    return v0
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
    .line 200
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I

    move-result v0

    return v0
.end method

.method public setBytes(ILjava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 190
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/ByteBuffer;)V

    .line 191
    return-void
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 186
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 187
    return-void
.end method

.method public setBytes(I[BII)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # [B
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 182
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(I[BII)V

    .line 183
    return-void
.end method

.method public setInt(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 174
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setInt(II)V

    .line 175
    return-void
.end method

.method public setLong(IJ)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # J

    .prologue
    .line 178
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setLong(IJ)V

    .line 179
    return-void
.end method

.method public setMedium(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 170
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setMedium(II)V

    .line 171
    return-void
.end method

.method public setShort(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 166
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setShort(II)V

    .line 167
    return-void
.end method

.method public slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 282
    if-nez p1, :cond_1

    .line 283
    if-nez p2, :cond_0

    .line 284
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 291
    :goto_0
    return-object v0

    .line 286
    :cond_0
    new-instance v0, Lorg/jboss/netty/buffer/TruncatedChannelBuffer;

    invoke-direct {v0, p0, p2}, Lorg/jboss/netty/buffer/TruncatedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    goto :goto_0

    .line 288
    :cond_1
    if-nez p2, :cond_2

    .line 289
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 291
    :cond_2
    new-instance v0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;

    invoke-direct {v0, p0, p1, p2}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    goto :goto_0
.end method

.method public toByteBuffer(II)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 296
    iget-object v0, p0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public writeByte(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 205
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 206
    invoke-super {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeByte(I)V

    .line 207
    return-void
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
    .line 253
    invoke-virtual {p0, p2}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 254
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes(Ljava/io/InputStream;I)I

    move-result v0

    return v0
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
    .line 260
    invoke-virtual {p0, p2}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 261
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes(Ljava/nio/channels/ScatteringByteChannel;I)I

    move-result v0

    return v0
.end method

.method public writeBytes(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 247
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 248
    invoke-super {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes(Ljava/nio/ByteBuffer;)V

    .line 249
    return-void
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 0
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 241
    invoke-virtual {p0, p3}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 242
    invoke-super {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 243
    return-void
.end method

.method public writeBytes([BII)V
    .locals 0
    .param p1, "src"    # [B
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 235
    invoke-virtual {p0, p3}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 236
    invoke-super {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes([BII)V

    .line 237
    return-void
.end method

.method public writeInt(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 223
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 224
    invoke-super {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeInt(I)V

    .line 225
    return-void
.end method

.method public writeLong(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 229
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 230
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeLong(J)V

    .line 231
    return-void
.end method

.method public writeMedium(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 217
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 218
    invoke-super {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeMedium(I)V

    .line 219
    return-void
.end method

.method public writeShort(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 211
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 212
    invoke-super {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeShort(I)V

    .line 213
    return-void
.end method

.method public writeZero(I)V
    .locals 0
    .param p1, "length"    # I

    .prologue
    .line 266
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;->ensureWritableBytes(I)V

    .line 267
    invoke-super {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeZero(I)V

    .line 268
    return-void
.end method
