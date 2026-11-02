.class public Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;
.super Ljava/lang/Object;
.source "DIDNetworkResponseUtils.java"


# static fields
.field private static final DEFAULT_JSON_CHARSET:Ljava/lang/String; = "utf-8"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getJSONObjectFromResponse(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;
    .locals 4
    .param p0, "response"    # Lcom/disney/id/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 20
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    iget-object v2, p0, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    const-string v3, "utf-8"

    invoke-static {v2, v3}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 21
    .local v0, "jsonString":Ljava/lang/String;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method public static getJSONObjectFromResponseSilently(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;
    .locals 4
    .param p0, "response"    # Lcom/disney/id/android/volley/NetworkResponse;

    .prologue
    .line 27
    :try_start_0
    invoke-static {p0}, Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;->getJSONObjectFromResponse(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 33
    .local v1, "json":Lorg/json/JSONObject;
    :goto_0
    return-object v1

    .line 28
    .end local v1    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/Exception;
    const-class v2, Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Something went wrong parsing the NetworkResponse. Does it contain valid JSON?"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .restart local v1    # "json":Lorg/json/JSONObject;
    goto :goto_0
.end method
