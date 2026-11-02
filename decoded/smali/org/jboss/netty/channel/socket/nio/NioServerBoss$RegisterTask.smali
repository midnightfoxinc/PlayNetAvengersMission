.class final Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;
.super Ljava/lang/Object;
.source "NioServerBoss.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/nio/NioServerBoss;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RegisterTask"
.end annotation


# instance fields
.field private final channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

.field private final future:Lorg/jboss/netty/channel/ChannelFuture;

.field private final localAddress:Ljava/net/SocketAddress;

.field final synthetic this$0:Lorg/jboss/netty/channel/socket/nio/NioServerBoss;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/channel/socket/nio/NioServerBoss;Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/net/SocketAddress;)V
    .locals 0
    .param p2, "channel"    # Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;
    .param p3, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p4, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 183
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    iput-object p2, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    .line 185
    iput-object p3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->future:Lorg/jboss/netty/channel/ChannelFuture;

    .line 186
    iput-object p4, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->localAddress:Ljava/net/SocketAddress;

    .line 187
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 190
    const/4 v0, 0x0

    .line 191
    .local v0, "bound":Z
    const/4 v1, 0x0

    .line 193
    .local v1, "registered":Z
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    iget-object v3, v3, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->socket:Ljava/nio/channels/ServerSocketChannel;

    invoke-virtual {v3}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    move-result-object v3

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->localAddress:Ljava/net/SocketAddress;

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    invoke-virtual {v5}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->getConfig()Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;->getBacklog()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    .line 194
    const/4 v0, 0x1

    .line 196
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->future:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 197
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->getLocalAddress()Ljava/net/InetSocketAddress;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 198
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    iget-object v3, v3, Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;->socket:Ljava/nio/channels/ServerSocketChannel;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->selector:Ljava/nio/channels/Selector;

    const/16 v5, 0x10

    iget-object v6, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    invoke-virtual {v3, v4, v5, v6}, Ljava/nio/channels/ServerSocketChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    const/4 v1, 0x1

    .line 205
    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 206
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->future:Lorg/jboss/netty/channel/ChannelFuture;

    :goto_0
    invoke-virtual {v3, v4, v5}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->close(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 209
    :cond_0
    return-void

    .line 201
    :catch_0
    move-exception v2

    .line 202
    .local v2, "t":Ljava/lang/Throwable;
    :try_start_1
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->future:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v3, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 203
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    invoke-static {v3, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 205
    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 206
    iget-object v3, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->future:Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 205
    .end local v2    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v3

    if-nez v1, :cond_1

    if-eqz v0, :cond_1

    .line 206
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->this$0:Lorg/jboss/netty/channel/socket/nio/NioServerBoss;

    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->channel:Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;

    iget-object v6, p0, Lorg/jboss/netty/channel/socket/nio/NioServerBoss$RegisterTask;->future:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-virtual {v4, v5, v6}, Lorg/jboss/netty/channel/socket/nio/NioServerBoss;->close(Lorg/jboss/netty/channel/socket/nio/NioServerSocketChannel;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 205
    :cond_1
    throw v3
.end method
