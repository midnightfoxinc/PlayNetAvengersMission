.class public Lorg/jboss/netty/handler/ssl/SslHandler;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "SslHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/ssl/SslHandler$7;,
        Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;,
        Lorg/jboss/netty/handler/ssl/SslHandler$ClosingChannelFutureListener;,
        Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CLOSED_OUTBOUND_AND_CHANNEL_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lorg/jboss/netty/handler/ssl/SslHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static final EMPTY_BUFFER:Ljava/nio/ByteBuffer;

.field private static final IGNORABLE_CLASS_IN_STACK:Ljava/util/regex/Pattern;

.field private static final IGNORABLE_ERROR_MESSAGE:Ljava/util/regex/Pattern;

.field private static final SENT_CLOSE_NOTIFY_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lorg/jboss/netty/handler/ssl/SslHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static final SENT_FIRST_MESSAGE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lorg/jboss/netty/handler/ssl/SslHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static defaultBufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

.field private closeOnSslException:Z

.field private volatile closedOutboundAndChannel:I

.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private volatile enableRenegotiation:Z

.field private final engine:Ljavax/net/ssl/SSLEngine;

.field private volatile handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

.field final handshakeLock:Ljava/lang/Object;

.field private handshakeTimeout:Lorg/jboss/netty/util/Timeout;

.field private final handshakeTimeoutInMillis:J

.field private volatile handshaken:Z

.field private handshaking:Z

.field ignoreClosedChannelException:I

.field final ignoreClosedChannelExceptionLock:Ljava/lang/Object;

.field private volatile issueHandshake:Z

.field private packetLength:I

.field private final pendingEncryptedWrites:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

.field private final pendingUnencryptedWrites:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;",
            ">;"
        }
    .end annotation
.end field

.field private final pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

.field private volatile sentCloseNotify:I

.field private volatile sentFirstMessage:I

.field private final sslEngineCloseFuture:Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;

.field private final startTls:Z

.field private final timer:Lorg/jboss/netty/util/Timer;

.field private volatile writeBeforeHandshakeDone:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 181
    const-class v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/ssl/SslHandler;->$assertionsDisabled:Z

    .line 184
    const-class v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 186
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->EMPTY_BUFFER:Ljava/nio/ByteBuffer;

    .line 188
    const-string v0, "^.*(?:Socket|Datagram|Sctp|Udt)Channel.*$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->IGNORABLE_CLASS_IN_STACK:Ljava/util/regex/Pattern;

    .line 190
    const-string v0, "^.*(?:connection.*(?:reset|closed|abort|broken)|broken.*pipe).*$"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->IGNORABLE_ERROR_MESSAGE:Ljava/util/regex/Pattern;

    .line 225
    const-class v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    const-string v1, "sentFirstMessage"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->SENT_FIRST_MESSAGE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 227
    const-class v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    const-string v1, "sentCloseNotify"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->SENT_CLOSE_NOTIFY_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 229
    const-class v0, Lorg/jboss/netty/handler/ssl/SslHandler;

    const-string v1, "closedOutboundAndChannel"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->CLOSED_OUTBOUND_AND_CHANNEL_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void

    :cond_0
    move v0, v1

    .line 181
    goto :goto_0
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLEngine;)V
    .locals 8
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;

    .prologue
    .line 257
    invoke-static {}, Lorg/jboss/netty/handler/ssl/SslHandler;->getDefaultBufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/ssl/SslHandler;-><init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;ZLorg/jboss/netty/util/Timer;J)V

    .line 258
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;)V
    .locals 8
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "bufferPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;

    .prologue
    .line 268
    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/ssl/SslHandler;-><init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;ZLorg/jboss/netty/util/Timer;J)V

    .line 269
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;Z)V
    .locals 8
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "bufferPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p3, "startTls"    # Z

    .prologue
    .line 292
    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/ssl/SslHandler;-><init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;ZLorg/jboss/netty/util/Timer;J)V

    .line 293
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;ZLorg/jboss/netty/util/Timer;J)V
    .locals 3
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "bufferPool"    # Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .param p3, "startTls"    # Z
    .param p4, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p5, "handshakeTimeoutInMillis"    # J

    .prologue
    .line 314
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>()V

    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->enableRenegotiation:Z

    .line 213
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    .line 233
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ignoreClosedChannelExceptionLock:Ljava/lang/Object;

    .line 234
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    .line 235
    new-instance v0, Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    .line 236
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWrites:Ljava/util/Queue;

    .line 237
    new-instance v0, Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/NonReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    .line 241
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;

    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;-><init>(Lorg/jboss/netty/handler/ssl/SslHandler;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->sslEngineCloseFuture:Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;

    .line 315
    if-nez p1, :cond_0

    .line 316
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "engine"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_0
    if-nez p2, :cond_1

    .line 319
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bufferPool"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 321
    :cond_1
    if-nez p4, :cond_2

    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-lez v0, :cond_2

    .line 322
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No Timer was given but a handshakeTimeoutInMillis, need both or none"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 325
    :cond_2
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    .line 326
    iput-object p2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    .line 327
    iput-boolean p3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->startTls:Z

    .line 328
    iput-object p4, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->timer:Lorg/jboss/netty/util/Timer;

    .line 329
    iput-wide p5, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeoutInMillis:J

    .line 330
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLEngine;Z)V
    .locals 1
    .param p1, "engine"    # Ljavax/net/ssl/SSLEngine;
    .param p2, "startTls"    # Z

    .prologue
    .line 279
    invoke-static {}, Lorg/jboss/netty/handler/ssl/SslHandler;->getDefaultBufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/jboss/netty/handler/ssl/SslHandler;-><init>(Ljavax/net/ssl/SSLEngine;Lorg/jboss/netty/handler/ssl/SslBufferPool;Z)V

    .line 280
    return-void
.end method

.method static synthetic access$000(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    return-object v0
.end method

.method static synthetic access$100(Lorg/jboss/netty/handler/ssl/SslHandler;)J
    .locals 2
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;

    .prologue
    .line 181
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeoutInMillis:J

    return-wide v0
.end method

.method static synthetic access$200(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/Channel;Ljavax/net/ssl/SSLException;)V
    .locals 0
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;
    .param p1, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "x2"    # Ljavax/net/ssl/SSLException;

    .prologue
    .line 181
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeFailure(Lorg/jboss/netty/channel/Channel;Ljavax/net/ssl/SSLException;)V

    return-void
.end method

.method static synthetic access$300(Lorg/jboss/netty/handler/ssl/SslHandler;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;

    .prologue
    .line 181
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    return v0
.end method

.method static synthetic access$400(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/util/internal/NonReentrantLock;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jboss/netty/handler/ssl/SslHandler;)Ljava/util/Queue;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jboss/netty/handler/ssl/SslHandler;)Ljava/util/Queue;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWrites:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic access$700(Lorg/jboss/netty/handler/ssl/SslHandler;)Lorg/jboss/netty/channel/ChannelHandlerContext;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/ssl/SslHandler;

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    return-object v0
.end method

.method private cancelHandshakeTimeout()V
    .locals 1

    .prologue
    .line 562
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v0, :cond_0

    .line 564
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 566
    :cond_0
    return-void
.end method

.method private closeEngine()V
    .locals 3

    .prologue
    .line 589
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->closeOutbound()V

    .line 590
    iget v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->sentCloseNotify:I

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaken:Z

    if-eqz v1, :cond_0

    .line 592
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->closeInbound()V
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 599
    :cond_0
    :goto_0
    return-void

    .line 593
    :catch_0
    move-exception v0

    .line 594
    .local v0, "ex":Ljavax/net/ssl/SSLException;
    sget-object v1, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 595
    sget-object v1, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to clean up SSLEngine."

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private closeOutboundAndChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 6
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1460
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1461
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 1508
    :cond_0
    :goto_0
    return-void

    .line 1466
    :cond_1
    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler;->CLOSED_OUTBOUND_AND_CHANNEL_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v3, p0, v4, v5}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1470
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    new-instance v4, Lorg/jboss/netty/handler/ssl/SslHandler$4;

    invoke-direct {v4, p0, p1, p2}, Lorg/jboss/netty/handler/ssl/SslHandler$4;-><init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    invoke-interface {v3, v4}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0

    .line 1478
    :cond_2
    const/4 v2, 0x1

    .line 1481
    .local v2, "passthrough":Z
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {p0, v3, v4, v5}, Lorg/jboss/netty/handler/ssl/SslHandler;->unwrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Z)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1488
    :cond_3
    :goto_1
    :try_start_1
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->isOutboundDone()Z

    move-result v3

    if-nez v3, :cond_4

    .line 1489
    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler;->SENT_CLOSE_NOTIFY_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v3, p0, v4, v5}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1490
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->closeOutbound()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1492
    :try_start_2
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lorg/jboss/netty/handler/ssl/SslHandler;->wrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 1493
    .local v0, "closeNotifyFuture":Lorg/jboss/netty/channel/ChannelFuture;
    new-instance v3, Lorg/jboss/netty/handler/ssl/SslHandler$ClosingChannelFutureListener;

    invoke-direct {v3, p1, p2}, Lorg/jboss/netty/handler/ssl/SslHandler$ClosingChannelFutureListener;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    invoke-interface {v0, v3}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V
    :try_end_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1495
    const/4 v2, 0x0

    .line 1504
    .end local v0    # "closeNotifyFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_4
    :goto_2
    if-eqz v2, :cond_0

    .line 1505
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 1482
    :catch_0
    move-exception v1

    .line 1483
    .local v1, "ex":Ljavax/net/ssl/SSLException;
    :try_start_3
    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1484
    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v4, "Failed to unwrap before sending a close_notify message"

    invoke-interface {v3, v4, v1}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 1504
    .end local v1    # "ex":Ljavax/net/ssl/SSLException;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_5

    .line 1505
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 1504
    :cond_5
    throw v3

    .line 1496
    :catch_1
    move-exception v1

    .line 1497
    .restart local v1    # "ex":Ljavax/net/ssl/SSLException;
    :try_start_4
    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1498
    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v4, "Failed to encode a close_notify message"

    invoke-interface {v3, v4, v1}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2
.end method

.method private flushPendingEncryptedWrites(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 1055
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWrites:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1059
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/NonReentrantLock;->tryLock()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1074
    :cond_0
    return-void

    .line 1065
    :cond_1
    :goto_1
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWrites:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    .local v0, "e":Lorg/jboss/netty/channel/MessageEvent;
    if-eqz v0, :cond_2

    .line 1066
    invoke-interface {p1, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 1069
    .end local v0    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    throw v1

    .restart local v0    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    goto :goto_0
.end method

.method public static declared-synchronized getDefaultBufferPool()Lorg/jboss/netty/handler/ssl/SslBufferPool;
    .locals 2

    .prologue
    .line 200
    const-class v1, Lorg/jboss/netty/handler/ssl/SslHandler;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->defaultBufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    if-nez v0, :cond_0

    .line 201
    new-instance v0, Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-direct {v0}, Lorg/jboss/netty/handler/ssl/SslBufferPool;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->defaultBufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    .line 203
    :cond_0
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->defaultBufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static getEncryptedPacketLength(Lorg/jboss/netty/buffer/ChannelBuffer;I)I
    .locals 9
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "offset"    # I

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    .line 726
    const/4 v2, 0x0

    .line 730
    .local v2, "packetLength":I
    invoke-interface {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 739
    const/4 v4, 0x0

    .line 742
    .local v4, "tls":Z
    :goto_0
    if-eqz v4, :cond_0

    .line 744
    add-int/lit8 v7, p1, 0x1

    invoke-interface {p0, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v1

    .line 745
    .local v1, "majorVersion":I
    if-ne v1, v6, :cond_3

    .line 747
    add-int/lit8 v7, p1, 0x3

    invoke-static {p0, v7}, Lorg/jboss/netty/handler/ssl/SslHandler;->getShort(Lorg/jboss/netty/buffer/ChannelBuffer;I)S

    move-result v7

    const v8, 0xffff

    and-int/2addr v7, v8

    add-int/lit8 v2, v7, 0x5

    .line 748
    const/4 v7, 0x5

    if-gt v2, v7, :cond_0

    .line 750
    const/4 v4, 0x0

    .line 758
    .end local v1    # "majorVersion":I
    :cond_0
    :goto_1
    if-nez v4, :cond_7

    .line 760
    const/4 v3, 0x1

    .line 761
    .local v3, "sslv2":Z
    invoke-interface {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v7

    and-int/lit16 v7, v7, 0x80

    if-eqz v7, :cond_4

    move v0, v5

    .line 762
    .local v0, "headerLength":I
    :goto_2
    add-int v7, p1, v0

    add-int/lit8 v7, v7, 0x1

    invoke-interface {p0, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v1

    .line 763
    .restart local v1    # "majorVersion":I
    if-eq v1, v5, :cond_1

    if-ne v1, v6, :cond_6

    .line 765
    :cond_1
    if-ne v0, v5, :cond_5

    .line 766
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/ssl/SslHandler;->getShort(Lorg/jboss/netty/buffer/ChannelBuffer;I)S

    move-result v5

    and-int/lit16 v5, v5, 0x7fff

    add-int/lit8 v2, v5, 0x2

    .line 770
    :goto_3
    if-gt v2, v0, :cond_2

    .line 771
    const/4 v3, 0x0

    .line 777
    :cond_2
    :goto_4
    if-nez v3, :cond_7

    .line 778
    const/4 v5, -0x1

    .line 781
    .end local v0    # "headerLength":I
    .end local v1    # "majorVersion":I
    .end local v3    # "sslv2":Z
    :goto_5
    return v5

    .line 735
    .end local v4    # "tls":Z
    :pswitch_0
    const/4 v4, 0x1

    .line 736
    .restart local v4    # "tls":Z
    goto :goto_0

    .line 754
    .restart local v1    # "majorVersion":I
    :cond_3
    const/4 v4, 0x0

    goto :goto_1

    .end local v1    # "majorVersion":I
    .restart local v3    # "sslv2":Z
    :cond_4
    move v0, v6

    .line 761
    goto :goto_2

    .line 768
    .restart local v0    # "headerLength":I
    .restart local v1    # "majorVersion":I
    :cond_5
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/ssl/SslHandler;->getShort(Lorg/jboss/netty/buffer/ChannelBuffer;I)S

    move-result v5

    and-int/lit16 v5, v5, 0x3fff

    add-int/lit8 v2, v5, 0x3

    goto :goto_3

    .line 774
    :cond_6
    const/4 v3, 0x0

    goto :goto_4

    .end local v0    # "headerLength":I
    .end local v1    # "majorVersion":I
    .end local v3    # "sslv2":Z
    :cond_7
    move v5, v2

    .line 781
    goto :goto_5

    .line 730
    nop

    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static getShort(Lorg/jboss/netty/buffer/ChannelBuffer;I)S
    .locals 2
    .param p0, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "offset"    # I

    .prologue
    .line 882
    invoke-interface {p0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    invoke-interface {p0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method private handleRenegotiation(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V
    .locals 5
    .param p1, "handshakeStatus"    # Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    .prologue
    .line 1320
    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1321
    :try_start_0
    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->NOT_HANDSHAKING:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-eq p1, v1, :cond_0

    sget-object v1, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->FINISHED:Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    if-ne p1, v1, :cond_1

    .line 1324
    :cond_0
    monitor-exit v2

    .line 1368
    :goto_0
    return-void

    .line 1327
    :cond_1
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaken:Z

    if-nez v1, :cond_2

    .line 1329
    monitor-exit v2

    goto :goto_0

    .line 1367
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1333
    :cond_2
    :try_start_1
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    if-eqz v1, :cond_3

    .line 1336
    monitor-exit v2

    goto :goto_0

    .line 1339
    :cond_3
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->isInboundDone()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->isOutboundDone()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1341
    :cond_4
    monitor-exit v2

    goto :goto_0

    .line 1344
    :cond_5
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->isEnableRenegotiation()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1346
    const/4 v0, 0x1

    .line 1354
    .local v0, "renegotiate":Z
    :goto_1
    if-eqz v0, :cond_7

    .line 1356
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->handshake()Lorg/jboss/netty/channel/ChannelFuture;

    .line 1367
    :goto_2
    monitor-exit v2

    goto :goto_0

    .line 1349
    .end local v0    # "renegotiate":Z
    :cond_6
    const/4 v0, 0x0

    .line 1351
    .restart local v0    # "renegotiate":Z
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    goto :goto_1

    .line 1359
    :cond_7
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    new-instance v3, Ljavax/net/ssl/SSLException;

    const-string v4, "renegotiation attempted by peer; closing the connection"

    invoke-direct {v3, v4}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 1365
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-static {v3}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-static {v1, v3}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method

.method private ignoreException(Ljava/lang/Throwable;)Z
    .locals 12
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v9, 0x1

    .line 640
    instance-of v10, p1, Ljavax/net/ssl/SSLException;

    if-nez v10, :cond_4

    instance-of v10, p1, Ljava/io/IOException;

    if-eqz v10, :cond_4

    iget-object v10, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v10}, Ljavax/net/ssl/SSLEngine;->isOutboundDone()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 641
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 645
    .local v7, "message":Ljava/lang/String;
    sget-object v10, Lorg/jboss/netty/handler/ssl/SslHandler;->IGNORABLE_ERROR_MESSAGE:Ljava/util/regex/Pattern;

    invoke-virtual {v10, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->matches()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 693
    .end local v7    # "message":Ljava/lang/String;
    :cond_0
    :goto_0
    return v9

    .line 650
    .restart local v7    # "message":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    .line 651
    .local v4, "elements":[Ljava/lang/StackTraceElement;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1
    if-ge v5, v6, :cond_4

    aget-object v3, v0, v5

    .line 652
    .local v3, "element":Ljava/lang/StackTraceElement;
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 653
    .local v1, "classname":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v8

    .line 656
    .local v8, "methodname":Ljava/lang/String;
    const-string v10, "org.jboss.netty."

    invoke-virtual {v1, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 651
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 661
    :cond_3
    const-string v10, "read"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 667
    sget-object v10, Lorg/jboss/netty/handler/ssl/SslHandler;->IGNORABLE_CLASS_IN_STACK:Ljava/util/regex/Pattern;

    invoke-virtual {v10, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->matches()Z

    move-result v10

    if-nez v10, :cond_0

    .line 675
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 677
    .local v2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v10, Ljava/nio/channels/SocketChannel;

    invoke-virtual {v10, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-nez v10, :cond_0

    const-class v10, Ljava/nio/channels/DatagramChannel;

    invoke-virtual {v10, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 683
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v10

    const/4 v11, 0x7

    if-lt v10, v11, :cond_2

    const-string v10, "com.sun.nio.sctp.SctpChannel"

    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    if-eqz v10, :cond_2

    goto :goto_0

    .line 693
    .end local v0    # "arr$":[Ljava/lang/StackTraceElement;
    .end local v1    # "classname":Ljava/lang/String;
    .end local v2    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "element":Ljava/lang/StackTraceElement;
    .end local v4    # "elements":[Ljava/lang/StackTraceElement;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "message":Ljava/lang/String;
    .end local v8    # "methodname":Ljava/lang/String;
    :cond_4
    const/4 v9, 0x0

    goto :goto_0

    .line 687
    .restart local v0    # "arr$":[Ljava/lang/StackTraceElement;
    .restart local v1    # "classname":Ljava/lang/String;
    .restart local v3    # "element":Ljava/lang/StackTraceElement;
    .restart local v4    # "elements":[Ljava/lang/StackTraceElement;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    .restart local v7    # "message":Ljava/lang/String;
    .restart local v8    # "methodname":Ljava/lang/String;
    :catch_0
    move-exception v10

    goto :goto_2
.end method

.method public static isEncrypted(Lorg/jboss/netty/buffer/ChannelBuffer;)Z
    .locals 2
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 709
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->getEncryptedPacketLength(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private offerEncryptedWriteRequest(Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 3
    .param p1, "encryptedWrite"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 1044
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/NonReentrantLock;->tryLock()Z

    move-result v0

    .line 1046
    .local v0, "locked":Z
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWrites:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1048
    if-eqz v0, :cond_0

    .line 1049
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v1}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 1052
    :cond_0
    return-void

    .line 1048
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 1049
    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 1048
    :cond_1
    throw v1
.end method

.method private runDelegatedTasks()V
    .locals 3

    .prologue
    .line 1376
    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1377
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->getDelegatedTask()Ljava/lang/Runnable;

    move-result-object v0

    .line 1378
    .local v0, "task":Ljava/lang/Runnable;
    monitor-exit v2

    .line 1380
    if-nez v0, :cond_0

    .line 1386
    return-void

    .line 1378
    .end local v0    # "task":Ljava/lang/Runnable;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1384
    .restart local v0    # "task":Ljava/lang/Runnable;
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method private setHandshakeFailure(Lorg/jboss/netty/channel/Channel;Ljavax/net/ssl/SSLException;)V
    .locals 4
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "cause"    # Ljavax/net/ssl/SSLException;

    .prologue
    .line 1422
    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1423
    :try_start_0
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    if-nez v1, :cond_1

    .line 1424
    monitor-exit v2

    .line 1456
    :cond_0
    :goto_0
    return-void

    .line 1426
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    .line 1427
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaken:Z

    .line 1429
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    if-nez v1, :cond_2

    .line 1430
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    .line 1434
    :cond_2
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->cancelHandshakeTimeout()V

    .line 1439
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->closeOutbound()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1442
    :try_start_1
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->closeInbound()V
    :try_end_1
    .catch Ljavax/net/ssl/SSLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1450
    :cond_3
    :goto_1
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1452
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v1, p2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 1453
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    if-eqz v1, :cond_0

    .line 1454
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_0

    .line 1443
    :catch_0
    move-exception v0

    .line 1444
    .local v0, "e":Ljavax/net/ssl/SSLException;
    :try_start_3
    sget-object v1, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1445
    sget-object v1, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v3, "SSLEngine.closeInbound() raised an exception after a handshake failure."

    invoke-interface {v1, v3, v0}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1450
    .end local v0    # "e":Ljavax/net/ssl/SSLException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private setHandshakeSuccess(Lorg/jboss/netty/channel/Channel;)V
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 1404
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1405
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    .line 1406
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaken:Z

    .line 1408
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    if-nez v0, :cond_0

    .line 1409
    invoke-static {p1}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    .line 1411
    :cond_0
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->cancelHandshakeTimeout()V

    .line 1412
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1414
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v0}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1415
    sget-object v0, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " HANDSHAKEN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    invoke-interface {v2}, Ljavax/net/ssl/SSLSession;->getCipherSuite()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 1418
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    .line 1419
    return-void

    .line 1412
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private setHandshakeSuccessIfStillHandshaking(Lorg/jboss/netty/channel/Channel;)Z
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 1396
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1397
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeSuccess(Lorg/jboss/netty/channel/Channel;)V

    .line 1398
    const/4 v0, 0x1

    .line 1400
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private unwrap(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/nio/ByteBuffer;IZ)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 18
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "nettyInNetBuf"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "nioInNetBuf"    # Ljava/nio/ByteBuffer;
    .param p5, "initialNettyOutAppBufCapacity"    # I
    .param p6, "mightNeedHandshake"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 1178
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    .line 1179
    .local v7, "nettyInNetBufStartOffset":I
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v9

    .line 1180
    .local v9, "nioInNetBufStartOffset":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v14}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->acquireBuffer()Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 1182
    .local v10, "nioOutAppBuf":Ljava/nio/ByteBuffer;
    const/4 v8, 0x0

    .line 1185
    .local v8, "nettyOutAppBuf":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v6, 0x0

    .line 1188
    .local v6, "needsWrap":Z
    :goto_0
    const/4 v5, 0x0

    .line 1189
    .local v5, "needsHandshake":Z
    if-eqz p6, :cond_1

    .line 1190
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v15
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1191
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaken:Z

    if-nez v14, :cond_0

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    if-nez v14, :cond_0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->getUseClientMode()Z

    move-result v14

    if-nez v14, :cond_0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->isInboundDone()Z

    move-result v14

    if-nez v14, :cond_0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->isOutboundDone()Z

    move-result v14

    if-nez v14, :cond_0

    .line 1194
    const/4 v5, 0x1

    .line 1196
    :cond_0
    monitor-exit v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 1199
    :cond_1
    if-eqz v5, :cond_2

    .line 1200
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->handshake()Lorg/jboss/netty/channel/ChannelFuture;

    .line 1203
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v15
    :try_end_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1209
    :goto_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v14}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v14

    invoke-interface {v14}, Ljavax/net/ssl/SSLSession;->getApplicationBufferSize()I

    move-result v12

    .line 1211
    .local v12, "outAppBufSize":I
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v14

    if-ge v14, v12, :cond_5

    .line 1214
    invoke-static {v12}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v11

    .line 1220
    .local v11, "outAppBuf":Ljava/nio/ByteBuffer;
    :goto_2
    :try_start_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    move-object/from16 v0, p4

    invoke-virtual {v14, v0, v11}, Ljavax/net/ssl/SSLEngine;->unwrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v13

    .line 1221
    .local v13, "result":Ljavax/net/ssl/SSLEngineResult;
    sget-object v14, Lorg/jboss/netty/handler/ssl/SslHandler$7;->$SwitchMap$javax$net$ssl$SSLEngineResult$Status:[I

    invoke-virtual {v13}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljavax/net/ssl/SSLEngineResult$Status;->ordinal()I

    move-result v16

    aget v14, v14, v16
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    packed-switch v14, :pswitch_data_0

    .line 1234
    :goto_3
    :try_start_5
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 1237
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v14

    add-int/2addr v14, v7

    sub-int/2addr v14, v9

    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1241
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 1242
    if-nez v8, :cond_3

    .line 1243
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v14

    invoke-interface {v14}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v14

    invoke-interface {v14}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v3

    .line 1244
    .local v3, "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    move/from16 v0, p5

    invoke-interface {v3, v0}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .line 1246
    .end local v3    # "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    :cond_3
    invoke-interface {v8, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Ljava/nio/ByteBuffer;)V

    .line 1248
    :cond_4
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1252
    invoke-virtual {v13}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v4

    .line 1253
    .local v4, "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/jboss/netty/handler/ssl/SslHandler;->handleRenegotiation(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V

    .line 1254
    sget-object v14, Lorg/jboss/netty/handler/ssl/SslHandler$7;->$SwitchMap$javax$net$ssl$SSLEngineResult$HandshakeStatus:[I

    invoke-virtual {v4}, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->ordinal()I

    move-result v16

    aget v14, v14, v16

    packed-switch v14, :pswitch_data_1

    .line 1281
    new-instance v14, Ljava/lang/IllegalStateException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unknown handshake status: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v14, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1289
    .end local v4    # "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .end local v11    # "outAppBuf":Ljava/nio/ByteBuffer;
    .end local v12    # "outAppBufSize":I
    .end local v13    # "result":Ljavax/net/ssl/SSLEngineResult;
    :catchall_0
    move-exception v14

    monitor-exit v15
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v14
    :try_end_6
    .catch Ljavax/net/ssl/SSLException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 1305
    :catch_0
    move-exception v2

    .line 1306
    .local v2, "e":Ljavax/net/ssl/SSLException;
    :try_start_7
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeFailure(Lorg/jboss/netty/channel/Channel;Ljavax/net/ssl/SSLException;)V

    .line 1307
    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 1309
    .end local v2    # "e":Ljavax/net/ssl/SSLException;
    :catchall_1
    move-exception v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v15, v10}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    throw v14

    .line 1196
    :catchall_2
    move-exception v14

    :try_start_8
    monitor-exit v15
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    throw v14
    :try_end_9
    .catch Ljavax/net/ssl/SSLException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 1216
    .restart local v12    # "outAppBufSize":I
    :cond_5
    move-object v11, v10

    .restart local v11    # "outAppBuf":Ljava/nio/ByteBuffer;
    goto/16 :goto_2

    .line 1224
    .restart local v13    # "result":Ljavax/net/ssl/SSLEngineResult;
    :pswitch_0
    :try_start_a
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->sslEngineCloseFuture:Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;

    invoke-virtual {v14}, Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;->setClosed()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto/16 :goto_3

    .line 1234
    .end local v13    # "result":Ljavax/net/ssl/SSLEngineResult;
    :catchall_3
    move-exception v14

    :try_start_b
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 1237
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v16

    add-int v16, v16, v7

    sub-int v16, v16, v9

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1241
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v16

    if-eqz v16, :cond_7

    .line 1242
    if-nez v8, :cond_6

    .line 1243
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v3

    .line 1244
    .restart local v3    # "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    move/from16 v0, p5

    invoke-interface {v3, v0}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .line 1246
    .end local v3    # "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    :cond_6
    invoke-interface {v8, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Ljava/nio/ByteBuffer;)V

    .line 1248
    :cond_7
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1234
    throw v14

    .line 1258
    .restart local v4    # "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .restart local v13    # "result":Ljavax/net/ssl/SSLEngineResult;
    :pswitch_1
    invoke-direct/range {p0 .. p2}, Lorg/jboss/netty/handler/ssl/SslHandler;->wrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 1285
    :cond_8
    :goto_4
    :pswitch_2
    invoke-virtual {v13}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v14

    sget-object v16, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_UNDERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    move-object/from16 v0, v16

    if-eq v14, v0, :cond_9

    invoke-virtual {v13}, Ljavax/net/ssl/SSLEngineResult;->bytesConsumed()I

    move-result v14

    if-nez v14, :cond_c

    invoke-virtual {v13}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I

    move-result v14

    if-nez v14, :cond_c

    .line 1287
    :cond_9
    monitor-exit v15
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 1292
    if-eqz v6, :cond_a

    .line 1301
    :try_start_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    invoke-static {v14}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_a

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v14}, Lorg/jboss/netty/util/internal/NonReentrantLock;->isHeldByCurrentThread()Z

    move-result v14

    if-nez v14, :cond_a

    .line 1302
    invoke-direct/range {p0 .. p2}, Lorg/jboss/netty/handler/ssl/SslHandler;->wrap(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)V
    :try_end_c
    .catch Ljavax/net/ssl/SSLException; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 1309
    :cond_a
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v14, v10}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 1312
    if-eqz v8, :cond_d

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v14

    if-eqz v14, :cond_d

    .line 1315
    .end local v8    # "nettyOutAppBuf":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_5
    return-object v8

    .line 1261
    .restart local v8    # "nettyOutAppBuf":Lorg/jboss/netty/buffer/ChannelBuffer;
    :pswitch_3
    :try_start_d
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->runDelegatedTasks()V

    goto :goto_4

    .line 1264
    :pswitch_4
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeSuccess(Lorg/jboss/netty/channel/Channel;)V

    .line 1265
    const/4 v6, 0x1

    .line 1266
    monitor-exit v15

    goto/16 :goto_0

    .line 1268
    :pswitch_5
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeSuccessIfStillHandshaking(Lorg/jboss/netty/channel/Channel;)Z

    move-result v14

    if-eqz v14, :cond_b

    .line 1269
    const/4 v6, 0x1

    .line 1270
    monitor-exit v15

    goto/16 :goto_0

    .line 1272
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->writeBeforeHandshakeDone:Z

    if-eqz v14, :cond_8

    .line 1276
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->writeBeforeHandshakeDone:Z

    .line 1277
    const/4 v6, 0x1

    goto :goto_4

    .line 1289
    :cond_c
    monitor-exit v15

    goto/16 :goto_0

    .line 1315
    :cond_d
    const/4 v8, 0x0

    goto :goto_5

    .line 1234
    .end local v4    # "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    :pswitch_6
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 1237
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v14

    add-int/2addr v14, v7

    sub-int/2addr v14, v9

    move-object/from16 v0, p3

    invoke-interface {v0, v14}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1241
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v14

    if-eqz v14, :cond_f

    .line 1242
    if-nez v8, :cond_e

    .line 1243
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v14

    invoke-interface {v14}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v14

    invoke-interface {v14}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v3

    .line 1244
    .restart local v3    # "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    move/from16 v0, p5

    invoke-interface {v3, v0}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .line 1246
    .end local v3    # "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    :cond_e
    invoke-interface {v8, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Ljava/nio/ByteBuffer;)V

    .line 1248
    :cond_f
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto/16 :goto_1

    .line 1221
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_6
    .end packed-switch

    .line 1254
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private unwrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Z)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "mightNeedHandshake"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 1167
    sget-object v3, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    sget-object v4, Lorg/jboss/netty/handler/ssl/SslHandler;->EMPTY_BUFFER:Ljava/nio/ByteBuffer;

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/jboss/netty/handler/ssl/SslHandler;->unwrap(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/nio/ByteBuffer;IZ)Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 1168
    return-void
.end method

.method private wrap(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)V
    .locals 23
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 887
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->acquireBuffer()Ljava/nio/ByteBuffer;

    move-result-object v14

    .line 888
    .local v14, "outNetBuf":Ljava/nio/ByteBuffer;
    const/16 v18, 0x1

    .line 889
    .local v18, "success":Z
    const/4 v12, 0x0

    .line 890
    .local v12, "offered":Z
    const/4 v11, 0x0

    .line 891
    .local v11, "needsUnwrap":Z
    const/4 v15, 0x0

    .line 899
    .local v15, "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :goto_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->lock()V
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 901
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    check-cast v0, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;

    move-object v15, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 902
    if-nez v15, :cond_4

    .line 994
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V
    :try_end_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1002
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 1004
    if-eqz v12, :cond_0

    .line 1005
    invoke-direct/range {p0 .. p1}, Lorg/jboss/netty/handler/ssl/SslHandler;->flushPendingEncryptedWrites(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 1008
    :cond_0
    if-nez v18, :cond_2

    .line 1009
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v19, "SSLEngine already closed"

    move-object/from16 v0, v19

    invoke-direct {v5, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1014
    .local v5, "cause":Ljava/lang/IllegalStateException;
    if-eqz v15, :cond_1

    .line 1015
    iget-object v0, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v5}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 1023
    :cond_1
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->lock()V

    .line 1025
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    check-cast v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    .line 1026
    .restart local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    if-nez v15, :cond_12

    .line 1030
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 1038
    .end local v5    # "cause":Ljava/lang/IllegalStateException;
    :cond_2
    if-eqz v11, :cond_3

    .line 1039
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, p2

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/ssl/SslHandler;->unwrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Z)V

    .line 1041
    :cond_3
    return-void

    .line 906
    :cond_4
    :try_start_4
    iget-object v13, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->outAppBuf:Ljava/nio/ByteBuffer;

    .line 907
    .local v13, "outAppBuf":Ljava/nio/ByteBuffer;
    if-nez v13, :cond_8

    .line 909
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 910
    new-instance v19, Lorg/jboss/netty/channel/DownstreamMessageEvent;

    iget-object v0, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    move-object/from16 v20, v0

    sget-object v21, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/Channel;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    move-object/from16 v4, v22

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/channel/DownstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/ssl/SslHandler;->offerEncryptedWriteRequest(Lorg/jboss/netty/channel/MessageEvent;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 915
    const/4 v12, 0x1

    .line 994
    :goto_3
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V
    :try_end_5
    .catch Ljavax/net/ssl/SSLException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 997
    .end local v13    # "outAppBuf":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v6

    .line 998
    .local v6, "e":Ljavax/net/ssl/SSLException;
    const/16 v18, 0x0

    .line 999
    :try_start_6
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v6}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeFailure(Lorg/jboss/netty/channel/Channel;Ljavax/net/ssl/SSLException;)V

    .line 1000
    throw v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1002
    .end local v6    # "e":Ljavax/net/ssl/SSLException;
    :catchall_0
    move-exception v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 1004
    if-eqz v12, :cond_5

    .line 1005
    invoke-direct/range {p0 .. p1}, Lorg/jboss/netty/handler/ssl/SslHandler;->flushPendingEncryptedWrites(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 1008
    :cond_5
    if-nez v18, :cond_7

    .line 1009
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v20, "SSLEngine already closed"

    move-object/from16 v0, v20

    invoke-direct {v5, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 1014
    .restart local v5    # "cause":Ljava/lang/IllegalStateException;
    if-eqz v15, :cond_6

    .line 1015
    iget-object v0, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v5}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 1023
    :cond_6
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/jboss/netty/util/internal/NonReentrantLock;->lock()V

    .line 1025
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    check-cast v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 1026
    .restart local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    if-nez v15, :cond_11

    .line 1030
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 1002
    .end local v5    # "cause":Ljava/lang/IllegalStateException;
    :cond_7
    throw v19

    .line 917
    .restart local v13    # "outAppBuf":Ljava/nio/ByteBuffer;
    :cond_8
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    move-object/from16 v20, v0

    monitor-enter v20
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 918
    const/16 v17, 0x0

    .line 920
    .local v17, "result":Ljavax/net/ssl/SSLEngineResult;
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v13, v14}, Ljavax/net/ssl/SSLEngine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    move-result-object v17

    .line 922
    :try_start_a
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v19

    if-nez v19, :cond_9

    .line 923
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 927
    :cond_9
    invoke-virtual/range {v17 .. v17}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I

    move-result v19

    if-lez v19, :cond_d

    .line 928
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 929
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v16

    .line 930
    .local v16, "remaining":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    .line 936
    .local v10, "msg":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v10, v14}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Ljava/nio/ByteBuffer;)V

    .line 937
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 940
    iget-object v0, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->outAppBuf:Ljava/nio/ByteBuffer;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v19

    if-eqz v19, :cond_c

    .line 943
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v8

    .line 948
    .local v8, "future":Lorg/jboss/netty/channel/ChannelFuture;
    :goto_5
    new-instance v7, Lorg/jboss/netty/channel/DownstreamMessageEvent;

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/Channel;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-direct {v7, v0, v8, v10, v1}, Lorg/jboss/netty/channel/DownstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 950
    .local v7, "encryptedWrite":Lorg/jboss/netty/channel/MessageEvent;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/jboss/netty/handler/ssl/SslHandler;->offerEncryptedWriteRequest(Lorg/jboss/netty/channel/MessageEvent;)V

    .line 951
    const/4 v12, 0x1

    .line 991
    .end local v7    # "encryptedWrite":Lorg/jboss/netty/channel/MessageEvent;
    .end local v8    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v10    # "msg":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v16    # "remaining":I
    :cond_a
    :goto_6
    monitor-exit v20

    goto/16 :goto_3

    :catchall_1
    move-exception v19

    monitor-exit v20
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :try_start_b
    throw v19
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 994
    .end local v13    # "outAppBuf":Ljava/nio/ByteBuffer;
    .end local v17    # "result":Ljavax/net/ssl/SSLEngineResult;
    :catchall_2
    move-exception v19

    :try_start_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    throw v19
    :try_end_c
    .catch Ljavax/net/ssl/SSLException; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 922
    .restart local v13    # "outAppBuf":Ljava/nio/ByteBuffer;
    .restart local v17    # "result":Ljavax/net/ssl/SSLEngineResult;
    :catchall_3
    move-exception v19

    :try_start_d
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v21

    if-nez v21, :cond_b

    .line 923
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 922
    :cond_b
    throw v19

    .line 945
    .restart local v10    # "msg":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v16    # "remaining":I
    :cond_c
    iget-object v8, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    .restart local v8    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    goto :goto_5

    .line 952
    .end local v8    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v10    # "msg":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v16    # "remaining":I
    :cond_d
    invoke-virtual/range {v17 .. v17}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v19

    sget-object v21, Ljavax/net/ssl/SSLEngineResult$Status;->CLOSED:Ljavax/net/ssl/SSLEngineResult$Status;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_e

    .line 955
    const/16 v18, 0x0

    .line 956
    monitor-exit v20
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 994
    :try_start_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V
    :try_end_e
    .catch Ljavax/net/ssl/SSLException; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    goto/16 :goto_1

    .line 958
    :cond_e
    :try_start_f
    invoke-virtual/range {v17 .. v17}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v9

    .line 959
    .local v9, "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/jboss/netty/handler/ssl/SslHandler;->handleRenegotiation(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V

    .line 960
    sget-object v19, Lorg/jboss/netty/handler/ssl/SslHandler$7;->$SwitchMap$javax$net$ssl$SSLEngineResult$HandshakeStatus:[I

    invoke-virtual {v9}, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->ordinal()I

    move-result v21

    aget v19, v19, v21

    packed-switch v19, :pswitch_data_0

    .line 986
    new-instance v19, Ljava/lang/IllegalStateException;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "Unknown handshake status: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 962
    :pswitch_0
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v19

    if-nez v19, :cond_a

    .line 965
    monitor-exit v20
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 994
    :try_start_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V
    :try_end_10
    .catch Ljavax/net/ssl/SSLException; {:try_start_10 .. :try_end_10} :catch_0
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    goto/16 :goto_1

    .line 968
    :pswitch_1
    const/4 v11, 0x1

    .line 969
    :try_start_11
    monitor-exit v20
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    .line 994
    :try_start_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V
    :try_end_12
    .catch Ljavax/net/ssl/SSLException; {:try_start_12 .. :try_end_12} :catch_0
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto/16 :goto_1

    .line 971
    :pswitch_2
    :try_start_13
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->runDelegatedTasks()V

    goto/16 :goto_6

    .line 974
    :pswitch_3
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeSuccess(Lorg/jboss/netty/channel/Channel;)V

    .line 975
    invoke-virtual/range {v17 .. v17}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v19

    sget-object v21, Ljavax/net/ssl/SSLEngineResult$Status;->CLOSED:Ljavax/net/ssl/SSLEngineResult$Status;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_f

    .line 976
    const/16 v18, 0x0

    .line 978
    :cond_f
    monitor-exit v20
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    .line 994
    :try_start_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V
    :try_end_14
    .catch Ljavax/net/ssl/SSLException; {:try_start_14 .. :try_end_14} :catch_0
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    goto/16 :goto_1

    .line 980
    :pswitch_4
    :try_start_15
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeSuccessIfStillHandshaking(Lorg/jboss/netty/channel/Channel;)Z

    .line 981
    invoke-virtual/range {v17 .. v17}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v19

    sget-object v21, Ljavax/net/ssl/SSLEngineResult$Status;->CLOSED:Ljavax/net/ssl/SSLEngineResult$Status;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_10

    .line 982
    const/16 v18, 0x0

    .line 984
    :cond_10
    monitor-exit v20
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_1

    .line 994
    :try_start_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V
    :try_end_16
    .catch Ljavax/net/ssl/SSLException; {:try_start_16 .. :try_end_16} :catch_0
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    goto/16 :goto_1

    .line 1030
    .end local v9    # "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .end local v13    # "outAppBuf":Ljava/nio/ByteBuffer;
    .end local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    .end local v17    # "result":Ljavax/net/ssl/SSLEngineResult;
    .restart local v5    # "cause":Ljava/lang/IllegalStateException;
    :catchall_4
    move-exception v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    throw v19

    .restart local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 1033
    iget-object v0, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v5}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_4

    .line 1030
    .end local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :catchall_5
    move-exception v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    throw v19

    .restart local v15    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 1033
    iget-object v0, v15, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v5}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_2

    .line 960
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private wrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 9
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .prologue
    .line 1077
    const/4 v1, 0x0

    .line 1078
    .local v1, "future":Lorg/jboss/netty/channel/ChannelFuture;
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v6}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->acquireBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 1083
    .local v4, "outNetBuf":Ljava/nio/ByteBuffer;
    :cond_0
    :try_start_0
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v7
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1084
    :try_start_1
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    sget-object v8, Lorg/jboss/netty/handler/ssl/SslHandler;->EMPTY_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {v6, v8, v4}, Ljavax/net/ssl/SSLEngine;->wrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v5

    .line 1085
    .local v5, "result":Ljavax/net/ssl/SSLEngineResult;
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1087
    :try_start_2
    invoke-virtual {v5}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I

    move-result v6

    if-lez v6, :cond_1

    .line 1088
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 1089
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v6

    invoke-interface {v6}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v6

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    invoke-interface {v6, v7}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    .line 1096
    .local v3, "msg":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Ljava/nio/ByteBuffer;)V

    .line 1097
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1099
    invoke-static {p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 1100
    new-instance v6, Lorg/jboss/netty/handler/ssl/SslHandler$3;

    invoke-direct {v6, p0}, Lorg/jboss/netty/handler/ssl/SslHandler$3;-><init>(Lorg/jboss/netty/handler/ssl/SslHandler;)V

    invoke-interface {v1, v6}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 1111
    invoke-static {p1, v1, v3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 1114
    .end local v3    # "msg":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_1
    invoke-virtual {v5}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v2

    .line 1115
    .local v2, "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/ssl/SslHandler;->handleRenegotiation(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V

    .line 1116
    sget-object v6, Lorg/jboss/netty/handler/ssl/SslHandler$7;->$SwitchMap$javax$net$ssl$SSLEngineResult$HandshakeStatus:[I

    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 1140
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected handshake status: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catch Ljavax/net/ssl/SSLException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1148
    .end local v2    # "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .end local v5    # "result":Ljavax/net/ssl/SSLEngineResult;
    :catch_0
    move-exception v0

    .line 1149
    .local v0, "e":Ljavax/net/ssl/SSLException;
    :try_start_3
    invoke-direct {p0, p2, v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeFailure(Lorg/jboss/netty/channel/Channel;Ljavax/net/ssl/SSLException;)V

    .line 1150
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1152
    .end local v0    # "e":Ljavax/net/ssl/SSLException;
    :catchall_0
    move-exception v6

    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v7, v4}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    throw v6

    .line 1085
    :catchall_1
    move-exception v6

    :try_start_4
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw v6

    .line 1118
    .restart local v2    # "handshakeStatus":Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;
    .restart local v5    # "result":Ljavax/net/ssl/SSLEngineResult;
    :pswitch_0
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeSuccess(Lorg/jboss/netty/channel/Channel;)V

    .line 1119
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->runDelegatedTasks()V

    .line 1144
    :cond_2
    :goto_0
    :pswitch_1
    invoke-virtual {v5}, Ljavax/net/ssl/SSLEngineResult;->bytesProduced()I
    :try_end_5
    .catch Ljavax/net/ssl/SSLException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    .line 1152
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->bufferPool:Lorg/jboss/netty/handler/ssl/SslBufferPool;

    invoke-virtual {v6, v4}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->releaseBuffer(Ljava/nio/ByteBuffer;)V

    .line 1155
    if-nez v1, :cond_3

    .line 1156
    invoke-static {p2}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 1159
    :cond_3
    return-object v1

    .line 1122
    :pswitch_2
    :try_start_6
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->runDelegatedTasks()V

    goto :goto_0

    .line 1125
    :pswitch_3
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 1129
    const/4 v6, 0x1

    invoke-direct {p0, p1, p2, v6}, Lorg/jboss/netty/handler/ssl/SslHandler;->unwrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Z)V

    goto :goto_0

    .line 1133
    :pswitch_4
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/ssl/SslHandler;->setHandshakeSuccessIfStillHandshaking(Lorg/jboss/netty/channel/Channel;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1134
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->runDelegatedTasks()V
    :try_end_6
    .catch Ljavax/net/ssl/SSLException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    .line 1116
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1551
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->closeEngine()V

    .line 1554
    const/4 v0, 0x0

    .line 1556
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_0
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;

    .line 1557
    .local v2, "pw":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    if-nez v2, :cond_1

    .line 1567
    :goto_1
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingEncryptedWrites:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 1568
    .local v1, "ev":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v1, :cond_3

    .line 1577
    if-eqz v0, :cond_0

    .line 1578
    invoke-static {p1, v0}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaughtLater(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 1580
    :cond_0
    return-void

    .line 1560
    .end local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    :cond_1
    if-nez v0, :cond_2

    .line 1561
    new-instance v0, Ljava/io/IOException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    const-string v3, "Unable to write data"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1563
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_2
    iget-object v3, v2, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;->future:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v3, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0

    .line 1571
    .restart local v1    # "ev":Lorg/jboss/netty/channel/MessageEvent;
    :cond_3
    if-nez v0, :cond_4

    .line 1572
    new-instance v0, Ljava/io/IOException;

    .end local v0    # "cause":Ljava/lang/Throwable;
    const-string v3, "Unable to write data"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1574
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_4
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_1
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1542
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 1543
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 1544
    return-void
.end method

.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1615
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/ssl/SslHandler$6;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/handler/ssl/SslHandler$6;-><init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 1659
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 1660
    return-void
.end method

.method public channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1587
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->issueHandshake:Z

    if-eqz v0, :cond_0

    .line 1590
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->handshake()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/ssl/SslHandler$5;

    invoke-direct {v1, p0, p1, p2}, Lorg/jboss/netty/handler/ssl/SslHandler$5;-><init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 1604
    :goto_0
    return-void

    .line 1602
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    goto :goto_0
.end method

.method public channelDisconnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 573
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v1

    .line 574
    :try_start_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    if-eqz v0, :cond_0

    .line 575
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->cancelHandshakeTimeout()V

    .line 576
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    new-instance v2, Ljava/nio/channels/ClosedChannelException;

    invoke-direct {v2}, Ljava/nio/channels/ClosedChannelException;-><init>()V

    invoke-interface {v0, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 578
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 581
    :try_start_1
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->channelDisconnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 583
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-direct {p0, p1, v0, v3}, Lorg/jboss/netty/handler/ssl/SslHandler;->unwrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Z)V

    .line 584
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->closeEngine()V

    .line 586
    return-void

    .line 578
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 583
    :catchall_1
    move-exception v0

    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-direct {p0, p1, v1, v3}, Lorg/jboss/netty/handler/ssl/SslHandler;->unwrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Z)V

    .line 584
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->closeEngine()V

    .line 583
    throw v0
.end method

.method public close()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 4

    .prologue
    .line 422
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 423
    .local v1, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 425
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v3}, Ljavax/net/ssl/SSLEngine;->closeOutbound()V

    .line 426
    invoke-direct {p0, v1, v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->wrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 432
    :goto_0
    return-object v3

    .line 427
    :catch_0
    move-exception v2

    .line 428
    .local v2, "e":Ljavax/net/ssl/SSLException;
    invoke-static {v1, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 429
    iget-boolean v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    if-eqz v3, :cond_0

    .line 430
    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-static {v1, v3}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 432
    :cond_0
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/Channels;->failedFuture(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    goto :goto_0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 17
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "in"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 788
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v15

    .line 789
    .local v15, "startOffset":I
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v9

    .line 790
    .local v9, "endOffset":I
    move v12, v15

    .line 791
    .local v12, "offset":I
    const/4 v6, 0x0

    .line 794
    .local v6, "totalLength":I
    move-object/from16 v0, p0

    iget v1, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->packetLength:I

    if-lez v1, :cond_2

    .line 795
    sub-int v1, v9, v15

    move-object/from16 v0, p0

    iget v2, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->packetLength:I

    if-ge v1, v2, :cond_1

    .line 796
    const/16 v16, 0x0

    .line 874
    :cond_0
    :goto_0
    return-object v16

    .line 798
    :cond_1
    move-object/from16 v0, p0

    iget v1, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->packetLength:I

    add-int/2addr v12, v1

    .line 799
    move-object/from16 v0, p0

    iget v6, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->packetLength:I

    .line 800
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->packetLength:I

    .line 804
    :cond_2
    const/4 v11, 0x0

    .line 806
    .local v11, "nonSslRecord":Z
    :goto_1
    const/16 v1, 0x4919

    if-ge v6, v1, :cond_3

    .line 807
    sub-int v14, v9, v12

    .line 808
    .local v14, "readableBytes":I
    const/4 v1, 0x5

    if-ge v14, v1, :cond_4

    .line 838
    .end local v14    # "readableBytes":I
    :cond_3
    :goto_2
    const/16 v16, 0x0

    .line 839
    .local v16, "unwrapped":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-lez v6, :cond_8

    .line 851
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    move-object/from16 v0, p3

    invoke-interface {v0, v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 852
    .local v5, "inNetBuf":Ljava/nio/ByteBuffer;
    const/4 v7, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/handler/ssl/SslHandler;->unwrap(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/nio/ByteBuffer;IZ)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v16

    .line 853
    sget-boolean v1, Lorg/jboss/netty/handler/ssl/SslHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_8

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_8

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->isInboundDone()Z

    move-result v1

    if-nez v1, :cond_8

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 812
    .end local v5    # "inNetBuf":Ljava/nio/ByteBuffer;
    .end local v16    # "unwrapped":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v14    # "readableBytes":I
    :cond_4
    move-object/from16 v0, p3

    invoke-static {v0, v12}, Lorg/jboss/netty/handler/ssl/SslHandler;->getEncryptedPacketLength(Lorg/jboss/netty/buffer/ChannelBuffer;I)I

    move-result v13

    .line 813
    .local v13, "packetLength":I
    const/4 v1, -0x1

    if-ne v13, v1, :cond_5

    .line 814
    const/4 v11, 0x1

    .line 815
    goto :goto_2

    .line 818
    :cond_5
    sget-boolean v1, Lorg/jboss/netty/handler/ssl/SslHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_6

    if-gtz v13, :cond_6

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 820
    :cond_6
    if-le v13, v14, :cond_7

    .line 822
    move-object/from16 v0, p0

    iput v13, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->packetLength:I

    goto :goto_2

    .line 826
    :cond_7
    add-int v10, v6, v13

    .line 827
    .local v10, "newTotalLength":I
    const/16 v1, 0x4919

    if-gt v10, v1, :cond_3

    .line 834
    add-int/2addr v12, v13

    .line 835
    move v6, v10

    .line 836
    goto :goto_1

    .line 856
    .end local v10    # "newTotalLength":I
    .end local v13    # "packetLength":I
    .end local v14    # "readableBytes":I
    .restart local v16    # "unwrapped":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_8
    if-eqz v11, :cond_0

    .line 858
    new-instance v8, Lorg/jboss/netty/handler/ssl/NotSslRecordException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not an SSL/TLS record: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->hexDump(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Lorg/jboss/netty/handler/ssl/NotSslRecordException;-><init>(Ljava/lang/String;)V

    .line 860
    .local v8, "e":Lorg/jboss/netty/handler/ssl/NotSslRecordException;
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    move-object/from16 v0, p3

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 861
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    if-eqz v1, :cond_9

    .line 863
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 864
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V

    .line 868
    const/16 v16, 0x0

    goto/16 :goto_0

    .line 870
    :cond_9
    throw v8
.end method

.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ExceptionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 605
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 606
    .local v0, "cause":Ljava/lang/Throwable;
    instance-of v1, v0, Ljava/io/IOException;

    if-eqz v1, :cond_2

    .line 607
    instance-of v1, v0, Ljava/nio/channels/ClosedChannelException;

    if-eqz v1, :cond_3

    .line 608
    iget-object v2, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ignoreClosedChannelExceptionLock:Ljava/lang/Object;

    monitor-enter v2

    .line 609
    :try_start_0
    iget v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ignoreClosedChannelException:I

    if-lez v1, :cond_1

    .line 610
    iget v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ignoreClosedChannelException:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ignoreClosedChannelException:I

    .line 611
    sget-object v1, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 612
    sget-object v1, Lorg/jboss/netty/handler/ssl/SslHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v3, "Swallowing an exception raised while writing non-app data"

    invoke-interface {v1, v3, v0}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 617
    :cond_0
    monitor-exit v2

    .line 628
    :goto_0
    return-void

    .line 619
    :cond_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 627
    :cond_2
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 619
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 621
    :cond_3
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->ignoreException(Ljava/lang/Throwable;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0
.end method

.method public getCloseOnSSLException()Z
    .locals 1

    .prologue
    .line 503
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    return v0
.end method

.method public getEngine()Ljavax/net/ssl/SSLEngine;
    .locals 1

    .prologue
    .line 336
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    return-object v0
.end method

.method public getHandshakeTimeout()J
    .locals 2

    .prologue
    .line 483
    iget-wide v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeoutInMillis:J

    return-wide v0
.end method

.method public getSSLEngineInboundCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1

    .prologue
    .line 475
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->sslEngineCloseFuture:Lorg/jboss/netty/handler/ssl/SslHandler$SSLEngineInboundCloseFuture;

    return-object v0
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 7
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 508
    instance-of v3, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v3, :cond_0

    move-object v0, p2

    .line 509
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 510
    .local v0, "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler$7;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 520
    .end local v0    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    instance-of v3, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-nez v3, :cond_2

    .line 521
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 559
    :goto_0
    return-void

    .line 514
    .restart local v0    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :pswitch_0
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    .line 515
    :cond_1
    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOutboundAndChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    goto :goto_0

    .end local v0    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_2
    move-object v0, p2

    .line 525
    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    .line 526
    .local v0, "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v0}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v3, :cond_3

    .line 527
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 533
    :cond_3
    iget-boolean v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->startTls:Z

    if-eqz v3, :cond_4

    sget-object v3, Lorg/jboss/netty/handler/ssl/SslHandler;->SENT_FIRST_MESSAGE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v4, 0x0

    invoke-virtual {v3, p0, v4, v6}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 534
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 539
    :cond_4
    invoke-interface {v0}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 542
    .local v1, "msg":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 543
    new-instance v2, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;

    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    invoke-interface {v1, v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;-><init>(Lorg/jboss/netty/channel/ChannelFuture;Ljava/nio/ByteBuffer;)V

    .line 548
    .local v2, "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :goto_1
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v3}, Lorg/jboss/netty/util/internal/NonReentrantLock;->lock()V

    .line 550
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWrites:Ljava/util/Queue;

    invoke-interface {v3, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 552
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v3}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    .line 555
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelFuture;->isDone()Z

    move-result v3

    if-nez v3, :cond_6

    .line 556
    :cond_5
    iput-boolean v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->writeBeforeHandshakeDone:Z

    .line 558
    :cond_6
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lorg/jboss/netty/handler/ssl/SslHandler;->wrap(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0

    .line 545
    .end local v2    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    :cond_7
    new-instance v2, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;

    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;-><init>(Lorg/jboss/netty/channel/ChannelFuture;Ljava/nio/ByteBuffer;)V

    .restart local v2    # "pendingWrite":Lorg/jboss/netty/handler/ssl/SslHandler$PendingWrite;
    goto :goto_1

    .line 552
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->pendingUnencryptedWritesLock:Lorg/jboss/netty/util/internal/NonReentrantLock;

    invoke-virtual {v4}, Lorg/jboss/netty/util/internal/NonReentrantLock;->unlock()V

    throw v3

    .line 510
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public handshake()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 12

    .prologue
    .line 346
    iget-object v7, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeLock:Ljava/lang/Object;

    monitor-enter v7

    .line 347
    :try_start_0
    iget-boolean v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaken:Z

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->isEnableRenegotiation()Z

    move-result v6

    if-nez v6, :cond_0

    .line 348
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v8, "renegotiation disabled"

    invoke-direct {v6, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 414
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .line 351
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 352
    .local v1, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 354
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    const/4 v3, 0x0

    .line 356
    .local v3, "exception":Ljava/lang/Exception;
    iget-boolean v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z

    if-eqz v6, :cond_1

    .line 357
    iget-object v4, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    monitor-exit v7

    .line 413
    :goto_0
    return-object v4

    .line 360
    :cond_1
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshaking:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 362
    :try_start_2
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v6}, Ljavax/net/ssl/SSLEngine;->beginHandshake()V

    .line 363
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/SslHandler;->runDelegatedTasks()V

    .line 364
    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    .line 365
    .local v4, "handshakeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    iget-wide v8, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeoutInMillis:J

    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-lez v6, :cond_2

    .line 366
    iget-object v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v8, Lorg/jboss/netty/handler/ssl/SslHandler$1;

    invoke-direct {v8, p0, v0}, Lorg/jboss/netty/handler/ssl/SslHandler$1;-><init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/Channel;)V

    iget-wide v10, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeoutInMillis:J

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v6, v8, v10, v11, v9}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v6

    iput-object v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeTimeout:Lorg/jboss/netty/util/Timeout;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 383
    :cond_2
    :goto_1
    if-nez v3, :cond_4

    .line 385
    move-object v5, v4

    .line 386
    .local v5, "hsFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :try_start_3
    invoke-direct {p0, v1, v0}, Lorg/jboss/netty/handler/ssl/SslHandler;->wrapNonAppData(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v6

    new-instance v8, Lorg/jboss/netty/handler/ssl/SslHandler$2;

    invoke-direct {v8, p0, v5, v1, v0}, Lorg/jboss/netty/handler/ssl/SslHandler$2;-><init>(Lorg/jboss/netty/handler/ssl/SslHandler;Lorg/jboss/netty/channel/ChannelFuture;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;)V

    invoke-interface {v6, v8}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V
    :try_end_3
    .catch Ljavax/net/ssl/SSLException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 413
    .end local v5    # "hsFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_3
    :goto_2
    :try_start_4
    monitor-exit v7

    goto :goto_0

    .line 378
    .end local v4    # "handshakeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :catch_0
    move-exception v2

    .line 379
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {v0, v2}, Lorg/jboss/netty/channel/Channels;->failedFuture(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->handshakeFuture:Lorg/jboss/netty/channel/ChannelFuture;

    .line 380
    .restart local v4    # "handshakeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    move-object v3, v2

    goto :goto_1

    .line 399
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v5    # "hsFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :catch_1
    move-exception v2

    .line 400
    .local v2, "e":Ljavax/net/ssl/SSLException;
    invoke-interface {v4, v2}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 402
    invoke-static {v1, v2}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 403
    iget-boolean v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    if-eqz v6, :cond_3

    .line 404
    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v6

    invoke-static {v1, v6}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V

    goto :goto_2

    .line 408
    .end local v2    # "e":Ljavax/net/ssl/SSLException;
    .end local v5    # "hsFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_4
    invoke-static {v1, v3}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Throwable;)V

    .line 409
    iget-boolean v6, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    if-eqz v6, :cond_3

    .line 410
    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v6

    invoke-static {v1, v6}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2
.end method

.method public isEnableRenegotiation()Z
    .locals 1

    .prologue
    .line 440
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->enableRenegotiation:Z

    return v0
.end method

.method public isIssueHandshake()Z
    .locals 1

    .prologue
    .line 463
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->issueHandshake:Z

    return v0
.end method

.method public setCloseOnSSLException(Z)V
    .locals 2
    .param p1, "closeOnSslException"    # Z

    .prologue
    .line 496
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-eqz v0, :cond_0

    .line 497
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only get changed before attached to ChannelPipeline"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 499
    :cond_0
    iput-boolean p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->closeOnSslException:Z

    .line 500
    return-void
.end method

.method public setEnableRenegotiation(Z)V
    .locals 0
    .param p1, "enableRenegotiation"    # Z

    .prologue
    .line 447
    iput-boolean p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->enableRenegotiation:Z

    .line 448
    return-void
.end method

.method public setIssueHandshake(Z)V
    .locals 0
    .param p1, "issueHandshake"    # Z

    .prologue
    .line 456
    iput-boolean p1, p0, Lorg/jboss/netty/handler/ssl/SslHandler;->issueHandshake:Z

    .line 457
    return-void
.end method
