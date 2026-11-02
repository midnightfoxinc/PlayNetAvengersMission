.class public Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;
.super Ljavax/servlet/http/HttpServlet;
.source "HttpTunnelingServlet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CONNECT_ATTEMPTS:Ljava/lang/String; = "connectAttempts"

.field private static final ENDPOINT:Ljava/lang/String; = "endpoint"

.field private static final RETRY_DELAY:Ljava/lang/String; = "retryDelay"

.field static final logger:Lorg/jboss/netty/logging/InternalLogger;

.field private static final serialVersionUID:J = 0x3b1e3dd3720a8e26L


# instance fields
.field private volatile channelFactory:Lorg/jboss/netty/channel/ChannelFactory;

.field private volatile connectAttempts:J

.field private volatile remoteAddress:Ljava/net/SocketAddress;

.field private volatile retryDelay:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const-class v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->$assertionsDisabled:Z

    .line 63
    const-class v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void

    .line 55
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 55
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    .line 67
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->connectAttempts:J

    .line 271
    return-void
.end method

.method private static read(Ljava/io/PushbackInputStream;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p0, "in"    # Ljava/io/PushbackInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 242
    invoke-virtual {p0}, Ljava/io/PushbackInputStream;->available()I

    move-result v3

    .line 243
    .local v3, "bytesToRead":I
    if-lez v3, :cond_0

    .line 244
    new-array v1, v3, [B

    .line 245
    .local v1, "buf":[B
    invoke-virtual {p0, v1}, Ljava/io/PushbackInputStream;->read([B)I

    move-result v4

    .line 259
    .local v4, "readBytes":I
    :goto_0
    sget-boolean v5, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->$assertionsDisabled:Z

    if-nez v5, :cond_3

    if-gtz v4, :cond_3

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 246
    .end local v1    # "buf":[B
    .end local v4    # "readBytes":I
    :cond_0
    if-nez v3, :cond_1

    .line 247
    invoke-virtual {p0}, Ljava/io/PushbackInputStream;->read()I

    move-result v0

    .line 248
    .local v0, "b":I
    if-ltz v0, :cond_1

    invoke-virtual {p0}, Ljava/io/PushbackInputStream;->available()I

    move-result v5

    if-gez v5, :cond_2

    .line 268
    .end local v0    # "b":I
    :cond_1
    :goto_1
    return-object v2

    .line 251
    .restart local v0    # "b":I
    :cond_2
    invoke-virtual {p0, v0}, Ljava/io/PushbackInputStream;->unread(I)V

    .line 252
    invoke-virtual {p0}, Ljava/io/PushbackInputStream;->available()I

    move-result v3

    .line 253
    new-array v1, v3, [B

    .line 254
    .restart local v1    # "buf":[B
    invoke-virtual {p0, v1}, Ljava/io/PushbackInputStream;->read([B)I

    move-result v4

    .line 255
    .restart local v4    # "readBytes":I
    goto :goto_0

    .line 262
    .end local v0    # "b":I
    :cond_3
    array-length v5, v1

    if-ne v4, v5, :cond_4

    .line 263
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .local v2, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_1

    .line 266
    .end local v2    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_4
    const/4 v5, 0x0

    invoke-static {v1, v5, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .restart local v2    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_1
.end method


# virtual methods
.method protected createChannelFactory(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFactory;
    .locals 3
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 139
    instance-of v0, p1, Lorg/jboss/netty/channel/local/LocalAddress;

    if-eqz v0, :cond_0

    .line 140
    new-instance v0, Lorg/jboss/netty/channel/local/DefaultLocalClientChannelFactory;

    invoke-direct {v0}, Lorg/jboss/netty/channel/local/DefaultLocalClientChannelFactory;-><init>()V

    return-object v0

    .line 142
    :cond_0
    new-instance v0, Ljavax/servlet/ServletException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported remote address type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public destroy()V
    .locals 3

    .prologue
    .line 151
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->channelFactory:Lorg/jboss/netty/channel/ChannelFactory;

    invoke-virtual {p0, v1}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->destroyChannelFactory(Lorg/jboss/netty/channel/ChannelFactory;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    :cond_0
    :goto_0
    return-void

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    sget-object v1, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to destroy a channel factory."

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected destroyChannelFactory(Lorg/jboss/netty/channel/ChannelFactory;)V
    .locals 0
    .param p1, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 160
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFactory;->releaseExternalResources()V

    .line 161
    return-void
.end method

.method public init()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->getServletConfig()Ljavax/servlet/ServletConfig;

    move-result-object v0

    .line 73
    .local v0, "config":Ljavax/servlet/ServletConfig;
    const-string v4, "endpoint"

    invoke-interface {v0, v4}, Ljavax/servlet/ServletConfig;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 74
    .local v2, "endpoint":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 75
    new-instance v4, Ljavax/servlet/ServletException;

    const-string v5, "init-param \'endpoint\' must be specified."

    invoke-direct {v4, v5}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 79
    :cond_0
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->parseEndpoint(Ljava/lang/String;)Ljava/net/SocketAddress;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->remoteAddress:Ljava/net/SocketAddress;
    :try_end_0
    .catch Ljavax/servlet/ServletException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 87
    :try_start_1
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->remoteAddress:Ljava/net/SocketAddress;

    invoke-virtual {p0, v4}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->createChannelFactory(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFactory;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->channelFactory:Lorg/jboss/netty/channel/ChannelFactory;
    :try_end_1
    .catch Ljavax/servlet/ServletException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 94
    const-string v4, "connectAttempts"

    invoke-interface {v0, v4}, Ljavax/servlet/ServletConfig;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 95
    .local v3, "temp":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 97
    :try_start_2
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->connectAttempts:J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_4

    .line 102
    iget-wide v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->connectAttempts:J

    const-wide/16 v6, 0x1

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 103
    new-instance v4, Ljavax/servlet/ServletException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "init-param \'connectAttempts\' must be >= 1. Actual value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->connectAttempts:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 80
    .end local v3    # "temp":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 81
    .local v1, "e":Ljavax/servlet/ServletException;
    throw v1

    .line 82
    .end local v1    # "e":Ljavax/servlet/ServletException;
    :catch_1
    move-exception v1

    .line 83
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Ljavax/servlet/ServletException;

    const-string v5, "Failed to parse an endpoint."

    invoke-direct {v4, v5, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 88
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v1

    .line 89
    .local v1, "e":Ljavax/servlet/ServletException;
    throw v1

    .line 90
    .end local v1    # "e":Ljavax/servlet/ServletException;
    :catch_3
    move-exception v1

    .line 91
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Ljavax/servlet/ServletException;

    const-string v5, "Failed to create a channel factory."

    invoke-direct {v4, v5, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 98
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "temp":Ljava/lang/String;
    :catch_4
    move-exception v1

    .line 99
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljavax/servlet/ServletException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "init-param \'connectAttempts\' is not a valid number. Actual value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 108
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    const-string v4, "retryDelay"

    invoke-interface {v0, v4}, Ljavax/servlet/ServletConfig;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 109
    if-eqz v3, :cond_2

    .line 111
    :try_start_3
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->retryDelay:J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_5

    .line 116
    iget-wide v4, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->retryDelay:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    .line 117
    new-instance v4, Ljavax/servlet/ServletException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "init-param \'retryDelay\' must be >= 0. Actual value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->retryDelay:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 112
    :catch_5
    move-exception v1

    .line 113
    .restart local v1    # "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljavax/servlet/ServletException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "init-param \'retryDelay\' is not a valid number. Actual value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 127
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_2
    return-void
.end method

.method protected parseEndpoint(Ljava/lang/String;)Ljava/net/SocketAddress;
    .locals 3
    .param p1, "endpoint"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 130
    const-string v0, "local:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    new-instance v0, Lorg/jboss/netty/channel/local/LocalAddress;

    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/channel/local/LocalAddress;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 133
    :cond_0
    new-instance v0, Ljavax/servlet/ServletException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid or unknown endpoint: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected service(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 18
    .param p1, "req"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "res"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    const-string v13, "POST"

    invoke-interface/range {p1 .. p1}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 167
    sget-object v13, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v13}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 168
    sget-object v13, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Unallowed method: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface/range {p1 .. p1}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    .line 170
    :cond_0
    const/16 v13, 0x195

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 236
    :goto_0
    return-void

    .line 174
    :cond_1
    invoke-static {}, Lorg/jboss/netty/channel/Channels;->pipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v11

    .line 175
    .local v11, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getOutputStream()Ljavax/servlet/ServletOutputStream;

    move-result-object v10

    .line 176
    .local v10, "out":Ljavax/servlet/ServletOutputStream;
    new-instance v7, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;

    invoke-direct {v7, v10}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;-><init>(Ljavax/servlet/ServletOutputStream;)V

    .line 177
    .local v7, "handler":Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet$OutboundConnectionHandler;
    const-string v13, "handler"

    invoke-interface {v11, v13, v7}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 179
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->channelFactory:Lorg/jboss/netty/channel/ChannelFactory;

    invoke-interface {v13, v11}, Lorg/jboss/netty/channel/ChannelFactory;->newChannel(Lorg/jboss/netty/channel/ChannelPipeline;)Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    .line 180
    .local v4, "channel":Lorg/jboss/netty/channel/Channel;
    const/4 v12, 0x0

    .line 181
    .local v12, "tries":I
    const/4 v6, 0x0

    .line 183
    .local v6, "future":Lorg/jboss/netty/channel/ChannelFuture;
    :goto_1
    int-to-long v14, v12

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->connectAttempts:J

    move-wide/from16 v16, v0

    cmp-long v13, v14, v16

    if-gez v13, :cond_2

    .line 184
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->remoteAddress:Ljava/net/SocketAddress;

    invoke-interface {v4, v13}, Lorg/jboss/netty/channel/Channel;->connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v13

    invoke-interface {v13}, Lorg/jboss/netty/channel/ChannelFuture;->awaitUninterruptibly()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v6

    .line 185
    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v13

    if-nez v13, :cond_2

    .line 186
    add-int/lit8 v12, v12, 0x1

    .line 188
    :try_start_0
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->retryDelay:J

    invoke-static {v14, v15}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 189
    :catch_0
    move-exception v13

    goto :goto_1

    .line 197
    :cond_2
    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v13

    if-nez v13, :cond_4

    .line 198
    sget-object v13, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v13}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v13

    if-eqz v13, :cond_3

    .line 199
    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    .line 200
    .local v3, "cause":Ljava/lang/Throwable;
    sget-object v13, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Endpoint unavailable: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14, v3}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 202
    .end local v3    # "cause":Ljava/lang/Throwable;
    :cond_3
    const/16 v13, 0x1f7

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    goto :goto_0

    .line 206
    :cond_4
    const/4 v9, 0x0

    .line 208
    .local v9, "lastWriteFuture":Lorg/jboss/netty/channel/ChannelFuture;
    const/16 v13, 0xc8

    :try_start_1
    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 209
    const-string v13, "Content-Type"

    const-string v14, "application/octet-stream"

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    const-string v13, "Content-Transfer-Encoding"

    const-string v14, "binary"

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    invoke-virtual {v10}, Ljavax/servlet/ServletOutputStream;->flush()V

    .line 215
    new-instance v8, Ljava/io/PushbackInputStream;

    invoke-interface/range {p1 .. p1}, Ljavax/servlet/http/HttpServletRequest;->getInputStream()Ljavax/servlet/ServletInputStream;

    move-result-object v13

    invoke-direct {v8, v13}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;)V

    .line 217
    .local v8, "in":Ljava/io/PushbackInputStream;
    :goto_2
    invoke-interface {v4}, Lorg/jboss/netty/channel/Channel;->isConnected()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v13

    if-eqz v13, :cond_5

    .line 220
    :try_start_2
    invoke-static {v8}, Lorg/jboss/netty/channel/socket/http/HttpTunnelingServlet;->read(Ljava/io/PushbackInputStream;)Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    .line 224
    .local v2, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v2, :cond_6

    .line 230
    .end local v2    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_5
    :goto_3
    if-nez v9, :cond_7

    .line 231
    invoke-interface {v4}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    goto/16 :goto_0

    .line 221
    :catch_1
    move-exception v5

    .line 222
    .local v5, "e":Ljava/io/EOFException;
    goto :goto_3

    .line 227
    .end local v5    # "e":Ljava/io/EOFException;
    .restart local v2    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_6
    :try_start_3
    invoke-interface {v4, v2}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v9

    .line 228
    goto :goto_2

    .line 233
    .end local v2    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_7
    sget-object v13, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v9, v13}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto/16 :goto_0

    .line 230
    .end local v8    # "in":Ljava/io/PushbackInputStream;
    :catchall_0
    move-exception v13

    if-nez v9, :cond_8

    .line 231
    invoke-interface {v4}, Lorg/jboss/netty/channel/Channel;->close()Lorg/jboss/netty/channel/ChannelFuture;

    .line 233
    :goto_4
    throw v13

    :cond_8
    sget-object v14, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v9, v14}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_4
.end method
