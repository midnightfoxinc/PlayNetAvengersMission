.class public Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "HttpChunkAggregator.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# static fields
.field private static final CONTINUE:Lorg/jboss/netty/buffer/ChannelBuffer;

.field public static final DEFAULT_MAX_COMPOSITEBUFFER_COMPONENTS:I = 0x400


# instance fields
.field private ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

.field private final maxContentLength:I

.field private maxCumulationBufferComponents:I

.field private tooLongFrameFound:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 57
    const-string v0, "HTTP/1.1 100 Continue\r\n\r\n"

    sget-object v1, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-static {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->CONTINUE:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "maxContentLength"    # I

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 65
    const/16 v0, 0x400

    iput v0, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->maxCumulationBufferComponents:I

    .line 76
    if-gtz p1, :cond_0

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxContentLength must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->maxContentLength:I

    .line 82
    return-void
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
    .line 227
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
    .line 235
    return-void
.end method

.method protected appendToCumulation(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 9
    .param p1, "input"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 203
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 204
    .local v2, "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    instance-of v4, v2, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    if-eqz v4, :cond_1

    move-object v1, v2

    .line 206
    check-cast v1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    .line 207
    .local v1, "composite":Lorg/jboss/netty/buffer/CompositeChannelBuffer;
    invoke-virtual {v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->numComponents()I

    move-result v4

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->maxCumulationBufferComponents:I

    if-lt v4, v5, :cond_0

    .line 208
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    new-array v5, v6, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->copy()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    aput-object v6, v5, v7

    aput-object p1, v5, v8

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 219
    .end local v1    # "composite":Lorg/jboss/netty/buffer/CompositeChannelBuffer;
    :goto_0
    return-void

    .line 210
    .restart local v1    # "composite":Lorg/jboss/netty/buffer/CompositeChannelBuffer;
    :cond_0
    invoke-virtual {v1}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->readableBytes()I

    move-result v4

    invoke-virtual {v1, v7, v4}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->decompose(II)Ljava/util/List;

    move-result-object v3

    .line 211
    .local v3, "decomposed":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 212
    .local v0, "buffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    array-length v4, v0

    add-int/lit8 v4, v4, -0x1

    aput-object p1, v0, v4

    .line 214
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0

    .line 217
    .end local v0    # "buffers":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "composite":Lorg/jboss/netty/buffer/CompositeChannelBuffer;
    .end local v3    # "decomposed":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    :cond_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    new-array v5, v6, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v2, v5, v7

    aput-object p1, v5, v8

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0
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
    .line 222
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 223
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
    .line 231
    return-void
.end method

.method public final getMaxCumulationBufferComponents()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->maxCumulationBufferComponents:I

    return v0
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
    const/4 v10, 0x0

    const/4 v11, 0x0

    .line 120
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v6

    .line 121
    .local v6, "msg":Ljava/lang/Object;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 123
    .local v2, "currentMessage":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    instance-of v8, v6, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    if-eqz v8, :cond_3

    move-object v5, v6

    .line 124
    check-cast v5, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 125
    .local v5, "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    iput-boolean v10, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->tooLongFrameFound:Z

    .line 132
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->is100ContinueExpected(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 133
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v8

    invoke-static {v8}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    sget-object v9, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->CONTINUE:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    invoke-static {p1, v8, v9}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 136
    :cond_0
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 139
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/HttpCodecUtil;->removeTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 140
    invoke-interface {v5, v10}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setChunked(Z)V

    .line 141
    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 200
    .end local v5    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :cond_1
    :goto_0
    return-void

    .line 144
    .restart local v5    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :cond_2
    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 145
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 147
    .end local v5    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :cond_3
    instance-of v8, v6, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v8, :cond_8

    .line 149
    if-nez v2, :cond_4

    .line 150
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "received "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-class v10, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " without "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-class v10, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_4
    move-object v0, v6

    .line 154
    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .line 156
    .local v0, "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->tooLongFrameFound:Z

    if-eqz v8, :cond_5

    .line 157
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 158
    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto :goto_0

    .line 164
    :cond_5
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 166
    .local v1, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v8

    iget v9, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->maxContentLength:I

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    invoke-interface {v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    sub-int/2addr v9, v10

    if-le v8, v9, :cond_6

    .line 167
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->tooLongFrameFound:Z

    .line 169
    new-instance v8, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "HTTP content length exceeded "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->maxContentLength:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " bytes."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 175
    :cond_6
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->appendToCumulation(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 177
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 178
    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->currentMessage:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 181
    instance-of v8, v0, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    if-eqz v8, :cond_7

    move-object v7, v0

    .line 182
    check-cast v7, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    .line 183
    .local v7, "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    invoke-interface {v7}, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    invoke-virtual {v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 184
    .local v3, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v9

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v8, v10}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_1

    .line 189
    .end local v3    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v7    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    :cond_7
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v9, "Content-Length"

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 194
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v8

    invoke-static {p1, v2, v8}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_0

    .line 198
    .end local v0    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .end local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_8
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0
.end method

.method public final setMaxCumulationBufferComponents(I)V
    .locals 3
    .param p1, "maxCumulationBufferComponents"    # I

    .prologue
    .line 102
    const/4 v0, 0x2

    if-ge p1, v0, :cond_0

    .line 103
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxCumulationBufferComponents: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: >= 2)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-nez v0, :cond_1

    .line 109
    iput p1, p0, Lorg/jboss/netty/handler/codec/http/HttpChunkAggregator;->maxCumulationBufferComponents:I

    .line 114
    return-void

    .line 111
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "decoder properties cannot be changed once the decoder is added to a pipeline."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
