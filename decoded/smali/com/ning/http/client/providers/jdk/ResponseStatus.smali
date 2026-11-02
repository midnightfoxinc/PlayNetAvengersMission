.class public Lcom/ning/http/client/providers/jdk/ResponseStatus;
.super Lcom/ning/http/client/HttpResponseStatus;
.source "ResponseStatus.java"


# instance fields
.field private final urlConnection:Ljava/net/HttpURLConnection;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;Ljava/net/HttpURLConnection;)V
    .locals 0
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p3, "urlConnection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/ning/http/client/HttpResponseStatus;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 35
    iput-object p3, p0, Lcom/ning/http/client/providers/jdk/ResponseStatus;->urlConnection:Ljava/net/HttpURLConnection;

    .line 36
    return-void
.end method


# virtual methods
.method public getProtocolMajorVersion()I
    .locals 1

    .prologue
    .line 71
    const/4 v0, 0x1

    return v0
.end method

.method public getProtocolMinorVersion()I
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x1

    return v0
.end method

.method public getProtocolName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    const-string v0, "http"

    return-object v0
.end method

.method public getProtocolText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    const-string v0, ""

    return-object v0
.end method

.method public getStatusCode()I
    .locals 2

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/ResponseStatus;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 47
    :goto_0
    return v1

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/io/IOException;
    const/16 v1, 0x1f4

    goto :goto_0
.end method

.method public getStatusText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/ResponseStatus;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 60
    :goto_0
    return-object v1

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "Internal Error"

    goto :goto_0
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
    .line 86
    .local p2, "bodyParts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    new-instance v0, Lcom/ning/http/client/providers/jdk/JDKResponse;

    invoke-direct {v0, p0, p1, p2}, Lcom/ning/http/client/providers/jdk/JDKResponse;-><init>(Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)V

    return-object v0
.end method
