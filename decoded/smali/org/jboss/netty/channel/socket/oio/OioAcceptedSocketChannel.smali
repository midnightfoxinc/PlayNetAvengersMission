.class Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;
.super Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;
.source "OioAcceptedSocketChannel.java"


# instance fields
.field private final in:Ljava/io/PushbackInputStream;

.field private final out:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Ljava/net/Socket;)V
    .locals 4
    .param p1, "parent"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p3, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p4, "sink"    # Lorg/jboss/netty/channel/ChannelSink;
    .param p5, "socket"    # Ljava/net/Socket;

    .prologue
    .line 43
    invoke-direct/range {p0 .. p5}, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Ljava/net/Socket;)V

    .line 46
    :try_start_0
    new-instance v1, Ljava/io/PushbackInputStream;

    invoke-virtual {p5}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;->in:Ljava/io/PushbackInputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    :try_start_1
    invoke-virtual {p5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;->out:Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 56
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->fireChannelOpen(Lorg/jboss/netty/channel/Channel;)V

    .line 57
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 58
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    const-string v2, "Failed to obtain an InputStream."

    invoke-direct {v1, v2, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 52
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 53
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    const-string v2, "Failed to obtain an OutputStream."

    invoke-direct {v1, v2, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method getInputStream()Ljava/io/PushbackInputStream;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;->in:Ljava/io/PushbackInputStream;

    return-object v0
.end method

.method getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;->out:Ljava/io/OutputStream;

    return-object v0
.end method
