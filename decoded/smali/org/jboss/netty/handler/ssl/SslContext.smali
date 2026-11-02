.class public abstract Lorg/jboss/netty/handler/ssl/SslContext;
.super Ljava/lang/Object;
.source "SslContext.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/ssl/SslContext$1;
    }
.end annotation


# instance fields
.field private final bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;)V
    .locals 0
    .param p1, "bufferPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;

    .prologue
    .line 386
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 387
    if-nez p1, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslContext;->newBufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-result-object p1

    .end local p1    # "bufferPool":Lorg/jboss/netty/handler/ssl/SslBufferPool;
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/SslContext;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    .line 388
    return-void
.end method

.method public static defaultClientProvider()Lorg/jboss/netty/handler/ssl/SslProvider;
    .locals 1

    .prologue
    .line 74
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->JDK:Lorg/jboss/netty/handler/ssl/SslProvider;

    return-object v0
.end method

.method public static defaultServerProvider()Lorg/jboss/netty/handler/ssl/SslProvider;
    .locals 1

    .prologue
    .line 61
    invoke-static {}, Lorg/jboss/netty/handler/ssl/OpenSsl;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->OPENSSL:Lorg/jboss/netty/handler/ssl/SslProvider;

    .line 64
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->JDK:Lorg/jboss/netty/handler/ssl/SslProvider;

    goto :goto_0
.end method

.method public static newClientContext()Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v0, 0x0

    move-object v1, v0

    move-object v2, v0

    move-object v3, v0

    move-object v4, v0

    move-object v5, v0

    move-wide v8, v6

    .line 212
    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Ljava/io/File;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "certChainFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v0, 0x0

    .line 223
    move-object v1, v0

    move-object v2, p0

    move-object v3, v0

    move-object v4, v0

    move-object v5, v0

    move-wide v8, v6

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "certChainFile"    # Ljava/io/File;
    .param p1, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v0, 0x0

    .line 252
    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, v0

    move-object v5, v0

    move-wide v8, v6

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Ljavax/net/ssl/TrustManagerFactory;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v0, 0x0

    .line 236
    move-object v1, v0

    move-object v2, v0

    move-object v3, p0

    move-object v4, v0

    move-object v5, v0

    move-wide v8, v6

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 11
    .param p0, "bufPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p1, "certChainFile"    # Ljava/io/File;
    .param p2, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .param p5, "sessionCacheSize"    # J
    .param p7, "sessionTimeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/ssl/SslBufferPool;",
            "Ljava/io/File;",
            "Ljavax/net/ssl/TrustManagerFactory;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;JJ)",
            "Lorg/jboss/netty/handler/ssl/SslContext;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 281
    .local p3, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    .local p4, "nextProtocols":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    const/4 v0, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    .line 295
    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-wide v8, v6

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Ljava/io/File;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .param p1, "certChainFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    .line 309
    move-object v0, p0

    move-object v2, p1

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-wide v8, v6

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .param p1, "certChainFile"    # Ljava/io/File;
    .param p2, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    .line 343
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, v1

    move-wide v8, v6

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Ljavax/net/ssl/TrustManagerFactory;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .param p1, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    .line 325
    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v4, v1

    move-object v5, v1

    move-wide v8, v6

    invoke-static/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/SslContext;->newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newClientContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 10
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .param p1, "bufPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p2, "certChainFile"    # Ljava/io/File;
    .param p3, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .param p6, "sessionCacheSize"    # J
    .param p8, "sessionTimeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/ssl/SslProvider;",
            "Lorg/jboss/netty/handler/ssl/SslBufferPool;",
            "Ljava/io/File;",
            "Ljavax/net/ssl/TrustManagerFactory;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;JJ)",
            "Lorg/jboss/netty/handler/ssl/SslContext;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 375
    .local p4, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    .local p5, "nextProtocols":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    if-eqz p0, :cond_0

    sget-object v0, Lorg/jboss/netty/handler/ssl/SslProvider;->JDK:Lorg/jboss/netty/handler/ssl/SslProvider;

    if-eq p0, v0, :cond_0

    .line 376
    new-instance v0, Ljavax/net/ssl/SSLException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "client context unsupported for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 379
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-wide/from16 v6, p6

    move-wide/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V

    return-object v0
.end method

.method private newHandler(Ljavax/net/ssl/SSLEngine;)Lorg/jboss/netty/handler/ssl/SslHandler;
    .locals 3
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;

    .prologue
    const/4 v2, 0x1

    .line 475
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslContext;->bufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/jboss/netty/handler/ssl/SslHandler;-><init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;)V

    .line 476
    .local v0, "handler":Lorg/jboss/netty/handler/ssl/SslHandler;
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslContext;->isClient()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 477
    invoke-virtual {v0, v2}, Lorg/jboss/netty/handler/ssl/SslHandler;->setIssueHandshake(Z)V

    .line 479
    :cond_0
    invoke-virtual {v0, v2}, Lorg/jboss/netty/handler/ssl/SslHandler;->setCloseOnSSLException(Z)V

    .line 480
    return-object v0
.end method

.method public static newServerContext(Ljava/io/File;Ljava/io/File;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 12
    .param p0, "certChainFile"    # Ljava/io/File;
    .param p1, "keyFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v1, 0x0

    .line 85
    move-object v2, v1

    move-object v3, p0

    move-object v4, p1

    move-object v5, v1

    move-object v6, v1

    move-object v7, v1

    move-wide v10, v8

    invoke-static/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/SslContext;->newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newServerContext(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 12
    .param p0, "certChainFile"    # Ljava/io/File;
    .param p1, "keyFile"    # Ljava/io/File;
    .param p2, "keyPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v1, 0x0

    .line 99
    move-object v2, v1

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, v1

    move-object v7, v1

    move-wide v10, v8

    invoke-static/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/SslContext;->newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newServerContext(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 12
    .param p0, "bufPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p1, "certChainFile"    # Ljava/io/File;
    .param p2, "keyFile"    # Ljava/io/File;
    .param p3, "keyPassword"    # Ljava/lang/String;
    .param p6, "sessionCacheSize"    # J
    .param p8, "sessionTimeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/ssl/SslBufferPool;",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;JJ)",
            "Lorg/jboss/netty/handler/ssl/SslContext;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 126
    .local p4, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    .local p5, "nextProtocols":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    const/4 v1, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    invoke-static/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/SslContext;->newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Ljava/io/File;Ljava/io/File;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 12
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .param p1, "certChainFile"    # Ljava/io/File;
    .param p2, "keyFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v2, 0x0

    .line 142
    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-wide v10, v8

    invoke-static/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/SslContext;->newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Ljava/io/File;Ljava/io/File;Ljava/lang/String;)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 12
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .param p1, "certChainFile"    # Ljava/io/File;
    .param p2, "keyFile"    # Ljava/io/File;
    .param p3, "keyPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v2, 0x0

    .line 158
    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, v2

    move-object v7, v2

    move-wide v10, v8

    invoke-static/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/SslContext;->newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;

    move-result-object v0

    return-object v0
.end method

.method public static newServerContext(Lorg/jboss/netty/handler/ssl/SslProvider;Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)Lorg/jboss/netty/handler/ssl/SslContext;
    .locals 13
    .param p0, "provider"    # Lorg/jboss/netty/handler/ssl/SslProvider;
    .param p1, "bufPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p2, "certChainFile"    # Ljava/io/File;
    .param p3, "keyFile"    # Ljava/io/File;
    .param p4, "keyPassword"    # Ljava/lang/String;
    .param p7, "sessionCacheSize"    # J
    .param p9, "sessionTimeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/ssl/SslProvider;",
            "Lorg/jboss/netty/handler/ssl/SslBufferPool;",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;JJ)",
            "Lorg/jboss/netty/handler/ssl/SslContext;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 188
    .local p5, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    .local p6, "nextProtocols":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    if-nez p0, :cond_0

    .line 189
    invoke-static {}, Lorg/jboss/netty/handler/ssl/OpenSsl;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lorg/jboss/netty/handler/ssl/SslProvider;->OPENSSL:Lorg/jboss/netty/handler/ssl/SslProvider;

    .line 192
    :cond_0
    :goto_0
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslContext$1;->$SwitchMap$org$jboss$netty$handler$ssl$SslProvider:[I

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslProvider;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 202
    new-instance v0, Ljava/lang/Error;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslProvider;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_1
    sget-object p0, Lorg/jboss/netty/handler/ssl/SslProvider;->JDK:Lorg/jboss/netty/handler/ssl/SslProvider;

    goto :goto_0

    .line 194
    :pswitch_0
    new-instance v1, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-wide/from16 v8, p7

    move-wide/from16 v10, p9

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V

    .line 198
    :goto_1
    return-object v1

    :pswitch_1
    new-instance v1, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-wide/from16 v8, p7

    move-wide/from16 v10, p9

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V

    goto :goto_1

    .line 192
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public final bufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .locals 1

    .prologue
    .line 405
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslContext;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    return-object v0
.end method

.method public abstract cipherSuites()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isClient()Z
.end method

.method public final isServer()Z
    .locals 1

    .prologue
    .line 398
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslContext;->isClient()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method newBufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 391
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-direct {v0, v1, v1}, Lorg/jboss/netty/handler/ssl/SslBufferPool;-><init>(ZZ)V

    return-object v0
.end method

.method public abstract newEngine()Ljavax/net/ssl/SSLEngine;
.end method

.method public abstract newEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;
.end method

.method public final newHandler()Lorg/jboss/netty/handler/ssl/SslHandler;
    .locals 1

    .prologue
    .line 459
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslContext;->newEngine()Ljavax/net/ssl/SSLEngine;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/SslContext;->newHandler(Ljavax/net/ssl/SSLEngine;)Lorg/jboss/netty/handler/ssl/SslHandler;

    move-result-object v0

    return-object v0
.end method

.method public final newHandler(Ljava/lang/String;I)Lorg/jboss/netty/handler/ssl/SslHandler;
    .locals 1
    .param p1, "peerHost"    # Ljava/lang/String;
    .param p2, "peerPort"    # I

    .prologue
    .line 471
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/ssl/SslContext;->newEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/SslContext;->newHandler(Ljavax/net/ssl/SSLEngine;)Lorg/jboss/netty/handler/ssl/SslHandler;

    move-result-object v0

    return-object v0
.end method

.method public abstract nextProtocols()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract sessionCacheSize()J
.end method

.method public abstract sessionTimeout()J
.end method
