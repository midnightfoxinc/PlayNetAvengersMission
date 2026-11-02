.class Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/CompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->createWriteCompletionHandler(Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/CompletionHandler;
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
        "Lorg/glassfish/grizzly/WriteResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

.field final synthetic val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)V
    .locals 0

    .prologue
    .line 494
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;->this$0:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancelled()V
    .locals 2

    .prologue
    .line 497
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->cancel(Z)Z

    .line 498
    return-void
.end method

.method public bridge synthetic completed(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 494
    check-cast p1, Lorg/glassfish/grizzly/WriteResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;->completed(Lorg/glassfish/grizzly/WriteResult;)V

    return-void
.end method

.method public completed(Lorg/glassfish/grizzly/WriteResult;)V
    .locals 0
    .param p1, "result"    # Lorg/glassfish/grizzly/WriteResult;

    .prologue
    .line 505
    return-void
.end method

.method public failed(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 501
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;->val$future:Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->abort(Ljava/lang/Throwable;)V

    .line 502
    return-void
.end method

.method public bridge synthetic updated(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 494
    check-cast p1, Lorg/glassfish/grizzly/WriteResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;->updated(Lorg/glassfish/grizzly/WriteResult;)V

    return-void
.end method

.method public updated(Lorg/glassfish/grizzly/WriteResult;)V
    .locals 0
    .param p1, "result"    # Lorg/glassfish/grizzly/WriteResult;

    .prologue
    .line 509
    return-void
.end method
