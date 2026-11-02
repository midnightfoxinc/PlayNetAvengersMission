.class final Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lorg/glassfish/grizzly/WriteHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "WriteHandlerImpl"
.end annotation


# instance fields
.field private final c:Lorg/glassfish/grizzly/Connection;

.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;)V
    .locals 1

    .prologue
    .line 570
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 571
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;->c:Lorg/glassfish/grizzly/Connection;

    .line 572
    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;

    .prologue
    .line 561
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;)V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 584
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;->c:Lorg/glassfish/grizzly/Connection;

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;

    iget-object v1, v1, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$800(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)I

    move-result v1

    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/Connection;->setMaxAsyncWriteQueueSize(I)V

    .line 585
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;->c:Lorg/glassfish/grizzly/Connection;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 586
    return-void
.end method

.method public onWritePossible()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 579
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->flush()V

    .line 580
    return-void
.end method
