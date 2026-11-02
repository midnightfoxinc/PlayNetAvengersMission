.class Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;
.super Ljava/lang/Object;
.source "WebSocketProtocol.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/HttpChunk;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->handle(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private content:Lorg/jboss/netty/buffer/ChannelBuffer;

.field final synthetic this$0:Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;

.field final synthetic val$frame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;)V
    .locals 1

    .prologue
    .line 136
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;->this$0:Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;

    iput-object p2, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;->val$frame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;->val$frame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-void
.end method


# virtual methods
.method public getContent()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;->val$frame:Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->isFinalFragment()Z

    move-result v0

    return v0
.end method

.method public setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "content"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 151
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
