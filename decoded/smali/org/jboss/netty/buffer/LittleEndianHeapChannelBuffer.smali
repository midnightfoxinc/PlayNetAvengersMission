.class public Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;
.super Lorg/jboss/netty/buffer/HeapChannelBuffer;
.source "LittleEndianHeapChannelBuffer.java"


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "length"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/HeapChannelBuffer;-><init>(I)V

    .line 35
    return-void
.end method

.method public constructor <init>([B)V
    .locals 0
    .param p1, "array"    # [B

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/HeapChannelBuffer;-><init>([B)V

    .line 44
    return-void
.end method

.method private constructor <init>([BII)V
    .locals 0
    .param p1, "array"    # [B
    .param p2, "readerIndex"    # I
    .param p3, "writerIndex"    # I

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/HeapChannelBuffer;-><init>([BII)V

    .line 48
    return-void
.end method


# virtual methods
.method public copy(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 120
    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    add-int v1, p1, p2

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    array-length v2, v2

    if-le v1, v2, :cond_1

    .line 121
    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Too many bytes to copy - Need "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int v3, p1, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", maximum is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    array-length v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 125
    :cond_1
    new-array v0, p2, [B

    .line 126
    .local v0, "copiedArray":[B
    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    new-instance v1, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;

    invoke-direct {v1, v0}, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;-><init>([B)V

    return-object v1
.end method

.method public duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4

    .prologue
    .line 116
    new-instance v0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;

    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->readerIndex()I

    move-result v2

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->writerIndex()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;-><init>([BII)V

    return-object v0
.end method

.method public factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance(Ljava/nio/ByteOrder;)Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    return-object v0
.end method

.method public getInt(I)I
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 69
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v2, p1, 0x1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v2, p1, 0x2

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v2, p1, 0x3

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public getLong(I)J
    .locals 8
    .param p1, "index"    # I

    .prologue
    const-wide/16 v6, 0xff

    .line 76
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    aget-byte v0, v0, p1

    int-to-long v0, v0

    and-long/2addr v0, v6

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v3, p1, 0x1

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v3, p1, 0x2

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v3, p1, 0x3

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v3, p1, 0x4

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v3, p1, 0x5

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v3, p1, 0x6

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    iget-object v2, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v3, p1, 0x7

    aget-byte v2, v2, v3

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public getShort(I)S
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v2, p1, 0x1

    aget-byte v1, v1, v2

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public getUnsignedMedium(I)I
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 63
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v2, p1, 0x1

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v2, p1, 0x2

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    return v0
.end method

.method public order()Ljava/nio/ByteOrder;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    return-object v0
.end method

.method public setInt(II)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 98
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 99
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 100
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x2

    ushr-int/lit8 v2, p2, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 101
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x3

    ushr-int/lit8 v2, p2, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 102
    return-void
.end method

.method public setLong(IJ)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # J

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    long-to-int v1, p2

    int-to-byte v1, v1

    aput-byte v1, v0, p1

    .line 106
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x1

    const/16 v2, 0x8

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 107
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x2

    const/16 v2, 0x10

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 108
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x3

    const/16 v2, 0x18

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 109
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x4

    const/16 v2, 0x20

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 110
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x5

    const/16 v2, 0x28

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 111
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x6

    const/16 v2, 0x30

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 112
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x7

    const/16 v2, 0x38

    ushr-long v2, p2, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 113
    return-void
.end method

.method public setMedium(II)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 93
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 94
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x2

    ushr-int/lit8 v2, p2, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 95
    return-void
.end method

.method public setShort(II)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 88
    iget-object v0, p0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;->array:[B

    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 89
    return-void
.end method
