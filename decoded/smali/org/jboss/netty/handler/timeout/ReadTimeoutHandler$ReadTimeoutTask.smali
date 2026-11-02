.class final Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;
.super Ljava/lang/Object;
.source "ReadTimeoutHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ReadTimeoutTask"
.end annotation


# instance fields
.field private final ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field final synthetic this$0:Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p2, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 243
    iput-object p1, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    iput-object p2, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 245
    return-void
.end method

.method private fireReadTimedOut(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 272
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask$1;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask$1;-><init>(Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 282
    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 10
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 248
    invoke-interface {p1}, Lorg/jboss/netty/util/Timeout;->isCancelled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 252
    :cond_1
    iget-object v5, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 256
    iget-object v5, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;

    .line 257
    .local v4, "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 258
    .local v0, "currentTime":J
    iget-object v5, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;

    iget-wide v6, v5, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timeoutMillis:J

    iget-wide v8, v4, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->lastReadTime:J

    sub-long v8, v0, v8

    sub-long v2, v6, v8

    .line 259
    .local v2, "nextDelay":J
    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-gtz v5, :cond_2

    .line 261
    iget-object v5, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;

    iget-object v5, v5, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v6, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;

    iget-wide v6, v6, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timeoutMillis:J

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v5, p0, v6, v7, v8}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v5

    iput-object v5, v4, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->timeout:Lorg/jboss/netty/util/Timeout;

    .line 263
    iget-object v5, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-direct {p0, v5}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->fireReadTimedOut(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    goto :goto_0

    .line 266
    :cond_2
    iget-object v5, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;

    iget-object v5, v5, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v5, p0, v2, v3, v6}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v5

    iput-object v5, v4, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->timeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0
.end method
