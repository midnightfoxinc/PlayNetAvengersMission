.class Lcom/ning/http/client/cookie/KeyValuePairsParser;
.super Ljava/lang/Object;
.source "KeyValuePairsParser.java"


# instance fields
.field private domain:Ljava/lang/String;

.field private expires:Ljava/lang/String;

.field private httpOnly:Z

.field private maxAge:I

.field private name:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private rawValue:Ljava/lang/String;

.field private secure:Z

.field private value:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, -0x1

    iput v0, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->maxAge:I

    return-void
.end method

.method private computeExpires()J
    .locals 5

    .prologue
    .line 41
    iget-object v1, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->expires:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 42
    invoke-static {}, Lcom/ning/http/client/cookie/RFC2616DateParser;->get()Lcom/ning/http/client/cookie/RFC2616DateParser;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->expires:Ljava/lang/String;

    new-instance v3, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Lcom/ning/http/client/cookie/RFC2616DateParser;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v0

    .line 43
    .local v0, "expiresDate":Ljava/util/Date;
    if-eqz v0, :cond_0

    .line 44
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 47
    .end local v0    # "expiresDate":Ljava/util/Date;
    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method private isDomain(CCCCCC)Z
    .locals 1
    .param p1, "c0"    # C
    .param p2, "c1"    # C
    .param p3, "c2"    # C
    .param p4, "c3"    # C
    .param p5, "c4"    # C
    .param p6, "c5"    # C

    .prologue
    .line 107
    const/16 v0, 0x44

    if-eq p1, v0, :cond_0

    const/16 v0, 0x64

    if-ne p1, v0, :cond_6

    :cond_0
    const/16 v0, 0x6f

    if-eq p2, v0, :cond_1

    const/16 v0, 0x4f

    if-ne p2, v0, :cond_6

    :cond_1
    const/16 v0, 0x6d

    if-eq p3, v0, :cond_2

    const/16 v0, 0x4d

    if-ne p3, v0, :cond_6

    :cond_2
    const/16 v0, 0x61

    if-eq p4, v0, :cond_3

    const/16 v0, 0x41

    if-ne p4, v0, :cond_6

    :cond_3
    const/16 v0, 0x69

    if-eq p5, v0, :cond_4

    const/16 v0, 0x49

    if-ne p5, v0, :cond_6

    :cond_4
    const/16 v0, 0x6e

    if-eq p6, v0, :cond_5

    const/16 v0, 0x4e

    if-ne p6, v0, :cond_6

    :cond_5
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isExpires(CCCCCCC)Z
    .locals 3
    .param p1, "c0"    # C
    .param p2, "c1"    # C
    .param p3, "c2"    # C
    .param p4, "c3"    # C
    .param p5, "c4"    # C
    .param p6, "c5"    # C
    .param p7, "c6"    # C

    .prologue
    const/16 v2, 0x65

    const/16 v1, 0x45

    .line 140
    if-eq p1, v1, :cond_0

    if-ne p1, v2, :cond_7

    :cond_0
    const/16 v0, 0x78

    if-eq p2, v0, :cond_1

    const/16 v0, 0x58

    if-ne p2, v0, :cond_7

    :cond_1
    const/16 v0, 0x70

    if-eq p3, v0, :cond_2

    const/16 v0, 0x50

    if-ne p3, v0, :cond_7

    :cond_2
    const/16 v0, 0x69

    if-eq p4, v0, :cond_3

    const/16 v0, 0x49

    if-ne p4, v0, :cond_7

    :cond_3
    const/16 v0, 0x72

    if-eq p5, v0, :cond_4

    const/16 v0, 0x52

    if-ne p5, v0, :cond_7

    :cond_4
    if-eq p6, v2, :cond_5

    if-ne p6, v1, :cond_7

    :cond_5
    const/16 v0, 0x73

    if-eq p7, v0, :cond_6

    const/16 v0, 0x53

    if-ne p7, v0, :cond_7

    :cond_6
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isHttpOnly(CCCCCCCC)Z
    .locals 3
    .param p1, "c0"    # C
    .param p2, "c1"    # C
    .param p3, "c2"    # C
    .param p4, "c3"    # C
    .param p5, "c4"    # C
    .param p6, "c5"    # C
    .param p7, "c6"    # C
    .param p8, "c7"    # C

    .prologue
    const/16 v2, 0x74

    const/16 v1, 0x54

    .line 189
    const/16 v0, 0x48

    if-eq p1, v0, :cond_0

    const/16 v0, 0x68

    if-ne p1, v0, :cond_8

    :cond_0
    if-eq p2, v2, :cond_1

    if-ne p2, v1, :cond_8

    :cond_1
    if-eq p3, v2, :cond_2

    if-ne p3, v1, :cond_8

    :cond_2
    const/16 v0, 0x70

    if-eq p4, v0, :cond_3

    const/16 v0, 0x50

    if-ne p4, v0, :cond_8

    :cond_3
    const/16 v0, 0x4f

    if-eq p5, v0, :cond_4

    const/16 v0, 0x6f

    if-ne p5, v0, :cond_8

    :cond_4
    const/16 v0, 0x6e

    if-eq p6, v0, :cond_5

    const/16 v0, 0x4e

    if-ne p6, v0, :cond_8

    :cond_5
    const/16 v0, 0x6c

    if-eq p7, v0, :cond_6

    const/16 v0, 0x4c

    if-ne p7, v0, :cond_8

    :cond_6
    const/16 v0, 0x79

    if-eq p8, v0, :cond_7

    const/16 v0, 0x59

    if-ne p8, v0, :cond_8

    :cond_7
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isMaxAge(CCCCCCC)Z
    .locals 3
    .param p1, "c0"    # C
    .param p2, "c1"    # C
    .param p3, "c2"    # C
    .param p4, "c3"    # C
    .param p5, "c4"    # C
    .param p6, "c5"    # C
    .param p7, "c6"    # C

    .prologue
    const/16 v2, 0x61

    const/16 v1, 0x41

    .line 150
    const/16 v0, 0x4d

    if-eq p1, v0, :cond_0

    const/16 v0, 0x6d

    if-ne p1, v0, :cond_6

    :cond_0
    if-eq p2, v2, :cond_1

    if-ne p2, v1, :cond_6

    :cond_1
    const/16 v0, 0x78

    if-eq p3, v0, :cond_2

    const/16 v0, 0x58

    if-ne p3, v0, :cond_6

    :cond_2
    const/16 v0, 0x2d

    if-ne p4, v0, :cond_6

    if-eq p5, v1, :cond_3

    if-ne p5, v2, :cond_6

    :cond_3
    const/16 v0, 0x67

    if-eq p6, v0, :cond_4

    const/16 v0, 0x47

    if-ne p6, v0, :cond_6

    :cond_4
    const/16 v0, 0x65

    if-eq p7, v0, :cond_5

    const/16 v0, 0x45

    if-ne p7, v0, :cond_6

    :cond_5
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isPath(CCCC)Z
    .locals 1
    .param p1, "c0"    # C
    .param p2, "c1"    # C
    .param p3, "c2"    # C
    .param p4, "c3"    # C

    .prologue
    .line 89
    const/16 v0, 0x50

    if-eq p1, v0, :cond_0

    const/16 v0, 0x70

    if-ne p1, v0, :cond_4

    :cond_0
    const/16 v0, 0x61

    if-eq p2, v0, :cond_1

    const/16 v0, 0x41

    if-ne p2, v0, :cond_4

    :cond_1
    const/16 v0, 0x74

    if-eq p3, v0, :cond_2

    const/16 v0, 0x54

    if-ne p3, v0, :cond_4

    :cond_2
    const/16 v0, 0x68

    if-eq p4, v0, :cond_3

    const/16 v0, 0x48

    if-ne p4, v0, :cond_4

    :cond_3
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isSecure(CCCCCC)Z
    .locals 3
    .param p1, "c0"    # C
    .param p2, "c1"    # C
    .param p3, "c2"    # C
    .param p4, "c3"    # C
    .param p5, "c4"    # C
    .param p6, "c5"    # C

    .prologue
    const/16 v2, 0x65

    const/16 v1, 0x45

    .line 116
    const/16 v0, 0x53

    if-eq p1, v0, :cond_0

    const/16 v0, 0x73

    if-ne p1, v0, :cond_6

    :cond_0
    if-eq p2, v2, :cond_1

    if-ne p2, v1, :cond_6

    :cond_1
    const/16 v0, 0x63

    if-eq p3, v0, :cond_2

    const/16 v0, 0x43

    if-ne p3, v0, :cond_6

    :cond_2
    const/16 v0, 0x75

    if-eq p4, v0, :cond_3

    const/16 v0, 0x55

    if-ne p4, v0, :cond_6

    :cond_3
    const/16 v0, 0x72

    if-eq p5, v0, :cond_4

    const/16 v0, 0x52

    if-ne p5, v0, :cond_6

    :cond_4
    if-eq p6, v2, :cond_5

    if-ne p6, v1, :cond_6

    :cond_5
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private parse4(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "nameStart"    # I
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 98
    .local v0, "c0":C
    add-int/lit8 v4, p2, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 99
    .local v1, "c1":C
    add-int/lit8 v4, p2, 0x2

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 100
    .local v2, "c2":C
    add-int/lit8 v4, p2, 0x3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 102
    .local v3, "c3":C
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->isPath(CCCC)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 103
    iput-object p3, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->path:Ljava/lang/String;

    .line 104
    :cond_0
    return-void
.end method

.method private parse6(Ljava/lang/String;ILjava/lang/String;)V
    .locals 7
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "nameStart"    # I
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 127
    .local v1, "c0":C
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 128
    .local v2, "c1":C
    add-int/lit8 v0, p2, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 129
    .local v3, "c2":C
    add-int/lit8 v0, p2, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 130
    .local v4, "c3":C
    add-int/lit8 v0, p2, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 131
    .local v5, "c4":C
    add-int/lit8 v0, p2, 0x5

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .local v6, "c5":C
    move-object v0, p0

    .line 133
    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->isDomain(CCCCCC)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 134
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p3, 0x0

    .end local p3    # "value":Ljava/lang/String;
    :cond_0
    iput-object p3, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->domain:Ljava/lang/String;

    .line 137
    :cond_1
    :goto_0
    return-void

    .restart local p3    # "value":Ljava/lang/String;
    :cond_2
    move-object v0, p0

    .line 135
    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->isSecure(CCCCCC)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->secure:Z

    goto :goto_0
.end method

.method private parse7(Ljava/lang/String;ILjava/lang/String;)V
    .locals 8
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "nameStart"    # I
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 173
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 174
    .local v1, "c0":C
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 175
    .local v2, "c1":C
    add-int/lit8 v0, p2, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 176
    .local v3, "c2":C
    add-int/lit8 v0, p2, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 177
    .local v4, "c3":C
    add-int/lit8 v0, p2, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 178
    .local v5, "c4":C
    add-int/lit8 v0, p2, 0x5

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 179
    .local v6, "c5":C
    add-int/lit8 v0, p2, 0x6

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .local v7, "c6":C
    move-object v0, p0

    .line 181
    invoke-direct/range {v0 .. v7}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->isExpires(CCCCCCC)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 182
    invoke-direct {p0, p3}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->setExpire(Ljava/lang/String;)V

    .line 186
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v0, p0

    .line 184
    invoke-direct/range {v0 .. v7}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->isMaxAge(CCCCCCC)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    invoke-direct {p0, p3}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->setMaxAge(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parse8(Ljava/lang/String;ILjava/lang/String;)V
    .locals 9
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "nameStart"    # I
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 201
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 202
    .local v1, "c0":C
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 203
    .local v2, "c1":C
    add-int/lit8 v0, p2, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 204
    .local v3, "c2":C
    add-int/lit8 v0, p2, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 205
    .local v4, "c3":C
    add-int/lit8 v0, p2, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 206
    .local v5, "c4":C
    add-int/lit8 v0, p2, 0x5

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 207
    .local v6, "c5":C
    add-int/lit8 v0, p2, 0x6

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 208
    .local v7, "c6":C
    add-int/lit8 v0, p2, 0x7

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .local v8, "c7":C
    move-object v0, p0

    .line 210
    invoke-direct/range {v0 .. v8}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->isHttpOnly(CCCCCCCC)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->httpOnly:Z

    .line 212
    :cond_0
    return-void
.end method

.method private setCookieAttribute(Ljava/lang/String;IILjava/lang/String;)V
    .locals 2
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "keyStart"    # I
    .param p3, "keyEnd"    # I
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 76
    sub-int v0, p3, p2

    .line 78
    .local v0, "length":I
    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 79
    invoke-direct {p0, p1, p2, p4}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->parse4(Ljava/lang/String;ILjava/lang/String;)V

    .line 86
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    const/4 v1, 0x6

    if-ne v0, v1, :cond_2

    .line 81
    invoke-direct {p0, p1, p2, p4}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->parse6(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0

    .line 82
    :cond_2
    const/4 v1, 0x7

    if-ne v0, v1, :cond_3

    .line 83
    invoke-direct {p0, p1, p2, p4}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->parse7(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0

    .line 84
    :cond_3
    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 85
    invoke-direct {p0, p1, p2, p4}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->parse8(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0
.end method

.method private setCookieNameValue(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "keyStart"    # I
    .param p3, "keyEnd"    # I
    .param p4, "value"    # Ljava/lang/String;
    .param p5, "rawValue"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->name:Ljava/lang/String;

    .line 70
    iput-object p4, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->value:Ljava/lang/String;

    .line 71
    iput-object p5, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->rawValue:Ljava/lang/String;

    .line 72
    return-void
.end method

.method private setExpire(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->expires:Ljava/lang/String;

    .line 161
    return-void
.end method

.method private setMaxAge(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 165
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->maxAge:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :goto_0
    return-void

    .line 166
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public cookie()Lcom/ning/http/client/cookie/Cookie;
    .locals 11

    .prologue
    .line 37
    iget-object v0, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/ning/http/client/cookie/Cookie;

    iget-object v1, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->value:Ljava/lang/String;

    iget-object v3, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->rawValue:Ljava/lang/String;

    iget-object v4, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->domain:Ljava/lang/String;

    iget-object v5, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->path:Ljava/lang/String;

    invoke-direct {p0}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->computeExpires()J

    move-result-wide v6

    iget v8, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->maxAge:I

    iget-boolean v9, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->secure:Z

    iget-boolean v10, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->httpOnly:Z

    invoke-direct/range {v0 .. v10}, Lcom/ning/http/client/cookie/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIZZ)V

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public parseKeyValuePair(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "keyStart"    # I
    .param p3, "keyEnd"    # I
    .param p4, "value"    # Ljava/lang/String;
    .param p5, "rawValue"    # Ljava/lang/String;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/ning/http/client/cookie/KeyValuePairsParser;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 63
    invoke-direct/range {p0 .. p5}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->setCookieNameValue(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 66
    :goto_0
    return-void

    .line 65
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ning/http/client/cookie/KeyValuePairsParser;->setCookieAttribute(Ljava/lang/String;IILjava/lang/String;)V

    goto :goto_0
.end method
