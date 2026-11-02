.class public Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;
.super Ljava/lang/Object;
.source "SpdyFrameDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$1;,
        Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;
    }
.end annotation


# instance fields
.field private final delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

.field private flags:B

.field private length:I

.field private final maxChunkSize:I

.field private numSettings:I

.field private final spdyVersion:I

.field private state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

.field private streamId:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;)V
    .locals 1
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "delegate"    # Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    .prologue
    .line 64
    const/16 v0, 0x2000

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;I)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;I)V
    .locals 3
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "delegate"    # Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;
    .param p3, "maxChunkSize"    # I

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    if-nez p1, :cond_0

    .line 72
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "spdyVersion"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_0
    if-nez p2, :cond_1

    .line 75
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "delegate"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_1
    if-gtz p3, :cond_2

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxChunkSize must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_2
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->getVersion()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->spdyVersion:I

    .line 82
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    .line 83
    iput p3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->maxChunkSize:I

    .line 84
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 85
    return-void
.end method

.method private static getNextState(II)Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;
    .locals 1
    .param p0, "type"    # I
    .param p1, "length"    # I

    .prologue
    .line 372
    packed-switch p0, :pswitch_data_0

    .line 401
    :pswitch_0
    if-eqz p1, :cond_0

    .line 402
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->DISCARD_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 404
    :goto_0
    return-object v0

    .line 374
    :pswitch_1
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_DATA_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 377
    :pswitch_2
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SYN_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 380
    :pswitch_3
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SYN_REPLY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 383
    :pswitch_4
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_RST_STREAM_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 386
    :pswitch_5
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SETTINGS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 389
    :pswitch_6
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_PING_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 392
    :pswitch_7
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_GOAWAY_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 395
    :pswitch_8
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADERS_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 398
    :pswitch_9
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_WINDOW_UPDATE_FRAME:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 404
    :cond_0
    sget-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto :goto_0

    .line 372
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method private static hasFlag(BB)Z
    .locals 1
    .param p0, "flags"    # B
    .param p1, "flag"    # B

    .prologue
    .line 368
    and-int v0, p0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isValidFrameHeader(IIBI)Z
    .locals 4
    .param p0, "streamId"    # I
    .param p1, "type"    # I
    .param p2, "flags"    # B
    .param p3, "length"    # I

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x4

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 410
    packed-switch p1, :pswitch_data_0

    .line 439
    :cond_0
    :goto_0
    :pswitch_0
    return v0

    .line 412
    :pswitch_1
    if-nez p0, :cond_0

    move v0, v1

    goto :goto_0

    .line 415
    :pswitch_2
    const/16 v2, 0xa

    if-ge p3, v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 418
    :pswitch_3
    if-ge p3, v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 421
    :pswitch_4
    if-nez p2, :cond_1

    if-eq p3, v3, :cond_0

    :cond_1
    move v0, v1

    goto :goto_0

    .line 424
    :pswitch_5
    if-ge p3, v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 427
    :pswitch_6
    if-eq p3, v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 430
    :pswitch_7
    if-eq p3, v3, :cond_0

    move v0, v1

    goto :goto_0

    .line 433
    :pswitch_8
    if-ge p3, v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 436
    :pswitch_9
    if-eq p3, v3, :cond_0

    move v0, v1

    goto :goto_0

    .line 410
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method


# virtual methods
.method public decode(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 34
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 92
    :goto_0
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$spdy$SpdyFrameDecoder$State:[I

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 362
    new-instance v4, Ljava/lang/Error;

    const-string v5, "Shouldn\'t reach here."

    invoke-direct {v4, v5}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v4

    .line 94
    :pswitch_0
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/16 v5, 0x8

    if-ge v4, v5, :cond_1

    .line 359
    :cond_0
    :goto_1
    return-void

    .line 98
    :cond_1
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v17

    .line 99
    .local v17, "frameOffset":I
    add-int/lit8 v16, v17, 0x4

    .line 100
    .local v16, "flagsOffset":I
    add-int/lit8 v21, v17, 0x5

    .line 101
    .local v21, "lengthOffset":I
    const/16 v4, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 103
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v4

    and-int/lit16 v4, v4, 0x80

    if-eqz v4, :cond_2

    const/4 v12, 0x1

    .line 107
    .local v12, "control":Z
    :goto_2
    if-eqz v12, :cond_3

    .line 109
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedShort(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    and-int/lit16 v0, v4, 0x7fff

    move/from16 v31, v0

    .line 110
    .local v31, "version":I
    add-int/lit8 v4, v17, 0x2

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedShort(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v29

    .line 111
    .local v29, "type":I
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    .line 119
    :goto_3
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v4

    move-object/from16 v0, p0

    iput-byte v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    .line 120
    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedMedium(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 123
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->spdyVersion:I

    move/from16 v0, v31

    if-eq v0, v4, :cond_4

    .line 124
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 125
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid SPDY Version"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 103
    .end local v12    # "control":Z
    .end local v29    # "type":I
    .end local v31    # "version":I
    :cond_2
    const/4 v12, 0x0

    goto :goto_2

    .line 114
    .restart local v12    # "control":Z
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->spdyVersion:I

    move/from16 v31, v0

    .line 115
    .restart local v31    # "version":I
    const/16 v29, 0x0

    .line 116
    .restart local v29    # "type":I
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    goto :goto_3

    .line 126
    :cond_4
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    move-object/from16 v0, p0

    iget-byte v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    move/from16 v32, v0

    move/from16 v0, v29

    move/from16 v1, v32

    invoke-static {v4, v0, v5, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->isValidFrameHeader(IIBI)Z

    move-result v4

    if-nez v4, :cond_5

    .line 127
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 128
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid Frame Error"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 130
    :cond_5
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    move/from16 v0, v29

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->getNextState(II)Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto/16 :goto_0

    .line 135
    .end local v12    # "control":Z
    .end local v16    # "flagsOffset":I
    .end local v17    # "frameOffset":I
    .end local v21    # "lengthOffset":I
    .end local v29    # "type":I
    .end local v31    # "version":I
    :pswitch_1
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    if-nez v4, :cond_6

    .line 136
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 137
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    move-object/from16 v0, p0

    iget-byte v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    move/from16 v32, v0

    const/16 v33, 0x1

    invoke-static/range {v32 .. v33}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v32

    sget-object v33, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    move/from16 v0, v32

    move-object/from16 v1, v33

    invoke-interface {v4, v5, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readDataFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 142
    :cond_6
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->maxChunkSize:I

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v14

    .line 145
    .local v14, "dataLength":I
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    if-lt v4, v14, :cond_0

    .line 149
    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v13

    .line 150
    .local v13, "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    sub-int/2addr v4, v14

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 152
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    if-nez v4, :cond_7

    .line 153
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 156
    :cond_7
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    if-nez v4, :cond_8

    move-object/from16 v0, p0

    iget-byte v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v4

    if-eqz v4, :cond_8

    const/4 v8, 0x1

    .line 158
    .local v8, "last":Z
    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    invoke-interface {v4, v5, v8, v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readDataFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 156
    .end local v8    # "last":Z
    :cond_8
    const/4 v8, 0x0

    goto :goto_4

    .line 162
    .end local v13    # "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v14    # "dataLength":I
    :pswitch_2
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/16 v5, 0xa

    if-lt v4, v5, :cond_0

    .line 166
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v23

    .line 167
    .local v23, "offset":I
    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    .line 168
    add-int/lit8 v4, v23, 0x4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v6

    .line 169
    .local v6, "associatedToStreamId":I
    add-int/lit8 v4, v23, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v4

    shr-int/lit8 v4, v4, 0x5

    and-int/lit8 v4, v4, 0x7

    int-to-byte v7, v4

    .line 170
    .local v7, "priority":B
    move-object/from16 v0, p0

    iget-byte v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v8

    .line 171
    .restart local v8    # "last":Z
    move-object/from16 v0, p0

    iget-byte v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    const/4 v5, 0x2

    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v9

    .line 172
    .local v9, "unidirectional":Z
    const/16 v4, 0xa

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 173
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    add-int/lit8 v4, v4, -0xa

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 175
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    if-nez v4, :cond_9

    .line 176
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 177
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid SYN_STREAM Frame"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 179
    :cond_9
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 180
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    invoke-interface/range {v4 .. v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readSynStreamFrame(IIBZZ)V

    goto/16 :goto_0

    .line 185
    .end local v6    # "associatedToStreamId":I
    .end local v7    # "priority":B
    .end local v8    # "last":Z
    .end local v9    # "unidirectional":Z
    .end local v23    # "offset":I
    :pswitch_3
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/4 v5, 0x4

    if-lt v4, v5, :cond_0

    .line 189
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    .line 190
    move-object/from16 v0, p0

    iget-byte v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v8

    .line 192
    .restart local v8    # "last":Z
    const/4 v4, 0x4

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 193
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    add-int/lit8 v4, v4, -0x4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 195
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    if-nez v4, :cond_a

    .line 196
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 197
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid SYN_REPLY Frame"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 199
    :cond_a
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 200
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    invoke-interface {v4, v5, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readSynReplyFrame(IZ)V

    goto/16 :goto_0

    .line 205
    .end local v8    # "last":Z
    :pswitch_4
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/16 v5, 0x8

    if-lt v4, v5, :cond_0

    .line 209
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    .line 210
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getSignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v28

    .line 211
    .local v28, "statusCode":I
    const/16 v4, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 213
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    if-eqz v4, :cond_b

    if-nez v28, :cond_c

    .line 214
    :cond_b
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 215
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid RST_STREAM Frame"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 217
    :cond_c
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 218
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    move/from16 v0, v28

    invoke-interface {v4, v5, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readRstStreamFrame(II)V

    goto/16 :goto_0

    .line 223
    .end local v28    # "statusCode":I
    :pswitch_5
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/4 v5, 0x4

    if-lt v4, v5, :cond_0

    .line 227
    move-object/from16 v0, p0

    iget-byte v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v10

    .line 229
    .local v10, "clear":Z
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->numSettings:I

    .line 230
    const/4 v4, 0x4

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 231
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    add-int/lit8 v4, v4, -0x4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 234
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    and-int/lit8 v4, v4, 0x7

    if-nez v4, :cond_d

    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    shr-int/lit8 v4, v4, 0x3

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->numSettings:I

    if-eq v4, v5, :cond_e

    .line 235
    :cond_d
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 236
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid SETTINGS Frame"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 238
    :cond_e
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_SETTING:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 239
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    invoke-interface {v4, v10}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readSettingsFrame(Z)V

    goto/16 :goto_0

    .line 244
    .end local v10    # "clear":Z
    :pswitch_6
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->numSettings:I

    if-nez v4, :cond_f

    .line 245
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 246
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readSettingsEnd()V

    goto/16 :goto_0

    .line 250
    :cond_f
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/16 v5, 0x8

    if-lt v4, v5, :cond_0

    .line 254
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v27

    .line 255
    .local v27, "settingsFlags":B
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedMedium(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v19

    .line 256
    .local v19, "id":I
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getSignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v30

    .line 257
    .local v30, "value":I
    const/4 v4, 0x1

    move/from16 v0, v27

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v24

    .line 258
    .local v24, "persistValue":Z
    const/4 v4, 0x2

    move/from16 v0, v27

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v25

    .line 259
    .local v25, "persisted":Z
    const/16 v4, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 261
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->numSettings:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->numSettings:I

    .line 263
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move/from16 v0, v19

    move/from16 v1, v30

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-interface {v4, v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readSetting(IIZZ)V

    goto/16 :goto_0

    .line 267
    .end local v19    # "id":I
    .end local v24    # "persistValue":Z
    .end local v25    # "persisted":Z
    .end local v27    # "settingsFlags":B
    .end local v30    # "value":I
    :pswitch_7
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/4 v5, 0x4

    if-lt v4, v5, :cond_0

    .line 271
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getSignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v26

    .line 272
    .local v26, "pingId":I
    const/4 v4, 0x4

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 274
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 275
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move/from16 v0, v26

    invoke-interface {v4, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readPingFrame(I)V

    goto/16 :goto_0

    .line 279
    .end local v26    # "pingId":I
    :pswitch_8
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/16 v5, 0x8

    if-lt v4, v5, :cond_0

    .line 283
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v20

    .line 284
    .local v20, "lastGoodStreamId":I
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getSignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v28

    .line 285
    .restart local v28    # "statusCode":I
    const/16 v4, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 287
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 288
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move/from16 v0, v20

    move/from16 v1, v28

    invoke-interface {v4, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readGoAwayFrame(II)V

    goto/16 :goto_0

    .line 292
    .end local v20    # "lastGoodStreamId":I
    .end local v28    # "statusCode":I
    :pswitch_9
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/4 v5, 0x4

    if-lt v4, v5, :cond_0

    .line 296
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    .line 297
    move-object/from16 v0, p0

    iget-byte v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->flags:B

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->hasFlag(BB)Z

    move-result v8

    .line 299
    .restart local v8    # "last":Z
    const/4 v4, 0x4

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 300
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    add-int/lit8 v4, v4, -0x4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 302
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    if-nez v4, :cond_10

    .line 303
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 304
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid HEADERS Frame"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 306
    :cond_10
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_HEADER_BLOCK:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 307
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    invoke-interface {v4, v5, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readHeadersFrame(IZ)V

    goto/16 :goto_0

    .line 312
    .end local v8    # "last":Z
    :pswitch_a
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    const/16 v5, 0x8

    if-lt v4, v5, :cond_0

    .line 316
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    .line 317
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->getUnsignedInt(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v15

    .line 318
    .local v15, "deltaWindowSize":I
    const/16 v4, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 320
    if-nez v15, :cond_11

    .line 321
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->FRAME_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 322
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    const-string v5, "Invalid WINDOW_UPDATE Frame"

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readFrameError(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 324
    :cond_11
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 325
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->streamId:I

    invoke-interface {v4, v5, v15}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readWindowUpdateFrame(II)V

    goto/16 :goto_0

    .line 330
    .end local v15    # "deltaWindowSize":I
    :pswitch_b
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    if-nez v4, :cond_12

    .line 331
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    .line 332
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readHeaderBlockEnd()V

    goto/16 :goto_0

    .line 336
    :cond_12
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 340
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 341
    .local v11, "compressedBytes":I
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v18

    .line 342
    .local v18, "headerBlock":Lorg/jboss/netty/buffer/ChannelBuffer;
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    sub-int/2addr v4, v11

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 344
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->delegate:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;->readHeaderBlock(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 348
    .end local v11    # "compressedBytes":I
    .end local v18    # "headerBlock":Lorg/jboss/netty/buffer/ChannelBuffer;
    :pswitch_c
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    move-object/from16 v0, p0

    iget v5, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v22

    .line 349
    .local v22, "numBytes":I
    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 350
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    sub-int v4, v4, v22

    move-object/from16 v0, p0

    iput v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    .line 351
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->length:I

    if-nez v4, :cond_0

    .line 352
    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;->READ_COMMON_HEADER:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder;->state:Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoder$State;

    goto/16 :goto_0

    .line 358
    .end local v22    # "numBytes":I
    :pswitch_d
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    goto/16 :goto_1

    .line 92
    nop

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
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method
