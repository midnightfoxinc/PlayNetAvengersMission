.class public abstract Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$Feeder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseFeeder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;
    }
.end annotation


# instance fields
.field protected final feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;


# direct methods
.method protected constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V
    .locals 0
    .param p1, "feedableBodyGenerator"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .line 313
    return-void
.end method

.method private static block(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/impl/FutureImpl;)V
    .locals 6
    .param p0, "c"    # Lorg/glassfish/grizzly/Connection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/glassfish/grizzly/Connection;",
            "Lorg/glassfish/grizzly/impl/FutureImpl",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 369
    .local p1, "future":Lorg/glassfish/grizzly/impl/FutureImpl;, "Lorg/glassfish/grizzly/impl/FutureImpl<Ljava/lang/Boolean;>;"
    :try_start_0
    invoke-interface {p0}, Lorg/glassfish/grizzly/Connection;->getTransport()Lorg/glassfish/grizzly/Transport;

    move-result-object v1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v4}, Lorg/glassfish/grizzly/Transport;->getWriteTimeout(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    .line 371
    .local v2, "writeTimeout":J
    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 372
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p1, v2, v3, v1}, Lorg/glassfish/grizzly/impl/FutureImpl;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 381
    .end local v2    # "writeTimeout":J
    :goto_0
    return-void

    .line 374
    .restart local v2    # "writeTimeout":J
    :cond_0
    invoke-interface {p1}, Lorg/glassfish/grizzly/impl/FutureImpl;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 376
    .end local v2    # "writeTimeout":J
    :catch_0
    move-exception v0

    .line 377
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    invoke-static {p0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 378
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v0

    .line 379
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {p0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static blockUntilQueueFree(Lorg/glassfish/grizzly/Connection;)V
    .locals 2
    .param p0, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 345
    invoke-interface {p0}, Lorg/glassfish/grizzly/Connection;->canWrite()Z

    move-result v1

    if-nez v1, :cond_0

    .line 346
    invoke-static {}, Lorg/glassfish/grizzly/utils/Futures;->createSafeFuture()Lorg/glassfish/grizzly/impl/FutureImpl;

    move-result-object v0

    .line 349
    .local v0, "future":Lorg/glassfish/grizzly/impl/FutureImpl;, "Lorg/glassfish/grizzly/impl/FutureImpl<Ljava/lang/Boolean;>;"
    new-instance v1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$1;

    invoke-direct {v1, v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$1;-><init>(Lorg/glassfish/grizzly/impl/FutureImpl;)V

    invoke-interface {p0, v1}, Lorg/glassfish/grizzly/Connection;->notifyCanWrite(Lorg/glassfish/grizzly/WriteHandler;)V

    .line 362
    invoke-static {p0, v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->block(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/impl/FutureImpl;)V

    .line 364
    .end local v0    # "future":Lorg/glassfish/grizzly/impl/FutureImpl;, "Lorg/glassfish/grizzly/impl/FutureImpl<Ljava/lang/Boolean;>;"
    :cond_0
    return-void
.end method


# virtual methods
.method public final declared-synchronized feed(Lorg/glassfish/grizzly/Buffer;Z)V
    .locals 4
    .param p1, "buffer"    # Lorg/glassfish/grizzly/Buffer;
    .param p2, "last"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 323
    monitor-enter p0

    if-nez p1, :cond_0

    .line 324
    :try_start_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Buffer argument cannot be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 327
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$600(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 328
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Asynchronous transfer has not been initiated."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 330
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v2

    invoke-virtual {v2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->blockUntilQueueFree(Lorg/glassfish/grizzly/Connection;)V

    .line 331
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$500(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->content(Lorg/glassfish/grizzly/Buffer;)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->last(Z)Lorg/glassfish/grizzly/http/HttpContent$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lorg/glassfish/grizzly/http/HttpContent$Builder;->build()Lorg/glassfish/grizzly/http/HttpContent;

    move-result-object v0

    .line 333
    .local v0, "content":Lorg/glassfish/grizzly/http/HttpContent;
    if-eqz p2, :cond_2

    new-instance v1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V

    .line 335
    .local v1, "handler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/WriteResult;>;"
    :cond_2
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 336
    monitor-exit p0

    return-void
.end method
