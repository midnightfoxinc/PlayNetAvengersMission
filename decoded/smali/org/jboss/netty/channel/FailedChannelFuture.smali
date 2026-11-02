.class public Lorg/jboss/netty/channel/FailedChannelFuture;
.super Lorg/jboss/netty/channel/CompleteChannelFuture;
.source "FailedChannelFuture.java"


# instance fields
.field private final cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/CompleteChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;)V

    .line 35
    if-nez p2, :cond_0

    .line 36
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cause"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_0
    iput-object p2, p0, Lorg/jboss/netty/channel/FailedChannelFuture;->cause:Ljava/lang/Throwable;

    .line 39
    return-void
.end method

.method private rethrow()V
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jboss/netty/channel/FailedChannelFuture;->cause:Ljava/lang/Throwable;

    instance-of v0, v0, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lorg/jboss/netty/channel/FailedChannelFuture;->cause:Ljava/lang/Throwable;

    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    .line 64
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/channel/FailedChannelFuture;->cause:Ljava/lang/Throwable;

    instance-of v0, v0, Ljava/lang/Error;

    if-eqz v0, :cond_1

    .line 65
    iget-object v0, p0, Lorg/jboss/netty/channel/FailedChannelFuture;->cause:Ljava/lang/Throwable;

    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 68
    :cond_1
    new-instance v0, Lorg/jboss/netty/channel/ChannelException;

    iget-object v1, p0, Lorg/jboss/netty/channel/FailedChannelFuture;->cause:Ljava/lang/Throwable;

    invoke-direct {v0, v1}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/jboss/netty/channel/FailedChannelFuture;->cause:Ljava/lang/Throwable;

    return-object v0
.end method

.method public isSuccess()Z
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    return v0
.end method

.method public sync()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/jboss/netty/channel/FailedChannelFuture;->rethrow()V

    .line 51
    return-object p0
.end method

.method public syncUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/jboss/netty/channel/FailedChannelFuture;->rethrow()V

    .line 56
    return-object p0
.end method
