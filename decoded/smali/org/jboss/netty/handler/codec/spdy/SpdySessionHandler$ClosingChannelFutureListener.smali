.class final Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;
.super Ljava/lang/Object;
.source "SpdySessionHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ClosingChannelFutureListener"
.end annotation


# instance fields
.field private final ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private final e:Lorg/jboss/netty/channel/ChannelStateEvent;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;

    .prologue
    .line 884
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 885
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 886
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;->e:Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 887
    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "sentGoAwayFuture"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 890
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/nio/channels/ClosedChannelException;

    if-nez v0, :cond_0

    .line 891
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;->e:Lorg/jboss/netty/channel/ChannelStateEvent;

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 895
    :goto_0
    return-void

    .line 893
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;->e:Lorg/jboss/netty/channel/ChannelStateEvent;

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    goto :goto_0
.end method
