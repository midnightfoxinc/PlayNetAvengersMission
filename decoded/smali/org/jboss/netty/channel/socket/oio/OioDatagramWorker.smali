.class Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;
.super Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;
.source "OioDatagramWorker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker",
        "<",
        "Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;)V
    .locals 0
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;-><init>(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)V

    .line 34
    return-void
.end method

.method static disconnect(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->isConnected()Z

    move-result v0

    .line 103
    .local v0, "connected":Z
    invoke-static {p0}, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->isIoThread(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)Z

    move-result v1

    .line 106
    .local v1, "iothread":Z
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->socket:Ljava/net/MulticastSocket;

    invoke-virtual {v3}, Ljava/net/MulticastSocket;->disconnect()V

    .line 107
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 108
    if-eqz v0, :cond_0

    .line 110
    if-eqz v1, :cond_1

    .line 111
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 124
    :cond_0
    :goto_0
    return-void

    .line 113
    :cond_1
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnectedLater(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 116
    :catch_0
    move-exception v2

    .line 117
    .local v2, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 118
    if-eqz v1, :cond_2

    .line 119
    invoke-static {p0, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 121
    :cond_2
    invoke-static {p0, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0
.end method

.method static write(Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V
    .locals 12
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "message"    # Ljava/lang/Object;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 62
    invoke-static {p0}, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->isIoThread(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)Z

    move-result v4

    .line 65
    .local v4, "iothread":Z
    :try_start_0
    move-object v0, p2

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object v3, v0

    .line 66
    .local v3, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    .line 67
    .local v7, "offset":I
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    .line 68
    .local v5, "length":I
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 70
    .local v6, "nioBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 72
    new-instance v8, Ljava/net/DatagramPacket;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v10

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v11

    add-int/2addr v11, v7

    invoke-direct {v8, v10, v11, v5}, Ljava/net/DatagramPacket;-><init>([BII)V

    .line 81
    .local v8, "packet":Ljava/net/DatagramPacket;
    :goto_0
    if-eqz p3, :cond_0

    .line 82
    invoke-virtual {v8, p3}, Ljava/net/DatagramPacket;->setSocketAddress(Ljava/net/SocketAddress;)V

    .line 84
    :cond_0
    iget-object v10, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->socket:Ljava/net/MulticastSocket;

    invoke-virtual {v10, v8}, Ljava/net/MulticastSocket;->send(Ljava/net/DatagramPacket;)V

    .line 85
    if-eqz v4, :cond_2

    .line 86
    int-to-long v10, v5

    invoke-static {p0, v10, v11}, Lorg/jboss/netty/channel/Channels;->fireWriteComplete(Lorg/jboss/netty/channel/Channel;J)V

    .line 90
    :goto_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 99
    .end local v3    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v5    # "length":I
    .end local v6    # "nioBuf":Ljava/nio/ByteBuffer;
    .end local v7    # "offset":I
    .end local v8    # "packet":Ljava/net/DatagramPacket;
    :goto_2
    return-void

    .line 76
    .restart local v3    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v5    # "length":I
    .restart local v6    # "nioBuf":Ljava/nio/ByteBuffer;
    .restart local v7    # "offset":I
    :cond_1
    new-array v2, v5, [B

    .line 77
    .local v2, "arrayBuf":[B
    const/4 v10, 0x0

    invoke-interface {v3, v10, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[B)V

    .line 78
    new-instance v8, Ljava/net/DatagramPacket;

    invoke-direct {v8, v2, v5}, Ljava/net/DatagramPacket;-><init>([BI)V

    .restart local v8    # "packet":Ljava/net/DatagramPacket;
    goto :goto_0

    .line 88
    .end local v2    # "arrayBuf":[B
    :cond_2
    int-to-long v10, v5

    invoke-static {p0, v10, v11}, Lorg/jboss/netty/channel/Channels;->fireWriteCompleteLater(Lorg/jboss/netty/channel/Channel;J)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 91
    .end local v3    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v5    # "length":I
    .end local v6    # "nioBuf":Ljava/nio/ByteBuffer;
    .end local v7    # "offset":I
    .end local v8    # "packet":Ljava/net/DatagramPacket;
    :catch_0
    move-exception v9

    .line 92
    .local v9, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v9}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 93
    if-eqz v4, :cond_3

    .line 94
    invoke-static {p0, v9}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 96
    :cond_3
    invoke-static {p0, v9}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_2
.end method


# virtual methods
.method process()Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 39
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    check-cast v4, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->getConfig()Lorg/jboss/netty/channel/socket/DatagramChannelConfig;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/socket/DatagramChannelConfig;->getReceiveBufferSizePredictor()Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    move-result-object v3

    .line 42
    .local v3, "predictor":Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    invoke-interface {v3}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;->nextReceiveBufferSize()I

    move-result v4

    new-array v0, v4, [B

    .line 43
    .local v0, "buf":[B
    new-instance v2, Ljava/net/DatagramPacket;

    array-length v4, v0

    invoke-direct {v2, v0, v4}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 45
    .local v2, "packet":Ljava/net/DatagramPacket;
    :try_start_0
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    check-cast v4, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->socket:Ljava/net/MulticastSocket;

    invoke-virtual {v4, v2}, Ljava/net/MulticastSocket;->receive(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    iget-object v5, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/OioDatagramWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    check-cast v4, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/oio/OioDatagramChannel;->getConfig()Lorg/jboss/netty/channel/socket/DatagramChannelConfig;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/socket/DatagramChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {v2}, Ljava/net/DatagramPacket;->getLength()I

    move-result v7

    invoke-interface {v4, v0, v6, v7}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer([BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/net/DatagramPacket;->getSocketAddress()Ljava/net/SocketAddress;

    move-result-object v6

    invoke-static {v5, v4, v6}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 56
    :goto_0
    return v8

    .line 46
    :catch_0
    move-exception v1

    .line 49
    .local v1, "e":Ljava/io/InterruptedIOException;
    goto :goto_0
.end method
