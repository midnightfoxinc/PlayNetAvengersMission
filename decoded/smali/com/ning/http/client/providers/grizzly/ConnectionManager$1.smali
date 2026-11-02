.class Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;
.super Ljava/lang/Object;
.source "ConnectionManager.java"

# interfaces
.implements Lorg/glassfish/grizzly/CompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/ConnectionManager;->createConnectionCompletionHandler(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)Lorg/glassfish/grizzly/CompletionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/glassfish/grizzly/CompletionHandler",
        "<",
        "Lorg/glassfish/grizzly/Connection;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

.field final synthetic val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

.field final synthetic val$request:Lcom/ning/http/client/Request;

.field final synthetic val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/ConnectionManager;Lorg/glassfish/grizzly/CompletionHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;)V
    .locals 0

    .prologue
    .line 195
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->this$0:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    iput-object p4, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$request:Lcom/ning/http/client/Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelled()V
    .locals 2

    .prologue
    .line 197
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0}, Lorg/glassfish/grizzly/CompletionHandler;->cancelled()V

    .line 202
    :goto_0
    return-void

    .line 200
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->cancel(Z)Z

    goto :goto_0
.end method

.method public bridge synthetic completed(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 195
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->completed(Lorg/glassfish/grizzly/Connection;)V

    return-void
.end method

.method public completed(Lorg/glassfish/grizzly/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->setConnection(Lorg/glassfish/grizzly/Connection;)V

    .line 214
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->this$0:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->access$100(Lcom/ning/http/client/providers/grizzly/ConnectionManager;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$request:Lcom/ning/http/client/Request;

    invoke-virtual {v0, p1, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->touchConnection(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;)V

    .line 215
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->this$0:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->access$200(Lcom/ning/http/client/providers/grizzly/ConnectionManager;)Lcom/ning/http/client/providers/grizzly/ConnectionManager$ConnectionMonitor;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/glassfish/grizzly/Connection;->addCloseListener(Lorg/glassfish/grizzly/Connection$CloseListener;)V

    .line 217
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->completed(Ljava/lang/Object;)V

    .line 219
    :cond_0
    return-void
.end method

.method public failed(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 205
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 206
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->failed(Ljava/lang/Throwable;)V

    .line 210
    :goto_0
    return-void

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->abort(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public bridge synthetic updated(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 195
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->updated(Lorg/glassfish/grizzly/Connection;)V

    return-void
.end method

.method public updated(Lorg/glassfish/grizzly/Connection;)V
    .locals 1
    .param p1, "result"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 223
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;->val$wrappedHandler:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->updated(Ljava/lang/Object;)V

    .line 225
    :cond_0
    return-void
.end method
