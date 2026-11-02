.class public abstract Lcom/ning/http/client/HttpResponseStatus;
.super Ljava/lang/Object;
.source "HttpResponseStatus.java"


# instance fields
.field protected final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final uri:Lcom/ning/http/client/uri/Uri;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 0
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/ning/http/client/HttpResponseStatus;->uri:Lcom/ning/http/client/uri/Uri;

    .line 33
    iput-object p2, p0, Lcom/ning/http/client/HttpResponseStatus;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 34
    return-void
.end method


# virtual methods
.method public getConfig()Lcom/ning/http/client/AsyncHttpClientConfig;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/ning/http/client/HttpResponseStatus;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    return-object v0
.end method

.method public abstract getProtocolMajorVersion()I
.end method

.method public abstract getProtocolMinorVersion()I
.end method

.method public abstract getProtocolName()Ljava/lang/String;
.end method

.method public abstract getProtocolText()Ljava/lang/String;
.end method

.method public abstract getStatusCode()I
.end method

.method public abstract getStatusText()Ljava/lang/String;
.end method

.method public final getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/ning/http/client/HttpResponseStatus;->uri:Lcom/ning/http/client/uri/Uri;

    return-object v0
.end method

.method public abstract prepareResponse(Lcom/ning/http/client/HttpResponseHeaders;Ljava/util/List;)Lcom/ning/http/client/Response;
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
.end method
