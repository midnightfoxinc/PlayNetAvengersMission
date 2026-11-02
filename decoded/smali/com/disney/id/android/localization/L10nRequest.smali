.class Lcom/disney/id/android/localization/L10nRequest;
.super Lcom/disney/id/android/volley/toolbox/JsonObjectRequest;
.source "L10nRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/disney/id/android/volley/toolbox/JsonObjectRequest;"
    }
.end annotation


# static fields
.field private static final DEFAULT_MAX_RETRIES:I = 0x1

.field private static final DEFAULT_TIMEOUT_MS:I = 0xfa0


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V
    .locals 7
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p4, "errorListener"    # Lcom/disney/id/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/disney/id/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/disney/id/android/localization/L10nRequest;, "Lcom/disney/id/android/localization/L10nRequest<TT;>;"
    .local p3, "listener":Lcom/disney/id/android/volley/Response$Listener;, "Lcom/disney/id/android/volley/Response$Listener<Lorg/json/JSONObject;>;"
    const/4 v6, 0x1

    .line 26
    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/disney/id/android/volley/toolbox/JsonObjectRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 27
    new-instance v0, Lcom/disney/id/android/volley/DefaultRetryPolicy;

    const/16 v1, 0xfa0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v6, v2}, Lcom/disney/id/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {p0, v0}, Lcom/disney/id/android/localization/L10nRequest;->setRetryPolicy(Lcom/disney/id/android/volley/RetryPolicy;)Lcom/disney/id/android/volley/Request;

    .line 31
    invoke-virtual {p0, v6}, Lcom/disney/id/android/localization/L10nRequest;->setShouldCache(Z)Lcom/disney/id/android/volley/Request;

    .line 32
    return-void
.end method

.method private static parseIgnoreCacheHeaders(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Cache$Entry;
    .locals 20
    .param p0, "response"    # Lcom/disney/id/android/volley/NetworkResponse;

    .prologue
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 43
    .local v10, "now":J
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    .line 44
    .local v8, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v12, 0x0

    .line 45
    .local v12, "serverDate":J
    const/4 v9, 0x0

    .line 48
    .local v9, "serverEtag":Ljava/lang/String;
    const-string v18, "Date"

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 49
    .local v7, "headerValue":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 50
    invoke-static {v7}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v12

    .line 53
    :cond_0
    const-string v18, "etag"

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "serverEtag":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 55
    .restart local v9    # "serverEtag":Ljava/lang/String;
    const-wide/32 v4, 0x1b7740

    .line 56
    .local v4, "cacheHitButRefreshed":J
    const-wide v2, 0x757b12c00L

    .line 57
    .local v2, "cacheExpired":J
    const-wide/32 v18, 0x1b7740

    add-long v14, v10, v18

    .line 58
    .local v14, "softExpire":J
    const-wide v18, 0x757b12c00L

    add-long v16, v10, v18

    .line 60
    .local v16, "ttl":J
    new-instance v6, Lcom/disney/id/android/volley/Cache$Entry;

    invoke-direct {v6}, Lcom/disney/id/android/volley/Cache$Entry;-><init>()V

    .line 61
    .local v6, "entry":Lcom/disney/id/android/volley/Cache$Entry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iput-object v0, v6, Lcom/disney/id/android/volley/Cache$Entry;->data:[B

    .line 62
    iput-object v9, v6, Lcom/disney/id/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    .line 63
    iput-wide v14, v6, Lcom/disney/id/android/volley/Cache$Entry;->softTtl:J

    .line 64
    move-wide/from16 v0, v16

    iput-wide v0, v6, Lcom/disney/id/android/volley/Cache$Entry;->ttl:J

    .line 65
    iput-wide v12, v6, Lcom/disney/id/android/volley/Cache$Entry;->serverDate:J

    .line 66
    iput-object v8, v6, Lcom/disney/id/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    .line 68
    return-object v6
.end method


# virtual methods
.method protected parseNetworkResponse(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Response;
    .locals 4
    .param p1, "response"    # Lcom/disney/id/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/NetworkResponse;",
            ")",
            "Lcom/disney/id/android/volley/Response",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/disney/id/android/localization/L10nRequest;, "Lcom/disney/id/android/localization/L10nRequest<TT;>;"
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p1, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 75
    .local v1, "jsonString":Ljava/lang/String;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/disney/id/android/localization/L10nRequest;->parseIgnoreCacheHeaders(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/disney/id/android/volley/Response;->success(Ljava/lang/Object;Lcom/disney/id/android/volley/Cache$Entry;)Lcom/disney/id/android/volley/Response;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 77
    .end local v1    # "jsonString":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v2, v0}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v2}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v2

    goto :goto_0
.end method
