.class public final Lcom/ning/http/client/extra/ListenableFutureAdapter;
.super Ljava/lang/Object;
.source "ListenableFutureAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asGuavaFuture(Lcom/ning/http/client/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/ListenableFuture",
            "<TV;>;)",
            "Lcom/google/common/util/concurrent/ListenableFuture",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "future":Lcom/ning/http/client/ListenableFuture;, "Lcom/ning/http/client/ListenableFuture<TV;>;"
    new-instance v0, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;

    invoke-direct {v0, p0}, Lcom/ning/http/client/extra/ListenableFutureAdapter$1;-><init>(Lcom/ning/http/client/ListenableFuture;)V

    return-object v0
.end method
