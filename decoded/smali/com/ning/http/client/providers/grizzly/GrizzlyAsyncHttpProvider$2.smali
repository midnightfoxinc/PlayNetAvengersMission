.class Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/utils/IdleTimeoutFilter$TimeoutResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->initializeTransport(Lcom/ning/http/client/AsyncHttpClientConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

.field final synthetic val$clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

.field final synthetic val$timeout:I


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;I)V
    .locals 0

    .prologue
    .line 333
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;->val$clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    iput p3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;->val$timeout:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTimeout(Lorg/glassfish/grizzly/filterchain/FilterChainContext;)J
    .locals 6
    .param p1, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    .prologue
    .line 336
    invoke-virtual {p1}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 338
    .local v0, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    if-eqz v0, :cond_2

    .line 339
    iget-boolean v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isWSRequest:Z

    if-eqz v1, :cond_1

    .line 340
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;->val$clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getWebSocketTimeout()I

    move-result v1

    int-to-long v2, v1

    .line 347
    :cond_0
    :goto_0
    return-wide v2

    .line 342
    :cond_1
    iget-object v1, v0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    invoke-interface {v1}, Lcom/ning/http/client/Request;->getRequestTimeout()I

    move-result v1

    int-to-long v2, v1

    .line 343
    .local v2, "timeout":J
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gtz v1, :cond_0

    .line 347
    .end local v2    # "timeout":J
    :cond_2
    iget v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;->val$timeout:I

    int-to-long v2, v1

    goto :goto_0
.end method
