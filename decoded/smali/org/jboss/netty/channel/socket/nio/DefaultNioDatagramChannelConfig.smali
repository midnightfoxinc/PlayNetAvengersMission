.class Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;
.super Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;
.source "DefaultNioDatagramChannelConfig.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/NioDatagramChannelConfig;


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final channel:Ljava/nio/channels/DatagramChannel;

.field private volatile writeBufferHighWaterMark:I

.field private volatile writeBufferLowWaterMark:I

.field private volatile writeSpinCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-class v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method constructor <init>(Ljava/nio/channels/DatagramChannel;)V
    .locals 1
    .param p1, "channel"    # Ljava/nio/channels/DatagramChannel;

    .prologue
    .line 50
    invoke-virtual {p1}, Ljava/nio/channels/DatagramChannel;->socket()Ljava/net/DatagramSocket;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;-><init>(Ljava/net/DatagramSocket;)V

    .line 44
    const/high16 v0, 0x10000

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeBufferHighWaterMark:I

    .line 45
    const v0, 0x8000

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeBufferLowWaterMark:I

    .line 46
    const/16 v0, 0x10

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeSpinCount:I

    .line 51
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->channel:Ljava/nio/channels/DatagramChannel;

    .line 52
    return-void
.end method

.method private setWriteBufferHighWaterMark0(I)V
    .locals 3
    .param p1, "writeBufferHighWaterMark"    # I

    .prologue
    .line 103
    if-gez p1, :cond_0

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferHighWaterMark: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeBufferHighWaterMark:I

    .line 108
    return-void
.end method

.method private setWriteBufferLowWaterMark0(I)V
    .locals 3
    .param p1, "writeBufferLowWaterMark"    # I

    .prologue
    .line 126
    if-gez p1, :cond_0

    .line 127
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferLowWaterMark: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeBufferLowWaterMark:I

    .line 131
    return-void
.end method


# virtual methods
.method public getInterface()Ljava/net/InetAddress;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 199
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getNetworkInterface()Ljava/net/NetworkInterface;

    move-result-object v1

    .line 200
    .local v1, "inf":Ljava/net/NetworkInterface;
    if-nez v1, :cond_1

    .line 207
    :cond_0
    :goto_0
    return-object v2

    .line 203
    :cond_1
    invoke-virtual {v1}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v0

    .line 204
    .local v0, "addresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 205
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    goto :goto_0
.end method

.method public getNetworkInterface()Ljava/net/NetworkInterface;
    .locals 3

    .prologue
    .line 160
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v1

    const/4 v2, 0x7

    if-ge v1, v2, :cond_0

    .line 161
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1

    .line 164
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->channel:Ljava/nio/channels/DatagramChannel;

    sget-object v2, Ljava/net/StandardSocketOptions;->IP_MULTICAST_IF:Ljava/net/SocketOption;

    invoke-virtual {v1, v2}, Ljava/nio/channels/DatagramChannel;->getOption(Ljava/net/SocketOption;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/NetworkInterface;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 165
    :catch_0
    move-exception v0

    .line 166
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getTimeToLive()I
    .locals 3

    .prologue
    .line 173
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v1

    const/4 v2, 0x7

    if-ge v1, v2, :cond_0

    .line 174
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1

    .line 177
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->channel:Ljava/nio/channels/DatagramChannel;

    sget-object v2, Ljava/net/StandardSocketOptions;->IP_MULTICAST_TTL:Ljava/net/SocketOption;

    invoke-virtual {v1, v2}, Ljava/nio/channels/DatagramChannel;->getOption(Ljava/net/SocketOption;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getWriteBufferHighWaterMark()I
    .locals 1

    .prologue
    .line 88
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeBufferHighWaterMark:I

    return v0
.end method

.method public getWriteBufferLowWaterMark()I
    .locals 1

    .prologue
    .line 111
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeBufferLowWaterMark:I

    return v0
.end method

.method public getWriteSpinCount()I
    .locals 1

    .prologue
    .line 134
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeSpinCount:I

    return v0
.end method

.method public isLoopbackModeDisabled()Z
    .locals 3

    .prologue
    .line 222
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v1

    const/4 v2, 0x7

    if-ge v1, v2, :cond_0

    .line 223
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1

    .line 226
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->channel:Ljava/nio/channels/DatagramChannel;

    sget-object v2, Ljava/net/StandardSocketOptions;->IP_MULTICAST_LOOP:Ljava/net/SocketOption;

    invoke-virtual {v1, v2}, Ljava/nio/channels/DatagramChannel;->getOption(Ljava/net/SocketOption;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setInterface(Ljava/net/InetAddress;)V
    .locals 2
    .param p1, "interfaceAddress"    # Ljava/net/InetAddress;

    .prologue
    .line 214
    :try_start_0
    invoke-static {p1}, Ljava/net/NetworkInterface;->getByInetAddress(Ljava/net/InetAddress;)Ljava/net/NetworkInterface;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->setNetworkInterface(Ljava/net/NetworkInterface;)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    return-void

    .line 215
    :catch_0
    move-exception v0

    .line 216
    .local v0, "e":Ljava/net/SocketException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setLoopbackModeDisabled(Z)V
    .locals 4
    .param p1, "loopbackModeDisabled"    # Z

    .prologue
    .line 235
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v1

    const/4 v2, 0x7

    if-ge v1, v2, :cond_0

    .line 236
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1

    .line 239
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->channel:Ljava/nio/channels/DatagramChannel;

    sget-object v2, Ljava/net/StandardSocketOptions;->IP_MULTICAST_LOOP:Ljava/net/SocketOption;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/DatagramChannel;->setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/DatagramChannel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    return-void

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setNetworkInterface(Ljava/net/NetworkInterface;)V
    .locals 3
    .param p1, "networkInterface"    # Ljava/net/NetworkInterface;

    .prologue
    .line 147
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v1

    const/4 v2, 0x7

    if-ge v1, v2, :cond_0

    .line 148
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1

    .line 151
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->channel:Ljava/nio/channels/DatagramChannel;

    sget-object v2, Ljava/net/StandardSocketOptions;->IP_MULTICAST_IF:Ljava/net/SocketOption;

    invoke-virtual {v1, v2, p1}, Ljava/nio/channels/DatagramChannel;->setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/DatagramChannel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    return-void

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setOption(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 71
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setOption(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    :goto_0
    return v0

    .line 75
    :cond_0
    const-string v1, "writeBufferHighWaterMark"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 76
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-direct {p0, v1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->setWriteBufferHighWaterMark0(I)V

    goto :goto_0

    .line 77
    :cond_1
    const-string v1, "writeBufferLowWaterMark"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 78
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-direct {p0, v1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->setWriteBufferLowWaterMark0(I)V

    goto :goto_0

    .line 79
    :cond_2
    const-string v1, "writeSpinCount"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 80
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->setWriteSpinCount(I)V

    goto :goto_0

    .line 82
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setOptions(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "options":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-super {p0, p1}, Lorg/jboss/netty/channel/socket/DefaultDatagramChannelConfig;->setOptions(Ljava/util/Map;)V

    .line 57
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v0

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getWriteBufferLowWaterMark()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 59
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v0

    ushr-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->setWriteBufferLowWaterMark0(I)V

    .line 60
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v0}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    sget-object v0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v1, "writeBufferLowWaterMark cannot be greater than writeBufferHighWaterMark; setting to the half of the writeBufferHighWaterMark."

    invoke-interface {v0, v1}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    .line 67
    :cond_0
    return-void
.end method

.method public setTimeToLive(I)V
    .locals 4
    .param p1, "ttl"    # I

    .prologue
    .line 186
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v1

    const/4 v2, 0x7

    if-ge v1, v2, :cond_0

    .line 187
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1

    .line 190
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->channel:Ljava/nio/channels/DatagramChannel;

    sget-object v2, Ljava/net/StandardSocketOptions;->IP_MULTICAST_TTL:Ljava/net/SocketOption;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/DatagramChannel;->setOption(Ljava/net/SocketOption;Ljava/lang/Object;)Ljava/nio/channels/DatagramChannel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    return-void

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/channel/ChannelException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/channel/ChannelException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setWriteBufferHighWaterMark(I)V
    .locals 3
    .param p1, "writeBufferHighWaterMark"    # I

    .prologue
    .line 92
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getWriteBufferLowWaterMark()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 93
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferHighWaterMark cannot be less than writeBufferLowWaterMark ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getWriteBufferLowWaterMark()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->setWriteBufferHighWaterMark0(I)V

    .line 100
    return-void
.end method

.method public setWriteBufferLowWaterMark(I)V
    .locals 3
    .param p1, "writeBufferLowWaterMark"    # I

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v0

    if-le p1, v0, :cond_0

    .line 116
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeBufferLowWaterMark cannot be greater than writeBufferHighWaterMark ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->setWriteBufferLowWaterMark0(I)V

    .line 123
    return-void
.end method

.method public setWriteSpinCount(I)V
    .locals 2
    .param p1, "writeSpinCount"    # I

    .prologue
    .line 138
    if-gtz p1, :cond_0

    .line 139
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "writeSpinCount must be a positive integer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/socket/nio/DefaultNioDatagramChannelConfig;->writeSpinCount:I

    .line 143
    return-void
.end method
