.class public abstract Lorg/jboss/netty/buffer/HeapChannelBuffer;
.super Lorg/jboss/netty/buffer/AbstractChannelBuffer;
.source "HeapChannelBuffer.java"


# instance fields
.field protected final array:[B


# direct methods
.method protected constructor <init>(I)V
    .locals 2
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 42
    new-array v0, p1, [B

    invoke-direct {p0, v0, v1, v1}, Lorg/jboss/netty/buffer/HeapChannelBuffer;-><init>([BII)V

    .line 43
    return-void
.end method

.method protected constructor <init>([B)V
    .locals 2
    .param p1, "array"    # [B

    .prologue
    .line 51
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/buffer/HeapChannelBuffer;-><init>([BII)V

    .line 52
    return-void
.end method

.method protected constructor <init>([BII)V
    .locals 2
    .param p1, "array"    # [B
    .param p2, "readerIndex"    # I
    .param p3, "writerIndex"    # I

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/jboss/netty/buffer/AbstractChannelBuffer;-><init>()V

    .line 62
    if-nez p1, :cond_0

    .line 63
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "array"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    .line 66
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/buffer/HeapChannelBuffer;->setIndex(II)V

    .line 67
    return-void
.end method


# virtual methods
.method public array()[B
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    return-object v0
.end method

.method public arrayOffset()I
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x0

    return v0
.end method

.method public capacity()I
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    array-length v0, v0

    return v0
.end method

.method public getByte(I)B
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    aget-byte v0, v0, p1

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
    .line 116
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-static {v0, p1, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/nio/channels/GatheringByteChannel;->write(Ljava/nio/ByteBuffer;)I

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
    .line 111
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-virtual {p2, v0, p1, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 112
    return-void
.end method

.method public getBytes(ILjava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 106
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/HeapChannelBuffer;->capacity()I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p2, v0, p1, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 107
    return-void
.end method

.method public getBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 94
    instance-of v0, p2, Lorg/jboss/netty/buffer/HeapChannelBuffer;

    if-eqz v0, :cond_0

    .line 95
    check-cast p2, Lorg/jboss/netty/buffer/HeapChannelBuffer;

    .end local p2    # "dst":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v0, p2, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/jboss/netty/buffer/HeapChannelBuffer;->getBytes(I[BII)V

    .line 99
    :goto_0
    return-void

    .line 97
    .restart local p2    # "dst":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-interface {p2, p3, v0, p1, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setBytes(I[BII)V

    goto :goto_0
.end method

.method public getBytes(I[BII)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "dst"    # [B
    .param p3, "dstIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-static {v0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    return-void
.end method

.method public hasArray()Z
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x1

    return v0
.end method

.method public isDirect()Z
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public setByte(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 120
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 121
    return-void
.end method

.method public setBytes(ILjava/io/InputStream;I)I
    .locals 3
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    const/4 v1, 0x0

    .line 142
    .local v1, "readBytes":I
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-virtual {p2, v2, p1, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 143
    .local v0, "localReadBytes":I
    if-gez v0, :cond_1

    .line 144
    if-nez v1, :cond_2

    .line 145
    const/4 v2, -0x1

    .line 155
    :goto_0
    return v2

    .line 150
    :cond_1
    add-int/2addr v1, v0

    .line 151
    add-int/2addr p1, v0

    .line 152
    sub-int/2addr p3, v0

    .line 153
    if-gtz p3, :cond_0

    :cond_2
    move v2, v1

    .line 155
    goto :goto_0
.end method

.method public setBytes(ILjava/nio/channels/ScatteringByteChannel;I)I
    .locals 5
    .param p1, "index"    # I
    .param p2, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    iget-object v4, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-static {v4, p1, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 160
    .local v0, "buf":Ljava/nio/ByteBuffer;
    const/4 v3, 0x0

    .line 165
    .local v3, "readBytes":I
    :cond_0
    :try_start_0
    invoke-interface {p2, v0}, Ljava/nio/channels/ScatteringByteChannel;->read(Ljava/nio/ByteBuffer;)I
    :try_end_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 169
    .local v2, "localReadBytes":I
    :goto_0
    if-gez v2, :cond_1

    .line 170
    if-nez v3, :cond_2

    .line 171
    const/4 v4, -0x1

    .line 182
    :goto_1
    return v4

    .line 166
    .end local v2    # "localReadBytes":I
    :catch_0
    move-exception v1

    .line 167
    .local v1, "e":Ljava/nio/channels/ClosedChannelException;
    const/4 v2, -0x1

    .restart local v2    # "localReadBytes":I
    goto :goto_0

    .line 176
    .end local v1    # "e":Ljava/nio/channels/ClosedChannelException;
    :cond_1
    if-nez v2, :cond_3

    :cond_2
    :goto_2
    move v4, v3

    .line 182
    goto :goto_1

    .line 179
    :cond_3
    add-int/2addr v3, v2

    .line 180
    if-lt v3, p3, :cond_0

    goto :goto_2
.end method

.method public setBytes(ILjava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-virtual {p2, v0, p1, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 137
    return-void
.end method

.method public setBytes(ILorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 124
    instance-of v0, p2, Lorg/jboss/netty/buffer/HeapChannelBuffer;

    if-eqz v0, :cond_0

    .line 125
    check-cast p2, Lorg/jboss/netty/buffer/HeapChannelBuffer;

    .end local p2    # "src":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v0, p2, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/jboss/netty/buffer/HeapChannelBuffer;->setBytes(I[BII)V

    .line 129
    :goto_0
    return-void

    .line 127
    .restart local p2    # "src":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-interface {p2, p3, v0, p1, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[BII)V

    goto :goto_0
.end method

.method public setBytes(I[BII)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "src"    # [B
    .param p3, "srcIndex"    # I
    .param p4, "length"    # I

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-static {p2, p3, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 133
    return-void
.end method

.method public slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 186
    if-nez p1, :cond_2

    .line 187
    if-nez p2, :cond_0

    .line 188
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 201
    :goto_0
    return-object v0

    .line 190
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    array-length v1, v1

    if-ne p2, v1, :cond_1

    .line 191
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/HeapChannelBuffer;->duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 192
    .local v0, "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v1, 0x0

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setIndex(II)V

    goto :goto_0

    .line 195
    .end local v0    # "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_1
    new-instance v0, Lorg/jboss/netty/buffer/TruncatedChannelBuffer;

    invoke-direct {v0, p0, p2}, Lorg/jboss/netty/buffer/TruncatedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    goto :goto_0

    .line 198
    :cond_2
    if-nez p2, :cond_3

    .line 199
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 201
    :cond_3
    new-instance v0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;

    invoke-direct {v0, p0, p1, p2}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    goto :goto_0
.end method

.method public toByteBuffer(II)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 206
    iget-object v0, p0, Lorg/jboss/netty/buffer/HeapChannelBuffer;->array:[B

    invoke-static {v0, p1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/HeapChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method
