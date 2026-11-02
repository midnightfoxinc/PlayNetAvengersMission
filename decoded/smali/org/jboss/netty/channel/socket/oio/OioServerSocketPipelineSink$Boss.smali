.class final Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;
.super Ljava/lang/Object;
.source "OioServerSocketPipelineSink.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Boss"
.end annotation


# instance fields
.field private final channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

.field final synthetic this$0:Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;)V
    .locals 0
    .param p2, "channel"    # Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    .prologue
    .line 188
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->this$0:Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    .line 190
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 193
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    iget-object v1, v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->shutdownLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 195
    :cond_0
    :goto_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->isBound()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_2

    .line 197
    :try_start_1
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    iget-object v1, v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    .line 199
    .local v5, "acceptedSocket":Ljava/net/Socket;
    :try_start_2
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    invoke-virtual {v1}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;->getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelPipelineFactory;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v3

    .line 201
    .local v3, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    new-instance v0, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    invoke-virtual {v2}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getFactory()Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v2

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->this$0:Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;Ljava/net/Socket;)V

    .line 208
    .local v0, "acceptedChannel":Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->this$0:Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;

    iget-object v1, v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->workerExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    new-instance v4, Lorg/jboss/netty/channel/socket/oio/OioWorker;

    invoke-direct {v4, v0}, Lorg/jboss/netty/channel/socket/oio/OioWorker;-><init>(Lorg/jboss/netty/channel/socket/oio/OioSocketChannel;)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Old I/O server worker (parentId: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    invoke-virtual {v9}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->getId()Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x29

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->this$0:Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;

    invoke-static {v9}, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->access$000(Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;)Lorg/jboss/netty/util/ThreadNameDeterminer;

    move-result-object v9

    invoke-direct {v2, v4, v8, v9}, Lorg/jboss/netty/util/ThreadRenamingRunnable;-><init>(Ljava/lang/Runnable;Ljava/lang/String;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    invoke-static {v1, v2}, Lorg/jboss/netty/util/internal/DeadLockProofWorker;->start(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 215
    .end local v0    # "acceptedChannel":Lorg/jboss/netty/channel/socket/oio/OioAcceptedSocketChannel;
    .end local v3    # "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    :catch_0
    move-exception v6

    .line 216
    .local v6, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 217
    sget-object v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to initialize an accepted socket."

    invoke-interface {v1, v2, v6}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 222
    :cond_1
    :try_start_4
    invoke-virtual {v5}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 223
    :catch_1
    move-exception v7

    .line 224
    .local v7, "e2":Ljava/io/IOException;
    :try_start_5
    sget-object v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 225
    sget-object v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to close a partially accepted socket."

    invoke-interface {v1, v2, v7}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/net/SocketTimeoutException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 231
    .end local v5    # "acceptedSocket":Ljava/net/Socket;
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v7    # "e2":Ljava/io/IOException;
    :catch_2
    move-exception v1

    goto/16 :goto_0

    .line 233
    :catch_3
    move-exception v6

    .line 236
    .local v6, "e":Ljava/lang/Throwable;
    :try_start_6
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    iget-object v1, v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isBound()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    iget-object v1, v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result v1

    if-eqz v1, :cond_3

    .line 251
    .end local v6    # "e":Ljava/lang/Throwable;
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    iget-object v1, v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->shutdownLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 253
    return-void

    .line 239
    .restart local v6    # "e":Ljava/lang/Throwable;
    :cond_3
    :try_start_7
    sget-object v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 240
    sget-object v1, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to accept a connection."

    invoke-interface {v1, v2, v6}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 244
    :cond_4
    const-wide/16 v8, 0x3e8

    :try_start_8
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0

    .line 245
    :catch_4
    move-exception v1

    goto/16 :goto_0

    .line 251
    .end local v6    # "e":Ljava/lang/Throwable;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/jboss/netty/channel/socket/oio/OioServerSocketPipelineSink$Boss;->channel:Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;

    iget-object v2, v2, Lorg/jboss/netty/channel/socket/oio/OioServerSocketChannel;->shutdownLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method
