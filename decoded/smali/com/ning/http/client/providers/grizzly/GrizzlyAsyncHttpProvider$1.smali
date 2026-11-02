.class Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/CompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;
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
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

.field final synthetic val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

.field final synthetic val$handler:Lcom/ning/http/client/AsyncHandler;

.field final synthetic val$request:Lcom/ning/http/client/Request;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)V
    .locals 0

    .prologue
    .line 210
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$request:Lcom/ning/http/client/Request;

    iput-object p4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$handler:Lcom/ning/http/client/AsyncHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelled()V
    .locals 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->cancel(Z)Z

    .line 214
    return-void
.end method

.method public bridge synthetic completed(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 210
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->completed(Lorg/glassfish/grizzly/Connection;)V

    return-void
.end method

.method public completed(Lorg/glassfish/grizzly/Connection;)V
    .locals 7
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 224
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$request:Lcom/ning/http/client/Request;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$handler:Lcom/ning/http/client/AsyncHandler;

    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v5, 0x1

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->execute(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 225
    :catch_0
    move-exception v6

    .line 226
    .local v6, "e":Ljava/lang/Exception;
    instance-of v0, v6, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_2

    .line 227
    invoke-virtual {p0, v6}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->failed(Ljava/lang/Throwable;)V

    .line 231
    :cond_1
    :goto_1
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$100()Lorg/slf4j/Logger;

    move-result-object v0

    invoke-interface {v0}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->access$100()Lorg/slf4j/Logger;

    move-result-object v0

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v6}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 228
    :cond_2
    instance-of v0, v6, Ljava/io/IOException;

    if-eqz v0, :cond_1

    .line 229
    invoke-virtual {p0, v6}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->failed(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public failed(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->abort(Ljava/lang/Throwable;)V

    .line 219
    return-void
.end method

.method public bridge synthetic updated(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 210
    check-cast p1, Lorg/glassfish/grizzly/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;->updated(Lorg/glassfish/grizzly/Connection;)V

    return-void
.end method

.method public updated(Lorg/glassfish/grizzly/Connection;)V
    .locals 0
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 240
    return-void
.end method
