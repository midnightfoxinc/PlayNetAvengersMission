.class public Lcom/ning/http/client/providers/netty/response/NettyResponse;
.super Lcom/ning/http/client/ResponseBase;
.source "NettyResponse.java"


# direct methods
.method public constructor <init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V
    .locals 0
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
    .line 43
    .local p3, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/ning/http/client/ResponseBase;-><init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V

    .line 44
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
    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v0, "cookies":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/cookie/Cookie;>;"
    iget-object v6, p0, Lcom/ning/http/client/providers/netty/response/NettyResponse;->headers:Lcom/ning/http/client/HttpResponseHeaders;

    invoke-virtual {v6}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v6

    invoke-virtual {v6}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 104
    .local v1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "Set-Cookie"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 106
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 107
    .local v4, "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 108
    .local v5, "value":Ljava/lang/String;
    invoke-static {v5}, Lcom/ning/http/client/cookie/CookieDecoder;->decode(Ljava/lang/String;)Lcom/ning/http/client/cookie/Cookie;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 112
    .end local v1    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "value":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method public getResponseBody()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->getResponseBody(Ljava/lang/String;)Ljava/lang/String;

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
    .line 62
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->getResponseBodyAsChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->calculateCharset(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

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
    .line 53
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->getResponseBodyAsChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

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
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->getResponseBodyAsChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/util/ChannelBufferUtils;->channelBuffer2bytes(Lorg/jboss/netty/buffer/ChannelBuffer;)[B

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyAsChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    const/4 v0, 0x0

    .line 72
    .local v0, "b":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/response/NettyResponse;->bodyParts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 80
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/response/NettyResponse;->bodyParts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v1, v3, [Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 81
    .local v1, "channelBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/response/NettyResponse;->bodyParts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 82
    const-class v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/response/NettyResponse;->bodyParts:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 81
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 74
    .end local v1    # "channelBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "i":I
    :pswitch_0
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 87
    :goto_1
    return-object v0

    .line 77
    :pswitch_1
    const-class v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/response/NettyResponse;->bodyParts:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 78
    goto :goto_1

    .line 84
    .restart local v1    # "channelBuffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v2    # "i":I
    :cond_0
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    goto :goto_1

    .line 72
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getResponseBodyAsStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Lorg/jboss/netty/buffer/ChannelBufferInputStream;

    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->getResponseBodyAsChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/buffer/ChannelBufferInputStream;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

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
    .line 92
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;

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
    .line 96
    invoke-virtual {p0, p2}, Lcom/ning/http/client/providers/netty/response/NettyResponse;->getResponseBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "response":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v1, p1, :cond_0

    .end local v0    # "response":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "response":Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
