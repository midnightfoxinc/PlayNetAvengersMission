.class public Lcom/ning/http/client/webdav/WebDavResponse;
.super Ljava/lang/Object;
.source "WebDavResponse.java"

# interfaces
.implements Lcom/ning/http/client/Response;


# instance fields
.field private final document:Lorg/w3c/dom/Document;

.field private final response:Lcom/ning/http/client/Response;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/Response;Lorg/w3c/dom/Document;)V
    .locals 0
    .param p1, "response"    # Lcom/ning/http/client/Response;
    .param p2, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    .line 37
    iput-object p2, p0, Lcom/ning/http/client/webdav/WebDavResponse;->document:Lorg/w3c/dom/Document;

    .line 38
    return-void
.end method


# virtual methods
.method public getBodyAsXML()Lorg/w3c/dom/Document;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->document:Lorg/w3c/dom/Document;

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getContentType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCookies()Ljava/util/List;
    .locals 1
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
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getCookies()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0, p1}, Lcom/ning/http/client/Response;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0, p1}, Lcom/ning/http/client/Response;->getHeaders(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

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
    .line 70
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getResponseBody()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponseBody(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0, p1}, Lcom/ning/http/client/Response;->getResponseBody(Ljava/lang/String;)Ljava/lang/String;

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
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getResponseBodyAsByteBuffer()Ljava/nio/ByteBuffer;

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
    .line 50
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getResponseBodyAsBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyAsStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getResponseBodyAsStream()Ljava/io/InputStream;

    move-result-object v0

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
    .line 62
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0, p1}, Lcom/ning/http/client/Response;->getResponseBodyExcerpt(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "maxLength"    # I
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0, p1, p2}, Lcom/ning/http/client/Response;->getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getStatusCode()I

    move-result v0

    return v0
.end method

.method public getStatusText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getStatusText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    return-object v0
.end method

.method public hasResponseBody()Z
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->hasResponseBody()Z

    move-result v0

    return v0
.end method

.method public hasResponseHeaders()Z
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->hasResponseHeaders()Z

    move-result v0

    return v0
.end method

.method public hasResponseStatus()Z
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->hasResponseStatus()Z

    move-result v0

    return v0
.end method

.method public isRedirected()Z
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavResponse;->response:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->isRedirected()Z

    move-result v0

    return v0
.end method
