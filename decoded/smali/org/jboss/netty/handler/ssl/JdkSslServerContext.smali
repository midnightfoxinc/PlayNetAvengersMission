.class public final Lorg/jboss/netty/handler/ssl/JdkSslServerContext;
.super Lorg/jboss/netty/handler/ssl/JdkSslContext;
.source "JdkSslServerContext.java"


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
.method public constructor <init>(Ljava/io/File;Ljava/io/File;)V
    .locals 1
    .param p1, "certChainFile"    # Ljava/io/File;
    .param p2, "keyFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    .locals 12
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

    .line 76
    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, v2

    move-object v7, v2

    move-wide v10, v8

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V

    .line 77
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V
    .locals 31
    .param p1, "bufPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p2, "certChainFile"    # Ljava/io/File;
    .param p3, "keyFile"    # Ljava/io/File;
    .param p4, "keyPassword"    # Ljava/lang/String;
    .param p7, "sessionCacheSize"    # J
    .param p9, "sessionTimeout"    # J
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
            ">;JJ)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 103
    .local p5, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    .local p6, "nextProtocols":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/ssl/JdkSslContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/lang/Iterable;)V

    .line 105
    if-nez p2, :cond_0

    .line 106
    new-instance v27, Ljava/lang/NullPointerException;

    const-string v28, "certChainFile"

    invoke-direct/range {v27 .. v28}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 108
    :cond_0
    if-nez p3, :cond_1

    .line 109
    new-instance v27, Ljava/lang/NullPointerException;

    const-string v28, "keyFile"

    invoke-direct/range {v27 .. v28}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 112
    :cond_1
    if-nez p4, :cond_2

    .line 113
    const-string p4, ""

    .line 116
    :cond_2
    if-eqz p6, :cond_7

    invoke-interface/range {p6 .. p6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_7

    .line 117
    invoke-static {}, Lorg/jboss/netty/handler/ssl/JettyNpnSslEngine;->isAvailable()Z

    move-result v27

    if-nez v27, :cond_3

    .line 118
    new-instance v27, Ljavax/net/ssl/SSLException;

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "NPN/ALPN unsupported: "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 121
    :cond_3
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v23, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {p6 .. p6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_4

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    .line 123
    .local v24, "p":Ljava/lang/String;
    if-nez v24, :cond_6

    .line 129
    .end local v24    # "p":Ljava/lang/String;
    :cond_4
    invoke-static/range {v23 .. v23}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->nextProtocols:Ljava/util/List;

    .line 134
    .end local v16    # "i$":Ljava/util/Iterator;
    .end local v23    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    const-string v27, "ssl.KeyManagerFactory.algorithm"

    invoke-static/range {v27 .. v27}, Ljava/security/Security;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 135
    .local v6, "algorithm":Ljava/lang/String;
    if-nez v6, :cond_5

    .line 136
    const-string v6, "SunX509"

    .line 140
    :cond_5
    :try_start_0
    const-string v27, "JKS"

    invoke-static/range {v27 .. v27}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v21

    .line 141
    .local v21, "ks":Ljava/security/KeyStore;
    const/16 v27, 0x0

    const/16 v28, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 142
    const-string v27, "X.509"

    invoke-static/range {v27 .. v27}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v10

    .line 143
    .local v10, "cf":Ljava/security/cert/CertificateFactory;
    const-string v27, "RSA"

    invoke-static/range {v27 .. v27}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v25

    .line 144
    .local v25, "rsaKF":Ljava/security/KeyFactory;
    const-string v27, "DSA"

    invoke-static/range {v27 .. v27}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v11

    .line 146
    .local v11, "dsaKF":Ljava/security/KeyFactory;
    invoke-static/range {p3 .. p3}, Lorg/jboss/netty/handler/ssl/PemReader;->readPrivateKey(Ljava/io/File;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v14

    .line 147
    .local v14, "encodedKeyBuf":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v14}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v27

    move/from16 v0, v27

    new-array v13, v0, [B

    .line 148
    .local v13, "encodedKey":[B
    invoke-interface {v14, v13}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 150
    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v19

    .line 151
    .local v19, "keyPasswordChars":[C
    move-object/from16 v0, v19

    invoke-static {v0, v13}, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->generateKeySpec([C[B)Ljava/security/spec/PKCS8EncodedKeySpec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v15

    .line 155
    .local v15, "encodedKeySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    :try_start_1
    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;
    :try_end_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v18

    .line 160
    .local v18, "key":Ljava/security/PrivateKey;
    :goto_2
    :try_start_2
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .local v9, "certChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/handler/ssl/PemReader;->readCertificates(Ljava/io/File;)[Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    .local v7, "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    array-length v0, v7

    move/from16 v22, v0

    .local v22, "len$":I
    const/16 v16, 0x0

    .local v16, "i$":I
    :goto_3
    move/from16 v0, v16

    move/from16 v1, v22

    if-ge v0, v1, :cond_8

    aget-object v8, v7, v16

    .line 162
    .local v8, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    new-instance v27, Lorg/jboss/netty/buffer/ChannelBufferInputStream;

    move-object/from16 v0, v27

    invoke-direct {v0, v8}, Lorg/jboss/netty/buffer/ChannelBufferInputStream;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    move-object/from16 v0, v27

    invoke-virtual {v10, v0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 161
    add-int/lit8 v16, v16, 0x1

    goto :goto_3

    .line 126
    .end local v6    # "algorithm":Ljava/lang/String;
    .end local v7    # "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v8    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v9    # "certChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .end local v10    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v11    # "dsaKF":Ljava/security/KeyFactory;
    .end local v13    # "encodedKey":[B
    .end local v14    # "encodedKeyBuf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v15    # "encodedKeySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    .end local v18    # "key":Ljava/security/PrivateKey;
    .end local v19    # "keyPasswordChars":[C
    .end local v21    # "ks":Ljava/security/KeyStore;
    .end local v22    # "len$":I
    .end local v25    # "rsaKF":Ljava/security/KeyFactory;
    .local v16, "i$":Ljava/util/Iterator;
    .restart local v23    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v24    # "p":Ljava/lang/String;
    :cond_6
    invoke-interface/range {v23 .. v24}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 131
    .end local v16    # "i$":Ljava/util/Iterator;
    .end local v23    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v24    # "p":Ljava/lang/String;
    :cond_7
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->nextProtocols:Ljava/util/List;

    goto/16 :goto_1

    .line 156
    .restart local v6    # "algorithm":Ljava/lang/String;
    .restart local v10    # "cf":Ljava/security/cert/CertificateFactory;
    .restart local v11    # "dsaKF":Ljava/security/KeyFactory;
    .restart local v13    # "encodedKey":[B
    .restart local v14    # "encodedKeyBuf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v15    # "encodedKeySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    .restart local v19    # "keyPasswordChars":[C
    .restart local v21    # "ks":Ljava/security/KeyStore;
    .restart local v25    # "rsaKF":Ljava/security/KeyFactory;
    :catch_0
    move-exception v17

    .line 157
    .local v17, "ignore":Ljava/security/spec/InvalidKeySpecException;
    :try_start_3
    invoke-virtual {v11, v15}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v18

    .restart local v18    # "key":Ljava/security/PrivateKey;
    goto :goto_2

    .line 165
    .end local v17    # "ignore":Ljava/security/spec/InvalidKeySpecException;
    .restart local v7    # "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v9    # "certChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .local v16, "i$":I
    .restart local v22    # "len$":I
    :cond_8
    const-string v28, "key"

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v27

    move/from16 v0, v27

    new-array v0, v0, [Ljava/security/cert/Certificate;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-interface {v9, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v27

    check-cast v27, [Ljava/security/cert/Certificate;

    move-object/from16 v0, v21

    move-object/from16 v1, v28

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    move-object/from16 v4, v27

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/security/KeyStore;->setKeyEntry(Ljava/lang/String;Ljava/security/Key;[C[Ljava/security/cert/Certificate;)V

    .line 168
    invoke-static {v6}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object v20

    .line 169
    .local v20, "kmf":Ljavax/net/ssl/KeyManagerFactory;
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 172
    const-string v27, "TLS"

    invoke-static/range {v27 .. v27}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->ctx:Ljavax/net/ssl/SSLContext;

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->ctx:Ljavax/net/ssl/SSLContext;

    move-object/from16 v27, v0

    invoke-virtual/range {v20 .. v20}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object v28

    const/16 v29, 0x0

    const/16 v30, 0x0

    invoke-virtual/range {v27 .. v30}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 175
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->ctx:Ljavax/net/ssl/SSLContext;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljavax/net/ssl/SSLContext;->getServerSessionContext()Ljavax/net/ssl/SSLSessionContext;

    move-result-object v26

    .line 176
    .local v26, "sessCtx":Ljavax/net/ssl/SSLSessionContext;
    const-wide/16 v28, 0x0

    cmp-long v27, p7, v28

    if-lez v27, :cond_9

    .line 177
    const-wide/32 v28, 0x7fffffff

    move-wide/from16 v0, p7

    move-wide/from16 v2, v28

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v28

    move-wide/from16 v0, v28

    long-to-int v0, v0

    move/from16 v27, v0

    invoke-interface/range {v26 .. v27}, Ljavax/net/ssl/SSLSessionContext;->setSessionCacheSize(I)V

    .line 179
    :cond_9
    const-wide/16 v28, 0x0

    cmp-long v27, p9, v28

    if-lez v27, :cond_a

    .line 180
    const-wide/32 v28, 0x7fffffff

    move-wide/from16 v0, p9

    move-wide/from16 v2, v28

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v28

    move-wide/from16 v0, v28

    long-to-int v0, v0

    move/from16 v27, v0

    invoke-interface/range {v26 .. v27}, Ljavax/net/ssl/SSLSessionContext;->setSessionTimeout(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 185
    :cond_a
    return-void

    .line 182
    .end local v7    # "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v9    # "certChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    .end local v10    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v11    # "dsaKF":Ljava/security/KeyFactory;
    .end local v13    # "encodedKey":[B
    .end local v14    # "encodedKeyBuf":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v15    # "encodedKeySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    .end local v16    # "i$":I
    .end local v18    # "key":Ljava/security/PrivateKey;
    .end local v19    # "keyPasswordChars":[C
    .end local v20    # "kmf":Ljavax/net/ssl/KeyManagerFactory;
    .end local v21    # "ks":Ljava/security/KeyStore;
    .end local v22    # "len$":I
    .end local v25    # "rsaKF":Ljava/security/KeyFactory;
    .end local v26    # "sessCtx":Ljavax/net/ssl/SSLSessionContext;
    :catch_1
    move-exception v12

    .line 183
    .local v12, "e":Ljava/lang/Exception;
    new-instance v27, Ljavax/net/ssl/SSLException;

    const-string v28, "failed to initialize the server-side SSL context"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-direct {v0, v1, v12}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v27
.end method

.method private static generateKeySpec([C[B)Ljava/security/spec/PKCS8EncodedKeySpec;
    .locals 7
    .param p0, "password"    # [C
    .param p1, "key"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/spec/InvalidKeySpecException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 222
    if-eqz p0, :cond_0

    array-length v5, p0

    if-nez v5, :cond_1

    .line 223
    :cond_0
    new-instance v5, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v5, p1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 234
    :goto_0
    return-object v5

    .line 226
    :cond_1
    new-instance v1, Ljavax/crypto/EncryptedPrivateKeyInfo;

    invoke-direct {v1, p1}, Ljavax/crypto/EncryptedPrivateKeyInfo;-><init>([B)V

    .line 227
    .local v1, "encryptedPrivateKeyInfo":Ljavax/crypto/EncryptedPrivateKeyInfo;
    invoke-virtual {v1}, Ljavax/crypto/EncryptedPrivateKeyInfo;->getAlgName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v2

    .line 228
    .local v2, "keyFactory":Ljavax/crypto/SecretKeyFactory;
    new-instance v4, Ljavax/crypto/spec/PBEKeySpec;

    invoke-direct {v4, p0}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C)V

    .line 229
    .local v4, "pbeKeySpec":Ljavax/crypto/spec/PBEKeySpec;
    invoke-virtual {v2, v4}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v3

    .line 231
    .local v3, "pbeKey":Ljavax/crypto/SecretKey;
    invoke-virtual {v1}, Ljavax/crypto/EncryptedPrivateKeyInfo;->getAlgName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 232
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v5, 0x2

    invoke-virtual {v1}, Ljavax/crypto/EncryptedPrivateKeyInfo;->getAlgParameters()Ljava/security/AlgorithmParameters;

    move-result-object v6

    invoke-virtual {v0, v5, v3, v6}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/AlgorithmParameters;)V

    .line 234
    invoke-virtual {v1, v0}, Ljavax/crypto/EncryptedPrivateKeyInfo;->getKeySpec(Ljavax/crypto/Cipher;)Ljava/security/spec/PKCS8EncodedKeySpec;

    move-result-object v5

    goto :goto_0
.end method


# virtual methods
.method public context()Ljavax/net/ssl/SSLContext;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->ctx:Ljavax/net/ssl/SSLContext;

    return-object v0
.end method

.method public isClient()Z
    .locals 1

    .prologue
    .line 189
    const/4 v0, 0x0

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
    .line 194
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/JdkSslServerContext;->nextProtocols:Ljava/util/List;

    return-object v0
.end method
