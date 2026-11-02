.class final Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$TimeoutCanceller;
.super Ljava/lang/Object;
.source "WriteTimeoutHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TimeoutCanceller"
.end annotation


# instance fields
.field private final timeout:Lorg/jboss/netty/util/Timeout;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/Timeout;)V
    .locals 0
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;

    .prologue
    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 210
    iput-object p1, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$TimeoutCanceller;->timeout:Lorg/jboss/netty/util/Timeout;

    .line 211
    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 1
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 214
    iget-object v0, p0, Lorg/jboss/netty/handler/timeout/WriteTimeoutHandler$TimeoutCanceller;->timeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 215
    return-void
.end method
