.class public Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
.super Lcom/ning/http/client/RequestBuilderBase;
.source "AsyncHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/AsyncHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BoundRequestBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/ning/http/client/RequestBuilderBase",
        "<",
        "Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/AsyncHttpClient;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/Request;)V
    .locals 1
    .param p2, "prototype"    # Lcom/ning/http/client/Request;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->this$0:Lcom/ning/http/client/AsyncHttpClient;

    .line 221
    const-class v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    invoke-direct {p0, v0, p2}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Lcom/ning/http/client/Request;)V

    .line 222
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHttpClient$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/AsyncHttpClient;
    .param p2, "x1"    # Lcom/ning/http/client/Request;
    .param p3, "x2"    # Lcom/ning/http/client/AsyncHttpClient$1;

    .prologue
    .line 214
    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;-><init>(Lcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/Request;)V

    return-void
.end method

.method private constructor <init>(Lcom/ning/http/client/AsyncHttpClient;Ljava/lang/String;Z)V
    .locals 1
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "isDisableUrlEncoding"    # Z

    .prologue
    .line 216
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->this$0:Lcom/ning/http/client/AsyncHttpClient;

    .line 217
    const-class v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    invoke-direct {p0, v0, p2, p3}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Ljava/lang/String;Z)V

    .line 218
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/AsyncHttpClient;Ljava/lang/String;ZLcom/ning/http/client/AsyncHttpClient$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/AsyncHttpClient;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Z
    .param p4, "x3"    # Lcom/ning/http/client/AsyncHttpClient$1;

    .prologue
    .line 214
    invoke-direct {p0, p1, p2, p3}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;-><init>(Lcom/ning/http/client/AsyncHttpClient;Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "part"    # Lcom/ning/http/client/multipart/Part;

    .prologue
    .line 238
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/multipart/Part;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "cookie"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 243
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/cookie/Cookie;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 253
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 258
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/ning/http/client/Request;
    .locals 1

    .prologue
    .line 263
    invoke-super {p0}, Lcom/ning/http/client/RequestBuilderBase;->build()Lcom/ning/http/client/Request;

    move-result-object v0

    return-object v0
.end method

.method public execute()Lcom/ning/http/client/ListenableFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/ning/http/client/ListenableFuture",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->this$0:Lcom/ning/http/client/AsyncHttpClient;

    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    new-instance v2, Lcom/ning/http/client/AsyncCompletionHandlerBase;

    invoke-direct {v2}, Lcom/ning/http/client/AsyncCompletionHandlerBase;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/ning/http/client/AsyncHttpClient;->executeRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->this$0:Lcom/ning/http/client/AsyncHttpClient;

    invoke-virtual {p0}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/ning/http/client/AsyncHttpClient;->executeRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setBody(Ljava/io/InputStream;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 273
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setBody(Ljava/io/InputStream;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public setBody(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 278
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setBody(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public setBody([B)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 268
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setBody([B)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setBody(Ljava/io/InputStream;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/io/InputStream;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setBody(Ljava/io/InputStream;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setBody(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setBody(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setBody([B)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # [B

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setBody([B)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setFormParams(Ljava/util/List;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 303
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public setFormParams(Ljava/util/Map;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
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
            "Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 298
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setFormParams(Ljava/util/List;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setFormParams(Ljava/util/Map;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 283
    invoke-super {p0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 288
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public setHeaders(Ljava/util/Map;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
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
            "Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;"
        }
    .end annotation

    .prologue
    .line 293
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/util/Map;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setHeaders(Ljava/util/Map;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "signatureCalculator"    # Lcom/ning/http/client/SignatureCalculator;

    .prologue
    .line 317
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/SignatureCalculator;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "virtualHost"    # Ljava/lang/String;

    .prologue
    .line 313
    invoke-super {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    return-object v0
.end method

.method public bridge synthetic setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method
