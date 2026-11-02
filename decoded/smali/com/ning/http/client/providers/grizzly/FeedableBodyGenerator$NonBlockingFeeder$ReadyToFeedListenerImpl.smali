.class final Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ReadyToFeedListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;)V
    .locals 0

    .prologue
    .line 591
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;
    .param p2, "x1"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;

    .prologue
    .line 591
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;)V

    return-void
.end method


# virtual methods
.method public ready()V
    .locals 3

    .prologue
    .line 601
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 607
    :goto_0
    return-void

    .line 602
    :catch_0
    move-exception v1

    .line 603
    .local v1, "e":Ljava/io/IOException;
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;

    iget-object v2, v2, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v2

    invoke-virtual {v2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 604
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;->this$0:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;

    iget-object v2, v2, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$800(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)I

    move-result v2

    invoke-interface {v0, v2}, Lorg/glassfish/grizzly/Connection;->setMaxAsyncWriteQueueSize(I)V

    .line 605
    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
