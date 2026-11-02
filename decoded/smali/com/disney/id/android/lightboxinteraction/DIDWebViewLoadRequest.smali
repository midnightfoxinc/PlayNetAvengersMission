.class Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;
.super Lcom/disney/id/android/volley/Request;
.source "DIDWebViewLoadRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/disney/id/android/volley/Request",
        "<",
        "Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static final ETAG_KEY:Ljava/lang/String; = "ETag"

.field private static final IF_MODIFIED_SINCE_HEADER_KEY:Ljava/lang/String; = "If-Modified-Since"

.field private static final IF_NONE_MATCH_HEADER_KEY:Ljava/lang/String; = "If-None-Match"

.field private static final LAST_MODIFIED_KEY:Ljava/lang/String; = "Last-Modified"

.field public static final NOT_MODIFIED:Ljava/lang/String; = "NOT_MODIFIED"


# instance fields
.field private existingHeaders:Ljava/util/Map;
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

.field private listener:Lcom/disney/id/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/disney/id/android/volley/Response$Listener",
            "<",
            "Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/Map;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "errorListener"    # Lcom/disney/id/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/disney/id/android/volley/Response$Listener",
            "<",
            "Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;",
            ">;",
            "Lcom/disney/id/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 27
    .local p2, "existingHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "listener":Lcom/disney/id/android/volley/Response$Listener;, "Lcom/disney/id/android/volley/Response$Listener<Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p4}, Lcom/disney/id/android/volley/Request;-><init>(ILjava/lang/String;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 28
    iput-object p2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->existingHeaders:Ljava/util/Map;

    .line 29
    iput-object p3, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->listener:Lcom/disney/id/android/volley/Response$Listener;

    .line 30
    return-void
.end method


# virtual methods
.method protected deliverResponse(Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;)V
    .locals 1
    .param p1, "response"    # Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->listener:Lcom/disney/id/android/volley/Response$Listener;

    invoke-interface {v0, p1}, Lcom/disney/id/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method protected bridge synthetic deliverResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 16
    check-cast p1, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->deliverResponse(Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;)V

    return-void
.end method

.method public getBodyContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string v0, "text/html"

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 4
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
    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 55
    .local v0, "requiredHeadersForWebViewReuse":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->existingHeaders:Ljava/util/Map;

    const-string v2, "ETag"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 56
    const-string v1, "If-None-Match"

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->existingHeaders:Ljava/util/Map;

    const-string v3, "ETag"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    :cond_0
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->existingHeaders:Ljava/util/Map;

    const-string v2, "Last-Modified"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 59
    const-string v1, "If-Modified-Since"

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->existingHeaders:Ljava/util/Map;

    const-string v3, "Last-Modified"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    :cond_1
    return-object v0
.end method

.method protected parseNetworkResponse(Lcom/disney/id/android/volley/NetworkResponse;)Lcom/disney/id/android/volley/Response;
    .locals 5
    .param p1, "response"    # Lcom/disney/id/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/NetworkResponse;",
            ")",
            "Lcom/disney/id/android/volley/Response",
            "<",
            "Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 36
    :try_start_0
    new-instance v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    iget-object v4, p1, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v4}, Lcom/disney/id/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    .line 43
    .local v2, "parsed":Ljava/lang/String;
    :goto_0
    new-instance v1, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;

    iget-object v4, p1, Lcom/disney/id/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    iget-boolean v3, p1, Lcom/disney/id/android/volley/NetworkResponse;->notModified:Z

    if-nez v3, :cond_0

    const/4 v3, 0x1

    :goto_1
    invoke-direct {v1, v4, v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;-><init>(Ljava/util/Map;Ljava/lang/String;Z)V

    .line 44
    .local v1, "loadResponse":Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;
    const/4 v3, 0x0

    invoke-static {v1, v3}, Lcom/disney/id/android/volley/Response;->success(Ljava/lang/Object;Lcom/disney/id/android/volley/Cache$Entry;)Lcom/disney/id/android/volley/Response;

    move-result-object v3

    return-object v3

    .line 37
    .end local v1    # "loadResponse":Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadResponse;
    .end local v2    # "parsed":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 38
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/String;

    iget-object v3, p1, Lcom/disney/id/android/volley/NetworkResponse;->data:[B

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    .line 41
    .restart local v2    # "parsed":Ljava/lang/String;
    goto :goto_0

    .line 39
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v2    # "parsed":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/NullPointerException;
    const/4 v2, 0x0

    .restart local v2    # "parsed":Ljava/lang/String;
    goto :goto_0

    .line 43
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :cond_0
    const/4 v3, 0x0

    goto :goto_1
.end method
