.class Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13$1;
.super Ljava/lang/Object;
.source "WebSocketClientHandshaker13.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13;->handshake(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13;

.field final synthetic val$handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 0

    .prologue
    .line 179
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13$1;->this$0:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13;

    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13$1;->val$handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 5
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 181
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    .line 182
    .local v0, "p":Lorg/jboss/netty/channel/ChannelPipeline;
    const-class v1, Lorg/jboss/netty/handler/codec/http/HttpRequestEncoder;

    const-string v2, "ws-encoder"

    new-instance v3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket13FrameEncoder;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket13FrameEncoder;-><init>(Z)V

    invoke-interface {v0, v1, v2, v3}, Lorg/jboss/netty/channel/ChannelPipeline;->replace(Ljava/lang/Class;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 184
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13$1;->val$handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 189
    :goto_0
    return-void

    .line 187
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketClientHandshaker13$1;->val$handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0
.end method
