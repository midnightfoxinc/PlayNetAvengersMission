.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;
.super Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.source "WebSocket08FrameDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$1;,
        Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
        "<",
        "Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final OPCODE_BINARY:B = 0x2t

.field private static final OPCODE_CLOSE:B = 0x8t

.field private static final OPCODE_CONT:B = 0x0t

.field private static final OPCODE_PING:B = 0x9t

.field private static final OPCODE_PONG:B = 0xat

.field private static final OPCODE_TEXT:B = 0x1t

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final allowExtensions:Z

.field private fragmentedFramesCount:I

.field private frameFinalFlag:Z

.field private frameOpcode:I

.field private framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private framePayloadBytesRead:I

.field private framePayloadLength:J

.field private frameRsv:I

.field private final maskedPayload:Z

.field private maskingKey:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private final maxFramePayloadLength:J

.field private receivedClosingHandshake:Z

.field private utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const-class v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 2
    .param p1, "maskedPayload"    # Z
    .param p2, "allowExtensions"    # Z

    .prologue
    .line 112
    const-wide v0, 0x7fffffffffffffffL

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;-><init>(ZZJ)V

    .line 113
    return-void
.end method

.method public constructor <init>(ZZJ)V
    .locals 1
    .param p1, "maskedPayload"    # Z
    .param p2, "allowExtensions"    # Z
    .param p3, "maxFramePayloadLength"    # J

    .prologue
    .line 128
    sget-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;->FRAME_START:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;)V

    .line 129
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maskedPayload:Z

    .line 130
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->allowExtensions:Z

    .line 131
    iput-wide p3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maxFramePayloadLength:J

    .line 132
    return-void
.end method

.method private checkUTF8String(Lorg/jboss/netty/channel/Channel;[B)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
        }
    .end annotation

    .prologue
    .line 402
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    if-nez v1, :cond_0

    .line 403
    new-instance v1, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    invoke-direct {v1}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    .line 405
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    invoke-virtual {v1, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->check([B)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException; {:try_start_0 .. :try_end_0} :catch_0

    .line 409
    :goto_0
    return-void

    .line 406
    :catch_0
    move-exception v0

    .line 407
    .local v0, "ex":Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;)V

    goto :goto_0
.end method

.method private protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
        }
    .end annotation

    .prologue
    .line 381
    new-instance v0, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    invoke-direct {v0, p2}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;)V

    .line 382
    return-void
.end method

.method private protocolViolation(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "ex"    # Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
        }
    .end annotation

    .prologue
    .line 385
    sget-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;->CORRUPT:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 386
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 387
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 389
    :cond_0
    throw p2
.end method

.method private static toFrameLength(J)I
    .locals 4
    .param p0, "l"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;
        }
    .end annotation

    .prologue
    .line 393
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    .line 394
    new-instance v0, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Length:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 396
    :cond_0
    long-to-int v0, p0

    return v0
.end method

.method private unmask(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 5
    .param p1, "frame"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 374
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v0

    .line 375
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 376
    invoke-interface {p1, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v2

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maskingKey:Lorg/jboss/netty/buffer/ChannelBuffer;

    rem-int/lit8 v4, v1, 0x4

    invoke-interface {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v3

    xor-int/2addr v2, v3

    invoke-interface {p1, v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 375
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 378
    :cond_0
    return-void
.end method


# virtual methods
.method protected checkCloseFrameBody(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 7
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
        }
    .end annotation

    .prologue
    .line 412
    if-eqz p2, :cond_0

    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    if-nez v5, :cond_1

    .line 444
    :cond_0
    :goto_0
    return-void

    .line 415
    :cond_1
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    .line 416
    const-string v5, "Invalid close frame body"

    invoke-direct {p0, p1, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 420
    :cond_2
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    .line 421
    .local v2, "idx":I
    const/4 v5, 0x0

    invoke-interface {p2, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 424
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readShort()S

    move-result v3

    .line 425
    .local v3, "statusCode":I
    if-ltz v3, :cond_3

    const/16 v5, 0x3e7

    if-le v3, v5, :cond_5

    :cond_3
    const/16 v5, 0x3ec

    if-lt v3, v5, :cond_4

    const/16 v5, 0x3ee

    if-le v3, v5, :cond_5

    :cond_4
    const/16 v5, 0x3f4

    if-lt v3, v5, :cond_6

    const/16 v5, 0xbb7

    if-gt v3, v5, :cond_6

    .line 427
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid close frame status code: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p1, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 431
    :cond_6
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    if-lez v5, :cond_7

    .line 432
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    new-array v0, v5, [B

    .line 433
    .local v0, "b":[B
    invoke-interface {p2, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 435
    :try_start_0
    new-instance v4, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    invoke-direct {v4}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;-><init>()V

    .line 436
    .local v4, "validator":Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;
    invoke-virtual {v4, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->check([B)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException; {:try_start_0 .. :try_end_0} :catch_0

    .line 443
    .end local v0    # "b":[B
    .end local v4    # "validator":Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;
    :cond_7
    :goto_1
    invoke-interface {p2, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0

    .line 437
    .restart local v0    # "b":[B
    :catch_0
    move-exception v1

    .line 438
    .local v1, "ex":Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;
    invoke-direct {p0, p1, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;)V

    goto :goto_1
.end method

.method protected bridge synthetic decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x2"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "x3"    # Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 71
    check-cast p4, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;)Ljava/lang/Object;
    .locals 12
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 139
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->receivedClosingHandshake:Z

    if-eqz v5, :cond_0

    .line 140
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->actualReadableBytes()I

    move-result v5

    invoke-interface {p3, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 141
    const/4 v5, 0x0

    .line 367
    :goto_0
    return-object v5

    .line 144
    :cond_0
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$http$websocketx$WebSocket08FrameDecoder$State:[I

    invoke-virtual/range {p4 .. p4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;->ordinal()I

    move-result v8

    aget v5, v5, v8

    packed-switch v5, :pswitch_data_0

    .line 369
    new-instance v5, Ljava/lang/Error;

    const-string v8, "Shouldn\'t reach here."

    invoke-direct {v5, v8}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v5

    .line 146
    :pswitch_0
    const/4 v5, 0x0

    iput v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadBytesRead:I

    .line 147
    const-wide/16 v8, -0x1

    iput-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    .line 148
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 151
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    .line 152
    .local v0, "b":B
    and-int/lit16 v5, v0, 0x80

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    :goto_1
    iput-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    .line 153
    and-int/lit8 v5, v0, 0x70

    shr-int/lit8 v5, v5, 0x4

    iput v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    .line 154
    and-int/lit8 v5, v0, 0xf

    iput v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    .line 156
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v5}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 157
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Decoding WebSocket Frame opCode="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 161
    :cond_1
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    .line 162
    and-int/lit16 v5, v0, 0x80

    if-eqz v5, :cond_3

    const/4 v1, 0x1

    .line 163
    .local v1, "frameMasked":Z
    :goto_2
    and-int/lit8 v2, v0, 0x7f

    .line 165
    .local v2, "framePayloadLen1":I
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    if-eqz v5, :cond_4

    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->allowExtensions:Z

    if-nez v5, :cond_4

    .line 166
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "RSV != 0 and no extension negotiated, RSV:"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 167
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 152
    .end local v1    # "frameMasked":Z
    .end local v2    # "framePayloadLen1":I
    :cond_2
    const/4 v5, 0x0

    goto :goto_1

    .line 162
    :cond_3
    const/4 v1, 0x0

    goto :goto_2

    .line 170
    .restart local v1    # "frameMasked":Z
    .restart local v2    # "framePayloadLen1":I
    :cond_4
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maskedPayload:Z

    if-eqz v5, :cond_5

    if-nez v1, :cond_5

    .line 171
    const-string v5, "unmasked client to server frame"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 172
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 174
    :cond_5
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/4 v8, 0x7

    if-le v5, v8, :cond_9

    .line 177
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    if-nez v5, :cond_6

    .line 178
    const-string v5, "fragmented control frame"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 179
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 183
    :cond_6
    const/16 v5, 0x7d

    if-le v2, v5, :cond_7

    .line 184
    const-string v5, "control frame with payload length > 125 octets"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 185
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 189
    :cond_7
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0x8

    if-eq v5, v8, :cond_8

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0x9

    if-eq v5, v8, :cond_8

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0xa

    if-eq v5, v8, :cond_8

    .line 190
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "control frame using reserved opcode "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 191
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 197
    :cond_8
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0x8

    if-ne v5, v8, :cond_c

    const/4 v5, 0x1

    if-ne v2, v5, :cond_c

    .line 198
    const-string v5, "received close control frame with payload len 1"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 199
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 203
    :cond_9
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    if-eqz v5, :cond_a

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/4 v8, 0x1

    if-eq v5, v8, :cond_a

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/4 v8, 0x2

    if-eq v5, v8, :cond_a

    .line 204
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "data frame using reserved opcode "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 205
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 209
    :cond_a
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->fragmentedFramesCount:I

    if-nez v5, :cond_b

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    if-nez v5, :cond_b

    .line 210
    const-string v5, "received continuation data frame outside fragmented message"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 211
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 215
    :cond_b
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->fragmentedFramesCount:I

    if-eqz v5, :cond_c

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    if-eqz v5, :cond_c

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0x9

    if-eq v5, v8, :cond_c

    .line 216
    const-string v5, "received non-continuation data frame while inside fragmented message"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 217
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 222
    :cond_c
    const/16 v5, 0x7e

    if-ne v2, v5, :cond_d

    .line 223
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedShort()I

    move-result v5

    int-to-long v8, v5

    iput-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    .line 224
    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    const-wide/16 v10, 0x7e

    cmp-long v5, v8, v10

    if-gez v5, :cond_f

    .line 225
    const-string v5, "invalid data frame length (not using minimal length encoding)"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 226
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 228
    :cond_d
    const/16 v5, 0x7f

    if-ne v2, v5, :cond_e

    .line 229
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readLong()J

    move-result-wide v8

    iput-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    .line 233
    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    const-wide/32 v10, 0x10000

    cmp-long v5, v8, v10

    if-gez v5, :cond_f

    .line 234
    const-string v5, "invalid data frame length (not using minimal length encoding)"

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 235
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 238
    :cond_e
    int-to-long v8, v2

    iput-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    .line 241
    :cond_f
    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    iget-wide v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maxFramePayloadLength:J

    cmp-long v5, v8, v10

    if-lez v5, :cond_10

    .line 242
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Max frame length of "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maxFramePayloadLength:J

    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, " has been exceeded."

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->protocolViolation(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 243
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 245
    :cond_10
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v5}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_11

    .line 246
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Decoding WebSocket Frame length="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-wide v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 249
    :cond_11
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;->MASKING_KEY:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;

    invoke-virtual {p0, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 251
    .end local v0    # "b":B
    .end local v1    # "frameMasked":Z
    .end local v2    # "framePayloadLen1":I
    :pswitch_1
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maskedPayload:Z

    if-eqz v5, :cond_12

    .line 252
    const/4 v5, 0x4

    invoke-interface {p3, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maskingKey:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 254
    :cond_12
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;->PAYLOAD:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;

    invoke-virtual {p0, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 258
    :pswitch_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->actualReadableBytes()I

    move-result v4

    .line 259
    .local v4, "rbytes":I
    const/4 v3, 0x0

    .line 261
    .local v3, "payloadBuffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadBytesRead:I

    add-int/2addr v5, v4

    int-to-long v6, v5

    .line 265
    .local v6, "willHaveReadByteCount":J
    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    cmp-long v5, v6, v8

    if-nez v5, :cond_15

    .line 267
    invoke-interface {p3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    .line 288
    :cond_13
    :goto_3
    sget-object v5, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;->FRAME_START:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder$State;

    invoke-virtual {p0, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 291
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v5, :cond_18

    .line 292
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 298
    :goto_4
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->maskedPayload:Z

    if-eqz v5, :cond_14

    .line 299
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {p0, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->unmask(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 304
    :cond_14
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0x9

    if-ne v5, v8, :cond_19

    .line 305
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/PingWebSocketFrame;

    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v5, v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/websocketx/PingWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 268
    :cond_15
    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    cmp-long v5, v6, v8

    if-gez v5, :cond_17

    .line 271
    invoke-interface {p3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    .line 272
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v5, :cond_16

    .line 273
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v5

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    invoke-static {v8, v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->toFrameLength(J)I

    move-result v8

    invoke-interface {v5, v8}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 275
    :cond_16
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 276
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadBytesRead:I

    add-int/2addr v5, v4

    iput v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadBytesRead:I

    .line 279
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 280
    :cond_17
    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    cmp-long v5, v6, v8

    if-lez v5, :cond_13

    .line 283
    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadLength:J

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayloadBytesRead:I

    int-to-long v10, v5

    sub-long/2addr v8, v10

    invoke-static {v8, v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->toFrameLength(J)I

    move-result v5

    invoke-interface {p3, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    goto :goto_3

    .line 294
    :cond_18
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_4

    .line 307
    :cond_19
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0xa

    if-ne v5, v8, :cond_1a

    .line 308
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;

    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v5, v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 310
    :cond_1a
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0x8

    if-ne v5, v8, :cond_1b

    .line 311
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkCloseFrameBody(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 312
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->receivedClosingHandshake:Z

    .line 313
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v5, v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 318
    :cond_1b
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    if-eqz v5, :cond_1e

    .line 321
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/16 v8, 0x9

    if-eq v5, v8, :cond_1d

    .line 322
    const/4 v5, 0x0

    iput v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->fragmentedFramesCount:I

    .line 325
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/4 v8, 0x1

    if-eq v5, v8, :cond_1c

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    if-eqz v5, :cond_1d

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->isChecking()Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 327
    :cond_1c
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkUTF8String(Lorg/jboss/netty/channel/Channel;[B)V

    .line 331
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->finish()V

    .line 354
    :cond_1d
    :goto_5
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/4 v8, 0x1

    if-ne v5, v8, :cond_21

    .line 355
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v5, v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 337
    :cond_1e
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->fragmentedFramesCount:I

    if-nez v5, :cond_20

    .line 339
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/4 v8, 0x1

    if-ne v5, v8, :cond_1f

    .line 340
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkUTF8String(Lorg/jboss/netty/channel/Channel;[B)V

    .line 350
    :cond_1f
    :goto_6
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->fragmentedFramesCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->fragmentedFramesCount:I

    goto :goto_5

    .line 344
    :cond_20
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    if-eqz v5, :cond_1f

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->utf8Validator:Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/http/websocketx/Utf8Validator;->isChecking()Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 345
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->array()[B

    move-result-object v5

    invoke-direct {p0, p2, v5}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->checkUTF8String(Lorg/jboss/netty/channel/Channel;[B)V

    goto :goto_6

    .line 356
    :cond_21
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    const/4 v8, 0x2

    if-ne v5, v8, :cond_22

    .line 357
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v5, v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 358
    :cond_22
    iget v5, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    if-nez v5, :cond_23

    .line 359
    new-instance v5, Lorg/jboss/netty/handler/codec/http/websocketx/ContinuationWebSocketFrame;

    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameFinalFlag:Z

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameRsv:I

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->framePayload:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v5, v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/websocketx/ContinuationWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 361
    :cond_23
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot decode web socket frame with opcode: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;->frameOpcode:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 366
    .end local v3    # "payloadBuffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v4    # "rbytes":I
    .end local v6    # "willHaveReadByteCount":J
    :pswitch_3
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    .line 367
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 144
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
