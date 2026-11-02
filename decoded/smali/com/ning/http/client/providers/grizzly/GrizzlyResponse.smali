.class public Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;
.super Lcom/ning/http/client/ResponseBase;
.source "GrizzlyResponse.java"


# instance fields
.field private final httpResponsePacket:Lorg/glassfish/grizzly/http/HttpResponsePacket;

.field private final responseBody:Lorg/glassfish/grizzly/Buffer;


# direct methods
.method public constructor <init>(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V
    .locals 8
    .param p1, "httpResponsePacket"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;
    .param p2, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .param p3, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/glassfish/grizzly/http/HttpResponsePacket;",
            "Lcom/ning/http/client/HttpResponseStatus;",
            "Lcom/ning/http/client/HttpResponseHeaders;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    const/4 v7, 0x0

    .line 61
    invoke-direct {p0, p2, p3, p4}, Lcom/ning/http/client/ResponseBase;-><init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V

    .line 63
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->httpResponsePacket:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 65
    invoke-static {p4}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 66
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 67
    invoke-interface {p4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;

    invoke-virtual {v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->getBodyBuffer()Lorg/glassfish/grizzly/Buffer;

    move-result-object v5

    iput-object v5, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    .line 84
    :goto_0
    return-void

    .line 69
    :cond_0
    invoke-interface {p4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;

    invoke-virtual {v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->getBodyBuffer()Lorg/glassfish/grizzly/Buffer;

    move-result-object v1

    .line 70
    .local v1, "firstBuffer":Lorg/glassfish/grizzly/Buffer;
    invoke-virtual {p1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getRequest()Lorg/glassfish/grizzly/http/HttpRequestPacket;

    move-result-object v5

    invoke-virtual {v5}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v5

    invoke-interface {v5}, Lorg/glassfish/grizzly/Connection;->getMemoryManager()Lorg/glassfish/grizzly/memory/MemoryManager;

    move-result-object v4

    .line 71
    .local v4, "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    move-object v0, v1

    .line 72
    .local v0, "constructedBodyBuffer":Lorg/glassfish/grizzly/Buffer;
    const/4 v2, 0x1

    .local v2, "i":I
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "len":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 73
    invoke-interface {p4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;

    invoke-virtual {v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->getBodyBuffer()Lorg/glassfish/grizzly/Buffer;

    move-result-object v5

    invoke-static {v4, v0, v5}, Lorg/glassfish/grizzly/memory/Buffers;->appendBuffers(Lorg/glassfish/grizzly/memory/MemoryManager;Lorg/glassfish/grizzly/Buffer;Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/Buffer;

    move-result-object v0

    .line 72
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 78
    :cond_1
    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    goto :goto_0

    .line 81
    .end local v0    # "constructedBodyBuffer":Lorg/glassfish/grizzly/Buffer;
    .end local v1    # "firstBuffer":Lorg/glassfish/grizzly/Buffer;
    .end local v2    # "i":I
    .end local v3    # "len":I
    .end local v4    # "mm":Lorg/glassfish/grizzly/memory/MemoryManager;
    :cond_2
    sget-object v5, Lorg/glassfish/grizzly/memory/Buffers;->EMPTY_BUFFER:Lorg/glassfish/grizzly/Buffer;

    iput-object v5, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    goto :goto_0
.end method

.method private convertCookies(Lorg/glassfish/grizzly/http/Cookies;)Ljava/util/List;
    .locals 19
    .param p1, "cookies"    # Lorg/glassfish/grizzly/http/Cookies;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/glassfish/grizzly/http/Cookies;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual/range {p1 .. p1}, Lorg/glassfish/grizzly/http/Cookies;->get()[Lorg/glassfish/grizzly/http/Cookie;

    move-result-object v16

    .line 169
    .local v16, "grizzlyCookies":[Lorg/glassfish/grizzly/http/Cookie;
    new-instance v14, Ljava/util/ArrayList;

    move-object/from16 v0, v16

    array-length v2, v0

    invoke-direct {v14, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 170
    .local v14, "convertedCookies":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/cookie/Cookie;>;"
    move-object/from16 v13, v16

    .local v13, "arr$":[Lorg/glassfish/grizzly/http/Cookie;
    array-length v0, v13

    move/from16 v18, v0

    .local v18, "len$":I
    const/16 v17, 0x0

    .local v17, "i$":I
    :goto_0
    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_0

    aget-object v15, v13, v17

    .line 171
    .local v15, "gCookie":Lorg/glassfish/grizzly/http/Cookie;
    new-instance v2, Lcom/ning/http/client/cookie/Cookie;

    invoke-virtual {v15}, Lorg/glassfish/grizzly/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15}, Lorg/glassfish/grizzly/http/Cookie;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15}, Lorg/glassfish/grizzly/http/Cookie;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v15}, Lorg/glassfish/grizzly/http/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v15}, Lorg/glassfish/grizzly/http/Cookie;->getPath()Ljava/lang/String;

    move-result-object v7

    const-wide/16 v8, -0x1

    invoke-virtual {v15}, Lorg/glassfish/grizzly/http/Cookie;->getMaxAge()I

    move-result v10

    invoke-virtual {v15}, Lorg/glassfish/grizzly/http/Cookie;->isSecure()Z

    move-result v11

    const/4 v12, 0x0

    invoke-direct/range {v2 .. v12}, Lcom/ning/http/client/cookie/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIZZ)V

    invoke-interface {v14, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 181
    .end local v15    # "gCookie":Lorg/glassfish/grizzly/http/Cookie;
    :cond_0
    invoke-static {v14}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method private getCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;
    .locals 2
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 188
    move-object v0, p1

    .line 190
    .local v0, "charsetLocal":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 191
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->httpResponsePacket:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getCharacterEncoding()Ljava/lang/String;

    move-result-object v0

    .line 194
    :cond_0
    if-nez v0, :cond_1

    sget-object v1, Lorg/glassfish/grizzly/utils/Charsets;->ASCII_CHARSET:Ljava/nio/charset/Charset;

    :goto_0
    return-object v1

    :cond_1
    invoke-static {v0}, Lorg/glassfish/grizzly/utils/Charsets;->lookupCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method protected buildCookies()Ljava/util/List;
    .locals 6
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
    .line 149
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    invoke-virtual {v4}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v4

    const-string v5, "set-cookie"

    invoke-virtual {v4, v5}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 150
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v3}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 151
    new-instance v0, Lorg/glassfish/grizzly/http/CookiesBuilder$ServerCookiesBuilder;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-direct {v0, v4, v5}, Lorg/glassfish/grizzly/http/CookiesBuilder$ServerCookiesBuilder;-><init>(ZZ)V

    .line 153
    .local v0, "builder":Lorg/glassfish/grizzly/http/CookiesBuilder$ServerCookiesBuilder;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 154
    .local v1, "header":Ljava/lang/String;
    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/http/CookiesBuilder$ServerCookiesBuilder;->parse(Ljava/lang/String;)Lorg/glassfish/grizzly/http/CookiesBuilder$ServerCookiesBuilder;

    goto :goto_0

    .line 156
    .end local v1    # "header":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/CookiesBuilder$ServerCookiesBuilder;->build()Lorg/glassfish/grizzly/http/Cookies;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->convertCookies(Lorg/glassfish/grizzly/http/Cookies;)Ljava/util/List;

    move-result-object v4

    .line 159
    .end local v0    # "builder":Lorg/glassfish/grizzly/http/CookiesBuilder$ServerCookiesBuilder;
    .end local v2    # "i$":Ljava/util/Iterator;
    :goto_1
    return-object v4

    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    goto :goto_1
.end method

.method public getResponseBody()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->getResponseBody(Ljava/lang/String;)Ljava/lang/String;

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
    .line 111
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->getCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/Buffer;->toStringContent(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

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
    .line 144
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-interface {v0}, Lorg/glassfish/grizzly/Buffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyAsBytes()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-interface {v2}, Lorg/glassfish/grizzly/Buffer;->remaining()I

    move-result v2

    new-array v1, v2, [B

    .line 136
    .local v1, "responseBodyBytes":[B
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-interface {v2}, Lorg/glassfish/grizzly/Buffer;->position()I

    move-result v0

    .line 137
    .local v0, "origPos":I
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-interface {v2, v1}, Lorg/glassfish/grizzly/Buffer;->get([B)Lorg/glassfish/grizzly/Buffer;

    .line 138
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-interface {v2, v0}, Lorg/glassfish/grizzly/Buffer;->position(I)Lorg/glassfish/grizzly/Buffer;

    .line 139
    return-object v1
.end method

.method public getResponseBodyAsStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Lorg/glassfish/grizzly/utils/BufferInputStream;

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-direct {v0, v1}, Lorg/glassfish/grizzly/utils/BufferInputStream;-><init>(Lorg/glassfish/grizzly/Buffer;)V

    return-object v0
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
    .line 120
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "maxLength"    # I
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-interface {v2}, Lorg/glassfish/grizzly/Buffer;->remaining()I

    move-result v2

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 102
    .local v0, "len":I
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-interface {v2}, Lorg/glassfish/grizzly/Buffer;->position()I

    move-result v1

    .line 103
    .local v1, "pos":I
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->responseBody:Lorg/glassfish/grizzly/Buffer;

    invoke-direct {p0, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;->getCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    add-int v4, v0, v1

    invoke-interface {v2, v3, v1, v4}, Lorg/glassfish/grizzly/Buffer;->toStringContent(Ljava/nio/charset/Charset;II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
