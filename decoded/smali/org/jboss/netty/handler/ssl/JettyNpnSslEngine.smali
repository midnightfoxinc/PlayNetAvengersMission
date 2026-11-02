.class final Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;
.super Ljavax/net/ssl/SSLEngine;
.source "JettyNpnSslEngine.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static available:Z


# instance fields
.field private final engine:Ljavax/net/ssl/SSLEngine;

.field private final session:Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Ljavax/net/ssl/SSLEngine;Ljava/util/List;Z)V
    .locals 3
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p3, "server"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLEngine;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p2, "nextProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljavax/net/ssl/SSLEngine;-><init>()V

    .line 64
    sget-boolean v2, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 66
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    .line 67
    new-instance v2, Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    invoke-direct {v2, p1}, Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;-><init>(Ljavax/net/ssl/SSLEngine;)V

    iput-object v2, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->session:Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    .line 69
    if-eqz p3, :cond_1

    .line 70
    new-instance v2, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;

    invoke-direct {v2, p0, p2}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$1;-><init>(Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;Ljava/util/List;)V

    invoke-static {p1, v2}, Lorg/eclipse/jetty/npn/NextProtoNego;->put(Ljavax/net/ssl/SSLEngine;Lorg/eclipse/jetty/npn/NextProtoNego$Provider;)V

    .line 106
    :goto_0
    return-void

    .line 84
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {p2, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 85
    .local v1, "list":[Ljava/lang/String;
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v1, v2

    .line 87
    .local v0, "fallback":Ljava/lang/String;
    new-instance v2, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;

    invoke-direct {v2, p0, v1, v0}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine$2;-><init>(Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, v2}, Lorg/eclipse/jetty/npn/NextProtoNego;->put(Ljavax/net/ssl/SSLEngine;Lorg/eclipse/jetty/npn/NextProtoNego$Provider;)V

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;)Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    .prologue
    .line 32
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->session:Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    return-object v0
.end method

.method static isAvailable()Z
    .locals 1

    .prologue
    .line 37
    invoke-static {}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->updateAvailability()V

    .line 38
    sget-boolean v0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->available:Z

    return v0
.end method

.method private static updateAvailability()V
    .locals 3

    .prologue
    .line 42
    sget-boolean v1, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->available:Z

    if-eqz v1, :cond_0

    .line 58
    .local v0, "bootloader":Ljava/lang/ClassLoader;
    :goto_0
    return-void

    .line 47
    .end local v0    # "bootloader":Ljava/lang/ClassLoader;
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 48
    .restart local v0    # "bootloader":Ljava/lang/ClassLoader;
    if-nez v0, :cond_1

    .line 51
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 53
    :cond_1
    const-string v1, "sun.security.ssl.NextProtoNegoExtension"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 54
    const/4 v1, 0x1

    sput-boolean v1, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->available:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 55
    :catch_0
    move-exception v1

    goto :goto_0
.end method


# virtual methods
.method public beginHandshake()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->beginHandshake()V

    .line 218
    return-void
.end method

.method public closeInbound()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-static {v0}, Lorg/eclipse/jetty/npn/NextProtoNego;->remove(Ljavax/net/ssl/SSLEngine;)Lorg/eclipse/jetty/npn/NextProtoNego$Provider;

    .line 116
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->closeInbound()V

    .line 117
    return-void
.end method

.method public closeOutbound()V
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-static {v0}, Lorg/eclipse/jetty/npn/NextProtoNego;->remove(Ljavax/net/ssl/SSLEngine;)Lorg/eclipse/jetty/npn/NextProtoNego$Provider;

    .line 122
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->closeOutbound()V

    .line 123
    return-void
.end method

.method public getDelegatedTask()Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getDelegatedTask()Ljava/lang/Runnable;

    move-result-object v0

    return-object v0
.end method

.method public getEnableSessionCreation()Z
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getEnableSessionCreation()Z

    move-result v0

    return v0
.end method

.method public getEnabledCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEnabledProtocols()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHandshakeSession()Ljavax/net/ssl/SSLSession;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getHandshakeSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    return-object v0
.end method

.method public getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v0

    return-object v0
.end method

.method public getNeedClientAuth()Z
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getNeedClientAuth()Z

    move-result v0

    return v0
.end method

.method public getPeerHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getPeerHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeerPort()I
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getPeerPort()I

    move-result v0

    return v0
.end method

.method public getSSLParameters()Ljavax/net/ssl/SSLParameters;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getSSLParameters()Ljavax/net/ssl/SSLParameters;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getSession()Ljavax/net/ssl/SSLSession;
    .locals 1

    .prologue
    .line 32
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->getSession()Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    move-result-object v0

    return-object v0
.end method

.method public getSession()Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->session:Lorg/jboss/netty/handler/ssl/JettyNpnSslSession;

    return-object v0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedProtocols()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUseClientMode()Z
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getUseClientMode()Z

    move-result v0

    return v0
.end method

.method public getWantClientAuth()Z
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->getWantClientAuth()Z

    move-result v0

    return v0
.end method

.method public isInboundDone()Z
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->isInboundDone()Z

    move-result v0

    return v0
.end method

.method public isOutboundDone()Z
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLEngine;->isOutboundDone()Z

    move-result v0

    return v0
.end method

.method public setEnableSessionCreation(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 257
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLEngine;->setEnableSessionCreation(Z)V

    .line 258
    return-void
.end method

.method public setEnabledCipherSuites([Ljava/lang/String;)V
    .locals 1
    .param p1, "strings"    # [Ljava/lang/String;

    .prologue
    .line 192
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 193
    return-void
.end method

.method public setEnabledProtocols([Ljava/lang/String;)V
    .locals 1
    .param p1, "strings"    # [Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLEngine;->setEnabledProtocols([Ljava/lang/String;)V

    .line 208
    return-void
.end method

.method public setNeedClientAuth(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 237
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLEngine;->setNeedClientAuth(Z)V

    .line 238
    return-void
.end method

.method public setSSLParameters(Ljavax/net/ssl/SSLParameters;)V
    .locals 1
    .param p1, "sslParameters"    # Ljavax/net/ssl/SSLParameters;

    .prologue
    .line 272
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLEngine;->setSSLParameters(Ljavax/net/ssl/SSLParameters;)V

    .line 273
    return-void
.end method

.method public setUseClientMode(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 227
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 228
    return-void
.end method

.method public setWantClientAuth(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 247
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1}, Ljavax/net/ssl/SSLEngine;->setWantClientAuth(Z)V

    .line 248
    return-void
.end method

.method public unwrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "byteBuffer2"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLEngine;->unwrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v0

    return-object v0
.end method

.method public unwrap(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "byteBuffers"    # [Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLEngine;->unwrap(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v0

    return-object v0
.end method

.method public unwrap(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;II)Ljavax/net/ssl/SSLEngineResult;
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "byteBuffers"    # [Ljava/nio/ByteBuffer;
    .param p3, "i"    # I
    .param p4, "i2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLEngine;->unwrap(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;II)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v0

    return-object v0
.end method

.method public wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "byteBuffer2"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 137
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLEngine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v0

    return-object v0
.end method

.method public wrap([Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;
    .locals 1
    .param p1, "byteBuffers"    # [Ljava/nio/ByteBuffer;
    .param p2, "i"    # I
    .param p3, "i2"    # I
    .param p4, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 147
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLEngine;->wrap([Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v0

    return-object v0
.end method

.method public wrap([Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;
    .locals 1
    .param p1, "byteBuffers"    # [Ljava/nio/ByteBuffer;
    .param p2, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 142
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLEngine;->wrap([Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v0

    return-object v0
.end method
