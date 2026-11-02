.class final Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lorg/glassfish/grizzly/CompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "LastPacketCompletionHandler"
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
.field private final c:Lorg/glassfish/grizzly/Connection;

.field private final delegate:Lorg/glassfish/grizzly/CompletionHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/WriteResult;",
            ">;"
        }
    .end annotation
.end field

.field private final origMaxPendingBytes:I

.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;)V
    .locals 1

    .prologue
    .line 398
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 399
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$400(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/http/HttpRequestPacket;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->isCommitted()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    .line 402
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->c:Lorg/glassfish/grizzly/Connection;

    .line 403
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$800(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->origMaxPendingBytes:I

    .line 404
    return-void

    .line 399
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;

    .prologue
    .line 387
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;)V

    return-void
.end method


# virtual methods
.method public cancelled()V
    .locals 2

    .prologue
    .line 412
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->c:Lorg/glassfish/grizzly/Connection;

    iget v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->origMaxPendingBytes:I

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/Connection;->setMaxAsyncWriteQueueSize(I)V

    .line 413
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 414
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0}, Lorg/glassfish/grizzly/CompletionHandler;->cancelled()V

    .line 416
    :cond_0
    return-void
.end method

.method public bridge synthetic completed(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 387
    check-cast p1, Lorg/glassfish/grizzly/WriteResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->completed(Lorg/glassfish/grizzly/WriteResult;)V

    return-void
.end method

.method public completed(Lorg/glassfish/grizzly/WriteResult;)V
    .locals 2
    .param p1, "result"    # Lorg/glassfish/grizzly/WriteResult;

    .prologue
    .line 429
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->c:Lorg/glassfish/grizzly/Connection;

    iget v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->origMaxPendingBytes:I

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/Connection;->setMaxAsyncWriteQueueSize(I)V

    .line 430
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 431
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->completed(Ljava/lang/Object;)V

    .line 434
    :cond_0
    return-void
.end method

.method public failed(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 420
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->c:Lorg/glassfish/grizzly/Connection;

    iget v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->origMaxPendingBytes:I

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/Connection;->setMaxAsyncWriteQueueSize(I)V

    .line 421
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->failed(Ljava/lang/Throwable;)V

    .line 425
    :cond_0
    return-void
.end method

.method public bridge synthetic updated(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 387
    check-cast p1, Lorg/glassfish/grizzly/WriteResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->updated(Lorg/glassfish/grizzly/WriteResult;)V

    return-void
.end method

.method public updated(Lorg/glassfish/grizzly/WriteResult;)V
    .locals 1
    .param p1, "result"    # Lorg/glassfish/grizzly/WriteResult;

    .prologue
    .line 438
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    if-eqz v0, :cond_0

    .line 439
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder$LastPacketCompletionHandler;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v0, p1}, Lorg/glassfish/grizzly/CompletionHandler;->updated(Ljava/lang/Object;)V

    .line 441
    :cond_0
    return-void
.end method
