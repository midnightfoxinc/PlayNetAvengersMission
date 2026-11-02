.class public Lcom/ning/http/client/RequestBuilder;
.super Lcom/ning/http/client/RequestBuilderBase;
.source "RequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/ning/http/client/RequestBuilderBase",
        "<",
        "Lcom/ning/http/client/RequestBuilder;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 35
    const-class v0, Lcom/ning/http/client/RequestBuilder;

    const-string v1, "GET"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Ljava/lang/String;Z)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/Request;)V
    .locals 1
    .param p1, "prototype"    # Lcom/ning/http/client/Request;

    .prologue
    .line 51
    const-class v0, Lcom/ning/http/client/RequestBuilder;

    invoke-direct {p0, v0, p1}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Lcom/ning/http/client/Request;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/Request;Lcom/ning/http/util/QueryComputer;)V
    .locals 1
    .param p1, "prototype"    # Lcom/ning/http/client/Request;
    .param p2, "queryComputer"    # Lcom/ning/http/util/QueryComputer;

    .prologue
    .line 55
    const-class v0, Lcom/ning/http/client/RequestBuilder;

    invoke-direct {p0, v0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Lcom/ning/http/client/Request;Lcom/ning/http/util/QueryComputer;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 39
    const-class v0, Lcom/ning/http/client/RequestBuilder;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Ljava/lang/String;Z)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ning/http/util/QueryComputer;)V
    .locals 1
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "queryComputer"    # Lcom/ning/http/util/QueryComputer;

    .prologue
    .line 47
    const-class v0, Lcom/ning/http/client/RequestBuilder;

    invoke-direct {p0, v0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Ljava/lang/String;Lcom/ning/http/util/QueryComputer;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "disableUrlEncoding"    # Z

    .prologue
    .line 43
    const-class v0, Lcom/ning/http/client/RequestBuilder;

    invoke-direct {p0, v0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Ljava/lang/String;Z)V

    .line 44
    return-void
.end method


# virtual methods
.method public addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "part"    # Lcom/ning/http/client/multipart/Part;

    .prologue
    .line 64
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/multipart/Part;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "cookie"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 69
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addOrReplaceCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "c"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 185
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->addOrReplaceCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addOrReplaceCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->addOrReplaceCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Lcom/ning/http/client/RequestBuilder;"
        }
    .end annotation

    .prologue
    .line 89
    .local p1, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->addQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->addQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/ning/http/client/Request;
    .locals 1

    .prologue
    .line 104
    invoke-super {p0}, Lcom/ning/http/client/RequestBuilderBase;->build()Lcom/ning/http/client/Request;

    move-result-object v0

    return-object v0
.end method

.method public setBody(Ljava/io/InputStream;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 125
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setBody(Ljava/io/InputStream;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public setBody(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 130
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setBody(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public setBody([B)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 109
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setBody([B)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setBody(Ljava/io/InputStream;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/io/InputStream;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Ljava/io/InputStream;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setBody(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setBody([B)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # [B

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody([B)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setFollowRedirects(Z)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "followRedirects"    # Z

    .prologue
    .line 180
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setFollowRedirects(Z)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setFollowRedirects(Z)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Z

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setFollowRedirects(Z)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Lcom/ning/http/client/RequestBuilder;"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/RequestBuilder;"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 135
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/RequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 140
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/RequestBuilder;"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 160
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "proxyServer"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 170
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Lcom/ning/http/client/RequestBuilder;"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public setQueryParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/RequestBuilder;"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setQueryParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setQueryParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setQueryParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 165
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "virtualHost"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/RequestBuilder;->setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    return-object v0
.end method
