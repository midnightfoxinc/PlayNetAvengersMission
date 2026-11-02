.class Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;
.super Ljava/lang/Object;
.source "HttpTransactionContext.java"

# interfaces
.implements Lorg/glassfish/grizzly/CloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/glassfish/grizzly/CloseListener",
        "<",
        "Lorg/glassfish/grizzly/Closeable;",
        "Lorg/glassfish/grizzly/CloseType;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;->this$0:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Lorg/glassfish/grizzly/Closeable;Lorg/glassfish/grizzly/CloseType;)V
    .locals 4
    .param p1, "closeable"    # Lorg/glassfish/grizzly/Closeable;
    .param p2, "type"    # Lorg/glassfish/grizzly/CloseType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;->this$0:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->isGracefullyFinishResponseOnClose()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;->this$0:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->access$000(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    invoke-interface {v1}, Lorg/glassfish/grizzly/Connection;->getProcessor()Lorg/glassfish/grizzly/Processor;

    move-result-object v0

    check-cast v0, Lorg/glassfish/grizzly/filterchain/FilterChain;

    .line 80
    .local v0, "fc":Lorg/glassfish/grizzly/filterchain/FilterChain;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;->this$0:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->access$000(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)Lorg/glassfish/grizzly/Connection;

    move-result-object v1

    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;->this$0:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    invoke-direct {v2, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;-><init>(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;)V

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Lorg/glassfish/grizzly/filterchain/FilterChain;->fireEventUpstream(Lorg/glassfish/grizzly/Connection;Lorg/glassfish/grizzly/filterchain/FilterChainEvent;Lorg/glassfish/grizzly/CompletionHandler;)V

    .line 85
    .end local v0    # "fc":Lorg/glassfish/grizzly/filterchain/FilterChain;
    :cond_0
    :goto_0
    return-void

    .line 82
    :cond_1
    sget-object v1, Lorg/glassfish/grizzly/CloseType;->REMOTELY:Lorg/glassfish/grizzly/CloseType;

    invoke-virtual {v1, p2}, Lorg/glassfish/grizzly/CloseType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;->this$0:Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    sget-object v2, Lcom/ning/http/util/AsyncHttpProviderUtils;->REMOTELY_CLOSED_EXCEPTION:Ljava/io/IOException;

    invoke-virtual {v1, v2}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public bridge synthetic onClosed(Lorg/glassfish/grizzly/Closeable;Lorg/glassfish/grizzly/ICloseType;)V
    .locals 0
    .param p1, "x0"    # Lorg/glassfish/grizzly/Closeable;
    .param p2, "x1"    # Lorg/glassfish/grizzly/ICloseType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    check-cast p2, Lorg/glassfish/grizzly/CloseType;

    .end local p2    # "x1":Lorg/glassfish/grizzly/ICloseType;
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext$1;->onClosed(Lorg/glassfish/grizzly/Closeable;Lorg/glassfish/grizzly/CloseType;)V

    return-void
.end method
