.class Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;
.super Lorg/glassfish/grizzly/EmptyCompletionHandler;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;->doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/glassfish/grizzly/EmptyCompletionHandler",
        "<",
        "Lorg/glassfish/grizzly/WriteResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;

.field final synthetic val$context:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

.field final synthetic val$requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;)V
    .locals 0

    .prologue
    .line 2059
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;->this$1:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;->val$context:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;->val$requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    invoke-direct {p0}, Lorg/glassfish/grizzly/EmptyCompletionHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic updated(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 2059
    check-cast p1, Lorg/glassfish/grizzly/WriteResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;->updated(Lorg/glassfish/grizzly/WriteResult;)V

    return-void
.end method

.method public updated(Lorg/glassfish/grizzly/WriteResult;)V
    .locals 8
    .param p1, "result"    # Lorg/glassfish/grizzly/WriteResult;

    .prologue
    .line 2063
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;->val$context:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    iget-object v0, v1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 2064
    .local v0, "handler":Lcom/ning/http/client/AsyncHandler;
    instance-of v1, v0, Lcom/ning/http/client/listener/TransferCompletionHandler;

    if-eqz v1, :cond_0

    .line 2065
    invoke-virtual {p1}, Lorg/glassfish/grizzly/WriteResult;->getWrittenSize()J

    move-result-wide v2

    .line 2066
    .local v2, "written":J
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;->val$context:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    iget-object v1, v1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->totalBodyWritten:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    move-result-wide v4

    .local v4, "total":J
    move-object v1, v0

    .line 2067
    check-cast v1, Lcom/ning/http/client/listener/TransferCompletionHandler;

    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler$1;->val$requestPacket:Lorg/glassfish/grizzly/http/HttpRequestPacket;

    invoke-virtual {v6}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->getContentLength()J

    move-result-wide v6

    invoke-virtual/range {v1 .. v7}, Lcom/ning/http/client/listener/TransferCompletionHandler;->onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;

    .line 2072
    .end local v2    # "written":J
    .end local v4    # "total":J
    :cond_0
    return-void
.end method
