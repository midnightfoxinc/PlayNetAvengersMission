.class public Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;
.super Lcom/ning/http/client/HttpResponseBodyPart;
.source "NettyResponseBodyPart.java"


# instance fields
.field private volatile bytes:[B

.field private final content:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private final length:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/handler/codec/http/HttpChunk;Z)V
    .locals 1
    .param p1, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p2, "chunk"    # Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .param p3, "last"    # Z

    .prologue
    .line 42
    invoke-direct {p0, p3}, Lcom/ning/http/client/HttpResponseBodyPart;-><init>(Z)V

    .line 43
    if-eqz p2, :cond_0

    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 44
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->length:I

    .line 45
    return-void

    .line 43
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpResponse;Z)V
    .locals 1
    .param p1, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .param p2, "last"    # Z

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;-><init>(Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/handler/codec/http/HttpChunk;Z)V

    .line 39
    return-void
.end method


# virtual methods
.method public getBodyByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getBodyPartBytes()[B
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->bytes:[B

    if-nez v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/util/ChannelBufferUtils;->channelBuffer2bytes(Lorg/jboss/netty/buffer/ChannelBuffer;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->bytes:[B

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->bytes:[B

    return-object v0
.end method

.method public getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->length:I

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)I
    .locals 3
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 60
    .local v0, "b":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    .line 61
    .local v2, "read":I
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    .line 62
    .local v1, "index":I
    if-lez v2, :cond_0

    .line 63
    invoke-interface {v0, p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(Ljava/io/OutputStream;I)V

    .line 65
    :cond_0
    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 66
    return v2
.end method
