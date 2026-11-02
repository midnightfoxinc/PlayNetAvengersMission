.class public Lcom/disney/id/android/volley/DIDNetwork;
.super Ljava/lang/Object;
.source "DIDNetwork.java"

# interfaces
.implements Lcom/disney/id/android/volley/Network;


# static fields
.field protected static final DEBUG:Z

.field private static DEFAULT_POOL_SIZE:I


# instance fields
.field final mContext:Landroid/content/Context;

.field protected final mHttpStack:Lcom/disney/id/android/volley/toolbox/HttpStack;

.field protected final mPool:Lcom/disney/id/android/volley/toolbox/ByteArrayPool;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    sget-boolean v0, Lcom/disney/id/android/volley/VolleyLog;->DEBUG:Z

    sput-boolean v0, Lcom/disney/id/android/volley/DIDNetwork;->DEBUG:Z

    .line 32
    const/16 v0, 0x1000

    sput v0, Lcom/disney/id/android/volley/DIDNetwork;->DEFAULT_POOL_SIZE:I

    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/volley/toolbox/HttpStack;Landroid/content/Context;)V
    .locals 2
    .param p1, "httpStack"    # Lcom/disney/id/android/volley/toolbox/HttpStack;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    new-instance v0, Lcom/disney/id/android/volley/toolbox/ByteArrayPool;

    sget v1, Lcom/disney/id/android/volley/DIDNetwork;->DEFAULT_POOL_SIZE:I

    invoke-direct {v0, v1}, Lcom/disney/id/android/volley/toolbox/ByteArrayPool;-><init>(I)V

    invoke-direct {p0, p1, v0, p2}, Lcom/disney/id/android/volley/DIDNetwork;-><init>(Lcom/disney/id/android/volley/toolbox/HttpStack;Lcom/disney/id/android/volley/toolbox/ByteArrayPool;Landroid/content/Context;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/volley/toolbox/HttpStack;Lcom/disney/id/android/volley/toolbox/ByteArrayPool;Landroid/content/Context;)V
    .locals 0
    .param p1, "httpStack"    # Lcom/disney/id/android/volley/toolbox/HttpStack;
    .param p2, "pool"    # Lcom/disney/id/android/volley/toolbox/ByteArrayPool;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/disney/id/android/volley/DIDNetwork;->mHttpStack:Lcom/disney/id/android/volley/toolbox/HttpStack;

    .line 55
    iput-object p2, p0, Lcom/disney/id/android/volley/DIDNetwork;->mPool:Lcom/disney/id/android/volley/toolbox/ByteArrayPool;

    .line 56
    iput-object p3, p0, Lcom/disney/id/android/volley/DIDNetwork;->mContext:Landroid/content/Context;

    .line 57
    return-void
.end method

.method private addCacheHeaders(Ljava/util/Map;Lcom/disney/id/android/volley/Cache$Entry;)V
    .locals 6
    .param p2, "entry"    # Lcom/disney/id/android/volley/Cache$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/disney/id/android/volley/Cache$Entry;",
            ")V"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_1

    .line 173
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    iget-object v1, p2, Lcom/disney/id/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 166
    const-string v1, "If-None-Match"

    iget-object v2, p2, Lcom/disney/id/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    :cond_2
    iget-wide v2, p2, Lcom/disney/id/android/volley/Cache$Entry;->serverDate:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 170
    new-instance v0, Ljava/util/Date;

    iget-wide v2, p2, Lcom/disney/id/android/volley/Cache$Entry;->serverDate:J

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 171
    .local v0, "refTime":Ljava/util/Date;
    const-string v1, "If-Modified-Since"

    invoke-static {v0}, Lorg/apache/http/impl/cookie/DateUtils;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private static attemptRetryOnException(Ljava/lang/String;Lcom/disney/id/android/volley/Request;Lcom/disney/id/android/volley/VolleyError;)V
    .locals 7
    .param p0, "logPrefix"    # Ljava/lang/String;
    .param p2, "exception"    # Lcom/disney/id/android/volley/VolleyError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/volley/Request",
            "<*>;",
            "Lcom/disney/id/android/volley/VolleyError;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/disney/id/android/volley/VolleyError;
        }
    .end annotation

    .prologue
    .local p1, "request":Lcom/disney/id/android/volley/Request;, "Lcom/disney/id/android/volley/Request<*>;"
    const/4 v4, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 146
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getRetryPolicy()Lcom/disney/id/android/volley/RetryPolicy;

    move-result-object v2

    .line 147
    .local v2, "retryPolicy":Lcom/disney/id/android/volley/RetryPolicy;
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getTimeoutMs()I

    move-result v1

    .line 150
    .local v1, "oldTimeout":I
    :try_start_0
    invoke-interface {v2, p2}, Lcom/disney/id/android/volley/RetryPolicy;->retry(Lcom/disney/id/android/volley/VolleyError;)V
    :try_end_0
    .catch Lcom/disney/id/android/volley/VolleyError; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    const-string v3, "%s-retry [timeout=%s]"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/disney/id/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 157
    return-void

    .line 151
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Lcom/disney/id/android/volley/VolleyError;
    const-string v3, "%s-timeout-giveup [timeout=%s]"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/disney/id/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 154
    throw v0
.end method

.method private static convertHeaders([Lorg/apache/http/Header;)Ljava/util/Map;
    .locals 4
    .param p0, "headers"    # [Lorg/apache/http/Header;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/apache/http/Header;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 209
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 210
    .local v1, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 211
    aget-object v2, p0, v0

    invoke-interface {v2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 213
    :cond_0
    return-object v1
.end method

.method private entityToBytes(Lorg/apache/http/HttpEntity;)[B
    .locals 9
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/disney/id/android/volley/ServerError;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 177
    new-instance v1, Lcom/disney/id/android/volley/toolbox/PoolingByteArrayOutputStream;

    iget-object v5, p0, Lcom/disney/id/android/volley/DIDNetwork;->mPool:Lcom/disney/id/android/volley/toolbox/ByteArrayPool;

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-direct {v1, v5, v6}, Lcom/disney/id/android/volley/toolbox/PoolingByteArrayOutputStream;-><init>(Lcom/disney/id/android/volley/toolbox/ByteArrayPool;I)V

    .line 179
    .local v1, "bytes":Lcom/disney/id/android/volley/toolbox/PoolingByteArrayOutputStream;
    const/4 v0, 0x0

    .line 181
    .local v0, "buffer":[B
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    .line 182
    .local v4, "in":Ljava/io/InputStream;
    if-nez v4, :cond_0

    .line 183
    new-instance v5, Lcom/disney/id/android/volley/ServerError;

    invoke-direct {v5}, Lcom/disney/id/android/volley/ServerError;-><init>()V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    .end local v4    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v5

    .line 194
    :try_start_1
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 200
    :goto_0
    iget-object v6, p0, Lcom/disney/id/android/volley/DIDNetwork;->mPool:Lcom/disney/id/android/volley/toolbox/ByteArrayPool;

    invoke-virtual {v6, v0}, Lcom/disney/id/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 201
    invoke-virtual {v1}, Lcom/disney/id/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    throw v5

    .line 185
    .restart local v4    # "in":Ljava/io/InputStream;
    :cond_0
    :try_start_2
    iget-object v5, p0, Lcom/disney/id/android/volley/DIDNetwork;->mPool:Lcom/disney/id/android/volley/toolbox/ByteArrayPool;

    const/16 v6, 0x400

    invoke-virtual {v5, v6}, Lcom/disney/id/android/volley/toolbox/ByteArrayPool;->getBuf(I)[B

    move-result-object v0

    .line 187
    :goto_1
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "count":I
    const/4 v5, -0x1

    if-eq v2, v5, :cond_1

    .line 188
    const/4 v5, 0x0

    invoke-virtual {v1, v0, v5, v2}, Lcom/disney/id/android/volley/toolbox/PoolingByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 190
    :cond_1
    invoke-virtual {v1}, Lcom/disney/id/android/volley/toolbox/PoolingByteArrayOutputStream;->toByteArray()[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v5

    .line 194
    :try_start_3
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 200
    :goto_2
    iget-object v6, p0, Lcom/disney/id/android/volley/DIDNetwork;->mPool:Lcom/disney/id/android/volley/toolbox/ByteArrayPool;

    invoke-virtual {v6, v0}, Lcom/disney/id/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 201
    invoke-virtual {v1}, Lcom/disney/id/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    return-object v5

    .line 195
    :catch_0
    move-exception v3

    .line 198
    .local v3, "e":Ljava/io/IOException;
    const-string v6, "Error occured when calling consumingContent"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v6, v7}, Lcom/disney/id/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    .line 195
    .end local v2    # "count":I
    .end local v3    # "e":Ljava/io/IOException;
    .end local v4    # "in":Ljava/io/InputStream;
    :catch_1
    move-exception v3

    .line 198
    .restart local v3    # "e":Ljava/io/IOException;
    const-string v6, "Error occured when calling consumingContent"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v6, v7}, Lcom/disney/id/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public performRequest(Lcom/disney/id/android/volley/Request;)Lcom/disney/id/android/volley/NetworkResponse;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/volley/Request",
            "<*>;)",
            "Lcom/disney/id/android/volley/NetworkResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/disney/id/android/volley/VolleyError;
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "request":Lcom/disney/id/android/volley/Request;, "Lcom/disney/id/android/volley/Request<*>;"
    :goto_0
    const/4 v3, 0x0

    .line 63
    .local v3, "httpResponse":Lorg/apache/http/HttpResponse;
    const/4 v5, 0x0

    .line 64
    .local v5, "responseContents":[B
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 66
    .local v6, "responseHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->shouldCache()Z

    move-result v9

    if-eqz v9, :cond_1

    iget-object v9, p0, Lcom/disney/id/android/volley/DIDNetwork;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 67
    const-string v9, "Cached response"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "No Network Connectivity for Url="

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Lcom/disney/id/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 68
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getCacheEntry()Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v1

    .line 69
    .local v1, "entry":Lcom/disney/id/android/volley/Cache$Entry;
    if-eqz v1, :cond_0

    .line 70
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getCacheEntry()Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v9

    iget-object v9, v9, Lcom/disney/id/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-interface {v6, v9}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 71
    :cond_0
    new-instance v9, Lcom/disney/id/android/volley/NetworkResponse;

    const/16 v10, 0x130

    iget-object v11, v1, Lcom/disney/id/android/volley/Cache$Entry;->data:[B

    const/4 v12, 0x1

    invoke-direct {v9, v10, v11, v6, v12}, Lcom/disney/id/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V

    .line 105
    .end local v1    # "entry":Lcom/disney/id/android/volley/Cache$Entry;
    :goto_1
    return-object v9

    .line 75
    :cond_1
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getCacheEntry()Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 76
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getCacheEntry()Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v9

    iget-object v9, v9, Lcom/disney/id/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    invoke-interface {v6, v9}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 79
    :cond_2
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 80
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getCacheEntry()Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v9

    invoke-direct {p0, v2, v9}, Lcom/disney/id/android/volley/DIDNetwork;->addCacheHeaders(Ljava/util/Map;Lcom/disney/id/android/volley/Cache$Entry;)V

    .line 81
    iget-object v9, p0, Lcom/disney/id/android/volley/DIDNetwork;->mHttpStack:Lcom/disney/id/android/volley/toolbox/HttpStack;

    invoke-interface {v9, p1, v2}, Lcom/disney/id/android/volley/toolbox/HttpStack;->performRequest(Lcom/disney/id/android/volley/Request;Ljava/util/Map;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 82
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    .line 83
    .local v8, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    .line 85
    .local v7, "statusCode":I
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v9

    invoke-static {v9}, Lcom/disney/id/android/volley/DIDNetwork;->convertHeaders([Lorg/apache/http/Header;)Ljava/util/Map;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 87
    const/16 v9, 0x130

    if-ne v7, v9, :cond_4

    .line 88
    new-instance v9, Lcom/disney/id/android/volley/NetworkResponse;

    const/16 v11, 0x130

    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getCacheEntry()Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v10

    if-nez v10, :cond_3

    const/4 v10, 0x0

    :goto_2
    const/4 v12, 0x1

    invoke-direct {v9, v11, v10, v6, v12}, Lcom/disney/id/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_1

    .line 106
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "statusCode":I
    .end local v8    # "statusLine":Lorg/apache/http/StatusLine;
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Ljava/net/SocketTimeoutException;
    const-string v9, "socket"

    new-instance v10, Lcom/disney/id/android/volley/TimeoutError;

    invoke-direct {v10}, Lcom/disney/id/android/volley/TimeoutError;-><init>()V

    invoke-static {v9, p1, v10}, Lcom/disney/id/android/volley/DIDNetwork;->attemptRetryOnException(Ljava/lang/String;Lcom/disney/id/android/volley/Request;Lcom/disney/id/android/volley/VolleyError;)V

    goto/16 :goto_0

    .line 88
    .end local v0    # "e":Ljava/net/SocketTimeoutException;
    .restart local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v7    # "statusCode":I
    .restart local v8    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_3
    :try_start_1
    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getCacheEntry()Lcom/disney/id/android/volley/Cache$Entry;

    move-result-object v10

    iget-object v10, v10, Lcom/disney/id/android/volley/Cache$Entry;->data:[B

    goto :goto_2

    .line 94
    :cond_4
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    if-eqz v9, :cond_6

    .line 95
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/disney/id/android/volley/DIDNetwork;->entityToBytes(Lorg/apache/http/HttpEntity;)[B

    move-result-object v5

    .line 102
    :goto_3
    const/16 v9, 0xc8

    if-lt v7, v9, :cond_5

    const/16 v9, 0x12b

    if-le v7, v9, :cond_7

    .line 103
    :cond_5
    new-instance v9, Ljava/io/IOException;

    invoke-direct {v9}, Ljava/io/IOException;-><init>()V

    throw v9
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 108
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "statusCode":I
    .end local v8    # "statusLine":Lorg/apache/http/StatusLine;
    :catch_1
    move-exception v0

    .line 109
    .local v0, "e":Lorg/apache/http/conn/ConnectTimeoutException;
    const-string v9, "connection"

    new-instance v10, Lcom/disney/id/android/volley/TimeoutError;

    invoke-direct {v10}, Lcom/disney/id/android/volley/TimeoutError;-><init>()V

    invoke-static {v9, p1, v10}, Lcom/disney/id/android/volley/DIDNetwork;->attemptRetryOnException(Ljava/lang/String;Lcom/disney/id/android/volley/Request;Lcom/disney/id/android/volley/VolleyError;)V

    goto/16 :goto_0

    .line 99
    .end local v0    # "e":Lorg/apache/http/conn/ConnectTimeoutException;
    .restart local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v7    # "statusCode":I
    .restart local v8    # "statusLine":Lorg/apache/http/StatusLine;
    :cond_6
    const/4 v9, 0x0

    :try_start_2
    new-array v5, v9, [B

    goto :goto_3

    .line 105
    :cond_7
    new-instance v9, Lcom/disney/id/android/volley/NetworkResponse;

    const/4 v10, 0x0

    invoke-direct {v9, v7, v5, v6, v10}, Lcom/disney/id/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto/16 :goto_1

    .line 110
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "statusCode":I
    .end local v8    # "statusLine":Lorg/apache/http/StatusLine;
    :catch_2
    move-exception v0

    .line 111
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v9, Ljava/lang/RuntimeException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Bad URL "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 112
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catch_3
    move-exception v0

    .line 113
    .local v0, "e":Ljava/io/IOException;
    const/4 v7, 0x0

    .line 114
    .restart local v7    # "statusCode":I
    const/4 v4, 0x0

    .line 115
    .local v4, "networkResponse":Lcom/disney/id/android/volley/NetworkResponse;
    if-eqz v3, :cond_9

    .line 116
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    .line 120
    const-string v9, "Unexpected response code %d for %s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-virtual {p1}, Lcom/disney/id/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Lcom/disney/id/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    if-eqz v5, :cond_b

    .line 122
    new-instance v4, Lcom/disney/id/android/volley/NetworkResponse;

    .end local v4    # "networkResponse":Lcom/disney/id/android/volley/NetworkResponse;
    const/4 v9, 0x0

    invoke-direct {v4, v7, v5, v6, v9}, Lcom/disney/id/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V

    .line 124
    .restart local v4    # "networkResponse":Lcom/disney/id/android/volley/NetworkResponse;
    const/16 v9, 0x191

    if-eq v7, v9, :cond_8

    const/16 v9, 0x193

    if-ne v7, v9, :cond_a

    .line 126
    :cond_8
    const-string v9, "auth"

    new-instance v10, Lcom/disney/id/android/volley/AuthFailureError;

    invoke-direct {v10, v4}, Lcom/disney/id/android/volley/AuthFailureError;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    invoke-static {v9, p1, v10}, Lcom/disney/id/android/volley/DIDNetwork;->attemptRetryOnException(Ljava/lang/String;Lcom/disney/id/android/volley/Request;Lcom/disney/id/android/volley/VolleyError;)V

    goto/16 :goto_0

    .line 118
    :cond_9
    new-instance v9, Lcom/disney/id/android/volley/NoConnectionError;

    invoke-direct {v9, v0}, Lcom/disney/id/android/volley/NoConnectionError;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 130
    :cond_a
    new-instance v9, Lcom/disney/id/android/volley/ServerError;

    invoke-direct {v9, v4}, Lcom/disney/id/android/volley/ServerError;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    throw v9

    .line 133
    :cond_b
    new-instance v9, Lcom/disney/id/android/volley/NetworkError;

    invoke-direct {v9, v4}, Lcom/disney/id/android/volley/NetworkError;-><init>(Lcom/disney/id/android/volley/NetworkResponse;)V

    throw v9
.end method
