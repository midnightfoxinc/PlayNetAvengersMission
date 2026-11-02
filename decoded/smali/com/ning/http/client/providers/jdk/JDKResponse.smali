.class public Lcom/ning/http/client/providers/jdk/JDKResponse;
.super Lcom/ning/http/client/ResponseBase;
.source "JDKResponse.java"


# instance fields
.field private content:Ljava/lang/String;

.field private contentComputed:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V
    .locals 2
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .param p2, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/HttpResponseStatus;",
            "Lcom/ning/http/client/HttpResponseHeaders;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p3, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/ning/http/client/ResponseBase;-><init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V

    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->contentComputed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 39
    return-void
.end method


# virtual methods
.method protected buildCookies()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .local v3, "localCookies":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/cookie/Cookie;>;"
    iget-object v6, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    invoke-virtual {v6}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v6

    invoke-virtual {v6}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 93
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "Set-Cookie"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 95
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 96
    .local v4, "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 97
    .local v5, "value":Ljava/lang/String;
    invoke-static {v5}, Lcom/ning/http/client/cookie/CookieDecoder;->decode(Ljava/lang/String;)Lcom/ning/http/client/cookie/Cookie;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 101
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "value":Ljava/lang/String;
    :cond_1
    return-object v3
.end method

.method public getResponseBody()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/providers/jdk/JDKResponse;->getResponseBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponseBody(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->contentComputed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->bodyParts:Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/jdk/JDKResponse;->calculateCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->contentToString(Ljava/util/List;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->content:Ljava/lang/String;

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseBodyAsByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/ning/http/client/providers/jdk/JDKResponse;->getResponseBodyAsBytes()[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyAsBytes()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->bodyParts:Ljava/util/List;

    invoke-static {v0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->contentToByte(Ljava/util/List;)[B

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyAsStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->contentComputed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->content:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/ning/http/client/providers/jdk/JDKResponse;->calculateCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 71
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->bodyParts:Ljava/util/List;

    invoke-static {v0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->contentToInputStream(Ljava/util/List;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0
.end method

.method public getResponseBodyExcerpt(I)Ljava/lang/String;
    .locals 1
    .param p1, "maxLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/ning/http/client/providers/jdk/JDKResponse;->getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "maxLength"    # I
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->contentComputed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->bodyParts:Ljava/util/List;

    invoke-virtual {p0, p2}, Lcom/ning/http/client/providers/jdk/JDKResponse;->calculateCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->contentToString(Ljava/util/List;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->content:Ljava/lang/String;

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->content:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, p1, :cond_1

    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->content:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKResponse;->content:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
