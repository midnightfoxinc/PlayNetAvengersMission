.class public Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;
.super Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;
.source "NettyByteBufferBody.java"


# instance fields
.field private final bb:Ljava/nio/ByteBuffer;

.field private final contentType:Ljava/lang/String;

.field private final length:J


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;-><init>(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .locals 2
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .param p2, "contentType"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;->bb:Ljava/nio/ByteBuffer;

    .line 33
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;->length:J

    .line 34
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    .line 35
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;->contentType:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public channelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;->bb:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    .line 52
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;->bb:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 40
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;->length:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteBufferBody;->contentType:Ljava/lang/String;

    return-object v0
.end method
