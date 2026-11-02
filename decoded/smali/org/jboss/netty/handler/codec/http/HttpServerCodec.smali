.class public Lorg/jboss/netty/handler/codec/http/HttpServerCodec;
.super Ljava/lang/Object;
.source "HttpServerCodec.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# instance fields
.field private final decoder:Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;

.field private final encoder:Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x2000

    .line 43
    const/16 v0, 0x1000

    invoke-direct {p0, v0, v1, v1}, Lorg/jboss/netty/handler/codec/http/HttpServerCodec;-><init>(III)V

    .line 44
    return-void
.end method

.method public constructor <init>(III)V
    .locals 1
    .param p1, "maxInitialLineLength"    # I
    .param p2, "maxHeaderSize"    # I
    .param p3, "maxChunkSize"    # I

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpServerCodec;->encoder:Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;

    .line 51
    new-instance v0, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;

    invoke-direct {v0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;-><init>(III)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpServerCodec;->decoder:Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;

    .line 52
    return-void
.end method


# virtual methods
.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpServerCodec;->encoder:Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpResponseEncoder;->handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 62
    return-void
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpServerCodec;->decoder:Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;->handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 57
    return-void
.end method
