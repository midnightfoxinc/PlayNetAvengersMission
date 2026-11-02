.class public Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;
.super Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;
.source "NettyByteArrayBody.java"


# instance fields
.field private final bytes:[B

.field private final contentType:Ljava/lang/String;


# direct methods
.method public constructor <init>([B)V
    .locals 1
    .param p1, "bytes"    # [B

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;-><init>([BLjava/lang/String;)V

    .line 26
    return-void
.end method

.method public constructor <init>([BLjava/lang/String;)V
    .locals 0
    .param p1, "bytes"    # [B
    .param p2, "contentType"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;->bytes:[B

    .line 30
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;->contentType:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public channelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;->bytes:[B

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;->bytes:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyByteArrayBody;->contentType:Ljava/lang/String;

    return-object v0
.end method
