.class public Lorg/jboss/netty/handler/codec/spdy/SpdyHttpCodec;
.super Ljava/lang/Object;
.source "SpdyHttpCodec.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# instance fields
.field private final decoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;

.field private final encoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V
    .locals 1
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "maxContentLength"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;

    invoke-direct {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpCodec;->decoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;

    .line 38
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpCodec;->encoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;

    .line 39
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
    .line 48
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpCodec;->encoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 49
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
    .line 43
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpCodec;->decoder:Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;

    invoke-virtual {v0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 44
    return-void
.end method
