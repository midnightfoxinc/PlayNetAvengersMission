.class Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;
.super Lorg/jboss/netty/channel/AbstractServerChannel;
.source "OioServerSocketChannel.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/ServerSocketChannel;


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final config:Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

.field final shutdownLock:Ljava/util/concurrent/locks/Lock;

.field final socket:Ljava/net/ServerSocket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-class v0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method constructor <init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V
    .locals 4
    .param p1, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p2, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p3, "sink"    # Lorg/jboss/netty/channel/ChannelSink;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/channel/AbstractServerChannel;-><init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 44
    new-instance v2, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->shutdownLock:Ljava/util/concurrent/locks/Lock;

    .line 55
    :try_start_0
    new-instance v2, Ljava/net/ServerSocket;

    invoke-direct {v2}, Ljava/net/ServerSocket;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v3}, Ljava/net/ServerSocket;->setSoTimeout(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 76
    new-instance v2, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;

    iget-object v3, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-direct {v2, v3}, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;-><init>(Ljava/net/ServerSocket;)V

    iput-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->config:Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

    .line 78
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelOpen(Lorg/jboss/netty/channel/Channel;)V

    .line 79
    return-void

    .line 56
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/jboss/netty/channel/ChannelException;

    const-string v3, "Failed to open a server socket."

    invoke-direct {v2, v3, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 63
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 65
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_2
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 72
    :cond_0
    :goto_0
    new-instance v2, Lorg/jboss/netty/channel/ChannelException;

    const-string v3, "Failed to set the server socket timeout."

    invoke-direct {v2, v3, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 66
    :catch_2
    move-exception v1

    .line 67
    .local v1, "e2":Ljava/io/IOException;
    sget-object v2, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 68
    sget-object v2, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v3, "Failed to close a partially initialized socket."

    invoke-interface {v2, v3, v1}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic getConfig()Lorg/jboss/netty/channel/ChannelConfig;
    .locals 1

    .prologue
    .line 37
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

    move-result-object v0

    return-object v0
.end method

.method public getConfig()Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->config:Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

    return-object v0
.end method

.method public getLocalAddress()Ljava/net/InetSocketAddress;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public bridge synthetic getLocalAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 37
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetSocketAddress;
    .locals 1

    .prologue
    .line 90
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getRemoteAddress()Ljava/net/SocketAddress;
    .locals 1

    .prologue
    .line 37
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    return-object v0
.end method

.method public isBound()Z
    .locals 1

    .prologue
    .line 94
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isBound()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setClosed()Z
    .locals 1

    .prologue
    .line 99
    invoke-super {p0}, Lorg/jboss/netty/channel/AbstractServerChannel;->setClosed()Z

    move-result v0

    return v0
.end method
