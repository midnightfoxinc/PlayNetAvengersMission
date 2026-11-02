.class Lcom/disney/id/android/guestcontroller/GuestControllerRequest;
.super Lcom/disney/id/android/volley/toolbox/JsonRequest;
.source "GuestControllerRequest.java"


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
    .line 30
    .local p0, "this":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;, "Lcom/disney/id/android/guestcontroller/GuestControllerRequest<TT;>;"
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

    .line 22
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->gson:Lcom/google/gson/Gson;

    .line 31
    iput-object p3, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->clazz:Ljava/lang/Class;

    .line 32
    iput-object p4, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->headers:Ljava/util/Map;

    .line 34
    new-instance v0, Lcom/disney/id/android/volley/DefaultRetryPolicy;

    const/16 v1, 0x1770

    const/4 v2, 0x1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {p0, v0}, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->setRetryPolicy(Lcom/disney/id/android/volley/RetryPolicy;)Lcom/disney/id/android/volley/Request;

    .line 39
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->setShouldCache(Z)Lcom/disney/id/android/volley/Request;

    .line 40
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
    .line 44
    .local p0, "this":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;, "Lcom/disney/id/android/guestcontroller/GuestControllerRequest<TT;>;"
    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->headers:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->headers:Ljava/util/Map;

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/disney/id/android/volley/toolbox/JsonRequest;->getHeaders()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method protected parseNetworkError(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/VolleyError;
    .locals 6
    .param p1, "volleyError"    # Lcom/disney/id/android/volley/VolleyError;

    .prologue
    .line 75
    .local p0, "this":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;, "Lcom/disney/id/android/guestcontroller/GuestControllerRequest<TT;>;"
    if-eqz p1, :cond_1

    iget-object v4, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    if-eqz v4, :cond_1

    iget-object v4, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    iget-object v4, v4, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    if-eqz v4, :cond_1

    .line 77
    :try_start_0
    new-instance v3, Ljava/lang/String;

    iget-object v4, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    iget-object v4, v4, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    iget-object v5, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    iget-object v5, v5, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v5}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 80
    .local v3, "jsonString":Ljava/lang/String;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 81
    .local v2, "json":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->gson:Lcom/google/gson/Gson;

    const-class v5, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    invoke-virtual {v4, v3, v5}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    .line 82
    .local v1, "guestControllerResponse":Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
    const-string v4, "data"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 83
    const-string v4, "data"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setData(Lorg/json/JSONObject;)V

    .line 84
    :cond_0
    invoke-virtual {v1, v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setRaw(Lorg/json/JSONObject;)V

    .line 85
    iget-object v4, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    iget-object v4, v4, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-virtual {v1, v4}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setHeaders(Ljava/util/Map;)V

    .line 86
    iget-object v4, p1, Lcom/disney/id/android/volley/VolleyError;->networkResponse:Lcom/disney/id/android/volley/NetworkResponse;

    iget v4, v4, Lcom/disney/id/android/volley/NetworkResponse;->statusCode:I

    invoke-virtual {v1, v4}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setStatusCode(I)V

    .line 88
    new-instance v0, Lcom/disney/id/android/guestcontroller/GuestControllerError;

    invoke-virtual {v1}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->getKeyError()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4, p1}, Lcom/disney/id/android/guestcontroller/GuestControllerError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    .local v0, "error":Lcom/disney/id/android/guestcontroller/GuestControllerError;
    invoke-virtual {v0, v1}, Lcom/disney/id/android/guestcontroller/GuestControllerError;->setResponse(Lcom/disney/id/android/guestcontroller/GuestControllerResponse;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    move-object p1, v0

    .line 95
    .end local v0    # "error":Lcom/disney/id/android/guestcontroller/GuestControllerError;
    .end local v1    # "guestControllerResponse":Lcom/disney/id/android/guestcontroller/GuestControllerResponse;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "jsonString":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object p1

    .line 92
    :catch_0
    move-exception v4

    goto :goto_0

    :catch_1
    move-exception v4

    goto :goto_0

    :catch_2
    move-exception v4

    goto :goto_0
.end method

.method protected parseNetworkResponse(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Response;
    .locals 7
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
    .line 50
    .local p0, "this":Lcom/disney/id/android/guestcontroller/GuestControllerRequest;, "Lcom/disney/id/android/guestcontroller/GuestControllerRequest<TT;>;"
    :try_start_0
    new-instance v3, Ljava/lang/String;

    iget-object v5, p1, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    iget-object v6, p1, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v6}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 53
    .local v3, "jsonString":Ljava/lang/String;
    iget-object v5, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->gson:Lcom/google/gson/Gson;

    iget-object v6, p0, Lcom/disney/id/android/guestcontroller/GuestControllerRequest;->clazz:Ljava/lang/Class;

    invoke-virtual {v5, v3, v6}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    .line 54
    .local v4, "rep":Ljava/lang/Object;, "TT;"
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 55
    .local v2, "json":Lorg/json/JSONObject;
    instance-of v5, v4, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    if-eqz v5, :cond_1

    .line 56
    const-string v5, "data"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 57
    move-object v0, v4

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-object v5, v0

    const-string v6, "data"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setData(Lorg/json/JSONObject;)V

    .line 58
    :cond_0
    move-object v0, v4

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-object v5, v0

    invoke-virtual {v5, v2}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setRaw(Lorg/json/JSONObject;)V

    .line 59
    move-object v0, v4

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-object v5, v0

    iget-object v6, p1, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-virtual {v5, v6}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setHeaders(Ljava/util/Map;)V

    .line 60
    move-object v0, v4

    check-cast v0, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;

    move-object v5, v0

    iget v6, p1, Lcom/disney/id/android/volley/NetworkResponse;->statusCode:I

    invoke-virtual {v5, v6}, Lcom/disney/id/android/guestcontroller/GuestControllerResponse;->setStatusCode(I)V

    .line 62
    :cond_1
    invoke-static {p1}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/disney/id/android/volley/Response;->success(Ljava/lang/Object;Lcom/disney/id/android/volley/Cache$Entry;)Lcom/disney/id/android/volley/Response;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v5

    .line 69
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "jsonString":Ljava/lang/String;
    .end local v4    # "rep":Ljava/lang/Object;, "TT;"
    :goto_0
    return-object v5

    .line 64
    :catch_0
    move-exception v1

    .line 65
    .local v1, "e":Lorg/json/JSONException;
    new-instance v5, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v5, v1}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v5}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v5

    goto :goto_0

    .line 66
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 67
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v5, v1}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v5}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v5

    goto :goto_0

    .line 68
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_2
    move-exception v1

    .line 69
    .local v1, "e":Lcom/google/gson/JsonSyntaxException;
    new-instance v5, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v5, v1}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v5}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v5

    goto :goto_0
.end method
