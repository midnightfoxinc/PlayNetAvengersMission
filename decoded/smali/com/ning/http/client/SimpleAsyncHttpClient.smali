.class public Lcom/ning/http/client/SimpleAsyncHttpClient;
.super Ljava/lang/Object;
.source "SimpleAsyncHttpClient.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/SimpleAsyncHttpClient$1;,
        Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;,
        Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;,
        Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;,
        Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;,
        Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;
    }
.end annotation


# instance fields
.field private asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

.field private final derived:Z

.field private final errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

.field private final listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

.field private providerClass:Ljava/lang/String;

.field private final requestBuilder:Lcom/ning/http/client/RequestBuilder;

.field private final resumeEnabled:Z


# direct methods
.method private constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/ThrowableHandler;Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;ZLcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/simple/SimpleAHCTransferListener;Ljava/lang/String;)V
    .locals 1
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p2, "requestBuilder"    # Lcom/ning/http/client/RequestBuilder;
    .param p3, "defaultThrowableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .param p4, "errorDocumentBehaviour"    # Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;
    .param p5, "resumeEnabled"    # Z
    .param p6, "ahc"    # Lcom/ning/http/client/AsyncHttpClient;
    .param p7, "listener"    # Lcom/ning/http/client/simple/SimpleAHCTransferListener;
    .param p8, "providerClass"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 79
    iput-object p2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    .line 80
    iput-object p3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    .line 81
    iput-boolean p5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->resumeEnabled:Z

    .line 82
    iput-object p4, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    .line 83
    iput-object p6, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

    .line 84
    iput-object p7, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    .line 85
    iput-object p8, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->providerClass:Ljava/lang/String;

    .line 87
    if-eqz p6, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->derived:Z

    .line 88
    return-void

    .line 87
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/ThrowableHandler;Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;ZLcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/simple/SimpleAHCTransferListener;Ljava/lang/String;Lcom/ning/http/client/SimpleAsyncHttpClient$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p2, "x1"    # Lcom/ning/http/client/RequestBuilder;
    .param p3, "x2"    # Lcom/ning/http/client/ThrowableHandler;
    .param p4, "x3"    # Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;
    .param p5, "x4"    # Z
    .param p6, "x5"    # Lcom/ning/http/client/AsyncHttpClient;
    .param p7, "x6"    # Lcom/ning/http/client/simple/SimpleAHCTransferListener;
    .param p8, "x7"    # Ljava/lang/String;
    .param p9, "x8"    # Lcom/ning/http/client/SimpleAsyncHttpClient$1;

    .prologue
    .line 65
    invoke-direct/range {p0 .. p8}, Lcom/ning/http/client/SimpleAsyncHttpClient;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/ThrowableHandler;Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;ZLcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/simple/SimpleAHCTransferListener;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/SimpleAsyncHttpClient;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    return-object v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/ThrowableHandler;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/SimpleAsyncHttpClient;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/SimpleAsyncHttpClient;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    return-object v0
.end method

.method static synthetic access$400(Lcom/ning/http/client/SimpleAsyncHttpClient;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/SimpleAsyncHttpClient;

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->resumeEnabled:Z

    return v0
.end method

.method static synthetic access$500(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/AsyncHttpClient;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/SimpleAsyncHttpClient;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient()Lcom/ning/http/client/AsyncHttpClient;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/ning/http/client/SimpleAsyncHttpClient;)Lcom/ning/http/client/simple/SimpleAHCTransferListener;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/SimpleAsyncHttpClient;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    return-object v0
.end method

.method private asyncHttpClient()Lcom/ning/http/client/AsyncHttpClient;
    .locals 4

    .prologue
    .line 294
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    monitor-enter v1

    .line 295
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

    if-nez v0, :cond_0

    .line 296
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->providerClass:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 297
    new-instance v0, Lcom/ning/http/client/AsyncHttpClient;

    iget-object v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-direct {v0, v2}, Lcom/ning/http/client/AsyncHttpClient;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

    .line 301
    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 302
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

    return-object v0

    .line 299
    :cond_1
    :try_start_1
    new-instance v0, Lcom/ning/http/client/AsyncHttpClient;

    iget-object v2, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->providerClass:Ljava/lang/String;

    iget-object v3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-direct {v0, v2, v3}, Lcom/ning/http/client/AsyncHttpClient;-><init>(Ljava/lang/String;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    iput-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

    goto :goto_0

    .line 301
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 11
    .param p1, "rb"    # Lcom/ning/http/client/RequestBuilder;
    .param p2, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p3, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/RequestBuilder;",
            "Lcom/ning/http/client/BodyConsumer;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 275
    if-nez p3, :cond_0

    .line 276
    iget-object p3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->defaultThrowableHandler:Lcom/ning/http/client/ThrowableHandler;

    .line 279
    :cond_0
    invoke-virtual {p1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v10

    .line 280
    .local v10, "request":Lcom/ning/http/client/Request;
    new-instance v0, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;

    iget-object v3, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->errorDocumentBehaviour:Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;

    invoke-interface {v10}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v4

    iget-object v5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->listener:Lcom/ning/http/client/simple/SimpleAHCTransferListener;

    move-object v1, p2

    move-object v2, p3

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/SimpleAsyncHttpClient$BodyConsumerAsyncHandler;-><init>(Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;Lcom/ning/http/client/SimpleAsyncHttpClient$ErrorDocumentBehaviour;Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/simple/SimpleAHCTransferListener;)V

    .line 282
    .local v0, "handler":Lcom/ning/http/client/ProgressAsyncHandler;, "Lcom/ning/http/client/ProgressAsyncHandler<Lcom/ning/http/client/Response;>;"
    iget-boolean v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->resumeEnabled:Z

    if-eqz v1, :cond_1

    invoke-interface {v10}, Lcom/ning/http/client/Request;->getMethod()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p2, :cond_1

    instance-of v1, p2, Lcom/ning/http/client/ResumableBodyConsumer;

    if-eqz v1, :cond_1

    move-object v6, p2

    .line 284
    check-cast v6, Lcom/ning/http/client/ResumableBodyConsumer;

    .line 285
    .local v6, "fileBodyConsumer":Lcom/ning/http/client/ResumableBodyConsumer;
    invoke-interface {v6}, Lcom/ning/http/client/ResumableBodyConsumer;->getTransferredBytes()J

    move-result-wide v8

    .line 286
    .local v8, "length":J
    invoke-interface {v6}, Lcom/ning/http/client/ResumableBodyConsumer;->resume()V

    .line 287
    new-instance v7, Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;

    invoke-direct {v7, v8, v9, v0}, Lcom/ning/http/client/SimpleAsyncHttpClient$ResumableBodyConsumerAsyncHandler;-><init>(JLcom/ning/http/client/ProgressAsyncHandler;)V

    .end local v0    # "handler":Lcom/ning/http/client/ProgressAsyncHandler;, "Lcom/ning/http/client/ProgressAsyncHandler<Lcom/ning/http/client/Response;>;"
    .local v7, "handler":Lcom/ning/http/client/ProgressAsyncHandler;, "Lcom/ning/http/client/ProgressAsyncHandler<Lcom/ning/http/client/Response;>;"
    move-object v0, v7

    .line 290
    .end local v6    # "fileBodyConsumer":Lcom/ning/http/client/ResumableBodyConsumer;
    .end local v7    # "handler":Lcom/ning/http/client/ProgressAsyncHandler;, "Lcom/ning/http/client/ProgressAsyncHandler<Lcom/ning/http/client/Response;>;"
    .end local v8    # "length":J
    .restart local v0    # "handler":Lcom/ning/http/client/ProgressAsyncHandler;, "Lcom/ning/http/client/ProgressAsyncHandler<Lcom/ning/http/client/Response;>;"
    :cond_1
    invoke-direct {p0}, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient()Lcom/ning/http/client/AsyncHttpClient;

    move-result-object v1

    invoke-virtual {v1, v10, v0}, Lcom/ning/http/client/AsyncHttpClient;->executeRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v1

    return-object v1
.end method

.method private rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;
    .locals 1
    .param p1, "rb"    # Lcom/ning/http/client/Request;

    .prologue
    .line 271
    new-instance v0, Lcom/ning/http/client/RequestBuilder;

    invoke-direct {v0, p1}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 316
    iget-boolean v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->derived:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->asyncHttpClient:Lcom/ning/http/client/AsyncHttpClient;

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClient;->close()V

    .line 319
    :cond_0
    return-void
.end method

.method public delete()Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 211
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 212
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "DELETE"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 213
    invoke-direct {p0, v0, v2, v2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public delete(Lcom/ning/http/client/BodyConsumer;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 224
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "DELETE"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 225
    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public delete(Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p2, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 229
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 230
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "DELETE"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 231
    invoke-direct {p0, v0, p1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public delete(Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 218
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "DELETE"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 219
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public derive()Lcom/ning/http/client/SimpleAsyncHttpClient$DerivedBuilder;
    .locals 2

    .prologue
    .line 337
    new-instance v0, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient$Builder;-><init>(Lcom/ning/http/client/SimpleAsyncHttpClient;Lcom/ning/http/client/SimpleAsyncHttpClient$1;)V

    return-object v0
.end method

.method public get()Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 191
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 192
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    invoke-direct {p0, v0, v2, v2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public get(Lcom/ning/http/client/BodyConsumer;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 202
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public get(Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p2, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 207
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    invoke-direct {p0, v0, p1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public get(Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 197
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public head()Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 235
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 236
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "HEAD"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 237
    invoke-direct {p0, v0, v2, v2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public head(Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 242
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "HEAD"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 243
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public options()Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 247
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 248
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "OPTIONS"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 249
    invoke-direct {p0, v0, v2, v2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public options(Lcom/ning/http/client/BodyConsumer;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 260
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "OPTIONS"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 261
    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public options(Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p2, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 265
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 266
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "OPTIONS"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 267
    invoke-direct {p0, v0, p1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public options(Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 253
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 254
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "OPTIONS"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 255
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public varargs post(Lcom/ning/http/client/BodyConsumer;[Lcom/ning/http/client/multipart/Part;)Ljava/util/concurrent/Future;
    .locals 6
    .param p1, "consumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p2, "parts"    # [Lcom/ning/http/client/multipart/Part;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            "[",
            "Lcom/ning/http/client/multipart/Part;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    iget-object v5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v5}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v4

    .line 103
    .local v4, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v5, "POST"

    invoke-virtual {v4, v5}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 105
    move-object v0, p2

    .local v0, "arr$":[Lcom/ning/http/client/multipart/Part;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 106
    .local v3, "part":Lcom/ning/http/client/multipart/Part;
    invoke-virtual {v4, v3}, Lcom/ning/http/client/RequestBuilder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilder;

    .line 105
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 109
    .end local v3    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_0
    const/4 v5, 0x0

    invoke-direct {p0, v4, p1, v5}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v5

    return-object v5
.end method

.method public post(Lcom/ning/http/client/BodyGenerator;)Ljava/util/concurrent/Future;
    .locals 3
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 113
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 114
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "POST"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 115
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 116
    invoke-direct {p0, v0, v2, v2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public post(Lcom/ning/http/client/BodyGenerator;Lcom/ning/http/client/BodyConsumer;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .param p2, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            "Lcom/ning/http/client/BodyConsumer;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 128
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "POST"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 129
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 130
    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public post(Lcom/ning/http/client/BodyGenerator;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .param p2, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p3, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            "Lcom/ning/http/client/BodyConsumer;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 135
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "POST"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 136
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 137
    invoke-direct {p0, v0, p2, p3}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public post(Lcom/ning/http/client/BodyGenerator;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .param p2, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 121
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "POST"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 122
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 123
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public varargs post([Lcom/ning/http/client/multipart/Part;)Ljava/util/concurrent/Future;
    .locals 7
    .param p1, "parts"    # [Lcom/ning/http/client/multipart/Part;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/ning/http/client/multipart/Part;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 91
    iget-object v5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v5}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v4

    .line 92
    .local v4, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v5, "POST"

    invoke-virtual {v4, v5}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 94
    move-object v0, p1

    .local v0, "arr$":[Lcom/ning/http/client/multipart/Part;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 95
    .local v3, "part":Lcom/ning/http/client/multipart/Part;
    invoke-virtual {v4, v3}, Lcom/ning/http/client/RequestBuilder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilder;

    .line 94
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 98
    .end local v3    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_0
    invoke-direct {p0, v4, v6, v6}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v5

    return-object v5
.end method

.method public varargs put(Lcom/ning/http/client/BodyConsumer;[Lcom/ning/http/client/multipart/Part;)Ljava/util/concurrent/Future;
    .locals 6
    .param p1, "consumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p2, "parts"    # [Lcom/ning/http/client/multipart/Part;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyConsumer;",
            "[",
            "Lcom/ning/http/client/multipart/Part;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v5}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v4

    .line 153
    .local v4, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v5, "POST"

    invoke-virtual {v4, v5}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 155
    move-object v0, p2

    .local v0, "arr$":[Lcom/ning/http/client/multipart/Part;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 156
    .local v3, "part":Lcom/ning/http/client/multipart/Part;
    invoke-virtual {v4, v3}, Lcom/ning/http/client/RequestBuilder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilder;

    .line 155
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 159
    .end local v3    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_0
    const/4 v5, 0x0

    invoke-direct {p0, v4, p1, v5}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v5

    return-object v5
.end method

.method public put(Lcom/ning/http/client/BodyGenerator;)Ljava/util/concurrent/Future;
    .locals 3
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 177
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 178
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "PUT"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 179
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 180
    invoke-direct {p0, v0, v2, v2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public put(Lcom/ning/http/client/BodyGenerator;Lcom/ning/http/client/BodyConsumer;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .param p2, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            "Lcom/ning/http/client/BodyConsumer;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 164
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "PUT"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 165
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 166
    const/4 v1, 0x0

    invoke-direct {p0, v0, p2, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public put(Lcom/ning/http/client/BodyGenerator;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .param p2, "bodyConsumer"    # Lcom/ning/http/client/BodyConsumer;
    .param p3, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            "Lcom/ning/http/client/BodyConsumer;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 171
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "PUT"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 172
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 173
    invoke-direct {p0, v0, p2, p3}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public put(Lcom/ning/http/client/BodyGenerator;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;
    .locals 2
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .param p2, "throwableHandler"    # Lcom/ning/http/client/ThrowableHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            "Lcom/ning/http/client/ThrowableHandler;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    iget-object v1, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v0

    .line 185
    .local v0, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v1, "PUT"

    invoke-virtual {v0, v1}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 186
    invoke-virtual {v0, p1}, Lcom/ning/http/client/RequestBuilder;->setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;

    .line 187
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p2}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v1

    return-object v1
.end method

.method public varargs put([Lcom/ning/http/client/multipart/Part;)Ljava/util/concurrent/Future;
    .locals 7
    .param p1, "parts"    # [Lcom/ning/http/client/multipart/Part;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/ning/http/client/multipart/Part;",
            ")",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 141
    iget-object v5, p0, Lcom/ning/http/client/SimpleAsyncHttpClient;->requestBuilder:Lcom/ning/http/client/RequestBuilder;

    invoke-virtual {v5}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/ning/http/client/SimpleAsyncHttpClient;->rebuildRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/RequestBuilder;

    move-result-object v4

    .line 142
    .local v4, "r":Lcom/ning/http/client/RequestBuilder;
    const-string v5, "POST"

    invoke-virtual {v4, v5}, Lcom/ning/http/client/RequestBuilder;->setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 144
    move-object v0, p1

    .local v0, "arr$":[Lcom/ning/http/client/multipart/Part;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 145
    .local v3, "part":Lcom/ning/http/client/multipart/Part;
    invoke-virtual {v4, v3}, Lcom/ning/http/client/RequestBuilder;->addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilder;

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    .end local v3    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_0
    invoke-direct {p0, v4, v6, v6}, Lcom/ning/http/client/SimpleAsyncHttpClient;->execute(Lcom/ning/http/client/RequestBuilder;Lcom/ning/http/client/BodyConsumer;Lcom/ning/http/client/ThrowableHandler;)Ljava/util/concurrent/Future;

    move-result-object v5

    return-object v5
.end method
