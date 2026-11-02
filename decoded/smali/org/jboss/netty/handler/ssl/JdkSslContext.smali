.class public abstract Lorg/jboss/netty/handler/ssl/JdkSslContext;
.super Lorg/jboss/netty/handler/ssl/SslContext;
.source "JdkSslContext.java"


# static fields
.field static final DEFAULT_CIPHERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final PROTOCOL:Ljava/lang/String; = "TLS"

.field static final PROTOCOLS:[Ljava/lang/String;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final cipherSuites:[Ljava/lang/String;

.field private final unmodifiableCipherSuites:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 35
    const-class v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;

    invoke-static {v7}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v7

    sput-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 44
    :try_start_0
    const-string v7, "TLS"

    invoke-static {v7}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 45
    .local v1, "context":Ljavax/net/ssl/SSLContext;
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v1, v7, v8, v9}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->createSSLEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v3

    .line 53
    .local v3, "engine":Ljavax/net/ssl/SSLEngine;
    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v6

    .line 54
    .local v6, "supportedProtocols":[Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .local v4, "protocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-array v7, v13, [Ljava/lang/String;

    const-string v8, "TLSv1.2"

    aput-object v8, v7, v10

    const-string v8, "TLSv1.1"

    aput-object v8, v7, v11

    const-string v8, "TLSv1"

    aput-object v8, v7, v12

    invoke-static {v6, v4, v7}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->addIfSupported([Ljava/lang/String;Ljava/util/List;[Ljava/lang/String;)V

    .line 59
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 60
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v4, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    sput-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->PROTOCOLS:[Ljava/lang/String;

    .line 66
    :goto_0
    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v5

    .line 67
    .local v5, "supportedCiphers":[Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v0, "ciphers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v7, 0x8

    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"

    aput-object v8, v7, v10

    const-string v8, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"

    aput-object v8, v7, v11

    const-string v8, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"

    aput-object v8, v7, v12

    const-string v8, "TLS_RSA_WITH_AES_128_GCM_SHA256"

    aput-object v8, v7, v13

    const/4 v8, 0x4

    const-string v9, "TLS_RSA_WITH_AES_128_CBC_SHA"

    aput-object v9, v7, v8

    const/4 v8, 0x5

    const-string v9, "TLS_RSA_WITH_AES_256_CBC_SHA"

    aput-object v9, v7, v8

    const/4 v8, 0x6

    const-string v9, "SSL_RSA_WITH_3DES_EDE_CBC_SHA"

    aput-object v9, v7, v8

    const/4 v8, 0x7

    const-string v9, "SSL_RSA_WITH_RC4_128_SHA"

    aput-object v9, v7, v8

    invoke-static {v5, v0, v7}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->addIfSupported([Ljava/lang/String;Ljava/util/List;[Ljava/lang/String;)V

    .line 84
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 85
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    sput-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->DEFAULT_CIPHERS:Ljava/util/List;

    .line 91
    :goto_1
    sget-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v7}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 92
    sget-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Default protocols (JDK): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lorg/jboss/netty/handler/ssl/JdkSslContext;->PROTOCOLS:[Ljava/lang/String;

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 93
    sget-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Default cipher suites (JDK): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lorg/jboss/netty/handler/ssl/JdkSslContext;->DEFAULT_CIPHERS:Ljava/util/List;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 95
    :cond_0
    return-void

    .line 46
    .end local v0    # "ciphers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "engine":Ljavax/net/ssl/SSLEngine;
    .end local v4    # "protocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "supportedCiphers":[Ljava/lang/String;
    .end local v6    # "supportedProtocols":[Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 47
    .local v2, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/Error;

    const-string v8, "failed to initialize the default SSL context"

    invoke-direct {v7, v8, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 62
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "engine":Ljavax/net/ssl/SSLEngine;
    .restart local v4    # "protocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v6    # "supportedProtocols":[Ljava/lang/String;
    :cond_1
    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v7

    sput-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->PROTOCOLS:[Ljava/lang/String;

    goto/16 :goto_0

    .line 88
    .restart local v0    # "ciphers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v5    # "supportedCiphers":[Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    sput-object v7, Lorg/jboss/netty/handler/ssl/JdkSslContext;->DEFAULT_CIPHERS:Ljava/util/List;

    goto :goto_1
.end method

.method constructor <init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/lang/Iterable;)V
    .locals 1
    .param p1, "bufferPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/ssl/SslBufferPool;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p2, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/ssl/SslContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;)V

    .line 113
    invoke-static {p2}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->toCipherSuiteArray(Ljava/lang/Iterable;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslContext;->cipherSuites:[Ljava/lang/String;

    .line 114
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslContext;->cipherSuites:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslContext;->unmodifiableCipherSuites:Ljava/util/List;

    .line 115
    return-void
.end method

.method private static varargs addIfSupported([Ljava/lang/String;Ljava/util/List;[Ljava/lang/String;)V
    .locals 9
    .param p0, "supported"    # [Ljava/lang/String;
    .param p2, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, "enabled":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v3, v2

    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v4    # "len$":I
    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v6, v0, v3

    .line 99
    .local v6, "n":Ljava/lang/String;
    move-object v1, p0

    .local v1, "arr$":[Ljava/lang/String;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v2, 0x0

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    :goto_1
    if-ge v2, v5, :cond_0

    aget-object v7, v1, v2

    .line 100
    .local v7, "s":Ljava/lang/String;
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 101
    invoke-interface {p1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .end local v7    # "s":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2    # "i$":I
    .restart local v3    # "i$":I
    goto :goto_0

    .line 99
    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    .restart local v7    # "s":Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 106
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "n":Ljava/lang/String;
    .end local v7    # "s":Ljava/lang/String;
    .restart local v3    # "i$":I
    :cond_2
    return-void
.end method

.method private static toCipherSuiteArray(Ljava/lang/Iterable;)[Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 175
    .local p0, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    if-nez p0, :cond_0

    .line 176
    sget-object v3, Lorg/jboss/netty/handler/ssl/JdkSslContext;->DEFAULT_CIPHERS:Ljava/util/List;

    sget-object v4, Lorg/jboss/netty/handler/ssl/JdkSslContext;->DEFAULT_CIPHERS:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 185
    :goto_0
    return-object v3

    .line 178
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 179
    .local v2, "newCiphers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 180
    .local v0, "c":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 185
    .end local v0    # "c":Ljava/lang/String;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    goto :goto_0

    .line 183
    .restart local v0    # "c":Ljava/lang/String;
    :cond_2
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private wrapEngine(Ljavax/net/ssl/SSLEngine;)Ljavax/net/ssl/SSLEngine;
    .locals 3
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;

    .prologue
    .line 167
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->nextProtocols()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    .end local p1    # "engine":Ljavax/net/ssl/SSLEngine;
    :goto_0
    return-object p1

    .restart local p1    # "engine":Ljavax/net/ssl/SSLEngine;
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->nextProtocols()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->isServer()Z

    move-result v2

    invoke-direct {v0, p1, v1, v2}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;-><init>(Ljavax/net/ssl/SSLEngine;Ljava/util/List;Z)V

    move-object p1, v0

    goto :goto_0
.end method


# virtual methods
.method public final cipherSuites()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslContext;->unmodifiableCipherSuites:Ljava/util/List;

    return-object v0
.end method

.method public abstract context()Ljavax/net/ssl/SSLContext;
.end method

.method public final newEngine()Ljavax/net/ssl/SSLEngine;
    .locals 2

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->context()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->createSSLEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v0

    .line 151
    .local v0, "engine":Ljavax/net/ssl/SSLEngine;
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/JdkSslContext;->cipherSuites:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 152
    sget-object v1, Lorg/jboss/netty/handler/ssl/JdkSslContext;->PROTOCOLS:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLEngine;->setEnabledProtocols([Ljava/lang/String;)V

    .line 153
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->isClient()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 154
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->wrapEngine(Ljavax/net/ssl/SSLEngine;)Ljavax/net/ssl/SSLEngine;

    move-result-object v1

    return-object v1
.end method

.method public final newEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;
    .locals 2
    .param p1, "peerHost"    # Ljava/lang/String;
    .param p2, "peerPort"    # I

    .prologue
    .line 159
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->context()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljavax/net/ssl/SSLContext;->createSSLEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;

    move-result-object v0

    .line 160
    .local v0, "engine":Ljavax/net/ssl/SSLEngine;
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/JdkSslContext;->cipherSuites:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 161
    sget-object v1, Lorg/jboss/netty/handler/ssl/JdkSslContext;->PROTOCOLS:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLEngine;->setEnabledProtocols([Ljava/lang/String;)V

    .line 162
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->isClient()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 163
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->wrapEngine(Ljavax/net/ssl/SSLEngine;)Ljavax/net/ssl/SSLEngine;

    move-result-object v1

    return-object v1
.end method

.method public final sessionCacheSize()J
    .locals 2

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->sessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v0

    invoke-interface {v0}, Ljavax/net/ssl/SSLSessionContext;->getSessionCacheSize()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public final sessionContext()Ljavax/net/ssl/SSLSessionContext;
    .locals 1

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->isServer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->context()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getServerSessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v0

    .line 129
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->context()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getClientSessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v0

    goto :goto_0
.end method

.method public final sessionTimeout()J
    .locals 2

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/JdkSslContext;->sessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v0

    invoke-interface {v0}, Ljavax/net/ssl/SSLSessionContext;->getSessionTimeout()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method
