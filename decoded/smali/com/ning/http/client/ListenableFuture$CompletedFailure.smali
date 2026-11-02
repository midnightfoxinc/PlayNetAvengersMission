.class public Lcom/ning/http/client/ListenableFuture$CompletedFailure;
.super Ljava/lang/Object;
.source "ListenableFuture.java"

# interfaces
.implements Lcom/ning/http/client/ListenableFuture;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/ListenableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CompletedFailure"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/ListenableFuture",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final e:Ljava/util/concurrent/ExecutionException;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 94
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v0, p1, p2}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object v0, p0, Lcom/ning/http/client/ListenableFuture$CompletedFailure;->e:Ljava/util/concurrent/ExecutionException;

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 90
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v0, p1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    iput-object v0, p0, Lcom/ning/http/client/ListenableFuture$CompletedFailure;->e:Ljava/util/concurrent/ExecutionException;

    .line 92
    return-void
.end method


# virtual methods
.method public abort(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 129
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    return-void
.end method

.method public addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)Lcom/ning/http/client/ListenableFuture;
    .locals 0
    .param p1, "listener"    # Ljava/lang/Runnable;
    .param p2, "exec"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    invoke-interface {p2, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 138
    return-object p0
.end method

.method public cancel(Z)Z
    .locals 1
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 100
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public done()V
    .locals 0

    .prologue
    .line 125
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/ListenableFuture$CompletedFailure;->e:Ljava/util/concurrent/ExecutionException;

    throw v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
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
    .line 120
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/ListenableFuture$CompletedFailure;->e:Ljava/util/concurrent/ExecutionException;

    throw v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 105
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 110
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public touch()V
    .locals 0

    .prologue
    .line 133
    .local p0, "this":Lcom/ning/http/client/ListenableFuture$CompletedFailure;, "Lcom/ning/http/client/ListenableFuture$CompletedFailure<TT;>;"
    return-void
.end method
