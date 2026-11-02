.class public final Lorg/jboss/netty/handler/ssl/JdkSslClientContext;
.super Lorg/jboss/netty/handler/ssl/JdkSslContext;
.source "JdkSslClientContext.java"


# instance fields
.field private final ctx:Ljavax/net/ssl/SSLContext;

.field private final nextProtocols:Ljava/util/List;
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
.method public constructor <init>()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    .line 47
    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, v1

    move-wide v8, v6

    invoke-direct/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "certChainFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;-><init>(Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;)V
    .locals 10
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

    .line 81
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, v1

    move-wide v8, v6

    invoke-direct/range {v0 .. v9}, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V

    .line 82
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/TrustManagerFactory;)V
    .locals 1
    .param p1, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;-><init>(Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljavax/net/ssl/TrustManagerFactory;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V
    .locals 20
    .param p1, "bufPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p2, "certChainFile"    # Ljava/io/File;
    .param p3, "trustManagerFactory"    # Ljavax/net/ssl/TrustManagerFactory;
    .param p6, "sessionCacheSize"    # J
    .param p8, "sessionTimeout"    # J
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
            ">;JJ)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 108
    .local p4, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    .local p5, "nextProtocols":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/ssl/JdkSslContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/lang/Iterable;)V

    .line 110
    if-eqz p5, :cond_5

    invoke-interface/range {p5 .. p5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_5

    .line 111
    invoke-static {}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->isAvailable()Z

    move-result v16

    if-nez v16, :cond_0

    .line 112
    new-instance v16, Ljavax/net/ssl/SSLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "NPN/ALPN unsupported: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 115
    :cond_0
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .local v12, "nextProtoList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {p5 .. p5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 117
    .local v13, "p":Ljava/lang/String;
    if-nez v13, :cond_4

    .line 122
    .end local v13    # "p":Ljava/lang/String;
    :cond_1
    invoke-static {v12}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->nextProtocols:Ljava/util/List;

    .line 128
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v12    # "nextProtoList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    if-nez p2, :cond_7

    .line 129
    :try_start_0
    const-string v16, "TLS"

    invoke-static/range {v16 .. v16}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->ctx:Ljavax/net/ssl/SSLContext;

    .line 130
    if-nez p3, :cond_6

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->ctx:Ljavax/net/ssl/SSLContext;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-virtual/range {v16 .. v19}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 158
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->ctx:Ljavax/net/ssl/SSLContext;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljavax/net/ssl/SSLContext;->getClientSessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v15

    .line 159
    .local v15, "sessCtx":Ljavax/net/ssl/SSLSessionContext;
    const-wide/16 v16, 0x0

    cmp-long v16, p6, v16

    if-lez v16, :cond_2

    .line 160
    const-wide/32 v16, 0x7fffffff

    move-wide/from16 v0, p6

    move-wide/from16 v2, v16

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v16, v0

    invoke-interface/range {v15 .. v16}, Ljavax/net/ssl/SSLSessionContext;->setSessionCacheSize(I)V

    .line 162
    :cond_2
    const-wide/16 v16, 0x0

    cmp-long v16, p8, v16

    if-lez v16, :cond_3

    .line 163
    const-wide/32 v16, 0x7fffffff

    move-wide/from16 v0, p8

    move-wide/from16 v2, v16

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v16, v0

    invoke-interface/range {v15 .. v16}, Ljavax/net/ssl/SSLSessionContext;->setSessionTimeout(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :cond_3
    return-void

    .line 120
    .end local v15    # "sessCtx":Ljavax/net/ssl/SSLSessionContext;
    .restart local v9    # "i$":Ljava/util/Iterator;
    .restart local v12    # "nextProtoList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v13    # "p":Ljava/lang/String;
    :cond_4
    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 124
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v12    # "nextProtoList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v13    # "p":Ljava/lang/String;
    :cond_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->nextProtocols:Ljava/util/List;

    goto :goto_1

    .line 133
    :cond_6
    const/16 v16, 0x0

    :try_start_1
    check-cast v16, Ljava/security/KeyStore;

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 134
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->ctx:Ljavax/net/ssl/SSLContext;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {p3 .. p3}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v18

    const/16 v19, 0x0

    invoke-virtual/range {v16 .. v19}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 165
    :catch_0
    move-exception v8

    .line 166
    .local v8, "e":Ljava/lang/Exception;
    new-instance v16, Ljavax/net/ssl/SSLException;

    const-string v17, "failed to initialize the server-side SSL context"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v8}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v16

    .line 137
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_7
    :try_start_2
    const-string v16, "JKS"

    invoke-static/range {v16 .. v16}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v10

    .line 138
    .local v10, "ks":Ljava/security/KeyStore;
    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 139
    const-string v16, "X.509"

    invoke-static/range {v16 .. v16}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v7

    .line 141
    .local v7, "cf":Ljava/security/cert/CertificateFactory;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/handler/ssl/PemReader;->readCertificates(Ljava/io/File;)[Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    .local v4, "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    array-length v11, v4

    .local v11, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_3
    if-ge v9, v11, :cond_8

    aget-object v5, v4, v9

    .line 142
    .local v5, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    new-instance v16, Lorg/jboss/netty/buffer/ChannelBufferInputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v5}, Lorg/jboss/netty/buffer/ChannelBufferInputStream;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v6

    check-cast v6, Ljava/security/cert/X509Certificate;

    .line 143
    .local v6, "cert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v6}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v14

    .line 144
    .local v14, "principal":Ljavax/security/auth/x500/X500Principal;
    const-string v16, "RFC2253"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljavax/security/auth/x500/X500Principal;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v10, v0, v6}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V

    .line 141
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 148
    .end local v5    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v6    # "cert":Ljava/security/cert/X509Certificate;
    .end local v14    # "principal":Ljavax/security/auth/x500/X500Principal;
    :cond_8
    if-nez p3, :cond_9

    .line 149
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object p3

    .line 151
    :cond_9
    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 154
    const-string v16, "TLS"

    invoke-static/range {v16 .. v16}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->ctx:Ljavax/net/ssl/SSLContext;

    .line 155
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->ctx:Ljavax/net/ssl/SSLContext;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {p3 .. p3}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v18

    const/16 v19, 0x0

    invoke-virtual/range {v16 .. v19}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_2
.end method


# virtual methods
.method public context()Ljavax/net/ssl/SSLContext;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->ctx:Ljavax/net/ssl/SSLContext;

    return-object v0
.end method

.method public isClient()Z
    .locals 1

    .prologue
    .line 172
    const/4 v0, 0x1

    return v0
.end method

.method public nextProtocols()Ljava/util/List;
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
    .line 177
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslClientContext;->nextProtocols:Ljava/util/List;

    return-object v0
.end method
