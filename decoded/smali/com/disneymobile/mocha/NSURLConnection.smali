.class public Lcom/disneymobile/mocha/NSURLConnection;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSURLConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static downloadService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field delegate:Ljava/lang/Object;

.field private handler:Landroid/os/Handler;

.field private request:Lcom/disneymobile/mocha/NSURLRequest;

.field private started:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x5

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/mocha/NSURLConnection;->downloadService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disneymobile/mocha/NSURLConnection;->started:Z

    .line 73
    return-void
.end method

.method public static connectionWithRequestDelegate(Lcom/disneymobile/mocha/NSURLRequest;Ljava/lang/Object;)Lcom/disneymobile/mocha/NSURLConnection;
    .locals 2
    .param p0, "request"    # Lcom/disneymobile/mocha/NSURLRequest;
    .param p1, "delegate"    # Ljava/lang/Object;

    .prologue
    .line 69
    new-instance v0, Lcom/disneymobile/mocha/NSURLConnection;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSURLConnection;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Lcom/disneymobile/mocha/NSURLConnection;->initWithRequestDelegateAndStartImmediately(Lcom/disneymobile/mocha/NSURLRequest;Ljava/lang/Object;Z)Lcom/disneymobile/mocha/NSURLConnection;

    move-result-object v0

    return-object v0
.end method

.method private fire(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 219
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLConnection;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 223
    :goto_0
    return-void

    .line 222
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method private fire_connectionDidFailWithError(Lcom/disneymobile/mocha/NSError;)V
    .locals 1
    .param p1, "error"    # Lcom/disneymobile/mocha/NSError;

    .prologue
    .line 210
    new-instance v0, Lcom/disneymobile/mocha/NSURLConnection$5;

    invoke-direct {v0, p0, p1}, Lcom/disneymobile/mocha/NSURLConnection$5;-><init>(Lcom/disneymobile/mocha/NSURLConnection;Lcom/disneymobile/mocha/NSError;)V

    .line 215
    .local v0, "runnable":Ljava/lang/Runnable;
    invoke-direct {p0, v0}, Lcom/disneymobile/mocha/NSURLConnection;->fire(Ljava/lang/Runnable;)V

    .line 216
    return-void
.end method

.method private fire_connectionDidFinishLoading()V
    .locals 1

    .prologue
    .line 201
    new-instance v0, Lcom/disneymobile/mocha/NSURLConnection$4;

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSURLConnection$4;-><init>(Lcom/disneymobile/mocha/NSURLConnection;)V

    .line 206
    .local v0, "runnable":Ljava/lang/Runnable;
    invoke-direct {p0, v0}, Lcom/disneymobile/mocha/NSURLConnection;->fire(Ljava/lang/Runnable;)V

    .line 207
    return-void
.end method

.method private fire_connectionDidReceiveData([BI)V
    .locals 3
    .param p1, "data"    # [B
    .param p2, "length"    # I

    .prologue
    const/4 v2, 0x0

    .line 190
    new-array v0, p2, [B

    .line 191
    .local v0, "dataCopy":[B
    invoke-static {p1, v2, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 192
    new-instance v1, Lcom/disneymobile/mocha/NSURLConnection$3;

    invoke-direct {v1, p0, v0}, Lcom/disneymobile/mocha/NSURLConnection$3;-><init>(Lcom/disneymobile/mocha/NSURLConnection;[B)V

    .line 197
    .local v1, "runnable":Ljava/lang/Runnable;
    invoke-direct {p0, v1}, Lcom/disneymobile/mocha/NSURLConnection;->fire(Ljava/lang/Runnable;)V

    .line 198
    return-void
.end method

.method private fire_connectionDidReceiveResponse(Lcom/disneymobile/mocha/NSURLResponse;)V
    .locals 1
    .param p1, "response"    # Lcom/disneymobile/mocha/NSURLResponse;

    .prologue
    .line 181
    new-instance v0, Lcom/disneymobile/mocha/NSURLConnection$2;

    invoke-direct {v0, p0, p1}, Lcom/disneymobile/mocha/NSURLConnection$2;-><init>(Lcom/disneymobile/mocha/NSURLConnection;Lcom/disneymobile/mocha/NSURLResponse;)V

    .line 186
    .local v0, "runnable":Ljava/lang/Runnable;
    invoke-direct {p0, v0}, Lcom/disneymobile/mocha/NSURLConnection;->fire(Ljava/lang/Runnable;)V

    .line 187
    return-void
.end method

.method public static sendSynchronousRequestReturningResponseAndError(Lcom/disneymobile/mocha/NSURLRequest;Lcom/disneymobile/mocha/support/Out;Lcom/disneymobile/mocha/support/Out;)Lcom/disneymobile/mocha/NSData;
    .locals 5
    .param p0, "request"    # Lcom/disneymobile/mocha/NSURLRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/NSURLRequest;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSURLResponse;",
            ">;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Lcom/disneymobile/mocha/NSData;"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "outResponse":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSURLResponse;>;"
    .local p2, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    new-instance v2, Lcom/disneymobile/mocha/NSMutableData;

    invoke-direct {v2}, Lcom/disneymobile/mocha/NSMutableData;-><init>()V

    .line 40
    .local v2, "returnData":Lcom/disneymobile/mocha/NSMutableData;
    new-instance v1, Lcom/disneymobile/mocha/NSURLConnection$1;

    invoke-direct {v1, p1, v2, p2}, Lcom/disneymobile/mocha/NSURLConnection$1;-><init>(Lcom/disneymobile/mocha/support/Out;Lcom/disneymobile/mocha/NSMutableData;Lcom/disneymobile/mocha/support/Out;)V

    .line 63
    .local v1, "delegate":Lcom/disneymobile/mocha/NSURLConnection$1;
    new-instance v3, Lcom/disneymobile/mocha/NSURLConnection;

    invoke-direct {v3}, Lcom/disneymobile/mocha/NSURLConnection;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v3, p0, v1, v4}, Lcom/disneymobile/mocha/NSURLConnection;->initWithRequestDelegateAndStartImmediately(Lcom/disneymobile/mocha/NSURLRequest;Ljava/lang/Object;Z)Lcom/disneymobile/mocha/NSURLConnection;

    move-result-object v0

    .line 64
    .local v0, "connection":Lcom/disneymobile/mocha/NSURLConnection;
    invoke-virtual {v0}, Lcom/disneymobile/mocha/NSURLConnection;->run()V

    .line 65
    return-object v2
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 97
    return-void
.end method

.method public initWithRequestDelegate(Lcom/disneymobile/mocha/NSURLRequest;Ljava/lang/Object;)Lcom/disneymobile/mocha/NSURLConnection;
    .locals 1
    .param p1, "request"    # Lcom/disneymobile/mocha/NSURLRequest;
    .param p2, "delegate"    # Ljava/lang/Object;

    .prologue
    .line 76
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/disneymobile/mocha/NSURLConnection;->initWithRequestDelegateAndStartImmediately(Lcom/disneymobile/mocha/NSURLRequest;Ljava/lang/Object;Z)Lcom/disneymobile/mocha/NSURLConnection;

    move-result-object v0

    return-object v0
.end method

.method public initWithRequestDelegateAndStartImmediately(Lcom/disneymobile/mocha/NSURLRequest;Ljava/lang/Object;Z)Lcom/disneymobile/mocha/NSURLConnection;
    .locals 0
    .param p1, "request"    # Lcom/disneymobile/mocha/NSURLRequest;
    .param p2, "delegate"    # Ljava/lang/Object;
    .param p3, "startImmediately"    # Z

    .prologue
    .line 80
    iput-object p1, p0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    .line 81
    iput-object p2, p0, Lcom/disneymobile/mocha/NSURLConnection;->delegate:Ljava/lang/Object;

    .line 82
    if-eqz p3, :cond_0

    .line 83
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSURLConnection;->start()V

    .line 85
    :cond_0
    return-object p0
.end method

.method public run()V
    .locals 24

    .prologue
    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    .line 103
    .local v20, "startTime":J
    const-string v11, ""

    .line 112
    .local v11, "exception":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURL;->toURL()Ljava/net/URL;

    move-result-object v22

    .line 116
    .local v22, "url":Ljava/net/URL;
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->useProxy()Z

    move-result v23

    .line 117
    .local v23, "useProxy":Z
    if-eqz v23, :cond_1

    .line 118
    new-instance v3, Ljava/net/Proxy;

    sget-object v4, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v5, Ljava/net/InetSocketAddress;

    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getProxyHost()Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getProxyPort()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {v5, v6, v7}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v3, v4, v5}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v9

    check-cast v9, Ljava/net/HttpURLConnection;

    .line 121
    .local v9, "connection":Ljava/net/HttpURLConnection;
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURLRequest;->cachePolicy()Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    move-result-object v3

    sget-object v4, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->ReloadIgnoringLocalAndRemoteCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    if-eq v3, v4, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURLRequest;->cachePolicy()Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    move-result-object v3

    sget-object v4, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->ReloadIgnoringCacheData:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    if-ne v3, v4, :cond_2

    :cond_0
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v9, v3}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 122
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURLRequest;->timeoutInterval()F

    move-result v3

    const/high16 v4, 0x447a0000    # 1000.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v9, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 123
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURLRequest;->HTTPMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 124
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    iget-object v3, v3, Lcom/disneymobile/mocha/NSURLRequest;->headerFields:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Map$Entry;

    .line 125
    .local v14, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v9, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 158
    .end local v9    # "connection":Ljava/net/HttpURLConnection;
    .end local v14    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v15    # "i$":Ljava/util/Iterator;
    .end local v22    # "url":Ljava/net/URL;
    .end local v23    # "useProxy":Z
    :catch_0
    move-exception v10

    .line 160
    .local v10, "e":Ljava/lang/IllegalStateException;
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v10}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 161
    invoke-static {v10}, Lcom/disneymobile/mocha/NSError;->errorWithException(Ljava/lang/Exception;)Lcom/disneymobile/mocha/NSError;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/disneymobile/mocha/NSURLConnection;->fire_connectionDidFailWithError(Lcom/disneymobile/mocha/NSError;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 170
    .local v12, "endTime":J
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_7

    .line 171
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " [Failed Request] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    .end local v10    # "e":Ljava/lang/IllegalStateException;
    :goto_3
    return-void

    .line 120
    .end local v12    # "endTime":J
    .restart local v22    # "url":Ljava/net/URL;
    .restart local v23    # "useProxy":Z
    :cond_1
    :try_start_2
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v9

    check-cast v9, Ljava/net/HttpURLConnection;

    .restart local v9    # "connection":Ljava/net/HttpURLConnection;
    goto/16 :goto_0

    .line 121
    :cond_2
    const/4 v3, 0x1

    goto/16 :goto_1

    .line 127
    .restart local v15    # "i$":Ljava/util/Iterator;
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURLRequest;->HTTPBody()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 129
    const/4 v3, 0x1

    invoke-virtual {v9, v3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 130
    new-instance v17, Ljava/io/OutputStreamWriter;

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-direct {v0, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 131
    .local v17, "out":Ljava/io/OutputStreamWriter;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v3}, Lcom/disneymobile/mocha/NSURLRequest;->HTTPBody()Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/io/OutputStreamWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 132
    invoke-virtual/range {v17 .. v17}, Ljava/io/OutputStreamWriter;->flush()V

    .line 133
    invoke-virtual/range {v17 .. v17}, Ljava/io/OutputStreamWriter;->close()V

    .line 144
    .end local v17    # "out":Ljava/io/OutputStreamWriter;
    :cond_4
    new-instance v3, Lcom/disneymobile/mocha/NSHTTPURLResponse;

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v8

    invoke-direct/range {v3 .. v8}, Lcom/disneymobile/mocha/NSHTTPURLResponse;-><init>(Ljava/lang/String;Ljava/lang/String;JI)V

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/disneymobile/mocha/NSURLConnection;->fire_connectionDidReceiveResponse(Lcom/disneymobile/mocha/NSURLResponse;)V

    .line 146
    const v3, 0x8000

    new-array v2, v3, [B

    .line 147
    .local v2, "buf":[B
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v16

    .line 148
    .local v16, "inputStream":Ljava/io/InputStream;
    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v18

    .local v18, "read":I
    :goto_4
    if-lez v18, :cond_5

    .line 150
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v2, v1}, Lcom/disneymobile/mocha/NSURLConnection;->fire_connectionDidReceiveData([BI)V

    .line 148
    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v18

    goto :goto_4

    .line 155
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/disneymobile/mocha/NSURLConnection;->fire_connectionDidFinishLoading()V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 170
    .restart local v12    # "endTime":J
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6

    .line 171
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " [Failed Request] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 173
    :cond_6
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .end local v2    # "buf":[B
    .end local v9    # "connection":Ljava/net/HttpURLConnection;
    .end local v15    # "i$":Ljava/util/Iterator;
    .end local v16    # "inputStream":Ljava/io/InputStream;
    .end local v18    # "read":I
    .end local v22    # "url":Ljava/net/URL;
    .end local v23    # "useProxy":Z
    .restart local v10    # "e":Ljava/lang/IllegalStateException;
    :cond_7
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 162
    .end local v10    # "e":Ljava/lang/IllegalStateException;
    .end local v12    # "endTime":J
    :catch_1
    move-exception v10

    .line 163
    .local v10, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 164
    invoke-static {v10}, Lcom/disneymobile/mocha/NSError;->errorWithException(Ljava/lang/Exception;)Lcom/disneymobile/mocha/NSError;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/disneymobile/mocha/NSURLConnection;->fire_connectionDidFailWithError(Lcom/disneymobile/mocha/NSError;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 170
    .restart local v12    # "endTime":J
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_8

    .line 171
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " [Failed Request] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 173
    :cond_8
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 165
    .end local v10    # "e":Ljava/io/IOException;
    .end local v12    # "endTime":J
    :catch_2
    move-exception v19

    .line 166
    .local v19, "t":Ljava/lang/Throwable;
    :try_start_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Throwable: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 167
    const-string v3, "NSURLConnection"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/disneymobile/mocha/NSURLConnection;->fire_connectionDidFailWithError(Lcom/disneymobile/mocha/NSError;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 170
    .restart local v12    # "endTime":J
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_9

    .line 171
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " [Failed Request] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 173
    :cond_9
    const-string v3, "NSURLConnection"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v5}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Connection took "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sub-long v6, v12, v20

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 169
    .end local v12    # "endTime":J
    .end local v19    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 170
    .restart local v12    # "endTime":J
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_a

    .line 171
    const-string v4, "NSURLConnection"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v6}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " [Failed Request] "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": Connection took "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sub-long v6, v12, v20

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "ms"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    :goto_5
    throw v3

    .line 173
    :cond_a
    const-string v4, "NSURLConnection"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/disneymobile/mocha/NSURLConnection;->request:Lcom/disneymobile/mocha/NSURLRequest;

    invoke-virtual {v6}, Lcom/disneymobile/mocha/NSURLRequest;->URL()Lcom/disneymobile/mocha/NSURL;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": Connection took "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sub-long v6, v12, v20

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "ms"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method

.method public start()V
    .locals 1

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/disneymobile/mocha/NSURLConnection;->started:Z

    if-nez v0, :cond_0

    .line 90
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disneymobile/mocha/NSURLConnection;->started:Z

    .line 91
    sget-object v0, Lcom/disneymobile/mocha/NSURLConnection;->downloadService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 93
    :cond_0
    return-void
.end method
