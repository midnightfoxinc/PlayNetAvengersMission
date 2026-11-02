.class public Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;
.super Ljava/lang/Object;
.source "NettyFileBody.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/request/body/NettyBody;


# instance fields
.field private final file:Ljava/io/File;

.field private final length:J

.field private final nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

.field private final offset:J


# direct methods
.method public constructor <init>(Ljava/io/File;JJLcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "offset"    # J
    .param p4, "length"    # J
    .param p6, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    .line 46
    new-instance v0, Ljava/io/IOException;

    const-string v1, "File %s is not a file or doesn\'t exist"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->file:Ljava/io/File;

    .line 49
    iput-wide p2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->offset:J

    .line 50
    iput-wide p4, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->length:J

    .line 51
    iput-object p6, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 7
    .param p1, "file"    # Ljava/io/File;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    const-wide/16 v2, 0x0

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    move-object v0, p0

    move-object v1, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;-><init>(Ljava/io/File;JJLcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V

    .line 42
    return-void
.end method


# virtual methods
.method public getContentLength()J
    .locals 2

    .prologue
    .line 64
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->length:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->file:Ljava/io/File;

    return-object v0
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 59
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->offset:J

    return-wide v0
.end method

.method public write(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 11
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
    .line 74
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->file:Ljava/io/File;

    const-string v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 78
    .local v1, "raf":Ljava/io/RandomAccessFile;
    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v2

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->isSslHandlerConfigured(Lorg/jboss/netty/channel/ChannelPipeline;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->isDisableZeroCopy()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 79
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/stream/ChunkedFile;

    iget-wide v2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->offset:J

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    iget-object v6, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v6}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getChunkedFileChunkSize()I

    move-result v6

    invoke-direct/range {v0 .. v6}, Lorg/jboss/netty/handler/stream/ChunkedFile;-><init>(Ljava/io/RandomAccessFile;JJI)V

    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v10

    .line 84
    .local v10, "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :goto_0
    new-instance v2, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody$1;

    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v5

    const/4 v7, 0x0

    move-object v3, p0

    move-object v4, p3

    move-object v6, p2

    move-object v8, v1

    invoke-direct/range {v2 .. v8}, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody$1;-><init>(Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;ZLjava/io/RandomAccessFile;)V

    invoke-interface {v10, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 94
    return-void

    .line 81
    .end local v10    # "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_1
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;

    iget-wide v2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyFileBody;->offset:J

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;-><init>(Ljava/io/RandomAccessFile;JJ)V

    .line 82
    .local v0, "region":Lorg/jboss/netty/channel/FileRegion;
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .restart local v10    # "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    goto :goto_0

    .line 90
    .end local v0    # "region":Lorg/jboss/netty/channel/FileRegion;
    .end local v10    # "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :catch_0
    move-exception v9

    .line 91
    .local v9, "ex":Ljava/io/IOException;
    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 92
    throw v9
.end method
