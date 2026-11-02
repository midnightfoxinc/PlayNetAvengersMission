.class public Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;
.super Lcom/disney/id/android/volley/toolbox/JsonRequest;
.source "ImprovedGuestControllerRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$1;,
        Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;,
        Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/disney/id/android/volley/toolbox/JsonRequest",
        "<",
        "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_TIMEOUT_IN_MS:I = 0x1770

.field private static final RETRY_POLICY:Lcom/disney/id/android/volley/DefaultRetryPolicy;


# instance fields
.field private final optionalHeaders:Ljava/util/Map;
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
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 25
    new-instance v0, Lcom/disney/id/android/volley/DefaultRetryPolicy;

    const/16 v1, 0x1770

    const/4 v2, 0x1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v3}, Lcom/disney/id/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    sput-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->RETRY_POLICY:Lcom/disney/id/android/volley/DefaultRetryPolicy;

    return-void
.end method

.method private constructor <init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)V
    .locals 6
    .param p1, "builder"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;

    .prologue
    .line 56
    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$000(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$RequestMethod;->getId()I

    move-result v1

    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$100(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$200(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v3, 0x0

    :goto_0
    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$300(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lcom/disney/id/android/volley/Response$Listener;

    move-result-object v4

    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$400(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lcom/disney/id/android/volley/Response$ErrorListener;

    move-result-object v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/disney/id/android/volley/toolbox/JsonRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 58
    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$500(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->optionalHeaders:Ljava/util/Map;

    .line 60
    sget-object v0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->RETRY_POLICY:Lcom/disney/id/android/volley/DefaultRetryPolicy;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->setRetryPolicy(Lcom/disney/id/android/volley/RetryPolicy;)Lcom/disney/id/android/volley/Request;

    .line 61
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->setShouldCache(Z)Lcom/disney/id/android/volley/Request;

    .line 62
    return-void

    .line 56
    :cond_0
    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$200(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 58
    :cond_1
    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;->access$500(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)Ljava/util/Map;

    move-result-object v0

    goto :goto_1
.end method

.method synthetic constructor <init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;
    .param p2, "x1"    # Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$1;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;-><init>(Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest$Builder;)V

    return-void
.end method


# virtual methods
.method public getHeaders()Ljava/util/Map;
    .locals 2
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
    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-super {p0}, Lcom/disney/id/android/volley/toolbox/JsonRequest;->getHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 50
    .local v0, "existingHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerRequest;->optionalHeaders:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 52
    return-object v0
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
            "<",
            "Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    iget v4, p1, Lcom/disney/id/android/volley/NetworkResponse;->statusCode:I

    .line 35
    .local v4, "statusCode":I
    iget-object v1, p1, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    .line 38
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-static {p1}, Lcom/disney/id/android/improvedguestcontroller/DIDNetworkResponseUtils;->getJSONObjectFromResponse(Lcom/disney/id/android/volley/NetworkResponse;)Lorg/json/JSONObject;

    move-result-object v3

    .line 39
    .local v3, "jsonObject":Lorg/json/JSONObject;
    new-instance v5, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;

    invoke-direct {v5, v4, v3, v1}, Lcom/disney/id/android/improvedguestcontroller/ImprovedGuestControllerResponse;-><init>(ILorg/json/JSONObject;Ljava/util/Map;)V

    invoke-static {p1}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/disney/id/android/volley/Response;->success(Ljava/lang/Object;Lcom/disney/id/android/volley/Cache$Entry;)Lcom/disney/id/android/volley/Response;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 43
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-object v5

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v5, v0}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v5}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v5

    goto :goto_0

    .line 42
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v2

    .line 43
    .local v2, "je":Lorg/json/JSONException;
    new-instance v5, Lcom/disney/id/android/volley/ParseError;

    invoke-direct {v5, v2}, Lcom/disney/id/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v5}, Lcom/disney/id/android/volley/Response;->error(Lcom/disney/id/android/volley/VolleyError;)Lcom/disney/id/android/volley/Response;

    move-result-object v5

    goto :goto_0
.end method
