.class final Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;
.super Ljava/lang/Object;
.source "NioClientBoss.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/nio/NioClientBoss;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RegisterTask"
.end annotation


# instance fields
.field private final boss:Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

.field private final channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

.field final synthetic this$0:Lorg/jboss/netty/channel/socket/nio/NioClientBoss;


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/socket/nio/NioClientBoss;Lorg/jboss/netty/channel/socket/nio/NioClientBoss;Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;)V
    .locals 0
    .param p2, "boss"    # Lorg/jboss/netty/channel/socket/nio/NioClientBoss;
    .param p3, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->boss:Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    .line 178
    iput-object p3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    .line 179
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 182
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    invoke-virtual {v3}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;->getConnectTimeoutMillis()I

    move-result v2

    .line 183
    .local v2, "timeout":I
    if-lez v2, :cond_0

    .line 184
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    invoke-virtual {v3}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_0

    .line 185
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    invoke-static {v4}, Lorg/jboss/netty/channel/socket/nio/NioClientBoss;->access$100(Lorg/jboss/netty/channel/socket/nio/NioClientBoss;)Lorg/jboss/netty/util/Timer;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    invoke-static {v5}, Lorg/jboss/netty/channel/socket/nio/NioClientBoss;->access$000(Lorg/jboss/netty/channel/socket/nio/NioClientBoss;)Lorg/jboss/netty/util/TimerTask;

    move-result-object v5

    int-to-long v6, v2

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, v5, v6, v7, v8}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v4

    iput-object v4, v3, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->timoutTimer:Lorg/jboss/netty/util/Timeout;

    .line 190
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    iget-object v3, v3, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->channel:Ljava/nio/channels/SelectableChannel;

    check-cast v3, Ljava/nio/channels/SocketChannel;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->boss:Lorg/jboss/netty/channel/socket/nio/NioClientBoss;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/nio/NioClientBoss;->selector:Ljava/nio/channels/Selector;

    const/16 v5, 0x8

    iget-object v6, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    invoke-virtual {v3, v4, v5, v6}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;
    :try_end_0
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    :goto_0
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    invoke-virtual {v3}, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/socket/nio/NioSocketChannelConfig;->getConnectTimeoutMillis()I

    move-result v0

    .line 197
    .local v0, "connectTimeout":I
    if-lez v0, :cond_1

    .line 198
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    int-to-long v6, v0

    const-wide/32 v8, 0xf4240

    mul-long/2addr v6, v8

    add-long/2addr v4, v6

    iput-wide v4, v3, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->connectDeadlineNanos:J

    .line 200
    :cond_1
    return-void

    .line 192
    .end local v0    # "connectTimeout":I
    :catch_0
    move-exception v1

    .line 193
    .local v1, "e":Ljava/nio/channels/ClosedChannelException;
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    iget-object v3, v3, Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;->worker:Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioClientBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioClientSocketChannel;

    invoke-static {v5}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/jboss/netty/channel/socket/nio/AbstractNioWorker;->close(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0
.end method
