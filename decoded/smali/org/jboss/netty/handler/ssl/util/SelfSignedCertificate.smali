.class public final Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;
.super Ljava/lang/Object;
.source "SelfSignedCertificate.java"


# static fields
.field static final NOT_AFTER:Ljava/util/Date;

.field static final NOT_BEFORE:Ljava/util/Date;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final certificate:Ljava/io/File;

.field private final privateKey:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 57
    const-class v0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 60
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide v4, 0x757b12c00L

    sub-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->NOT_BEFORE:Ljava/util/Date;

    .line 62
    new-instance v0, Ljava/util/Date;

    const-wide v2, 0xe677d21fd818L

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->NOT_AFTER:Ljava/util/Date;

    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 71
    const-string v0, "example.com"

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;-><init>(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "fqdn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 82
    invoke-static {}, Lorg/jboss/netty/handler/ssl/util/ThreadLocalInsecureRandom;->current()Ljava/security/SecureRandom;

    move-result-object v0

    const/16 v1, 0x400

    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;-><init>(Ljava/lang/String;Ljava/security/SecureRandom;I)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/security/SecureRandom;I)V
    .locals 8
    .param p1, "fqdn"    # Ljava/lang/String;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .param p3, "bits"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    :try_start_0
    const-string v6, "RSA"

    invoke-static {v6}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v1

    .line 97
    .local v1, "keyGen":Ljava/security/KeyPairGenerator;
    invoke-virtual {v1, p3, p2}, Ljava/security/KeyPairGenerator;->initialize(ILjava/security/SecureRandom;)V

    .line 98
    invoke-virtual {v1}, Ljava/security/KeyPairGenerator;->generateKeyPair()Ljava/security/KeyPair;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 107
    .local v2, "keypair":Ljava/security/KeyPair;
    :try_start_1
    invoke-static {p1, v2, p2}, Lorg/jboss/netty/handler/ssl/util/OpenJdkSelfSignedCertGenerator;->generate(Ljava/lang/String;Ljava/security/KeyPair;Ljava/security/SecureRandom;)[Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 121
    .local v3, "paths":[Ljava/lang/String;
    :goto_0
    new-instance v6, Ljava/io/File;

    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->certificate:Ljava/io/File;

    .line 122
    new-instance v6, Ljava/io/File;

    const/4 v7, 0x1

    aget-object v7, v3, v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->privateKey:Ljava/io/File;

    .line 123
    return-void

    .line 99
    .end local v1    # "keyGen":Ljava/security/KeyPairGenerator;
    .end local v2    # "keypair":Ljava/security/KeyPair;
    .end local v3    # "paths":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v6, Ljava/lang/Error;

    invoke-direct {v6, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 108
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v1    # "keyGen":Ljava/security/KeyPairGenerator;
    .restart local v2    # "keypair":Ljava/security/KeyPair;
    :catch_1
    move-exception v4

    .line 109
    .local v4, "t":Ljava/lang/Throwable;
    sget-object v6, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v7, "Failed to generate a self-signed X.509 certificate using sun.security.x509:"

    invoke-interface {v6, v7, v4}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 112
    :try_start_2
    invoke-static {p1, v2, p2}, Lorg/jboss/netty/handler/ssl/util/BouncyCastleSelfSignedCertGenerator;->generate(Ljava/lang/String;Ljava/security/KeyPair;Ljava/security/SecureRandom;)[Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v3

    .restart local v3    # "paths":[Ljava/lang/String;
    goto :goto_0

    .line 113
    .end local v3    # "paths":[Ljava/lang/String;
    :catch_2
    move-exception v5

    .line 114
    .local v5, "t2":Ljava/lang/Throwable;
    sget-object v6, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v7, "Failed to generate a self-signed X.509 certificate using Bouncy Castle:"

    invoke-interface {v6, v7, v5}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 115
    new-instance v6, Ljava/security/cert/CertificateException;

    const-string v7, "No provider succeeded to generate a self-signed certificate. See debug log for the root cause."

    invoke-direct {v6, v7}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method static newSelfSignedCertificate(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/security/cert/X509Certificate;)[Ljava/lang/String;
    .locals 11
    .param p0, "fqdn"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/security/PrivateKey;
    .param p2, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x5f

    const/4 v9, 0x1

    .line 151
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "-----BEGIN PRIVATE KEY-----\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p1}, Ljava/security/PrivateKey;->getEncoded()[B

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    invoke-static {v7, v9}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;Z)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    sget-object v8, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-interface {v7, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n-----END PRIVATE KEY-----\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 155
    .local v5, "keyText":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "keyutil_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, ".key"

    invoke-static {v6, v7}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 156
    .local v3, "keyFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->deleteOnExit()V

    .line 158
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 160
    .local v4, "keyOut":Ljava/io/OutputStream;
    :try_start_0
    sget-object v6, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v6}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/io/OutputStream;->write([B)V

    .line 161
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    const/4 v4, 0x0

    .line 164
    if-eqz v4, :cond_0

    .line 165
    invoke-static {v3, v4}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeClose(Ljava/io/File;Ljava/io/OutputStream;)V

    .line 166
    invoke-static {v3}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 171
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "-----BEGIN CERTIFICATE-----\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    invoke-static {v7, v9}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;Z)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    sget-object v8, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-interface {v7, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n-----END CERTIFICATE-----\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 175
    .local v2, "certText":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "keyutil_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, ".crt"

    invoke-static {v6, v7}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 176
    .local v0, "certFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->deleteOnExit()V

    .line 178
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 180
    .local v1, "certOut":Ljava/io/OutputStream;
    :try_start_1
    sget-object v6, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v6}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 181
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 182
    const/4 v1, 0x0

    .line 184
    if-eqz v1, :cond_1

    .line 185
    invoke-static {v0, v1}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeClose(Ljava/io/File;Ljava/io/OutputStream;)V

    .line 186
    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 187
    invoke-static {v3}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 191
    :cond_1
    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    return-object v6

    .line 164
    .end local v0    # "certFile":Ljava/io/File;
    .end local v1    # "certOut":Ljava/io/OutputStream;
    .end local v2    # "certText":Ljava/lang/String;
    :catchall_0
    move-exception v6

    if-eqz v4, :cond_2

    .line 165
    invoke-static {v3, v4}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeClose(Ljava/io/File;Ljava/io/OutputStream;)V

    .line 166
    invoke-static {v3}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 164
    :cond_2
    throw v6

    .line 184
    .restart local v0    # "certFile":Ljava/io/File;
    .restart local v1    # "certOut":Ljava/io/OutputStream;
    .restart local v2    # "certText":Ljava/lang/String;
    :catchall_1
    move-exception v6

    if-eqz v1, :cond_3

    .line 185
    invoke-static {v0, v1}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeClose(Ljava/io/File;Ljava/io/OutputStream;)V

    .line 186
    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 187
    invoke-static {v3}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 184
    :cond_3
    throw v6
.end method

.method private static safeClose(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 4
    .param p0, "keyFile"    # Ljava/io/File;
    .param p1, "keyOut"    # Ljava/io/OutputStream;

    .prologue
    .line 202
    :try_start_0
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    :goto_0
    return-void

    .line 203
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to close a file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static safeDelete(Ljava/io/File;)V
    .locals 3
    .param p0, "certFile"    # Ljava/io/File;

    .prologue
    .line 195
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 196
    sget-object v0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to delete a file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    .line 198
    :cond_0
    return-void
.end method


# virtual methods
.method public certificate()Ljava/io/File;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->certificate:Ljava/io/File;

    return-object v0
.end method

.method public delete()V
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->certificate:Ljava/io/File;

    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 144
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->privateKey:Ljava/io/File;

    invoke-static {v0}, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->safeDelete(Ljava/io/File;)V

    .line 145
    return-void
.end method

.method public privateKey()Ljava/io/File;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/util/SelfSignedCertificate;->privateKey:Ljava/io/File;

    return-object v0
.end method
