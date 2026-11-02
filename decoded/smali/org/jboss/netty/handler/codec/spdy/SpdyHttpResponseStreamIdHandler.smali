.class public Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;
.super Lorg/jboss/netty/channel/SimpleChannelHandler;
.source "SpdyHttpResponseStreamIdHandler.java"


# static fields
.field private static final NO_ID:Ljava/lang/Integer;


# instance fields
.field private final ids:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->NO_ID:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 34
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->ids:Ljava/util/Queue;

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
    .line 38
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    if-eqz v1, :cond_2

    .line 39
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v2, "X-SPDY-Stream-ID"

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v0

    .line 40
    .local v0, "contains":Z
    if-nez v0, :cond_1

    .line 41
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->ids:Ljava/util/Queue;

    sget-object v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->NO_ID:Ljava/lang/Integer;

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 49
    .end local v0    # "contains":Z
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelHandler;->messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V

    .line 50
    return-void

    .line 43
    .restart local v0    # "contains":Z
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->ids:Ljava/util/Queue;

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->getStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 45
    .end local v0    # "contains":Z
    :cond_2
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    if-eqz v1, :cond_0

    .line 47
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->ids:Ljava/util/Queue;

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;->getStreamId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 54
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v2, :cond_0

    .line 55
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 56
    .local v1, "response":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->ids:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 57
    .local v0, "id":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sget-object v3, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;->NO_ID:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eq v2, v3, :cond_0

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v2

    const-string v3, "X-SPDY-Stream-ID"

    invoke-virtual {v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 58
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->setStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V

    .line 61
    .end local v0    # "id":Ljava/lang/Integer;
    .end local v1    # "response":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelHandler;->writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V

    .line 62
    return-void
.end method
