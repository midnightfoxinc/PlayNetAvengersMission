.class public abstract Lorg/jboss/netty/channel/CompleteChannelFuture;
.super Ljava/lang/Object;
.source "CompleteChannelFuture.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFuture;


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final channel:Lorg/jboss/netty/channel/Channel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lorg/jboss/netty/channel/CompleteChannelFuture;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/CompleteChannelFuture;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/channel/Channel;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    if-nez p1, :cond_0

    .line 41
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "channel"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/CompleteChannelFuture;->channel:Lorg/jboss/netty/channel/Channel;

    .line 44
    return-void
.end method


# virtual methods
.method public addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V
    .locals 4
    .param p1, "listener"    # Lorg/jboss/netty/channel/ChannelFutureListener;

    .prologue
    .line 48
    :try_start_0
    invoke-interface {p1, p0}, Lorg/jboss/netty/channel/ChannelFutureListener;->operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :cond_0
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lorg/jboss/netty/channel/CompleteChannelFuture;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 51
    sget-object v1, Lorg/jboss/netty/channel/CompleteChannelFuture;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "An exception was thrown by "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-class v3, Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public await()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 66
    :cond_0
    return-object p0
.end method

.method public await(J)Z
    .locals 1
    .param p1, "timeoutMillis"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 80
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public await(JLjava/util/concurrent/TimeUnit;)Z
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 73
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 0

    .prologue
    .line 84
    return-object p0
.end method

.method public awaitUninterruptibly(J)Z
    .locals 1
    .param p1, "timeoutMillis"    # J

    .prologue
    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method public awaitUninterruptibly(JLjava/util/concurrent/TimeUnit;)Z
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 88
    const/4 v0, 0x1

    return v0
.end method

.method public cancel()Z
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x0

    return v0
.end method

.method public getChannel()Lorg/jboss/netty/channel/Channel;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jboss/netty/channel/CompleteChannelFuture;->channel:Lorg/jboss/netty/channel/Channel;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x1

    return v0
.end method

.method public removeListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/jboss/netty/channel/ChannelFutureListener;

    .prologue
    .line 60
    return-void
.end method

.method public setFailure(Ljava/lang/Throwable;)Z
    .locals 1
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public setProgress(JJJ)Z
    .locals 1
    .param p1, "amount"    # J
    .param p3, "current"    # J
    .param p5, "total"    # J

    .prologue
    .line 104
    const/4 v0, 0x0

    return v0
.end method

.method public setSuccess()Z
    .locals 1

    .prologue
    .line 112
    const/4 v0, 0x0

    return v0
.end method
