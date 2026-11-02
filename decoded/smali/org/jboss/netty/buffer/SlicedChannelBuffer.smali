.class public Lorg/jboss/netty/buffer/SlicedChannelBuffer;
.super Lorg/jboss/netty/buffer/AbstractChannelBuffer;
.source "SlicedChannelBuffer.java"

# interfaces
.implements Lorg/jboss/netty/buffer/WrappedChannelBuffer;


# instance fields
.field private final adjustment:I

.field private final buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private final length:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 3
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "index"    # I
    .param p3, "length"    # I

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;-><init>()V

    .line 40
    if-ltz p2, :cond_0

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v0

    if-le p2, v0, :cond_1

    .line 41
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid index of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_1
    add-int v0, p2, p3

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v1

    if-le v0, v1, :cond_2

    .line 46
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid combined index of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int v2, p2, p3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_2
    iput-object p1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 51
    iput p2, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    .line 52
    iput p3, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->length:I

    .line 53
    invoke-virtual {p0, p3}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->writerIndex(I)V

    .line 54
    return-void
.end method

.method private checkIndex(I)V
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 217
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->capacity()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 218
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_1
    return-void
.end method

.method private checkIndex(II)V
    .locals 3
    .param p1, "startIndex"    # I
    .param p2, "length"    # I

    .prologue
    .line 224
    if-gez p2, :cond_0

    .line 225
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "length is negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_0
    if-gez p1, :cond_1

    .line 229
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "startIndex cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :cond_1
    add-int v0, p1, p2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->capacity()I

    move-result v1

    if-le v0, v1, :cond_2

    .line 232
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Index too big - Bytes needed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int v2, p1, p2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 235
    :cond_2
    return-void
.end method


# virtual methods
.method public array()[B
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public arrayOffset()I
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->arrayOffset()I

    move-result v0

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v0, v1

    return v0
.end method

.method public capacity()I
    .locals 1

    .prologue
    .line 73
    iget v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->length:I

    return v0
.end method

.method public copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 121
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4

    .prologue
    .line 114
    new-instance v0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;

    iget-object v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v2, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    iget v3, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->length:I

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 115
    .local v0, "duplicate":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->readerIndex()I

    move-result v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->writerIndex()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setIndex(II)V

    .line 116
    return-object v0
.end method

.method public factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    return-object v0
.end method

.method public getByte(I)B
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(I)V

    .line 90
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v0

    return v0
.end method

.method public getBytes(ILjava/nio/channels/GatheringByteChannel;I)I
    .locals 2
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    invoke-direct {p0, p1, p3}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 196
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/nio/channels/GatheringByteChannel;I)I

    move-result v0

    return v0
.end method

.method public getBytes(ILjava/io/OutputStream;I)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    invoke-direct {p0, p1, p3}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 190
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/io/OutputStream;I)V

    .line 191
    return-void
.end method

.method public getBytes(ILjava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 143
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 144
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/nio/ByteBuffer;)V

    .line 145
    return-void
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 133
    invoke-direct {p0, p1, p4}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 134
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 135
    return-void
.end method

.method public getBytes(I[BII)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "dst"    # [B
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 138
    invoke-direct {p0, p1, p4}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 139
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[BII)V

    .line 140
    return-void
.end method

.method public getInt(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 104
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 105
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method public getLong(I)J
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 109
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 110
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getShort(I)S
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 94
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 95
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getShort(I)S

    move-result v0

    return v0
.end method

.method public getUnsignedMedium(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 99
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 100
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedMedium(I)I

    move-result v0

    return v0
.end method

.method public hasArray()Z
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->hasArray()Z

    move-result v0

    return v0
.end method

.method public isDirect()Z
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->isDirect()Z

    move-result v0

    return v0
.end method

.method public order()Ljava/nio/ByteOrder;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    return-object v0
.end method

.method public setByte(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(I)V

    .line 149
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 150
    return-void
.end method

.method public setBytes(ILjava/io/InputStream;I)I
    .locals 2
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-direct {p0, p1, p3}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 202
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/io/InputStream;I)I

    move-result v0

    return v0
.end method

.method public setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I
    .locals 2
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    invoke-direct {p0, p1, p3}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 208
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I

    move-result v0

    return v0
.end method

.method public setBytes(ILjava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 183
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 184
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILjava/nio/ByteBuffer;)V

    .line 185
    return-void
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 178
    invoke-direct {p0, p1, p4}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 179
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 180
    return-void
.end method

.method public setBytes(I[BII)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "src"    # [B
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 173
    invoke-direct {p0, p1, p4}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 174
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(I[BII)V

    .line 175
    return-void
.end method

.method public setInt(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 163
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 164
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setInt(II)V

    .line 165
    return-void
.end method

.method public setLong(IJ)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # J

    .prologue
    .line 168
    const/16 v0, 0x8

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 169
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setLong(IJ)V

    .line 170
    return-void
.end method

.method public setMedium(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 158
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 159
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setMedium(II)V

    .line 160
    return-void
.end method

.method public setShort(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 153
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 154
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setShort(II)V

    .line 155
    return-void
.end method

.method public slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 125
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 126
    if-nez p2, :cond_0

    .line 127
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 129
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;

    iget-object v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v2, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v2, p1

    invoke-direct {v0, v1, v2, p2}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    goto :goto_0
.end method

.method public toByteBuffer(II)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 212
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->checkIndex(II)V

    .line 213
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v1, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->adjustment:I

    add-int/2addr v1, p1

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public unwrap()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method
