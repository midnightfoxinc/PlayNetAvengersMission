.class public final Lorg/jboss/netty/buffer/ChannelBuffers;
.super Ljava/lang/Object;
.source "ChannelBuffers.java"


# static fields
.field public static final BIG_ENDIAN:Ljava/nio/ByteOrder;

.field public static final EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private static final HEXDUMP_TABLE:[C

.field public static final LITTLE_ENDIAN:Ljava/nio/ByteOrder;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 93
    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    sput-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 98
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    sput-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 103
    new-instance v2, Lorg/jboss/netty/buffer/EmptyChannelBuffer;

    invoke-direct {v2}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;-><init>()V

    sput-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 105
    const/16 v2, 0x400

    new-array v2, v2, [C

    sput-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->HEXDUMP_TABLE:[C

    .line 108
    const-string v2, "0123456789abcdef"

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 109
    .local v0, "DIGITS":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x100

    if-ge v1, v2, :cond_0

    .line 110
    sget-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->HEXDUMP_TABLE:[C

    shl-int/lit8 v3, v1, 0x1

    ushr-int/lit8 v4, v1, 0x4

    and-int/lit8 v4, v4, 0xf

    aget-char v4, v0, v4

    aput-char v4, v2, v3

    .line 111
    sget-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->HEXDUMP_TABLE:[C

    shl-int/lit8 v3, v1, 0x1

    add-int/lit8 v3, v3, 0x1

    and-int/lit8 v4, v1, 0xf

    aget-char v4, v0, v4

    aput-char v4, v2, v3

    .line 109
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 113
    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1196
    return-void
.end method

.method public static buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "capacity"    # I

    .prologue
    .line 121
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "capacity"    # I

    .prologue
    .line 130
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne p0, v0, :cond_1

    .line 131
    if-nez p1, :cond_0

    .line 132
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 139
    :goto_0
    return-object v0

    .line 134
    :cond_0
    new-instance v0, Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;

    invoke-direct {v0, p1}, Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;-><init>(I)V

    goto :goto_0

    .line 135
    :cond_1
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne p0, v0, :cond_3

    .line 136
    if-nez p1, :cond_2

    .line 137
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 139
    :cond_2
    new-instance v0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;

    invoke-direct {v0, p1}, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;-><init>(I)V

    goto :goto_0

    .line 141
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "endianness"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static compare(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 18
    .param p0, "bufferA"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "bufferB"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 985
    invoke-interface/range {p0 .. p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    .line 986
    .local v3, "aLen":I
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    .line 987
    .local v5, "bLen":I
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 988
    .local v8, "minLength":I
    ushr-int/lit8 v9, v8, 0x2

    .line 989
    .local v9, "uintCount":I
    and-int/lit8 v6, v8, 0x3

    .line 991
    .local v6, "byteCount":I
    invoke-interface/range {p0 .. p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    .line 992
    .local v2, "aIndex":I
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    .line 994
    .local v4, "bIndex":I
    invoke-interface/range {p0 .. p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v14

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v15

    if-ne v14, v15, :cond_2

    .line 995
    move v7, v9

    .local v7, "i":I
    :goto_0
    if-lez v7, :cond_5

    .line 996
    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedInt(I)J

    move-result-wide v10

    .line 997
    .local v10, "va":J
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedInt(I)J

    move-result-wide v12

    .line 998
    .local v12, "vb":J
    cmp-long v14, v10, v12

    if-lez v14, :cond_0

    .line 999
    const/4 v14, 0x1

    .line 1035
    .end local v10    # "va":J
    .end local v12    # "vb":J
    :goto_1
    return v14

    .line 1001
    .restart local v10    # "va":J
    .restart local v12    # "vb":J
    :cond_0
    cmp-long v14, v10, v12

    if-gez v14, :cond_1

    .line 1002
    const/4 v14, -0x1

    goto :goto_1

    .line 1004
    :cond_1
    add-int/lit8 v2, v2, 0x4

    .line 1005
    add-int/lit8 v4, v4, 0x4

    .line 995
    add-int/lit8 v7, v7, -0x1

    goto :goto_0

    .line 1008
    .end local v7    # "i":I
    .end local v10    # "va":J
    .end local v12    # "vb":J
    :cond_2
    move v7, v9

    .restart local v7    # "i":I
    :goto_2
    if-lez v7, :cond_5

    .line 1009
    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedInt(I)J

    move-result-wide v10

    .line 1010
    .restart local v10    # "va":J
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getInt(I)I

    move-result v14

    invoke-static {v14}, Lorg/jboss/netty/buffer/ChannelBuffers;->swapInt(I)I

    move-result v14

    int-to-long v14, v14

    const-wide v16, 0xffffffffL

    and-long v12, v14, v16

    .line 1011
    .restart local v12    # "vb":J
    cmp-long v14, v10, v12

    if-lez v14, :cond_3

    .line 1012
    const/4 v14, 0x1

    goto :goto_1

    .line 1014
    :cond_3
    cmp-long v14, v10, v12

    if-gez v14, :cond_4

    .line 1015
    const/4 v14, -0x1

    goto :goto_1

    .line 1017
    :cond_4
    add-int/lit8 v2, v2, 0x4

    .line 1018
    add-int/lit8 v4, v4, 0x4

    .line 1008
    add-int/lit8 v7, v7, -0x1

    goto :goto_2

    .line 1022
    .end local v10    # "va":J
    .end local v12    # "vb":J
    :cond_5
    move v7, v6

    :goto_3
    if-lez v7, :cond_8

    .line 1023
    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v10

    .line 1024
    .local v10, "va":S
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v12

    .line 1025
    .local v12, "vb":S
    if-le v10, v12, :cond_6

    .line 1026
    const/4 v14, 0x1

    goto :goto_1

    .line 1028
    :cond_6
    if-ge v10, v12, :cond_7

    .line 1029
    const/4 v14, -0x1

    goto :goto_1

    .line 1031
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 1032
    add-int/lit8 v4, v4, 0x1

    .line 1022
    add-int/lit8 v7, v7, -0x1

    goto :goto_3

    .line 1035
    .end local v10    # "va":S
    .end local v12    # "vb":S
    :cond_8
    sub-int v14, v3, v5

    goto :goto_1
.end method

.method private static compositeBuffer(Ljava/nio/ByteOrder;Ljava/util/List;Z)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p2, "gathering"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteOrder;",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;Z)",
            "Lorg/jboss/netty/buffer/ChannelBuffer;"
        }
    .end annotation

    .prologue
    .line 376
    .local p1, "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 382
    new-instance v0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    invoke-direct {v0, p0, p1, p2}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;-><init>(Ljava/nio/ByteOrder;Ljava/util/List;Z)V

    :goto_0
    return-object v0

    .line 378
    :pswitch_0
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 380
    :pswitch_1
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 376
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static copiedBuffer(Ljava/lang/CharSequence;IILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "string"    # Ljava/lang/CharSequence;
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 722
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;Ljava/lang/CharSequence;IILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "string"    # Ljava/lang/CharSequence;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 711
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 574
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    .line 575
    .local v1, "length":I
    if-nez v1, :cond_0

    .line 576
    sget-object v3, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 585
    :goto_0
    return-object v3

    .line 578
    :cond_0
    new-array v0, v1, [B

    .line 579
    .local v0, "copy":[B
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 581
    .local v2, "position":I
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 583
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 585
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-static {v3, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    goto :goto_0

    .line 583
    :catchall_0
    move-exception v3

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    throw v3
.end method

.method public static copiedBuffer(Ljava/nio/ByteOrder;Ljava/lang/CharSequence;IILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "string"    # Ljava/lang/CharSequence;
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 753
    if-nez p1, :cond_0

    .line 754
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "string"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 756
    :cond_0
    if-nez p3, :cond_1

    .line 757
    sget-object v1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 776
    :goto_0
    return-object v1

    .line 760
    :cond_1
    instance-of v1, p1, Ljava/nio/CharBuffer;

    if-eqz v1, :cond_3

    move-object v0, p1

    .line 761
    check-cast v0, Ljava/nio/CharBuffer;

    .line 762
    .local v0, "buf":Ljava/nio/CharBuffer;
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->hasArray()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 763
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->array()[C

    move-result-object v1

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->arrayOffset()I

    move-result v2

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->position()I

    move-result v3

    add-int/2addr v2, v3

    add-int/2addr v2, p2

    invoke-static {p0, v1, v2, p3, p4}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[CIILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    goto :goto_0

    .line 770
    :cond_2
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->slice()Ljava/nio/CharBuffer;

    move-result-object v0

    .line 771
    invoke-virtual {v0, p3}, Ljava/nio/CharBuffer;->limit(I)Ljava/nio/Buffer;

    .line 772
    invoke-virtual {v0, p2}, Ljava/nio/CharBuffer;->position(I)Ljava/nio/Buffer;

    .line 773
    invoke-static {p0, v0, p4}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    goto :goto_0

    .line 776
    .end local v0    # "buf":Ljava/nio/CharBuffer;
    :cond_3
    add-int v1, p2, p3

    invoke-static {p1, p2, v1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;II)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-static {p0, v1, p4}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    goto :goto_0
.end method

.method public static copiedBuffer(Ljava/nio/ByteOrder;Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "string"    # Ljava/lang/CharSequence;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 733
    if-nez p1, :cond_0

    .line 734
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "string"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 737
    :cond_0
    instance-of v0, p1, Ljava/nio/CharBuffer;

    if-eqz v0, :cond_1

    .line 738
    check-cast p1, Ljava/nio/CharBuffer;

    .end local p1    # "string":Ljava/lang/CharSequence;
    invoke-static {p0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 741
    :goto_0
    return-object v0

    .restart local p1    # "string":Ljava/lang/CharSequence;
    :cond_1
    invoke-static {p1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    goto :goto_0
.end method

.method private static copiedBuffer(Ljava/nio/ByteOrder;Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "buffer"    # Ljava/nio/CharBuffer;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 833
    move-object v2, p1

    .line 834
    .local v2, "src":Ljava/nio/CharBuffer;
    invoke-static {v2, p2}, Lorg/jboss/netty/buffer/ChannelBuffers;->encodeString(Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 835
    .local v0, "dst":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-static {p0, v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 836
    .local v1, "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-interface {v1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    .line 837
    return-object v1
.end method

.method public static copiedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "array"    # [B

    .prologue
    .line 524
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne p0, v0, :cond_1

    .line 525
    array-length v0, p1

    if-nez v0, :cond_0

    .line 526
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 533
    :goto_0
    return-object v0

    .line 528
    :cond_0
    new-instance v1, Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;

    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-direct {v1, v0}, Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;-><init>([B)V

    move-object v0, v1

    goto :goto_0

    .line 529
    :cond_1
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne p0, v0, :cond_3

    .line 530
    array-length v0, p1

    if-nez v0, :cond_2

    .line 531
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 533
    :cond_2
    new-instance v1, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;

    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-direct {v1, v0}, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;-><init>([B)V

    move-object v0, v1

    goto :goto_0

    .line 535
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "endianness"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static copiedBuffer(Ljava/nio/ByteOrder;[BII)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "array"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 556
    if-nez p0, :cond_0

    .line 557
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "endianness"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 559
    :cond_0
    if-nez p3, :cond_1

    .line 560
    sget-object v1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 564
    :goto_0
    return-object v1

    .line 562
    :cond_1
    new-array v0, p3, [B

    .line 563
    .local v0, "copy":[B
    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 564
    invoke-static {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    goto :goto_0
.end method

.method public static copiedBuffer(Ljava/nio/ByteOrder;[CIILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "array"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 822
    if-nez p1, :cond_0

    .line 823
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "array"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 825
    :cond_0
    if-nez p3, :cond_1

    .line 826
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 828
    :goto_0
    return-object v0

    :cond_1
    invoke-static {p1, p2, p3}, Ljava/nio/CharBuffer;->wrap([CII)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-static {p0, v0, p4}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    goto :goto_0
.end method

.method public static copiedBuffer(Ljava/nio/ByteOrder;[CLjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "array"    # [C
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 810
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[CIILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static varargs copiedBuffer(Ljava/nio/ByteOrder;[[B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 11
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "arrays"    # [[B

    .prologue
    const/4 v10, 0x0

    .line 619
    array-length v8, p1

    packed-switch v8, :pswitch_data_0

    .line 631
    const/4 v6, 0x0

    .line 632
    .local v6, "length":I
    move-object v1, p1

    .local v1, "arr$":[[B
    array-length v5, v1

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_2

    aget-object v0, v1, v3

    .line 633
    .local v0, "a":[B
    const v8, 0x7fffffff

    sub-int/2addr v8, v6

    array-length v9, v0

    if-ge v8, v9, :cond_1

    .line 634
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "The total length of the specified arrays is too big."

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 621
    .end local v0    # "a":[B
    .end local v1    # "arr$":[[B
    .end local v3    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "length":I
    :pswitch_0
    sget-object v8, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 651
    :goto_1
    return-object v8

    .line 623
    :pswitch_1
    aget-object v8, p1, v10

    array-length v8, v8

    if-nez v8, :cond_0

    .line 624
    sget-object v8, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_1

    .line 626
    :cond_0
    aget-object v8, p1, v10

    invoke-static {p0, v8}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    goto :goto_1

    .line 637
    .restart local v0    # "a":[B
    .restart local v1    # "arr$":[[B
    .restart local v3    # "i$":I
    .restart local v5    # "len$":I
    .restart local v6    # "length":I
    :cond_1
    array-length v8, v0

    add-int/2addr v6, v8

    .line 632
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 640
    .end local v0    # "a":[B
    :cond_2
    if-nez v6, :cond_3

    .line 641
    sget-object v8, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_1

    .line 644
    :cond_3
    new-array v7, v6, [B

    .line 645
    .local v7, "mergedArray":[B
    const/4 v2, 0x0

    .local v2, "i":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_2
    array-length v8, p1

    if-ge v2, v8, :cond_4

    .line 646
    aget-object v0, p1, v2

    .line 647
    .restart local v0    # "a":[B
    array-length v8, v0

    invoke-static {v0, v10, v7, v4, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 648
    array-length v8, v0

    add-int/2addr v4, v8

    .line 645
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 651
    .end local v0    # "a":[B
    :cond_4
    invoke-static {p0, v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    goto :goto_1

    .line 619
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static copiedBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 595
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 596
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->copy()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 598
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0
.end method

.method public static copiedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "array"    # [B

    .prologue
    .line 514
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static copiedBuffer([BII)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "array"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 546
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static copiedBuffer([CIILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "array"    # [C
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 799
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[CIILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static copiedBuffer([CLjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p0, "array"    # [C
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 788
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/4 v1, 0x0

    array-length v2, p0

    invoke-static {v0, p0, v1, v2, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[CIILjava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static varargs copiedBuffer([Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p0, "buffers"    # [Ljava/nio/ByteBuffer;

    .prologue
    const/4 v3, 0x0

    .line 690
    array-length v2, p0

    packed-switch v2, :pswitch_data_0

    .line 697
    array-length v2, p0

    new-array v0, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 698
    .local v0, "copiedBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 699
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 698
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 692
    .end local v0    # "copiedBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "i":I
    :pswitch_0
    sget-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 701
    :goto_1
    return-object v2

    .line 694
    :pswitch_1
    aget-object v2, p0, v3

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    goto :goto_1

    .line 701
    .restart local v0    # "copiedBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v1    # "i":I
    :cond_0
    invoke-static {v3, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Z[Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    goto :goto_1

    .line 690
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static varargs copiedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p0, "buffers"    # [Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v3, 0x0

    .line 665
    array-length v2, p0

    packed-switch v2, :pswitch_data_0

    .line 672
    array-length v2, p0

    new-array v0, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 673
    .local v0, "copiedBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 674
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 673
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 667
    .end local v0    # "copiedBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "i":I
    :pswitch_0
    sget-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 676
    :goto_1
    return-object v2

    .line 669
    :pswitch_1
    aget-object v2, p0, v3

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    goto :goto_1

    .line 676
    .restart local v0    # "copiedBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v1    # "i":I
    :cond_0
    invoke-static {v3, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Z[Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    goto :goto_1

    .line 665
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static varargs copiedBuffer([[B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "arrays"    # [[B

    .prologue
    .line 609
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/nio/ByteOrder;[[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method static decodeString(Ljava/nio/ByteBuffer;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 8
    .param p0, "src"    # Ljava/nio/ByteBuffer;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 1176
    invoke-static {p1}, Lorg/jboss/netty/util/CharsetUtil;->getDecoder(Ljava/nio/charset/Charset;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    .line 1177
    .local v1, "decoder":Ljava/nio/charset/CharsetDecoder;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    int-to-double v4, v4

    invoke-virtual {v1}, Ljava/nio/charset/CharsetDecoder;->maxCharsPerByte()F

    move-result v6

    float-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-int v4, v4

    invoke-static {v4}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v2

    .line 1180
    .local v2, "dst":Ljava/nio/CharBuffer;
    const/4 v4, 0x1

    :try_start_0
    invoke-virtual {v1, p0, v2, v4}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 1181
    .local v0, "cr":Ljava/nio/charset/CoderResult;
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1182
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 1184
    :cond_0
    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetDecoder;->flush(Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 1185
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1186
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1191
    :cond_1
    invoke-virtual {v2}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 1188
    .end local v0    # "cr":Ljava/nio/charset/CoderResult;
    :catch_0
    move-exception v3

    .line 1189
    .local v3, "x":Ljava/nio/charset/CharacterCodingException;
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static directBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "capacity"    # I

    .prologue
    .line 151
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->directBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static directBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "capacity"    # I

    .prologue
    .line 160
    if-nez p0, :cond_0

    .line 161
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "endianness"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_0
    if-nez p1, :cond_1

    .line 164
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 170
    :goto_0
    return-object v0

    .line 167
    :cond_1
    new-instance v0, Lorg/jboss/netty/buffer/ByteBufferBackedChannelBuffer;

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/buffer/ByteBufferBackedChannelBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 169
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->clear()V

    goto :goto_0
.end method

.method public static dynamicBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2

    .prologue
    .line 179
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v1, 0x100

    invoke-static {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static dynamicBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "estimatedLength"    # I

    .prologue
    .line 197
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static dynamicBuffer(ILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "estimatedLength"    # I
    .param p1, "factory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 217
    if-nez p1, :cond_0

    .line 218
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "factory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_0
    new-instance v0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getDefaultOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;-><init>(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)V

    return-object v0
.end method

.method public static dynamicBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "estimatedLength"    # I

    .prologue
    .line 207
    new-instance v0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;

    invoke-direct {v0, p0, p1}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;-><init>(Ljava/nio/ByteOrder;I)V

    return-object v0
.end method

.method public static dynamicBuffer(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "estimatedLength"    # I
    .param p2, "factory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 232
    new-instance v0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;

    invoke-direct {v0, p0, p1, p2}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;-><init>(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)V

    return-object v0
.end method

.method public static dynamicBuffer(Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p0, "factory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 183
    if-nez p0, :cond_0

    .line 184
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "factory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 187
    :cond_0
    new-instance v0, Lorg/jboss/netty/buffer/DynamicChannelBuffer;

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getDefaultOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    const/16 v2, 0x100

    invoke-direct {v0, v1, v2, p0}, Lorg/jboss/netty/buffer/DynamicChannelBuffer;-><init>(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)V

    return-object v0
.end method

.method static encodeString(Ljava/nio/CharBuffer;Ljava/nio/charset/Charset;)Ljava/nio/ByteBuffer;
    .locals 8
    .param p0, "src"    # Ljava/nio/CharBuffer;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 1156
    invoke-static {p1}, Lorg/jboss/netty/util/CharsetUtil;->getEncoder(Ljava/nio/charset/Charset;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v2

    .line 1157
    .local v2, "encoder":Ljava/nio/charset/CharsetEncoder;
    invoke-virtual {p0}, Ljava/nio/CharBuffer;->remaining()I

    move-result v4

    int-to-double v4, v4

    invoke-virtual {v2}, Ljava/nio/charset/CharsetEncoder;->maxBytesPerChar()F

    move-result v6

    float-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-int v4, v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1160
    .local v1, "dst":Ljava/nio/ByteBuffer;
    const/4 v4, 0x1

    :try_start_0
    invoke-virtual {v2, p0, v1, v4}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;Ljava/nio/ByteBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 1161
    .local v0, "cr":Ljava/nio/charset/CoderResult;
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1162
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 1164
    :cond_0
    invoke-virtual {v2, v1}, Ljava/nio/charset/CharsetEncoder;->flush(Ljava/nio/ByteBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 1165
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1166
    invoke-virtual {v0}, Ljava/nio/charset/CoderResult;->throwException()V
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1171
    :cond_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 1172
    return-object v1

    .line 1168
    .end local v0    # "cr":Ljava/nio/charset/CoderResult;
    :catch_0
    move-exception v3

    .line 1169
    .local v3, "x":Ljava/nio/charset/CharacterCodingException;
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static equals(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;)Z
    .locals 12
    .param p0, "bufferA"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "bufferB"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v6, 0x0

    .line 940
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 941
    .local v1, "aLen":I
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    if-eq v1, v7, :cond_1

    .line 977
    :cond_0
    :goto_0
    return v6

    .line 945
    :cond_1
    ushr-int/lit8 v5, v1, 0x3

    .line 946
    .local v5, "longCount":I
    and-int/lit8 v3, v1, 0x7

    .line 948
    .local v3, "byteCount":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    .line 949
    .local v0, "aIndex":I
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    .line 951
    .local v2, "bIndex":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v7

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v8

    if-ne v7, v8, :cond_2

    .line 952
    move v4, v5

    .local v4, "i":I
    :goto_1
    if-lez v4, :cond_3

    .line 953
    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v8

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v10

    cmp-long v7, v8, v10

    if-nez v7, :cond_0

    .line 956
    add-int/lit8 v0, v0, 0x8

    .line 957
    add-int/lit8 v2, v2, 0x8

    .line 952
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 960
    .end local v4    # "i":I
    :cond_2
    move v4, v5

    .restart local v4    # "i":I
    :goto_2
    if-lez v4, :cond_3

    .line 961
    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v8

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Lorg/jboss/netty/buffer/ChannelBuffers;->swapLong(J)J

    move-result-wide v10

    cmp-long v7, v8, v10

    if-nez v7, :cond_0

    .line 964
    add-int/lit8 v0, v0, 0x8

    .line 965
    add-int/lit8 v2, v2, 0x8

    .line 960
    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    .line 969
    :cond_3
    move v4, v3

    :goto_3
    if-lez v4, :cond_4

    .line 970
    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v7

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v8

    if-ne v7, v8, :cond_0

    .line 973
    add-int/lit8 v0, v0, 0x1

    .line 974
    add-int/lit8 v2, v2, 0x1

    .line 969
    add-int/lit8 v4, v4, -0x1

    goto :goto_3

    .line 977
    :cond_4
    const/4 v6, 0x1

    goto :goto_0
.end method

.method private static firstIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IIB)I
    .locals 3
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "value"    # B

    .prologue
    const/4 v1, -0x1

    .line 1094
    const/4 v2, 0x0

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1095
    if-ge p1, p2, :cond_0

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    if-nez v2, :cond_2

    :cond_0
    move v0, v1

    .line 1105
    :cond_1
    :goto_0
    return v0

    .line 1099
    :cond_2
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_3

    .line 1100
    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v2

    if-eq v2, p3, :cond_1

    .line 1099
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1105
    goto :goto_0
.end method

.method private static firstIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 3
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    const/4 v1, -0x1

    .line 1125
    const/4 v2, 0x0

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1126
    if-ge p1, p2, :cond_0

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    if-nez v2, :cond_2

    :cond_0
    move v0, v1

    .line 1136
    :cond_1
    :goto_0
    return v0

    .line 1130
    :cond_2
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_3

    .line 1131
    invoke-interface {p3, p0, v0}, Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;->find(Lorg/jboss/netty/buffer/ChannelBuffer;I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1130
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1136
    goto :goto_0
.end method

.method public static hashCode(Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 9
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 905
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    .line 906
    .local v0, "aLen":I
    ushr-int/lit8 v6, v0, 0x2

    .line 907
    .local v6, "intCount":I
    and-int/lit8 v3, v0, 0x3

    .line 909
    .local v3, "byteCount":I
    const/4 v4, 0x1

    .line 910
    .local v4, "hashCode":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    .line 911
    .local v1, "arrayIndex":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v7

    sget-object v8, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v7, v8, :cond_0

    .line 912
    move v5, v6

    .local v5, "i":I
    :goto_0
    if-lez v5, :cond_1

    .line 913
    mul-int/lit8 v7, v4, 0x1f

    invoke-interface {p0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getInt(I)I

    move-result v8

    add-int v4, v7, v8

    .line 914
    add-int/lit8 v1, v1, 0x4

    .line 912
    add-int/lit8 v5, v5, -0x1

    goto :goto_0

    .line 917
    .end local v5    # "i":I
    :cond_0
    move v5, v6

    .restart local v5    # "i":I
    :goto_1
    if-lez v5, :cond_1

    .line 918
    mul-int/lit8 v7, v4, 0x1f

    invoke-interface {p0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getInt(I)I

    move-result v8

    invoke-static {v8}, Lorg/jboss/netty/buffer/ChannelBuffers;->swapInt(I)I

    move-result v8

    add-int v4, v7, v8

    .line 919
    add-int/lit8 v1, v1, 0x4

    .line 917
    add-int/lit8 v5, v5, -0x1

    goto :goto_1

    .line 923
    :cond_1
    move v5, v3

    move v2, v1

    .end local v1    # "arrayIndex":I
    .local v2, "arrayIndex":I
    :goto_2
    if-lez v5, :cond_2

    .line 924
    mul-int/lit8 v7, v4, 0x1f

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "arrayIndex":I
    .restart local v1    # "arrayIndex":I
    invoke-interface {p0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v8

    add-int v4, v7, v8

    .line 923
    add-int/lit8 v5, v5, -0x1

    move v2, v1

    .end local v1    # "arrayIndex":I
    .restart local v2    # "arrayIndex":I
    goto :goto_2

    .line 927
    :cond_2
    if-nez v4, :cond_3

    .line 928
    const/4 v4, 0x1

    .line 931
    :cond_3
    return v4
.end method

.method public static hexDump(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;
    .locals 2
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 871
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    invoke-static {p0, v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->hexDump(Lorg/jboss/netty/buffer/ChannelBuffer;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hexDump(Lorg/jboss/netty/buffer/ChannelBuffer;II)Ljava/lang/String;
    .locals 7
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "fromIndex"    # I
    .param p2, "length"    # I

    .prologue
    .line 879
    if-gez p2, :cond_0

    .line 880
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "length: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 882
    :cond_0
    if-nez p2, :cond_1

    .line 883
    const-string v4, ""

    .line 897
    :goto_0
    return-object v4

    .line 886
    :cond_1
    add-int v2, p1, p2

    .line 887
    .local v2, "endIndex":I
    shl-int/lit8 v4, p2, 0x1

    new-array v0, v4, [C

    .line 889
    .local v0, "buf":[C
    move v3, p1

    .line 890
    .local v3, "srcIdx":I
    const/4 v1, 0x0

    .line 891
    .local v1, "dstIdx":I
    :goto_1
    if-ge v3, v2, :cond_2

    .line 892
    sget-object v4, Lorg/jboss/netty/buffer/ChannelBuffers;->HEXDUMP_TABLE:[C

    invoke-interface {p0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v5

    shl-int/lit8 v5, v5, 0x1

    const/4 v6, 0x2

    invoke-static {v4, v5, v0, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 891
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v1, v1, 0x2

    goto :goto_1

    .line 897
    :cond_2
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method

.method public static hexDump(Ljava/lang/String;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 857
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 858
    .local v2, "len":I
    div-int/lit8 v3, v2, 0x2

    new-array v0, v3, [B

    .line 859
    .local v0, "hexData":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 860
    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 859
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 863
    :cond_0
    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    return-object v3
.end method

.method public static indexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IIB)I
    .locals 1
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "value"    # B

    .prologue
    .line 1043
    if-gt p1, p2, :cond_0

    .line 1044
    invoke-static {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->firstIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IIB)I

    move-result v0

    .line 1046
    :goto_0
    return v0

    :cond_0
    invoke-static {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->lastIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IIB)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 1
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    .line 1056
    if-gt p1, p2, :cond_0

    .line 1057
    invoke-static {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->firstIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    .line 1059
    :goto_0
    return v0

    :cond_0
    invoke-static {p0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->lastIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I

    move-result v0

    goto :goto_0
.end method

.method private static lastIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IIB)I
    .locals 3
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "value"    # B

    .prologue
    const/4 v1, -0x1

    .line 1109
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 1110
    if-ltz p1, :cond_0

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    if-nez v2, :cond_2

    :cond_0
    move v0, v1

    .line 1120
    :cond_1
    :goto_0
    return v0

    .line 1114
    :cond_2
    add-int/lit8 v0, p1, -0x1

    .local v0, "i":I
    :goto_1
    if-lt v0, p2, :cond_3

    .line 1115
    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v2

    if-eq v2, p3, :cond_1

    .line 1114
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1120
    goto :goto_0
.end method

.method private static lastIndexOf(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferIndexFinder;)I
    .locals 3
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "indexFinder"    # Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;

    .prologue
    const/4 v1, -0x1

    .line 1141
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 1142
    if-ltz p1, :cond_0

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    if-nez v2, :cond_2

    :cond_0
    move v0, v1

    .line 1152
    :cond_1
    :goto_0
    return v0

    .line 1146
    :cond_2
    add-int/lit8 v0, p1, -0x1

    .local v0, "i":I
    :goto_1
    if-lt v0, p2, :cond_3

    .line 1147
    invoke-interface {p3, p0, v0}, Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;->find(Lorg/jboss/netty/buffer/ChannelBuffer;I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1146
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1152
    goto :goto_0
.end method

.method public static swapInt(I)I
    .locals 3
    .param p0, "value"    # I

    .prologue
    .line 1081
    int-to-short v0, p0

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->swapShort(S)S

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    ushr-int/lit8 v1, p0, 0x10

    int-to-short v1, v1

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->swapShort(S)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    return v0
.end method

.method public static swapLong(J)J
    .locals 6
    .param p0, "value"    # J

    .prologue
    const/16 v2, 0x20

    .line 1089
    long-to-int v0, p0

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->swapInt(I)I

    move-result v0

    int-to-long v0, v0

    shl-long/2addr v0, v2

    ushr-long v2, p0, v2

    long-to-int v2, v2

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->swapInt(I)I

    move-result v2

    int-to-long v2, v2

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static swapMedium(I)I
    .locals 2
    .param p0, "value"    # I

    .prologue
    .line 1074
    shl-int/lit8 v0, p0, 0x10

    const/high16 v1, 0xff0000

    and-int/2addr v0, v1

    const v1, 0xff00

    and-int/2addr v1, p0

    or-int/2addr v0, v1

    ushr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public static swapShort(S)S
    .locals 2
    .param p0, "value"    # S

    .prologue
    .line 1067
    shl-int/lit8 v0, p0, 0x8

    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public static unmodifiableBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 847
    instance-of v0, p0, Lorg/jboss/netty/buffer/ReadOnlyChannelBuffer;

    if-eqz v0, :cond_0

    .line 848
    check-cast p0, Lorg/jboss/netty/buffer/ReadOnlyChannelBuffer;

    .end local p0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-virtual {p0}, Lorg/jboss/netty/buffer/ReadOnlyChannelBuffer;->unwrap()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object p0

    .line 850
    .restart local p0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    new-instance v0, Lorg/jboss/netty/buffer/ReadOnlyChannelBuffer;

    invoke-direct {v0, p0}, Lorg/jboss/netty/buffer/ReadOnlyChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    return-object v0
.end method

.method public static wrappedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 308
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 309
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 315
    :goto_0
    return-object v0

    .line 311
    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 312
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    goto :goto_0

    .line 315
    :cond_1
    new-instance v0, Lorg/jboss/netty/buffer/ByteBufferBackedChannelBuffer;

    invoke-direct {v0, p0}, Lorg/jboss/netty/buffer/ByteBufferBackedChannelBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    goto :goto_0
.end method

.method public static wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "array"    # [B

    .prologue
    .line 250
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne p0, v0, :cond_1

    .line 251
    array-length v0, p1

    if-nez v0, :cond_0

    .line 252
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 259
    :goto_0
    return-object v0

    .line 254
    :cond_0
    new-instance v0, Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;

    invoke-direct {v0, p1}, Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;-><init>([B)V

    goto :goto_0

    .line 255
    :cond_1
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne p0, v0, :cond_3

    .line 256
    array-length v0, p1

    if-nez v0, :cond_2

    .line 257
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 259
    :cond_2
    new-instance v0, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;

    invoke-direct {v0, p1}, Lorg/jboss/netty/buffer/LittleEndianHeapChannelBuffer;-><init>([B)V

    goto :goto_0

    .line 261
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "endianness"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static wrappedBuffer(Ljava/nio/ByteOrder;[BII)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "array"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 280
    if-nez p0, :cond_0

    .line 281
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "endianness"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 283
    :cond_0
    if-nez p2, :cond_3

    .line 284
    array-length v0, p1

    if-ne p3, v0, :cond_1

    .line 285
    invoke-static {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 297
    :goto_0
    return-object v0

    .line 287
    :cond_1
    if-nez p3, :cond_2

    .line 288
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 290
    :cond_2
    new-instance v0, Lorg/jboss/netty/buffer/TruncatedChannelBuffer;

    invoke-static {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Lorg/jboss/netty/buffer/TruncatedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    goto :goto_0

    .line 294
    :cond_3
    if-nez p3, :cond_4

    .line 295
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 297
    :cond_4
    new-instance v0, Lorg/jboss/netty/buffer/SlicedChannelBuffer;

    invoke-static {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-direct {v0, v1, p2, p3}, Lorg/jboss/netty/buffer/SlicedChannelBuffer;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    goto :goto_0
.end method

.method public static varargs wrappedBuffer(Ljava/nio/ByteOrder;[[B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 7
    .param p0, "endianness"    # Ljava/nio/ByteOrder;
    .param p1, "arrays"    # [[B

    .prologue
    const/4 v6, 0x0

    .line 349
    array-length v5, p1

    packed-switch v5, :pswitch_data_0

    .line 359
    new-instance v2, Ljava/util/ArrayList;

    array-length v5, p1

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 360
    .local v2, "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    move-object v1, p1

    .local v1, "arr$":[[B
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 361
    .local v0, "a":[B
    if-nez v0, :cond_1

    .line 368
    .end local v0    # "a":[B
    :cond_0
    invoke-static {p0, v2, v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->compositeBuffer(Ljava/nio/ByteOrder;Ljava/util/List;Z)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    .line 371
    .end local v1    # "arr$":[[B
    .end local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :goto_1
    return-object v5

    .line 353
    :pswitch_0
    aget-object v5, p1, v6

    array-length v5, v5

    if-eqz v5, :cond_3

    .line 354
    aget-object v5, p1, v6

    invoke-static {p0, v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    goto :goto_1

    .line 364
    .restart local v0    # "a":[B
    .restart local v1    # "arr$":[[B
    .restart local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    :cond_1
    array-length v5, v0

    if-lez v5, :cond_2

    .line 365
    invoke-static {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 360
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 371
    .end local v0    # "a":[B
    .end local v1    # "arr$":[[B
    .end local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_3
    :pswitch_1
    sget-object v5, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_1

    .line 349
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static wrappedBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 325
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 328
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0
.end method

.method public static varargs wrappedBuffer(Z[Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 8
    .param p0, "gathering"    # Z
    .param p1, "buffers"    # [Ljava/nio/ByteBuffer;

    .prologue
    const/4 v7, 0x0

    .line 475
    array-length v6, p1

    packed-switch v6, :pswitch_data_0

    .line 484
    const/4 v5, 0x0

    .line 485
    .local v5, "order":Ljava/nio/ByteOrder;
    new-instance v2, Ljava/util/ArrayList;

    array-length v6, p1

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 486
    .local v2, "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/nio/ByteBuffer;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 487
    .local v1, "b":Ljava/nio/ByteBuffer;
    if-nez v1, :cond_1

    .line 502
    .end local v1    # "b":Ljava/nio/ByteBuffer;
    :cond_0
    invoke-static {v5, v2, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->compositeBuffer(Ljava/nio/ByteOrder;Ljava/util/List;Z)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 505
    .end local v0    # "arr$":[Ljava/nio/ByteBuffer;
    .end local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "order":Ljava/nio/ByteOrder;
    :goto_1
    return-object v6

    .line 479
    :pswitch_0
    aget-object v6, p1, v7

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 480
    aget-object v6, p1, v7

    invoke-static {v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    goto :goto_1

    .line 490
    .restart local v0    # "arr$":[Ljava/nio/ByteBuffer;
    .restart local v1    # "b":Ljava/nio/ByteBuffer;
    .restart local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v5    # "order":Ljava/nio/ByteOrder;
    :cond_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 491
    if-eqz v5, :cond_2

    .line 492
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 493
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "inconsistent byte order"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 497
    :cond_2
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v5

    .line 499
    :cond_3
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 486
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 505
    .end local v0    # "arr$":[Ljava/nio/ByteBuffer;
    .end local v1    # "b":Ljava/nio/ByteBuffer;
    .end local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "order":Ljava/nio/ByteOrder;
    :cond_5
    :pswitch_1
    sget-object v6, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_1

    .line 475
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static varargs wrappedBuffer(Z[Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 9
    .param p0, "gathering"    # Z
    .param p1, "buffers"    # [Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v7, 0x0

    .line 410
    array-length v6, p1

    packed-switch v6, :pswitch_data_0

    .line 419
    const/4 v5, 0x0

    .line 420
    .local v5, "order":Ljava/nio/ByteOrder;
    new-instance v2, Ljava/util/ArrayList;

    array-length v6, p1

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 421
    .local v2, "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    move-object v0, p1

    .local v0, "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 422
    .local v1, "c":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v1, :cond_1

    .line 445
    .end local v1    # "c":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    invoke-static {v5, v2, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->compositeBuffer(Ljava/nio/ByteOrder;Ljava/util/List;Z)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 447
    .end local v0    # "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "order":Ljava/nio/ByteOrder;
    :goto_1
    return-object v6

    .line 414
    :pswitch_0
    aget-object v6, p1, v7

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 415
    aget-object v6, p1, v7

    invoke-static {v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    goto :goto_1

    .line 425
    .restart local v0    # "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v1    # "c":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .restart local v3    # "i$":I
    .restart local v4    # "len$":I
    .restart local v5    # "order":Ljava/nio/ByteOrder;
    :cond_1
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 426
    if-eqz v5, :cond_2

    .line 427
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 428
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "inconsistent byte order"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 432
    :cond_2
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v5

    .line 434
    :cond_3
    instance-of v6, v1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    if-eqz v6, :cond_5

    move-object v6, v1

    .line 436
    check-cast v6, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v8

    invoke-virtual {v6, v7, v8}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->decompose(II)Ljava/util/List;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 421
    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 441
    :cond_5
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 447
    .end local v0    # "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "c":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "components":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "order":Ljava/nio/ByteOrder;
    :cond_6
    :pswitch_1
    sget-object v6, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_1

    .line 410
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "array"    # [B

    .prologue
    .line 241
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static wrappedBuffer([BII)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "array"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 271
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static varargs wrappedBuffer([Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "buffers"    # [Ljava/nio/ByteBuffer;

    .prologue
    .line 460
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Z[Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static varargs wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "buffers"    # [Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 396
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Z[Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static varargs wrappedBuffer([[B)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "arrays"    # [[B

    .prologue
    .line 338
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {v0, p0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteOrder;[[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method
