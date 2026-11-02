.class Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;
.super Ljava/lang/Object;
.source "SpdyHttpEncoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpdyFrameWriter"
.end annotation


# instance fields
.field private final ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private final e:Lorg/jboss/netty/channel/MessageEvent;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 262
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 263
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;->e:Lorg/jboss/netty/channel/MessageEvent;

    .line 264
    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 267
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;->e:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 274
    :goto_0
    return-void

    .line 269
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 270
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;->e:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v0}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->cancel()Z

    goto :goto_0

    .line 272
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;->e:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v0}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0
.end method
