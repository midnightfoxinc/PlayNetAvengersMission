.class public final Lcom/ning/http/util/UTF8UrlDecoder;
.super Ljava/lang/Object;
.source "UTF8UrlDecoder.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static decode(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lcom/ning/http/util/UTF8UrlDecoder;->decode(Ljava/lang/String;II)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;II)Ljava/lang/CharSequence;
    .locals 9
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    const/4 v8, -0x1

    .line 39
    const/4 v3, 0x0

    .line 40
    .local v3, "sb":Ljava/lang/StringBuilder;
    move v2, p1

    .line 41
    .local v2, "i":I
    add-int v1, p2, p1

    .line 43
    .local v1, "end":I
    :goto_0
    if-ge v2, v1, :cond_6

    .line 44
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 45
    .local v0, "c":C
    const/16 v6, 0x2b

    if-ne v0, v6, :cond_0

    .line 46
    invoke-static {v3, p0, v2, p1, p2}, Lcom/ning/http/util/UTF8UrlDecoder;->initSb(Ljava/lang/StringBuilder;Ljava/lang/String;III)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 47
    const/16 v6, 0x20

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 50
    :cond_0
    const/16 v6, 0x25

    if-ne v0, v6, :cond_4

    .line 51
    sub-int v6, v1, v2

    const/4 v7, 0x3

    if-ge v6, v7, :cond_1

    .line 52
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "UTF8UrlDecoder: Incomplete trailing escape (%) pattern"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 55
    :cond_1
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/ning/http/util/UTF8UrlDecoder;->hexaDigit(C)I

    move-result v4

    .local v4, "x":I
    if-eq v4, v8, :cond_2

    add-int/lit8 v6, v2, 0x2

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/ning/http/util/UTF8UrlDecoder;->hexaDigit(C)I

    move-result v5

    .local v5, "y":I
    if-ne v5, v8, :cond_3

    .line 56
    .end local v5    # "y":I
    :cond_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "UTF8UrlDecoder: Malformed"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 58
    .restart local v5    # "y":I
    :cond_3
    invoke-static {v3, p0, v2, p1, p2}, Lcom/ning/http/util/UTF8UrlDecoder;->initSb(Ljava/lang/StringBuilder;Ljava/lang/String;III)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 59
    mul-int/lit8 v6, v4, 0x10

    add-int/2addr v6, v5

    int-to-char v6, v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 60
    add-int/lit8 v2, v2, 0x3

    .line 61
    goto :goto_0

    .line 62
    .end local v4    # "x":I
    .end local v5    # "y":I
    :cond_4
    if-eqz v3, :cond_5

    .line 63
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 68
    .end local v0    # "c":C
    :cond_6
    if-eqz v3, :cond_7

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_1
    return-object v6

    :cond_7
    new-instance v6, Lcom/ning/http/util/StringCharSequence;

    invoke-direct {v6, p0, p1, p2}, Lcom/ning/http/util/StringCharSequence;-><init>(Ljava/lang/String;II)V

    goto :goto_1
.end method

.method private static hexaDigit(C)I
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 30
    const/16 v0, 0x10

    invoke-static {p0, v0}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    return v0
.end method

.method private static initSb(Ljava/lang/StringBuilder;Ljava/lang/String;III)Ljava/lang/StringBuilder;
    .locals 2
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "i"    # I
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 21
    if-eqz p0, :cond_0

    .line 25
    .end local p0    # "sb":Ljava/lang/StringBuilder;
    :goto_0
    return-object p0

    .line 24
    .restart local p0    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    const/16 v1, 0x1f4

    if-le p4, v1, :cond_1

    div-int/lit8 v0, p4, 0x2

    .line 25
    .local v0, "initialSbLength":I
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p1, p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    move-result-object p0

    goto :goto_0

    .end local v0    # "initialSbLength":I
    :cond_1
    move v0, p4

    .line 24
    goto :goto_1
.end method
