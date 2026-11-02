.class final Lcom/ning/http/client/uri/UriParser;
.super Ljava/lang/Object;
.source "UriParser.java"


# instance fields
.field public authority:Ljava/lang/String;

.field private end:I

.field public host:Ljava/lang/String;

.field public path:Ljava/lang/String;

.field public port:I

.field public query:Ljava/lang/String;

.field public scheme:Ljava/lang/String;

.field private start:I

.field private urlWithoutQuery:Ljava/lang/String;

.field public userInfo:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    return-void
.end method

.method private computeAuthority()V
    .locals 4

    .prologue
    .line 142
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    const/16 v2, 0x2f

    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 143
    .local v0, "authorityEndPosition":I
    if-gez v0, :cond_0

    .line 144
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    const/16 v2, 0x3f

    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 145
    if-gez v0, :cond_0

    .line 146
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    .line 148
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    .line 149
    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    .line 150
    return-void
.end method

.method private computeFragment(Ljava/lang/String;)V
    .locals 3
    .param p1, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 103
    const/16 v1, 0x23

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 104
    .local v0, "charpPosition":I
    if-ltz v0, :cond_0

    .line 105
    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    .line 107
    :cond_0
    return-void
.end method

.method private computeIPV6()V
    .locals 5

    .prologue
    .line 168
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    const/16 v3, 0x5d

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 169
    .local v1, "positionAfterClosingSquareBrace":I
    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    .line 171
    const/4 v2, -0x1

    iput v2, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    .line 173
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v1, :cond_0

    .line 174
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3a

    if-ne v2, v3, :cond_1

    .line 176
    add-int/lit8 v0, v1, 0x1

    .line 177
    .local v0, "portPosition":I
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v0, :cond_0

    .line 178
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    .line 184
    .end local v0    # "portPosition":I
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    .line 188
    return-void

    .line 181
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid authority field: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 187
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid authority field: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private computeInitialScheme(Ljava/lang/String;)V
    .locals 4
    .param p1, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 64
    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    .local v1, "i":I
    :goto_0
    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ge v1, v3, :cond_0

    .line 65
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 66
    .local v0, "c":C
    const/16 v3, 0x3a

    if-ne v0, v3, :cond_1

    .line 67
    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "s":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/ning/http/client/uri/UriParser;->isValidProtocol(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 69
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/uri/UriParser;->scheme:Ljava/lang/String;

    .line 70
    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    .line 76
    .end local v0    # "c":C
    .end local v2    # "s":Ljava/lang/String;
    :cond_0
    return-void

    .line 73
    .restart local v0    # "c":C
    :cond_1
    const/16 v3, 0x2f

    if-eq v0, v3, :cond_0

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private computePath(Z)V
    .locals 2
    .param p1, "queryOnly"    # Z

    .prologue
    .line 312
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ge v0, v1, :cond_1

    .line 313
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->computeRegularPath()V

    .line 318
    :cond_0
    :goto_0
    return-void

    .line 314
    :cond_1
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 315
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->computeQueryOnlyPath()V

    goto :goto_0

    .line 316
    :cond_2
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 317
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    goto :goto_0
.end method

.method private computeQueryOnlyPath()V
    .locals 4

    .prologue
    .line 306
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 307
    .local v0, "lastSlashPosition":I
    if-gez v0, :cond_0

    const-string v1, "/"

    :goto_0
    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 308
    return-void

    .line 307
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private computeRegularHostPort()V
    .locals 4

    .prologue
    .line 191
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 192
    .local v0, "colonPosition":I
    const/4 v2, -0x1

    iput v2, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    .line 193
    if-ltz v0, :cond_1

    .line 195
    add-int/lit8 v1, v0, 0x1

    .line 196
    .local v1, "portPosition":I
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v1, :cond_0

    .line 197
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    .line 198
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    .line 200
    .end local v1    # "portPosition":I
    :cond_1
    return-void
.end method

.method private computeRegularPath()V
    .locals 4

    .prologue
    .line 293
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_0

    .line 294
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 303
    :goto_0
    return-void

    .line 296
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    invoke-static {v1}, Lcom/ning/http/client/uri/UriParser;->isNotEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 297
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->handleRelativePath()V

    goto :goto_0

    .line 300
    :cond_1
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 301
    .local v0, "pathEnd":Ljava/lang/String;
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v0    # "pathEnd":Ljava/lang/String;
    :cond_2
    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    goto :goto_0
.end method

.method private computeUserInfo()V
    .locals 3

    .prologue
    .line 153
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 154
    .local v0, "atPosition":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 155
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->userInfo:Ljava/lang/String;

    .line 156
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    .line 159
    :goto_0
    return-void

    .line 158
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->userInfo:Ljava/lang/String;

    goto :goto_0
.end method

.method private currentPositionStartsWith2Slashes()Z
    .locals 5

    .prologue
    .line 138
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    const-string v2, "//"

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    return v0
.end method

.method private currentPositionStartsWith4Slashes()Z
    .locals 5

    .prologue
    .line 134
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    const-string v2, "////"

    const/4 v3, 0x0

    const/4 v4, 0x4

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    return v0
.end method

.method private handlePathDots()V
    .locals 2

    .prologue
    .line 255
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 256
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->removeEmbeddedDot()V

    .line 257
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->removeEmbedded2Dots()V

    .line 258
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->removeTailing2Dots()V

    .line 259
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->removeStartingDot()V

    .line 260
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->removeTrailingDot()V

    .line 262
    :cond_0
    return-void
.end method

.method private handleRelativePath()V
    .locals 0

    .prologue
    .line 288
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->initRelativePath()V

    .line 289
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->handlePathDots()V

    .line 290
    return-void
.end method

.method private inheritContextQuery(Lcom/ning/http/client/uri/Uri;Z)V
    .locals 2
    .param p1, "context"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "isRelative"    # Z

    .prologue
    .line 111
    if-eqz p2, :cond_0

    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ne v0, v1, :cond_0

    .line 112
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->query:Ljava/lang/String;

    .line 114
    :cond_0
    return-void
.end method

.method private initRelativePath()V
    .locals 6

    .prologue
    .line 245
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 246
    .local v0, "lastSlashPosition":I
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    iget v4, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 248
    .local v1, "pathEnd":Ljava/lang/String;
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 249
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "pathEnd":Ljava/lang/String;
    :cond_0
    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 252
    :goto_0
    return-void

    .line 251
    .restart local v1    # "pathEnd":Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/4 v4, 0x0

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    goto :goto_0
.end method

.method private isFragmentOnly(Ljava/lang/String;)Z
    .locals 2
    .param p1, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 44
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x23

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isMaybeIPV6()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 164
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static isNotEmpty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 341
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isValidProtocol(Ljava/lang/String;)Z
    .locals 2
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, p1}, Lcom/ning/http/client/uri/UriParser;->isValidProtocolChars(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isValidProtocolChar(C)Z
    .locals 1
    .param p1, "c"    # C

    .prologue
    .line 48
    invoke-static {p1}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x2e

    if-eq p1, v0, :cond_0

    const/16 v0, 0x2b

    if-eq p1, v0, :cond_0

    const/16 v0, 0x2d

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isValidProtocolChars(Ljava/lang/String;)Z
    .locals 2
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    .line 52
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/uri/UriParser;->isValidProtocolChar(C)Z

    move-result v1

    if-nez v1, :cond_0

    .line 54
    const/4 v1, 0x0

    .line 56
    :goto_1
    return v1

    .line 52
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 56
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private overrideWithContext(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Z
    .locals 4
    .param p1, "context"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 80
    const/4 v1, 0x0

    .line 83
    .local v1, "isRelative":Z
    if-eqz p1, :cond_2

    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->scheme:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->scheme:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 86
    :cond_0
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "contextPath":Ljava/lang/String;
    invoke-static {v0}, Lcom/ning/http/client/uri/UriParser;->isNotEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_1

    .line 88
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->scheme:Ljava/lang/String;

    .line 90
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->scheme:Ljava/lang/String;

    if-nez v2, :cond_2

    .line 91
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->scheme:Ljava/lang/String;

    .line 92
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getUserInfo()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->userInfo:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Lcom/ning/http/client/uri/Uri;->getPort()I

    move-result v2

    iput v2, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    .line 95
    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 96
    const/4 v1, 0x1

    .line 99
    .end local v0    # "contextPath":Ljava/lang/String;
    :cond_2
    return v1
.end method

.method private parseAuthority()V
    .locals 3

    .prologue
    .line 265
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->currentPositionStartsWith4Slashes()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->currentPositionStartsWith2Slashes()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 266
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    .line 268
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->computeAuthority()V

    .line 269
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->computeUserInfo()V

    .line 271
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 272
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->isMaybeIPV6()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 273
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->computeIPV6()V

    .line 278
    :cond_0
    :goto_0
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    const/4 v1, -0x1

    if-ge v0, v1, :cond_2

    .line 279
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid port number :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 275
    :cond_1
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->computeRegularHostPort()V

    goto :goto_0

    .line 282
    :cond_2
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->authority:Ljava/lang/String;

    invoke-static {v0}, Lcom/ning/http/client/uri/UriParser;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 283
    const-string v0, ""

    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 285
    :cond_3
    return-void
.end method

.method private removeEmbedded2Dots()V
    .locals 5

    .prologue
    .line 209
    const/4 v0, 0x0

    .line 210
    .local v0, "i":I
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const-string v2, "/../"

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    if-ltz v0, :cond_2

    .line 211
    if-lez v0, :cond_3

    .line 212
    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/16 v2, 0x2f

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    iput v1, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    .line 213
    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ltz v1, :cond_1

    iget-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const-string v2, "/../"

    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_1

    .line 214
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/4 v3, 0x0

    iget v4, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    add-int/lit8 v3, v0, 0x3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 215
    const/4 v0, 0x0

    goto :goto_0

    .line 216
    :cond_1
    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-nez v1, :cond_0

    .line 222
    :cond_2
    return-void

    .line 220
    :cond_3
    add-int/lit8 v0, v0, 0x3

    goto :goto_0
.end method

.method private removeEmbeddedDot()V
    .locals 3

    .prologue
    .line 204
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const-string v1, "/./"

    const-string v2, "/"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 205
    return-void
.end method

.method private removeStartingDot()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    .line 235
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const-string v1, "./"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v2, :cond_0

    .line 236
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 237
    :cond_0
    return-void
.end method

.method private removeTailing2Dots()V
    .locals 3

    .prologue
    .line 225
    :goto_0
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const-string v1, "/.."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/16 v1, 0x2f

    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    .line 227
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ltz v0, :cond_0

    .line 228
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/4 v1, 0x0

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    goto :goto_0

    .line 232
    :cond_0
    return-void
.end method

.method private removeTrailingDot()V
    .locals 3

    .prologue
    .line 240
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const-string v1, "/."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    .line 242
    :cond_0
    return-void
.end method

.method private splitUrlAndQuery(Ljava/lang/String;)Z
    .locals 5
    .param p1, "originalUrl"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 117
    const/4 v1, 0x0

    .line 118
    .local v1, "queryOnly":Z
    iput-object p1, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    .line 119
    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    iget v4, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ge v3, v4, :cond_1

    .line 120
    const/16 v3, 0x3f

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 121
    .local v0, "askPosition":I
    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    if-ne v0, v3, :cond_2

    const/4 v1, 0x1

    .line 122
    :goto_0
    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ge v0, v3, :cond_1

    .line 123
    add-int/lit8 v3, v0, 0x1

    iget v4, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/ning/http/client/uri/UriParser;->query:Ljava/lang/String;

    .line 124
    iget v3, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-le v3, v0, :cond_0

    .line 125
    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    .line 126
    :cond_0
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/uri/UriParser;->urlWithoutQuery:Ljava/lang/String;

    .line 130
    .end local v0    # "askPosition":I
    :cond_1
    return v1

    .restart local v0    # "askPosition":I
    :cond_2
    move v1, v2

    .line 121
    goto :goto_0
.end method

.method private trimLeft(Ljava/lang/String;)V
    .locals 6
    .param p1, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 36
    :goto_0
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    iget v1, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-gt v0, v1, :cond_0

    .line 37
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    goto :goto_0

    .line 39
    :cond_0
    const/4 v1, 0x1

    iget v2, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    const-string v3, "url:"

    const/4 v4, 0x0

    const/4 v5, 0x4

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 40
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->start:I

    .line 41
    :cond_1
    return-void
.end method

.method private trimRight(Ljava/lang/String;)V
    .locals 2
    .param p1, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    .line 31
    :goto_0
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-gt v0, v1, :cond_0

    .line 32
    iget v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/ning/http/client/uri/UriParser;->end:I

    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method public parse(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 322
    if-nez p2, :cond_0

    .line 323
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "originalUrl"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 325
    :cond_0
    const/4 v0, 0x0

    .line 327
    .local v0, "isRelative":Z
    invoke-direct {p0, p2}, Lcom/ning/http/client/uri/UriParser;->trimRight(Ljava/lang/String;)V

    .line 328
    invoke-direct {p0, p2}, Lcom/ning/http/client/uri/UriParser;->trimLeft(Ljava/lang/String;)V

    .line 329
    invoke-direct {p0, p2}, Lcom/ning/http/client/uri/UriParser;->isFragmentOnly(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 330
    invoke-direct {p0, p2}, Lcom/ning/http/client/uri/UriParser;->computeInitialScheme(Ljava/lang/String;)V

    .line 331
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/uri/UriParser;->overrideWithContext(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Z

    .line 332
    invoke-direct {p0, p2}, Lcom/ning/http/client/uri/UriParser;->computeFragment(Ljava/lang/String;)V

    .line 333
    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/uri/UriParser;->inheritContextQuery(Lcom/ning/http/client/uri/Uri;Z)V

    .line 335
    invoke-direct {p0, p2}, Lcom/ning/http/client/uri/UriParser;->splitUrlAndQuery(Ljava/lang/String;)Z

    move-result v1

    .line 336
    .local v1, "queryOnly":Z
    invoke-direct {p0}, Lcom/ning/http/client/uri/UriParser;->parseAuthority()V

    .line 337
    invoke-direct {p0, v1}, Lcom/ning/http/client/uri/UriParser;->computePath(Z)V

    .line 338
    return-void
.end method
