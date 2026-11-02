.class public abstract Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;
.super Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;
.source "FeedableBodyGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "NonBlockingFeeder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;,
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;,
        Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListener;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V
    .locals 0
    .param p1, "feedableBodyGenerator"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 465
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V

    .line 466
    return-void
.end method

.method private writeUntilFullOrDone(Lorg/glassfish/grizzly/Connection;)Z
    .locals 1
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 532
    :goto_0
    invoke-interface {p1}, Lorg/glassfish/grizzly/Connection;->canWrite()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 533
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 534
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->canFeed()V

    goto :goto_0

    .line 536
    :cond_0
    const/4 v0, 0x1

    .line 540
    :goto_1
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public abstract canFeed()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public declared-synchronized flush()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 510
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->feedableBodyGenerator:Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    invoke-static {v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;->access$300(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)Lorg/glassfish/grizzly/filterchain/FilterChainContext;

    move-result-object v2

    invoke-virtual {v2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v0

    .line 511
    .local v0, "c":Lorg/glassfish/grizzly/Connection;
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->isReady()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 512
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->writeUntilFullOrDone(Lorg/glassfish/grizzly/Connection;)Z

    move-result v1

    .line 513
    .local v1, "notReady":Z
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->isDone()Z

    move-result v2

    if-nez v2, :cond_0

    .line 514
    if-eqz v1, :cond_1

    .line 515
    new-instance v2, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V

    invoke-virtual {p0, v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->notifyReadyToFeed(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 525
    .end local v1    # "notReady":Z
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 519
    .restart local v1    # "notReady":Z
    :cond_1
    :try_start_1
    new-instance v2, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$WriteHandlerImpl;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V

    invoke-interface {v0, v2}, Lorg/glassfish/grizzly/Connection;->notifyCanWrite(Lorg/glassfish/grizzly/WriteHandler;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 510
    .end local v0    # "c":Lorg/glassfish/grizzly/Connection;
    .end local v1    # "notReady":Z
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 523
    .restart local v0    # "c":Lorg/glassfish/grizzly/Connection;
    :cond_2
    :try_start_2
    new-instance v2, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListenerImpl;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$1;)V

    invoke-virtual {p0, v2}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder;->notifyReadyToFeed(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public abstract isDone()Z
.end method

.method public abstract isReady()Z
.end method

.method public abstract notifyReadyToFeed(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$NonBlockingFeeder$ReadyToFeedListener;)V
.end method
