.class public Lcom/disney/emagine/sdk/EMTData;
.super Ljava/lang/Object;
.source "EMTData.java"


# static fields
.field public static final uint16_size:I = 0x2

.field public static final uint32_size:I = 0x4

.field public static final uint64_size:I = 0x8

.field public static final uint8_size:I = 0x1

.field public static final usigned_size:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static append([B[B)[B
    .locals 3
    .param p0, "b1"    # [B
    .param p1, "b2"    # [B

    .prologue
    .line 120
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 122
    .local v1, "outputStream":Ljava/io/ByteArrayOutputStream;
    if-nez p0, :cond_0

    .line 123
    const/4 v2, 0x0

    new-array p0, v2, [B

    .line 127
    :cond_0
    :try_start_0
    invoke-virtual {v1, p0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 128
    if-eqz p1, :cond_1

    .line 129
    invoke-virtual {v1, p1}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    :cond_1
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    :goto_0
    return-object v2

    .line 131
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 134
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static byteToByteObject(B)Ljava/lang/Byte;
    .locals 1
    .param p0, "value"    # B

    .prologue
    .line 53
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    return-object v0
.end method

.method public static byteToBytes(B)[B
    .locals 3
    .param p0, "value"    # B

    .prologue
    .line 58
    const/4 v0, 0x1

    new-array v0, v0, [B

    const/4 v1, 0x0

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    return-object v0
.end method

.method public static byteToShort(B)S
    .locals 5
    .param p0, "value"    # B

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 142
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    .line 144
    new-array v0, v4, [B

    aput-byte v2, v0, v2

    aput-byte p0, v0, v3

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    .line 147
    :goto_0
    return v0

    :cond_0
    new-array v0, v4, [B

    aput-byte p0, v0, v2

    aput-byte v2, v0, v3

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    goto :goto_0
.end method

.method public static bytesToASCIIString([B)Ljava/lang/String;
    .locals 4
    .param p0, "value"    # [B

    .prologue
    .line 332
    const/4 v1, 0x0

    .line 336
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "US-ASCII"

    invoke-direct {v2, p0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    .line 343
    .end local v1    # "result":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 338
    .restart local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 340
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static bytesToByte([B)B
    .locals 2
    .param p0, "value"    # [B

    .prologue
    .line 157
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    return v0
.end method

.method public static bytesToHexString([B)Ljava/lang/String;
    .locals 8
    .param p0, "value"    # [B

    .prologue
    const/4 v3, 0x0

    .line 402
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 404
    .local v1, "result":Ljava/lang/StringBuffer;
    array-length v4, p0

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_0

    aget-byte v0, p0, v2

    .line 406
    .local v0, "b":B
    const-string v5, "%02X"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 404
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 409
    .end local v0    # "b":B
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static bytesToInt([B)I
    .locals 3
    .param p0, "value"    # [B

    .prologue
    .line 177
    move-object v0, p0

    .line 179
    .local v0, "array":[B
    array-length v1, p0

    const/4 v2, 0x4

    if-ge v1, v2, :cond_0

    .line 181
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 183
    array-length v1, p0

    rsub-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->padBytes(I)[B

    move-result-object v1

    invoke-static {v1, v0}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 191
    :cond_0
    :goto_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    return v1

    .line 187
    :cond_1
    array-length v1, p0

    rsub-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->padBytes(I)[B

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    goto :goto_0
.end method

.method public static bytesToIntObject([B)Ljava/lang/Integer;
    .locals 1
    .param p0, "value"    # [B

    .prologue
    .line 217
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static bytesToLong([B)J
    .locals 4
    .param p0, "value"    # [B

    .prologue
    .line 222
    move-object v0, p0

    .line 224
    .local v0, "array":[B
    array-length v1, p0

    const/16 v2, 0x8

    if-ge v1, v2, :cond_0

    .line 226
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 228
    array-length v1, p0

    rsub-int/lit8 v1, v1, 0x8

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->padBytes(I)[B

    move-result-object v1

    invoke-static {v1, v0}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 236
    :cond_0
    :goto_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    return-wide v2

    .line 232
    :cond_1
    array-length v1, p0

    rsub-int/lit8 v1, v1, 0x8

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->padBytes(I)[B

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    goto :goto_0
.end method

.method public static bytesToLongObject([B)Ljava/lang/Long;
    .locals 2
    .param p0, "value"    # [B

    .prologue
    .line 241
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToLong([B)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static bytesToShort([B)S
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 162
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    .line 164
    aget-byte v0, p0, v3

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    aget-byte v1, p0, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    .line 167
    :goto_0
    return v0

    :cond_0
    aget-byte v0, p0, v2

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    aget-byte v1, p0, v3

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    goto :goto_0
.end method

.method public static bytesToShortObject([B)Ljava/lang/Short;
    .locals 1
    .param p0, "value"    # [B

    .prologue
    .line 172
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v0

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    return-object v0
.end method

.method public static bytesToString([B)Ljava/lang/String;
    .locals 1
    .param p0, "bytes"    # [B

    .prologue
    .line 152
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToASCIIString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static bytesToUTF8String([B)Ljava/lang/String;
    .locals 6
    .param p0, "value"    # [B

    .prologue
    .line 380
    const/4 v3, 0x0

    .line 384
    .local v3, "result":Ljava/lang/String;
    if-nez p0, :cond_0

    :try_start_0
    const-string v3, ""

    .line 397
    :goto_0
    return-object v3

    .line 384
    :cond_0
    new-instance v3, Ljava/lang/String;

    .end local v3    # "result":Ljava/lang/String;
    const-string v4, "UTF-8"

    invoke-direct {v3, p0, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 386
    :catch_0
    move-exception v0

    .line 388
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v2, "This phone does not support UTF-8 encoding, and is not supported."

    .line 389
    .local v2, "reason":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v4

    const-string v5, "EMTData"

    invoke-virtual {v4, v5, v2}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 393
    .local v1, "ex":Ljava/lang/RuntimeException;
    invoke-virtual {v1, v0}, Ljava/lang/RuntimeException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 394
    throw v1
.end method

.method public static copyOf([B[BI)[B
    .locals 2
    .param p0, "src"    # [B
    .param p1, "dest"    # [B
    .param p2, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 430
    const/4 v0, 0x1

    if-lt p2, v0, :cond_0

    array-length v0, p1

    if-le p2, v0, :cond_1

    .line 432
    :cond_0
    const/4 p1, 0x0

    .line 438
    .end local p1    # "dest":[B
    :goto_0
    return-object p1

    .line 436
    .restart local p1    # "dest":[B
    :cond_1
    invoke-static {p0, v1, p1, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static copyOfRange([BII)[B
    .locals 2
    .param p0, "src"    # [B
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 443
    const/4 v1, 0x0

    .line 447
    .local v1, "result":[B
    :try_start_0
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->copyOfRange([BII)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 454
    :goto_0
    return-object v1

    .line 449
    :catch_0
    move-exception v0

    .line 451
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static copyOfRange([BI[BII)[B
    .locals 0
    .param p0, "src"    # [B
    .param p1, "sfrom"    # I
    .param p2, "dest"    # [B
    .param p3, "dfrom"    # I
    .param p4, "length"    # I

    .prologue
    .line 459
    invoke-static {p0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 461
    return-object p2
.end method

.method private static endian()Ljava/nio/ByteOrder;
    .locals 1

    .prologue
    .line 31
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    return-object v0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .locals 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 414
    const/4 v0, 0x0

    .line 416
    .local v0, "byteValue":[B
    :try_start_0
    new-instance v2, Ljava/math/BigInteger;

    const/16 v3, 0x10

    invoke-direct {v2, p0, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v2}, Ljava/math/BigInteger;->toByteArray()[B
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 421
    array-length v2, v0

    mul-int/lit8 v2, v2, 0x2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v2, v3, :cond_0

    .line 423
    const/4 v2, 0x1

    array-length v3, v0

    invoke-static {v0, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    :cond_0
    move-object v2, v0

    .line 425
    :goto_0
    return-object v2

    .line 417
    :catch_0
    move-exception v1

    .line 419
    .local v1, "e":Ljava/lang/NumberFormatException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static intToBytes(I)[B
    .locals 7
    .param p0, "value"    # I

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 80
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    .line 82
    new-array v0, v6, [B

    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    .line 88
    :goto_0
    return-object v0

    :cond_0
    new-array v0, v6, [B

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v4

    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v5

    goto :goto_0
.end method

.method public static intToShortBytes(I)[B
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 266
    const/4 v2, 0x0

    .line 270
    .local v2, "result":[B
    :try_start_0
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v0

    .line 272
    .local v0, "bint":[B
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v3

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v3, v4, :cond_0

    .line 274
    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {v0, v3, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v2

    .line 286
    .end local v0    # "bint":[B
    :goto_0
    return-object v2

    .line 278
    .restart local v0    # "bint":[B
    :cond_0
    const/4 v3, 0x2

    const/4 v4, 0x4

    invoke-static {v0, v3, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 281
    .end local v0    # "bint":[B
    :catch_0
    move-exception v1

    .line 283
    .local v1, "e":Ljava/nio/BufferUnderflowException;
    invoke-virtual {v1}, Ljava/nio/BufferUnderflowException;->getLocalizedMessage()Ljava/lang/String;

    goto :goto_0
.end method

.method public static isEqual([B[BI)Z
    .locals 2
    .param p0, "b1"    # [B
    .param p1, "b2"    # [B
    .param p2, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 488
    invoke-static {p0, v1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {p1, v1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static longToBytes(J)[B
    .locals 10
    .param p0, "value"    # J

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/16 v6, 0x8

    const-wide/16 v4, 0xff

    .line 96
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    .line 98
    new-array v0, v6, [B

    and-long v2, p0, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v7

    shr-long v2, p0, v6

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v8

    const/16 v1, 0x10

    shr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v9

    const/4 v1, 0x3

    const/16 v2, 0x18

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x20

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0x28

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x30

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0x38

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 108
    :goto_0
    return-object v0

    :cond_0
    new-array v0, v6, [B

    const/16 v1, 0x38

    shr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v7

    const/16 v1, 0x30

    shr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v8

    const/16 v1, 0x28

    shr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, v0, v9

    const/4 v1, 0x3

    const/16 v2, 0x20

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x18

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0x10

    shr-long v2, p0, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x6

    shr-long v2, p0, v6

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x7

    and-long v2, p0, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    goto :goto_0
.end method

.method public static longToIntBytes(J)[B
    .locals 6
    .param p0, "value"    # J

    .prologue
    .line 291
    const/4 v2, 0x0

    .line 295
    .local v2, "result":[B
    :try_start_0
    invoke-static {p0, p1}, Lcom/disney/emagine/sdk/EMTData;->longToBytes(J)[B

    move-result-object v0

    .line 297
    .local v0, "blong":[B
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v3

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v3, v4, :cond_0

    .line 299
    const/4 v3, 0x0

    const/4 v4, 0x4

    invoke-static {v0, v3, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v2

    .line 311
    .end local v0    # "blong":[B
    :goto_0
    return-object v2

    .line 303
    .restart local v0    # "blong":[B
    :cond_0
    const/4 v3, 0x4

    const/16 v4, 0x8

    invoke-static {v0, v3, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 306
    .end local v0    # "blong":[B
    :catch_0
    move-exception v1

    .line 308
    .local v1, "e":Ljava/nio/BufferUnderflowException;
    invoke-virtual {v1}, Ljava/nio/BufferUnderflowException;->getLocalizedMessage()Ljava/lang/String;

    goto :goto_0
.end method

.method public static memsetBytes([BB)[B
    .locals 2
    .param p0, "array"    # [B
    .param p1, "value"    # B

    .prologue
    .line 478
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 480
    aput-byte p1, p0, v0

    .line 478
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 483
    :cond_0
    return-object p0
.end method

.method public static padBytes(I)[B
    .locals 3
    .param p0, "number"    # I

    .prologue
    const/4 v2, 0x0

    .line 36
    if-lez p0, :cond_1

    .line 38
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 40
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p0, :cond_0

    .line 42
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 40
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    .line 48
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "i":I
    :goto_1
    return-object v2

    :cond_1
    new-array v2, v2, [B

    goto :goto_1
.end method

.method public static reverse([B)[B
    .locals 4
    .param p0, "value"    # [B

    .prologue
    .line 466
    array-length v3, p0

    new-array v2, v3, [B

    .line 468
    .local v2, "result":[B
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .local v1, "j":I
    :goto_0
    array-length v3, p0

    if-ge v0, v3, :cond_0

    .line 470
    aget-byte v3, p0, v1

    aput-byte v3, v2, v0

    .line 468
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 473
    :cond_0
    return-object v2
.end method

.method public static reverseBytesToInt([B)I
    .locals 3
    .param p0, "value"    # [B

    .prologue
    .line 196
    move-object v0, p0

    .line 198
    .local v0, "array":[B
    array-length v1, p0

    const/4 v2, 0x4

    if-ge v1, v2, :cond_0

    .line 200
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v1, v2, :cond_1

    .line 202
    array-length v1, p0

    rsub-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->padBytes(I)[B

    move-result-object v1

    invoke-static {v1, v0}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    .line 210
    :cond_0
    :goto_0
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v0

    .line 212
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    return v1

    .line 206
    :cond_1
    array-length v1, p0

    rsub-int/lit8 v1, v1, 0x4

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->padBytes(I)[B

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    goto :goto_0
.end method

.method public static shortToByte(S)B
    .locals 1
    .param p0, "value"    # S

    .prologue
    .line 63
    int-to-byte v0, p0

    return v0
.end method

.method public static shortToBytes(S)[B
    .locals 5
    .param p0, "value"    # S

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 68
    invoke-static {}, Lcom/disney/emagine/sdk/EMTData;->endian()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_0

    .line 70
    new-array v0, v4, [B

    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    .line 74
    :goto_0
    return-object v0

    :cond_0
    new-array v0, v4, [B

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v3

    goto :goto_0
.end method

.method public static stringToASCIIBytes(Ljava/lang/String;)[B
    .locals 3
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 316
    const/4 v1, 0x0

    .line 320
    .local v1, "result":[B
    :try_start_0
    const-string v2, "US-ASCII"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 327
    :goto_0
    return-object v1

    .line 322
    :catch_0
    move-exception v0

    .line 324
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static stringToUTF8Bytes(Ljava/lang/String;)[B
    .locals 3
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 364
    const/4 v1, 0x0

    .line 368
    .local v1, "result":[B
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 375
    :goto_0
    return-object v1

    .line 370
    :catch_0
    move-exception v0

    .line 372
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static stringToUTF8String(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 348
    const/4 v1, 0x0

    .line 352
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    new-instance v2, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "result":Ljava/lang/String;
    .local v2, "result":Ljava/lang/String;
    move-object v1, v2

    .line 359
    .end local v2    # "result":Ljava/lang/String;
    .restart local v1    # "result":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 354
    :catch_0
    move-exception v0

    .line 356
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static uintBytesToLong([B)J
    .locals 4
    .param p0, "value"    # [B

    .prologue
    .line 256
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public static uintBytesToLongObject([B)Ljava/lang/Long;
    .locals 4
    .param p0, "value"    # [B

    .prologue
    .line 261
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public static ushortBytesToInt([B)I
    .locals 2
    .param p0, "value"    # [B

    .prologue
    .line 246
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method public static ushortBytesToIntObject([B)Ljava/lang/Integer;
    .locals 2
    .param p0, "value"    # [B

    .prologue
    .line 251
    invoke-static {p0}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
