.class public Lcom/ning/http/client/providers/jdk/JDKFuture;
.super Lcom/ning/http/client/listenable/AbstractListenableFuture;
.source "JDKFuture.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/ning/http/client/listenable/AbstractListenableFuture",
        "<TV;>;"
    }
.end annotation


# static fields
.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field protected final asyncHandler:Lcom/ning/http/client/AsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHandler",
            "<TV;>;"
        }
    .end annotation
.end field

.field protected final cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected final contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected final exception:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field protected innerFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<TV;>;"
        }
    .end annotation
.end field

.field protected final isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected final responseTimeoutInMs:I

.field protected final timedOut:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected final touch:Ljava/util/concurrent/atomic/AtomicLong;

.field protected final urlConnection:Ljava/net/HttpURLConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/ning/http/client/providers/jdk/JDKFuture;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/jdk/JDKFuture;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHandler;ILjava/net/HttpURLConnection;)V
    .locals 4
    .param p2, "responseTimeoutInMs"    # I
    .param p3, "urlConnection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHandler",
            "<TV;>;I",
            "Ljava/net/HttpURLConnection;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    .local p1, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TV;>;"
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Lcom/ning/http/client/listenable/AbstractListenableFuture;-><init>()V

    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->timedOut:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 44
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->exception:Ljava/util/concurrent/atomic/AtomicReference;

    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 50
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 51
    iput p2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->responseTimeoutInMs:I

    .line 52
    iput-object p3, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->urlConnection:Ljava/net/HttpURLConnection;

    .line 53
    return-void
.end method


# virtual methods
.method public abort(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 65
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->exception:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 66
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 69
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->timedOut:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_1

    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v1, p1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/ning/http/client/providers/jdk/JDKFuture;->runListeners()V

    .line 77
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "te":Ljava/lang/Throwable;
    sget-object v1, Lcom/ning/http/client/providers/jdk/JDKFuture;->logger:Lorg/slf4j/Logger;

    const-string v2, "asyncHandler.onThrowable"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public cancel(Z)Z
    .locals 3
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 83
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_0

    .line 84
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 86
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    new-instance v2, Ljava/util/concurrent/CancellationException;

    invoke-direct {v2}, Ljava/util/concurrent/CancellationException;-><init>()V

    invoke-interface {v1, v2}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :goto_0
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 91
    invoke-virtual {p0}, Lcom/ning/http/client/providers/jdk/JDKFuture;->runListeners()V

    .line 92
    iget-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    invoke-interface {v1, p1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result v1

    .line 95
    :goto_1
    return v1

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "te":Ljava/lang/Throwable;
    sget-object v1, Lcom/ning/http/client/providers/jdk/JDKFuture;->logger:Lorg/slf4j/Logger;

    const-string v2, "asyncHandler.onThrowable"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 94
    .end local v0    # "te":Ljava/lang/Throwable;
    :cond_0
    invoke-virtual {p0}, Lcom/ning/http/client/providers/jdk/JDKFuture;->runListeners()V

    .line 95
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public content(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    .local p1, "v":Ljava/lang/Object;, "TV;"
    return-void
.end method

.method public done()V
    .locals 2

    .prologue
    .line 60
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 61
    invoke-virtual {p0}, Lcom/ning/http/client/providers/jdk/JDKFuture;->runListeners()V

    .line 62
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    :try_start_0
    iget v1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->responseTimeoutInMs:I

    int-to-long v2, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v2, v3, v1}, Lcom/ning/http/client/providers/jdk/JDKFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/util/concurrent/TimeoutException;
    new-instance v1, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v1, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 9
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    const/4 v6, 0x1

    .line 121
    const/4 v0, 0x0

    .line 123
    .local v0, "content":Ljava/lang/Object;, "TV;"
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_0

    .line 124
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    invoke-interface {v2, p1, p2, p3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 138
    .end local v0    # "content":Ljava/lang/Object;, "TV;"
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->exception:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 139
    new-instance v3, Ljava/util/concurrent/ExecutionException;

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->exception:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    invoke-direct {v3, v2}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 126
    .restart local v0    # "content":Ljava/lang/Object;, "TV;"
    :catch_0
    move-exception v1

    .line 127
    .local v1, "t":Ljava/util/concurrent/TimeoutException;
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_2

    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v2

    iget-object v4, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget v4, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->responseTimeoutInMs:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_2

    .line 128
    invoke-virtual {p0, p1, p2, p3}, Lcom/ning/http/client/providers/jdk/JDKFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    .line 141
    .end local v0    # "content":Ljava/lang/Object;, "TV;"
    .end local v1    # "t":Ljava/util/concurrent/TimeoutException;
    :cond_1
    return-object v0

    .line 131
    .restart local v0    # "content":Ljava/lang/Object;, "TV;"
    .restart local v1    # "t":Ljava/util/concurrent/TimeoutException;
    :cond_2
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->exception:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 132
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->timedOut:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 133
    new-instance v2, Ljava/util/concurrent/ExecutionException;

    new-instance v3, Ljava/util/concurrent/TimeoutException;

    const-string v4, "No response received after %s"

    new-array v5, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->responseTimeoutInMs:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 135
    .end local v1    # "t":Ljava/util/concurrent/TimeoutException;
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public hasExpired()Z
    .locals 4

    .prologue
    .line 150
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    iget v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->responseTimeoutInMs:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v0

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iget v2, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->responseTimeoutInMs:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 100
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    .line 103
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDone()Z
    .locals 2

    .prologue
    .line 108
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 109
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v0

    return v0
.end method

.method protected setInnerFuture(Ljava/util/concurrent/Future;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    .local p1, "innerFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->innerFuture:Ljava/util/concurrent/Future;

    .line 57
    return-void
.end method

.method public touch()V
    .locals 4

    .prologue
    .line 155
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 156
    return-void
.end method
