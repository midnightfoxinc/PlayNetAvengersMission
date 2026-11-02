.class public Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;
.super Lorg/jboss/netty/channel/DefaultChannelConfig;
.source "DefaultDatagramChannelConfig.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/DatagramChannelConfig;


# static fields
.field private static final DEFAULT_PREDICTOR_FACTORY:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;


# instance fields
.field private volatile predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

.field private volatile predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

.field private final socket:Ljava/net/DatagramSocket;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 38
    new-instance v0, Lorg/jboss/netty/channel/FixedReceiveBufferSizePredictorFactory;

    const/16 v1, 0x300

    invoke-direct {v0, v1}, Lorg/jboss/netty/channel/FixedReceiveBufferSizePredictorFactory;-><init>(I)V

    sput-object v0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->DEFAULT_PREDICTOR_FACTORY:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    return-void
.end method

.method public constructor <init>(Ljava/net/DatagramSocket;)V
    .locals 2
    .param p1, "socket"    # Ljava/net/DatagramSocket;

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/jboss/netty/channel/DefaultChannelConfig;-><init>()V

    .line 43
    sget-object v0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->DEFAULT_PREDICTOR_FACTORY:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .line 49
    if-nez p1, :cond_0

    .line 50
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "socket"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    .line 53
    return-void
.end method


# virtual methods
.method public getInterface()Ljava/net/InetAddress;
    .locals 2

    .prologue
    .line 106
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 108
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1}, Ljava/net/MulticastSocket;->getInterface()Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 113
    .end local v0    # "e":Ljava/net/SocketException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public getNetworkInterface()Ljava/net/NetworkInterface;
    .locals 2

    .prologue
    .line 154
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 156
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1}, Ljava/net/MulticastSocket;->getNetworkInterface()Ljava/net/NetworkInterface;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 161
    .end local v0    # "e":Ljava/net/SocketException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public getReceiveBufferSize()I
    .locals 2

    .prologue
    .line 195
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getReceiveBufferSize()I
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getReceiveBufferSizePredictor()Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    .locals 5

    .prologue
    .line 266
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .line 267
    .local v1, "predictor":Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    if-nez v1, :cond_0

    .line 269
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->getReceiveBufferSizePredictorFactory()Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    move-result-object v2

    invoke-interface {v2}, Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;->getPredictor()Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    :cond_0
    return-object v1

    .line 270
    :catch_0
    move-exception v0

    .line 271
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/jboss/netty/channel/ChannelException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to create a new "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getReceiveBufferSizePredictorFactory()Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    return-object v0
.end method

.method public getSendBufferSize()I
    .locals 2

    .prologue
    .line 211
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getSendBufferSize()I
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getTimeToLive()I
    .locals 2

    .prologue
    .line 226
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 228
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1}, Ljava/net/MulticastSocket;->getTimeToLive()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 229
    :catch_0
    move-exception v0

    .line 230
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 233
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public getTrafficClass()I
    .locals 2

    .prologue
    .line 251
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getTrafficClass()I
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 252
    :catch_0
    move-exception v0

    .line 253
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isBroadcast()Z
    .locals 2

    .prologue
    .line 91
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getBroadcast()Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isLoopbackModeDisabled()Z
    .locals 2

    .prologue
    .line 130
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 132
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1}, Ljava/net/MulticastSocket;->getLoopbackMode()Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 137
    .end local v0    # "e":Ljava/net/SocketException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public isReuseAddress()Z
    .locals 2

    .prologue
    .line 179
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getReuseAddress()Z
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setBroadcast(Z)V
    .locals 2
    .param p1, "broadcast"    # Z

    .prologue
    .line 99
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1, p1}, Ljava/net/DatagramSocket;->setBroadcast(Z)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    return-void

    .line 100
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setInterface(Ljava/net/InetAddress;)V
    .locals 2
    .param p1, "interfaceAddress"    # Ljava/net/InetAddress;

    .prologue
    .line 118
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 120
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1, p1}, Ljava/net/MulticastSocket;->setInterface(Ljava/net/InetAddress;)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    return-void

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 125
    .end local v0    # "e":Ljava/net/SocketException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public setLoopbackModeDisabled(Z)V
    .locals 2
    .param p1, "loopbackModeDisabled"    # Z

    .prologue
    .line 142
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 144
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1, p1}, Ljava/net/MulticastSocket;->setLoopbackMode(Z)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    return-void

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 149
    .end local v0    # "e":Ljava/net/SocketException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public setNetworkInterface(Ljava/net/NetworkInterface;)V
    .locals 2
    .param p1, "networkInterface"    # Ljava/net/NetworkInterface;

    .prologue
    .line 166
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 168
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1, p1}, Ljava/net/MulticastSocket;->setNetworkInterface(Ljava/net/NetworkInterface;)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    return-void

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 173
    .end local v0    # "e":Ljava/net/SocketException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public setOption(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 57
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/DefaultChannelConfig;->setOption(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    .end local p2    # "value":Ljava/lang/Object;
    :goto_0
    return v0

    .line 61
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_0
    const-string v1, "broadcast"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 62
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setBroadcast(Z)V

    goto :goto_0

    .line 63
    :cond_1
    const-string v1, "receiveBufferSize"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 64
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setReceiveBufferSize(I)V

    goto :goto_0

    .line 65
    :cond_2
    const-string v1, "sendBufferSize"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 66
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setSendBufferSize(I)V

    goto :goto_0

    .line 67
    :cond_3
    const-string v1, "receiveBufferSizePredictorFactory"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 68
    check-cast p2, Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setReceiveBufferSizePredictorFactory(Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;)V

    goto :goto_0

    .line 69
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_4
    const-string v1, "receiveBufferSizePredictor"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 70
    check-cast p2, Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setReceiveBufferSizePredictor(Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;)V

    goto :goto_0

    .line 71
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_5
    const-string v1, "reuseAddress"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 72
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setReuseAddress(Z)V

    goto :goto_0

    .line 73
    :cond_6
    const-string v1, "loopbackModeDisabled"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 74
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setLoopbackModeDisabled(Z)V

    goto :goto_0

    .line 75
    :cond_7
    const-string v1, "interface"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 76
    check-cast p2, Ljava/net/InetAddress;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setInterface(Ljava/net/InetAddress;)V

    goto :goto_0

    .line 77
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_8
    const-string v1, "networkInterface"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 78
    check-cast p2, Ljava/net/NetworkInterface;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setNetworkInterface(Ljava/net/NetworkInterface;)V

    goto/16 :goto_0

    .line 79
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_9
    const-string v1, "timeToLive"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 80
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setTimeToLive(I)V

    goto/16 :goto_0

    .line 81
    :cond_a
    const-string v1, "trafficClass"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 82
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setTrafficClass(I)V

    goto/16 :goto_0

    .line 84
    :cond_b
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public setReceiveBufferSize(I)V
    .locals 2
    .param p1, "receiveBufferSize"    # I

    .prologue
    .line 203
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1, p1}, Ljava/net/DatagramSocket;->setReceiveBufferSize(I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    return-void

    .line 204
    :catch_0
    move-exception v0

    .line 205
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setReceiveBufferSizePredictor(Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;)V
    .locals 2
    .param p1, "predictor"    # Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .prologue
    .line 282
    if-nez p1, :cond_0

    .line 283
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "predictor"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 285
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->predictor:Lorg/jboss/netty/channel/ReceiveBufferSizePredictor;

    .line 286
    return-void
.end method

.method public setReceiveBufferSizePredictorFactory(Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;)V
    .locals 2
    .param p1, "predictorFactory"    # Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .prologue
    .line 293
    if-nez p1, :cond_0

    .line 294
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "predictorFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 296
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->predictorFactory:Lorg/jboss/netty/channel/ReceiveBufferSizePredictorFactory;

    .line 297
    return-void
.end method

.method public setReuseAddress(Z)V
    .locals 2
    .param p1, "reuseAddress"    # Z

    .prologue
    .line 187
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1, p1}, Ljava/net/DatagramSocket;->setReuseAddress(Z)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    return-void

    .line 188
    :catch_0
    move-exception v0

    .line 189
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setSendBufferSize(I)V
    .locals 2
    .param p1, "sendBufferSize"    # I

    .prologue
    .line 219
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1, p1}, Ljava/net/DatagramSocket;->setSendBufferSize(I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    return-void

    .line 220
    :catch_0
    move-exception v0

    .line 221
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setTimeToLive(I)V
    .locals 2
    .param p1, "ttl"    # I

    .prologue
    .line 238
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    instance-of v1, v1, Ljava/net/MulticastSocket;

    if-eqz v1, :cond_0

    .line 240
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    check-cast v1, Ljava/net/MulticastSocket;

    invoke-virtual {v1, p1}, Ljava/net/MulticastSocket;->setTimeToLive(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    return-void

    .line 241
    :catch_0
    move-exception v0

    .line 242
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 245
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public setTrafficClass(I)V
    .locals 2
    .param p1, "trafficClass"    # I

    .prologue
    .line 259
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1, p1}, Ljava/net/DatagramSocket;->setTrafficClass(I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    return-void

    .line 260
    :catch_0
    move-exception v0

    .line 261
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
