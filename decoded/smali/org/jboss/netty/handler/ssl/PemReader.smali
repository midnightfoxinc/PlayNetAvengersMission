.class final Lorg/jboss/netty/handler/ssl/PemReader;
.super Ljava/lang/Object;
.source "PemReader.java"


# static fields
.field private static final CERT_PATTERN:Ljava/util/regex/Pattern;

.field private static final KEY_PATTERN:Ljava/util/regex/Pattern;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 45
    const-class v0, Lorg/jboss/netty/handler/ssl/PemReader;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/PemReader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 47
    const-string v0, "-+BEGIN\\s+.*CERTIFICATE[^-]*-+(?:\\s|\\r|\\n)+([a-z0-9+/=\\r\\n]+)-+END\\s+.*CERTIFICATE[^-]*-+"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/PemReader;->CERT_PATTERN:Ljava/util/regex/Pattern;

    .line 52
    const-string v0, "-+BEGIN\\s+.*PRIVATE\\s+KEY[^-]*-+(?:\\s|\\r|\\n)+([a-z0-9+/=\\r\\n]+)-+END\\s+.*PRIVATE\\s+KEY[^-]*-+"

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/PemReader;->KEY_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static readCertificates(Ljava/io/File;)[Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 8
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 61
    :try_start_0
    invoke-static {p0}, Lorg/jboss/netty/handler/ssl/PemReader;->readContent(Ljava/io/File;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 66
    .local v1, "content":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v0, "certs":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    sget-object v5, Lorg/jboss/netty/handler/ssl/PemReader;->CERT_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 68
    .local v3, "m":Ljava/util/regex/Matcher;
    const/4 v4, 0x0

    .line 70
    .local v4, "start":I
    :goto_0
    invoke-virtual {v3, v4}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v5

    if-nez v5, :cond_0

    .line 78
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 79
    new-instance v5, Ljava/security/cert/CertificateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "found no certificates: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 62
    .end local v0    # "certs":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .end local v1    # "content":Ljava/lang/String;
    .end local v3    # "m":Ljava/util/regex/Matcher;
    .end local v4    # "start":I
    :catch_0
    move-exception v2

    .line 63
    .local v2, "e":Ljava/io/IOException;
    new-instance v5, Ljava/security/cert/CertificateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "failed to read a file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v2}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 74
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "certs":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/buffer/ChannelBuffer;>;"
    .restart local v1    # "content":Ljava/lang/String;
    .restart local v3    # "m":Ljava/util/regex/Matcher;
    .restart local v4    # "start":I
    :cond_0
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-static {v5, v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-static {v5}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    move-result v4

    goto :goto_0

    .line 82
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v5
.end method

.method private static readContent(Ljava/io/File;)Ljava/lang/String;
    .locals 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 103
    .local v1, "in":Ljava/io/InputStream;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 105
    .local v2, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v4, 0x2000

    :try_start_0
    new-array v0, v4, [B

    .line 107
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 108
    .local v3, "ret":I
    if-gez v3, :cond_0

    .line 113
    sget-object v4, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v4}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 115
    invoke-static {v1}, Lorg/jboss/netty/handler/ssl/PemReader;->safeClose(Ljava/io/InputStream;)V

    .line 116
    invoke-static {v2}, Lorg/jboss/netty/handler/ssl/PemReader;->safeClose(Ljava/io/OutputStream;)V

    .line 113
    return-object v4

    .line 111
    :cond_0
    const/4 v4, 0x0

    :try_start_1
    invoke-virtual {v2, v0, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 115
    .end local v0    # "buf":[B
    .end local v3    # "ret":I
    :catchall_0
    move-exception v4

    invoke-static {v1}, Lorg/jboss/netty/handler/ssl/PemReader;->safeClose(Ljava/io/InputStream;)V

    .line 116
    invoke-static {v2}, Lorg/jboss/netty/handler/ssl/PemReader;->safeClose(Ljava/io/OutputStream;)V

    .line 115
    throw v4
.end method

.method static readPrivateKey(Ljava/io/File;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyException;
        }
    .end annotation

    .prologue
    .line 88
    :try_start_0
    invoke-static {p0}, Lorg/jboss/netty/handler/ssl/PemReader;->readContent(Ljava/io/File;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 93
    .local v0, "content":Ljava/lang/String;
    sget-object v3, Lorg/jboss/netty/handler/ssl/PemReader;->KEY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 94
    .local v2, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-nez v3, :cond_0

    .line 95
    new-instance v3, Ljava/security/KeyException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "found no private key: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/KeyException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 89
    .end local v0    # "content":Ljava/lang/String;
    .end local v2    # "m":Ljava/util/regex/Matcher;
    :catch_0
    move-exception v1

    .line 90
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Ljava/security/KeyException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "failed to read a file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/security/KeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 98
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "content":Ljava/lang/String;
    .restart local v2    # "m":Ljava/util/regex/Matcher;
    :cond_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-static {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    invoke-static {v3}, Lorg/jboss/netty/handler/codec/base64/Base64;->decode(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    return-object v3
.end method

.method private static safeClose(Ljava/io/InputStream;)V
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 122
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/jboss/netty/handler/ssl/PemReader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to close a stream."

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static safeClose(Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 130
    :try_start_0
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    :goto_0
    return-void

    .line 131
    :catch_0
    move-exception v0

    .line 132
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/jboss/netty/handler/ssl/PemReader;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to close a stream."

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
