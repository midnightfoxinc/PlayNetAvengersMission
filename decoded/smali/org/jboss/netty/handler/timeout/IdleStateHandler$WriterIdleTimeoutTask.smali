.class final Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;
.super Ljava/lang/Object;
.source "IdleStateHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/timeout/IdleStateHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "WriterIdleTimeoutTask"
.end annotation


# instance fields
.field private final ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field final synthetic this$0:Lorg/jboss/netty/handler/timeout/IdleStateHandler;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/timeout/IdleStateHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p2, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 429
    iput-object p1, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/IdleStateHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 430
    iput-object p2, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 431
    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 12
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 434
    invoke-interface {p1}, Lorg/jboss/netty/util/Timeout;->isCancelled()Z

    move-result v7

    if-nez v7, :cond_0

    iget-object v7, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v7}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v7

    invoke-interface {v7}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v7

    if-nez v7, :cond_1

    .line 452
    :cond_0
    :goto_0
    return-void

    .line 438
    :cond_1
    iget-object v7, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v7}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;

    .line 439
    .local v6, "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 440
    .local v0, "currentTime":J
    iget-wide v2, v6, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->lastWriteTime:J

    .line 441
    .local v2, "lastWriteTime":J
    iget-object v7, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/IdleStateHandler;

    iget-wide v8, v7, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->writerIdleTimeMillis:J

    sub-long v10, v0, v2

    sub-long v4, v8, v10

    .line 442
    .local v4, "nextDelay":J
    const-wide/16 v8, 0x0

    cmp-long v7, v4, v8

    if-gtz v7, :cond_2

    .line 444
    iget-object v7, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/IdleStateHandler;

    iget-object v7, v7, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v8, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/IdleStateHandler;

    iget-wide v8, v8, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->writerIdleTimeMillis:J

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v7, p0, v8, v9, v10}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v7

    iput-object v7, v6, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->writerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    .line 446
    iget-object v7, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/IdleStateHandler;

    iget-object v8, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    sget-object v9, Lorg/jboss/netty/handler/timeout/IdleState;->WRITER_IDLE:Lorg/jboss/netty/handler/timeout/IdleState;

    invoke-static {v7, v8, v9, v2, v3}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->access$000(Lorg/jboss/netty/handler/timeout/IdleStateHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/timeout/IdleState;J)V

    goto :goto_0

    .line 449
    :cond_2
    iget-object v7, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;->this$0:Lorg/jboss/netty/handler/timeout/IdleStateHandler;

    iget-object v7, v7, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->timer:Lorg/jboss/netty/util/Timer;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v7, p0, v4, v5, v8}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v7

    iput-object v7, v6, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->writerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0
.end method
