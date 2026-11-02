.class public final Lorg/jboss/netty/util/NetUtil;
.super Ljava/lang/Object;
.source "NetUtil.java"


# static fields
.field private static final IPV4_BYTE_COUNT:I = 0x4

.field private static final IPV4_MAX_CHAR_BETWEEN_SEPARATOR:I = 0x3

.field private static final IPV4_SEPARATORS:I = 0x3

.field private static final IPV6_BYTE_COUNT:I = 0x10

.field private static final IPV6_MAX_CHAR_BETWEEN_SEPARATOR:I = 0x4

.field private static final IPV6_MAX_CHAR_COUNT:I = 0x27

.field private static final IPV6_MAX_SEPARATORS:I = 0x8

.field private static final IPV6_MIN_SEPARATORS:I = 0x2

.field private static final IPV6_WORD_COUNT:I = 0x8

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 85
    const-class v0, Lorg/jboss/netty/util/NetUtil;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/util/NetUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 817
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 819
    return-void
.end method

.method private static convertToBytes(Ljava/lang/String;[BI)V
    .locals 7
    .param p0, "hexWord"    # Ljava/lang/String;
    .param p1, "ipByteArray"    # [B
    .param p2, "byteIndex"    # I

    .prologue
    const/4 v5, 0x0

    .line 194
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 195
    .local v3, "hexWordLength":I
    const/4 v1, 0x0

    .line 196
    .local v1, "hexWordIndex":I
    aput-byte v5, p1, p2

    .line 197
    add-int/lit8 v4, p2, 0x1

    aput-byte v5, p1, v4

    .line 201
    const/4 v4, 0x3

    if-le v3, v4, :cond_2

    .line 202
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "hexWordIndex":I
    .local v2, "hexWordIndex":I
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/jboss/netty/util/NetUtil;->getIntValue(C)I

    move-result v0

    .line 203
    .local v0, "charValue":I
    aget-byte v4, p1, p2

    shl-int/lit8 v5, v0, 0x4

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, p1, p2

    .line 207
    .end local v0    # "charValue":I
    :goto_0
    const/4 v4, 0x2

    if-le v3, v4, :cond_0

    .line 208
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "hexWordIndex":I
    .restart local v1    # "hexWordIndex":I
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/jboss/netty/util/NetUtil;->getIntValue(C)I

    move-result v0

    .line 209
    .restart local v0    # "charValue":I
    aget-byte v4, p1, p2

    or-int/2addr v4, v0

    int-to-byte v4, v4

    aput-byte v4, p1, p2

    move v2, v1

    .line 213
    .end local v0    # "charValue":I
    .end local v1    # "hexWordIndex":I
    .restart local v2    # "hexWordIndex":I
    :cond_0
    const/4 v4, 0x1

    if-le v3, v4, :cond_1

    .line 214
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "hexWordIndex":I
    .restart local v1    # "hexWordIndex":I
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/jboss/netty/util/NetUtil;->getIntValue(C)I

    move-result v0

    .line 215
    .restart local v0    # "charValue":I
    add-int/lit8 v4, p2, 0x1

    aget-byte v5, p1, v4

    shl-int/lit8 v6, v0, 0x4

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, p1, v4

    .line 219
    .end local v0    # "charValue":I
    :goto_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/jboss/netty/util/NetUtil;->getIntValue(C)I

    move-result v0

    .line 220
    .restart local v0    # "charValue":I
    add-int/lit8 v4, p2, 0x1

    aget-byte v5, p1, v4

    and-int/lit8 v6, v0, 0xf

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, p1, v4

    .line 221
    return-void

    .end local v0    # "charValue":I
    .end local v1    # "hexWordIndex":I
    .restart local v2    # "hexWordIndex":I
    :cond_1
    move v1, v2

    .end local v2    # "hexWordIndex":I
    .restart local v1    # "hexWordIndex":I
    goto :goto_1

    :cond_2
    move v2, v1

    .end local v1    # "hexWordIndex":I
    .restart local v2    # "hexWordIndex":I
    goto :goto_0
.end method

.method public static createByteArrayFromIpAddressString(Ljava/lang/String;)[B
    .locals 15
    .param p0, "ipAddressString"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-static {p0}, Lorg/jboss/netty/util/NetUtil;->isValidIpV4Address(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 94
    new-instance v12, Ljava/util/StringTokenizer;

    const-string v13, "."

    invoke-direct {v12, p0, v13}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .local v12, "tokenizer":Ljava/util/StringTokenizer;
    const/4 v13, 0x4

    new-array v0, v13, [B

    .line 98
    .local v0, "byteAddress":[B
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/4 v13, 0x4

    if-ge v5, v13, :cond_e

    .line 99
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v11

    .line 100
    .local v11, "token":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 101
    .local v10, "tempInt":I
    int-to-byte v13, v10

    aput-byte v13, v0, v5

    .line 98
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 107
    .end local v0    # "byteAddress":[B
    .end local v5    # "i":I
    .end local v10    # "tempInt":I
    .end local v11    # "token":Ljava/lang/String;
    .end local v12    # "tokenizer":Ljava/util/StringTokenizer;
    :cond_0
    invoke-static {p0}, Lorg/jboss/netty/util/NetUtil;->isValidIpV6Address(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_f

    .line 108
    const/4 v13, 0x0

    invoke-virtual {p0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x5b

    if-ne v13, v14, :cond_1

    .line 109
    const/4 v13, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-virtual {p0, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 112
    :cond_1
    const/16 v13, 0x25

    invoke-virtual {p0, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 113
    .local v8, "percentPos":I
    if-ltz v8, :cond_2

    .line 114
    const/4 v13, 0x0

    invoke-virtual {p0, v13, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 117
    :cond_2
    new-instance v12, Ljava/util/StringTokenizer;

    const-string v13, ":."

    const/4 v14, 0x1

    invoke-direct {v12, p0, v13, v14}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 118
    .restart local v12    # "tokenizer":Ljava/util/StringTokenizer;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v3, "hexStrings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v1, "decStrings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v11, ""

    .line 121
    .restart local v11    # "token":Ljava/lang/String;
    const-string v9, ""

    .line 122
    .local v9, "prevToken":Ljava/lang/String;
    const/4 v2, -0x1

    .line 130
    .local v2, "doubleColonIndex":I
    :cond_3
    :goto_1
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 131
    move-object v9, v11

    .line 132
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v11

    .line 134
    const-string v13, ":"

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 135
    const-string v13, ":"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 136
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    goto :goto_1

    .line 137
    :cond_4
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v13

    if-eqz v13, :cond_3

    .line 138
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 140
    :cond_5
    const-string v13, "."

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 141
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 145
    :cond_6
    const-string v13, ":"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 146
    const-string v13, ":"

    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 147
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 157
    :cond_7
    :goto_2
    const/16 v4, 0x8

    .line 161
    .local v4, "hexStringsLength":I
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_8

    .line 162
    add-int/lit8 v4, v4, -0x2

    .line 166
    :cond_8
    const/4 v13, -0x1

    if-eq v2, v13, :cond_b

    .line 167
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v13

    sub-int v7, v4, v13

    .line 168
    .local v7, "numberToInsert":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_3
    if-ge v5, v7, :cond_b

    .line 169
    const-string v13, "0"

    invoke-virtual {v3, v2, v13}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 168
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 149
    .end local v4    # "hexStringsLength":I
    .end local v5    # "i":I
    .end local v7    # "numberToInsert":I
    :cond_9
    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 151
    :cond_a
    const-string v13, "."

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 152
    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 173
    .restart local v4    # "hexStringsLength":I
    :cond_b
    const/16 v13, 0x10

    new-array v6, v13, [B

    .line 176
    .local v6, "ipByteArray":[B
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v5, v13, :cond_c

    .line 177
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    shl-int/lit8 v14, v5, 0x1

    invoke-static {v13, v6, v14}, Lorg/jboss/netty/util/NetUtil;->convertToBytes(Ljava/lang/String;[BI)V

    .line 176
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 181
    :cond_c
    const/4 v5, 0x0

    :goto_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v5, v13, :cond_d

    .line 182
    add-int/lit8 v14, v5, 0xc

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    and-int/lit16 v13, v13, 0xff

    int-to-byte v13, v13

    aput-byte v13, v6, v14

    .line 181
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    :cond_d
    move-object v0, v6

    .line 186
    .end local v1    # "decStrings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "doubleColonIndex":I
    .end local v3    # "hexStrings":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v4    # "hexStringsLength":I
    .end local v5    # "i":I
    .end local v6    # "ipByteArray":[B
    .end local v8    # "percentPos":I
    .end local v9    # "prevToken":Ljava/lang/String;
    .end local v11    # "token":Ljava/lang/String;
    .end local v12    # "tokenizer":Ljava/util/StringTokenizer;
    :cond_e
    :goto_6
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static getByName(Ljava/lang/CharSequence;)Ljava/net/Inet6Address;
    .locals 1
    .param p0, "ip"    # Ljava/lang/CharSequence;

    .prologue
    .line 460
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/jboss/netty/util/NetUtil;->getByName(Ljava/lang/CharSequence;Z)Ljava/net/Inet6Address;

    move-result-object v0

    return-object v0
.end method

.method public static getByName(Ljava/lang/CharSequence;Z)Ljava/net/Inet6Address;
    .locals 21
    .param p0, "ip"    # Ljava/lang/CharSequence;
    .param p1, "ipv4Mapped"    # Z

    .prologue
    .line 478
    const/16 v18, 0x10

    move/from16 v0, v18

    new-array v3, v0, [B

    .line 479
    .local v3, "bytes":[B
    invoke-interface/range {p0 .. p0}, Ljava/lang/CharSequence;->length()I

    move-result v11

    .line 480
    .local v11, "ipLength":I
    const/4 v5, 0x0

    .line 481
    .local v5, "compressBegin":I
    const/4 v6, 0x0

    .line 482
    .local v6, "compressLength":I
    const/4 v7, 0x0

    .line 483
    .local v7, "currentIndex":I
    const/16 v17, 0x0

    .line 484
    .local v17, "value":I
    const/4 v2, -0x1

    .line 485
    .local v2, "begin":I
    const/4 v10, 0x0

    .line 486
    .local v10, "i":I
    const/4 v13, 0x0

    .line 487
    .local v13, "ipv6Seperators":I
    const/4 v12, 0x0

    .line 489
    .local v12, "ipv4Seperators":I
    const/4 v15, 0x0

    .local v15, "needsShift":Z
    move v8, v7

    .line 490
    .end local v7    # "currentIndex":I
    .local v8, "currentIndex":I
    :goto_0
    if-ge v10, v11, :cond_12

    .line 491
    move-object/from16 v0, p0

    invoke-interface {v0, v10}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 492
    .local v4, "c":C
    sparse-switch v4, :sswitch_data_0

    .line 556
    invoke-static {v4}, Lorg/jboss/netty/util/NetUtil;->isValidHexChar(C)Z

    move-result v18

    if-eqz v18, :cond_0

    if-lez v12, :cond_f

    invoke-static {v4}, Lorg/jboss/netty/util/NetUtil;->isValidNumericChar(C)Z

    move-result v18

    if-nez v18, :cond_f

    .line 557
    :cond_0
    const/16 v18, 0x0

    move v7, v8

    .line 659
    .end local v4    # "c":C
    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    :goto_1
    return-object v18

    .line 494
    .end local v7    # "currentIndex":I
    .restart local v4    # "c":C
    .restart local v8    # "currentIndex":I
    :sswitch_0
    add-int/lit8 v13, v13, 0x1

    .line 495
    sub-int v18, v10, v2

    const/16 v19, 0x4

    move/from16 v0, v18

    move/from16 v1, v19

    if-gt v0, v1, :cond_1

    if-gtz v12, :cond_1

    const/16 v18, 0x8

    move/from16 v0, v18

    if-gt v13, v0, :cond_1

    add-int/lit8 v18, v8, 0x1

    array-length v0, v3

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_2

    .line 498
    :cond_1
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto :goto_1

    .line 500
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_2
    sub-int v18, v10, v2

    rsub-int/lit8 v18, v18, 0x4

    shl-int/lit8 v18, v18, 0x2

    shl-int v17, v17, v18

    .line 502
    if-lez v6, :cond_3

    .line 503
    add-int/lit8 v6, v6, -0x2

    .line 509
    :cond_3
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    and-int/lit8 v18, v17, 0xf

    shl-int/lit8 v18, v18, 0x4

    shr-int/lit8 v19, v17, 0x4

    and-int/lit8 v19, v19, 0xf

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v3, v8

    .line 510
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    shr-int/lit8 v18, v17, 0x8

    and-int/lit8 v18, v18, 0xf

    shl-int/lit8 v18, v18, 0x4

    shr-int/lit8 v19, v17, 0xc

    and-int/lit8 v19, v19, 0xf

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v3, v7

    .line 511
    add-int/lit8 v16, v10, 0x1

    .line 512
    .local v16, "tmp":I
    move/from16 v0, v16

    if-ge v0, v11, :cond_6

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_6

    .line 513
    add-int/lit8 v16, v16, 0x1

    .line 514
    if-nez v5, :cond_4

    move/from16 v0, v16

    if-ge v0, v11, :cond_5

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_5

    .line 515
    :cond_4
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 517
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_5
    add-int/lit8 v13, v13, 0x1

    .line 518
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v13, v0, :cond_7

    if-nez v17, :cond_7

    const/4 v15, 0x1

    .line 519
    :goto_2
    move v5, v8

    .line 520
    array-length v0, v3

    move/from16 v18, v0

    sub-int v18, v18, v5

    add-int/lit8 v6, v18, -0x2

    .line 521
    add-int/lit8 v10, v10, 0x1

    .line 523
    :cond_6
    const/16 v17, 0x0

    .line 524
    const/4 v2, -0x1

    move v7, v8

    .line 490
    .end local v8    # "currentIndex":I
    .end local v16    # "tmp":I
    .restart local v7    # "currentIndex":I
    :goto_3
    add-int/lit8 v10, v10, 0x1

    move v8, v7

    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    goto/16 :goto_0

    .line 518
    .restart local v16    # "tmp":I
    :cond_7
    const/4 v15, 0x0

    goto :goto_2

    .line 527
    .end local v16    # "tmp":I
    :sswitch_1
    add-int/lit8 v12, v12, 0x1

    .line 528
    sub-int v18, v10, v2

    const/16 v19, 0x3

    move/from16 v0, v18

    move/from16 v1, v19

    if-gt v0, v1, :cond_b

    const/16 v18, 0x3

    move/from16 v0, v18

    if-gt v12, v0, :cond_b

    if-lez v13, :cond_8

    add-int v18, v8, v6

    const/16 v19, 0xc

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_b

    :cond_8
    add-int/lit8 v18, v10, 0x1

    move/from16 v0, v18

    if-ge v0, v11, :cond_b

    array-length v0, v3

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v8, v0, :cond_b

    if-ltz v2, :cond_b

    if-nez v2, :cond_c

    const/16 v18, 0x3

    move/from16 v0, v18

    if-ne v10, v0, :cond_9

    const/16 v18, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    invoke-static/range {v18 .. v18}, Lorg/jboss/netty/util/NetUtil;->isValidNumericChar(C)Z

    move-result v18

    if-eqz v18, :cond_b

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    invoke-static/range {v18 .. v18}, Lorg/jboss/netty/util/NetUtil;->isValidNumericChar(C)Z

    move-result v18

    if-eqz v18, :cond_b

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    invoke-static/range {v18 .. v18}, Lorg/jboss/netty/util/NetUtil;->isValidNumericChar(C)Z

    move-result v18

    if-eqz v18, :cond_b

    :cond_9
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v10, v0, :cond_a

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    invoke-static/range {v18 .. v18}, Lorg/jboss/netty/util/NetUtil;->isValidNumericChar(C)Z

    move-result v18

    if-eqz v18, :cond_b

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    invoke-static/range {v18 .. v18}, Lorg/jboss/netty/util/NetUtil;->isValidNumericChar(C)Z

    move-result v18

    if-eqz v18, :cond_b

    :cond_a
    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v10, v0, :cond_c

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    invoke-static/range {v18 .. v18}, Lorg/jboss/netty/util/NetUtil;->isValidNumericChar(C)Z

    move-result v18

    if-nez v18, :cond_c

    .line 540
    :cond_b
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 542
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_c
    sub-int v18, v10, v2

    rsub-int/lit8 v18, v18, 0x3

    shl-int/lit8 v18, v18, 0x2

    shl-int v17, v17, v18

    .line 547
    and-int/lit8 v18, v17, 0xf

    mul-int/lit8 v18, v18, 0x64

    shr-int/lit8 v19, v17, 0x4

    and-int/lit8 v19, v19, 0xf

    mul-int/lit8 v19, v19, 0xa

    add-int v18, v18, v19

    shr-int/lit8 v19, v17, 0x8

    and-int/lit8 v19, v19, 0xf

    add-int v2, v18, v19

    .line 548
    if-ltz v2, :cond_d

    const/16 v18, 0xff

    move/from16 v0, v18

    if-le v2, v0, :cond_e

    .line 549
    :cond_d
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 551
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_e
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    int-to-byte v0, v2

    move/from16 v18, v0

    aput-byte v18, v3, v8

    .line 552
    const/16 v17, 0x0

    .line 553
    const/4 v2, -0x1

    .line 554
    goto/16 :goto_3

    .line 559
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_f
    if-gez v2, :cond_11

    .line 560
    move v2, v10

    .line 568
    :cond_10
    invoke-static {v4}, Lorg/jboss/netty/util/NetUtil;->getIntValue(C)I

    move-result v18

    sub-int v19, v10, v2

    shl-int/lit8 v19, v19, 0x2

    shl-int v18, v18, v19

    add-int v17, v17, v18

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_3

    .line 561
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_11
    sub-int v18, v10, v2

    const/16 v19, 0x4

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_10

    .line 562
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 573
    .end local v4    # "c":C
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_12
    if-lez v5, :cond_15

    const/4 v14, 0x1

    .line 575
    .local v14, "isCompressed":Z
    :goto_4
    if-lez v12, :cond_1f

    .line 576
    if-lez v2, :cond_13

    sub-int v18, v10, v2

    const/16 v19, 0x3

    move/from16 v0, v18

    move/from16 v1, v19

    if-gt v0, v1, :cond_14

    :cond_13
    const/16 v18, 0x3

    move/from16 v0, v18

    if-ne v12, v0, :cond_14

    array-length v0, v3

    move/from16 v18, v0

    move/from16 v0, v18

    if-lt v8, v0, :cond_16

    .line 579
    :cond_14
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 573
    .end local v7    # "currentIndex":I
    .end local v14    # "isCompressed":Z
    .restart local v8    # "currentIndex":I
    :cond_15
    const/4 v14, 0x0

    goto :goto_4

    .line 581
    .restart local v14    # "isCompressed":Z
    :cond_16
    if-nez v13, :cond_18

    .line 582
    const/16 v6, 0xc

    .line 592
    :goto_5
    sub-int v18, v10, v2

    rsub-int/lit8 v18, v18, 0x3

    shl-int/lit8 v18, v18, 0x2

    shl-int v17, v17, v18

    .line 597
    and-int/lit8 v18, v17, 0xf

    mul-int/lit8 v18, v18, 0x64

    shr-int/lit8 v19, v17, 0x4

    and-int/lit8 v19, v19, 0xf

    mul-int/lit8 v19, v19, 0xa

    add-int v18, v18, v19

    shr-int/lit8 v19, v17, 0x8

    and-int/lit8 v19, v19, 0xf

    add-int v2, v18, v19

    .line 598
    if-ltz v2, :cond_17

    const/16 v18, 0xff

    move/from16 v0, v18

    if-le v2, v0, :cond_1c

    .line 599
    :cond_17
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 583
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_18
    const/16 v18, 0x2

    move/from16 v0, v18

    if-lt v13, v0, :cond_1b

    add-int/lit8 v18, v11, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_1b

    if-nez v14, :cond_19

    const/16 v18, 0x6

    move/from16 v0, v18

    if-ne v13, v0, :cond_19

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1a

    :cond_19
    if-eqz v14, :cond_1b

    add-int/lit8 v18, v13, 0x1

    const/16 v19, 0x8

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_1b

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1a

    const/16 v18, 0x2

    move/from16 v0, v18

    if-gt v5, v0, :cond_1b

    .line 588
    :cond_1a
    add-int/lit8 v6, v6, -0x2

    goto :goto_5

    .line 590
    :cond_1b
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 601
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_1c
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    int-to-byte v0, v2

    move/from16 v18, v0

    aput-byte v18, v3, v8

    .line 625
    :goto_6
    add-int v10, v7, v6

    .line 626
    if-nez v15, :cond_1d

    array-length v0, v3

    move/from16 v18, v0

    move/from16 v0, v18

    if-lt v10, v0, :cond_28

    .line 628
    :cond_1d
    array-length v0, v3

    move/from16 v18, v0

    move/from16 v0, v18

    if-lt v10, v0, :cond_1e

    .line 629
    add-int/lit8 v5, v5, 0x1

    .line 631
    :cond_1e
    move v10, v7

    :goto_7
    array-length v0, v3

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v10, v0, :cond_29

    .line 632
    array-length v0, v3

    move/from16 v18, v0

    add-int/lit8 v2, v18, -0x1

    :goto_8
    if-lt v2, v5, :cond_27

    .line 633
    add-int/lit8 v18, v2, -0x1

    aget-byte v18, v3, v18

    aput-byte v18, v3, v2

    .line 632
    add-int/lit8 v2, v2, -0x1

    goto :goto_8

    .line 603
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_1f
    add-int/lit8 v16, v11, -0x1

    .line 604
    .restart local v16    # "tmp":I
    if-lez v2, :cond_20

    sub-int v18, v10, v2

    const/16 v19, 0x4

    move/from16 v0, v18

    move/from16 v1, v19

    if-gt v0, v1, :cond_24

    :cond_20
    const/16 v18, 0x2

    move/from16 v0, v18

    if-lt v13, v0, :cond_24

    if-nez v14, :cond_21

    add-int/lit8 v18, v13, 0x1

    const/16 v19, 0x8

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_24

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_24

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_24

    :cond_21
    if-eqz v14, :cond_23

    const/16 v18, 0x8

    move/from16 v0, v18

    if-gt v13, v0, :cond_24

    const/16 v18, 0x8

    move/from16 v0, v18

    if-ne v13, v0, :cond_23

    const/16 v18, 0x2

    move/from16 v0, v18

    if-gt v5, v0, :cond_22

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_24

    :cond_22
    const/16 v18, 0xe

    move/from16 v0, v18

    if-lt v5, v0, :cond_23

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v18

    const/16 v19, 0x3a

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_24

    :cond_23
    add-int/lit8 v18, v8, 0x1

    array-length v0, v3

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_25

    .line 613
    :cond_24
    const/16 v18, 0x0

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_1

    .line 615
    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    :cond_25
    if-ltz v2, :cond_26

    sub-int v18, v10, v2

    const/16 v19, 0x4

    move/from16 v0, v18

    move/from16 v1, v19

    if-gt v0, v1, :cond_26

    .line 616
    sub-int v18, v10, v2

    rsub-int/lit8 v18, v18, 0x4

    shl-int/lit8 v18, v18, 0x2

    shl-int v17, v17, v18

    .line 621
    :cond_26
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    and-int/lit8 v18, v17, 0xf

    shl-int/lit8 v18, v18, 0x4

    shr-int/lit8 v19, v17, 0x4

    and-int/lit8 v19, v19, 0xf

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v3, v8

    .line 622
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "currentIndex":I
    .restart local v8    # "currentIndex":I
    shr-int/lit8 v18, v17, 0x8

    and-int/lit8 v18, v18, 0xf

    shl-int/lit8 v18, v18, 0x4

    shr-int/lit8 v19, v17, 0xc

    and-int/lit8 v19, v19, 0xf

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-byte v0, v0

    move/from16 v18, v0

    aput-byte v18, v3, v7

    move v7, v8

    .end local v8    # "currentIndex":I
    .restart local v7    # "currentIndex":I
    goto/16 :goto_6

    .line 635
    .end local v16    # "tmp":I
    :cond_27
    const/16 v18, 0x0

    aput-byte v18, v3, v2

    .line 636
    add-int/lit8 v5, v5, 0x1

    .line 631
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_7

    .line 640
    :cond_28
    const/4 v10, 0x0

    :goto_9
    if-ge v10, v6, :cond_29

    .line 641
    add-int v2, v10, v5

    .line 642
    add-int v7, v2, v6

    .line 643
    array-length v0, v3

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v7, v0, :cond_29

    .line 644
    aget-byte v18, v3, v2

    aput-byte v18, v3, v7

    .line 645
    const/16 v18, 0x0

    aput-byte v18, v3, v2

    .line 640
    add-int/lit8 v10, v10, 0x1

    goto :goto_9

    .line 652
    :cond_29
    if-eqz p1, :cond_2a

    if-lez v12, :cond_2a

    const/16 v18, 0x0

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x1

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x2

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x3

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x4

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x5

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x6

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x7

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x8

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    const/16 v18, 0x9

    aget-byte v18, v3, v18

    if-nez v18, :cond_2a

    .line 655
    const/16 v18, 0xa

    const/16 v19, 0xb

    const/16 v20, -0x1

    aput-byte v20, v3, v19

    aput-byte v20, v3, v18

    .line 659
    :cond_2a
    const/16 v18, 0x0

    const/16 v19, -0x1

    :try_start_0
    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v0, v3, v1}, Ljava/net/Inet6Address;->getByAddress(Ljava/lang/String;[BI)Ljava/net/Inet6Address;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v18

    goto/16 :goto_1

    .line 660
    :catch_0
    move-exception v9

    .line 661
    .local v9, "e":Ljava/net/UnknownHostException;
    new-instance v18, Ljava/lang/RuntimeException;

    move-object/from16 v0, v18

    invoke-direct {v0, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v18

    .line 492
    :sswitch_data_0
    .sparse-switch
        0x2e -> :sswitch_1
        0x3a -> :sswitch_0
    .end sparse-switch
.end method

.method static getIntValue(C)I
    .locals 1
    .param p0, "c"    # C

    .prologue
    const/4 v0, 0x0

    .line 225
    packed-switch p0, :pswitch_data_0

    .line 248
    invoke-static {p0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result p0

    .line 249
    packed-switch p0, :pswitch_data_1

    .line 263
    :goto_0
    :pswitch_0
    return v0

    .line 229
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 231
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 233
    :pswitch_3
    const/4 v0, 0x3

    goto :goto_0

    .line 235
    :pswitch_4
    const/4 v0, 0x4

    goto :goto_0

    .line 237
    :pswitch_5
    const/4 v0, 0x5

    goto :goto_0

    .line 239
    :pswitch_6
    const/4 v0, 0x6

    goto :goto_0

    .line 241
    :pswitch_7
    const/4 v0, 0x7

    goto :goto_0

    .line 243
    :pswitch_8
    const/16 v0, 0x8

    goto :goto_0

    .line 245
    :pswitch_9
    const/16 v0, 0x9

    goto :goto_0

    .line 251
    :pswitch_a
    const/16 v0, 0xa

    goto :goto_0

    .line 253
    :pswitch_b
    const/16 v0, 0xb

    goto :goto_0

    .line 255
    :pswitch_c
    const/16 v0, 0xc

    goto :goto_0

    .line 257
    :pswitch_d
    const/16 v0, 0xd

    goto :goto_0

    .line 259
    :pswitch_e
    const/16 v0, 0xe

    goto :goto_0

    .line 261
    :pswitch_f
    const/16 v0, 0xf

    goto :goto_0

    .line 225
    :pswitch_data_0
    .packed-switch 0x30
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
    .end packed-switch

    .line 249
    :pswitch_data_1
    .packed-switch 0x61
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
    .end packed-switch
.end method

.method private static inRangeEndExclusive(III)Z
    .locals 1
    .param p0, "value"    # I
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 811
    if-lt p0, p1, :cond_0

    if-ge p0, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isValidHexChar(C)Z
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 397
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-le p0, v0, :cond_2

    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1

    const/16 v0, 0x46

    if-le p0, v0, :cond_2

    :cond_1
    const/16 v0, 0x61

    if-lt p0, v0, :cond_3

    const/16 v0, 0x66

    if-gt p0, v0, :cond_3

    :cond_2
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isValidIp4Word(Ljava/lang/String;)Z
    .locals 6
    .param p0, "word"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 384
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v4, v2, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x3

    if-le v4, v5, :cond_1

    .line 393
    :cond_0
    :goto_0
    return v3

    .line 387
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 388
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 389
    .local v0, "c":C
    const/16 v4, 0x30

    if-lt v0, v4, :cond_0

    const/16 v4, 0x39

    if-gt v0, v4, :cond_0

    .line 387
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 393
    .end local v0    # "c":C
    :cond_2
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/16 v5, 0xff

    if-gt v4, v5, :cond_3

    :goto_2
    move v3, v2

    goto :goto_0

    :cond_3
    move v2, v3

    goto :goto_2
.end method

.method public static isValidIpV4Address(Ljava/lang/String;)Z
    .locals 10
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0xff

    const/4 v8, 0x3

    const/4 v5, 0x0

    .line 412
    const/4 v3, 0x0

    .line 414
    .local v3, "periods":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 416
    .local v2, "length":I
    const/16 v6, 0xf

    if-le v2, v6, :cond_1

    .line 449
    :cond_0
    :goto_0
    return v5

    .line 420
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 421
    .local v4, "word":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_3

    .line 422
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 423
    .local v0, "c":C
    const/16 v6, 0x2e

    if-ne v0, v6, :cond_2

    .line 424
    add-int/lit8 v3, v3, 0x1

    .line 425
    if-gt v3, v8, :cond_0

    .line 428
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-eqz v6, :cond_0

    .line 431
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    if-gt v6, v9, :cond_0

    .line 434
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 421
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 435
    :cond_2
    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 438
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    const/4 v7, 0x2

    if-gt v6, v7, :cond_0

    .line 441
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 445
    .end local v0    # "c":C
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    if-gt v6, v9, :cond_0

    .line 449
    if-ne v3, v8, :cond_0

    const/4 v5, 0x1

    goto :goto_0
.end method

.method public static isValidIpV6Address(Ljava/lang/String;)Z
    .locals 13
    .param p0, "ipAddress"    # Ljava/lang/String;

    .prologue
    .line 267
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 268
    .local v4, "length":I
    const/4 v1, 0x0

    .line 269
    .local v1, "doubleColon":Z
    const/4 v5, 0x0

    .line 270
    .local v5, "numberOfColons":I
    const/4 v6, 0x0

    .line 271
    .local v6, "numberOfPeriods":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .local v10, "word":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 274
    .local v0, "c":C
    const/4 v9, 0x0

    .line 275
    .local v9, "startOffset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 277
    .local v2, "endOffset":I
    const/4 v11, 0x2

    if-ge v2, v11, :cond_0

    .line 278
    const/4 v11, 0x0

    .line 379
    :goto_0
    return v11

    .line 282
    :cond_0
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x5b

    if-ne v11, v12, :cond_2

    .line 283
    add-int/lit8 v11, v2, -0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x5d

    if-eq v11, v12, :cond_1

    .line 284
    const/4 v11, 0x0

    goto :goto_0

    .line 287
    :cond_1
    const/4 v9, 0x1

    .line 288
    add-int/lit8 v2, v2, -0x1

    .line 292
    :cond_2
    const/16 v11, 0x25

    invoke-virtual {p0, v11, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    .line 293
    .local v7, "percentIdx":I
    if-ltz v7, :cond_3

    .line 294
    move v2, v7

    .line 297
    :cond_3
    move v3, v9

    .local v3, "i":I
    :goto_1
    if-ge v3, v2, :cond_10

    .line 298
    move v8, v0

    .line 299
    .local v8, "prevChar":C
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 300
    sparse-switch v0, :sswitch_data_0

    .line 347
    if-eqz v10, :cond_e

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    const/4 v12, 0x3

    if-le v11, v12, :cond_e

    .line 348
    const/4 v11, 0x0

    goto :goto_0

    .line 303
    :sswitch_0
    add-int/lit8 v6, v6, 0x1

    .line 304
    const/4 v11, 0x3

    if-le v6, v11, :cond_4

    .line 305
    const/4 v11, 0x0

    goto :goto_0

    .line 307
    :cond_4
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lorg/jboss/netty/util/NetUtil;->isValidIp4Word(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_5

    .line 308
    const/4 v11, 0x0

    goto :goto_0

    .line 310
    :cond_5
    const/4 v11, 0x6

    if-eq v5, v11, :cond_6

    if-nez v1, :cond_6

    .line 311
    const/4 v11, 0x0

    goto :goto_0

    .line 315
    :cond_6
    const/4 v11, 0x7

    if-ne v5, v11, :cond_7

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x3a

    if-eq v11, v12, :cond_7

    add-int/lit8 v11, v9, 0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x3a

    if-eq v11, v12, :cond_7

    .line 317
    const/4 v11, 0x0

    goto :goto_0

    .line 319
    :cond_7
    const/4 v11, 0x0

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 297
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 326
    :sswitch_1
    if-ne v3, v9, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    if-le v11, v3, :cond_8

    add-int/lit8 v11, v3, 0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x3a

    if-eq v11, v12, :cond_9

    .line 327
    :cond_8
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 330
    :cond_9
    add-int/lit8 v5, v5, 0x1

    .line 331
    const/4 v11, 0x7

    if-le v5, v11, :cond_a

    .line 332
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 334
    :cond_a
    if-lez v6, :cond_b

    .line 335
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 337
    :cond_b
    const/16 v11, 0x3a

    if-ne v8, v11, :cond_d

    .line 338
    if-eqz v1, :cond_c

    .line 339
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 341
    :cond_c
    const/4 v1, 0x1

    .line 343
    :cond_d
    const/4 v11, 0x0

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 350
    :cond_e
    invoke-static {v0}, Lorg/jboss/netty/util/NetUtil;->isValidHexChar(C)Z

    move-result v11

    if-nez v11, :cond_f

    .line 351
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 353
    :cond_f
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 358
    .end local v8    # "prevChar":C
    :cond_10
    if-lez v6, :cond_12

    .line 360
    const/4 v11, 0x3

    if-ne v6, v11, :cond_11

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lorg/jboss/netty/util/NetUtil;->isValidIp4Word(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_11

    const/4 v11, 0x7

    if-lt v5, v11, :cond_14

    .line 361
    :cond_11
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 366
    :cond_12
    const/4 v11, 0x7

    if-eq v5, v11, :cond_13

    if-nez v1, :cond_13

    .line 367
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 373
    :cond_13
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-nez v11, :cond_14

    add-int/lit8 v11, v4, -0x1

    sub-int/2addr v11, v9

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x3a

    if-ne v11, v12, :cond_14

    add-int/lit8 v11, v4, -0x2

    sub-int/2addr v11, v9

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x3a

    if-eq v11, v12, :cond_14

    .line 375
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 379
    :cond_14
    const/4 v11, 0x1

    goto/16 :goto_0

    .line 300
    nop

    :sswitch_data_0
    .sparse-switch
        0x2e -> :sswitch_0
        0x3a -> :sswitch_1
    .end sparse-switch
.end method

.method private static isValidNumericChar(C)Z
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 401
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toAddressString(Ljava/net/InetAddress;)Ljava/lang/String;
    .locals 1
    .param p0, "ip"    # Ljava/net/InetAddress;

    .prologue
    .line 678
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jboss/netty/util/NetUtil;->toAddressString(Ljava/net/InetAddress;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toAddressString(Ljava/net/InetAddress;Z)Ljava/lang/String;
    .locals 13
    .param p0, "ip"    # Ljava/net/InetAddress;
    .param p1, "ipv4Mapped"    # Z

    .prologue
    .line 706
    instance-of v10, p0, Ljava/net/Inet4Address;

    if-eqz v10, :cond_0

    .line 707
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    .line 796
    :goto_0
    return-object v10

    .line 709
    :cond_0
    instance-of v10, p0, Ljava/net/Inet6Address;

    if-nez v10, :cond_1

    .line 710
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unhandled type: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 713
    :cond_1
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v1

    .line 714
    .local v1, "bytes":[B
    const/16 v10, 0x8

    new-array v9, v10, [I

    .line 716
    .local v9, "words":[I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v10, v9

    if-ge v4, v10, :cond_2

    .line 717
    shl-int/lit8 v10, v4, 0x1

    aget-byte v10, v1, v10

    and-int/lit16 v10, v10, 0xff

    shl-int/lit8 v10, v10, 0x8

    shl-int/lit8 v11, v4, 0x1

    add-int/lit8 v11, v11, 0x1

    aget-byte v11, v1, v11

    and-int/lit16 v11, v11, 0xff

    or-int/2addr v10, v11

    aput v10, v9, v4

    .line 716
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 721
    :cond_2
    const/4 v3, -0x1

    .line 722
    .local v3, "currentStart":I
    const/4 v2, 0x0

    .line 723
    .local v2, "currentLength":I
    const/4 v8, -0x1

    .line 724
    .local v8, "shortestStart":I
    const/4 v7, 0x0

    .line 725
    .local v7, "shortestLength":I
    const/4 v4, 0x0

    :goto_2
    array-length v10, v9

    if-ge v4, v10, :cond_6

    .line 726
    aget v10, v9, v4

    if-nez v10, :cond_4

    .line 727
    if-gez v3, :cond_3

    .line 728
    move v3, v4

    .line 725
    :cond_3
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 730
    :cond_4
    if-ltz v3, :cond_3

    .line 731
    sub-int v2, v4, v3

    .line 732
    if-le v2, v7, :cond_5

    .line 733
    move v8, v3

    .line 734
    move v7, v2

    .line 736
    :cond_5
    const/4 v3, -0x1

    goto :goto_3

    .line 740
    :cond_6
    if-ltz v3, :cond_7

    .line 741
    sub-int v2, v4, v3

    .line 742
    if-le v2, v7, :cond_7

    .line 743
    move v8, v3

    .line 744
    move v7, v2

    .line 748
    :cond_7
    const/4 v10, 0x1

    if-ne v7, v10, :cond_8

    .line 749
    const/4 v7, 0x0

    .line 750
    const/4 v8, -0x1

    .line 754
    :cond_8
    add-int v6, v8, v7

    .line 755
    .local v6, "shortestEnd":I
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v10, 0x27

    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 756
    .local v0, "b":Ljava/lang/StringBuilder;
    if-gez v6, :cond_9

    .line 757
    const/4 v10, 0x0

    aget v10, v9, v10

    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 758
    const/4 v4, 0x1

    :goto_4
    array-length v10, v9

    if-ge v4, v10, :cond_12

    .line 759
    const/16 v10, 0x3a

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 760
    aget v10, v9, v4

    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 758
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 765
    :cond_9
    const/4 v10, 0x0

    invoke-static {v10, v8, v6}, Lorg/jboss/netty/util/NetUtil;->inRangeEndExclusive(III)Z

    move-result v10

    if-eqz v10, :cond_e

    .line 766
    const-string v10, "::"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 767
    if-eqz p1, :cond_d

    const/4 v10, 0x5

    if-ne v6, v10, :cond_d

    const/4 v10, 0x5

    aget v10, v9, v10

    const v11, 0xffff

    if-ne v10, v11, :cond_d

    const/4 v5, 0x1

    .line 772
    .local v5, "isIpv4Mapped":Z
    :goto_5
    const/4 v4, 0x1

    :goto_6
    array-length v10, v9

    if-ge v4, v10, :cond_12

    .line 773
    invoke-static {v4, v8, v6}, Lorg/jboss/netty/util/NetUtil;->inRangeEndExclusive(III)Z

    move-result v10

    if-nez v10, :cond_11

    .line 774
    add-int/lit8 v10, v4, -0x1

    invoke-static {v10, v8, v6}, Lorg/jboss/netty/util/NetUtil;->inRangeEndExclusive(III)Z

    move-result v10

    if-nez v10, :cond_b

    .line 776
    if-eqz v5, :cond_a

    const/4 v10, 0x6

    if-ne v4, v10, :cond_f

    .line 777
    :cond_a
    const/16 v10, 0x3a

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 782
    :cond_b
    :goto_7
    if-eqz v5, :cond_10

    const/4 v10, 0x5

    if-le v4, v10, :cond_10

    .line 783
    aget v10, v9, v4

    shr-int/lit8 v10, v10, 0x8

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 784
    const/16 v10, 0x2e

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 785
    aget v10, v9, v4

    and-int/lit16 v10, v10, 0xff

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 772
    :cond_c
    :goto_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 767
    .end local v5    # "isIpv4Mapped":Z
    :cond_d
    const/4 v5, 0x0

    goto :goto_5

    .line 769
    :cond_e
    const/4 v10, 0x0

    aget v10, v9, v10

    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 770
    const/4 v5, 0x0

    .restart local v5    # "isIpv4Mapped":Z
    goto :goto_5

    .line 779
    :cond_f
    const/16 v10, 0x2e

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 787
    :cond_10
    aget v10, v9, v4

    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8

    .line 789
    :cond_11
    add-int/lit8 v10, v4, -0x1

    invoke-static {v10, v8, v6}, Lorg/jboss/netty/util/NetUtil;->inRangeEndExclusive(III)Z

    move-result v10

    if-nez v10, :cond_c

    .line 791
    const-string v10, "::"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8

    .line 796
    .end local v5    # "isIpv4Mapped":Z
    :cond_12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_0
.end method
