.class Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;
.super Ljava/lang/Object;
.source "WebSocketServerHandshaker.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;->writeHandshakeResponse(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/channel/ChannelHandler;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;

.field final synthetic val$httpEncoderName:Ljava/lang/String;

.field final synthetic val$p:Lorg/jboss/netty/channel/ChannelPipeline;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 172
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;->this$0:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker;

    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;->val$p:Lorg/jboss/netty/channel/ChannelPipeline;

    iput-object p3, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;->val$httpEncoderName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 174
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;->val$p:Lorg/jboss/netty/channel/ChannelPipeline;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketServerHandshaker$2;->val$httpEncoderName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;

    .line 175
    return-void
.end method
