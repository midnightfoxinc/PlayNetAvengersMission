.class public final Lorg/jboss/netty/handler/ssl/OpenSslServerContext;
.super Lorg/jboss/netty/handler/ssl/SslContext;
.source "OpenSslServerContext.java"


# static fields
.field private static final DEFAULT_CIPHERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final aprPool:J

.field private final ciphers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final ctx:J

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

.field private final sessionCacheSize:J

.field private final sessionTimeout:J

.field private final stats:Lorg/jboss/netty/handler/ssl/OpenSslSessionStats;

.field private final unmodifiableCiphers:Ljava/util/List;
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
    .locals 4

    .prologue
    .line 36
    const-class v1, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;

    invoke-static {v1}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v1

    sput-object v1, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v0, "ciphers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "ECDHE-RSA-AES128-GCM-SHA256"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "ECDHE-RSA-AES128-SHA"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "ECDHE-RSA-AES256-SHA"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "AES128-GCM-SHA256"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "AES128-SHA"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "AES256-SHA"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "DES-CBC3-SHA"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "RC4-SHA"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 52
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->DEFAULT_CIPHERS:Ljava/util/List;

    .line 54
    sget-object v1, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    sget-object v1, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Default cipher suite (OpenSSL): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 57
    :cond_0
    return-void
.end method

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
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    .line 79
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

    .line 90
    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, v2

    move-object v7, v2

    move-wide v10, v8

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V

    .line 91
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/lang/Iterable;Ljava/lang/Iterable;JJ)V
    .locals 21
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
    .line 117
    .local p5, "ciphers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    .local p6, "nextProtocols":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p1}, Lorg/jboss/netty/handler/ssl/SslContext;-><init>(Lorg/jboss/netty/handler/ssl/SslBufferPool;)V

    .line 61
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ciphers:Ljava/util/List;

    .line 62
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ciphers:Ljava/util/List;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->unmodifiableCiphers:Ljava/util/List;

    .line 119
    invoke-static {}, Lorg/jboss/netty/handler/ssl/OpenSsl;->ensureAvailability()V

    .line 121
    if-nez p2, :cond_0

    .line 122
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "certChainFile"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 124
    :cond_0
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_1

    .line 125
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "certChainFile is not a file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 127
    :cond_1
    if-nez p3, :cond_2

    .line 128
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "keyPath"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 130
    :cond_2
    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_3

    .line 131
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "keyPath is not a file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 133
    :cond_3
    if-nez p5, :cond_4

    .line 134
    sget-object p5, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->DEFAULT_CIPHERS:Ljava/util/List;

    .line 137
    :cond_4
    if-nez p4, :cond_5

    .line 138
    const-string p4, ""

    .line 140
    :cond_5
    if-nez p6, :cond_6

    .line 141
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p6

    .line 144
    :cond_6
    invoke-interface/range {p5 .. p5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 145
    .local v10, "c":Ljava/lang/String;
    if-nez v10, :cond_a

    .line 151
    .end local v10    # "c":Ljava/lang/String;
    :cond_7
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .local v15, "nextProtoList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {p6 .. p6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 153
    .local v17, "p":Ljava/lang/String;
    if-nez v17, :cond_b

    .line 158
    .end local v17    # "p":Ljava/lang/String;
    :cond_8
    invoke-static {v15}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->nextProtocols:Ljava/util/List;

    .line 161
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Lorg/apache/tomcat/jni/Pool;->create(J)J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->aprPool:J

    .line 164
    const/16 v18, 0x0

    .line 166
    .local v18, "success":Z
    :try_start_0
    const-class v19, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;

    monitor-enter v19
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 168
    :try_start_1
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->aprPool:J

    const/4 v6, 0x6

    const/4 v7, 0x1

    invoke-static {v4, v5, v6, v7}, Lorg/apache/tomcat/jni/SSLContext;->make(JII)J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    :try_start_2
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/16 v6, 0xfff

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setOptions(JI)V

    .line 174
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/high16 v6, 0x1000000

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setOptions(JI)V

    .line 175
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/high16 v6, 0x2000000

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setOptions(JI)V

    .line 176
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/high16 v6, 0x400000

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setOptions(JI)V

    .line 177
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/high16 v6, 0x80000

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setOptions(JI)V

    .line 178
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/high16 v6, 0x100000

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setOptions(JI)V

    .line 179
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/high16 v6, 0x10000

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setOptions(JI)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 184
    :try_start_3
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .local v11, "cipherBuf":Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ciphers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 186
    .restart local v10    # "c":Ljava/lang/String;
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    const/16 v4, 0x3a

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljavax/net/ssl/SSLException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 192
    .end local v10    # "c":Ljava/lang/String;
    .end local v11    # "cipherBuf":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v12

    .line 193
    .local v12, "e":Ljavax/net/ssl/SSLException;
    :try_start_4
    throw v12

    .line 257
    .end local v12    # "e":Ljavax/net/ssl/SSLException;
    :catchall_0
    move-exception v4

    monitor-exit v19
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 260
    :catchall_1
    move-exception v4

    if-nez v18, :cond_9

    .line 261
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->destroyPools()V

    .line 260
    :cond_9
    throw v4

    .line 148
    .end local v15    # "nextProtoList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v18    # "success":Z
    .restart local v10    # "c":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ciphers:Ljava/util/List;

    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 156
    .end local v10    # "c":Ljava/lang/String;
    .restart local v15    # "nextProtoList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v17    # "p":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 169
    .end local v17    # "p":Ljava/lang/String;
    .restart local v18    # "success":Z
    :catch_1
    move-exception v12

    .line 170
    .local v12, "e":Ljava/lang/Exception;
    :try_start_6
    new-instance v4, Ljavax/net/ssl/SSLException;

    const-string v5, "failed to create an SSL_CTX"

    invoke-direct {v4, v5, v12}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 189
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v11    # "cipherBuf":Ljava/lang/StringBuilder;
    :cond_c
    :try_start_7
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 191
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setCipherSuite(JLjava/lang/String;)Z
    :try_end_7
    .catch Ljavax/net/ssl/SSLException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 199
    :try_start_8
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const/4 v6, 0x0

    const/16 v7, 0xa

    invoke-static {v4, v5, v6, v7}, Lorg/apache/tomcat/jni/SSLContext;->setVerify(JII)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 203
    :try_start_9
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p3 .. p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    move-object/from16 v8, p4

    invoke-static/range {v4 .. v9}, Lorg/apache/tomcat/jni/SSLContext;->setCertificate(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_d

    .line 205
    new-instance v4, Ljavax/net/ssl/SSLException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "failed to set certificate: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lorg/apache/tomcat/jni/SSL;->getLastError()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_9
    .catch Ljavax/net/ssl/SSLException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 208
    :catch_2
    move-exception v12

    .line 209
    .local v12, "e":Ljavax/net/ssl/SSLException;
    :try_start_a
    throw v12

    .line 194
    .end local v11    # "cipherBuf":Ljava/lang/StringBuilder;
    .end local v12    # "e":Ljavax/net/ssl/SSLException;
    :catch_3
    move-exception v12

    .line 195
    .local v12, "e":Ljava/lang/Exception;
    new-instance v4, Ljavax/net/ssl/SSLException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "failed to set cipher suite: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ciphers:Ljava/util/List;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v12}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 210
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v11    # "cipherBuf":Ljava/lang/StringBuilder;
    :catch_4
    move-exception v12

    .line 211
    .restart local v12    # "e":Ljava/lang/Exception;
    new-instance v4, Ljavax/net/ssl/SSLException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "failed to set certificate: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v12}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 215
    .end local v12    # "e":Ljava/lang/Exception;
    :cond_d
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-static {v4, v5, v6, v7}, Lorg/apache/tomcat/jni/SSLContext;->setCertificateChainFile(JLjava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_e

    .line 216
    invoke-static {}, Lorg/apache/tomcat/jni/SSL;->getLastError()Ljava/lang/String;

    move-result-object v13

    .line 217
    .local v13, "error":Ljava/lang/String;
    const-string v4, "error:00000000:"

    invoke-virtual {v13, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 218
    new-instance v4, Ljavax/net/ssl/SSLException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "failed to set certificate chain: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lorg/apache/tomcat/jni/SSL;->getLastError()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 224
    .end local v13    # "error":Ljava/lang/String;
    :cond_e
    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_10

    .line 226
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .local v16, "nextProtocolBuf":Ljava/lang/StringBuilder;
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 228
    .restart local v17    # "p":Ljava/lang/String;
    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    const/16 v4, 0x2c

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 231
    .end local v17    # "p":Ljava/lang/String;
    :cond_f
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 233
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/apache/tomcat/jni/SSLContext;->setNextProtos(JLjava/lang/String;)V

    .line 237
    .end local v16    # "nextProtocolBuf":Ljava/lang/StringBuilder;
    :cond_10
    const-wide/16 v4, 0x0

    cmp-long v4, p7, v4

    if-lez v4, :cond_12

    .line 238
    move-wide/from16 v0, p7

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->sessionCacheSize:J

    .line 239
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    move-wide/from16 v0, p7

    invoke-static {v4, v5, v0, v1}, Lorg/apache/tomcat/jni/SSLContext;->setSessionCacheSize(JJ)J

    .line 248
    :goto_4
    const-wide/16 v4, 0x0

    cmp-long v4, p9, v4

    if-lez v4, :cond_13

    .line 249
    move-wide/from16 v0, p9

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->sessionTimeout:J

    .line 250
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    move-wide/from16 v0, p9

    invoke-static {v4, v5, v0, v1}, Lorg/apache/tomcat/jni/SSLContext;->setSessionCacheTimeout(JJ)J

    .line 257
    :goto_5
    monitor-exit v19
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 258
    const/16 v18, 0x1

    .line 260
    if-nez v18, :cond_11

    .line 261
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->destroyPools()V

    .line 265
    :cond_11
    new-instance v4, Lorg/jboss/netty/handler/ssl/OpenSslSessionStats;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-direct {v4, v6, v7}, Lorg/jboss/netty/handler/ssl/OpenSslSessionStats;-><init>(J)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->stats:Lorg/jboss/netty/handler/ssl/OpenSslSessionStats;

    .line 266
    return-void

    .line 242
    :cond_12
    :try_start_b
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const-wide/16 v6, 0x5000

    invoke-static {v4, v5, v6, v7}, Lorg/apache/tomcat/jni/SSLContext;->setSessionCacheSize(JJ)J

    move-result-wide p7

    move-wide/from16 v0, p7

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->sessionCacheSize:J

    .line 244
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    move-wide/from16 v0, p7

    invoke-static {v4, v5, v0, v1}, Lorg/apache/tomcat/jni/SSLContext;->setSessionCacheSize(JJ)J

    goto :goto_4

    .line 253
    :cond_13
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const-wide/16 v6, 0x12c

    invoke-static {v4, v5, v6, v7}, Lorg/apache/tomcat/jni/SSLContext;->setSessionCacheTimeout(JJ)J

    move-result-wide p9

    move-wide/from16 v0, p9

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->sessionTimeout:J

    .line 255
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    move-wide/from16 v0, p9

    invoke-static {v4, v5, v0, v1}, Lorg/apache/tomcat/jni/SSLContext;->setSessionCacheTimeout(JJ)J
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_5
.end method

.method private destroyPools()V
    .locals 4

    .prologue
    .line 354
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->aprPool:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 355
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->aprPool:J

    invoke-static {v0, v1}, Lorg/apache/tomcat/jni/Pool;->destroy(J)V

    .line 357
    :cond_0
    return-void
.end method


# virtual methods
.method public cipherSuites()Ljava/util/List;
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
    .line 280
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->unmodifiableCiphers:Ljava/util/List;

    return-object v0
.end method

.method public context()J
    .locals 2

    .prologue
    .line 302
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    return-wide v0
.end method

.method protected finalize()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 343
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 344
    const-class v1, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;

    monitor-enter v1

    .line 345
    :try_start_0
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_0

    .line 346
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSLContext;->free(J)I

    .line 348
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 350
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->destroyPools()V

    .line 351
    return-void

    .line 348
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public isClient()Z
    .locals 1

    .prologue
    .line 275
    const/4 v0, 0x0

    return v0
.end method

.method newBufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 270
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-direct {v0, v1, v1}, Lorg/jboss/netty/handler/ssl/SslBufferPool;-><init>(ZZ)V

    return-object v0
.end method

.method public newEngine()Ljavax/net/ssl/SSLEngine;
    .locals 6

    .prologue
    .line 317
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->nextProtocols:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 318
    new-instance v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->bufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-result-object v1

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v1, v4}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;-><init>(JLorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/lang/String;)V

    .line 320
    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->bufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-result-object v4

    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->nextProtocols:Ljava/util/List;

    iget-object v5, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->nextProtocols:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4, v0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;-><init>(JLorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_0
.end method

.method public newEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;
    .locals 1
    .param p1, "peerHost"    # Ljava/lang/String;
    .param p2, "peerPort"    # I

    .prologue
    .line 327
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
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
    .line 295
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->nextProtocols:Ljava/util/List;

    return-object v0
.end method

.method public sessionCacheSize()J
    .locals 2

    .prologue
    .line 285
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->sessionCacheSize:J

    return-wide v0
.end method

.method public sessionTimeout()J
    .locals 2

    .prologue
    .line 290
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->sessionTimeout:J

    return-wide v0
.end method

.method public setTicketKeys([B)V
    .locals 2
    .param p1, "keys"    # [B

    .prologue
    .line 334
    if-eqz p1, :cond_0

    .line 335
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "keys"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 337
    :cond_0
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->ctx:J

    invoke-static {v0, v1, p1}, Lorg/apache/tomcat/jni/SSLContext;->setSessionTicketKeys(J[B)V

    .line 338
    return-void
.end method

.method public stats()Lorg/jboss/netty/handler/ssl/OpenSslSessionStats;
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslServerContext;->stats:Lorg/jboss/netty/handler/ssl/OpenSslSessionStats;

    return-object v0
.end method
