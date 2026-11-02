.class public Lcom/ning/http/client/AsyncCompletionHandlerBase;
.super Lcom/ning/http/client/AsyncCompletionHandler;
.source "AsyncCompletionHandlerBase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/ning/http/client/AsyncCompletionHandler",
        "<",
        "Lcom/ning/http/client/Response;",
        ">;"
    }
.end annotation


# instance fields
.field private final log:Lorg/slf4j/Logger;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/ning/http/client/AsyncCompletionHandler;-><init>()V

    .line 26
    const-class v0, Lcom/ning/http/client/AsyncCompletionHandlerBase;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandlerBase;->log:Lorg/slf4j/Logger;

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/ning/http/client/Response;)Lcom/ning/http/client/Response;
    .locals 0
    .param p1, "response"    # Lcom/ning/http/client/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 30
    return-object p1
.end method

.method public bridge synthetic onCompleted(Lcom/ning/http/client/Response;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lcom/ning/http/client/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/ning/http/client/AsyncCompletionHandlerBase;->onCompleted(Lcom/ning/http/client/Response;)Lcom/ning/http/client/Response;

    move-result-object v0

    return-object v0
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/ning/http/client/AsyncCompletionHandlerBase;->log:Lorg/slf4j/Logger;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    return-void
.end method
