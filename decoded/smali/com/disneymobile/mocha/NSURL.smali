.class public Lcom/disneymobile/mocha/NSURL;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSURL.java"


# instance fields
.field private final uri:Landroid/net/Uri;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 138
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    .line 139
    return-void
.end method

.method public static URLWithString(Ljava/lang/String;)Lcom/disneymobile/mocha/NSURL;
    .locals 1
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 14
    new-instance v0, Lcom/disneymobile/mocha/NSURL;

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSURL;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static URLWithURI(Ljava/net/URI;)Lcom/disneymobile/mocha/NSURL;
    .locals 2
    .param p0, "url"    # Ljava/net/URI;

    .prologue
    .line 18
    new-instance v0, Lcom/disneymobile/mocha/NSURL;

    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSURL;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static fileURLWithPath(Ljava/lang/String;)Lcom/disneymobile/mocha/NSURL;
    .locals 1
    .param p0, "localFilePath"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-static {p0}, Lcom/disneymobile/mocha/NSURL;->URLWithString(Ljava/lang/String;)Lcom/disneymobile/mocha/NSURL;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public absoluteString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public description()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public fragment()Ljava/lang/String;
    .locals 2

    .prologue
    .line 51
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getEncodedFragment()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "fragment":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "fragment":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "fragment":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public fullURL()Ljava/lang/String;
    .locals 7

    .prologue
    .line 84
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v4, "resourceSpecifier":Ljava/lang/StringBuilder;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->scheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->host()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->port()Ljava/lang/Integer;

    move-result-object v2

    .line 93
    .local v2, "port":Ljava/lang/Integer;
    if-eqz v2, :cond_0

    .line 94
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    :cond_0
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->path()Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "path":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 98
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    const/16 v6, 0x2f

    if-eq v5, v6, :cond_1

    .line 100
    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    :cond_1
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->query()Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, "query":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 105
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "?"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_2
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->fragment()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "fragment":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 109
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public fullURLMinusFragment()Ljava/lang/String;
    .locals 6

    .prologue
    .line 116
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->fullURL()Ljava/lang/String;

    move-result-object v2

    .line 119
    .local v2, "updatedPrefixFullURL":Ljava/lang/String;
    move-object v1, v2

    .line 120
    .local v1, "fullURLMinusFragment":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURL;->fragment()Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "fragment":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 122
    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 125
    :cond_0
    return-object v1
.end method

.method public host()Ljava/lang/String;
    .locals 2

    .prologue
    .line 56
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "host":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "host":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "host":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public path()Ljava/lang/String;
    .locals 2

    .prologue
    .line 71
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "path":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "path":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public port()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 66
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPort()I

    move-result v0

    .line 67
    .local v0, "port":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public query()Ljava/lang/String;
    .locals 2

    .prologue
    .line 76
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, "query":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "query":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "query":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public resourceSpecifier()Ljava/lang/String;
    .locals 3

    .prologue
    .line 129
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getEncodedSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "resourceSpecifier":Ljava/lang/String;
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 131
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    :cond_0
    if-eqz v0, :cond_1

    .end local v0    # "resourceSpecifier":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "resourceSpecifier":Ljava/lang/String;
    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public scheme()Ljava/lang/String;
    .locals 2

    .prologue
    .line 61
    iget-object v1, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "scheme":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "scheme":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "scheme":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toURL()Ljava/net/URL;
    .locals 3

    .prologue
    .line 27
    :try_start_0
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-object v1

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/net/MalformedURLException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public toUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURL;->uri:Landroid/net/Uri;

    return-object v0
.end method
