.class public final Lcom/ning/http/util/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final lookup:[C

.field private static final reverseLookup:[B


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/16 v8, 0x100

    const/16 v7, 0x3f

    const/16 v6, 0x2f

    const/16 v5, 0x2b

    const/16 v4, 0x3e

    .line 22
    const/16 v2, 0x40

    new-array v2, v2, [C

    sput-object v2, Lcom/ning/http/util/Base64;->lookup:[C

    .line 23
    new-array v2, v8, [B

    sput-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    .line 28
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v2, 0x1a

    if-ge v0, v2, :cond_0

    .line 29
    sget-object v2, Lcom/ning/http/util/Base64;->lookup:[C

    add-int/lit8 v3, v0, 0x41

    int-to-char v3, v3

    aput-char v3, v2, v0

    .line 28
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 32
    :cond_0
    const/16 v0, 0x1a

    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    const/16 v2, 0x34

    if-ge v0, v2, :cond_1

    .line 33
    sget-object v2, Lcom/ning/http/util/Base64;->lookup:[C

    add-int/lit8 v3, v1, 0x61

    int-to-char v3, v3

    aput-char v3, v2, v0

    .line 32
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 36
    :cond_1
    const/16 v0, 0x34

    const/4 v1, 0x0

    :goto_2
    if-ge v0, v4, :cond_2

    .line 37
    sget-object v2, Lcom/ning/http/util/Base64;->lookup:[C

    add-int/lit8 v3, v1, 0x30

    int-to-char v3, v3

    aput-char v3, v2, v0

    .line 36
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 40
    :cond_2
    sget-object v2, Lcom/ning/http/util/Base64;->lookup:[C

    aput-char v5, v2, v4

    .line 41
    sget-object v2, Lcom/ning/http/util/Base64;->lookup:[C

    aput-char v6, v2, v7

    .line 45
    const/4 v0, 0x0

    :goto_3
    if-ge v0, v8, :cond_3

    .line 46
    sget-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    const/4 v3, -0x1

    aput-byte v3, v2, v0

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 49
    :cond_3
    const/16 v0, 0x5a

    :goto_4
    const/16 v2, 0x41

    if-lt v0, v2, :cond_4

    .line 50
    sget-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    add-int/lit8 v3, v0, -0x41

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 49
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 53
    :cond_4
    const/16 v0, 0x7a

    :goto_5
    const/16 v2, 0x61

    if-lt v0, v2, :cond_5

    .line 54
    sget-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    add-int/lit8 v3, v0, -0x61

    add-int/lit8 v3, v3, 0x1a

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 53
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    .line 57
    :cond_5
    const/16 v0, 0x39

    :goto_6
    const/16 v2, 0x30

    if-lt v0, v2, :cond_6

    .line 58
    sget-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    add-int/lit8 v3, v0, -0x30

    add-int/lit8 v3, v3, 0x34

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 57
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 61
    :cond_6
    sget-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    aput-byte v4, v2, v5

    .line 62
    sget-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    aput-byte v7, v2, v6

    .line 63
    sget-object v2, Lcom/ning/http/util/Base64;->reverseLookup:[B

    const/16 v3, 0x3d

    const/4 v4, 0x0

    aput-byte v4, v2, v3

    .line 64
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 10
    .param p0, "encoded"    # Ljava/lang/String;

    .prologue
    .line 117
    const/4 v6, 0x0

    .line 119
    .local v6, "padding":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v1, v8, -0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x3d

    if-ne v8, v9, :cond_0

    .line 120
    add-int/lit8 v6, v6, 0x1

    .line 119
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 123
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    mul-int/lit8 v8, v8, 0x6

    div-int/lit8 v8, v8, 0x8

    sub-int v4, v8, v6

    .line 124
    .local v4, "length":I
    new-array v0, v4, [B

    .line 126
    .local v0, "bytes":[B
    const/4 v1, 0x0

    const/4 v2, 0x0

    .local v2, "index":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .local v5, "n":I
    :goto_1
    if-ge v1, v5, :cond_2

    .line 127
    sget-object v8, Lcom/ning/http/util/Base64;->reverseLookup:[B

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v9

    aget-byte v8, v8, v9

    shl-int/lit8 v7, v8, 0x12

    .line 128
    .local v7, "word":I
    sget-object v8, Lcom/ning/http/util/Base64;->reverseLookup:[B

    add-int/lit8 v9, v1, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    aget-byte v8, v8, v9

    shl-int/lit8 v8, v8, 0xc

    add-int/2addr v7, v8

    .line 129
    sget-object v8, Lcom/ning/http/util/Base64;->reverseLookup:[B

    add-int/lit8 v9, v1, 0x2

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    aget-byte v8, v8, v9

    shl-int/lit8 v8, v8, 0x6

    add-int/2addr v7, v8

    .line 130
    sget-object v8, Lcom/ning/http/util/Base64;->reverseLookup:[B

    add-int/lit8 v9, v1, 0x3

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    aget-byte v8, v8, v9

    add-int/2addr v7, v8

    .line 132
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2
    const/4 v8, 0x3

    if-ge v3, v8, :cond_1

    add-int v8, v2, v3

    if-ge v8, v4, :cond_1

    .line 133
    add-int v8, v2, v3

    rsub-int/lit8 v9, v3, 0x2

    mul-int/lit8 v9, v9, 0x8

    shr-int v9, v7, v9

    int-to-byte v9, v9

    aput-byte v9, v0, v8

    .line 132
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 136
    :cond_1
    add-int/lit8 v2, v2, 0x3

    .line 126
    add-int/lit8 v1, v1, 0x4

    goto :goto_1

    .line 139
    .end local v3    # "j":I
    .end local v7    # "word":I
    :cond_2
    return-object v0
.end method

.method public static encode([B)Ljava/lang/String;
    .locals 9
    .param p0, "bytes"    # [B

    .prologue
    const/16 v8, 0x3d

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v6, p0

    add-int/lit8 v6, v6, 0x2

    div-int/lit8 v6, v6, 0x3

    mul-int/lit8 v6, v6, 0x4

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 82
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 83
    .local v3, "i":I
    array-length v6, p0

    add-int/lit8 v2, v6, -0x2

    .local v2, "end":I
    move v4, v3

    .end local v3    # "i":I
    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_0

    .line 84
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    aget-byte v6, p0, v4

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .restart local v4    # "i":I
    aget-byte v7, p0, v3

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v6, v7

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    aget-byte v7, p0, v4

    and-int/lit16 v7, v7, 0xff

    or-int v1, v6, v7

    .line 87
    .local v1, "chunk":I
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    shr-int/lit8 v7, v1, 0x12

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    shr-int/lit8 v7, v1, 0xc

    and-int/lit8 v7, v7, 0x3f

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    shr-int/lit8 v7, v1, 0x6

    and-int/lit8 v7, v7, 0x3f

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 90
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    and-int/lit8 v7, v1, 0x3f

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v4, v3

    .line 91
    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_0

    .line 94
    .end local v1    # "chunk":I
    :cond_0
    array-length v5, p0

    .line 95
    .local v5, "len":I
    if-ge v4, v5, :cond_2

    .line 96
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    aget-byte v6, p0, v4

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v1, v6, 0x10

    .line 97
    .restart local v1    # "chunk":I
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    shr-int/lit8 v7, v1, 0x12

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    if-ge v3, v5, :cond_1

    .line 99
    aget-byte v6, p0, v3

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v1, v6

    .line 100
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    shr-int/lit8 v7, v1, 0xc

    and-int/lit8 v7, v7, 0x3f

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    shr-int/lit8 v7, v1, 0x6

    and-int/lit8 v7, v7, 0x3f

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 106
    :goto_1
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    .end local v1    # "chunk":I
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 103
    .restart local v1    # "chunk":I
    :cond_1
    sget-object v6, Lcom/ning/http/util/Base64;->lookup:[C

    shr-int/lit8 v7, v1, 0xc

    and-int/lit8 v7, v7, 0x3f

    aget-char v6, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .end local v1    # "chunk":I
    .end local v3    # "i":I
    .restart local v4    # "i":I
    :cond_2
    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_2
.end method
