.class final Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;
.super Lcom/ning/http/client/listenable/AbstractListenableFuture;
.source "GrizzlyResponseFuture.java"

# interfaces
.implements Lorg/glassfish/grizzly/CompletionHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/ning/http/client/listenable/AbstractListenableFuture",
        "<TV;>;",
        "Lorg/glassfish/grizzly/CompletionHandler",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private connection:Lorg/glassfish/grizzly/Connection;

.field private final delegate:Lorg/glassfish/grizzly/impl/FutureImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/impl/FutureImpl",
            "<TV;>;"
        }
    .end annotation
.end field

.field private final handler:Lcom/ning/http/client/AsyncHandler;

.field private final provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

.field private final proxy:Lcom/ning/http/client/ProxyServer;

.field private final request:Lcom/ning/http/client/Request;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/ProxyServer;)V
    .locals 1
    .param p1, "provider"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p3, "handler"    # Lcom/ning/http/client/AsyncHandler;
    .param p4, "proxy"    # Lcom/ning/http/client/ProxyServer;

    .prologue
    .line 56
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    invoke-direct {p0}, Lcom/ning/http/client/listenable/AbstractListenableFuture;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .line 59
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->request:Lcom/ning/http/client/Request;

    .line 60
    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 61
    iput-object p4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->proxy:Lcom/ning/http/client/ProxyServer;

    .line 63
    invoke-static {}, Lorg/glassfish/grizzly/utils/Futures;->createSafeFuture()Lorg/glassfish/grizzly/impl/FutureImpl;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    .line 64
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0, p0}, Lorg/glassfish/grizzly/impl/FutureImpl;->addCompletionHandler(Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 65
    return-void
.end method

.method private closeConnection()V
    .locals 1

    .prologue
    .line 196
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->connection:Lorg/glassfish/grizzly/Connection;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->connection:Lorg/glassfish/grizzly/Connection;

    invoke-interface {v0}, Lorg/glassfish/grizzly/Connection;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->connection:Lorg/glassfish/grizzly/Connection;

    invoke-interface {v0}, Lorg/glassfish/grizzly/Connection;->closeSilently()V

    .line 200
    :cond_0
    return-void
.end method


# virtual methods
.method public abort(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 81
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/impl/FutureImpl;->failure(Ljava/lang/Throwable;)V

    .line 83
    return-void
.end method

.method public cancel(Z)Z
    .locals 1
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 114
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/impl/FutureImpl;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public cancelled()V
    .locals 2

    .prologue
    .line 149
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->handler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v0, :cond_0

    .line 151
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->handler:Lcom/ning/http/client/AsyncHandler;

    new-instance v1, Ljava/util/concurrent/CancellationException;

    invoke-direct {v1}, Ljava/util/concurrent/CancellationException;-><init>()V

    invoke-interface {v0, v1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->runListeners()V

    .line 157
    return-void

    .line 152
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public completed(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    .local p1, "result":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->runListeners()V

    .line 175
    return-void
.end method

.method public done()V
    .locals 1

    .prologue
    .line 72
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->done(Ljava/lang/Object;)V

    .line 73
    return-void
.end method

.method public done(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    .local p1, "result":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/impl/FutureImpl;->result(Ljava/lang/Object;)V

    .line 77
    return-void
.end method

.method public failed(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 161
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->handler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v0, :cond_0

    .line 163
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->handler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->closeConnection()V

    .line 169
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->runListeners()V

    .line 170
    return-void

    .line 164
    :catch_0
    move-exception v0

    goto :goto_0
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
    .line 134
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0}, Lorg/glassfish/grizzly/impl/FutureImpl;->get()Ljava/lang/Object;

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
    .line 141
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0, p1, p2, p3}, Lorg/glassfish/grizzly/impl/FutureImpl;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAndSetWriteBody(Z)Z
    .locals 0
    .param p1, "writeBody"    # Z

    .prologue
    .line 105
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    return p1
.end method

.method public getAndSetWriteHeaders(Z)Z
    .locals 0
    .param p1, "writeHeaders"    # Z

    .prologue
    .line 96
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    return p1
.end method

.method public getProxy()Lcom/ning/http/client/ProxyServer;
    .locals 1

    .prologue
    .line 203
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->proxy:Lcom/ning/http/client/ProxyServer;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 120
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0}, Lorg/glassfish/grizzly/impl/FutureImpl;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 127
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->delegate:Lorg/glassfish/grizzly/impl/FutureImpl;

    invoke-interface {v0}, Lorg/glassfish/grizzly/impl/FutureImpl;->isDone()Z

    move-result v0

    return v0
.end method

.method setConnection(Lorg/glassfish/grizzly/Connection;)V
    .locals 0
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 186
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->connection:Lorg/glassfish/grizzly/Connection;

    .line 188
    return-void
.end method

.method public touch()V
    .locals 3

    .prologue
    .line 87
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->provider:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->connection:Lorg/glassfish/grizzly/Connection;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->request:Lcom/ning/http/client/Request;

    invoke-virtual {v0, v1, v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->touchConnection(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;)V

    .line 89
    return-void
.end method

.method public updated(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 179
    .local p0, "this":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TV;>;"
    .local p1, "result":Ljava/lang/Object;, "TV;"
    return-void
.end method
