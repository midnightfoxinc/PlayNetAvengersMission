.class public Lorg/jboss/netty/handler/timeout/IdleStateHandler;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "IdleStateHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;,
        Lorg/jboss/netty/handler/timeout/IdleStateHandler$AllIdleTimeoutTask;,
        Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;,
        Lorg/jboss/netty/handler/timeout/IdleStateHandler$ReaderIdleTimeoutTask;
    }
.end annotation

.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# instance fields
.field final allIdleTimeMillis:J

.field final readerIdleTimeMillis:J

.field final timer:Lorg/jboss/netty/util/Timer;

.field final writerIdleTimeMillis:J


# direct methods
.method public constructor <init>(Lorg/jboss/netty/util/Timer;III)V
    .locals 9
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "readerIdleTimeSeconds"    # I
    .param p3, "writerIdleTimeSeconds"    # I
    .param p4, "allIdleTimeSeconds"    # I

    .prologue
    .line 158
    int-to-long v2, p2

    int-to-long v4, p3

    int-to-long v6, p4

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v8}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;-><init>(Lorg/jboss/netty/util/Timer;JJJLjava/util/concurrent/TimeUnit;)V

    .line 161
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJLjava/util/concurrent/TimeUnit;)V
    .locals 6
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "readerIdleTime"    # J
    .param p4, "writerIdleTime"    # J
    .param p6, "allIdleTime"    # J
    .param p8, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v4, 0x1

    const-wide/16 v2, 0x0

    .line 188
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 190
    if-nez p1, :cond_0

    .line 191
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "timer"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_0
    if-nez p8, :cond_1

    .line 194
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "unit"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->timer:Lorg/jboss/netty/util/Timer;

    .line 198
    cmp-long v0, p2, v2

    if-gtz v0, :cond_2

    .line 199
    iput-wide v2, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->readerIdleTimeMillis:J

    .line 203
    :goto_0
    cmp-long v0, p4, v2

    if-gtz v0, :cond_3

    .line 204
    iput-wide v2, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->writerIdleTimeMillis:J

    .line 208
    :goto_1
    cmp-long v0, p6, v2

    if-gtz v0, :cond_4

    .line 209
    iput-wide v2, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->allIdleTimeMillis:J

    .line 213
    :goto_2
    return-void

    .line 201
    :cond_2
    invoke-virtual {p8, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->readerIdleTimeMillis:J

    goto :goto_0

    .line 206
    :cond_3
    invoke-virtual {p8, p4, p5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->writerIdleTimeMillis:J

    goto :goto_1

    .line 211
    :cond_4
    invoke-virtual {p8, p6, p7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->allIdleTimeMillis:J

    goto :goto_2
.end method

.method static synthetic access$000(Lorg/jboss/netty/handler/timeout/IdleStateHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/timeout/IdleState;J)V
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/timeout/IdleStateHandler;
    .param p1, "x1"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x2"    # Lorg/jboss/netty/handler/timeout/IdleState;
    .param p3, "x3"    # J

    .prologue
    .line 123
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->fireChannelIdle(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/timeout/IdleState;J)V

    return-void
.end method

.method private static destroy(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    const/4 v3, 0x0

    .line 340
    invoke-static {p0}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->state(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;

    move-result-object v0

    .line 341
    .local v0, "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    monitor-enter v0

    .line 342
    :try_start_0
    iget v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->state:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 343
    monitor-exit v0

    .line 360
    :cond_0
    :goto_0
    return-void

    .line 345
    :cond_1
    const/4 v1, 0x2

    iput v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->state:I

    .line 346
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 348
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->readerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v1, :cond_2

    .line 349
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->readerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v1}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 350
    iput-object v3, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->readerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    .line 352
    :cond_2
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->writerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v1, :cond_3

    .line 353
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->writerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v1}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 354
    iput-object v3, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->writerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    .line 356
    :cond_3
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->allIdleTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v1, :cond_0

    .line 357
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->allIdleTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v1}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 358
    iput-object v3, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->allIdleTimeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0

    .line 346
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private fireChannelIdle(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/timeout/IdleState;J)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "state"    # Lorg/jboss/netty/handler/timeout/IdleState;
    .param p3, "lastActivityTimeMillis"    # J

    .prologue
    .line 378
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v6

    new-instance v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/timeout/IdleStateHandler$1;-><init>(Lorg/jboss/netty/handler/timeout/IdleStateHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/timeout/IdleState;J)V

    invoke-interface {v6, v0}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 388
    return-void
.end method

.method private initialize(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 8
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    const-wide/16 v6, 0x0

    .line 308
    invoke-static {p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->state(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;

    move-result-object v0

    .line 312
    .local v0, "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    monitor-enter v0

    .line 313
    :try_start_0
    iget v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->state:I

    packed-switch v1, :pswitch_data_0

    .line 318
    const/4 v1, 0x1

    iput v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->state:I

    .line 319
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 321
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->lastWriteTime:J

    iput-wide v2, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->lastReadTime:J

    .line 322
    iget-wide v2, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->readerIdleTimeMillis:J

    cmp-long v1, v2, v6

    if-lez v1, :cond_0

    .line 323
    iget-object v1, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v2, Lorg/jboss/netty/handler/timeout/IdleStateHandler$ReaderIdleTimeoutTask;

    invoke-direct {v2, p0, p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler$ReaderIdleTimeoutTask;-><init>(Lorg/jboss/netty/handler/timeout/IdleStateHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    iget-wide v4, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->readerIdleTimeMillis:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v4, v5, v3}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v1

    iput-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->readerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    .line 327
    :cond_0
    iget-wide v2, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->writerIdleTimeMillis:J

    cmp-long v1, v2, v6

    if-lez v1, :cond_1

    .line 328
    iget-object v1, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v2, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;

    invoke-direct {v2, p0, p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler$WriterIdleTimeoutTask;-><init>(Lorg/jboss/netty/handler/timeout/IdleStateHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    iget-wide v4, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->writerIdleTimeMillis:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v4, v5, v3}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v1

    iput-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->writerIdleTimeout:Lorg/jboss/netty/util/Timeout;

    .line 332
    :cond_1
    iget-wide v2, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->allIdleTimeMillis:J

    cmp-long v1, v2, v6

    if-lez v1, :cond_2

    .line 333
    iget-object v1, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v2, Lorg/jboss/netty/handler/timeout/IdleStateHandler$AllIdleTimeoutTask;

    invoke-direct {v2, p0, p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler$AllIdleTimeoutTask;-><init>(Lorg/jboss/netty/handler/timeout/IdleStateHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    iget-wide v4, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->allIdleTimeMillis:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v4, v5, v3}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v1

    iput-object v1, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->allIdleTimeout:Lorg/jboss/netty/util/Timeout;

    .line 337
    :cond_2
    :goto_0
    return-void

    .line 316
    :pswitch_0
    :try_start_1
    monitor-exit v0

    goto :goto_0

    .line 319
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 313
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static state(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 364
    monitor-enter p0

    .line 366
    :try_start_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;

    .line 367
    .local v0, "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    if-eqz v0, :cond_0

    .line 368
    monitor-exit p0

    move-object v1, v0

    .line 373
    .end local v0    # "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    .local v1, "state":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 370
    .end local v1    # "state":Ljava/lang/Object;
    .restart local v0    # "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;

    .end local v0    # "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    invoke-direct {v0}, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;-><init>()V

    .line 371
    .restart local v0    # "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 372
    monitor-exit p0

    move-object v1, v0

    .line 373
    .restart local v1    # "state":Ljava/lang/Object;
    goto :goto_0

    .line 372
    .end local v0    # "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    .end local v1    # "state":Ljava/lang/Object;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method


# virtual methods
.method public afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 262
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 270
    return-void
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 249
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelPipeline;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 253
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->initialize(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 258
    :cond_0
    return-void
.end method

.method public beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 265
    invoke-static {p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->destroy(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 266
    return-void
.end method

.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 285
    invoke-static {p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->destroy(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 286
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 287
    return-void
.end method

.method protected channelIdle(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/timeout/IdleState;J)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "state"    # Lorg/jboss/netty/handler/timeout/IdleState;
    .param p3, "lastActivityTimeMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 392
    new-instance v0, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-direct {v0, v1, p2, p3, p4}, Lorg/jboss/netty/handler/timeout/DefaultIdleStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/timeout/IdleState;J)V

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 393
    return-void
.end method

.method public channelOpen(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 278
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->initialize(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 279
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 280
    return-void
.end method

.method public getAllIdleTimeInMillis()J
    .locals 2

    .prologue
    .line 236
    iget-wide v0, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->allIdleTimeMillis:J

    return-wide v0
.end method

.method public getReaderIdleTimeInMillis()J
    .locals 2

    .prologue
    .line 220
    iget-wide v0, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->readerIdleTimeMillis:J

    return-wide v0
.end method

.method public getWriterIdleTimeInMillis()J
    .locals 2

    .prologue
    .line 228
    iget-wide v0, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->writerIdleTimeMillis:J

    return-wide v0
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 292
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;

    .line 293
    .local v0, "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->lastReadTime:J

    .line 294
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 295
    return-void
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lorg/jboss/netty/handler/timeout/IdleStateHandler;->timer:Lorg/jboss/netty/util/Timer;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timer;->stop()Ljava/util/Set;

    .line 246
    return-void
.end method

.method public writeComplete(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/WriteCompletionEvent;)V
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/WriteCompletionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 300
    invoke-interface {p2}, Lorg/jboss/netty/channel/WriteCompletionEvent;->getWrittenAmount()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 301
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;

    .line 302
    .local v0, "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;->lastWriteTime:J

    .line 304
    .end local v0    # "state":Lorg/jboss/netty/handler/timeout/IdleStateHandler$State;
    :cond_0
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 305
    return-void
.end method
