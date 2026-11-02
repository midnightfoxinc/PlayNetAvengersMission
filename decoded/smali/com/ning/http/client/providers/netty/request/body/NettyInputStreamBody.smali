.class public Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;
.super Ljava/lang/Object;
.source "NettyInputStreamBody.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/request/body/NettyBody;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final inputStream:Ljava/io/InputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;->inputStream:Ljava/io/InputStream;

    .line 40
    return-void
.end method


# virtual methods
.method public getContentLength()J
    .locals 2

    .prologue
    .line 48
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public write(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 10
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
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const/4 v1, 0x1

    .line 58
    iget-object v8, p0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;->inputStream:Ljava/io/InputStream;

    .line 60
    .local v8, "is":Ljava/io/InputStream;
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isStreamWasAlreadyConsumed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 61
    invoke-virtual {v8}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {v8}, Ljava/io/InputStream;->reset()V

    .line 71
    :goto_0
    new-instance v7, Lcom/ning/http/client/generators/InputStreamBodyGenerator;

    invoke-direct {v7, v8}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;-><init>(Ljava/io/InputStream;)V

    .line 73
    .local v7, "generator":Lcom/ning/http/client/generators/InputStreamBodyGenerator;
    invoke-virtual {v7, v1}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->patchNettyChunkingIssue(Z)V

    .line 74
    invoke-virtual {v7}, Lcom/ning/http/client/generators/InputStreamBodyGenerator;->createBody()Lcom/ning/http/client/Body;

    move-result-object v6

    .line 75
    .local v6, "body":Lcom/ning/http/client/Body;
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;

    invoke-direct {v0, v6}, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;-><init>(Lcom/ning/http/client/Body;)V

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v9

    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody$1;

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v3

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p3

    move-object v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody$1;-><init>(Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLcom/ning/http/client/Body;)V

    invoke-interface {v9, v0}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 94
    .end local v6    # "body":Lcom/ning/http/client/Body;
    .end local v7    # "generator":Lcom/ning/http/client/generators/InputStreamBodyGenerator;
    :goto_1
    return-void

    .line 64
    :cond_0
    sget-object v0, Lcom/ning/http/client/providers/netty/request/body/NettyInputStreamBody;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Stream has already been consumed and cannot be reset"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {p2, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setStreamWasAlreadyConsumed(Z)V

    goto :goto_0
.end method
