.class final Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler$1;
.super Lorg/jboss/netty/channel/SimpleChannelHandler;
.source "WebSocketServerProtocolHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerProtocolHandler;->forbiddenHttpRequestResponder()Lorg/jboss/netty/channel/ChannelHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 103
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 106
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    if-nez v1, :cond_0

    .line 107
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_1:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->FORBIDDEN:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 108
    .local v0, "response":Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 112
    .end local v0    # "response":Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;
    :goto_0
    return-void

    .line 110
    :cond_0
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method
