.class public interface abstract Lcom/ning/http/client/ListenableFuture;
.super Ljava/lang/Object;
.source "ListenableFuture.java"

# interfaces
.implements Ljava/util/concurrent/Future;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/ListenableFuture$CompletedFailure;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future",
        "<TV;>;"
    }
.end annotation


# virtual methods
.method public abstract abort(Ljava/lang/Throwable;)V
.end method

.method public abstract addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)Lcom/ning/http/client/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/ning/http/client/ListenableFuture",
            "<TV;>;"
        }
    .end annotation
.end method

.method public abstract done()V
.end method

.method public abstract touch()V
.end method
