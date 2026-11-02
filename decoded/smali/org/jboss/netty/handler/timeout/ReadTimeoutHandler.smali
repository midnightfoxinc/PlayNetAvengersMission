.class public Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "ReadTimeoutHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;,
        Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;
    }
.end annotation

.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field static final EXCEPTION:Lorg/jboss/netty/handler/timeout/ReadTimeoutException;


# instance fields
.field final timeoutMillis:J

.field final timer:Lorg/jboss/netty/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    new-instance v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/timeout/ReadTimeoutException;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->EXCEPTION:Lorg/jboss/netty/handler/timeout/ReadTimeoutException;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;I)V
    .locals 3
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "timeoutSeconds"    # I

    .prologue
    .line 99
    int-to-long v0, p2

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;-><init>(Lorg/jboss/netty/util/Timer;JLjava/util/concurrent/TimeUnit;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JLjava/util/concurrent/TimeUnit;)V
    .locals 4
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v2, 0x0

    .line 113
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 114
    if-nez p1, :cond_0

    .line 115
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "timer"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_0
    if-nez p4, :cond_1

    .line 118
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "unit"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    .line 122
    cmp-long v0, p2, v2

    if-gtz v0, :cond_2

    .line 123
    iput-wide v2, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timeoutMillis:J

    .line 127
    :goto_0
    return-void

    .line 125
    :cond_2
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timeoutMillis:J

    goto :goto_0
.end method

.method private static destroy(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 207
    invoke-static {p0}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->state(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;

    move-result-object v0

    .line 208
    .local v0, "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    monitor-enter v0

    .line 209
    :try_start_0
    iget v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->state:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 210
    monitor-exit v0

    .line 219
    :cond_0
    :goto_0
    return-void

    .line 212
    :cond_1
    const/4 v1, 0x2

    iput v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->state:I

    .line 213
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 215
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->timeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v1, :cond_0

    .line 216
    iget-object v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->timeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v1}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 217
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->timeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0

    .line 213
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private initialize(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 188
    invoke-static {p1}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->state(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;

    move-result-object v0

    .line 192
    .local v0, "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    monitor-enter v0

    .line 193
    :try_start_0
    iget v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->state:I

    packed-switch v1, :pswitch_data_0

    .line 198
    const/4 v1, 0x1

    iput v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->state:I

    .line 199
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    iget-wide v2, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timeoutMillis:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 202
    iget-object v1, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v2, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;

    invoke-direct {v2, p0, p1}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$ReadTimeoutTask;-><init>(Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    iget-wide v4, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timeoutMillis:J

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v4, v5, v3}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v1

    iput-object v1, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->timeout:Lorg/jboss/netty/util/Timeout;

    .line 204
    :cond_0
    :goto_0
    return-void

    .line 196
    :pswitch_0
    :try_start_1
    monitor-exit v0

    goto :goto_0

    .line 199
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 193
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static state(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    .locals 3
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 223
    monitor-enter p0

    .line 225
    :try_start_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;

    .line 226
    .local v0, "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    if-eqz v0, :cond_0

    .line 227
    monitor-exit p0

    move-object v1, v0

    .line 232
    .end local v0    # "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    .local v1, "state":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 229
    .end local v1    # "state":Ljava/lang/Object;
    .restart local v0    # "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;

    .end local v0    # "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    invoke-direct {v0}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;-><init>()V

    .line 230
    .restart local v0    # "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 231
    monitor-exit p0

    move-object v1, v0

    .line 232
    .restart local v1    # "state":Ljava/lang/Object;
    goto :goto_0

    .line 231
    .end local v0    # "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
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
    .line 152
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
    .line 160
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
    .line 139
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelPipeline;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->initialize(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 148
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
    .line 155
    invoke-static {p1}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->destroy(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 156
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
    .line 175
    invoke-static {p1}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->destroy(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 176
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 177
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
    .line 168
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->initialize(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 169
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 170
    return-void
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
    .line 182
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;

    .line 183
    .local v0, "state":Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler$State;->lastReadTime:J

    .line 184
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 185
    return-void
.end method

.method protected readTimedOut(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 236
    sget-object v0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->EXCEPTION:Lorg/jboss/netty/handler/timeout/ReadTimeoutException;

    invoke-static {p1, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 237
    return-void
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/jboss/netty/handler/timeout/ReadTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timer;->stop()Ljava/util/Set;

    .line 136
    return-void
.end method
