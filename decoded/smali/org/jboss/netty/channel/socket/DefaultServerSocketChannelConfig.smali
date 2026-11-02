.class public Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;
.super Lorg/jboss/netty/channel/DefaultServerChannelConfig;
.source "DefaultServerSocketChannelConfig.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/ServerSocketChannelConfig;


# instance fields
.field private volatile backlog:I

.field private final socket:Ljava/net/ServerSocket;


# direct methods
.method public constructor <init>(Ljava/net/ServerSocket;)V
    .locals 2
    .param p1, "socket"    # Ljava/net/ServerSocket;

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/jboss/netty/channel/DefaultServerChannelConfig;-><init>()V

    .line 38
    if-nez p1, :cond_0

    .line 39
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "socket"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->socket:Ljava/net/ServerSocket;

    .line 42
    return-void
.end method


# virtual methods
.method public getBacklog()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->backlog:I

    return v0
.end method

.method public getReceiveBufferSize()I
    .locals 2

    .prologue
    .line 80
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->getReceiveBufferSize()I
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isReuseAddress()Z
    .locals 2

    .prologue
    .line 64
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->getReuseAddress()Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setBacklog(I)V
    .locals 3
    .param p1, "backlog"    # I

    .prologue
    .line 103
    if-gez p1, :cond_0

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "backlog: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->backlog:I

    .line 107
    return-void
.end method

.method public setOption(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 46
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->setOption(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    :goto_0
    return v0

    .line 50
    :cond_0
    const-string v1, "receiveBufferSize"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 51
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->setReceiveBufferSize(I)V

    goto :goto_0

    .line 52
    :cond_1
    const-string v1, "reuseAddress"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 53
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->setReuseAddress(Z)V

    goto :goto_0

    .line 54
    :cond_2
    const-string v1, "backlog"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 55
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->setBacklog(I)V

    goto :goto_0

    .line 57
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setPerformancePreferences(III)V
    .locals 1
    .param p1, "connectionTime"    # I
    .param p2, "latency"    # I
    .param p3, "bandwidth"    # I

    .prologue
    .line 95
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v0, p1, p2, p3}, Ljava/net/ServerSocket;->setPerformancePreferences(III)V

    .line 96
    return-void
.end method

.method public setReceiveBufferSize(I)V
    .locals 2
    .param p1, "receiveBufferSize"    # I

    .prologue
    .line 88
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1, p1}, Ljava/net/ServerSocket;->setReceiveBufferSize(I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setReuseAddress(Z)V
    .locals 2
    .param p1, "reuseAddress"    # Z

    .prologue
    .line 72
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultServerSocketChannelConfig;->socket:Ljava/net/ServerSocket;

    invoke-virtual {v1, p1}, Ljava/net/ServerSocket;->setReuseAddress(Z)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    return-void

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
