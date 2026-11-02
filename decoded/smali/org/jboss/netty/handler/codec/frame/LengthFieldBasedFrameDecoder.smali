.class public Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "LengthFieldBasedFrameDecoder.java"


# instance fields
.field private bytesToDiscard:J

.field private discardingTooLongFrame:Z

.field private final failFast:Z

.field private final initialBytesToStrip:I

.field private final lengthAdjustment:I

.field private final lengthFieldEndOffset:I

.field private final lengthFieldLength:I

.field private final lengthFieldOffset:I

.field private final maxFrameLength:I

.field private tooLongFrameLength:J


# direct methods
.method public constructor <init>(III)V
    .locals 6
    .param p1, "maxFrameLength"    # I
    .param p2, "lengthFieldOffset"    # I
    .param p3, "lengthFieldLength"    # I

    .prologue
    const/4 v4, 0x0

    .line 211
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;-><init>(IIIII)V

    .line 212
    return-void
.end method

.method public constructor <init>(IIIII)V
    .locals 7
    .param p1, "maxFrameLength"    # I
    .param p2, "lengthFieldOffset"    # I
    .param p3, "lengthFieldLength"    # I
    .param p4, "lengthAdjustment"    # I
    .param p5, "initialBytesToStrip"    # I

    .prologue
    .line 234
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;-><init>(IIIIIZ)V

    .line 238
    return-void
.end method

.method public constructor <init>(IIIIIZ)V
    .locals 3
    .param p1, "maxFrameLength"    # I
    .param p2, "lengthFieldOffset"    # I
    .param p3, "lengthFieldLength"    # I
    .param p4, "lengthAdjustment"    # I
    .param p5, "initialBytesToStrip"    # I
    .param p6, "failFast"    # Z

    .prologue
    .line 266
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>()V

    .line 267
    if-gtz p1, :cond_0

    .line 268
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxFrameLength must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 273
    :cond_0
    if-gez p2, :cond_1

    .line 274
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "lengthFieldOffset must be a non-negative integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 279
    :cond_1
    if-gez p5, :cond_2

    .line 280
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initialBytesToStrip must be a non-negative integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 285
    :cond_2
    const/4 v0, 0x1

    if-eq p3, v0, :cond_3

    const/4 v0, 0x2

    if-eq p3, v0, :cond_3

    const/4 v0, 0x3

    if-eq p3, v0, :cond_3

    const/4 v0, 0x4

    if-eq p3, v0, :cond_3

    const/16 v0, 0x8

    if-eq p3, v0, :cond_3

    .line 288
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "lengthFieldLength must be either 1, 2, 3, 4, or 8: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 293
    :cond_3
    sub-int v0, p1, p3

    if-le p2, v0, :cond_4

    .line 294
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxFrameLength ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "must be equal to or greater than "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "lengthFieldOffset ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "lengthFieldLength ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 301
    :cond_4
    iput p1, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->maxFrameLength:I

    .line 302
    iput p2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldOffset:I

    .line 303
    iput p3, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldLength:I

    .line 304
    iput p4, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthAdjustment:I

    .line 305
    add-int v0, p2, p3

    iput v0, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldEndOffset:I

    .line 306
    iput p5, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->initialBytesToStrip:I

    .line 307
    iput-boolean p6, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->failFast:Z

    .line 308
    return-void
.end method

.method private fail(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "frameLength"    # J

    .prologue
    .line 416
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 417
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Adjusted frame length exceeds "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->maxFrameLength:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - discarded"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 429
    :goto_0
    return-void

    .line 423
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Adjusted frame length exceeds "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->maxFrameLength:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - discarding"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private failIfNecessary(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "firstDetectionOfTooLongFrame"    # Z

    .prologue
    const-wide/16 v4, 0x0

    .line 397
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->bytesToDiscard:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    .line 400
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->tooLongFrameLength:J

    .line 401
    .local v0, "tooLongFrameLength":J
    iput-wide v4, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->tooLongFrameLength:J

    .line 402
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->discardingTooLongFrame:Z

    .line 403
    iget-boolean v2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->failFast:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->failFast:Z

    if-eqz v2, :cond_1

    if-eqz p2, :cond_1

    .line 405
    :cond_0
    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    .line 413
    .end local v0    # "tooLongFrameLength":J
    :cond_1
    :goto_0
    return-void

    .line 409
    :cond_2
    iget-boolean v2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->failFast:Z

    if-eqz v2, :cond_1

    if-eqz p2, :cond_1

    .line 410
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->tooLongFrameLength:J

    invoke-direct {p0, p1, v2, v3}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto :goto_0
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 15
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 314
    iget-boolean v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->discardingTooLongFrame:Z

    if-eqz v12, :cond_0

    .line 315
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->bytesToDiscard:J

    .line 316
    .local v4, "bytesToDiscard":J
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v12

    int-to-long v12, v12

    invoke-static {v4, v5, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    long-to-int v10, v12

    .line 317
    .local v10, "localBytesToDiscard":I
    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 318
    int-to-long v12, v10

    sub-long/2addr v4, v12

    .line 319
    iput-wide v4, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->bytesToDiscard:J

    .line 320
    const/4 v12, 0x0

    move-object/from16 v0, p1

    invoke-direct {p0, v0, v12}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->failIfNecessary(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 321
    const/4 v6, 0x0

    .line 393
    .end local v4    # "bytesToDiscard":J
    .end local v10    # "localBytesToDiscard":I
    :goto_0
    return-object v6

    .line 324
    :cond_0
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v12

    iget v13, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldEndOffset:I

    if-ge v12, v13, :cond_1

    .line 325
    const/4 v6, 0x0

    goto :goto_0

    .line 328
    :cond_1
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v12

    iget v13, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldOffset:I

    add-int v3, v12, v13

    .line 330
    .local v3, "actualLengthFieldOffset":I
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldLength:I

    packed-switch v12, :pswitch_data_0

    .line 347
    :pswitch_0
    new-instance v12, Ljava/lang/Error;

    const-string v13, "should not reach here"

    invoke-direct {v12, v13}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v12

    .line 332
    :pswitch_1
    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v12

    int-to-long v8, v12

    .line 350
    .local v8, "frameLength":J
    :goto_1
    const-wide/16 v12, 0x0

    cmp-long v12, v8, v12

    if-gez v12, :cond_2

    .line 351
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldEndOffset:I

    move-object/from16 v0, p3

    invoke-interface {v0, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 352
    new-instance v12, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "negative pre-adjustment length field: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 335
    .end local v8    # "frameLength":J
    :pswitch_2
    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedShort(I)I

    move-result v12

    int-to-long v8, v12

    .line 336
    .restart local v8    # "frameLength":J
    goto :goto_1

    .line 338
    .end local v8    # "frameLength":J
    :pswitch_3
    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedMedium(I)I

    move-result v12

    int-to-long v8, v12

    .line 339
    .restart local v8    # "frameLength":J
    goto :goto_1

    .line 341
    .end local v8    # "frameLength":J
    :pswitch_4
    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedInt(I)J

    move-result-wide v8

    .line 342
    .restart local v8    # "frameLength":J
    goto :goto_1

    .line 344
    .end local v8    # "frameLength":J
    :pswitch_5
    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getLong(I)J

    move-result-wide v8

    .line 345
    .restart local v8    # "frameLength":J
    goto :goto_1

    .line 356
    :cond_2
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthAdjustment:I

    iget v13, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldEndOffset:I

    add-int/2addr v12, v13

    int-to-long v12, v12

    add-long/2addr v8, v12

    .line 357
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldEndOffset:I

    int-to-long v12, v12

    cmp-long v12, v8, v12

    if-gez v12, :cond_3

    .line 358
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldEndOffset:I

    move-object/from16 v0, p3

    invoke-interface {v0, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 359
    new-instance v12, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Adjusted frame length ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ") is less "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "than lengthFieldEndOffset: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->lengthFieldEndOffset:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 364
    :cond_3
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->maxFrameLength:I

    int-to-long v12, v12

    cmp-long v12, v8, v12

    if-lez v12, :cond_4

    .line 366
    const/4 v12, 0x1

    iput-boolean v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->discardingTooLongFrame:Z

    .line 367
    iput-wide v8, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->tooLongFrameLength:J

    .line 368
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v12

    int-to-long v12, v12

    sub-long v12, v8, v12

    iput-wide v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->bytesToDiscard:J

    .line 369
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v12

    move-object/from16 v0, p3

    invoke-interface {v0, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 370
    const/4 v12, 0x1

    move-object/from16 v0, p1

    invoke-direct {p0, v0, v12}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->failIfNecessary(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 371
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 375
    :cond_4
    long-to-int v7, v8

    .line 376
    .local v7, "frameLengthInt":I
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v12

    if-ge v12, v7, :cond_5

    .line 377
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 380
    :cond_5
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->initialBytesToStrip:I

    if-le v12, v7, :cond_6

    .line 381
    move-object/from16 v0, p3

    invoke-interface {v0, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 382
    new-instance v12, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Adjusted frame length ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ") is less "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "than initialBytesToStrip: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->initialBytesToStrip:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/jboss/netty/handler/codec/frame/CorruptedFrameException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 386
    :cond_6
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->initialBytesToStrip:I

    move-object/from16 v0, p3

    invoke-interface {v0, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 389
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v11

    .line 390
    .local v11, "readerIndex":I
    iget v12, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->initialBytesToStrip:I

    sub-int v2, v7, v12

    .line 391
    .local v2, "actualFrameLength":I
    move-object/from16 v0, p3

    invoke-virtual {p0, v0, v11, v2}, Lorg/jboss/netty/handler/codec/frame/LengthFieldBasedFrameDecoder;->extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 392
    .local v6, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    add-int v12, v11, v2

    move-object/from16 v0, p3

    invoke-interface {v0, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_0

    .line 330
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method
