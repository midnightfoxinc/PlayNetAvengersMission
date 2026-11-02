.class public Lcom/ning/http/client/cookie/Cookie;
.super Ljava/lang/Object;
.source "Cookie.java"


# instance fields
.field private final domain:Ljava/lang/String;

.field private expires:J

.field private final httpOnly:Z

.field private final maxAge:I

.field private final name:Ljava/lang/String;

.field private final path:Ljava/lang/String;

.field private final rawValue:Ljava/lang/String;

.field private final secure:Z

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIZZ)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "rawValue"    # Ljava/lang/String;
    .param p4, "domain"    # Ljava/lang/String;
    .param p5, "path"    # Ljava/lang/String;
    .param p6, "expires"    # J
    .param p8, "maxAge"    # I
    .param p9, "secure"    # Z
    .param p10, "httpOnly"    # Z

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lcom/ning/http/client/cookie/Cookie;->name:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Lcom/ning/http/client/cookie/Cookie;->value:Ljava/lang/String;

    .line 98
    iput-object p3, p0, Lcom/ning/http/client/cookie/Cookie;->rawValue:Ljava/lang/String;

    .line 99
    iput-object p4, p0, Lcom/ning/http/client/cookie/Cookie;->domain:Ljava/lang/String;

    .line 100
    iput-object p5, p0, Lcom/ning/http/client/cookie/Cookie;->path:Ljava/lang/String;

    .line 101
    iput-wide p6, p0, Lcom/ning/http/client/cookie/Cookie;->expires:J

    .line 102
    iput p8, p0, Lcom/ning/http/client/cookie/Cookie;->maxAge:I

    .line 103
    iput-boolean p9, p0, Lcom/ning/http/client/cookie/Cookie;->secure:Z

    .line 104
    iput-boolean p10, p0, Lcom/ning/http/client/cookie/Cookie;->httpOnly:Z

    .line 105
    return-void
.end method

.method public static newValidCookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIZZ)Lcom/ning/http/client/cookie/Cookie;
    .locals 15
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "domain"    # Ljava/lang/String;
    .param p3, "rawValue"    # Ljava/lang/String;
    .param p4, "path"    # Ljava/lang/String;
    .param p5, "expires"    # J
    .param p7, "maxAge"    # I
    .param p8, "secure"    # Z
    .param p9, "httpOnly"    # Z

    .prologue
    .line 19
    if-nez p0, :cond_0

    .line 20
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "name"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 22
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 24
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "empty name"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 27
    :cond_1
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v14, v2, :cond_3

    .line 28
    invoke-virtual {p0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v13

    .line 29
    .local v13, "c":C
    const/16 v2, 0x7f

    if-le v13, v2, :cond_2

    .line 30
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name contains non-ascii character: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 34
    :cond_2
    sparse-switch v13, :sswitch_data_0

    .line 27
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 44
    :sswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name contains one of the following prohibited characters: =,; \\t\\r\\n\\v\\f: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 48
    .end local v13    # "c":C
    :cond_3
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x24

    if-ne v2, v3, :cond_4

    .line 49
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name starting with \'$\' not allowed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 52
    :cond_4
    if-nez p1, :cond_5

    .line 53
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "value"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 56
    :cond_5
    const-string v2, "domain"

    move-object/from16 v0, p2

    invoke-static {v2, v0}, Lcom/ning/http/client/cookie/Cookie;->validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 57
    const-string v2, "path"

    move-object/from16 v0, p4

    invoke-static {v2, v0}, Lcom/ning/http/client/cookie/Cookie;->validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 59
    new-instance v2, Lcom/ning/http/client/cookie/Cookie;

    move-object v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p3

    move-object/from16 v6, p2

    move-object/from16 v7, p4

    move-wide/from16 v8, p5

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    invoke-direct/range {v2 .. v12}, Lcom/ning/http/client/cookie/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIZZ)V

    return-object v2

    .line 34
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
        0x2c -> :sswitch_0
        0x3b -> :sswitch_0
        0x3d -> :sswitch_0
    .end sparse-switch
.end method

.method private static validateValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 63
    if-nez p1, :cond_1

    .line 82
    :cond_0
    :goto_0
    return-object v2

    .line 66
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 71
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 73
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 71
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 79
    :sswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " contains one of the following prohibited characters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ";\\r\\n\\f\\v ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v0    # "c":C
    :cond_2
    move-object v2, p1

    .line 82
    goto :goto_0

    .line 73
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0xb -> :sswitch_0
        0xc -> :sswitch_0
        0xd -> :sswitch_0
        0x3b -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method public getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/ning/http/client/cookie/Cookie;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public getExpires()J
    .locals 2

    .prologue
    .line 128
    iget-wide v0, p0, Lcom/ning/http/client/cookie/Cookie;->expires:J

    return-wide v0
.end method

.method public getMaxAge()I
    .locals 1

    .prologue
    .line 132
    iget v0, p0, Lcom/ning/http/client/cookie/Cookie;->maxAge:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/ning/http/client/cookie/Cookie;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/ning/http/client/cookie/Cookie;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getRawValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/ning/http/client/cookie/Cookie;->rawValue:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/ning/http/client/cookie/Cookie;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isHttpOnly()Z
    .locals 1

    .prologue
    .line 140
    iget-boolean v0, p0, Lcom/ning/http/client/cookie/Cookie;->httpOnly:Z

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .prologue
    .line 136
    iget-boolean v0, p0, Lcom/ning/http/client/cookie/Cookie;->secure:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/ning/http/client/cookie/Cookie;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 148
    iget-object v1, p0, Lcom/ning/http/client/cookie/Cookie;->rawValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    iget-object v1, p0, Lcom/ning/http/client/cookie/Cookie;->domain:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 150
    const-string v1, "; domain="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    iget-object v1, p0, Lcom/ning/http/client/cookie/Cookie;->domain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/cookie/Cookie;->path:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 154
    const-string v1, "; path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    iget-object v1, p0, Lcom/ning/http/client/cookie/Cookie;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    :cond_1
    iget-wide v2, p0, Lcom/ning/http/client/cookie/Cookie;->expires:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-ltz v1, :cond_2

    .line 158
    const-string v1, "; expires="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    iget-wide v2, p0, Lcom/ning/http/client/cookie/Cookie;->expires:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 161
    :cond_2
    iget v1, p0, Lcom/ning/http/client/cookie/Cookie;->maxAge:I

    if-ltz v1, :cond_3

    .line 162
    const-string v1, "; maxAge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    iget v1, p0, Lcom/ning/http/client/cookie/Cookie;->maxAge:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    const/16 v1, 0x73

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 166
    :cond_3
    iget-boolean v1, p0, Lcom/ning/http/client/cookie/Cookie;->secure:Z

    if-eqz v1, :cond_4

    .line 167
    const-string v1, "; secure"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    :cond_4
    iget-boolean v1, p0, Lcom/ning/http/client/cookie/Cookie;->httpOnly:Z

    if-eqz v1, :cond_5

    .line 170
    const-string v1, "; HTTPOnly"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
