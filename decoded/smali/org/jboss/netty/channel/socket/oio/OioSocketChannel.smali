.class abstract Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;
.super Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;
.source "OioSocketChannel.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/SocketChannel;


# instance fields
.field private final config:Lorg/jboss/netty/channel/socket/SocketChannelConfig;

.field final socket:Ljava/net/Socket;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Ljava/net/Socket;)V
    .locals 3
    .param p1, "parent"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p3, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p4, "sink"    # Lorg/jboss/netty/channel/ChannelSink;
    .param p5, "socket"    # Ljava/net/Socket;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 49
    iput-object p5, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->socket:Ljava/net/Socket;

    .line 51
    const/16 v1, 0x3e8

    :try_start_0
    invoke-virtual {p5, v1}, Ljava/net/Socket;->setSoTimeout(I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    new-instance v1, Lorg/jboss/netty/channel/socket/DefaultSocketChannelConfig;

    invoke-direct {v1, p5}, Lorg/jboss/netty/channel/socket/DefaultSocketChannelConfig;-><init>(Ljava/net/Socket;)V

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->config:Lorg/jboss/netty/channel/socket/SocketChannelConfig;

    .line 57
    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    const-string v2, "Failed to configure the OioSocketChannel socket timeout."

    invoke-direct {v1, v2, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method closeSocket()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 89
    return-void
.end method

.method public bridge synthetic getConfig()Lorg/jboss/netty/channel/ChannelConfig;
    .locals 1

    .prologue
    .line 34
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/SocketChannelConfig;

    move-result-object v0

    return-object v0
.end method

.method public getConfig()Lorg/jboss/netty/channel/socket/SocketChannelConfig;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->config:Lorg/jboss/netty/channel/socket/SocketChannelConfig;

    return-object v0
.end method

.method abstract getInputStream()Ljava/io/PushbackInputStream;
.end method

.method getLocalSocketAddress()Ljava/net/InetSocketAddress;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method abstract getOutputStream()Ljava/io/OutputStream;
.end method

.method getRemoteSocketAddress()Ljava/net/InetSocketAddress;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method isSocketBound()Z
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isBound()Z

    move-result v0

    return v0
.end method

.method isSocketClosed()Z
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    return v0
.end method

.method isSocketConnected()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isConnected()Z

    move-result v0

    return v0
.end method
