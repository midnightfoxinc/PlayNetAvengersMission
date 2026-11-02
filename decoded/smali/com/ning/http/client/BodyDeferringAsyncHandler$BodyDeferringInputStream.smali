.class public Lcom/ning/http/client/BodyDeferringAsyncHandler$BodyDeferringInputStream;
.super Ljava/io/FilterInputStream;
.source "BodyDeferringAsyncHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/BodyDeferringAsyncHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BodyDeferringInputStream"
.end annotation


# instance fields
.field private final bdah:Lcom/ning/http/client/BodyDeferringAsyncHandler;

.field private final future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Future;Lcom/ning/http/client/BodyDeferringAsyncHandler;Ljava/io/InputStream;)V
    .locals 0
    .param p2, "bdah"    # Lcom/ning/http/client/BodyDeferringAsyncHandler;
    .param p3, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/ning/http/client/Response;",
            ">;",
            "Lcom/ning/http/client/BodyDeferringAsyncHandler;",
            "Ljava/io/InputStream;",
            ")V"
        }
    .end annotation

    .prologue
    .line 236
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/ning/http/client/Response;>;"
    invoke-direct {p0, p3}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 237
    iput-object p1, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler$BodyDeferringInputStream;->future:Ljava/util/concurrent/Future;

    .line 238
    iput-object p2, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler$BodyDeferringInputStream;->bdah:Lcom/ning/http/client/BodyDeferringAsyncHandler;

    .line 239
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    .line 250
    :try_start_0
    invoke-virtual {p0}, Lcom/ning/http/client/BodyDeferringAsyncHandler$BodyDeferringInputStream;->getLastResponse()Lcom/ning/http/client/Response;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    return-void

    .line 251
    :catch_0
    move-exception v0

    .line 252
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 253
    .local v1, "ioe":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 254
    throw v1
.end method

.method public getAsapResponse()Lcom/ning/http/client/Response;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler$BodyDeferringInputStream;->bdah:Lcom/ning/http/client/BodyDeferringAsyncHandler;

    invoke-virtual {v0}, Lcom/ning/http/client/BodyDeferringAsyncHandler;->getResponse()Lcom/ning/http/client/Response;

    move-result-object v0

    return-object v0
.end method

.method public getLastResponse()Lcom/ning/http/client/Response;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 282
    iget-object v0, p0, Lcom/ning/http/client/BodyDeferringAsyncHandler$BodyDeferringInputStream;->future:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/Response;

    return-object v0
.end method
