.class public abstract Lcom/ning/http/client/AsyncCompletionHandler;
.super Ljava/lang/Object;
.source "AsyncCompletionHandler.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHandler;
.implements Lcom/ning/http/client/ProgressAsyncHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHandler",
        "<TT;>;",
        "Lcom/ning/http/client/ProgressAsyncHandler",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final builder:Lcom/ning/http/client/Response$ResponseBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/ning/http/client/AsyncCompletionHandler;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/AsyncCompletionHandler;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-direct {v0}, Lcom/ning/http/client/Response$ResponseBuilder;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandler;->builder:Lcom/ning/http/client/Response$ResponseBuilder;

    return-void
.end method


# virtual methods
.method public onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "content"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandler;->builder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 37
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public final onCompleted()Ljava/lang/Object;
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
    .line 55
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandler;->builder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0}, Lcom/ning/http/client/Response$ResponseBuilder;->build()Lcom/ning/http/client/Response;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/AsyncCompletionHandler;->onCompleted(Lcom/ning/http/client/Response;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public abstract onCompleted(Lcom/ning/http/client/Response;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Response;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public onContentWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1

    .prologue
    .line 94
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "amount"    # J
    .param p3, "current"    # J
    .param p5, "total"    # J

    .prologue
    .line 107
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1

    .prologue
    .line 83
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

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
    .line 49
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandler;->builder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 50
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandler;->builder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0}, Lcom/ning/http/client/Response$ResponseBuilder;->reset()V

    .line 43
    iget-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandler;->builder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 44
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 60
    .local p0, "this":Lcom/ning/http/client/AsyncCompletionHandler;, "Lcom/ning/http/client/AsyncCompletionHandler<TT;>;"
    sget-object v0, Lcom/ning/http/client/AsyncCompletionHandler;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    return-void
.end method
