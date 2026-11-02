.class Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;
.super Ljava/lang/Object;
.source "SpdySessionHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;

.field final synthetic val$context:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field final synthetic val$remoteAddress:Ljava/net/SocketAddress;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;)V
    .locals 0

    .prologue
    .line 538
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;->this$0:Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;

    iput-object p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;->val$context:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iput-object p3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;->val$remoteAddress:Ljava/net/SocketAddress;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 5
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 540
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v1

    if-nez v1, :cond_0

    .line 541
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 542
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;->this$0:Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;->val$context:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;->val$remoteAddress:Ljava/net/SocketAddress;

    sget-object v4, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->INTERNAL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    invoke-static {v1, v2, v0, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->access$000(Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    .line 545
    .end local v0    # "channel":Lorg/jboss/netty/channel/Channel;
    :cond_0
    return-void
.end method
