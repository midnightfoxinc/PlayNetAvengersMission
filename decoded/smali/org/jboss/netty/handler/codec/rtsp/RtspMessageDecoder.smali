.class public abstract Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;
.super Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;
.source "RtspMessageDecoder.java"


# instance fields
.field private final aggregator:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder",
            "<",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x2000

    .line 66
    const/16 v0, 0x1000

    invoke-direct {p0, v0, v1, v1}, Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;-><init>(III)V

    .line 67
    return-void
.end method

.method protected constructor <init>(III)V
    .locals 4
    .param p1, "maxInitialLineLength"    # I
    .param p2, "maxHeaderSize"    # I
    .param p3, "maxContentLength"    # I

    .prologue
    .line 73
    mul-int/lit8 v0, p3, 0x2

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;-><init>(III)V

    .line 74
    new-instance v0, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    const/4 v1, 0x1

    new-array v1, v1, [Lorg/jboss/netty/channel/ChannelUpstreamHandler;

    const/4 v2, 0x0

    new-instance v3, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;

    invoke-direct {v3, p3}, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;-><init>(I)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;-><init>([Lorg/jboss/netty/channel/ChannelUpstreamHandler;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;->aggregator:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    .line 75
    return-void
.end method


# virtual methods
.method protected bridge synthetic decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x2"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "x3"    # Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 56
    check-cast p4, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 80
    invoke-super {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    .line 81
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;->aggregator:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    invoke-virtual {v1, v0}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->offer(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;->aggregator:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 84
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected isContentAlwaysEmpty(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 4
    .param p1, "msg"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    const/4 v1, 0x1

    .line 92
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->isContentAlwaysEmpty(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v0

    .line 93
    .local v0, "empty":Z
    if-eqz v0, :cond_1

    move v0, v1

    .line 99
    .end local v0    # "empty":Z
    :cond_0
    :goto_0
    return v0

    .line 96
    .restart local v0    # "empty":Z
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v2

    const-string v3, "Content-Length"

    invoke-virtual {v2, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    .line 97
    goto :goto_0
.end method
