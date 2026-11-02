.class final Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;
.super Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;
.source "NioClientSocketChannel.java"


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field volatile boundManually:Z

.field connectDeadlineNanos:J

.field volatile connectFuture:Lorg/jboss/netty/channel/ChannelFuture;

.field volatile requestedRemoteAddress:Ljava/net/SocketAddress;

.field volatile timoutTimer:Lorg/jboss/netty/util/Timeout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method constructor <init>(Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Lorg/jboss/netty/channel/socket/nio/NioWorker;)V
    .locals 7
    .param p1, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p2, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p3, "sink"    # Lorg/jboss/netty/channel/ChannelSink;
    .param p4, "worker"    # Lorg/jboss/netty/channel/socket/nio/NioWorker;

    .prologue
    .line 82
    const/4 v1, 0x0

    invoke-static {}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->newSocket()Ljava/nio/channels/SocketChannel;

    move-result-object v5

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lorg/jboss/netty/channel/socket/nio/NioSocketChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Ljava/nio/channels/SocketChannel;Lorg/jboss/netty/channel/socket/nio/NioWorker;)V

    .line 83
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelOpen(Lorg/jboss/netty/channel/Channel;)V

    .line 84
    return-void
.end method

.method private static newSocket()Ljava/nio/channels/SocketChannel;
    .locals 6

    .prologue
    .line 41
    :try_start_0
    invoke-static {}, Ljava/nio/channels/SocketChannel;->open()Ljava/nio/channels/SocketChannel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 46
    .local v1, "socket":Ljava/nio/channels/SocketChannel;
    const/4 v2, 0x0

    .line 48
    .local v2, "success":Z
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {v1, v3}, Ljava/nio/channels/SocketChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    const/4 v2, 0x1

    .line 53
    if-nez v2, :cond_0

    .line 55
    :try_start_2
    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 66
    :cond_0
    :goto_0
    return-object v1

    .line 42
    .end local v1    # "socket":Ljava/nio/channels/SocketChannel;
    .end local v2    # "success":Z
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/jboss/netty/channel/ChannelException;

    const-string v4, "Failed to open a socket."

    invoke-direct {v3, v4, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 50
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "socket":Ljava/nio/channels/SocketChannel;
    .restart local v2    # "success":Z
    :catch_1
    move-exception v0

    .line 51
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_3
    new-instance v3, Lorg/jboss/netty/channel/ChannelException;

    const-string v4, "Failed to enter non-blocking mode."

    invoke-direct {v3, v4, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 53
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    if-nez v2, :cond_1

    .line 55
    :try_start_4
    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 53
    :cond_1
    :goto_1
    throw v3

    .line 56
    :catch_2
    move-exception v0

    .line 57
    .restart local v0    # "e":Ljava/io/IOException;
    sget-object v4, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v4}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 58
    sget-object v4, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v5, "Failed to close a partially initialized socket."

    invoke-interface {v4, v5, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 56
    .end local v0    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 57
    .restart local v0    # "e":Ljava/io/IOException;
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 58
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v4, "Failed to close a partially initialized socket."

    invoke-interface {v3, v4, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
