.class public Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;
.super Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;
.source "SpdyHeaderBlockRawDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$1;,
        Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;
    }
.end annotation


# static fields
.field private static final LENGTH_FIELD_SIZE:I = 0x4


# instance fields
.field private cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private headerSize:I

.field private length:I

.field private final maxHeaderSize:I

.field private name:Ljava/lang/String;

.field private numHeaders:I

.field private state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V
    .locals 2
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "maxHeaderSize"    # I

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockDecoder;-><init>()V

    .line 51
    if-nez p1, :cond_0

    .line 52
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "spdyVersion"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    iput p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->maxHeaderSize:I

    .line 55
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NUM_HEADERS:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 56
    return-void
.end method

.method private readLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 2
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 59
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    invoke-static {p1, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getSignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v0

    .line 60
    .local v0, "length":I
    const/4 v1, 0x4

    invoke-interface {p1, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 61
    return v0
.end method


# virtual methods
.method decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 2
    .param p1, "headerBlock"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 66
    if-nez p1, :cond_0

    .line 67
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "headerBlock"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_0
    if-nez p2, :cond_1

    .line 70
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "frame"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v0, :cond_3

    .line 74
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->decodeHeaderBlock(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 75
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 76
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 77
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 88
    :cond_2
    :goto_0
    return-void

    .line 80
    :cond_3
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 81
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, v0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->decodeHeaderBlock(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 82
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 83
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->discardReadBytes()V

    goto :goto_0

    .line 85
    :cond_4
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0
.end method

.method protected decodeHeaderBlock(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 12
    .param p1, "headerBlock"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x4

    .line 92
    :cond_0
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 93
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$spdy$SpdyHeaderBlockRawDecoder$State:[I

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    invoke-virtual {v8}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 281
    new-instance v7, Ljava/lang/Error;

    const-string v8, "Shouldn\'t reach here."

    invoke-direct {v7, v8}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v7

    .line 95
    :pswitch_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    if-ge v7, v10, :cond_2

    .line 284
    :cond_1
    :goto_1
    return-void

    .line 99
    :cond_2
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->readLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v7

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    .line 101
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    if-gez v7, :cond_3

    .line 102
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 103
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    goto :goto_0

    .line 104
    :cond_3
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    if-nez v7, :cond_4

    .line 105
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto :goto_0

    .line 107
    :cond_4
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto :goto_0

    .line 112
    :pswitch_1
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    if-lt v7, v10, :cond_1

    .line 116
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->readLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v7

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    .line 119
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-gtz v7, :cond_5

    .line 120
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 121
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    goto :goto_0

    .line 122
    :cond_5
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->maxHeaderSize:I

    if-gt v7, v8, :cond_6

    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->maxHeaderSize:I

    iget v9, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    sub-int/2addr v8, v9

    if-le v7, v8, :cond_7

    .line 123
    :cond_6
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->maxHeaderSize:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    .line 124
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->SKIP_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 125
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setTruncated()V

    goto :goto_0

    .line 127
    :cond_7
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    add-int/2addr v7, v8

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    .line 128
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 133
    :pswitch_2
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-lt v7, v8, :cond_1

    .line 137
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    new-array v2, v7, [B

    .line 138
    .local v2, "nameBytes":[B
    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 139
    new-instance v7, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v7, v2, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    .line 142
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v7

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 143
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 144
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    goto/16 :goto_0

    .line 146
    :cond_8
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_VALUE_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 151
    .end local v2    # "nameBytes":[B
    :pswitch_3
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 152
    .local v4, "skipLength":I
    invoke-interface {p1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 153
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    sub-int/2addr v7, v4

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    .line 155
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-nez v7, :cond_0

    .line 156
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_VALUE_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 161
    .end local v4    # "skipLength":I
    :pswitch_4
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    if-lt v7, v10, :cond_1

    .line 165
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->readLengthField(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v7

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    .line 168
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-gez v7, :cond_9

    .line 169
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 170
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    goto/16 :goto_0

    .line 171
    :cond_9
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-nez v7, :cond_c

    .line 172
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isTruncated()Z

    move-result v7

    if-nez v7, :cond_a

    .line 174
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v7

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 177
    :cond_a
    iput-object v11, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    .line 178
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    if-nez v7, :cond_b

    .line 179
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 181
    :cond_b
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 184
    :cond_c
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->maxHeaderSize:I

    if-gt v7, v8, :cond_d

    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->maxHeaderSize:I

    iget v9, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    sub-int/2addr v8, v9

    if-le v7, v8, :cond_e

    .line 185
    :cond_d
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->maxHeaderSize:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    .line 186
    iput-object v11, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    .line 187
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->SKIP_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 188
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setTruncated()V

    goto/16 :goto_0

    .line 190
    :cond_e
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    add-int/2addr v7, v8

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    .line 191
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_VALUE:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 196
    :pswitch_5
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-lt v7, v8, :cond_1

    .line 200
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    new-array v6, v7, [B

    .line 201
    .local v6, "valueBytes":[B
    invoke-interface {p1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 204
    const/4 v1, 0x0

    .line 205
    .local v1, "index":I
    const/4 v3, 0x0

    .line 208
    .local v3, "offset":I
    const/4 v7, 0x0

    aget-byte v7, v6, v7

    if-nez v7, :cond_10

    .line 209
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 210
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    goto/16 :goto_0

    .line 229
    :cond_f
    new-instance v5, Ljava/lang/String;

    sub-int v7, v1, v3

    const-string v8, "UTF-8"

    invoke-direct {v5, v6, v3, v7, v8}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 232
    .local v5, "value":Ljava/lang/String;
    :try_start_0
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v7

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    invoke-virtual {v7, v8, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    add-int/lit8 v1, v1, 0x1

    .line 240
    move v3, v1

    .line 214
    .end local v5    # "value":Ljava/lang/String;
    :cond_10
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-ge v1, v7, :cond_13

    .line 215
    :goto_2
    array-length v7, v6

    if-ge v1, v7, :cond_11

    aget-byte v7, v6, v1

    if-eqz v7, :cond_11

    .line 216
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 218
    :cond_11
    array-length v7, v6

    if-ge v1, v7, :cond_f

    .line 220
    add-int/lit8 v7, v1, 0x1

    array-length v8, v6

    if-eq v7, v8, :cond_12

    add-int/lit8 v7, v1, 0x1

    aget-byte v7, v6, v7

    if-nez v7, :cond_f

    .line 224
    :cond_12
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 225
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    .line 243
    :cond_13
    :goto_3
    iput-object v11, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    .line 246
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    sget-object v8, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    if-eq v7, v8, :cond_0

    .line 250
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    if-nez v7, :cond_14

    .line 251
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 233
    .restart local v5    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 236
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    goto :goto_3

    .line 253
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v5    # "value":Ljava/lang/String;
    :cond_14
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 258
    .end local v1    # "index":I
    .end local v3    # "offset":I
    .end local v6    # "valueBytes":[B
    :pswitch_6
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 259
    .restart local v4    # "skipLength":I
    invoke-interface {p1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 260
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    sub-int/2addr v7, v4

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    .line 262
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->length:I

    if-nez v7, :cond_0

    .line 263
    iget v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->numHeaders:I

    if-nez v7, :cond_15

    .line 264
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 266
    :cond_15
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NAME_LENGTH:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    goto/16 :goto_0

    .line 272
    .end local v4    # "skipLength":I
    :pswitch_7
    sget-object v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 273
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    goto/16 :goto_0

    .line 277
    :pswitch_8
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v7

    invoke-interface {p1, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    goto/16 :goto_1

    .line 93
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method end()V
    .locals 1

    .prologue
    .line 302
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 303
    return-void
.end method

.method endHeaderBlock(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V
    .locals 3
    .param p1, "frame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 288
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    sget-object v1, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->END_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    if-eq v0, v1, :cond_0

    .line 289
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setInvalid()V

    .line 292
    :cond_0
    iput-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 295
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->headerSize:I

    .line 296
    iput-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->name:Ljava/lang/String;

    .line 297
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;->READ_NUM_HEADERS:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaderBlockRawDecoder$State;

    .line 298
    return-void
.end method
