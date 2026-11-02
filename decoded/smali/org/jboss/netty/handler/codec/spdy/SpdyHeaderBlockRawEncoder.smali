.class public Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;
.super Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;
.source "SpdyHeaderBlockRawEncoder.java"


# instance fields
.field private final version:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V
    .locals 2
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockEncoder;-><init>()V

    .line 31
    if-nez p1, :cond_0

    .line 32
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "spdyVersion"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_0
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->getVersion()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->version:I

    .line 35
    return-void
.end method

.method private static setLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 0
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "writerIndex"    # I
    .param p2, "length"    # I

    .prologue
    .line 38
    invoke-interface {p0, p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setInt(II)V

    .line 39
    return-void
.end method

.method private static writeLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 0
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "length"    # I

    .prologue
    .line 42
    invoke-interface {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 43
    return-void
.end method


# virtual methods
.method public encode(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 14
    .param p1, "headerFrame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const v13, 0xffff

    .line 47
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v11

    invoke-virtual {v11}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->names()Ljava/util/Set;

    move-result-object v5

    .line 48
    .local v5, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v6

    .line 49
    .local v6, "numHeaders":I
    if-nez v6, :cond_1

    .line 50
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 86
    :cond_0
    return-object v0

    .line 52
    :cond_1
    if-le v6, v13, :cond_2

    .line 53
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "header block contains too many headers"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 56
    :cond_2
    sget-object v11, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v12, 0x100

    invoke-static {v11, v12}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 58
    .local v0, "headerBlock":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-static {v0, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->writeLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    .line 59
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 60
    .local v3, "name":Ljava/lang/String;
    const-string v11, "UTF-8"

    invoke-virtual {v3, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 61
    .local v4, "nameBytes":[B
    array-length v11, v4

    invoke-static {v0, v11}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->writeLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    .line 62
    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 63
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v7

    .line 64
    .local v7, "savedIndex":I
    const/4 v10, 0x0

    .line 65
    .local v10, "valueLength":I
    invoke-static {v0, v10}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->writeLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    .line 66
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v11

    invoke-virtual {v11, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 67
    .local v8, "value":Ljava/lang/String;
    const-string v11, "UTF-8"

    invoke-virtual {v8, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 68
    .local v9, "valueBytes":[B
    array-length v11, v9

    if-lez v11, :cond_4

    .line 69
    invoke-interface {v0, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 70
    const/4 v11, 0x0

    invoke-interface {v0, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 71
    array-length v11, v9

    add-int/lit8 v11, v11, 0x1

    add-int/2addr v10, v11

    goto :goto_1

    .line 74
    .end local v8    # "value":Ljava/lang/String;
    .end local v9    # "valueBytes":[B
    :cond_5
    if-eqz v10, :cond_6

    .line 75
    add-int/lit8 v10, v10, -0x1

    .line 77
    :cond_6
    if-le v10, v13, :cond_7

    .line 78
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "header exceeds allowable length: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 81
    :cond_7
    if-lez v10, :cond_3

    .line 82
    invoke-static {v0, v7, v10}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawEncoder;->setLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 83
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-interface {v0, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    goto :goto_0
.end method

.method end()V
    .locals 0

    .prologue
    .line 91
    return-void
.end method
