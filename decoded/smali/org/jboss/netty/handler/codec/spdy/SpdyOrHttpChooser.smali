.class public abstract Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;
.super Ljava/lang/Object;
.source "SpdyOrHttpChooser.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser$1;,
        Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser$SelectedProtocol;
    }
.end annotation


# instance fields
.field private final maxHttpContentLength:I

.field private final maxSpdyContentLength:I


# direct methods
.method protected constructor <init>(II)V
    .locals 0
    .param p1, "maxSpdyContentLength"    # I
    .param p2, "maxHttpContentLength"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->maxSpdyContentLength:I

    .line 51
    iput p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->maxHttpContentLength:I

    .line 52
    return-void
.end method


# virtual methods
.method protected addHttpHandlers(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 108
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    .line 109
    .local v0, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    const-string v1, "httpRequestDecoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;

    invoke-direct {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;-><init>()V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 110
    const-string v1, "httpResponseEncoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;

    invoke-direct {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;-><init>()V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 111
    const-string v1, "httpChunkAggregator"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;

    iget v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->maxHttpContentLength:I

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;-><init>(I)V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 112
    const-string v1, "httpRequestHandler"

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->createHttpRequestHandlerForHttp()Lorg/jboss/netty/channel/ChannelUpstreamHandler;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 113
    return-void
.end method

.method protected addSpdyHandlers(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "version"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    .prologue
    .line 95
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    .line 96
    .local v0, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    const-string v1, "spdyFrameCodec"

    new-instance v2, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;

    invoke-direct {v2, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyFrameCodec;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 97
    const-string v1, "spdySessionHandler"

    new-instance v2, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;

    const/4 v3, 0x1

    invoke-direct {v2, p2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;Z)V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 98
    const-string v1, "spdyHttpEncoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;

    invoke-direct {v2, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 99
    const-string v1, "spdyHttpDecoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;

    iget v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->maxSpdyContentLength:I

    invoke-direct {v2, p2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 100
    const-string v1, "spdyStreamIdHandler"

    new-instance v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;

    invoke-direct {v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpResponseStreamIdHandler;-><init>()V

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 101
    const-string v1, "httpRequestHandler"

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->createHttpRequestHandlerForSpdy()Lorg/jboss/netty/channel/ChannelUpstreamHandler;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 102
    return-void
.end method

.method protected abstract createHttpRequestHandlerForHttp()Lorg/jboss/netty/channel/ChannelUpstreamHandler;
.end method

.method protected createHttpRequestHandlerForSpdy()Lorg/jboss/netty/channel/ChannelUpstreamHandler;
    .locals 1

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->createHttpRequestHandlerForHttp()Lorg/jboss/netty/channel/ChannelUpstreamHandler;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getProtocol(Ljavax/net/ssl/SSLEngine;)Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser$SelectedProtocol;
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v3

    const-class v4, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-interface {v3, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    .line 64
    .local v0, "handler":Lorg/jboss/netty/handler/ssl/SslHandler;
    if-nez v0, :cond_0

    .line 66
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "SslHandler is needed for SPDY"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 69
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    .line 70
    .local v1, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    invoke-virtual {v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->getEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->getProtocol(Ljavax/net/ssl/SSLEngine;)Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser$SelectedProtocol;

    move-result-object v2

    .line 71
    .local v2, "protocol":Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser$SelectedProtocol;
    sget-object v3, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser$1;->$SwitchMap$org$jboss$netty$handler$codec$spdy$SpdyOrHttpChooser$SelectedProtocol:[I

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser$SelectedProtocol;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 83
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Unknown SelectedProtocol"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 76
    :pswitch_0
    sget-object v3, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->SPDY_3_1:Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->addSpdyHandlers(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V

    .line 87
    :goto_0
    invoke-interface {v1, p0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 88
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 89
    :pswitch_1
    return-void

    .line 80
    :pswitch_2
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyOrHttpChooser;->addHttpHandlers(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    goto :goto_0

    .line 71
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method
