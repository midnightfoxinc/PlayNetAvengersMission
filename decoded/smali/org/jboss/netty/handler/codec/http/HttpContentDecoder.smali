.class public abstract Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "HttpContentDecoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# instance fields
.field private decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 56
    return-void
.end method

.method private decode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 174
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    invoke-virtual {v0, p1}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->offer(Ljava/lang/Object;)Z

    .line 175
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->size()I

    move-result v1

    new-array v1, v1, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->pollAll([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method private finishDecode()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3

    .prologue
    .line 179
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    if-nez v1, :cond_0

    .line 180
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 190
    :goto_0
    return-object v0

    .line 184
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->finish()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 185
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->size()I

    move-result v2

    new-array v2, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;->pollAll([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 189
    .local v0, "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    goto :goto_0

    .line 187
    .end local v0    # "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_1
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .restart local v0    # "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_1
.end method


# virtual methods
.method public afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 199
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 206
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->finishDecode()Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 207
    return-void
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 195
    return-void
.end method

.method public beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 203
    return-void
.end method

.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 145
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->finishDecode()Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 147
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 148
    return-void
.end method

.method protected getTargetContentEncoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "contentEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 170
    const-string v0, "identity"

    return-object v0
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 12
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 60
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v6

    .line 61
    .local v6, "msg":Ljava/lang/Object;
    instance-of v8, v6, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v8, :cond_1

    move-object v8, v6

    check-cast v8, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v8

    invoke-virtual {v8}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v8

    const/16 v11, 0x64

    if-ne v8, v11, :cond_1

    .line 63
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 140
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    instance-of v8, v6, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    if-eqz v8, :cond_7

    move-object v5, v6

    .line 65
    check-cast v5, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 68
    .local v5, "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->finishDecode()Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 71
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v11, "Content-Encoding"

    invoke-virtual {v8, v11}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "contentEncoding":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 73
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 78
    :goto_1
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v8

    if-nez v8, :cond_2

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_5

    :cond_2
    move v3, v10

    .line 79
    .local v3, "hasContent":Z
    :goto_2
    if-eqz v3, :cond_3

    invoke-virtual {p0, v2}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->newContentDecoder(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    move-result-object v8

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    if-eqz v8, :cond_3

    .line 82
    invoke-virtual {p0, v2}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->getTargetContentEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 83
    .local v7, "targetContentEncoding":Ljava/lang/String;
    const-string v8, "identity"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 86
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v11, "Content-Encoding"

    invoke-virtual {v8, v11}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 91
    :goto_3
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v8

    if-nez v8, :cond_3

    .line 92
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 94
    .local v1, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v8, 0x2

    new-array v8, v8, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v11

    aput-object v11, v8, v9

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->finishDecode()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v8}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 98
    invoke-interface {v5, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 99
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v9, "Content-Length"

    invoke-virtual {v8, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 100
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v9, "Content-Length"

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 108
    .end local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v7    # "targetContentEncoding":Ljava/lang/String;
    :cond_3
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 75
    .end local v3    # "hasContent":Z
    :cond_4
    const-string v2, "identity"

    goto :goto_1

    :cond_5
    move v3, v9

    .line 78
    goto :goto_2

    .line 88
    .restart local v3    # "hasContent":Z
    .restart local v7    # "targetContentEncoding":Ljava/lang/String;
    :cond_6
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v11, "Content-Encoding"

    invoke-virtual {v8, v11, v7}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_3

    .line 109
    .end local v2    # "contentEncoding":Ljava/lang/String;
    .end local v3    # "hasContent":Z
    .end local v5    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .end local v7    # "targetContentEncoding":Ljava/lang/String;
    :cond_7
    instance-of v8, v6, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v8, :cond_b

    move-object v0, v6

    .line 110
    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .line 111
    .local v0, "c":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 114
    .restart local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decoder:Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;

    if-eqz v8, :cond_a

    .line 115
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v8

    if-nez v8, :cond_8

    .line 116
    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 117
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 118
    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 119
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 122
    :cond_8
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentDecoder;->finishDecode()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    .line 126
    .local v4, "lastProduct":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 127
    new-instance v8, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v8, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v9

    invoke-static {p1, v8, v9}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 132
    :cond_9
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 135
    .end local v4    # "lastProduct":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_a
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 138
    .end local v0    # "c":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .end local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_b
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0
.end method

.method protected abstract newContentDecoder(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lorg/jboss/netty/handler/codec/embedder/DecoderEmbedder",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
