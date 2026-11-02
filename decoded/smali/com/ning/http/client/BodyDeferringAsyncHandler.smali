.class public Lcom/ning/http/client/BodyDeferringAsyncHandler;
.super Ljava/lang/Object;
.source "BodyDeferringAsyncHandler.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/BodyDeferringAsyncHandler$BodyDeferringInputStream;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHandler",
        "<",
        "Lcom/ning/http/client/Response;",
        ">;"
    }
.end annotation


# instance fields
.field private final headersArrived:Ljava/util/concurrent/CountDownLatch;

.field private final output:Ljava/io/OutputStream;

.field private volatile response:Lcom/ning/http/client/Response;

.field private final responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

.field private responseSet:Z

.field private final semaphore:Ljava/util/concurrent/Semaphore;

.field private volatile throwable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    const/4 v1, 0x1

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-direct {v0}, Lcom/ning/http/client/Response$ResponseBuilder;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    .line 79
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->headersArrived:Ljava/util/concurrent/CountDownLatch;

    .line 89
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 92
    iput-object p1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->output:Ljava/io/OutputStream;

    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseSet:Z

    .line 94
    return-void
.end method


# virtual methods
.method protected closeOut()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 151
    return-void

    .line 149
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v0
.end method

.method public getResponse()Lcom/ning/http/client/Response;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->headersArrived:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 210
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 211
    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->throwable:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 212
    new-instance v0, Ljava/io/IOException;

    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->throwable:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 213
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->throwable:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 214
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    throw v1

    .line 216
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->response:Lcom/ning/http/client/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 219
    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    return-object v1
.end method

.method public onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "bodyPart"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 135
    iget-boolean v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseSet:Z

    if-nez v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0}, Lcom/ning/http/client/Response$ResponseBuilder;->build()Lcom/ning/http/client/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->response:Lcom/ning/http/client/Response;

    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseSet:Z

    .line 138
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->headersArrived:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->output:Ljava/io/OutputStream;

    invoke-virtual {p1, v0}, Lcom/ning/http/client/HttpResponseBodyPart;->writeTo(Ljava/io/OutputStream;)I

    .line 142
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onCompleted()Lcom/ning/http/client/Response;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    iget-boolean v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseSet:Z

    if-nez v2, :cond_0

    .line 156
    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v2}, Lcom/ning/http/client/Response$ResponseBuilder;->build()Lcom/ning/http/client/Response;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->response:Lcom/ning/http/client/Response;

    .line 157
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseSet:Z

    .line 166
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->headersArrived:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 168
    invoke-virtual {p0}, Lcom/ning/http/client/BodyDeferringAsyncHandler;->closeOut()V

    .line 171
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 172
    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->throwable:Ljava/lang/Throwable;

    if-eqz v2, :cond_1

    .line 173
    new-instance v1, Ljava/io/IOException;

    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->throwable:Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 174
    .local v1, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->throwable:Ljava/lang/Throwable;

    invoke-virtual {v1, v2}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 175
    throw v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    .end local v1    # "ioe":Ljava/io/IOException;
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v2, 0x0

    .line 183
    iget-object v3, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_0
    return-object v2

    .line 178
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v2}, Lcom/ning/http/client/Response$ResponseBuilder;->build()Lcom/ning/http/client/Response;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 183
    iget-object v3, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0

    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    throw v2
.end method

.method public bridge synthetic onCompleted()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/ning/http/client/BodyDeferringAsyncHandler;->onCompleted()Lcom/ning/http/client/Response;

    move-result-object v0

    return-object v0
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
    .line 128
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 129
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

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
    .line 121
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0}, Lcom/ning/http/client/Response$ResponseBuilder;->reset()V

    .line 122
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 123
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->throwable:Ljava/lang/Throwable;

    .line 104
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->headersArrived:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 109
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 113
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lcom/ning/http/client/BodyDeferringAsyncHandler;->closeOut()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    :goto_1
    return-void

    .line 105
    :catch_0
    move-exception v0

    .line 108
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->headersArrived:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 109
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0

    .line 108
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->headersArrived:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 109
    iget-object v1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    throw v0

    .line 114
    :catch_1
    move-exception v0

    goto :goto_1
.end method
