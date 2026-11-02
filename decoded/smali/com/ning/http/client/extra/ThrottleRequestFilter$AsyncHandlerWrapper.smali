.class Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;
.super Ljava/lang/Object;
.source "ThrottleRequestFilter.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/extra/ThrottleRequestFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AsyncHandlerWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHandler",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final asyncHandler:Lcom/ning/http/client/AsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final complete:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic this$0:Lcom/ning/http/client/extra/ThrottleRequestFilter;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/extra/ThrottleRequestFilter;Lcom/ning/http/client/AsyncHandler;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;, "Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper<TT;>;"
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->this$0:Lcom/ning/http/client/extra/ThrottleRequestFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->complete:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 75
    iput-object p2, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 76
    return-void
.end method

.method private complete()V
    .locals 3

    .prologue
    .line 79
    .local p0, "this":Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;, "Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->complete:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->this$0:Lcom/ning/http/client/extra/ThrottleRequestFilter;

    invoke-static {v0}, Lcom/ning/http/client/extra/ThrottleRequestFilter;->access$000(Lcom/ning/http/client/extra/ThrottleRequestFilter;)Ljava/util/concurrent/Semaphore;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 81
    :cond_0
    invoke-static {}, Lcom/ning/http/client/extra/ThrottleRequestFilter;->access$100()Lorg/slf4j/Logger;

    move-result-object v0

    invoke-interface {v0}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 82
    invoke-static {}, Lcom/ning/http/client/extra/ThrottleRequestFilter;->access$100()Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "Current Throttling Status after onThrowable {}"

    iget-object v2, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->this$0:Lcom/ning/http/client/extra/ThrottleRequestFilter;

    invoke-static {v2}, Lcom/ning/http/client/extra/ThrottleRequestFilter;->access$000(Lcom/ning/http/client/extra/ThrottleRequestFilter;)Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    :cond_1
    return-void
.end method


# virtual methods
.method public onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "bodyPart"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;, "Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/AsyncHandler;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onCompleted()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "this":Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;, "Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper<TT;>;"
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0}, Lcom/ning/http/client/AsyncHandler;->onCompleted()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 115
    invoke-direct {p0}, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->complete()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->complete()V

    throw v0
.end method

.method public onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;, "Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/AsyncHandler;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "responseStatus"    # Lcom/ning/http/client/HttpResponseStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 102
    .local p0, "this":Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;, "Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/AsyncHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    return-object v0
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 89
    .local p0, "this":Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;, "Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper<TT;>;"
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    invoke-direct {p0}, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->complete()V

    .line 93
    return-void

    .line 91
    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;->complete()V

    throw v0
.end method
