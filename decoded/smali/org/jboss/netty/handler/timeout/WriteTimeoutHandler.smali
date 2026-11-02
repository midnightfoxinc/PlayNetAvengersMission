.class public Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;
.super Lorg/jboss/netty/channel/SimpleChannelDownstreamHandler;
.source "WriteTimeoutHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$TimeoutCanceller;,
        Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$WriteTimeoutTask;
    }
.end annotation

.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field static final EXCEPTION:Lorg/jboss/netty/handler/timeout/WriteTimeoutException;


# instance fields
.field private final timeoutMillis:J

.field private final timer:Lorg/jboss/netty/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 79
    new-instance v0, Lorg/jboss/netty/handler/timeout/WriteTimeoutException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/timeout/WriteTimeoutException;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->EXCEPTION:Lorg/jboss/netty/handler/timeout/WriteTimeoutException;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;I)V
    .locals 3
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "timeoutSeconds"    # I

    .prologue
    .line 94
    int-to-long v0, p2

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;-><init>(Lorg/jboss/netty/util/Timer;JLjava/util/concurrent/TimeUnit;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JLjava/util/concurrent/TimeUnit;)V
    .locals 4
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "timeout"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v2, 0x0

    .line 108
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelDownstreamHandler;-><init>()V

    .line 109
    if-nez p1, :cond_0

    .line 110
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "timer"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    if-nez p4, :cond_1

    .line 113
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "unit"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    .line 117
    cmp-long v0, p2, v2

    if-gtz v0, :cond_2

    .line 118
    iput-wide v2, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->timeoutMillis:J

    .line 122
    :goto_0
    return-void

    .line 120
    :cond_2
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    const-wide/16 v2, 0x1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->timeoutMillis:J

    goto :goto_0
.end method


# virtual methods
.method protected getTimeoutMillis(Lorg/jboss/netty/channel/MessageEvent;)J
    .locals 2
    .param p1, "e"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 141
    iget-wide v0, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->timeoutMillis:J

    return-wide v0
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timer;->stop()Ljava/util/Set;

    .line 131
    return-void
.end method

.method public writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 148
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->getTimeoutMillis(Lorg/jboss/netty/channel/MessageEvent;)J

    move-result-wide v2

    .line 149
    .local v2, "timeoutMillis":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 151
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 152
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    iget-object v4, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v5, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$WriteTimeoutTask;

    invoke-direct {v5, p0, p1, v0}, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$WriteTimeoutTask;-><init>(Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, v5, v2, v3, v6}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v1

    .line 156
    .local v1, "timeout":Lorg/jboss/netty/util/Timeout;
    new-instance v4, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$TimeoutCanceller;

    invoke-direct {v4, v1}, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$TimeoutCanceller;-><init>(Lorg/jboss/netty/util/Timeout;)V

    invoke-interface {v0, v4}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 159
    .end local v0    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v1    # "timeout":Lorg/jboss/netty/util/Timeout;
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelDownstreamHandler;->writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V

    .line 160
    return-void
.end method

.method protected writeTimedOut(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 163
    sget-object v0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;->EXCEPTION:Lorg/jboss/netty/handler/timeout/WriteTimeoutException;

    invoke-static {p1, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 164
    return-void
.end method
