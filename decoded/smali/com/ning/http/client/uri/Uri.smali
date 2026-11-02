.class public Lcom/ning/http/client/uri/Uri;
.super Ljava/lang/Object;
.source "Uri.java"


# instance fields
.field private final host:Ljava/lang/String;

.field private final path:Ljava/lang/String;

.field private final port:I

.field private final query:Ljava/lang/String;

.field private final scheme:Ljava/lang/String;

.field private url:Ljava/lang/String;

.field private final userInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "scheme"    # Ljava/lang/String;
    .param p2, "userInfo"    # Ljava/lang/String;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .param p5, "path"    # Ljava/lang/String;
    .param p6, "query"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    if-nez p1, :cond_0

    .line 56
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "scheme"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_0
    if-nez p3, :cond_1

    .line 58
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "host"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_1
    iput-object p1, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    .line 61
    iput-object p2, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    .line 62
    iput-object p3, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    .line 63
    iput p4, p0, Lcom/ning/http/client/uri/Uri;->port:I

    .line 64
    iput-object p5, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    .line 65
    iput-object p6, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public static create(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;
    .locals 8
    .param p0, "context"    # Lcom/ning/http/client/uri/Uri;
    .param p1, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 29
    new-instance v7, Lcom/ning/http/client/uri/UriParser;

    invoke-direct {v7}, Lcom/ning/http/client/uri/UriParser;-><init>()V

    .line 30
    .local v7, "parser":Lcom/ning/http/client/uri/UriParser;
    invoke-virtual {v7, p0, p1}, Lcom/ning/http/client/uri/UriParser;->parse(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)V

    .line 32
    new-instance v0, Lcom/ning/http/client/uri/Uri;

    iget-object v1, v7, Lcom/ning/http/client/uri/UriParser;->scheme:Ljava/lang/String;

    iget-object v2, v7, Lcom/ning/http/client/uri/UriParser;->userInfo:Ljava/lang/String;

    iget-object v3, v7, Lcom/ning/http/client/uri/UriParser;->host:Ljava/lang/String;

    iget v4, v7, Lcom/ning/http/client/uri/UriParser;->port:I

    iget-object v5, v7, Lcom/ning/http/client/uri/UriParser;->path:Ljava/lang/String;

    iget-object v6, v7, Lcom/ning/http/client/uri/UriParser;->query:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/uri/Uri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static create(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;
    .locals 1
    .param p0, "originalUrl"    # Ljava/lang/String;

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/ning/http/client/uri/Uri;->create(Lcom/ning/http/client/uri/Uri;Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 167
    if-ne p0, p1, :cond_1

    .line 201
    :cond_0
    :goto_0
    return v1

    .line 169
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 170
    goto :goto_0

    .line 171
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 172
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 173
    check-cast v0, Lcom/ning/http/client/uri/Uri;

    .line 174
    .local v0, "other":Lcom/ning/http/client/uri/Uri;
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 175
    iget-object v3, v0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 176
    goto :goto_0

    .line 177
    :cond_4
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 178
    goto :goto_0

    .line 179
    :cond_5
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 180
    iget-object v3, v0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    if-eqz v3, :cond_7

    move v1, v2

    .line 181
    goto :goto_0

    .line 182
    :cond_6
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    move v1, v2

    .line 183
    goto :goto_0

    .line 184
    :cond_7
    iget v3, p0, Lcom/ning/http/client/uri/Uri;->port:I

    iget v4, v0, Lcom/ning/http/client/uri/Uri;->port:I

    if-eq v3, v4, :cond_8

    move v1, v2

    .line 185
    goto :goto_0

    .line 186
    :cond_8
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    if-nez v3, :cond_9

    .line 187
    iget-object v3, v0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    if-eqz v3, :cond_a

    move v1, v2

    .line 188
    goto :goto_0

    .line 189
    :cond_9
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    move v1, v2

    .line 190
    goto :goto_0

    .line 191
    :cond_a
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    if-nez v3, :cond_b

    .line 192
    iget-object v3, v0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    if-eqz v3, :cond_c

    move v1, v2

    .line 193
    goto :goto_0

    .line 194
    :cond_b
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    move v1, v2

    .line 195
    goto :goto_0

    .line 196
    :cond_c
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    if-nez v3, :cond_d

    .line 197
    iget-object v3, v0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    .line 198
    goto :goto_0

    .line 199
    :cond_d
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    iget-object v4, v0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 200
    goto/16 :goto_0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lcom/ning/http/client/uri/Uri;->port:I

    return v0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getUserInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 154
    const/16 v0, 0x1f

    .line 155
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 156
    .local v1, "result":I
    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 157
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v3

    :goto_1
    add-int v1, v4, v2

    .line 158
    mul-int/lit8 v2, v1, 0x1f

    iget v4, p0, Lcom/ning/http/client/uri/Uri;->port:I

    add-int v1, v2, v4

    .line 159
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    if-nez v2, :cond_2

    move v2, v3

    :goto_2
    add-int v1, v4, v2

    .line 160
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    if-nez v2, :cond_3

    move v2, v3

    :goto_3
    add-int v1, v4, v2

    .line 161
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    if-nez v4, :cond_4

    :goto_4
    add-int v1, v2, v3

    .line 162
    return v1

    .line 156
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 157
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_1

    .line 159
    :cond_2
    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_2

    .line 160
    :cond_3
    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_3

    .line 161
    :cond_4
    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_4
.end method

.method public toJavaNetURI()Ljava/net/URI;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Ljava/net/URI;

    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public toRelativeUrl()Ljava/lang/String;
    .locals 3

    .prologue
    .line 117
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 118
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 119
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    :goto_0
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 123
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 121
    :cond_1
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUrl()Ljava/lang/String;
    .locals 3

    .prologue
    .line 97
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->url:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 98
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 99
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 101
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    iget v1, p0, Lcom/ning/http/client/uri/Uri;->port:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 104
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/ning/http/client/uri/Uri;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    :cond_1
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 106
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_2
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 108
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ning/http/client/uri/Uri;->url:Ljava/lang/String;

    .line 110
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 113
    .end local v0    # "sb":Ljava/lang/StringBuilder;
    :cond_4
    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->url:Ljava/lang/String;

    return-object v1
.end method

.method public withNewQuery(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;
    .locals 7
    .param p1, "newQuery"    # Ljava/lang/String;

    .prologue
    .line 144
    new-instance v0, Lcom/ning/http/client/uri/Uri;

    iget-object v1, p0, Lcom/ning/http/client/uri/Uri;->scheme:Ljava/lang/String;

    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    iget v4, p0, Lcom/ning/http/client/uri/Uri;->port:I

    iget-object v5, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/uri/Uri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withNewScheme(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;
    .locals 7
    .param p1, "newScheme"    # Ljava/lang/String;

    .prologue
    .line 135
    new-instance v0, Lcom/ning/http/client/uri/Uri;

    iget-object v2, p0, Lcom/ning/http/client/uri/Uri;->userInfo:Ljava/lang/String;

    iget-object v3, p0, Lcom/ning/http/client/uri/Uri;->host:Ljava/lang/String;

    iget v4, p0, Lcom/ning/http/client/uri/Uri;->port:I

    iget-object v5, p0, Lcom/ning/http/client/uri/Uri;->path:Ljava/lang/String;

    iget-object v6, p0, Lcom/ning/http/client/uri/Uri;->query:Ljava/lang/String;

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/uri/Uri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
