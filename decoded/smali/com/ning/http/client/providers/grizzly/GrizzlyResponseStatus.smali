.class public Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;
.super Lcom/ning/http/client/HttpResponseStatus;
.source "GrizzlyResponseStatus.java"


# instance fields
.field private final response:Lorg/glassfish/grizzly/http/HttpResponsePacket;


# direct methods
.method public constructor <init>(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 0
    .param p1, "response"    # Lorg/glassfish/grizzly/http/HttpResponsePacket;
    .param p2, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p3, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 46
    invoke-direct {p0, p2, p3}, Lcom/ning/http/client/HttpResponseStatus;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 47
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    .line 49
    return-void
.end method


# virtual methods
.method public getProtocolMajorVersion()I
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getProtocol()Lorg/glassfish/grizzly/http/Protocol;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/Protocol;->getMajorVersion()I

    move-result v0

    return v0
.end method

.method public getProtocolMinorVersion()I
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getProtocol()Lorg/glassfish/grizzly/http/Protocol;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/Protocol;->getMinorVersion()I

    move-result v0

    return v0
.end method

.method public getProtocolName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    const-string v0, "http"

    return-object v0
.end method

.method public getProtocolText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getProtocolString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getStatus()I

    move-result v0

    return v0
.end method

.method public getStatusText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpResponsePacket;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;
    .locals 2
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
    .line 102
    .local p2, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseStatus;->response:Lorg/glassfish/grizzly/http/HttpResponsePacket;

    invoke-direct {v0, v1, p0, p1, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponse;-><init>(Lorg/glassfish/grizzly/http/HttpResponsePacket;Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V

    return-object v0
.end method
