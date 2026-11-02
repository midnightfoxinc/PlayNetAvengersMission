.class final Lcom/ning/http/client/extra/ListenableFutureAdapter$1;
.super Ljava/lang/Object;
.source "ListenableFutureAdapter.java"

# interfaces
.implements Lcom/google/common/util/concurrent/ListenableFuture;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/extra/ListenableFutureAdapter;->asGuavaFuture(Lcom/ning/http/client/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/util/concurrent/ListenableFuture",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic val$future:Lcom/ning/http/client/ListenableFuture;


# direct methods
.method constructor <init>(Lcom/ning/http/client/ListenableFuture;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;->val$future:Lcom/ning/http/client/ListenableFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;->val$future:Lcom/ning/http/client/ListenableFuture;

    invoke-interface {v0, p1, p2}, Lcom/ning/http/client/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)Lcom/ning/http/client/ListenableFuture;

    .line 54
    return-void
.end method

.method public cancel(Z)Z
    .locals 1
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 33
    iget-object v0, p0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;->val$future:Lcom/ning/http/client/ListenableFuture;

    invoke-interface {v0, p1}, Lcom/ning/http/client/ListenableFuture;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
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
    .line 37
    iget-object v0, p0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;->val$future:Lcom/ning/http/client/ListenableFuture;

    invoke-interface {v0}, Lcom/ning/http/client/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
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
    .line 41
    iget-object v0, p0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;->val$future:Lcom/ning/http/client/ListenableFuture;

    invoke-interface {v0, p1, p2, p3}, Lcom/ning/http/client/ListenableFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;->val$future:Lcom/ning/http/client/ListenableFuture;

    invoke-interface {v0}, Lcom/ning/http/client/ListenableFuture;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;->val$future:Lcom/ning/http/client/ListenableFuture;

    invoke-interface {v0}, Lcom/ning/http/client/ListenableFuture;->isDone()Z

    move-result v0

    return v0
.end method
