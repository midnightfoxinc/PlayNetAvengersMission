.class Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;
.super Ljava/lang/Object;
.source "WebDavCompletionHandlerBase.java"

# interfaces
.implements Lcom/ning/http/client/Response;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;

.field final synthetic val$wrappedResponse:Lcom/ning/http/client/Response;


# direct methods
.method constructor <init>(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;Lcom/ning/http/client/Response;)V
    .locals 0

    .prologue
    .line 122
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iput-object p1, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->this$1:Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;

    iput-object p2, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 201
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getCookies()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 181
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0, p1}, Lcom/ning/http/client/Response;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1

    .prologue
    .line 191
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 186
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 166
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 156
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 141
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 136
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 146
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 161
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

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
    .line 151
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0, p1, p2}, Lcom/ning/http/client/Response;->getResponseBodyExcerpt(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 126
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->this$1:Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;

    invoke-static {v0}, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->access$000(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;)I

    move-result v0

    return v0
.end method

.method public getStatusText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->this$1:Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;

    invoke-static {v0}, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->access$100(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 171
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    return-object v0
.end method

.method public hasResponseBody()Z
    .locals 1

    .prologue
    .line 216
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->hasResponseBody()Z

    move-result v0

    return v0
.end method

.method public hasResponseHeaders()Z
    .locals 1

    .prologue
    .line 211
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->hasResponseHeaders()Z

    move-result v0

    return v0
.end method

.method public hasResponseStatus()Z
    .locals 1

    .prologue
    .line 206
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->hasResponseStatus()Z

    move-result v0

    return v0
.end method

.method public isRedirected()Z
    .locals 1

    .prologue
    .line 196
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper.1;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;->val$wrappedResponse:Lcom/ning/http/client/Response;

    invoke-interface {v0}, Lcom/ning/http/client/Response;->isRedirected()Z

    move-result v0

    return v0
.end method
