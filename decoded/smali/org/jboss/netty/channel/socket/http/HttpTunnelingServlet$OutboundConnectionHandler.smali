.class final Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "HttpTunnelingServlet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OutboundConnectionHandler"
.end annotation


# instance fields
.field private final out:Ljavax/servlet/ServletOutputStream;


# direct methods
.method public constructor <init>(Ljavax/servlet/ServletOutputStream;)V
    .locals 0
    .param p1, "out"    # Ljavax/servlet/ServletOutputStream;

    .prologue
    .line 275
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 276
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;->out:Ljavax/servlet/ServletOutputStream;

    .line 277
    return-void
.end method


# virtual methods
.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ExceptionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 290
    sget-object v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v0}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 291
    sget-object v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v1, "Unexpected exception while HTTP tunneling"

    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 293
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 294
    return-void
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 281
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 282
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    monitor-enter p0

    .line 283
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;->out:Ljavax/servlet/ServletOutputStream;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(Ljava/io/OutputStream;I)V

    .line 284
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;->out:Ljavax/servlet/ServletOutputStream;

    invoke-virtual {v1}, Ljavax/servlet/ServletOutputStream;->flush()V

    .line 285
    monitor-exit p0

    .line 286
    return-void

    .line 285
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
