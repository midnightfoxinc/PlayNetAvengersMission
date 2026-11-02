.class public Lcom/ning/http/client/AsyncHttpClient;
.super Ljava/lang/Object;
.source "AsyncHttpClient.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    }
.end annotation


# static fields
.field private static final DEFAULT_PROVIDER:Ljava/lang/String; = "com.ning.http.client.providers.netty.NettyAsyncHttpProvider"

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final httpProvider:Lcom/ning/http/client/AsyncHttpProvider;

.field private final isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected signatureCalculator:Lcom/ning/http/client/SignatureCalculator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 152
    const-class v0, Lcom/ning/http/client/AsyncHttpClient;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 167
    new-instance v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-direct {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->build()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ning/http/client/AsyncHttpClient;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 168
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 1
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 187
    const-string v0, "com.ning.http.client.providers.netty.NettyAsyncHttpProvider"

    invoke-static {v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->loadDefaultProvider(Ljava/lang/String;Lcom/ning/http/client/AsyncHttpClientConfig;)Lcom/ning/http/client/AsyncHttpProvider;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;-><init>(Lcom/ning/http/client/AsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 188
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpProvider;)V
    .locals 1
    .param p1, "provider"    # Lcom/ning/http/client/AsyncHttpProvider;

    .prologue
    .line 177
    new-instance v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-direct {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->build()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/AsyncHttpClient;-><init>(Lcom/ning/http/client/AsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 178
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 2
    .param p1, "httpProvider"    # Lcom/ning/http/client/AsyncHttpProvider;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 198
    iput-object p2, p0, Lcom/ning/http/client/AsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 199
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClient;->httpProvider:Lcom/ning/http/client/AsyncHttpProvider;

    .line 200
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 2
    .param p1, "providerClass"    # Ljava/lang/String;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 210
    new-instance v0, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-direct {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->build()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 211
    invoke-static {p1, p2}, Lcom/ning/http/client/AsyncHttpClient;->loadDefaultProvider(Ljava/lang/String;Lcom/ning/http/client/AsyncHttpClientConfig;)Lcom/ning/http/client/AsyncHttpProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->httpProvider:Lcom/ning/http/client/AsyncHttpProvider;

    .line 212
    return-void
.end method

.method static synthetic access$000()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 147
    sget-object v0, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    return-object v0
.end method

.method private static final loadDefaultProvider(Ljava/lang/String;Lcom/ning/http/client/AsyncHttpClientConfig;)Lcom/ning/http/client/AsyncHttpProvider;
    .locals 7
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 542
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 544
    .local v1, "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/ning/http/client/AsyncHttpProvider;>;"
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Lcom/ning/http/client/AsyncHttpClientConfig;

    aput-object v5, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/AsyncHttpProvider;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 571
    .end local v1    # "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/ning/http/client/AsyncHttpProvider;>;"
    :goto_0
    return-object v3

    .line 546
    :catch_0
    move-exception v2

    .line 548
    .local v2, "t":Ljava/lang/Throwable;
    instance-of v3, v2, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 549
    check-cast v0, Ljava/lang/reflect/InvocationTargetException;

    .line 550
    .local v0, "ite":Ljava/lang/reflect/InvocationTargetException;
    sget-object v3, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    invoke-interface {v3}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 551
    sget-object v3, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    const-string v4, "Unable to instantiate provider {}.  Trying other providers."

    invoke-interface {v3, v4, p0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Object;)V

    .line 554
    sget-object v3, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 560
    .end local v0    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :cond_0
    :try_start_1
    const-class v3, Lcom/ning/http/client/AsyncHttpClient;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 562
    .restart local v1    # "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/ning/http/client/AsyncHttpProvider;>;"
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Lcom/ning/http/client/AsyncHttpClientConfig;

    aput-object v5, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/AsyncHttpProvider;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 564
    .end local v1    # "providerClass":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/ning/http/client/AsyncHttpProvider;>;"
    :catch_1
    move-exception v3

    .line 567
    sget-object v3, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    invoke-interface {v3}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 568
    sget-object v3, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    const-string v4, "Default provider not found {}. Using the {}"

    const-string v5, "com.ning.http.client.providers.netty.NettyAsyncHttpProvider"

    const-class v6, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 571
    :cond_1
    new-instance v3, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    invoke-direct {v3, p1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V

    goto :goto_0
.end method

.method private preProcessRequest(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/filter/FilterContext",
            "<TT;>;)",
            "Lcom/ning/http/client/filter/FilterContext",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/filter/FilterException;
        }
    .end annotation

    .prologue
    .line 518
    .local p1, "fc":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    iget-object v4, p0, Lcom/ning/http/client/AsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v4}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRequestFilters()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/filter/RequestFilter;

    .line 519
    .local v0, "asyncFilter":Lcom/ning/http/client/filter/RequestFilter;
    invoke-interface {v0, p1}, Lcom/ning/http/client/filter/RequestFilter;->filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;

    move-result-object p1

    .line 520
    if-nez p1, :cond_0

    .line 521
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "FilterContext is null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 525
    .end local v0    # "asyncFilter":Lcom/ning/http/client/filter/RequestFilter;
    :cond_1
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v3

    .line 526
    .local v3, "request":Lcom/ning/http/client/Request;
    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v4

    instance-of v4, v4, Lcom/ning/http/client/resumable/ResumableAsyncHandler;

    if-eqz v4, :cond_2

    .line 527
    const-class v4, Lcom/ning/http/client/resumable/ResumableAsyncHandler;

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ning/http/client/resumable/ResumableAsyncHandler;

    invoke-virtual {v4, v3}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->adjustRequestRange(Lcom/ning/http/client/Request;)Lcom/ning/http/client/Request;

    move-result-object v3

    .line 530
    :cond_2
    invoke-interface {v3}, Lcom/ning/http/client/Request;->getRangeOffset()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_3

    .line 531
    new-instance v1, Lcom/ning/http/client/RequestBuilder;

    invoke-direct {v1, v3}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    .line 532
    .local v1, "builder":Lcom/ning/http/client/RequestBuilder;
    const-string v4, "Range"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bytes="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v3}, Lcom/ning/http/client/Request;->getRangeOffset()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/ning/http/client/RequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 533
    invoke-virtual {v1}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v3

    .line 535
    .end local v1    # "builder":Lcom/ning/http/client/RequestBuilder;
    :cond_3
    new-instance v4, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct {v4, p1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>(Lcom/ning/http/client/filter/FilterContext;)V

    invoke-virtual {v4, v3}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object p1

    .line 536
    return-object p1
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 335
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->httpProvider:Lcom/ning/http/client/AsyncHttpProvider;

    invoke-interface {v0}, Lcom/ning/http/client/AsyncHttpProvider;->close()V

    .line 338
    :cond_0
    return-void
.end method

.method public closeAsynchronously()V
    .locals 2

    .prologue
    .line 344
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 345
    .local v0, "e":Ljava/util/concurrent/ExecutorService;
    new-instance v1, Lcom/ning/http/client/AsyncHttpClient$1;

    invoke-direct {v1, p0, v0}, Lcom/ning/http/client/AsyncHttpClient$1;-><init>(Lcom/ning/http/client/AsyncHttpClient;Ljava/util/concurrent/ExecutorService;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 356
    return-void
.end method

.method public executeRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/ListenableFuture;
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Request;",
            ")",
            "Lcom/ning/http/client/ListenableFuture",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation

    .prologue
    .line 508
    new-instance v0, Lcom/ning/http/client/AsyncCompletionHandlerBase;

    invoke-direct {v0}, Lcom/ning/http/client/AsyncCompletionHandlerBase;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/ning/http/client/AsyncHttpClient;->executeRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public executeRequest(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;
    .locals 5
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 485
    .local p2, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    iget-object v2, p0, Lcom/ning/http/client/AsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRequestFilters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 486
    iget-object v2, p0, Lcom/ning/http/client/AsyncHttpClient;->httpProvider:Lcom/ning/http/client/AsyncHttpProvider;

    invoke-interface {v2, p1, p2}, Lcom/ning/http/client/AsyncHttpProvider;->execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v2

    .line 497
    :goto_0
    return-object v2

    .line 489
    :cond_0
    new-instance v2, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct {v2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>()V

    invoke-virtual {v2, p2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->request(Lcom/ning/http/client/Request;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object v1

    .line 491
    .local v1, "fc":Lcom/ning/http/client/filter/FilterContext;, "Lcom/ning/http/client/filter/FilterContext<TT;>;"
    :try_start_0
    invoke-direct {p0, v1}, Lcom/ning/http/client/AsyncHttpClient;->preProcessRequest(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 497
    iget-object v2, p0, Lcom/ning/http/client/AsyncHttpClient;->httpProvider:Lcom/ning/http/client/AsyncHttpProvider;

    invoke-virtual {v1}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v3

    invoke-virtual {v1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/ning/http/client/AsyncHttpProvider;->execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v2

    goto :goto_0

    .line 492
    :catch_0
    move-exception v0

    .line 493
    .local v0, "e":Ljava/lang/Exception;
    invoke-interface {p2, v0}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V

    .line 494
    new-instance v2, Lcom/ning/http/client/ListenableFuture$CompletedFailure;

    const-string v3, "preProcessRequest failed"

    invoke-direct {v2, v3, v0}, Lcom/ning/http/client/ListenableFuture$CompletedFailure;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 361
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 362
    sget-object v0, Lcom/ning/http/client/AsyncHttpClient;->logger:Lorg/slf4j/Logger;

    const-string v1, "AsyncHttpClient.close() hasn\'t been invoked, which may produce file descriptor leaks"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 365
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 367
    return-void

    .line 365
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getConfig()Lcom/ning/http/client/AsyncHttpClientConfig;
    .locals 1

    .prologue
    .line 384
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    return-object v0
.end method

.method public getProvider()Lcom/ning/http/client/AsyncHttpProvider;
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->httpProvider:Lcom/ning/http/client/AsyncHttpProvider;

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 375
    iget-object v0, p0, Lcom/ning/http/client/AsyncHttpClient;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public prepareConnect(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 412
    const-string v0, "CONNECT"

    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public prepareDelete(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 462
    const-string v0, "DELETE"

    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public prepareGet(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 402
    const-string v0, "GET"

    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public prepareHead(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 432
    const-string v0, "HEAD"

    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public prepareOptions(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 422
    const-string v0, "OPTIONS"

    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public preparePost(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 442
    const-string v0, "POST"

    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public preparePut(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 452
    const-string v0, "PUT"

    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public prepareRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 1
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 472
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncHttpClient;->requestBuilder(Lcom/ning/http/client/Request;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected requestBuilder(Lcom/ning/http/client/Request;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 2
    .param p1, "prototype"    # Lcom/ning/http/client/Request;

    .prologue
    .line 580
    new-instance v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;-><init>(Lcom/ning/http/client/AsyncHttpClient;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHttpClient$1;)V

    iget-object v1, p0, Lcom/ning/http/client/AsyncHttpClient;->signatureCalculator:Lcom/ning/http/client/SignatureCalculator;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected requestBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;
    .locals 3
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 576
    new-instance v0, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    iget-object v1, p0, Lcom/ning/http/client/AsyncHttpClient;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isDisableUrlEncodingForBoundedRequests()Z

    move-result v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;-><init>(Lcom/ning/http/client/AsyncHttpClient;Ljava/lang/String;ZLcom/ning/http/client/AsyncHttpClient$1;)V

    invoke-virtual {v0, p2}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setUrl(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/AsyncHttpClient;->signatureCalculator:Lcom/ning/http/client/SignatureCalculator;

    invoke-virtual {v0, v1}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/AsyncHttpClient;
    .locals 0
    .param p1, "signatureCalculator"    # Lcom/ning/http/client/SignatureCalculator;

    .prologue
    .line 391
    iput-object p1, p0, Lcom/ning/http/client/AsyncHttpClient;->signatureCalculator:Lcom/ning/http/client/SignatureCalculator;

    .line 392
    return-object p0
.end method
