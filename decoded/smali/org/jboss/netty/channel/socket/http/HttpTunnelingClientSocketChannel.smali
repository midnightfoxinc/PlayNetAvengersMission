.class Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;
.super Lorg/jboss/netty/channel/AbstractChannel;
.source "HttpTunnelingClientSocketChannel.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/SocketChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;
    }
.end annotation


# instance fields
.field final config:Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;

.field private final handler:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;

.field final interestOpsLock:Ljava/lang/Object;

.field final realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

.field volatile requestHeaderWritten:Z


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;)V
    .locals 3
    .param p1, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p2, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p3, "sink"    # Lorg/jboss/netty/channel/ChannelSink;
    .param p4, "clientSocketChannelFactory"    # Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;

    .prologue
    .line 77
    const/4 v1, 0x0

    invoke-direct {p0, v1, p1, p2, p3}, Lorg/jboss/netty/channel/AbstractChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 66
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->interestOpsLock:Ljava/lang/Object;

    .line 70
    new-instance v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;

    invoke-direct {v1, p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;)V

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->handler:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;

    .line 79
    new-instance v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;

    invoke-direct {v1, p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;)V

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->config:Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;

    .line 80
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline;

    invoke-direct {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;-><init>()V

    .line 81
    .local v0, "channelPipeline":Lorg/jboss/netty/channel/DefaultChannelPipeline;
    const-string v1, "decoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;

    invoke-direct {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 82
    const-string v1, "encoder"

    new-instance v2, Lorg/jboss/netty/handler/codec/http/HttpRequestEncoder;

    invoke-direct {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequestEncoder;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 83
    const-string v1, "handler"

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->handler:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 84
    invoke-interface {p4, v0}, Lorg/jboss/netty/channel/socket/ClientSocketChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/socket/SocketChannel;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    .line 86
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelOpen(Lorg/jboss/netty/channel/Channel;)V

    .line 87
    return-void
.end method

.method private writeLastChunk()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2

    .prologue
    .line 251
    iget-boolean v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->requestHeaderWritten:Z

    if-nez v0, :cond_0

    .line 252
    new-instance v0, Ljava/nio/channels/NotYetConnectedException;

    invoke-direct {v0}, Ljava/nio/channels/NotYetConnectedException;-><init>()V

    invoke-static {p0, v0}, Lorg/jboss/netty/channel/Channels;->failedFuture(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 254
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpChunk;->LAST_CHUNK:Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/socket/SocketChannel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method bindReal(Ljava/net/SocketAddress;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "localAddress"    # Ljava/net/SocketAddress;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 134
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/socket/SocketChannel;->bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$1;

    invoke-direct {v1, p0, p2}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$1;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 143
    return-void
.end method

.method closeReal(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 303
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->writeLastChunk()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$7;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$7;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 324
    return-void
.end method

.method connectReal(Ljava/net/SocketAddress;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 3
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 146
    move-object v0, p0

    .line 147
    .local v0, "virtualChannel":Lorg/jboss/netty/channel/socket/SocketChannel;
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v1, p1}, Lorg/jboss/netty/channel/socket/SocketChannel;->connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    new-instance v2, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$2;

    invoke-direct {v2, p0, p1, p2, v0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$2;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;Ljava/net/SocketAddress;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/socket/SocketChannel;)V

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 220
    return-void
.end method

.method disconnectReal(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 271
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->writeLastChunk()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$5;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$5;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 284
    return-void
.end method

.method public bridge synthetic getConfig()Lorg/jboss/netty/channel/ChannelConfig;
    .locals 1

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getConfig()Lorg/jboss/netty/channel/socket/SocketChannelConfig;
    .locals 1

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;

    move-result-object v0

    return-object v0
.end method

.method public getConfig()Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->config:Lorg/jboss/netty/channel/socket/http/HttpTunnelingSocketChannelConfig;

    return-object v0
.end method

.method public getInterestOps()I
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/SocketChannel;->getInterestOps()I

    move-result v0

    return v0
.end method

.method public getLocalAddress()Ljava/net/InetSocketAddress;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/SocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getLocalAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetSocketAddress;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/SocketChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getRemoteAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public isBound()Z
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/SocketChannel;->isBound()Z

    move-result v0

    return v0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/SocketChannel;->isConnected()Z

    move-result v0

    return v0
.end method

.method public isWritable()Z
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/SocketChannel;->isWritable()Z

    move-result v0

    return v0
.end method

.method protected setClosed()Z
    .locals 1

    .prologue
    .line 121
    invoke-super {p0}, Lorg/jboss/netty/channel/AbstractChannel;->setClosed()Z

    move-result v0

    return v0
.end method

.method setInterestOpsReal(ILorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "interestOps"    # I
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 259
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/socket/SocketChannel;->setInterestOps(I)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$4;

    invoke-direct {v1, p0, p2}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$4;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 268
    return-void
.end method

.method unbindReal(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 287
    invoke-direct {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->writeLastChunk()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$6;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$6;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 300
    return-void
.end method

.method public write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "message"    # Ljava/lang/Object;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 126
    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 127
    :cond_0
    const/4 v0, 0x0

    invoke-super {p0, p1, v0}, Lorg/jboss/netty/channel/AbstractChannel;->write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 129
    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->getUnsupportedOperationFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    goto :goto_0
.end method

.method writeReal(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p1, "a"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 223
    iget-boolean v2, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->requestHeaderWritten:Z

    if-nez v2, :cond_0

    .line 224
    new-instance v2, Ljava/nio/channels/NotYetConnectedException;

    invoke-direct {v2}, Ljava/nio/channels/NotYetConnectedException;-><init>()V

    throw v2

    .line 227
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 230
    .local v1, "size":I
    if-nez v1, :cond_1

    .line 231
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    sget-object v3, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/socket/SocketChannel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 236
    .local v0, "f":Lorg/jboss/netty/channel/ChannelFuture;
    :goto_0
    new-instance v2, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$3;

    invoke-direct {v2, p0, p2, v1}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$3;-><init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;I)V

    invoke-interface {v0, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 248
    return-void

    .line 233
    .end local v0    # "f":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    new-instance v3, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v3, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/socket/SocketChannel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .restart local v0    # "f":Lorg/jboss/netty/channel/ChannelFuture;
    goto :goto_0
.end method
