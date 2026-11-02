.class Lorg/jboss/netty/channel/socket/oio/OioWorker;
.super Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;
.source "OioWorker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker",
        "<",
        "Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;",
        ">;"
    }
.end annotation


# static fields
.field private static final SOCKET_CLOSED_MESSAGE:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 36
    const-string v0, "^.*(?:Socket.*closed).*$"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->SOCKET_CLOSED_MESSAGE:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;)V
    .locals 0
    .param p1, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;-><init>(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)V

    .line 41
    return-void
.end method

.method static write(Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V
    .locals 18
    .param p0, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "message"    # Ljava/lang/Object;

    .prologue
    .line 80
    invoke-static/range {p0 .. p0}, Lorg/jboss/netty/channel/socket/oio/OioWorker;->isIoThread(Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;)Z

    move-result v7

    .line 81
    .local v7, "iothread":Z
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    .line 82
    .local v11, "out":Ljava/io/OutputStream;
    if-nez v11, :cond_1

    .line 83
    new-instance v5, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v5}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    .line 84
    .local v5, "e":Ljava/lang/Exception;
    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 85
    if-eqz v7, :cond_0

    .line 86
    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 150
    .end local v5    # "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 88
    .restart local v5    # "e":Ljava/lang/Exception;
    :cond_0
    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 94
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v10, 0x0

    .line 98
    .local v10, "length":I
    :try_start_0
    move-object/from16 v0, p2

    instance-of v13, v0, Lorg/jboss/netty/channel/FileRegion;

    if-eqz v13, :cond_7

    .line 99
    move-object/from16 v0, p2

    check-cast v0, Lorg/jboss/netty/channel/FileRegion;

    move-object v6, v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .local v6, "fr":Lorg/jboss/netty/channel/FileRegion;
    :try_start_1
    monitor-enter v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 102
    :try_start_2
    invoke-static {v11}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v3

    .line 105
    .local v3, "bchannel":Ljava/nio/channels/WritableByteChannel;
    :cond_2
    int-to-long v14, v10

    invoke-interface {v6, v3, v14, v15}, Lorg/jboss/netty/channel/FileRegion;->transferTo(Ljava/nio/channels/WritableByteChannel;J)J

    move-result-wide v8

    .local v8, "i":J
    const-wide/16 v14, 0x0

    cmp-long v13, v8, v14

    if-lez v13, :cond_3

    .line 106
    int-to-long v14, v10

    add-long/2addr v14, v8

    long-to-int v10, v14

    .line 107
    int-to-long v14, v10

    invoke-interface {v6}, Lorg/jboss/netty/channel/FileRegion;->getCount()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-ltz v13, :cond_2

    .line 111
    :cond_3
    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 113
    :try_start_3
    instance-of v13, v6, Lorg/jboss/netty/channel/DefaultFileRegion;

    if-eqz v13, :cond_4

    .line 114
    move-object v0, v6

    check-cast v0, Lorg/jboss/netty/channel/DefaultFileRegion;

    move-object v4, v0

    .line 115
    .local v4, "dfr":Lorg/jboss/netty/channel/DefaultFileRegion;
    invoke-virtual {v4}, Lorg/jboss/netty/channel/DefaultFileRegion;->releaseAfterTransfer()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 116
    invoke-interface {v6}, Lorg/jboss/netty/channel/FileRegion;->releaseExternalResources()V

    .line 128
    .end local v3    # "bchannel":Ljava/nio/channels/WritableByteChannel;
    .end local v4    # "dfr":Lorg/jboss/netty/channel/DefaultFileRegion;
    .end local v6    # "fr":Lorg/jboss/netty/channel/FileRegion;
    .end local v8    # "i":J
    :cond_4
    :goto_1
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 129
    if-eqz v7, :cond_8

    .line 130
    int-to-long v14, v10

    move-object/from16 v0, p0

    invoke-static {v0, v14, v15}, Lorg/jboss/netty/channel/Channels;->fireWriteComplete(Lorg/jboss/netty/channel/Channel;J)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v12

    .line 138
    .local v12, "t":Ljava/lang/Throwable;
    instance-of v13, v12, Ljava/net/SocketException;

    if-eqz v13, :cond_5

    sget-object v13, Lorg/jboss/netty/channel/socket/oio/OioWorker;->SOCKET_CLOSED_MESSAGE:Ljava/util/regex/Pattern;

    invoke-virtual {v12}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-eqz v13, :cond_5

    .line 141
    new-instance v12, Ljava/nio/channels/ClosedChannelException;

    .end local v12    # "t":Ljava/lang/Throwable;
    invoke-direct {v12}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    .line 143
    .restart local v12    # "t":Ljava/lang/Throwable;
    :cond_5
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 144
    if-eqz v7, :cond_9

    .line 145
    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 111
    .end local v12    # "t":Ljava/lang/Throwable;
    .restart local v6    # "fr":Lorg/jboss/netty/channel/FileRegion;
    :catchall_0
    move-exception v13

    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v13
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 113
    :catchall_1
    move-exception v13

    :try_start_6
    instance-of v14, v6, Lorg/jboss/netty/channel/DefaultFileRegion;

    if-eqz v14, :cond_6

    .line 114
    move-object v0, v6

    check-cast v0, Lorg/jboss/netty/channel/DefaultFileRegion;

    move-object v4, v0

    .line 115
    .restart local v4    # "dfr":Lorg/jboss/netty/channel/DefaultFileRegion;
    invoke-virtual {v4}, Lorg/jboss/netty/channel/DefaultFileRegion;->releaseAfterTransfer()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 116
    invoke-interface {v6}, Lorg/jboss/netty/channel/FileRegion;->releaseExternalResources()V

    .line 113
    .end local v4    # "dfr":Lorg/jboss/netty/channel/DefaultFileRegion;
    :cond_6
    throw v13

    .line 121
    .end local v6    # "fr":Lorg/jboss/netty/channel/FileRegion;
    :cond_7
    move-object/from16 v0, p2

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object v2, v0

    .line 122
    .local v2, "a":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    .line 123
    monitor-enter v11
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    .line 124
    :try_start_7
    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v13

    invoke-interface {v2, v13, v11, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(ILjava/io/OutputStream;I)V

    .line 125
    monitor-exit v11

    goto :goto_1

    :catchall_2
    move-exception v13

    monitor-exit v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    throw v13

    .line 132
    .end local v2    # "a":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_8
    int-to-long v14, v10

    move-object/from16 v0, p0

    invoke-static {v0, v14, v15}, Lorg/jboss/netty/channel/Channels;->fireWriteCompleteLater(Lorg/jboss/netty/channel/Channel;J)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0

    goto/16 :goto_0

    .line 147
    .restart local v12    # "t":Ljava/lang/Throwable;
    :cond_9
    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    goto/16 :goto_0
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
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 58
    iget-object v5, p0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    check-cast v5, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;

    invoke-virtual {v5}, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->getInputStream()Ljava/io/PushbackInputStream;

    move-result-object v3

    .line 59
    .local v3, "in":Ljava/io/PushbackInputStream;
    invoke-virtual {v3}, Ljava/io/PushbackInputStream;->available()I

    move-result v2

    .line 60
    .local v2, "bytesToRead":I
    if-lez v2, :cond_0

    .line 61
    new-array v1, v2, [B

    .line 62
    .local v1, "buf":[B
    invoke-virtual {v3, v1}, Ljava/io/PushbackInputStream;->read([B)I

    move-result v4

    .line 71
    .local v4, "readBytes":I
    iget-object v8, p0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    check-cast v5, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;

    invoke-virtual {v5}, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/SocketChannelConfig;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/SocketChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v5

    invoke-interface {v5, v1, v7, v4}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer([BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-static {v8, v5}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    move v5, v6

    .line 73
    .end local v1    # "buf":[B
    .end local v4    # "readBytes":I
    :goto_0
    return v5

    .line 64
    :cond_0
    invoke-virtual {v3}, Ljava/io/PushbackInputStream;->read()I

    move-result v0

    .line 65
    .local v0, "b":I
    if-gez v0, :cond_1

    move v5, v7

    .line 66
    goto :goto_0

    .line 68
    :cond_1
    invoke-virtual {v3, v0}, Ljava/io/PushbackInputStream;->unread(I)V

    move v5, v6

    .line 69
    goto :goto_0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 45
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    instance-of v0, v1, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;

    .line 46
    .local v0, "fireConnected":Z
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    check-cast v1, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioWorker;->channel:Lorg/jboss/netty/channel/socket/oio/AbstractOioChannel;

    check-cast v1, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;->getRemoteAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    invoke-static {v2, v1}, Lorg/jboss/netty/channel/Channels;->fireChannelConnected(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 51
    :cond_0
    invoke-super {p0}, Lorg/jboss/netty/channel/socket/oio/AbstractOioWorker;->run()V

    .line 52
    return-void
.end method
