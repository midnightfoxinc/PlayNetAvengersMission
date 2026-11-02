.class public interface abstract Lcom/ning/http/client/AsyncHttpProvider;
.super Ljava/lang/Object;
.source "AsyncHttpProvider.java"


# virtual methods
.method public abstract close()V
.end method

.method public abstract execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;
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
.end method
