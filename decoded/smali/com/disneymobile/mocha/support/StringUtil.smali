.class public abstract Lcom/disneymobile/mocha/support/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/support/StringUtil$1;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    return-void
.end method

.method public static CheckNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 11
    if-nez p0, :cond_0

    .line 12
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "String was NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 14
    :cond_0
    return-object p0
.end method

.method public static UnNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 18
    if-nez p0, :cond_0

    .line 19
    const-string p0, ""

    .line 21
    .end local p0    # "value":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public static UnNullToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(TX;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "value":Ljava/lang/Object;, "TX;"
    if-nez p0, :cond_0

    .line 26
    const-string v0, ""

    .line 28
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static capitalizeFirst(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 33
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 34
    :cond_0
    move-object v0, p0

    .line 41
    .local v0, "capitalizeFirstString":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 37
    .end local v0    # "capitalizeFirstString":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 38
    .local v1, "characters":[C
    aget-char v2, v1, v3

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    aput-char v2, v1, v3

    .line 39
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    .restart local v0    # "capitalizeFirstString":Ljava/lang/String;
    goto :goto_0
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 80
    if-eqz p0, :cond_0

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static padLeft(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "length"    # I
    .param p2, "pad"    # Ljava/lang/String;

    .prologue
    .line 71
    if-nez p0, :cond_1

    .line 72
    const-string v0, "{null}"

    .line 76
    :cond_0
    return-object v0

    .line 73
    :cond_1
    move-object v0, p0

    .line 74
    .local v0, "output":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, p1, :cond_0

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static properCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    new-instance v2, Ljava/io/StringReader;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 46
    .local v2, "in":Ljava/io/StringReader;
    const/4 v3, 0x1

    .line 47
    .local v3, "precededBySpace":Z
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 49
    .local v4, "properCase":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {v2}, Ljava/io/StringReader;->read()I

    move-result v1

    .line 50
    .local v1, "i":I
    const/4 v5, -0x1

    if-ne v1, v5, :cond_0

    .line 65
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 51
    :cond_0
    int-to-char v0, v1

    .line 52
    .local v0, "c":C
    const/16 v5, 0x20

    if-eq v0, v5, :cond_1

    const/16 v5, 0x22

    if-eq v0, v5, :cond_1

    const/16 v5, 0x28

    if-eq v0, v5, :cond_1

    const/16 v5, 0x2e

    if-eq v0, v5, :cond_1

    const/16 v5, 0x2f

    if-eq v0, v5, :cond_1

    const/16 v5, 0x5c

    if-eq v0, v5, :cond_1

    const/16 v5, 0x2c

    if-eq v0, v5, :cond_1

    const/16 v5, 0x27

    if-ne v0, v5, :cond_2

    .line 53
    :cond_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 54
    const/4 v3, 0x1

    goto :goto_0

    .line 56
    :cond_2
    if-eqz v3, :cond_3

    .line 57
    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 61
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 59
    :cond_3
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public static stringEncodingToString(Lcom/disneymobile/mocha/NSStringEncoding;)Ljava/lang/String;
    .locals 2
    .param p0, "encoding"    # Lcom/disneymobile/mocha/NSStringEncoding;

    .prologue
    .line 84
    sget-object v0, Lcom/disneymobile/mocha/support/StringUtil$1;->$SwitchMap$com$disneymobile$mocha$NSStringEncoding:[I

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSStringEncoding;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 88
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 86
    :pswitch_0
    const-string v0, "UTF-8"

    goto :goto_0

    .line 84
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
