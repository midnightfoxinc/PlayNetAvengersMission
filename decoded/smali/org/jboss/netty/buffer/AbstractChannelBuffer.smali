.class public abstract Lorg/jboss/netty/buffer/AbstractChannelBuffer;
.super Ljava/lang/Object;
.source "AbstractChannelBuffer.java"

# interfaces
.implements Lorg/jboss/netty/buffer/ChannelBuffer;


# instance fields
.field private markedReaderIndex:I

.field private markedWriterIndex:I

.field private readerIndex:I

.field private writerIndex:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bytesBefore(B)I
    .locals 2
    .param p1, "value"    # B

    .prologue
    .line 535
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex()I

    move-result v0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->bytesBefore(IIB)I

    move-result v0

    return v0
.end method

.method public bytesBefore(IB)I
    .locals 1
    .param p1, "length"    # I
    .param p2, "value"    # B

    .prologue
    .line 543
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 544
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex()I

    move-result v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->bytesBefore(IIB)I

    move-result v0

    return v0
.end method

.method public bytesBefore(IIB)I
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I
    .param p3, "value"    # B

    .prologue
    .line 553
    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    add-int v1, p1, p2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->capacity()I

    move-result v2

    if-le v1, v2, :cond_1

    .line 554
    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 556
    :cond_1
    add-int v1, p1, p2

    invoke-virtual {p0, p1, v1, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->indexOf(IIB)I

    move-result v0

    .line 557
    .local v0, "endIndex":I
    if-gez v0, :cond_2

    .line 558
    const/4 v1, -0x1

    .line 560
    :goto_0
    return v1

    :cond_2
    sub-int v1, v0, p1

    goto :goto_0
.end method

.method public bytesBefore(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I
    .param p3, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 565
    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    add-int v1, p1, p2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->capacity()I

    move-result v2

    if-le v1, v2, :cond_1

    .line 566
    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 568
    :cond_1
    add-int v1, p1, p2

    invoke-virtual {p0, p1, v1, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->indexOf(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    .line 569
    .local v0, "endIndex":I
    if-gez v0, :cond_2

    .line 570
    const/4 v1, -0x1

    .line 572
    :goto_0
    return v1

    :cond_2
    sub-int v1, v0, p1

    goto :goto_0
.end method

.method public bytesBefore(ILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 1
    .param p1, "length"    # I
    .param p2, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 548
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 549
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex()I

    move-result v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->bytesBefore(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    return v0
.end method

.method public bytesBefore(Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 2
    .param p1, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 539
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex()I

    move-result v0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->bytesBefore(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    return v0
.end method

.method protected checkReadableBytes(I)V
    .locals 3
    .param p1, "minimumReadableBytes"    # I

    .prologue
    .line 607
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v0

    if-ge v0, p1, :cond_0

    .line 608
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not enough readable bytes - Need "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 611
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 72
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->compareTo(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 1
    .param p1, "that"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 589
    invoke-static {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->compare(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v0

    return v0
.end method

.method public copy()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2

    .prologue
    .line 494
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public discardReadBytes()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 107
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    if-nez v0, :cond_0

    .line 115
    :goto_0
    return-void

    .line 110
    :cond_0
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    iget v2, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, v3, p0, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 111
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 112
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedReaderIndex:I

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    sub-int/2addr v0, v1

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedReaderIndex:I

    .line 113
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedWriterIndex:I

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    sub-int/2addr v0, v1

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedWriterIndex:I

    .line 114
    iput v3, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    goto :goto_0
.end method

.method public ensureWritableBytes(I)V
    .locals 3
    .param p1, "writableBytes"    # I

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writableBytes()I

    move-result v0

    if-le p1, v0, :cond_0

    .line 119
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Writable bytes exceeded: Got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writableBytes()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 582
    instance-of v0, p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v0, :cond_0

    .line 583
    const/4 v0, 0x0

    .line 585
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_0
    check-cast p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->equals(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;)Z

    move-result v0

    goto :goto_0
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 161
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;I)V

    .line 162
    return-void
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "length"    # I

    .prologue
    .line 165
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v0

    if-le p3, v0, :cond_0

    .line 166
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Too many bytes to be read: Need "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 170
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v0

    add-int/2addr v0, p3

    invoke-interface {p2, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 171
    return-void
.end method

.method public getBytes(I[B)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "dst"    # [B

    .prologue
    .line 157
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(I[BII)V

    .line 158
    return-void
.end method

.method public getChar(I)C
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 145
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getShort(I)S

    move-result v0

    int-to-char v0, v0

    return v0
.end method

.method public getDouble(I)D
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 153
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat(I)F
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 149
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public getMedium(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 133
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getUnsignedMedium(I)I

    move-result v0

    .line 134
    .local v0, "value":I
    const/high16 v1, 0x800000

    and-int/2addr v1, v0

    if-eqz v1, :cond_0

    .line 135
    const/high16 v1, -0x1000000

    or-int/2addr v0, v1

    .line 137
    :cond_0
    return v0
.end method

.method public getUnsignedByte(I)S
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getByte(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method public getUnsignedInt(I)J
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 141
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getInt(I)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public getUnsignedShort(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getShort(I)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 577
    invoke-static {p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->hashCode(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v0

    return v0
.end method

.method public indexOf(IIB)I
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "value"    # B

    .prologue
    .line 527
    invoke-static {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->indexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IIB)I

    move-result v0

    return v0
.end method

.method public indexOf(IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 1
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 531
    invoke-static {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->indexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    return v0
.end method

.method public markReaderIndex()V
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedReaderIndex:I

    .line 92
    return-void
.end method

.method public markWriterIndex()V
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedWriterIndex:I

    .line 100
    return-void
.end method

.method public readByte()B
    .locals 3

    .prologue
    .line 235
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    if-ne v0, v1, :cond_0

    .line 236
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Readable byte limit exceeded: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_0
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getByte(I)B

    move-result v0

    return v0
.end method

.method public readBytes(Ljava/nio/channels/GatheringByteChannel;I)I
    .locals 2
    .param p1, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    invoke-virtual {p0, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 358
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v1, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(ILjava/nio/channels/GatheringByteChannel;I)I

    move-result v0

    .line 359
    .local v0, "readBytes":I
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 360
    return v0
.end method

.method public readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p1, "length"    # I

    .prologue
    .line 303
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 304
    if-nez p1, :cond_0

    .line 305
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 310
    :goto_0
    return-object v0

    .line 307
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 308
    .local v0, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-interface {v0, p0, v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 309
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    goto :goto_0
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
    .line 364
    invoke-virtual {p0, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 365
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(ILjava/io/OutputStream;I)V

    .line 366
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/2addr v0, p2

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 367
    return-void
.end method

.method public readBytes(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 349
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 350
    .local v0, "length":I
    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 351
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v1, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(ILjava/nio/ByteBuffer;)V

    .line 352
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 353
    return-void
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 330
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    .line 331
    return-void
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 3
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "length"    # I

    .prologue
    .line 334
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v0

    if-le p2, v0, :cond_0

    .line 335
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Too many bytes to be read: Need "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 338
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 339
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v0

    add-int/2addr v0, p2

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 340
    return-void
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "dstIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 343
    invoke-virtual {p0, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 344
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 345
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 346
    return-void
.end method

.method public readBytes([B)V
    .locals 2
    .param p1, "dst"    # [B

    .prologue
    .line 326
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readBytes([BII)V

    .line 327
    return-void
.end method

.method public readBytes([BII)V
    .locals 1
    .param p1, "dst"    # [B
    .param p2, "dstIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 320
    invoke-virtual {p0, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 321
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getBytes(I[BII)V

    .line 322
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 323
    return-void
.end method

.method public readChar()C
    .locals 1

    .prologue
    .line 291
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readShort()S

    move-result v0

    int-to-char v0, v0

    return v0
.end method

.method public readDouble()D
    .locals 2

    .prologue
    .line 299
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1

    .prologue
    .line 295
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public readInt()I
    .locals 2

    .prologue
    .line 273
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 274
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getInt(I)I

    move-result v0

    .line 275
    .local v0, "v":I
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 276
    return v0
.end method

.method public readLong()J
    .locals 3

    .prologue
    .line 284
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 285
    iget v2, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getLong(I)J

    move-result-wide v0

    .line 286
    .local v0, "v":J
    iget v2, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/lit8 v2, v2, 0x8

    iput v2, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 287
    return-wide v0
.end method

.method public readMedium()I
    .locals 2

    .prologue
    .line 258
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readUnsignedMedium()I

    move-result v0

    .line 259
    .local v0, "value":I
    const/high16 v1, 0x800000

    and-int/2addr v1, v0

    if-eqz v1, :cond_0

    .line 260
    const/high16 v1, -0x1000000

    or-int/2addr v0, v1

    .line 262
    :cond_0
    return v0
.end method

.method public readShort()S
    .locals 2

    .prologue
    .line 247
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 248
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getShort(I)S

    move-result v0

    .line 249
    .local v0, "v":S
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 250
    return v0
.end method

.method public readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "length"    # I

    .prologue
    .line 314
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v1, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 315
    .local v0, "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 316
    return-object v0
.end method

.method public readUnsignedByte()S
    .locals 1

    .prologue
    .line 243
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method public readUnsignedInt()J
    .locals 4

    .prologue
    .line 280
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public readUnsignedMedium()I
    .locals 2

    .prologue
    .line 266
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->checkReadableBytes(I)V

    .line 267
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->getUnsignedMedium(I)I

    move-result v0

    .line 268
    .local v0, "v":I
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int/lit8 v1, v1, 0x3

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 269
    return v0
.end method

.method public readUnsignedShort()I
    .locals 2

    .prologue
    .line 254
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readShort()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method public readable()Z
    .locals 1

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public readableBytes()I
    .locals 2

    .prologue
    .line 83
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public readerIndex()I
    .locals 1

    .prologue
    .line 39
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    return v0
.end method

.method public readerIndex(I)V
    .locals 1
    .param p1, "readerIndex"    # I

    .prologue
    .line 43
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    if-le p1, v0, :cond_1

    .line 44
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 46
    :cond_1
    iput p1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 47
    return-void
.end method

.method public resetReaderIndex()V
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedReaderIndex:I

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex(I)V

    .line 96
    return-void
.end method

.method public resetWriterIndex()V
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->markedWriterIndex:I

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 104
    return-void
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 190
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;I)V

    .line 191
    return-void
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "length"    # I

    .prologue
    .line 194
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    if-le p3, v0, :cond_0

    .line 195
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Too many bytes to write: Need "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 199
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    add-int/2addr v0, p3

    invoke-interface {p2, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 200
    return-void
.end method

.method public setBytes(I[B)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "src"    # [B

    .prologue
    .line 186
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(I[BII)V

    .line 187
    return-void
.end method

.method public setChar(II)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 174
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setShort(II)V

    .line 175
    return-void
.end method

.method public setDouble(ID)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # D

    .prologue
    .line 182
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setLong(IJ)V

    .line 183
    return-void
.end method

.method public setFloat(IF)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # F

    .prologue
    .line 178
    invoke-static {p2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setInt(II)V

    .line 179
    return-void
.end method

.method public setIndex(II)V
    .locals 3
    .param p1, "readerIndex"    # I
    .param p2, "writerIndex"    # I

    .prologue
    .line 62
    if-ltz p1, :cond_0

    if-gt p1, p2, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->capacity()I

    move-result v0

    if-le p2, v0, :cond_1

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid writerIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - Maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " or "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_1
    iput p1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 67
    iput p2, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 68
    return-void
.end method

.method public setZero(II)V
    .locals 7
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x0

    .line 203
    if-nez p2, :cond_1

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 206
    :cond_1
    if-gez p2, :cond_2

    .line 207
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "length must be 0 or greater than 0."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 211
    :cond_2
    ushr-int/lit8 v2, p2, 0x3

    .line 212
    .local v2, "nLong":I
    and-int/lit8 v1, p2, 0x7

    .line 213
    .local v1, "nBytes":I
    move v0, v2

    .local v0, "i":I
    :goto_1
    if-lez v0, :cond_3

    .line 214
    const-wide/16 v4, 0x0

    invoke-virtual {p0, p1, v4, v5}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setLong(IJ)V

    .line 215
    add-int/lit8 p1, p1, 0x8

    .line 213
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 217
    :cond_3
    if-ne v1, v6, :cond_4

    .line 218
    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setInt(II)V

    goto :goto_0

    .line 219
    :cond_4
    if-ge v1, v6, :cond_5

    .line 220
    move v0, v1

    :goto_2
    if-lez v0, :cond_0

    .line 221
    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setByte(II)V

    .line 222
    add-int/lit8 p1, p1, 0x1

    .line 220
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 225
    :cond_5
    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setInt(II)V

    .line 226
    add-int/lit8 p1, p1, 0x4

    .line 227
    add-int/lit8 v0, v1, -0x4

    :goto_3
    if-lez v0, :cond_0

    .line 228
    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setByte(II)V

    .line 229
    add-int/lit8 p1, p1, 0x1

    .line 227
    add-int/lit8 v0, v0, -0x1

    goto :goto_3
.end method

.method public skipBytes(I)V
    .locals 4
    .param p1, "length"    # I

    .prologue
    .line 370
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    add-int v0, v1, p1

    .line 371
    .local v0, "newReaderIndex":I
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    if-le v0, v1, :cond_0

    .line 372
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Readable bytes exceeded - Need "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", maximum is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 375
    :cond_0
    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    .line 376
    return-void
.end method

.method public slice()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2

    .prologue
    .line 498
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toByteBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .prologue
    .line 502
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toByteBuffers()[Ljava/nio/ByteBuffer;
    .locals 2

    .prologue
    .line 506
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->toByteBuffers(II)[Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toByteBuffers(II)[Ljava/nio/ByteBuffer;
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 510
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 594
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

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "widx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "cap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->capacity()I

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
    .line 518
    if-nez p2, :cond_0

    .line 519
    const-string v0, ""

    .line 522
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->decodeString(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 514
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writable()Z
    .locals 1

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writableBytes()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public writableBytes()I
    .locals 2

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->capacity()I

    move-result v0

    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public writeByte(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 379
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setByte(II)V

    .line 380
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 381
    return-void
.end method

.method public writeBytes(Ljava/io/InputStream;I)I
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 450
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v1, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(ILjava/io/InputStream;I)I

    move-result v0

    .line 451
    .local v0, "writtenBytes":I
    if-lez v0, :cond_0

    .line 452
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 454
    :cond_0
    return v0
.end method

.method public writeBytes(Ljava/nio/channels/ScatteringByteChannel;I)I
    .locals 2
    .param p1, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 459
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v1, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I

    move-result v0

    .line 460
    .local v0, "writtenBytes":I
    if-lez v0, :cond_0

    .line 461
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 463
    :cond_0
    return v0
.end method

.method public writeBytes(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 443
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 444
    .local v0, "length":I
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v1, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(ILjava/nio/ByteBuffer;)V

    .line 445
    iget v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 446
    return-void
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 425
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    .line 426
    return-void
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 3
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "length"    # I

    .prologue
    .line 429
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    if-le p2, v0, :cond_0

    .line 430
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Too many bytes to write - Need "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 433
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 434
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    add-int/2addr v0, p2

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 435
    return-void
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 438
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 439
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 440
    return-void
.end method

.method public writeBytes([B)V
    .locals 2
    .param p1, "src"    # [B

    .prologue
    .line 421
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeBytes([BII)V

    .line 422
    return-void
.end method

.method public writeBytes([BII)V
    .locals 1
    .param p1, "src"    # [B
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 416
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setBytes(I[BII)V

    .line 417
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 418
    return-void
.end method

.method public writeChar(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 404
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeShort(I)V

    .line 405
    return-void
.end method

.method public writeDouble(D)V
    .locals 3
    .param p1, "value"    # D

    .prologue
    .line 412
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeLong(J)V

    .line 413
    return-void
.end method

.method public writeFloat(F)V
    .locals 1
    .param p1, "value"    # F

    .prologue
    .line 408
    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeInt(I)V

    .line 409
    return-void
.end method

.method public writeInt(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 394
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setInt(II)V

    .line 395
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 396
    return-void
.end method

.method public writeLong(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 399
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v0, p1, p2}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setLong(IJ)V

    .line 400
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 401
    return-void
.end method

.method public writeMedium(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 389
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setMedium(II)V

    .line 390
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 391
    return-void
.end method

.method public writeShort(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 384
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    invoke-virtual {p0, v0, p1}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->setShort(II)V

    .line 385
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 386
    return-void
.end method

.method public writeZero(I)V
    .locals 7
    .param p1, "length"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x0

    .line 467
    if-nez p1, :cond_1

    .line 491
    :cond_0
    :goto_0
    return-void

    .line 470
    :cond_1
    if-gez p1, :cond_2

    .line 471
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "length must be 0 or greater than 0."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 474
    :cond_2
    ushr-int/lit8 v2, p1, 0x3

    .line 475
    .local v2, "nLong":I
    and-int/lit8 v1, p1, 0x7

    .line 476
    .local v1, "nBytes":I
    move v0, v2

    .local v0, "i":I
    :goto_1
    if-lez v0, :cond_3

    .line 477
    const-wide/16 v4, 0x0

    invoke-virtual {p0, v4, v5}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeLong(J)V

    .line 476
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 479
    :cond_3
    if-ne v1, v6, :cond_4

    .line 480
    invoke-virtual {p0, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeInt(I)V

    goto :goto_0

    .line 481
    :cond_4
    if-ge v1, v6, :cond_5

    .line 482
    move v0, v1

    :goto_2
    if-lez v0, :cond_0

    .line 483
    invoke-virtual {p0, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeByte(I)V

    .line 482
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 486
    :cond_5
    invoke-virtual {p0, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeInt(I)V

    .line 487
    add-int/lit8 v0, v1, -0x4

    :goto_3
    if-lez v0, :cond_0

    .line 488
    invoke-virtual {p0, v3}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writeByte(I)V

    .line 487
    add-int/lit8 v0, v0, -0x1

    goto :goto_3
.end method

.method public writerIndex()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    return v0
.end method

.method public writerIndex(I)V
    .locals 3
    .param p1, "writerIndex"    # I

    .prologue
    .line 54
    iget v0, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    if-lt p1, v0, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->capacity()I

    move-result v0

    if-le p1, v0, :cond_1

    .line 55
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid readerIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->readerIndex:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - Maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_1
    iput p1, p0, Lorg/jboss/netty/buffer/AbstractChannelBuffer;->writerIndex:I

    .line 59
    return-void
.end method
