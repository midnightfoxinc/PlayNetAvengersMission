.class public abstract Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;
.super Lorg/jboss/netty/channel/SimpleChannelHandler;
.source "HttpContentEncoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final acceptEncodingQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile offerred:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 55
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->acceptEncodingQueue:Ljava/util/Queue;

    .line 63
    return-void
.end method

.method private encode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->offerred:Z

    .line 205
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    invoke-virtual {v0, p1}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;->offer(Ljava/lang/Object;)Z

    .line 206
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;->size()I

    move-result v1

    new-array v1, v1, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;->pollAll([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method private finishEncode()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 210
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    if-nez v1, :cond_0

    .line 211
    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->offerred:Z

    .line 212
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 228
    :goto_0
    return-object v0

    .line 216
    :cond_0
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->offerred:Z

    if-nez v1, :cond_1

    .line 219
    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->offerred:Z

    .line 220
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    sget-object v2, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;->offer(Ljava/lang/Object;)Z

    .line 222
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;->finish()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 223
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;->size()I

    move-result v2

    new-array v2, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;->pollAll([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 227
    .local v0, "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    goto :goto_0

    .line 225
    .end local v0    # "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
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
    .line 237
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
    .line 244
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->finishEncode()Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 245
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
    .line 233
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
    .line 241
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
    .line 177
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->finishEncode()Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 179
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 180
    return-void
.end method

.method protected abstract getTargetContentEncoding(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 68
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    .line 69
    .local v2, "msg":Ljava/lang/Object;
    instance-of v4, v2, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    if-nez v4, :cond_0

    .line 70
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 83
    :goto_0
    return-void

    :cond_0
    move-object v1, v2

    .line 74
    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 75
    .local v1, "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v4

    const-string v5, "Accept-Encoding"

    invoke-virtual {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "acceptedEncoding":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 77
    const-string v0, "identity"

    .line 79
    :cond_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->acceptEncodingQueue:Ljava/util/Queue;

    invoke-interface {v4, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v3

    .line 80
    .local v3, "offered":Z
    sget-boolean v4, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->$assertionsDisabled:Z

    if-nez v4, :cond_2

    if-nez v3, :cond_2

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 82
    :cond_2
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method

.method protected abstract newContentEncoder(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            "Ljava/lang/String;",
            ")",
            "Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder",
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

.method public writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 13
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

    .line 89
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v7

    .line 90
    .local v7, "msg":Ljava/lang/Object;
    instance-of v8, v7, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v8, :cond_1

    move-object v8, v7

    check-cast v8, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v8

    invoke-virtual {v8}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v8

    const/16 v11, 0x64

    if-ne v8, v11, :cond_1

    .line 92
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 172
    :cond_0
    :goto_0
    return-void

    .line 93
    :cond_1
    instance-of v8, v7, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    if-eqz v8, :cond_8

    move-object v6, v7

    .line 94
    check-cast v6, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 97
    .local v6, "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->finishEncode()Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 99
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->acceptEncodingQueue:Ljava/util/Queue;

    invoke-interface {v8}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 100
    .local v0, "acceptEncoding":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 101
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "cannot send more responses than requests"

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 104
    :cond_2
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v11, "Content-Encoding"

    invoke-virtual {v8, v11}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 105
    .local v3, "contentEncoding":Ljava/lang/String;
    if-eqz v3, :cond_3

    const-string v8, "identity"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 108
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 111
    :cond_3
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v8

    if-nez v8, :cond_4

    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_6

    :cond_4
    move v4, v10

    .line 112
    .local v4, "hasContent":Z
    :goto_1
    if-eqz v4, :cond_5

    invoke-virtual {p0, v6, v0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->newContentEncoder(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    move-result-object v8

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    if-eqz v8, :cond_5

    .line 115
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v11, "Content-Encoding"

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->getTargetContentEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v11, v12}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 119
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 120
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v9, "Content-Length"

    invoke-virtual {v8, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 138
    :cond_5
    :goto_2
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .end local v4    # "hasContent":Z
    :cond_6
    move v4, v9

    .line 111
    goto :goto_1

    .line 122
    .restart local v4    # "hasContent":Z
    :cond_7
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 124
    .local v2, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v8, 0x2

    new-array v8, v8, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v11

    aput-object v11, v8, v9

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->finishEncode()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v8}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 128
    invoke-interface {v6, v2}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 129
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v9, "Content-Length"

    invoke-virtual {v8, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 130
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    const-string v9, "Content-Length"

    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_2

    .line 140
    .end local v0    # "acceptEncoding":Ljava/lang/String;
    .end local v2    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "contentEncoding":Ljava/lang/String;
    .end local v4    # "hasContent":Z
    .end local v6    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :cond_8
    instance-of v8, v7, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v8, :cond_c

    move-object v1, v7

    .line 141
    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .line 142
    .local v1, "c":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 145
    .restart local v2    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encoder:Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    if-eqz v8, :cond_b

    .line 146
    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v8

    if-nez v8, :cond_9

    .line 147
    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 148
    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 149
    invoke-interface {v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 150
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 153
    :cond_9
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;->finishEncode()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    .line 157
    .local v5, "lastProduct":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_a

    .line 158
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v8

    invoke-static {v8}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    new-instance v9, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v9, v5}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v10

    invoke-static {p1, v8, v9, v10}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 164
    :cond_a
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 167
    .end local v5    # "lastProduct":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_b
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 170
    .end local v1    # "c":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .end local v2    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_c
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0
.end method
