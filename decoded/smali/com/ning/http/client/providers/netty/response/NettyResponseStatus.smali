.class public Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;
.super Lcom/ning/http/client/HttpResponseStatus;
.source "NettyResponseStatus.java"


# instance fields
.field private final response:Lorg/jboss/netty/handler/codec/http/HttpResponse;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V
    .locals 0
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p3, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/HttpResponseStatus;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 36
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;->response:Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 37
    return-void
.end method


# virtual methods
.method public getProtocolMajorVersion()I
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;->response:Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMajorVersion()I

    move-result v0

    return v0
.end method

.method public getProtocolMinorVersion()I
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;->response:Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getMinorVersion()I

    move-result v0

    return v0
.end method

.method public getProtocolName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;->response:Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getProtocolName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProtocolText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;->response:Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;->response:Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v0

    return v0
.end method

.method public getStatusText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;->response:Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/HttpResponseHeaders;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)",
            "Lcom/ning/http/client/Response;"
        }
    .end annotation

    .prologue
    .line 79
    .local p2, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    new-instance v0, Lcom/ning/http/client/providers/netty/response/NettyResponse;

    invoke-direct {v0, p0, p1, p2}, Lcom/ning/http/client/providers/netty/response/NettyResponse;-><init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V

    return-object v0
.end method
