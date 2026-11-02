.class public Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;
.super Lcom/ning/http/client/providers/jdk/JDKFuture;
.source "JDKDelegateFuture.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/ning/http/client/providers/jdk/JDKFuture",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private final delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/providers/jdk/JDKFuture",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ning/http/client/AsyncHandler;ILcom/ning/http/client/providers/jdk/JDKFuture;Ljava/net/HttpURLConnection;)V
    .locals 0
    .param p2, "responseTimeoutInMs"    # I
    .param p4, "urlConnection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHandler",
            "<TV;>;I",
            "Lcom/ning/http/client/providers/jdk/JDKFuture",
            "<TV;>;",
            "Ljava/net/HttpURLConnection;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;, "Lcom/ning/http/client/providers/jdk/JDKDelegateFuture<TV;>;"
    .local p1, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TV;>;"
    .local p3, "delegateFuture":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<TV;>;"
    invoke-direct {p0, p1, p2, p4}, Lcom/ning/http/client/providers/jdk/JDKFuture;-><init>(Lcom/ning/http/client/AsyncHandler;ILjava/net/HttpURLConnection;)V

    .line 30
    iput-object p3, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    .line 31
    return-void
.end method


# virtual methods
.method public abort(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;, "Lcom/ning/http/client/providers/jdk/JDKDelegateFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/jdk/JDKFuture;->abort(Ljava/lang/Throwable;)V

    .line 43
    return-void
.end method

.method public cancel(Z)Z
    .locals 1
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 46
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;, "Lcom/ning/http/client/providers/jdk/JDKDelegateFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/jdk/JDKFuture;->cancel(Z)Z

    .line 47
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result v0

    .line 50
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public done()V
    .locals 1

    .prologue
    .line 34
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;, "Lcom/ning/http/client/providers/jdk/JDKDelegateFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/jdk/JDKFuture;->done()V

    .line 35
    invoke-super {p0}, Lcom/ning/http/client/providers/jdk/JDKFuture;->done()V

    .line 36
    return-void
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 7
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
    .line 63
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;, "Lcom/ning/http/client/providers/jdk/JDKDelegateFuture<TV;>;"
    const/4 v0, 0x0

    .line 65
    .local v0, "content":Ljava/lang/Object;, "TV;"
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_0

    .line 66
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    invoke-interface {v2, p1, p2, p3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 76
    .end local v0    # "content":Ljava/lang/Object;, "TV;"
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->exception:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 77
    iget-object v3, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    new-instance v4, Ljava/util/concurrent/ExecutionException;

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->exception:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    invoke-direct {v4, v2}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v3, v4}, Lcom/ning/http/client/providers/jdk/JDKFuture;->abort(Ljava/lang/Throwable;)V

    .line 79
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    invoke-virtual {v2, v0}, Lcom/ning/http/client/providers/jdk/JDKFuture;->content(Ljava/lang/Object;)V

    .line 80
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/jdk/JDKFuture;->done()V

    .line 81
    :goto_1
    return-object v0

    .line 68
    .restart local v0    # "content":Ljava/lang/Object;, "TV;"
    :catch_0
    move-exception v1

    .line 69
    .local v1, "t":Ljava/lang/Throwable;
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_2

    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v2

    iget-object v4, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget v4, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->responseTimeoutInMs:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_2

    .line 70
    invoke-virtual {p0, p1, p2, p3}, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1

    .line 72
    :cond_2
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->timedOut:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 73
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->delegateFuture:Lcom/ning/http/client/providers/jdk/JDKFuture;

    invoke-virtual {v2, v1}, Lcom/ning/http/client/providers/jdk/JDKFuture;->abort(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 55
    .local p0, "this":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;, "Lcom/ning/http/client/providers/jdk/JDKDelegateFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;->innerFuture:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    .line 58
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
