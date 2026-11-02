.class public Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;
.super Ljava/lang/Object;
.source "NettyBodyBody.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/request/body/NettyBody;


# instance fields
.field private final body:Lcom/ning/http/client/Body;

.field private final nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/Body;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 0
    .param p1, "body"    # Lcom/ning/http/client/Body;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->body:Lcom/ning/http/client/Body;

    .line 41
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;)Lcom/ning/http/client/Body;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->body:Lcom/ning/http/client/Body;

    return-object v0
.end method


# virtual methods
.method public getBody()Lcom/ning/http/client/Body;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->body:Lcom/ning/http/client/Body;

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->body:Lcom/ning/http/client/Body;

    invoke-interface {v0}, Lcom/ning/http/client/Body;->getContentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x0

    return-object v0
.end method

.method public write(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 9
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Lcom/ning/http/client/AsyncHttpClientConfig;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->body:Lcom/ning/http/client/Body;

    instance-of v0, v0, Lcom/ning/http/client/RandomAccessBody;

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->isSslHandlerConfigured(Lorg/jboss/netty/channel/ChannelPipeline;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->isDisableZeroCopy()Z

    move-result v0

    if-nez v0, :cond_1

    .line 63
    new-instance v7, Lcom/ning/http/client/providers/netty/request/body/BodyFileRegion;

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->body:Lcom/ning/http/client/Body;

    check-cast v0, Lcom/ning/http/client/RandomAccessBody;

    invoke-direct {v7, v0}, Lcom/ning/http/client/providers/netty/request/body/BodyFileRegion;-><init>(Lcom/ning/http/client/RandomAccessBody;)V

    .line 79
    :cond_0
    :goto_0
    invoke-interface {p1, v7}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$2;

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v3

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p3

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$2;-><init>(Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)V

    invoke-interface {v8, v0}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 85
    return-void

    .line 66
    :cond_1
    new-instance v7, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->body:Lcom/ning/http/client/Body;

    invoke-direct {v7, v0}, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;-><init>(Lcom/ning/http/client/Body;)V

    .line 68
    .local v7, "msg":Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v0

    invoke-interface {v0}, Lcom/ning/http/client/Request;->getBodyGenerator()Lcom/ning/http/client/BodyGenerator;

    move-result-object v6

    .line 69
    .local v6, "bg":Lcom/ning/http/client/BodyGenerator;
    instance-of v0, v6, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;

    if-eqz v0, :cond_0

    .line 70
    const-class v0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;

    invoke-virtual {v0, v6}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;

    new-instance v1, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$1;

    invoke-direct {v1, p0, p1}, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$1;-><init>(Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;Lorg/jboss/netty/channel/Channel;)V

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->setListener(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;)V

    goto :goto_0
.end method
