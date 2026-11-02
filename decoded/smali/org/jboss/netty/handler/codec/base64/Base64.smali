.class public final Lorg/jboss/netty/handler/codec/base64/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_ENC:B = -0x1t

.field private static final MAX_LINE_LENGTH:I = 0x4c

.field private static final NEW_LINE:B = 0xat

.field private static final WHITE_SPACE_ENC:B = -0x5t


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 374
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 376
    return-void
.end method

.method private static alphabet(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)[B
    .locals 2
    .param p0, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 53
    if-nez p0, :cond_0

    .line 54
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dialect"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->alphabet:[B

    return-object v0
.end method

.method private static breakLines(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Z
    .locals 2
    .param p0, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 67
    if-nez p0, :cond_0

    .line 68
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dialect"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->breakLinesByDefault:Z

    return v0
.end method

.method private static decodabet(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)[B
    .locals 2
    .param p0, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 60
    if-nez p0, :cond_0

    .line 61
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dialect"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->decodabet:[B

    return-object v0
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 240
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 264
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 274
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, p1, p2, v0, p3}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 269
    invoke-static {}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 14
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;
    .param p4, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 281
    if-nez p0, :cond_0

    .line 282
    new-instance v11, Ljava/lang/NullPointerException;

    const-string v12, "src"

    invoke-direct {v11, v12}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 284
    :cond_0
    if-nez p3, :cond_1

    .line 285
    new-instance v11, Ljava/lang/NullPointerException;

    const-string v12, "dialect"

    invoke-direct {v11, v12}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 287
    :cond_1
    if-nez p4, :cond_2

    .line 288
    new-instance v11, Ljava/lang/NullPointerException;

    const-string v12, "bufferFactory"

    invoke-direct {v11, v12}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 291
    :cond_2
    invoke-static/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/base64/Base64;->decodabet(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)[B

    move-result-object v1

    .line 293
    .local v1, "DECODABET":[B
    mul-int/lit8 v11, p2, 0x3

    div-int/lit8 v7, v11, 0x4

    .line 294
    .local v7, "len34":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v11

    move-object/from16 v0, p4

    invoke-interface {v0, v11, v7}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    .line 295
    .local v5, "dest":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v8, 0x0

    .line 297
    .local v8, "outBuffPosn":I
    const/4 v11, 0x4

    new-array v2, v11, [B

    .line 298
    .local v2, "b4":[B
    const/4 v3, 0x0

    .line 302
    .local v3, "b4Posn":I
    move v6, p1

    .local v6, "i":I
    move v4, v3

    .end local v3    # "b4Posn":I
    .local v4, "b4Posn":I
    :goto_0
    add-int v11, p1, p2

    if-ge v6, v11, :cond_6

    .line 303
    invoke-interface {p0, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v11

    and-int/lit8 v11, v11, 0x7f

    int-to-byte v9, v11

    .line 304
    .local v9, "sbiCrop":B
    aget-byte v10, v1, v9

    .line 306
    .local v10, "sbiDecode":B
    const/4 v11, -0x5

    if-lt v10, v11, :cond_3

    .line 307
    const/4 v11, -0x1

    if-lt v10, v11, :cond_4

    .line 308
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    aput-byte v9, v2, v4

    .line 309
    const/4 v11, 0x3

    if-le v3, v11, :cond_5

    .line 310
    const/4 v11, 0x0

    move-object/from16 v0, p3

    invoke-static {v2, v11, v5, v8, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode4to3([BILorg/jboss/netty/buffer/ChannelBuffer;ILorg/jboss/netty/handler/codec/base64/Base64Dialect;)I

    move-result v11

    add-int/2addr v8, v11

    .line 312
    const/4 v3, 0x0

    .line 315
    const/16 v11, 0x3d

    if-ne v9, v11, :cond_5

    .line 327
    .end local v9    # "sbiCrop":B
    .end local v10    # "sbiDecode":B
    :goto_1
    const/4 v11, 0x0

    invoke-interface {v5, v11, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v11

    return-object v11

    .line 321
    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    .restart local v9    # "sbiCrop":B
    .restart local v10    # "sbiDecode":B
    :cond_3
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "bad Base64 input character at "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ": "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {p0, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " (decimal)"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    :cond_4
    move v3, v4

    .line 302
    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    :cond_5
    add-int/lit8 v6, v6, 0x1

    move v4, v3

    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    goto :goto_0

    .end local v9    # "sbiCrop":B
    .end local v10    # "sbiDecode":B
    :cond_6
    move v3, v4

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    goto :goto_1
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 248
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 244
    invoke-static {}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;
    .param p2, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 253
    if-nez p0, :cond_0

    .line 254
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "src"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 257
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    invoke-static {p0, v1, v2, p1, p2}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 258
    .local v0, "dest":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v1

    invoke-interface {p0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 259
    return-object v0
.end method

.method private static decode4to3([BILorg/jboss/netty/buffer/ChannelBuffer;ILorg/jboss/netty/handler/codec/base64/Base64Dialect;)I
    .locals 5
    .param p0, "src"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "dest"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p3, "destOffset"    # I
    .param p4, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    const/16 v4, 0x3d

    .line 334
    invoke-static {p4}, Lorg/jboss/netty/handler/codec/base64/Base64;->decodabet(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)[B

    move-result-object v0

    .line 336
    .local v0, "DECODABET":[B
    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_0

    .line 338
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int v2, v3, v4

    .line 342
    .local v2, "outBuff":I
    ushr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    invoke-interface {p2, p3, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 343
    const/4 v3, 0x1

    .line 370
    :goto_0
    return v3

    .line 344
    .end local v2    # "outBuff":I
    :cond_0
    add-int/lit8 v3, p1, 0x3

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_1

    .line 346
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x6

    or-int v2, v3, v4

    .line 351
    .restart local v2    # "outBuff":I
    ushr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    invoke-interface {p2, p3, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 352
    add-int/lit8 v3, p3, 0x1

    ushr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    invoke-interface {p2, v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 353
    const/4 v3, 0x2

    goto :goto_0

    .line 358
    .end local v2    # "outBuff":I
    :cond_1
    :try_start_0
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x6

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit16 v4, v4, 0xff

    or-int v2, v3, v4

    .line 367
    .restart local v2    # "outBuff":I
    shr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    invoke-interface {p2, p3, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 368
    add-int/lit8 v3, p3, 0x1

    shr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    invoke-interface {p2, v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 369
    add-int/lit8 v3, p3, 0x2

    int-to-byte v4, v2

    invoke-interface {p2, v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 370
    const/4 v3, 0x3

    goto :goto_0

    .line 363
    .end local v2    # "outBuff":I
    :catch_0
    move-exception v1

    .line 364
    .local v1, "e":Ljava/lang/IndexOutOfBoundsException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "not encoded in Base64"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 74
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 119
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 127
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, p1, p2, v0, p3}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 123
    invoke-static {p3}, Lorg/jboss/netty/handler/codec/base64/Base64;->breakLines(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Z

    move-result v0

    invoke-static {p0, p1, p2, v0, p3}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;
    .param p4, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 132
    invoke-static {p3}, Lorg/jboss/netty/handler/codec/base64/Base64;->breakLines(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Z

    move-result v3

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZ)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "breakLines"    # Z

    .prologue
    .line 137
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, p1, p2, p3, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "breakLines"    # Z
    .param p4, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 149
    sget-object v4, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "breakLines"    # Z
    .param p4, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 143
    invoke-static {}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 10
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "breakLines"    # Z
    .param p4, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;
    .param p5, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 156
    if-nez p0, :cond_0

    .line 157
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "src"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_0
    if-nez p4, :cond_1

    .line 160
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dialect"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_1
    if-nez p5, :cond_2

    .line 163
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bufferFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_2
    mul-int/lit8 v0, p2, 0x4

    div-int/lit8 v8, v0, 0x3

    .line 167
    .local v8, "len43":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    rem-int/lit8 v0, p2, 0x3

    if-lez v0, :cond_4

    const/4 v0, 0x4

    :goto_0
    add-int v2, v8, v0

    if-eqz p3, :cond_5

    div-int/lit8 v0, v8, 0x4c

    :goto_1
    add-int/2addr v0, v2

    invoke-interface {p5, v1, v0}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    .line 172
    .local v3, "dest":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v6, 0x0

    .line 173
    .local v6, "d":I
    const/4 v4, 0x0

    .line 174
    .local v4, "e":I
    add-int/lit8 v7, p2, -0x2

    .line 175
    .local v7, "len2":I
    const/4 v9, 0x0

    .line 176
    .local v9, "lineLength":I
    :goto_2
    if-ge v6, v7, :cond_6

    .line 177
    add-int v1, v6, p1

    const/4 v2, 0x3

    move-object v0, p0

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode3to4(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBuffer;ILorg/jboss/netty/handler/codec/base64/Base64Dialect;)V

    .line 179
    add-int/lit8 v9, v9, 0x4

    .line 180
    if-eqz p3, :cond_3

    const/16 v0, 0x4c

    if-ne v9, v0, :cond_3

    .line 181
    add-int/lit8 v0, v4, 0x4

    const/16 v1, 0xa

    invoke-interface {v3, v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 182
    add-int/lit8 v4, v4, 0x1

    .line 183
    const/4 v9, 0x0

    .line 176
    :cond_3
    add-int/lit8 v6, v6, 0x3

    add-int/lit8 v4, v4, 0x4

    goto :goto_2

    .line 167
    .end local v3    # "dest":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v4    # "e":I
    .end local v6    # "d":I
    .end local v7    # "len2":I
    .end local v9    # "lineLength":I
    :cond_4
    const/4 v0, 0x0

    goto :goto_0

    :cond_5
    const/4 v0, 0x0

    goto :goto_1

    .line 187
    .restart local v3    # "dest":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v4    # "e":I
    .restart local v6    # "d":I
    .restart local v7    # "len2":I
    .restart local v9    # "lineLength":I
    :cond_6
    if-ge v6, p2, :cond_7

    .line 188
    add-int v1, v6, p1

    sub-int v2, p2, v6

    move-object v0, p0

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode3to4(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBuffer;ILorg/jboss/netty/handler/codec/base64/Base64Dialect;)V

    .line 189
    add-int/lit8 v4, v4, 0x4

    .line 192
    :cond_7
    const/4 v0, 0x0

    invoke-interface {v3, v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 83
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 78
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/base64/Base64;->breakLines(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Z

    move-result v0

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;
    .param p2, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 88
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/base64/Base64;->breakLines(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)Z

    move-result v0

    invoke-static {p0, v0, p1, p2}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;Z)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "breakLines"    # Z

    .prologue
    .line 92
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, p1, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "breakLines"    # Z
    .param p2, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 102
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {p0, p1, v0, p2}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "breakLines"    # Z
    .param p2, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 97
    invoke-static {}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Lorg/jboss/netty/buffer/ChannelBuffer;ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 7
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "breakLines"    # Z
    .param p2, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;
    .param p3, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 108
    if-nez p0, :cond_0

    .line 109
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "src"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    move-object v0, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 114
    .local v6, "dest":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v0

    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 115
    return-object v6
.end method

.method private static encode3to4(Lorg/jboss/netty/buffer/ChannelBuffer;IILorg/jboss/netty/buffer/ChannelBuffer;ILorg/jboss/netty/handler/codec/base64/Base64Dialect;)V
    .locals 6
    .param p0, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "srcOffset"    # I
    .param p2, "numSigBytes"    # I
    .param p3, "dest"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "destOffset"    # I
    .param p5, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    const/16 v5, 0x3d

    const/4 v2, 0x0

    .line 199
    invoke-static {p5}, Lorg/jboss/netty/handler/codec/base64/Base64;->alphabet(Lorg/jboss/netty/handler/codec/base64/Base64Dialect;)[B

    move-result-object v0

    .line 212
    .local v0, "ALPHABET":[B
    if-lez p2, :cond_1

    invoke-interface {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v3

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x8

    move v4, v3

    :goto_0
    const/4 v3, 0x1

    if-le p2, v3, :cond_2

    add-int/lit8 v3, p1, 0x1

    invoke-interface {p0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v3

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x10

    :goto_1
    or-int/2addr v3, v4

    const/4 v4, 0x2

    if-le p2, v4, :cond_0

    add-int/lit8 v2, p1, 0x2

    invoke-interface {p0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x18

    :cond_0
    or-int v1, v3, v2

    .line 217
    .local v1, "inBuff":I
    packed-switch p2, :pswitch_data_0

    .line 237
    :goto_2
    return-void

    .end local v1    # "inBuff":I
    :cond_1
    move v4, v2

    .line 212
    goto :goto_0

    :cond_2
    move v3, v2

    goto :goto_1

    .line 219
    .restart local v1    # "inBuff":I
    :pswitch_0
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    invoke-interface {p3, p4, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 220
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    invoke-interface {p3, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 221
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    invoke-interface {p3, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 222
    add-int/lit8 v2, p4, 0x3

    and-int/lit8 v3, v1, 0x3f

    aget-byte v3, v0, v3

    invoke-interface {p3, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    goto :goto_2

    .line 225
    :pswitch_1
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    invoke-interface {p3, p4, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 226
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    invoke-interface {p3, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 227
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    invoke-interface {p3, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 228
    add-int/lit8 v2, p4, 0x3

    invoke-interface {p3, v2, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    goto :goto_2

    .line 231
    :pswitch_2
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    invoke-interface {p3, p4, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 232
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    invoke-interface {p3, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 233
    add-int/lit8 v2, p4, 0x2

    invoke-interface {p3, v2, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    .line 234
    add-int/lit8 v2, p4, 0x3

    invoke-interface {p3, v2, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->setByte(II)V

    goto :goto_2

    .line 217
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
