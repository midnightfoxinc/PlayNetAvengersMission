.class Lcom/disney/id/android/log/NewRelicRequest;
.super Lcom/disney/id/android/volley/toolbox/JsonRequest;
.source "NewRelicRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/disney/id/android/volley/toolbox/JsonRequest",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final DEFAULT_MAX_RETRIES:I = 0x2

.field private static final DEFAULT_TIMEOUT_MS:I = 0x1770


# instance fields
.field private final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final gson:Lcom/google/gson/Gson;

.field private final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/Class;Ljava/util/Map;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V
    .locals 6
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p5, "requestBody"    # Ljava/lang/String;
    .param p7, "errorListener"    # Lcom/disney/id/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/volley/Response$Listener",
            "<TT;>;",
            "Lcom/disney/id/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/disney/id/android/log/NewRelicRequest;, "Lcom/disney/id/android/log/NewRelicRequest<TT;>;"
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p4, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "listener":Lcom/disney/id/android/volley/Response$Listener;, "Lcom/disney/id/android/volley/Response$Listener<TT;>;"
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p5

    move-object v4, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/disney/id/android/volley/toolbox/JsonRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 19
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/log/NewRelicRequest;->gson:Lcom/google/gson/Gson;

    .line 29
    iput-object p3, p0, Lcom/disney/id/android/log/NewRelicRequest;->clazz:Ljava/lang/Class;

    .line 30
    iput-object p4, p0, Lcom/disney/id/android/log/NewRelicRequest;->headers:Ljava/util/Map;

    .line 32
    new-instance v0, Lcom/disney/id/android/volley/DefaultRetryPolicy;

    const/16 v1, 0x1770

    const/4 v2, 0x2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {p0, v0}, Lcom/disney/id/android/log/NewRelicRequest;->setRetryPolicy(Lcom/disney/id/android/volley/RetryPolicy;)Lcom/disney/id/android/volley/Request;

    .line 37
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/disney/id/android/log/NewRelicRequest;->setShouldCache(Z)Lcom/disney/id/android/volley/Request;

    .line 38
    return-void
.end method


# virtual methods
.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/disney/id/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/disney/id/android/log/NewRelicRequest;, "Lcom/disney/id/android/log/NewRelicRequest<TT;>;"
    iget-object v0, p0, Lcom/disney/id/android/log/NewRelicRequest;->headers:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/log/NewRelicRequest;->headers:Ljava/util/Map;

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/disney/id/android/volley/toolbox/JsonRequest;->getHeaders()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method protected parseNetworkResponse(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Response;
    .locals 4
    .param p1, "response"    # Lcom/disney/id/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/NetworkResponse;",
            ")",
            "Lcom/disney/id/android/volley/Response",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lcom/disney/id/android/log/NewRelicRequest;, "Lcom/disney/id/android/log/NewRelicRequest<TT;>;"
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p1, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    iget-object v3, p1, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v3}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 51
    .local v1, "s":Ljava/lang/String;
    iget-object v2, p0, Lcom/disney/id/android/log/NewRelicRequest;->gson:Lcom/google/gson/Gson;

    iget-object v3, p0, Lcom/disney/id/android/log/NewRelicRequest;->clazz:Ljava/lang/Class;

    invoke-virtual {v2, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/disney/id/android/volley/Response;->success(Ljava/lang/Object;Lcom/disney/id/android/volley/Cache$Entry;)Lcom/disney/id/android/volley/Response;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 56
    .end local v1    # "s":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v2, v0}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v2}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v2

    goto :goto_0

    .line 55
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 56
    .local v0, "e":Lcom/google/gson/JsonSyntaxException;
    new-instance v2, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v2, v0}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v2}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v2

    goto :goto_0
.end method
