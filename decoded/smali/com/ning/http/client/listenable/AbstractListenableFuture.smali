.class public abstract Lcom/ning/http/client/listenable/AbstractListenableFuture;
.super Ljava/lang/Object;
.source "AbstractListenableFuture.java"

# interfaces
.implements Lcom/ning/http/client/ListenableFuture;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/ListenableFuture",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private final executionList:Lcom/ning/http/client/listenable/ExecutionList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    .local p0, "this":Lcom/ning/http/client/listenable/AbstractListenableFuture;, "Lcom/ning/http/client/listenable/AbstractListenableFuture<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lcom/ning/http/client/listenable/ExecutionList;

    invoke-direct {v0}, Lcom/ning/http/client/listenable/ExecutionList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/listenable/AbstractListenableFuture;->executionList:Lcom/ning/http/client/listenable/ExecutionList;

    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)Lcom/ning/http/client/ListenableFuture;
    .locals 1
    .param p1, "listener"    # Ljava/lang/Runnable;
    .param p2, "exec"    # Ljava/util/concurrent/Executor;
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

    .prologue
    .line 59
    .local p0, "this":Lcom/ning/http/client/listenable/AbstractListenableFuture;, "Lcom/ning/http/client/listenable/AbstractListenableFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/listenable/AbstractListenableFuture;->executionList:Lcom/ning/http/client/listenable/ExecutionList;

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/listenable/ExecutionList;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 60
    return-object p0
.end method

.method protected runListeners()V
    .locals 1

    .prologue
    .line 67
    .local p0, "this":Lcom/ning/http/client/listenable/AbstractListenableFuture;, "Lcom/ning/http/client/listenable/AbstractListenableFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/listenable/AbstractListenableFuture;->executionList:Lcom/ning/http/client/listenable/ExecutionList;

    invoke-virtual {v0}, Lcom/ning/http/client/listenable/ExecutionList;->run()V

    .line 68
    return-void
.end method
