.class public Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;
.super Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;
.source "NettyCompositeByteArrayBody.java"


# instance fields
.field private final bytes:[[B

.field private final contentLength:J

.field private final contentType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "bytes":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .locals 6
    .param p2, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[B>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "bytes":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/request/body/NettyDirectBody;-><init>()V

    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [[B

    iput-object v4, p0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;->bytes:[[B

    .line 33
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;->bytes:[[B

    invoke-interface {p1, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 34
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;->contentType:Ljava/lang/String;

    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .local v2, "l":J
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 37
    .local v0, "b":[B
    array-length v4, v0

    int-to-long v4, v4

    add-long/2addr v2, v4

    goto :goto_0

    .line 38
    .end local v0    # "b":[B
    :cond_0
    iput-wide v2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;->contentLength:J

    .line 39
    return-void
.end method


# virtual methods
.method public channelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;->bytes:[[B

    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([[B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;->contentLength:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyCompositeByteArrayBody;->contentType:Ljava/lang/String;

    return-object v0
.end method
