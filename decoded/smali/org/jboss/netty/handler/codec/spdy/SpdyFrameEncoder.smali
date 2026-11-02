.class public Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;
.super Ljava/lang/Object;
.source "SpdyFrameEncoder.java"


# instance fields
.field private final version:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V
    .locals 2
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    if-nez p1, :cond_0

    .line 38
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "spdyVersion"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->getVersion()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->version:I

    .line 41
    return-void
.end method

.method private writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V
    .locals 2
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "type"    # I
    .param p3, "flags"    # B
    .param p4, "length"    # I

    .prologue
    .line 44
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->version:I

    const v1, 0x8000

    or-int/2addr v0, v1

    invoke-interface {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    .line 45
    invoke-interface {p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    .line 46
    invoke-interface {p1, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 47
    invoke-interface {p1, p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeMedium(I)V

    .line 48
    return-void
.end method


# virtual methods
.method public encodeDataFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p1, "streamId"    # I
    .param p2, "last"    # Z
    .param p3, "data"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 51
    if-eqz p2, :cond_0

    move v0, v2

    .line 52
    .local v0, "flags":B
    :goto_0
    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v5, 0x8

    invoke-static {v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 53
    .local v1, "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    const v4, 0x7fffffff

    and-int/2addr v4, p1

    invoke-interface {v1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 54
    invoke-interface {v1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 55
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    invoke-interface {v1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeMedium(I)V

    .line 56
    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v1, v4, v3

    aput-object p3, v4, v2

    invoke-static {v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    return-object v2

    .end local v0    # "flags":B
    .end local v1    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    move v0, v3

    .line 51
    goto :goto_0
.end method

.method public encodeGoAwayFrame(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 5
    .param p1, "lastGoodStreamId"    # I
    .param p2, "statusCode"    # I

    .prologue
    .line 129
    const/4 v0, 0x0

    .line 130
    .local v0, "flags":B
    const/16 v2, 0x8

    .line 131
    .local v2, "length":I
    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v4, 0x10

    invoke-static {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 132
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v3, 0x7

    invoke-direct {p0, v1, v3, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 133
    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 134
    invoke-interface {v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 135
    return-object v1
.end method

.method public encodeHeadersFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 7
    .param p1, "streamId"    # I
    .param p2, "last"    # Z
    .param p3, "headerBlock"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 139
    if-eqz p2, :cond_0

    move v0, v3

    .line 140
    .local v0, "flags":B
    :goto_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    add-int/lit8 v2, v5, 0x4

    .line 141
    .local v2, "length":I
    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v6, 0xc

    invoke-static {v5, v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 142
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/16 v5, 0x8

    invoke-direct {p0, v1, v5, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 143
    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 144
    const/4 v5, 0x2

    new-array v5, v5, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v1, v5, v4

    aput-object p3, v5, v3

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    return-object v3

    .end local v0    # "flags":B
    .end local v1    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "length":I
    :cond_0
    move v0, v4

    .line 139
    goto :goto_0
.end method

.method public encodePingFrame(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 5
    .param p1, "id"    # I

    .prologue
    .line 120
    const/4 v0, 0x0

    .line 121
    .local v0, "flags":B
    const/4 v2, 0x4

    .line 122
    .local v2, "length":I
    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v4, 0xc

    invoke-static {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 123
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v3, 0x6

    invoke-direct {p0, v1, v3, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 124
    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 125
    return-object v1
.end method

.method public encodeRstStreamFrame(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 5
    .param p1, "streamId"    # I
    .param p2, "statusCode"    # I

    .prologue
    .line 85
    const/4 v0, 0x0

    .line 86
    .local v0, "flags":B
    const/16 v2, 0x8

    .line 87
    .local v2, "length":I
    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v4, 0x10

    invoke-static {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 88
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v3, 0x3

    invoke-direct {p0, v1, v3, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 89
    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 90
    invoke-interface {v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 91
    return-object v1
.end method

.method public encodeSettingsFrame(Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 10
    .param p1, "spdySettingsFrame"    # Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    .prologue
    const/4 v7, 0x1

    .line 95
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getIds()Ljava/util/Set;

    move-result-object v4

    .line 96
    .local v4, "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v6

    .line 98
    .local v6, "numSettings":I
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->clearPreviouslyPersistedSettings()Z

    move-result v8

    if-eqz v8, :cond_2

    move v0, v7

    .line 100
    .local v0, "flags":B
    :goto_0
    mul-int/lit8 v8, v6, 0x8

    add-int/lit8 v5, v8, 0x4

    .line 101
    .local v5, "length":I
    sget-object v8, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    add-int/lit8 v9, v5, 0x8

    invoke-static {v8, v9}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 102
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v8, 0x4

    invoke-direct {p0, v1, v8, v0, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 103
    invoke-interface {v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 104
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 105
    .local v3, "id":Ljava/lang/Integer;
    const/4 v0, 0x0

    .line 106
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-interface {p1, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->isPersistValue(I)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 107
    int-to-byte v0, v7

    .line 109
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-interface {p1, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->isPersisted(I)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 110
    or-int/lit8 v8, v0, 0x2

    int-to-byte v0, v8

    .line 112
    :cond_1
    invoke-interface {v1, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 113
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-interface {v1, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeMedium(I)V

    .line 114
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-interface {p1, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getValue(I)I

    move-result v8

    invoke-interface {v1, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    goto :goto_1

    .line 98
    .end local v0    # "flags":B
    .end local v1    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "id":Ljava/lang/Integer;
    .end local v5    # "length":I
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 116
    .restart local v0    # "flags":B
    .restart local v1    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v5    # "length":I
    :cond_3
    return-object v1
.end method

.method public encodeSynReplyFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 8
    .param p1, "streamId"    # I
    .param p2, "last"    # Z
    .param p3, "headerBlock"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v7, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 76
    if-eqz p2, :cond_0

    move v0, v3

    .line 77
    .local v0, "flags":B
    :goto_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    add-int/lit8 v2, v5, 0x4

    .line 78
    .local v2, "length":I
    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v6, 0xc

    invoke-static {v5, v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 79
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-direct {p0, v1, v7, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 80
    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 81
    new-array v5, v7, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v1, v5, v4

    aput-object p3, v5, v3

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    return-object v3

    .end local v0    # "flags":B
    .end local v1    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "length":I
    :cond_0
    move v0, v4

    .line 76
    goto :goto_0
.end method

.method public encodeSynStreamFrame(IIBZZLorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 7
    .param p1, "streamId"    # I
    .param p2, "associatedToStreamId"    # I
    .param p3, "priority"    # B
    .param p4, "last"    # Z
    .param p5, "unidirectional"    # Z
    .param p6, "headerBlock"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 62
    if-eqz p4, :cond_1

    move v0, v3

    .line 63
    .local v0, "flags":B
    :goto_0
    if-eqz p5, :cond_0

    .line 64
    or-int/lit8 v5, v0, 0x2

    int-to-byte v0, v5

    .line 66
    :cond_0
    invoke-interface {p6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    add-int/lit8 v2, v5, 0xa

    .line 67
    .local v2, "length":I
    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v6, 0x12

    invoke-static {v5, v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 68
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-direct {p0, v1, v3, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 69
    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 70
    invoke-interface {v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 71
    and-int/lit16 v5, p3, 0xff

    shl-int/lit8 v5, v5, 0xd

    invoke-interface {v1, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    .line 72
    const/4 v5, 0x2

    new-array v5, v5, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v1, v5, v4

    aput-object p6, v5, v3

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    return-object v3

    .end local v0    # "flags":B
    .end local v1    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "length":I
    :cond_1
    move v0, v4

    .line 62
    goto :goto_0
.end method

.method public encodeWindowUpdateFrame(II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 5
    .param p1, "streamId"    # I
    .param p2, "deltaWindowSize"    # I

    .prologue
    .line 148
    const/4 v0, 0x0

    .line 149
    .local v0, "flags":B
    const/16 v2, 0x8

    .line 150
    .local v2, "length":I
    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v4, 0x10

    invoke-static {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 151
    .local v1, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/16 v3, 0x9

    invoke-direct {p0, v1, v3, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameEncoder;->writeControlFrameHeader(Lorg/jboss/netty/buffer/ChannelBuffer;IBI)V

    .line 152
    invoke-interface {v1, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 153
    invoke-interface {v1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    .line 154
    return-object v1
.end method
