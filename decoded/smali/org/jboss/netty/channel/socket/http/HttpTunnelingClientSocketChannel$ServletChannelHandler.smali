.class final Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "HttpTunnelingClientSocketChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ServletChannelHandler"
.end annotation


# instance fields
.field private volatile readingChunks:Z

.field final synthetic this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

.field final virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;)V
    .locals 1

    .prologue
    .line 326
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 329
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    return-void
.end method


# virtual methods
.method public channelBound(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 334
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/SocketAddress;

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 335
    return-void
.end method

.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 388
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V

    .line 389
    return-void
.end method

.method public channelDisconnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 376
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 377
    return-void
.end method

.method public channelInterestChanged(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 370
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChanged(Lorg/jboss/netty/channel/Channel;)V

    .line 371
    return-void
.end method

.method public channelUnbound(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 382
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 383
    return-void
.end method

.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ExceptionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 393
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 394
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

    iget-object v0, v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->realChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/socket/SocketChannel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 395
    return-void
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
    .line 339
    iget-boolean v3, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->readingChunks:Z

    if-nez v3, :cond_3

    .line 340
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 341
    .local v2, "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v3

    sget-object v4, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->OK:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v4}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v4

    if-eq v3, v4, :cond_0

    .line 342
    new-instance v3, Lorg/jboss/netty/channel/ChannelException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected HTTP response status: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 345
    :cond_0
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->isChunked()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 346
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->readingChunks:Z

    .line 365
    .end local v2    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :goto_0
    return-void

    .line 348
    .restart local v2    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_1
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 349
    .local v1, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 350
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

    invoke-static {v3, v1}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 353
    :cond_2
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->closeReal(Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 356
    .end local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_3
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .line 357
    .local v0, "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v3

    if-nez v3, :cond_4

    .line 358
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    goto :goto_0

    .line 360
    :cond_4
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->readingChunks:Z

    .line 362
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->this$0:Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel$ServletChannelHandler;->virtualChannel:Lorg/jboss/netty/channel/socket/SocketChannel;

    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingClientSocketChannel;->closeReal(Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0
.end method
