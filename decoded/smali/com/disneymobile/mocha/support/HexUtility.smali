.class public Lcom/disneymobile/mocha/support/HexUtility;
.super Ljava/lang/Object;
.source "HexUtility.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hexDump([BI)Ljava/lang/String;
    .locals 10
    .param p0, "buffer"    # [B
    .param p1, "width"    # I

    .prologue
    .line 10
    const/4 v4, 0x0

    .line 11
    .local v4, "position":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .local v6, "result":Ljava/lang/StringBuilder;
    :goto_0
    array-length v7, p0

    if-ge v4, v7, :cond_3

    .line 14
    move v3, v4

    .line 17
    .local v3, "lineStartPosition":I
    const/4 v2, 0x0

    .local v2, "j":I
    move v5, v4

    .end local v4    # "position":I
    .local v5, "position":I
    :goto_1
    if-ge v2, p1, :cond_0

    array-length v7, p0

    if-ge v5, v7, :cond_0

    .line 19
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "position":I
    .restart local v4    # "position":I
    aget-byte v0, p0, v5

    .line 20
    .local v0, "bte":B
    invoke-static {v6, v0}, Lcom/disneymobile/mocha/support/HexUtility;->toHexString(Ljava/lang/StringBuilder;B)V

    .line 21
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    add-int/lit8 v2, v2, 0x1

    move v5, v4

    .end local v4    # "position":I
    .restart local v5    # "position":I
    goto :goto_1

    .line 23
    .end local v0    # "bte":B
    :cond_0
    const-string v7, "  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    const-string v7, ""

    sub-int v8, p1, v2

    mul-int/lit8 v8, v8, 0x3

    const-string v9, " "

    invoke-static {v7, v8, v9}, Lcom/disneymobile/mocha/support/StringUtil;->padLeft(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    move v4, v3

    .line 28
    .end local v5    # "position":I
    .restart local v4    # "position":I
    const/4 v2, 0x0

    move v5, v4

    .end local v4    # "position":I
    .restart local v5    # "position":I
    :goto_2
    if-ge v2, p1, :cond_2

    array-length v7, p0

    if-ge v5, v7, :cond_2

    .line 30
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "position":I
    .restart local v4    # "position":I
    aget-byte v0, p0, v5

    .line 31
    .restart local v0    # "bte":B
    const/16 v7, 0x20

    if-lt v0, v7, :cond_1

    const/16 v7, 0x7e

    if-gt v0, v7, :cond_1

    .line 33
    :try_start_0
    new-instance v7, Ljava/lang/String;

    const/4 v8, 0x1

    new-array v8, v8, [B

    const/4 v9, 0x0

    aput-byte v0, v8, v9

    const-string v9, "ASCII"

    invoke-direct {v7, v8, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    :goto_3
    add-int/lit8 v2, v2, 0x1

    move v5, v4

    .end local v4    # "position":I
    .restart local v5    # "position":I
    goto :goto_2

    .line 34
    .end local v5    # "position":I
    .restart local v4    # "position":I
    :catch_0
    move-exception v1

    .line 35
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 39
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_1
    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 42
    .end local v0    # "bte":B
    .end local v4    # "position":I
    .restart local v5    # "position":I
    :cond_2
    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v4, v5

    .line 43
    .end local v5    # "position":I
    .restart local v4    # "position":I
    goto :goto_0

    .line 45
    .end local v2    # "j":I
    .end local v3    # "lineStartPosition":I
    :cond_3
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public static toHexString([B)Ljava/lang/String;
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 49
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/disneymobile/mocha/support/HexUtility;->toHexString([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toHexString([BII)Ljava/lang/String;
    .locals 3
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .local v1, "result":Ljava/lang/StringBuilder;
    move v0, p1

    .local v0, "i":I
    :goto_0
    add-int v2, p1, p2

    if-ge v0, v2, :cond_0

    .line 55
    aget-byte v2, p0, v0

    invoke-static {v1, v2}, Lcom/disneymobile/mocha/support/HexUtility;->toHexString(Ljava/lang/StringBuilder;B)V

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static toHexString(Ljava/lang/StringBuilder;B)V
    .locals 1
    .param p0, "result"    # Ljava/lang/StringBuilder;
    .param p1, "b"    # B

    .prologue
    .line 61
    and-int/lit16 v0, p1, 0xf0

    ushr-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    and-int/lit8 v0, p1, 0xf

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    return-void
.end method
