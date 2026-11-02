.class Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;
.super Lcom/ning/http/client/HttpResponseStatus;
.source "WebDavCompletionHandlerBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HttpStatusWrapper"
.end annotation


# instance fields
.field private final statusCode:I

.field private final statusText:Ljava/lang/String;

.field final synthetic this$0:Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;

.field private final wrapped:Lcom/ning/http/client/HttpResponseStatus;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;Lcom/ning/http/client/HttpResponseStatus;Ljava/lang/String;I)V
    .locals 2
    .param p2, "wrapper"    # Lcom/ning/http/client/HttpResponseStatus;
    .param p3, "statusText"    # Ljava/lang/String;
    .param p4, "statusCode"    # I

    .prologue
    .line 111
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    iput-object p1, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->this$0:Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase;

    .line 112
    invoke-virtual {p2}, Lcom/ning/http/client/HttpResponseStatus;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    invoke-virtual {p2}, Lcom/ning/http/client/HttpResponseStatus;->getConfig()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/ning/http/client/HttpResponseStatus;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 113
    iput-object p2, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    .line 114
    iput-object p3, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusText:Ljava/lang/String;

    .line 115
    iput p4, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusCode:I

    .line 116
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;)I
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;

    .prologue
    .line 103
    iget v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusCode:I

    return v0
.end method

.method static synthetic access$100(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusText:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getProtocolMajorVersion()I
    .locals 1

    .prologue
    .line 238
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getProtocolMajorVersion()I

    move-result v0

    return v0
.end method

.method public getProtocolMinorVersion()I
    .locals 1

    .prologue
    .line 243
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getProtocolMinorVersion()I

    move-result v0

    return v0
.end method

.method public getProtocolName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 233
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getProtocolName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProtocolText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 248
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getStatusText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 223
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusText:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusCode:I

    goto :goto_0
.end method

.method public getStatusText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 228
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusText:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseStatus;->getStatusText()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->statusText:Ljava/lang/String;

    goto :goto_0
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
    .line 120
    .local p0, "this":Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;, "Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase<TT;>.HttpStatusWrapper;"
    .local p2, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    iget-object v1, p0, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;->wrapped:Lcom/ning/http/client/HttpResponseStatus;

    invoke-virtual {v1, p1, p2}, Lcom/ning/http/client/HttpResponseStatus;->prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;

    move-result-object v0

    .line 122
    .local v0, "wrappedResponse":Lcom/ning/http/client/Response;
    new-instance v1, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;

    invoke-direct {v1, p0, v0}, Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper$1;-><init>(Lcom/ning/http/client/webdav/WebDavCompletionHandlerBase$HttpStatusWrapper;Lcom/ning/http/client/Response;)V

    return-object v1
.end method
