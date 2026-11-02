.class Lcom/disney/emagine/sdk/networking/EMTRestClient$1;
.super Ljava/lang/Object;
.source "EMTRestClient.java"

# interfaces
.implements Lorg/apache/http/client/HttpRequestRetryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/networking/EMTRestClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .prologue
    .line 394
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient$1;->this$0:Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z
    .locals 5
    .param p1, "exception"    # Ljava/io/IOException;
    .param p2, "executionCount"    # I
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 398
    const/4 v4, 0x4

    if-lt p2, v4, :cond_1

    .line 430
    :cond_0
    :goto_0
    return v2

    .line 404
    :cond_1
    instance-of v4, p1, Lorg/apache/http/NoHttpResponseException;

    if-eqz v4, :cond_2

    move v2, v3

    .line 406
    goto :goto_0

    .line 409
    :cond_2
    instance-of v4, p1, Ljavax/net/ssl/SSLHandshakeException;

    if-nez v4, :cond_0

    .line 415
    instance-of v4, p1, Ljava/net/SocketTimeoutException;

    if-nez v4, :cond_0

    .line 421
    const-string v4, "http.request"

    invoke-interface {p3, v4}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpRequest;

    .line 422
    .local v1, "request":Lorg/apache/http/HttpRequest;
    instance-of v4, v1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-nez v4, :cond_3

    move v0, v3

    .line 424
    .local v0, "idempotent":Z
    :goto_1
    if-eqz v0, :cond_0

    move v2, v3

    .line 427
    goto :goto_0

    .end local v0    # "idempotent":Z
    :cond_3
    move v0, v2

    .line 422
    goto :goto_1
.end method
