.class public final Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
.super Lcom/ning/http/client/listenable/AbstractListenableFuture;
.source "NettyResponseFuture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;
    }
.end annotation

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
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private allowConnect:Z

.field private asyncHandler:Lcom/ning/http/client/AsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHandler",
            "<TV;>;"
        }
    .end annotation
.end field

.field private channel:Lorg/jboss/netty/channel/Channel;

.field private final connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

.field private final content:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<TV;>;"
        }
    .end annotation
.end field

.field private final contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final currentRetry:Ljava/util/concurrent/atomic/AtomicInteger;

.field private dontWriteBodyBecauseExpectContinue:Z

.field private final exEx:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/concurrent/ExecutionException;",
            ">;"
        }
    .end annotation
.end field

.field private headersAlreadyWrittenOnContinue:Z

.field private httpHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

.field private final inAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private keepAlive:Z

.field private final latch:Ljava/util/concurrent/CountDownLatch;

.field private final maxRetry:I

.field private nettyRequest:Lcom/ning/http/client/providers/netty/request/NettyRequest;

.field private final onThrowableCalled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final proxyServer:Lcom/ning/http/client/ProxyServer;

.field private final redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private request:Lcom/ning/http/client/Request;

.field private reuseChannel:Z

.field private final start:J

.field private final state:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;",
            ">;"
        }
    .end annotation
.end field

.field private final statusReceived:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private streamWasAlreadyConsumed:Z

.field private volatile timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

.field private final touch:Ljava/util/concurrent/atomic/AtomicLong;

.field private uri:Lcom/ning/http/client/uri/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/request/NettyRequest;ILcom/ning/http/client/ConnectionPoolPartitioning;Lcom/ning/http/client/ProxyServer;)V
    .locals 6
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p4, "nettyRequest"    # Lcom/ning/http/client/providers/netty/request/NettyRequest;
    .param p5, "maxRetry"    # I
    .param p6, "connectionPoolPartitioning"    # Lcom/ning/http/client/ConnectionPoolPartitioning;
    .param p7, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/uri/Uri;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TV;>;",
            "Lcom/ning/http/client/providers/netty/request/NettyRequest;",
            "I",
            "Lcom/ning/http/client/ConnectionPoolPartitioning;",
            "Lcom/ning/http/client/ProxyServer;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    .local p3, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TV;>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 100
    invoke-direct {p0}, Lcom/ning/http/client/listenable/AbstractListenableFuture;-><init>()V

    .line 58
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->start:J

    .line 62
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v5}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 67
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 68
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 69
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->inAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->statusReceived:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 71
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->state:Ljava/util/concurrent/atomic/AtomicReference;

    .line 73
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 74
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->currentRetry:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 75
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->onThrowableCalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 76
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->content:Ljava/util/concurrent/atomic/AtomicReference;

    .line 77
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->exEx:Ljava/util/concurrent/atomic/AtomicReference;

    .line 83
    iput-boolean v5, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->keepAlive:Z

    .line 102
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 103
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->request:Lcom/ning/http/client/Request;

    .line 104
    iput-object p4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->nettyRequest:Lcom/ning/http/client/providers/netty/request/NettyRequest;

    .line 105
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->uri:Lcom/ning/http/client/uri/Uri;

    .line 106
    iput-object p6, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    .line 107
    iput-object p7, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->proxyServer:Lcom/ning/http/client/ProxyServer;

    .line 108
    iput p5, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->maxRetry:I

    .line 109
    return-void
.end method

.method private getContent()Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    const/4 v6, 0x1

    .line 165
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 166
    new-instance v4, Ljava/util/concurrent/CancellationException;

    invoke-direct {v4}, Ljava/util/concurrent/CancellationException;-><init>()V

    throw v4

    .line 168
    :cond_0
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->exEx:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ExecutionException;

    .line 169
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    if-eqz v0, :cond_1

    .line 170
    throw v0

    .line 172
    :cond_1
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->content:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    .line 174
    .local v3, "update":Ljava/lang/Object;, "TV;"
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->currentRetry:Ljava/util/concurrent/atomic/AtomicInteger;

    iget v5, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->maxRetry:I

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 175
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->contentProcessed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v4

    if-nez v4, :cond_3

    .line 177
    :try_start_0
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v4}, Lcom/ning/http/client/AsyncHandler;->onCompleted()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 192
    :cond_2
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->content:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    :cond_3
    return-object v3

    .line 178
    :catch_0
    move-exception v1

    .line 179
    .local v1, "ex":Ljava/lang/Throwable;
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->onThrowableCalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v4

    if-nez v4, :cond_2

    .line 182
    :try_start_1
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v4, v1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 186
    :goto_0
    :try_start_2
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 188
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->cancelTimeouts()V

    throw v4

    .line 183
    :catch_1
    move-exception v2

    .line 184
    .local v2, "t":Ljava/lang/Throwable;
    :try_start_3
    sget-object v4, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "asyncHandler.onThrowable"

    invoke-interface {v4, v5, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method private terminateAndExit()Z
    .locals 2

    .prologue
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    const/4 v0, 0x1

    .line 202
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->cancelTimeouts()V

    .line 203
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final abort(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 229
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->exEx:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    new-instance v3, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v3, p1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 231
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->terminateAndExit()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 243
    :goto_0
    return-void

    .line 234
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->onThrowableCalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 236
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v1, p1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 242
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->runListeners()V

    goto :goto_0

    .line 237
    :catch_0
    move-exception v0

    .line 238
    .local v0, "te":Ljava/lang/Throwable;
    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "asyncHandler.onThrowable"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public attachChannel(Lorg/jboss/netty/channel/Channel;Z)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "reuseChannel"    # Z

    .prologue
    .line 384
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 385
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 388
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    .line 389
    iput-boolean p2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->reuseChannel:Z

    .line 390
    return-void
.end method

.method public canBeReplayed()Z
    .locals 2

    .prologue
    .line 419
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->canRetry()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v0}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isInAuth()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canRetry()Z
    .locals 2

    .prologue
    .line 401
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->maxRetry:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->currentRetry:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iget v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->maxRetry:I

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public cancel(Z)Z
    .locals 4
    .param p1, "force"    # Z

    .prologue
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    const/4 v1, 0x1

    .line 127
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->cancelTimeouts()V

    .line 129
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    const/4 v1, 0x0

    .line 147
    :goto_0
    return v1

    .line 133
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    if-eqz v2, :cond_1

    .line 134
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/Channels;->setDiscard(Lorg/jboss/netty/channel/Channel;)V

    .line 135
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 138
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->onThrowableCalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-nez v2, :cond_2

    .line 140
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    new-instance v3, Ljava/util/concurrent/CancellationException;

    invoke-direct {v3}, Ljava/util/concurrent/CancellationException;-><init>()V

    invoke-interface {v2, v3}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 146
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->runListeners()V

    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v2, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "cancel"

    invoke-interface {v2, v3, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public cancelTimeouts()V
    .locals 1

    .prologue
    .line 275
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;->cancel()V

    .line 277
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    .line 279
    :cond_0
    return-void
.end method

.method public channel()Lorg/jboss/netty/channel/Channel;
    .locals 1

    .prologue
    .line 393
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    return-object v0
.end method

.method public final done()V
    .locals 5

    .prologue
    .line 208
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->terminateAndExit()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 225
    :goto_0
    return-void

    .line 212
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getContent()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 221
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 224
    :goto_1
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->runListeners()V

    goto :goto_0

    .line 214
    :catch_0
    move-exception v1

    .line 221
    .local v1, "t":Ljava/util/concurrent/ExecutionException;
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_0

    .line 216
    .end local v1    # "t":Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v1

    .line 217
    .local v1, "t":Ljava/lang/RuntimeException;
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 218
    .local v0, "exception":Ljava/lang/Throwable;
    :goto_2
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->exEx:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v3, 0x0

    new-instance v4, Ljava/util/concurrent/ExecutionException;

    invoke-direct {v4, v0}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 221
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_1

    .end local v0    # "exception":Ljava/lang/Throwable;
    :cond_1
    move-object v0, v1

    .line 217
    goto :goto_2

    .line 221
    .end local v1    # "t":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    throw v2
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
    .line 152
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 153
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getContent()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 1
    .param p1, "l"    # J
    .param p3, "tu"    # Ljava/util/concurrent/TimeUnit;
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
            Ljava/util/concurrent/TimeoutException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 159
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v0}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v0

    .line 160
    :cond_0
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getContent()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAndSetAuth(Z)Z
    .locals 1
    .param p1, "inDigestAuth"    # Z

    .prologue
    .line 326
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->inAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    return v0
.end method

.method public getAndSetStatusReceived(Z)Z
    .locals 1
    .param p1, "sr"    # Z

    .prologue
    .line 338
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->statusReceived:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    return v0
.end method

.method public final getAsyncHandler()Lcom/ning/http/client/AsyncHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/ning/http/client/AsyncHandler",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 294
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    return-object v0
.end method

.method public getChannelRemoteAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 405
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getConnectionPoolPartitioning()Lcom/ning/http/client/ConnectionPoolPartitioning;
    .locals 1

    .prologue
    .line 263
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    return-object v0
.end method

.method public final getHttpHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1

    .prologue
    .line 306
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->httpHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    return-object v0
.end method

.method public getLastTouch()J
    .locals 2

    .prologue
    .line 350
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public final getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;
    .locals 1

    .prologue
    .line 286
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->nettyRequest:Lcom/ning/http/client/providers/netty/request/NettyRequest;

    return-object v0
.end method

.method public getPartition()Ljava/lang/String;
    .locals 3

    .prologue
    .line 428
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->connectionPoolPartitioning:Lcom/ning/http/client/ConnectionPoolPartitioning;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->uri:Lcom/ning/http/client/uri/Uri;

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->proxyServer:Lcom/ning/http/client/ProxyServer;

    invoke-interface {v0, v1, v2}, Lcom/ning/http/client/ConnectionPoolPartitioning;->getPartitionId(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/ProxyServer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProxyServer()Lcom/ning/http/client/ProxyServer;
    .locals 1

    .prologue
    .line 267
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->proxyServer:Lcom/ning/http/client/ProxyServer;

    return-object v0
.end method

.method public final getRequest()Lcom/ning/http/client/Request;
    .locals 1

    .prologue
    .line 282
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->request:Lcom/ning/http/client/Request;

    return-object v0
.end method

.method public getStart()J
    .locals 2

    .prologue
    .line 424
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->start:J

    return-wide v0
.end method

.method public getState()Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;
    .locals 1

    .prologue
    .line 330
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    return-object v0
.end method

.method public getUri()Lcom/ning/http/client/uri/Uri;
    .locals 1

    .prologue
    .line 255
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->uri:Lcom/ning/http/client/uri/Uri;

    return-object v0
.end method

.method public incrementAndGetCurrentRedirectCount()I
    .locals 1

    .prologue
    .line 314
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    return v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 122
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isConnectAllowed()Z
    .locals 1

    .prologue
    .line 374
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->allowConnect:Z

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 117
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDontWriteBodyBecauseExpectContinue()Z
    .locals 1

    .prologue
    .line 366
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->dontWriteBodyBecauseExpectContinue:Z

    return v0
.end method

.method public isHeadersAlreadyWrittenOnContinue()Z
    .locals 1

    .prologue
    .line 358
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->headersAlreadyWrittenOnContinue:Z

    return v0
.end method

.method public isInAuth()Z
    .locals 1

    .prologue
    .line 322
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->inAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public final isKeepAlive()Z
    .locals 1

    .prologue
    .line 298
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->keepAlive:Z

    return v0
.end method

.method public isStreamWasAlreadyConsumed()Z
    .locals 1

    .prologue
    .line 342
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->streamWasAlreadyConsumed:Z

    return v0
.end method

.method public reuseChannel()Z
    .locals 1

    .prologue
    .line 397
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->reuseChannel:Z

    return v0
.end method

.method public setAsyncHandler(Lcom/ning/http/client/AsyncHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHandler",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 271
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    .local p1, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 272
    return-void
.end method

.method public setConnectAllowed(Z)V
    .locals 0
    .param p1, "allowConnect"    # Z

    .prologue
    .line 378
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->allowConnect:Z

    .line 379
    return-void
.end method

.method public setDontWriteBodyBecauseExpectContinue(Z)V
    .locals 0
    .param p1, "dontWriteBodyBecauseExpectContinue"    # Z

    .prologue
    .line 362
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->dontWriteBodyBecauseExpectContinue:Z

    .line 363
    return-void
.end method

.method public setHeadersAlreadyWrittenOnContinue(Z)V
    .locals 0
    .param p1, "headersAlreadyWrittenOnContinue"    # Z

    .prologue
    .line 354
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->headersAlreadyWrittenOnContinue:Z

    .line 355
    return-void
.end method

.method public final setHttpHeaders(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V
    .locals 0
    .param p1, "httpHeaders"    # Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .prologue
    .line 310
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->httpHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 311
    return-void
.end method

.method public final setKeepAlive(Z)V
    .locals 0
    .param p1, "keepAlive"    # Z

    .prologue
    .line 302
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->keepAlive:Z

    .line 303
    return-void
.end method

.method public final setNettyRequest(Lcom/ning/http/client/providers/netty/request/NettyRequest;)V
    .locals 0
    .param p1, "nettyRequest"    # Lcom/ning/http/client/providers/netty/request/NettyRequest;

    .prologue
    .line 290
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->nettyRequest:Lcom/ning/http/client/providers/netty/request/NettyRequest;

    .line 291
    return-void
.end method

.method public setRequest(Lcom/ning/http/client/Request;)V
    .locals 0
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .line 409
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->request:Lcom/ning/http/client/Request;

    .line 410
    return-void
.end method

.method public setReuseChannel(Z)V
    .locals 0
    .param p1, "reuseChannel"    # Z

    .prologue
    .line 370
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->reuseChannel:Z

    .line 371
    return-void
.end method

.method public setState(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;)V
    .locals 1
    .param p1, "state"    # Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    .prologue
    .line 334
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 335
    return-void
.end method

.method public setStreamWasAlreadyConsumed(Z)V
    .locals 0
    .param p1, "streamWasAlreadyConsumed"    # Z

    .prologue
    .line 346
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-boolean p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->streamWasAlreadyConsumed:Z

    .line 347
    return-void
.end method

.method public setTimeoutsHolder(Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;)V
    .locals 0
    .param p1, "timeoutsHolder"    # Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    .prologue
    .line 318
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    .line 319
    return-void
.end method

.method public setUri(Lcom/ning/http/client/uri/Uri;)V
    .locals 0
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;

    .prologue
    .line 259
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->uri:Lcom/ning/http/client/uri/Uri;

    .line 260
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 433
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NettyResponseFuture{currentRetry="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->currentRetry:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tisDone="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tisCancelled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tasyncHandler="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tnettyRequest="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->nettyRequest:Lcom/ning/http/client/providers/netty/request/NettyRequest;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tcontent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->content:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\turi="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->uri:Lcom/ning/http/client/uri/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tkeepAlive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->keepAlive:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\thttpHeaders="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->httpHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\texEx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->exEx:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tredirectCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->redirectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\ttimeoutsHolder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->timeoutsHolder:Lcom/ning/http/client/providers/netty/request/timeout/TimeoutsHolder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tinAuth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->inAuth:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\tstatusReceived="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->statusReceived:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",\n\ttouch="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public touch()V
    .locals 4

    .prologue
    .line 247
    .local p0, "this":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TV;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 248
    return-void
.end method
