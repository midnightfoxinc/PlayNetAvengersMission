.class public final Lorg/jboss/netty/handler/ssl/OpenSslEngine;
.super Ljavax/net/ssl/SSLEngine;
.source "OpenSslEngine.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final DESTROYED_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lorg/jboss/netty/handler/ssl/OpenSslEngine;",
            ">;"
        }
    .end annotation
.end field

.field private static final EMPTY_CERTIFICATES:[Ljava/security/cert/Certificate;

.field private static final EMPTY_X509_CERTIFICATES:[Ljavax/security/cert/X509Certificate;

.field private static final ENCRYPTED_PACKET_OVERSIZED:Ljavax/net/ssl/SSLException;

.field private static final ENGINE_CLOSED:Ljavax/net/ssl/SSLException;

.field private static final MAX_CIPHERTEXT_LENGTH:I = 0x4800

.field private static final MAX_COMPRESSED_LENGTH:I = 0x4400

.field static final MAX_ENCRYPTED_PACKET_LENGTH:I = 0x4919

.field private static final MAX_PLAINTEXT_LENGTH:I = 0x4000

.field private static final RENEGOTIATION_UNSUPPORTED:Ljavax/net/ssl/SSLException;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private accepted:I

.field private volatile applicationProtocol:Ljava/lang/String;

.field private final bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

.field private cipher:Ljava/lang/String;

.field private volatile destroyed:I

.field private engineClosed:Z

.field private final fallbackApplicationProtocol:Ljava/lang/String;

.field private handshakeFinished:Z

.field private isInboundDone:Z

.field private isOutboundDone:Z

.field private lastPrimingReadResult:I

.field private networkBIO:J

.field private receivedShutdown:Z

.field private session:Ljavax/net/ssl/SSLSession;

.field private ssl:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 43
    const-class v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    .line 45
    const-class v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 47
    new-array v0, v1, [Ljava/security/cert/Certificate;

    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->EMPTY_CERTIFICATES:[Ljava/security/cert/Certificate;

    .line 48
    new-array v0, v1, [Ljavax/security/cert/X509Certificate;

    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->EMPTY_X509_CERTIFICATES:[Ljavax/security/cert/X509Certificate;

    .line 50
    new-instance v0, Ljavax/net/ssl/SSLException;

    const-string v1, "engine closed"

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ENGINE_CLOSED:Ljavax/net/ssl/SSLException;

    .line 51
    new-instance v0, Ljavax/net/ssl/SSLException;

    const-string v1, "renegotiation unsupported"

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->RENEGOTIATION_UNSUPPORTED:Ljavax/net/ssl/SSLException;

    .line 52
    new-instance v0, Ljavax/net/ssl/SSLException;

    const-string v1, "encrypted packet oversized"

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ENCRYPTED_PACKET_OVERSIZED:Ljavax/net/ssl/SSLException;

    .line 55
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ENGINE_CLOSED:Ljavax/net/ssl/SSLException;

    sget-object v1, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STACK_TRACE:[Ljava/lang/StackTraceElement;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 56
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->RENEGOTIATION_UNSUPPORTED:Ljavax/net/ssl/SSLException;

    sget-object v1, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STACK_TRACE:[Ljava/lang/StackTraceElement;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 57
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ENCRYPTED_PACKET_OVERSIZED:Ljavax/net/ssl/SSLException;

    sget-object v1, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STACK_TRACE:[Ljava/lang/StackTraceElement;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 67
    const-class v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    const-string v1, "destroyed"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->DESTROYED_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void

    :cond_0
    move v0, v1

    .line 43
    goto :goto_0
.end method

.method public constructor <init>(JLorg/jboss/netty/handler/ssl/SslBufferPool;Ljava/lang/String;)V
    .locals 3
    .param p1, "sslCtx"    # J
    .param p3, "bufPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p4, "fallbackApplicationProtocol"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-direct {p0}, Ljavax/net/ssl/SSLEngine;-><init>()V

    .line 104
    invoke-static {}, Lorg/jboss/netty/handler/ssl/OpenSsl;->ensureAvailability()V

    .line 105
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 106
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "sslContext"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    if-nez p3, :cond_1

    .line 109
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bufPool"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_1
    iput-object p3, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    .line 113
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lorg/apache/tomcat/jni/SSL;->newSSL(JZ)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    .line 114
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v0, v1}, Lorg/apache/tomcat/jni/SSL;->makeNetworkBIO(J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    .line 115
    iput-object p4, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->fallbackApplicationProtocol:Ljava/lang/String;

    .line 116
    return-void
.end method

.method static synthetic access$000(Lorg/jboss/netty/handler/ssl/OpenSslEngine;)J
    .locals 2
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    .prologue
    .line 43
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    return-wide v0
.end method

.method static synthetic access$100()[Ljava/security/cert/Certificate;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->EMPTY_CERTIFICATES:[Ljava/security/cert/Certificate;

    return-object v0
.end method

.method static synthetic access$200()[Ljavax/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->EMPTY_X509_CERTIFICATES:[Ljavax/security/cert/X509Certificate;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jboss/netty/handler/ssl/OpenSslEngine;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->cipher:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jboss/netty/handler/ssl/OpenSslEngine;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->applicationProtocol:Ljava/lang/String;

    return-object v0
.end method

.method private declared-synchronized beginHandshakeImplicitly()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 732
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    if-eqz v0, :cond_0

    .line 733
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ENGINE_CLOSED:Ljavax/net/ssl/SSLException;

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 732
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 736
    :cond_0
    :try_start_1
    iget v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    if-nez v0, :cond_1

    .line 737
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v0, v1}, Lorg/apache/tomcat/jni/SSL;->doHandshake(J)I

    .line 738
    const/4 v0, 0x1

    iput v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 740
    :cond_1
    monitor-exit p0

    return-void
.end method

.method private getEngineStatus()Ljavax/net/ssl/SSLEngineResult$Status;
    .locals 1

    .prologue
    .line 743
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    if-eqz v0, :cond_0

    sget-object v0, Ljavax/net/ssl/SSLEngineResult$Status;->CLOSED:Ljavax/net/ssl/SSLEngineResult$Status;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljavax/net/ssl/SSLEngineResult$Status;->OK:Ljavax/net/ssl/SSLEngineResult$Status;

    goto :goto_0
.end method

.method private readEncryptedData(Ljava/nio/ByteBuffer;I)I
    .locals 10
    .param p1, "dst"    # Ljava/nio/ByteBuffer;
    .param p2, "pending"    # I

    .prologue
    .line 254
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-lt v5, p2, :cond_0

    .line 255
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    .line 256
    .local v4, "pos":I
    invoke-static {p1}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    int-to-long v8, v4

    add-long v0, v6, v8

    .line 257
    .local v0, "addr":J
    iget-wide v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v6, v7, v0, v1, p2}, Lorg/apache/tomcat/jni/SSL;->readFromBIO(JJI)I

    move-result v2

    .line 258
    .local v2, "bioRead":I
    if-lez v2, :cond_4

    .line 259
    add-int v5, v4, v2

    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move v5, v2

    .line 281
    .end local v4    # "pos":I
    :goto_0
    return v5

    .line 263
    .end local v0    # "addr":J
    .end local v2    # "bioRead":I
    :cond_0
    iget-object v5, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v5}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->acquireBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 265
    .local v3, "buf":Ljava/nio/ByteBuffer;
    :try_start_0
    sget-boolean v5, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    if-nez v5, :cond_1

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v5

    if-nez v5, :cond_1

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    :catchall_0
    move-exception v5

    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v6, v3}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    throw v5

    .line 266
    :cond_1
    :try_start_1
    invoke-static {v3}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .line 268
    .restart local v0    # "addr":J
    sget-boolean v5, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    if-nez v5, :cond_2

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    if-ge v5, p2, :cond_2

    new-instance v5, Ljava/lang/AssertionError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "network BIO read overflow (pending: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", capacity: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 270
    :cond_2
    iget-wide v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v6, v7, v0, v1, p2}, Lorg/apache/tomcat/jni/SSL;->readFromBIO(JJI)I

    move-result v2

    .line 271
    .restart local v2    # "bioRead":I
    if-lez v2, :cond_3

    .line 272
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 273
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 277
    iget-object v5, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v5, v3}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    move v5, v2

    .line 274
    goto :goto_0

    .line 277
    :cond_3
    iget-object v5, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v5, v3}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 281
    .end local v3    # "buf":Ljava/nio/ByteBuffer;
    :cond_4
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private readPlaintextData(Ljava/nio/ByteBuffer;)I
    .locals 10
    .param p1, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 220
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 221
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    .line 222
    .local v4, "pos":I
    invoke-static {p1}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    int-to-long v8, v4

    add-long v0, v6, v8

    .line 223
    .local v0, "addr":J
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    sub-int v3, v6, v4

    .line 224
    .local v3, "len":I
    iget-wide v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v6, v7, v0, v1, v3}, Lorg/apache/tomcat/jni/SSL;->readFromSSL(JJI)I

    move-result v5

    .line 225
    .local v5, "sslRead":I
    if-lez v5, :cond_3

    .line 226
    add-int v6, v4, v5

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move v6, v5

    .line 247
    .end local v4    # "pos":I
    :goto_0
    return v6

    .line 230
    .end local v0    # "addr":J
    .end local v3    # "len":I
    .end local v5    # "sslRead":I
    :cond_0
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v6}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->acquireBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 232
    .local v2, "buf":Ljava/nio/ByteBuffer;
    :try_start_0
    sget-boolean v6, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    if-nez v6, :cond_1

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v6

    if-nez v6, :cond_1

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v7, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    throw v6

    .line 233
    :cond_1
    :try_start_1
    invoke-static {v2}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .line 234
    .restart local v0    # "addr":J
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v6

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 235
    .restart local v3    # "len":I
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 236
    iget-wide v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v6, v7, v0, v1, v3}, Lorg/apache/tomcat/jni/SSL;->readFromSSL(JJI)I

    move-result v5

    .line 237
    .restart local v5    # "sslRead":I
    if-lez v5, :cond_2

    .line 238
    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 239
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 243
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v6, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    move v6, v5

    .line 240
    goto :goto_0

    .line 243
    :cond_2
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v6, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 247
    .end local v2    # "buf":Ljava/nio/ByteBuffer;
    :cond_3
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private writeEncryptedData(Ljava/nio/ByteBuffer;)I
    .locals 12
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v6, 0x0

    .line 181
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    .line 182
    .local v5, "pos":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 183
    .local v3, "len":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 184
    invoke-static {p1}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    int-to-long v10, v5

    add-long v0, v8, v10

    .line 185
    .local v0, "addr":J
    iget-wide v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v8, v9, v0, v1, v3}, Lorg/apache/tomcat/jni/SSL;->writeToBIO(JJI)I

    move-result v4

    .line 186
    .local v4, "netWrote":I
    if-ltz v4, :cond_4

    .line 187
    add-int v7, v5, v4

    invoke-virtual {p1, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 188
    iget-wide v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v8, v9, v0, v1, v6}, Lorg/apache/tomcat/jni/SSL;->readFromSSL(JJI)I

    move-result v6

    iput v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->lastPrimingReadResult:I

    .line 213
    .end local v4    # "netWrote":I
    :goto_0
    return v4

    .line 192
    .end local v0    # "addr":J
    :cond_0
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v7}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->acquireBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 194
    .local v2, "buf":Ljava/nio/ByteBuffer;
    :try_start_0
    sget-boolean v7, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    if-nez v7, :cond_1

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v7

    if-nez v7, :cond_1

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v7, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    throw v6

    .line 195
    :cond_1
    :try_start_1
    sget-boolean v7, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    if-nez v7, :cond_2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v7

    if-le v3, v7, :cond_2

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 196
    :cond_2
    invoke-static {v2}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .line 198
    .restart local v0    # "addr":J
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 200
    iget-wide v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v8, v9, v0, v1, v3}, Lorg/apache/tomcat/jni/SSL;->writeToBIO(JJI)I

    move-result v4

    .line 201
    .restart local v4    # "netWrote":I
    if-ltz v4, :cond_3

    .line 202
    add-int v6, v5, v4

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 203
    iget-wide v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    const/4 v8, 0x0

    invoke-static {v6, v7, v0, v1, v8}, Lorg/apache/tomcat/jni/SSL;->readFromSSL(JJI)I

    move-result v6

    iput v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->lastPrimingReadResult:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 209
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v6, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 206
    :cond_3
    :try_start_2
    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 209
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v7, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .end local v2    # "buf":Ljava/nio/ByteBuffer;
    :cond_4
    move v4, v6

    .line 213
    goto :goto_0
.end method

.method private writePlaintextData(Ljava/nio/ByteBuffer;)I
    .locals 12
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 138
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    .line 139
    .local v5, "pos":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    .line 140
    .local v4, "limit":I
    sub-int v8, v4, v5

    const/16 v9, 0x4000

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 143
    .local v3, "len":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 144
    invoke-static {p1}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    int-to-long v10, v5

    add-long v0, v8, v10

    .line 145
    .local v0, "addr":J
    iget-wide v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v8, v9, v0, v1, v3}, Lorg/apache/tomcat/jni/SSL;->writeToSSL(JJI)I

    move-result v6

    .line 146
    .local v6, "sslWrote":I
    if-lez v6, :cond_4

    .line 147
    add-int v8, v5, v6

    invoke-virtual {p1, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move v7, v6

    .line 165
    .end local v6    # "sslWrote":I
    .local v7, "sslWrote":I
    :goto_0
    return v7

    .line 151
    .end local v0    # "addr":J
    .end local v7    # "sslWrote":I
    :cond_0
    iget-object v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v8}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->acquireBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 153
    .local v2, "buf":Ljava/nio/ByteBuffer;
    :try_start_0
    sget-boolean v8, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    if-nez v8, :cond_1

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v8

    if-nez v8, :cond_1

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    :catchall_0
    move-exception v8

    iget-object v9, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v9, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    throw v8

    .line 154
    :cond_1
    :try_start_1
    sget-boolean v8, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->$assertionsDisabled:Z

    if-nez v8, :cond_2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v8

    if-le v3, v8, :cond_2

    new-instance v8, Ljava/lang/AssertionError;

    const-string v9, "buffer pool write overflow"

    invoke-direct {v8, v9}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v8

    .line 155
    :cond_2
    invoke-static {v2}, Lorg/apache/tomcat/jni/Buffer;->address(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .line 157
    .restart local v0    # "addr":J
    add-int v8, v5, v3

    invoke-virtual {p1, v8}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 159
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 160
    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 162
    iget-wide v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v8, v9, v0, v1, v3}, Lorg/apache/tomcat/jni/SSL;->writeToSSL(JJI)I

    move-result v6

    .line 163
    .restart local v6    # "sslWrote":I
    if-lez v6, :cond_3

    .line 164
    add-int v8, v5, v6

    invoke-virtual {p1, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    iget-object v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v8, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    move v7, v6

    .line 165
    .end local v6    # "sslWrote":I
    .restart local v7    # "sslWrote":I
    goto :goto_0

    .line 167
    .end local v7    # "sslWrote":I
    .restart local v6    # "sslWrote":I
    :cond_3
    :try_start_2
    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 170
    iget-object v8, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->bufPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v8, v2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 174
    .end local v2    # "buf":Ljava/nio/ByteBuffer;
    :cond_4
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SSL.writeToSSL() returned a non-positive value: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8
.end method


# virtual methods
.method public declared-synchronized beginHandshake()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 706
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    if-eqz v0, :cond_0

    .line 707
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ENGINE_CLOSED:Ljavax/net/ssl/SSLException;

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 706
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 710
    :cond_0
    :try_start_1
    iget v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    packed-switch v0, :pswitch_data_0

    .line 727
    new-instance v0, Ljava/lang/Error;

    invoke-direct {v0}, Ljava/lang/Error;-><init>()V

    throw v0

    .line 712
    :pswitch_0
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v0, v1}, Lorg/apache/tomcat/jni/SSL;->doHandshake(J)I

    .line 713
    const/4 v0, 0x2

    iput v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 729
    :goto_0
    monitor-exit p0

    return-void

    .line 722
    :pswitch_1
    const/4 v0, 0x2

    :try_start_2
    iput v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    goto :goto_0

    .line 725
    :pswitch_2
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->RENEGOTIATION_UNSUPPORTED:Ljavax/net/ssl/SSLException;

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 710
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public declared-synchronized closeInbound()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 529
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isInboundDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    .line 545
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 533
    :cond_1
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isInboundDone:Z

    .line 534
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    .line 536
    iget v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    if-eqz v0, :cond_2

    .line 537
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->receivedShutdown:Z

    if-nez v0, :cond_0

    .line 538
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->shutdown()V

    .line 539
    new-instance v0, Ljavax/net/ssl/SSLException;

    const-string v1, "close_notify has not been received"

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 529
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 543
    :cond_2
    :try_start_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->shutdown()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized closeOutbound()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 554
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isOutboundDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 570
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 558
    :cond_1
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isOutboundDone:Z

    .line 559
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    .line 561
    iget v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    if-eqz v1, :cond_2

    iget v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->destroyed:I

    if-nez v1, :cond_2

    .line 562
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSL;->getShutdown(J)I

    move-result v0

    .line 563
    .local v0, "mode":I
    and-int/lit8 v1, v0, 0x1

    if-eq v1, v4, :cond_0

    .line 564
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSL;->shutdownSSL(J)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 554
    .end local v0    # "mode":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 568
    :cond_2
    :try_start_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->shutdown()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getDelegatedTask()Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 524
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEnableSessionCreation()Z
    .locals 1

    .prologue
    .line 840
    const/4 v0, 0x0

    return v0
.end method

.method public getEnabledCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 584
    sget-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STRINGS:[Ljava/lang/String;

    return-object v0
.end method

.method public getEnabledProtocols()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 599
    sget-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STRINGS:[Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .locals 4

    .prologue
    .line 748
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    if-eqz v1, :cond_0

    iget v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->destroyed:I

    if-eqz v1, :cond_1

    .line 749
    :cond_0
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NOT_HANDSHAKING:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 792
    :goto_0
    monitor-exit p0

    return-object v1

    .line 753
    :cond_1
    :try_start_1
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->handshakeFinished:Z

    if-nez v1, :cond_6

    .line 755
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSL;->pendingWrittenBytesInBIO(J)I

    move-result v1

    if-eqz v1, :cond_2

    .line 756
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_WRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    goto :goto_0

    .line 761
    :cond_2
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSL;->isInInit(J)I

    move-result v1

    if-nez v1, :cond_5

    .line 762
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->handshakeFinished:Z

    .line 763
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSL;->getCipherForSSL(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->cipher:Ljava/lang/String;

    .line 764
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSL;->getNextProtoNegotiated(J)Ljava/lang/String;

    move-result-object v0

    .line 765
    .local v0, "applicationProtocol":Ljava/lang/String;
    if-nez v0, :cond_3

    .line 766
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->fallbackApplicationProtocol:Ljava/lang/String;

    .line 768
    :cond_3
    if-eqz v0, :cond_4

    .line 769
    const/16 v1, 0x3a

    const/16 v2, 0x5f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->applicationProtocol:Ljava/lang/String;

    .line 773
    :goto_1
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->FINISHED:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    goto :goto_0

    .line 771
    :cond_4
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->applicationProtocol:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 748
    .end local v0    # "applicationProtocol":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 778
    :cond_5
    :try_start_2
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_UNWRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    goto :goto_0

    .line 782
    :cond_6
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    if-eqz v1, :cond_8

    .line 784
    iget-wide v2, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v2, v3}, Lorg/apache/tomcat/jni/SSL;->pendingWrittenBytesInBIO(J)I

    move-result v1

    if-eqz v1, :cond_7

    .line 785
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_WRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    goto :goto_0

    .line 789
    :cond_7
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_UNWRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    goto :goto_0

    .line 792
    :cond_8
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NOT_HANDSHAKING:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getNeedClientAuth()Z
    .locals 1

    .prologue
    .line 816
    const/4 v0, 0x0

    return v0
.end method

.method public getSession()Ljavax/net/ssl/SSLSession;
    .locals 1

    .prologue
    .line 609
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->session:Ljavax/net/ssl/SSLSession;

    .line 610
    .local v0, "session":Ljavax/net/ssl/SSLSession;
    if-nez v0, :cond_0

    .line 611
    new-instance v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine$1;

    .end local v0    # "session":Ljavax/net/ssl/SSLSession;
    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine$1;-><init>(Lorg/jboss/netty/handler/ssl/OpenSslEngine;)V

    .restart local v0    # "session":Ljavax/net/ssl/SSLSession;
    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->session:Ljavax/net/ssl/SSLSession;

    .line 701
    :cond_0
    return-object v0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 579
    sget-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STRINGS:[Ljava/lang/String;

    return-object v0
.end method

.method public getSupportedProtocols()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 594
    sget-object v0, Lorg/jboss/netty/util/internal/EmptyArrays;->EMPTY_STRINGS:[Ljava/lang/String;

    return-object v0
.end method

.method public getUseClientMode()Z
    .locals 1

    .prologue
    .line 804
    const/4 v0, 0x0

    return v0
.end method

.method public getWantClientAuth()Z
    .locals 1

    .prologue
    .line 828
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized isInboundDone()Z
    .locals 1

    .prologue
    .line 549
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isInboundDone:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isOutboundDone()Z
    .locals 1

    .prologue
    .line 574
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isOutboundDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setEnableSessionCreation(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 833
    if-eqz p1, :cond_0

    .line 834
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 836
    :cond_0
    return-void
.end method

.method public setEnabledCipherSuites([Ljava/lang/String;)V
    .locals 1
    .param p1, "strings"    # [Ljava/lang/String;

    .prologue
    .line 589
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setEnabledProtocols([Ljava/lang/String;)V
    .locals 1
    .param p1, "strings"    # [Ljava/lang/String;

    .prologue
    .line 604
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setNeedClientAuth(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 809
    if-eqz p1, :cond_0

    .line 810
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 812
    :cond_0
    return-void
.end method

.method public setUseClientMode(Z)V
    .locals 1
    .param p1, "clientMode"    # Z

    .prologue
    .line 797
    if-eqz p1, :cond_0

    .line 798
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 800
    :cond_0
    return-void
.end method

.method public setWantClientAuth(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 821
    if-eqz p1, :cond_0

    .line 822
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 824
    :cond_0
    return-void
.end method

.method public declared-synchronized shutdown()V
    .locals 3

    .prologue
    .line 122
    monitor-enter p0

    :try_start_0
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->DESTROYED_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v0, v1}, Lorg/apache/tomcat/jni/SSL;->freeSSL(J)V

    .line 124
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v0, v1}, Lorg/apache/tomcat/jni/SSL;->freeBIO(J)V

    .line 125
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    iput-wide v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isOutboundDone:Z

    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isInboundDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    :cond_0
    monitor-exit p0

    return-void

    .line 122
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unwrap(Ljava/nio/ByteBuffer;[Ljava/nio/ByteBuffer;II)Ljavax/net/ssl/SSLEngineResult;
    .locals 19
    .param p1, "src"    # Ljava/nio/ByteBuffer;
    .param p2, "dsts"    # [Ljava/nio/ByteBuffer;
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 394
    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->destroyed:I

    if-eqz v14, :cond_0

    .line 395
    new-instance v14, Ljavax/net/ssl/SSLEngineResult;

    sget-object v15, Ljavax/net/ssl/SSLEngineResult$Status;->CLOSED:Ljavax/net/ssl/SSLEngineResult$Status;

    sget-object v16, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NOT_HANDSHAKING:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v14 .. v18}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 516
    :goto_0
    monitor-exit p0

    return-object v14

    .line 399
    :cond_0
    if-nez p1, :cond_1

    .line 400
    :try_start_1
    new-instance v14, Ljava/lang/NullPointerException;

    const-string v15, "src"

    invoke-direct {v14, v15}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 394
    :catchall_0
    move-exception v14

    monitor-exit p0

    throw v14

    .line 402
    :cond_1
    if-nez p2, :cond_2

    .line 403
    :try_start_2
    new-instance v14, Ljava/lang/NullPointerException;

    const-string v15, "dsts"

    invoke-direct {v14, v15}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 405
    :cond_2
    move-object/from16 v0, p2

    array-length v14, v0

    move/from16 v0, p3

    if-ge v0, v14, :cond_3

    add-int v14, p3, p4

    move-object/from16 v0, p2

    array-length v15, v0

    if-le v14, v15, :cond_4

    .line 406
    :cond_3
    new-instance v14, Ljava/lang/IndexOutOfBoundsException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "offset: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p3

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ", length: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p4

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " (expected: offset <= offset + length <= dsts.length ("

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "))"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 411
    :cond_4
    const/4 v5, 0x0

    .line 412
    .local v5, "capacity":I
    add-int v8, p3, p4

    .line 413
    .local v8, "endOffset":I
    move/from16 v11, p3

    .local v11, "i":I
    :goto_1
    if-ge v11, v8, :cond_7

    .line 414
    aget-object v6, p2, v11

    .line 415
    .local v6, "dst":Ljava/nio/ByteBuffer;
    if-nez v6, :cond_5

    .line 416
    new-instance v14, Ljava/lang/IllegalArgumentException;

    invoke-direct {v14}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v14

    .line 418
    :cond_5
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->isReadOnly()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 419
    new-instance v14, Ljava/nio/ReadOnlyBufferException;

    invoke-direct {v14}, Ljava/nio/ReadOnlyBufferException;-><init>()V

    throw v14

    .line 421
    :cond_6
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v14

    add-int/2addr v5, v14

    .line 413
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 425
    .end local v6    # "dst":Ljava/nio/ByteBuffer;
    :cond_7
    move-object/from16 v0, p0

    iget v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    if-nez v14, :cond_8

    .line 426
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->beginHandshakeImplicitly()V

    .line 431
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v10

    .line 432
    .local v10, "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->handshakeFinished:Z

    if-eqz v14, :cond_9

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    if-eqz v14, :cond_a

    :cond_9
    sget-object v14, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_WRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-ne v10, v14, :cond_a

    .line 433
    new-instance v14, Ljavax/net/ssl/SSLEngineResult;

    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getEngineStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v15

    sget-object v16, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_WRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v14 .. v18}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V

    goto/16 :goto_0

    .line 437
    :cond_a
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v14

    const/16 v15, 0x4919

    if-le v14, v15, :cond_b

    .line 438
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isInboundDone:Z

    .line 439
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isOutboundDone:Z

    .line 440
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    .line 441
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->shutdown()V

    .line 442
    sget-object v14, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ENCRYPTED_PACKET_OVERSIZED:Ljavax/net/ssl/SSLException;

    throw v14

    .line 446
    :cond_b
    const/4 v2, 0x0

    .line 447
    .local v2, "bytesConsumed":I
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->lastPrimingReadResult:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 449
    :try_start_3
    invoke-direct/range {p0 .. p1}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->writeEncryptedData(Ljava/nio/ByteBuffer;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v14

    add-int/2addr v2, v14

    .line 455
    :try_start_4
    invoke-static {}, Lorg/apache/tomcat/jni/SSL;->getLastError()Ljava/lang/String;

    move-result-object v9

    .line 456
    .local v9, "error":Ljava/lang/String;
    if-eqz v9, :cond_d

    const-string v14, "error:00000000:"

    invoke-virtual {v9, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_d

    .line 457
    sget-object v14, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v14}, Lorg/jboss/netty/logging/InternalLogger;->isInfoEnabled()Z

    move-result v14

    if-eqz v14, :cond_c

    .line 458
    sget-object v14, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SSL_read failed: primingReadResult: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->lastPrimingReadResult:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "; OpenSSL error: \'"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x27

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/jboss/netty/logging/InternalLogger;->info(Ljava/lang/String;)V

    .line 464
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->shutdown()V

    .line 465
    new-instance v14, Ljavax/net/ssl/SSLException;

    invoke-direct {v14, v9}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 450
    .end local v9    # "error":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 451
    .local v7, "e":Ljava/lang/Exception;
    new-instance v14, Ljavax/net/ssl/SSLException;

    invoke-direct {v14, v7}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 469
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v9    # "error":Ljava/lang/String;
    :cond_d
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v14, v15}, Lorg/apache/tomcat/jni/SSL;->isInInit(J)I

    move-result v14

    if-nez v14, :cond_e

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v14, v15}, Lorg/apache/tomcat/jni/SSL;->pendingReadableBytesInSSL(J)I

    move-result v13

    .line 472
    .local v13, "pendingApp":I
    :goto_2
    if-ge v5, v13, :cond_f

    .line 473
    new-instance v14, Ljavax/net/ssl/SSLEngineResult;

    sget-object v15, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_OVERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v16

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v14, v15, v0, v2, v1}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V

    goto/16 :goto_0

    .line 469
    .end local v13    # "pendingApp":I
    :cond_e
    const/4 v13, 0x0

    goto :goto_2

    .line 477
    .restart local v13    # "pendingApp":I
    :cond_f
    const/4 v3, 0x0

    .line 478
    .local v3, "bytesProduced":I
    move/from16 v12, p3

    .line 479
    .local v12, "idx":I
    :cond_10
    :goto_3
    if-ge v12, v8, :cond_12

    .line 480
    aget-object v6, p2, v12

    .line 481
    .restart local v6    # "dst":Ljava/nio/ByteBuffer;
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v14

    if-nez v14, :cond_11

    .line 482
    add-int/lit8 v12, v12, 0x1

    .line 483
    goto :goto_3

    .line 486
    :cond_11
    if-gtz v13, :cond_14

    .line 510
    .end local v6    # "dst":Ljava/nio/ByteBuffer;
    :cond_12
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->receivedShutdown:Z

    if-nez v14, :cond_13

    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->ssl:J

    invoke-static {v14, v15}, Lorg/apache/tomcat/jni/SSL;->getShutdown(J)I

    move-result v14

    and-int/lit8 v14, v14, 0x2

    const/4 v15, 0x2

    if-ne v14, v15, :cond_13

    .line 511
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->receivedShutdown:Z

    .line 512
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->closeOutbound()V

    .line 513
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->closeInbound()V

    .line 516
    :cond_13
    new-instance v14, Ljavax/net/ssl/SSLEngineResult;

    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getEngineStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v15, v0, v2, v3}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 492
    .restart local v6    # "dst":Ljava/nio/ByteBuffer;
    :cond_14
    :try_start_5
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->readPlaintextData(Ljava/nio/ByteBuffer;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v4

    .line 497
    .local v4, "bytesRead":I
    if-eqz v4, :cond_12

    .line 501
    add-int/2addr v3, v4

    .line 502
    sub-int/2addr v13, v4

    .line 504
    :try_start_6
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v14

    if-nez v14, :cond_10

    .line 505
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 493
    .end local v4    # "bytesRead":I
    :catch_1
    move-exception v7

    .line 494
    .restart local v7    # "e":Ljava/lang/Exception;
    new-instance v14, Ljavax/net/ssl/SSLException;

    invoke-direct {v14, v7}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/Throwable;)V

    throw v14
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public declared-synchronized wrap([Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;
    .locals 15
    .param p1, "srcs"    # [Ljava/nio/ByteBuffer;
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "dst"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 289
    monitor-enter p0

    :try_start_0
    iget v10, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->destroyed:I

    if-eqz v10, :cond_0

    .line 290
    new-instance v10, Ljavax/net/ssl/SSLEngineResult;

    sget-object v11, Ljavax/net/ssl/SSLEngineResult$Status;->CLOSED:Ljavax/net/ssl/SSLEngineResult$Status;

    sget-object v12, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NOT_HANDSHAKING:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct {v10, v11, v12, v13, v14}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 386
    :goto_0
    monitor-exit p0

    return-object v10

    .line 294
    :cond_0
    if-nez p1, :cond_1

    .line 295
    :try_start_1
    new-instance v10, Ljava/lang/NullPointerException;

    const-string v11, "srcs"

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 289
    :catchall_0
    move-exception v10

    monitor-exit p0

    throw v10

    .line 297
    :cond_1
    if-nez p4, :cond_2

    .line 298
    :try_start_2
    new-instance v10, Ljava/lang/NullPointerException;

    const-string v11, "dst"

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 301
    :cond_2
    move-object/from16 v0, p1

    array-length v10, v0

    move/from16 v0, p2

    if-ge v0, v10, :cond_3

    add-int v10, p2, p3

    move-object/from16 v0, p1

    array-length v11, v0

    if-le v10, v11, :cond_4

    .line 302
    :cond_3
    new-instance v10, Ljava/lang/IndexOutOfBoundsException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "offset: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, p2

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", length: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " (expected: offset <= offset + length <= srcs.length ("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p1

    array-length v12, v0

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "))"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 307
    :cond_4
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->isReadOnly()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 308
    new-instance v10, Ljava/nio/ReadOnlyBufferException;

    invoke-direct {v10}, Ljava/nio/ReadOnlyBufferException;-><init>()V

    throw v10

    .line 312
    :cond_5
    iget v10, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->accepted:I

    if-nez v10, :cond_6

    .line 313
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->beginHandshakeImplicitly()V

    .line 318
    :cond_6
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v6

    .line 319
    .local v6, "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    iget-boolean v10, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->handshakeFinished:Z

    if-eqz v10, :cond_7

    iget-boolean v10, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->engineClosed:Z

    if-eqz v10, :cond_8

    :cond_7
    sget-object v10, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_UNWRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-ne v6, v10, :cond_8

    .line 320
    new-instance v10, Ljavax/net/ssl/SSLEngineResult;

    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getEngineStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v11

    sget-object v12, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NEED_UNWRAP:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct {v10, v11, v12, v13, v14}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V

    goto/16 :goto_0

    .line 323
    :cond_8
    const/4 v3, 0x0

    .line 327
    .local v3, "bytesProduced":I
    iget-wide v10, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v10, v11}, Lorg/apache/tomcat/jni/SSL;->pendingWrittenBytesInBIO(J)I

    move-result v8

    .line 328
    .local v8, "pendingNet":I
    if-lez v8, :cond_b

    .line 330
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 331
    .local v4, "capacity":I
    if-ge v4, v8, :cond_9

    .line 332
    new-instance v10, Ljavax/net/ssl/SSLEngineResult;

    sget-object v11, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_OVERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    const/4 v12, 0x0

    invoke-direct {v10, v11, v6, v12, v3}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 337
    :cond_9
    :try_start_3
    move-object/from16 v0, p4

    invoke-direct {p0, v0, v8}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->readEncryptedData(Ljava/nio/ByteBuffer;I)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v10

    add-int/2addr v3, v10

    .line 345
    :try_start_4
    iget-boolean v10, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->isOutboundDone:Z

    if-eqz v10, :cond_a

    .line 346
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->shutdown()V

    .line 349
    :cond_a
    new-instance v10, Ljavax/net/ssl/SSLEngineResult;

    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getEngineStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v11

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v12

    const/4 v13, 0x0

    invoke-direct {v10, v11, v12, v13, v3}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V

    goto/16 :goto_0

    .line 338
    :catch_0
    move-exception v5

    .line 339
    .local v5, "e":Ljava/lang/Exception;
    new-instance v10, Ljavax/net/ssl/SSLException;

    invoke-direct {v10, v5}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 353
    .end local v4    # "capacity":I
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_b
    const/4 v2, 0x0

    .line 354
    .local v2, "bytesConsumed":I
    move/from16 v7, p2

    .local v7, "i":I
    :goto_1
    move/from16 v0, p3

    if-ge v7, v0, :cond_f

    .line 355
    aget-object v9, p1, v7

    .line 356
    .local v9, "src":Ljava/nio/ByteBuffer;
    :cond_c
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->hasRemaining()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v10

    if-eqz v10, :cond_e

    .line 360
    :try_start_5
    invoke-direct {p0, v9}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->writePlaintextData(Ljava/nio/ByteBuffer;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v10

    add-int/2addr v2, v10

    .line 366
    :try_start_6
    iget-wide v10, p0, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->networkBIO:J

    invoke-static {v10, v11}, Lorg/apache/tomcat/jni/SSL;->pendingWrittenBytesInBIO(J)I

    move-result v8

    .line 367
    if-lez v8, :cond_c

    .line 369
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 370
    .restart local v4    # "capacity":I
    if-ge v4, v8, :cond_d

    .line 371
    new-instance v10, Ljavax/net/ssl/SSLEngineResult;

    sget-object v11, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_OVERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v12

    invoke-direct {v10, v11, v12, v2, v3}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V

    goto/16 :goto_0

    .line 361
    .end local v4    # "capacity":I
    :catch_1
    move-exception v5

    .line 362
    .restart local v5    # "e":Ljava/lang/Exception;
    new-instance v10, Ljavax/net/ssl/SSLException;

    invoke-direct {v10, v5}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/Throwable;)V

    throw v10
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 376
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v4    # "capacity":I
    :cond_d
    :try_start_7
    move-object/from16 v0, p4

    invoke-direct {p0, v0, v8}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->readEncryptedData(Ljava/nio/ByteBuffer;I)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v10

    add-int/2addr v3, v10

    .line 381
    :try_start_8
    new-instance v10, Ljavax/net/ssl/SSLEngineResult;

    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getEngineStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v11

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v12

    invoke-direct {v10, v11, v12, v2, v3}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V

    goto/16 :goto_0

    .line 377
    :catch_2
    move-exception v5

    .line 378
    .restart local v5    # "e":Ljava/lang/Exception;
    new-instance v10, Ljavax/net/ssl/SSLException;

    invoke-direct {v10, v5}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 354
    .end local v4    # "capacity":I
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_e
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 386
    .end local v9    # "src":Ljava/nio/ByteBuffer;
    :cond_f
    new-instance v10, Ljavax/net/ssl/SSLEngineResult;

    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getEngineStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v11

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/OpenSslEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v12

    invoke-direct {v10, v11, v12, v2, v3}, Ljavax/net/ssl/SSLEngineResult;-><init>(Ljavax/net/ssl/SSLEngineResult$Status;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;II)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0
.end method
