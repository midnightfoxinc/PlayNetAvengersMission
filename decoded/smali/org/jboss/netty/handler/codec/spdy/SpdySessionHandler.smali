.class public Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "SpdySessionHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$5;,
        Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_MAX_CONCURRENT_STREAMS:I = 0x7fffffff

.field private static final DEFAULT_WINDOW_SIZE:I = 0x10000

.field private static final PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;


# instance fields
.field private volatile closeSessionFutureListener:Lorg/jboss/netty/channel/ChannelFutureListener;

.field private final flowControlLock:Ljava/lang/Object;

.field private volatile initialReceiveWindowSize:I

.field private volatile initialSendWindowSize:I

.field private volatile initialSessionReceiveWindowSize:I

.field private volatile lastGoodStreamId:I

.field private volatile localConcurrentStreams:I

.field private final minorVersion:I

.field private final pings:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile receivedGoAwayFrame:Z

.field private volatile remoteConcurrentStreams:I

.field private volatile sentGoAwayFrame:Z

.field private final server:Z

.field private final spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;Z)V
    .locals 4
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "server"    # Z

    .prologue
    const v3, 0x7fffffff

    const/high16 v0, 0x10000

    .line 77
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 45
    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSendWindowSize:I

    .line 46
    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    .line 47
    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSessionReceiveWindowSize:I

    .line 49
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    iget v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSendWindowSize:I

    iget v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;-><init>(II)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    .line 53
    iput v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->remoteConcurrentStreams:I

    .line 54
    iput v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->localConcurrentStreams:I

    .line 56
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->flowControlLock:Ljava/lang/Object;

    .line 58
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->pings:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 78
    if-nez p1, :cond_0

    .line 79
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "spdyVersion"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_0
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->server:Z

    .line 82
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->getMinorVersion()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->minorVersion:I

    .line 83
    return-void
.end method

.method private declared-synchronized acceptStream(IBZZ)Z
    .locals 9
    .param p1, "streamId"    # I
    .param p2, "priority"    # B
    .param p3, "remoteSideClosed"    # Z
    .param p4, "localSideClosed"    # Z

    .prologue
    const/4 v0, 0x0

    .line 736
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->receivedGoAwayFrame:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->sentGoAwayFrame:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 751
    :cond_0
    :goto_0
    monitor-exit p0

    return v0

    .line 740
    :cond_1
    :try_start_1
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v7

    .line 741
    .local v7, "remote":Z
    if-eqz v7, :cond_3

    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->localConcurrentStreams:I

    .line 742
    .local v8, "maxConcurrentStreams":I
    :goto_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v1, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->numActiveStreams(Z)I

    move-result v1

    if-ge v1, v8, :cond_0

    .line 745
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    iget v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSendWindowSize:I

    iget v6, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v7}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->acceptStream(IBZZIIZ)V

    .line 748
    if-eqz v7, :cond_2

    .line 749
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->lastGoodStreamId:I

    .line 751
    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    .line 741
    .end local v8    # "maxConcurrentStreams":I
    :cond_3
    iget v8, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->remoteConcurrentStreams:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 736
    .end local v7    # "remote":Z
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic access$000(Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V
    .locals 0
    .param p0, "x0"    # Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;
    .param p1, "x1"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x2"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x3"    # Ljava/net/SocketAddress;
    .param p4, "x4"    # Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueSessionError(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    return-void
.end method

.method private halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "streamId"    # I
    .param p2, "remote"    # Z
    .param p3, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 755
    if-eqz p2, :cond_1

    .line 756
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v1

    invoke-virtual {v0, p1, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->closeRemoteSide(IZ)V

    .line 760
    :goto_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->closeSessionFutureListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->noActiveStreams()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 761
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->closeSessionFutureListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {p3, v0}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 763
    :cond_0
    return-void

    .line 758
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v1

    invoke-virtual {v0, p1, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->closeLocalSide(IZ)V

    goto :goto_0
.end method

.method private isRemoteInitiatedId(I)Z
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 714
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->isServerId(I)Z

    move-result v0

    .line 715
    .local v0, "serverId":Z
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->server:Z

    if-eqz v1, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->server:Z

    if-nez v1, :cond_2

    if-eqz v0, :cond_2

    :cond_1
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private issueSessionError(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;
    .param p4, "status"    # Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    .prologue
    .line 680
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->sendGoAwayFrame(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 681
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    sget-object v1, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 682
    return-void
.end method

.method private issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;
    .param p3, "streamId"    # I
    .param p4, "status"    # Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    .prologue
    .line 698
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v3, p3}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isRemoteSideClosed(I)Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v0, 0x1

    .line 699
    .local v0, "fireMessageReceived":Z
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-static {v3}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 700
    .local v1, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-direct {p0, p3, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->removeStream(ILorg/jboss/netty/channel/ChannelFuture;)V

    .line 702
    new-instance v2, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    invoke-direct {v2, p3, p4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 703
    .local v2, "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static {p1, v1, v2, p2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 704
    if-eqz v0, :cond_0

    .line 705
    invoke-static {p1, v2, p2}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 707
    :cond_0
    return-void

    .line 698
    .end local v0    # "fireMessageReceived":Z
    .end local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v2    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private removeStream(ILorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "streamId"    # I
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 766
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v1

    invoke-virtual {v0, p1, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->removeStream(IZ)V

    .line 767
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->closeSessionFutureListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->noActiveStreams()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 768
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->closeSessionFutureListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {p2, v0}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 770
    :cond_0
    return-void
.end method

.method private declared-synchronized sendGoAwayFrame(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;
    .param p4, "status"    # Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    .prologue
    .line 870
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->sentGoAwayFrame:Z

    if-nez v2, :cond_0

    .line 871
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->sentGoAwayFrame:Z

    .line 872
    new-instance v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;

    iget v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->lastGoodStreamId:I

    invoke-direct {v1, v2, p4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    .line 873
    .local v1, "spdyGoAwayFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;
    invoke-static {p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 874
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-static {p1, v0, v1, p3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 877
    .end local v0    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v1    # "spdyGoAwayFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    invoke-static {p2}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 870
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private sendGoAwayFrame(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;

    .prologue
    .line 855
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 856
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 866
    :goto_0
    return-void

    .line 860
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    const/4 v2, 0x0

    sget-object v3, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->OK:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    invoke-direct {p0, p1, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->sendGoAwayFrame(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 861
    .local v0, "future":Lorg/jboss/netty/channel/ChannelFuture;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->noActiveStreams()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 862
    new-instance v1, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;

    invoke-direct {v1, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0

    .line 864
    :cond_1
    new-instance v1, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;

    invoke-direct {v1, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$ClosingChannelFutureListener;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->closeSessionFutureListener:Lorg/jboss/netty/channel/ChannelFutureListener;

    goto :goto_0
.end method

.method private declared-synchronized updateInitialReceiveWindowSize(I)V
    .locals 2
    .param p1, "newInitialWindowSize"    # I

    .prologue
    .line 727
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    sub-int v0, p1, v1

    .line 728
    .local v0, "deltaWindowSize":I
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    .line 729
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v1, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateAllReceiveWindowSizes(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 730
    monitor-exit p0

    return-void

    .line 727
    .end local v0    # "deltaWindowSize":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized updateInitialSendWindowSize(I)V
    .locals 2
    .param p1, "newInitialWindowSize"    # I

    .prologue
    .line 720
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSendWindowSize:I

    sub-int v0, p1, v1

    .line 721
    .local v0, "deltaWindowSize":I
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSendWindowSize:I

    .line 722
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v1, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateAllSendWindowSizes(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 723
    monitor-exit p0

    return-void

    .line 720
    .end local v0    # "deltaWindowSize":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private updateSendWindowSize(Lorg/jboss/netty/channel/ChannelHandlerContext;II)V
    .locals 16
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "streamId"    # I
    .param p3, "deltaWindowSize"    # I

    .prologue
    .line 773
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->flowControlLock:Ljava/lang/Object;

    monitor-enter v13

    .line 774
    :try_start_0
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move/from16 v0, p2

    move/from16 v1, p3

    invoke-virtual {v12, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    move-result v5

    .line 775
    .local v5, "newWindowSize":I
    if-eqz p2, :cond_0

    .line 776
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    const/4 v14, 0x0

    invoke-virtual {v12, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->getSendWindowSize(I)I

    move-result v8

    .line 777
    .local v8, "sessionSendWindowSize":I
    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 780
    .end local v8    # "sessionSendWindowSize":I
    :cond_0
    :goto_0
    if-lez v5, :cond_1

    .line 782
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->getPendingWrite(I)Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v4

    .line 783
    .local v4, "e":Lorg/jboss/netty/channel/MessageEvent;
    if-nez v4, :cond_2

    .line 850
    .end local v4    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_1
    monitor-exit v13

    .line 851
    return-void

    .line 787
    .restart local v4    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_2
    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    .line 788
    .local v9, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface {v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v12

    invoke-interface {v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    .line 789
    .local v3, "dataFrameSize":I
    invoke-interface {v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getStreamId()I

    move-result v11

    .line 790
    .local v11, "writeStreamId":I
    if-nez p2, :cond_3

    .line 791
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v12, v11}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->getSendWindowSize(I)I

    move-result v12

    invoke-static {v5, v12}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 794
    :cond_3
    if-lt v5, v3, :cond_5

    .line 796
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    invoke-virtual {v12, v11}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->removePendingWrite(I)Lorg/jboss/netty/channel/MessageEvent;

    .line 797
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    mul-int/lit8 v14, v3, -0x1

    invoke-virtual {v12, v11, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    move-result v5

    .line 798
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    const/4 v14, 0x0

    mul-int/lit8 v15, v3, -0x1

    invoke-virtual {v12, v14, v15}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    move-result v8

    .line 800
    .restart local v8    # "sessionSendWindowSize":I
    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 804
    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v7

    .line 805
    .local v7, "remoteAddress":Ljava/net/SocketAddress;
    move-object/from16 v2, p1

    .line 806
    .local v2, "context":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v12

    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$3;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v2, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$3;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;)V

    invoke-interface {v12, v14}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 816
    invoke-interface {v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->isLast()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 817
    const/4 v12, 0x0

    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V

    .line 820
    :cond_4
    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v12

    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-static {v0, v12, v9, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_0

    .line 850
    .end local v2    # "context":Lorg/jboss/netty/channel/ChannelHandlerContext;
    .end local v3    # "dataFrameSize":I
    .end local v4    # "e":Lorg/jboss/netty/channel/MessageEvent;
    .end local v5    # "newWindowSize":I
    .end local v7    # "remoteAddress":Ljava/net/SocketAddress;
    .end local v8    # "sessionSendWindowSize":I
    .end local v9    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .end local v11    # "writeStreamId":I
    :catchall_0
    move-exception v12

    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v12

    .line 823
    .restart local v3    # "dataFrameSize":I
    .restart local v4    # "e":Lorg/jboss/netty/channel/MessageEvent;
    .restart local v5    # "newWindowSize":I
    .restart local v9    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .restart local v11    # "writeStreamId":I
    :cond_5
    :try_start_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    mul-int/lit8 v14, v5, -0x1

    invoke-virtual {v12, v11, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    .line 824
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    const/4 v14, 0x0

    mul-int/lit8 v15, v5, -0x1

    invoke-virtual {v12, v14, v15}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    .line 827
    new-instance v6, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;

    invoke-direct {v6, v11}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;-><init>(I)V

    .line 828
    .local v6, "partialDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface {v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v12

    invoke-interface {v12, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v12

    invoke-interface {v6, v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 830
    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v12

    invoke-static {v12}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v10

    .line 834
    .local v10, "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v7

    .line 835
    .restart local v7    # "remoteAddress":Ljava/net/SocketAddress;
    move-object/from16 v2, p1

    .line 836
    .restart local v2    # "context":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v12

    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$4;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v2, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$4;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;)V

    invoke-interface {v12, v14}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 845
    move-object/from16 v0, p1

    invoke-static {v0, v10, v6, v7}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 847
    const/4 v5, 0x0

    goto/16 :goto_0
.end method


# virtual methods
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
    .line 428
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 429
    .local v0, "cause":Ljava/lang/Throwable;
    instance-of v1, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    if-eqz v1, :cond_0

    .line 430
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    const/4 v2, 0x0

    sget-object v3, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    invoke-direct {p0, p1, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueSessionError(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    .line 433
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;->exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V

    .line 434
    return-void
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 31
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 438
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    move/from16 v27, v0

    if-eqz v27, :cond_0

    move-object/from16 v6, p2

    .line 439
    check-cast v6, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 440
    .local v6, "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    sget-object v27, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$5;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v28

    aget v27, v27, v28

    packed-switch v27, :pswitch_data_0

    .line 457
    .end local v6    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/jboss/netty/channel/MessageEvent;

    move/from16 v27, v0

    if-nez v27, :cond_2

    .line 458
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 666
    :goto_0
    return-void

    .line 451
    .restart local v6    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :pswitch_0
    sget-object v27, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_1

    invoke-interface {v6}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v27

    if-nez v27, :cond_0

    .line 452
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->sendGoAwayFrame(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    goto :goto_0

    .end local v6    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_2
    move-object/from16 v6, p2

    .line 462
    check-cast v6, Lorg/jboss/netty/channel/MessageEvent;

    .line 463
    .local v6, "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v8

    .line 465
    .local v8, "msg":Ljava/lang/Object;
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_7

    move-object/from16 v18, v8

    .line 467
    check-cast v18, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    .line 468
    .local v18, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getStreamId()I

    move-result v25

    .line 471
    .local v25, "streamId":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isLocalSideClosed(I)Z

    move-result v27

    if-eqz v27, :cond_3

    .line 472
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_0

    .line 489
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->flowControlLock:Ljava/lang/Object;

    move-object/from16 v28, v0

    monitor-enter v28

    .line 490
    :try_start_0
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    .line 491
    .local v5, "dataLength":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->getSendWindowSize(I)I

    move-result v15

    .line 492
    .local v15, "sendWindowSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    const/16 v29, 0x0

    move-object/from16 v0, v27

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->getSendWindowSize(I)I

    move-result v16

    .line 493
    .local v16, "sessionSendWindowSize":I
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 495
    if-gtz v15, :cond_4

    .line 497
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v25

    invoke-virtual {v0, v1, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->putPendingWrite(ILorg/jboss/netty/channel/MessageEvent;)Z

    .line 498
    monitor-exit v28

    goto/16 :goto_0

    .line 548
    .end local v5    # "dataLength":I
    .end local v15    # "sendWindowSize":I
    .end local v16    # "sessionSendWindowSize":I
    :catchall_0
    move-exception v27

    monitor-exit v28
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v27

    .line 499
    .restart local v5    # "dataLength":I
    .restart local v15    # "sendWindowSize":I
    .restart local v16    # "sessionSendWindowSize":I
    :cond_4
    if-ge v15, v5, :cond_5

    .line 501
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    mul-int/lit8 v29, v15, -0x1

    move-object/from16 v0, v27

    move/from16 v1, v25

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    .line 502
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    const/16 v29, 0x0

    mul-int/lit8 v30, v15, -0x1

    move-object/from16 v0, v27

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    .line 505
    new-instance v11, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;

    move/from16 v0, v25

    invoke-direct {v11, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;-><init>(I)V

    .line 506
    .local v11, "partialDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-interface {v0, v15}, Lorg/jboss/netty/buffer/ChannelBuffer;->readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-interface {v11, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 509
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v25

    invoke-virtual {v0, v1, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->putPendingWrite(ILorg/jboss/netty/channel/MessageEvent;)Z

    .line 511
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v26

    .line 515
    .local v26, "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v13

    .line 516
    .local v13, "remoteAddress":Ljava/net/SocketAddress;
    move-object/from16 v4, p1

    .line 517
    .local v4, "context":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    new-instance v29, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$1;

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v13}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$1;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;)V

    move-object/from16 v0, v27

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 527
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-static {v0, v1, v11, v13}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 528
    monitor-exit v28

    goto/16 :goto_0

    .line 531
    .end local v4    # "context":Lorg/jboss/netty/channel/ChannelHandlerContext;
    .end local v11    # "partialDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .end local v13    # "remoteAddress":Ljava/net/SocketAddress;
    .end local v26    # "writeFuture":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    mul-int/lit8 v29, v5, -0x1

    move-object/from16 v0, v27

    move/from16 v1, v25

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    .line 532
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    const/16 v29, 0x0

    mul-int/lit8 v30, v5, -0x1

    move-object/from16 v0, v27

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateSendWindowSize(II)I

    .line 536
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v13

    .line 537
    .restart local v13    # "remoteAddress":Ljava/net/SocketAddress;
    move-object/from16 v4, p1

    .line 538
    .restart local v4    # "context":Lorg/jboss/netty/channel/ChannelHandlerContext;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    new-instance v29, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v13}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler$2;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;)V

    move-object/from16 v0, v27

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 548
    monitor-exit v28
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 551
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->isLast()Z

    move-result v27

    if-eqz v27, :cond_6

    .line 552
    const/16 v27, 0x0

    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v25

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V

    .line 665
    .end local v4    # "context":Lorg/jboss/netty/channel/ChannelHandlerContext;
    .end local v5    # "dataLength":I
    .end local v13    # "remoteAddress":Ljava/net/SocketAddress;
    .end local v15    # "sendWindowSize":I
    .end local v16    # "sessionSendWindowSize":I
    .end local v18    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .end local v25    # "streamId":I
    :cond_6
    :goto_1
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0

    .line 555
    :cond_7
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_9

    move-object/from16 v24, v8

    .line 557
    check-cast v24, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    .line 558
    .local v24, "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getStreamId()I

    move-result v25

    .line 560
    .restart local v25    # "streamId":I
    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v27

    if-eqz v27, :cond_8

    .line 561
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 565
    :cond_8
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getPriority()B

    move-result v12

    .line 566
    .local v12, "priority":B
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isUnidirectional()Z

    move-result v14

    .line 567
    .local v14, "remoteSideClosed":Z
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isLast()Z

    move-result v7

    .line 568
    .local v7, "localSideClosed":Z
    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v1, v12, v14, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->acceptStream(IBZZ)Z

    move-result v27

    if-nez v27, :cond_6

    .line 569
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 573
    .end local v7    # "localSideClosed":Z
    .end local v12    # "priority":B
    .end local v14    # "remoteSideClosed":Z
    .end local v24    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .end local v25    # "streamId":I
    :cond_9
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_c

    move-object/from16 v23, v8

    .line 575
    check-cast v23, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    .line 576
    .local v23, "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    invoke-interface/range {v23 .. v23}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->getStreamId()I

    move-result v25

    .line 579
    .restart local v25    # "streamId":I
    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v27

    if-eqz v27, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isLocalSideClosed(I)Z

    move-result v27

    if-eqz v27, :cond_b

    .line 580
    :cond_a
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 585
    :cond_b
    invoke-interface/range {v23 .. v23}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->isLast()Z

    move-result v27

    if-eqz v27, :cond_6

    .line 586
    const/16 v27, 0x0

    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v25

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V

    goto/16 :goto_1

    .line 589
    .end local v23    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    .end local v25    # "streamId":I
    :cond_c
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_d

    move-object/from16 v21, v8

    .line 591
    check-cast v21, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    .line 592
    .local v21, "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-interface/range {v21 .. v21}, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;->getStreamId()I

    move-result v27

    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v27

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->removeStream(ILorg/jboss/netty/channel/ChannelFuture;)V

    goto/16 :goto_1

    .line 594
    .end local v21    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_d
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_11

    move-object/from16 v22, v8

    .line 596
    check-cast v22, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    .line 598
    .local v22, "spdySettingsFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;
    const/16 v27, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getValue(I)I

    move-result v17

    .line 599
    .local v17, "settingsMinorVersion":I
    if-ltz v17, :cond_e

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->minorVersion:I

    move/from16 v27, v0

    move/from16 v0, v17

    move/from16 v1, v27

    if-eq v0, v1, :cond_e

    .line 601
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 605
    :cond_e
    const/16 v27, 0x4

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getValue(I)I

    move-result v9

    .line 607
    .local v9, "newConcurrentStreams":I
    if-ltz v9, :cond_f

    .line 608
    move-object/from16 v0, p0

    iput v9, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->localConcurrentStreams:I

    .line 614
    :cond_f
    const/16 v27, 0x7

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->isPersisted(I)Z

    move-result v27

    if-eqz v27, :cond_10

    .line 615
    const/16 v27, 0x7

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->removeValue(I)V

    .line 617
    :cond_10
    const/16 v27, 0x7

    const/16 v28, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v27

    move/from16 v2, v28

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->setPersistValue(IZ)V

    .line 619
    const/16 v27, 0x7

    move-object/from16 v0, v22

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getValue(I)I

    move-result v10

    .line 621
    .local v10, "newInitialWindowSize":I
    if-ltz v10, :cond_6

    .line 622
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->updateInitialReceiveWindowSize(I)V

    goto/16 :goto_1

    .line 625
    .end local v9    # "newConcurrentStreams":I
    .end local v10    # "newInitialWindowSize":I
    .end local v17    # "settingsMinorVersion":I
    .end local v22    # "spdySettingsFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;
    :cond_11
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_13

    move-object/from16 v20, v8

    .line 627
    check-cast v20, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;

    .line 628
    .local v20, "spdyPingFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;
    invoke-interface/range {v20 .. v20}, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;->getId()I

    move-result v27

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v27

    if-eqz v27, :cond_12

    .line 629
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    new-instance v28, Ljava/lang/IllegalArgumentException;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "invalid PING ID: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-interface/range {v20 .. v20}, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;->getId()I

    move-result v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 633
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->pings:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    goto/16 :goto_1

    .line 635
    .end local v20    # "spdyPingFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;
    :cond_13
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_14

    .line 639
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 642
    :cond_14
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_16

    move-object/from16 v19, v8

    .line 644
    check-cast v19, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .line 645
    .local v19, "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->getStreamId()I

    move-result v25

    .line 648
    .restart local v25    # "streamId":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isLocalSideClosed(I)Z

    move-result v27

    if-eqz v27, :cond_15

    .line 649
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 654
    :cond_15
    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isLast()Z

    move-result v27

    if-eqz v27, :cond_6

    .line 655
    const/16 v27, 0x0

    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v25

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V

    goto/16 :goto_1

    .line 658
    .end local v19    # "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .end local v25    # "streamId":I
    :cond_16
    instance-of v0, v8, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_6

    .line 661
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->PROTOCOL_EXCEPTION:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto/16 :goto_0

    .line 440
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 30
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 102
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v7

    .line 103
    .local v7, "msg":Ljava/lang/Object;
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_b

    move-object/from16 v17, v7

    .line 128
    check-cast v17, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    .line 129
    .local v17, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getStreamId()I

    move-result v26

    .line 131
    .local v26, "streamId":I
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v27

    mul-int/lit8 v5, v27, -0x1

    .line 132
    .local v5, "deltaWindowSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v0, v1, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateReceiveWindowSize(II)I

    move-result v10

    .line 136
    .local v10, "newSessionWindowSize":I
    if-gez v10, :cond_1

    .line 137
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v28

    sget-object v29, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move-object/from16 v3, v28

    move-object/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueSessionError(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    .line 422
    .end local v5    # "deltaWindowSize":I
    .end local v10    # "newSessionWindowSize":I
    .end local v17    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .end local v26    # "streamId":I
    :cond_0
    :goto_0
    return-void

    .line 142
    .restart local v5    # "deltaWindowSize":I
    .restart local v10    # "newSessionWindowSize":I
    .restart local v17    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .restart local v26    # "streamId":I
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSessionReceiveWindowSize:I

    move/from16 v27, v0

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    if-gt v10, v0, :cond_2

    .line 143
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSessionReceiveWindowSize:I

    move/from16 v27, v0

    sub-int v15, v27, v10

    .line 144
    .local v15, "sessionDeltaWindowSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v0, v1, v15}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateReceiveWindowSize(II)I

    .line 145
    new-instance v24, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyWindowUpdateFrame;

    const/16 v27, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v27

    invoke-direct {v0, v1, v15}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyWindowUpdateFrame;-><init>(II)V

    .line 147
    .local v24, "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v28

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    move-object/from16 v2, v24

    move-object/from16 v3, v28

    invoke-static {v0, v1, v2, v3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 152
    .end local v15    # "sessionDeltaWindowSize":I
    .end local v24    # "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isActiveStream(I)Z

    move-result v27

    if-nez v27, :cond_4

    .line 153
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->lastGoodStreamId:I

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    if-gt v0, v1, :cond_3

    .line 154
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto :goto_0

    .line 155
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->sentGoAwayFrame:Z

    move/from16 v27, v0

    if-nez v27, :cond_0

    .line 156
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->INVALID_STREAM:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 162
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isRemoteSideClosed(I)Z

    move-result v27

    if-eqz v27, :cond_5

    .line 163
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->STREAM_ALREADY_CLOSED:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 168
    :cond_5
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v27

    if-nez v27, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->hasReceivedReply(I)Z

    move-result v27

    if-nez v27, :cond_6

    .line 169
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 180
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateReceiveWindowSize(II)I

    move-result v11

    .line 187
    .local v11, "newWindowSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->getReceiveWindowSizeLowerBound(I)I

    move-result v27

    move/from16 v0, v27

    if-ge v11, v0, :cond_7

    .line 188
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->FLOW_CONTROL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 194
    :cond_7
    if-gez v11, :cond_8

    .line 195
    :goto_1
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v27

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    move/from16 v28, v0

    move/from16 v0, v27

    move/from16 v1, v28

    if-le v0, v1, :cond_8

    .line 196
    new-instance v12, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;

    move/from16 v0, v26

    invoke-direct {v12, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;-><init>(I)V

    .line 197
    .local v12, "partialDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v27

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    move/from16 v28, v0

    invoke-interface/range {v27 .. v28}, Lorg/jboss/netty/buffer/ChannelBuffer;->readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-interface {v12, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 198
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-static {v0, v12, v1}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_1

    .line 203
    .end local v12    # "partialDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    :cond_8
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    move/from16 v27, v0

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    if-gt v11, v0, :cond_9

    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->isLast()Z

    move-result v27

    if-nez v27, :cond_9

    .line 204
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialReceiveWindowSize:I

    move/from16 v27, v0

    sub-int v25, v27, v11

    .line 205
    .local v25, "streamDeltaWindowSize":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->updateReceiveWindowSize(II)I

    .line 206
    new-instance v24, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyWindowUpdateFrame;

    move-object/from16 v0, v24

    move/from16 v1, v26

    move/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyWindowUpdateFrame;-><init>(II)V

    .line 208
    .restart local v24    # "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v28

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    move-object/from16 v2, v24

    move-object/from16 v3, v28

    invoke-static {v0, v1, v2, v3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 213
    .end local v24    # "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    .end local v25    # "streamDeltaWindowSize":I
    :cond_9
    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->isLast()Z

    move-result v27

    if-eqz v27, :cond_a

    .line 214
    const/16 v27, 0x1

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V

    .line 421
    .end local v5    # "deltaWindowSize":I
    .end local v10    # "newSessionWindowSize":I
    .end local v11    # "newWindowSize":I
    .end local v17    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .end local v26    # "streamId":I
    :cond_a
    :goto_2
    invoke-super/range {p0 .. p2}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;->messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V

    goto/16 :goto_0

    .line 217
    :cond_b
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_f

    move-object/from16 v23, v7

    .line 233
    check-cast v23, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    .line 234
    .local v23, "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    invoke-interface/range {v23 .. v23}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getStreamId()I

    move-result v26

    .line 237
    .restart local v26    # "streamId":I
    invoke-interface/range {v23 .. v23}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isInvalid()Z

    move-result v27

    if-nez v27, :cond_c

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v27

    if-eqz v27, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isActiveStream(I)Z

    move-result v27

    if-eqz v27, :cond_d

    .line 240
    :cond_c
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 245
    :cond_d
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->lastGoodStreamId:I

    move/from16 v27, v0

    move/from16 v0, v26

    move/from16 v1, v27

    if-gt v0, v1, :cond_e

    .line 246
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v28

    sget-object v29, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move-object/from16 v3, v28

    move-object/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueSessionError(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    goto/16 :goto_0

    .line 251
    :cond_e
    invoke-interface/range {v23 .. v23}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getPriority()B

    move-result v13

    .line 252
    .local v13, "priority":B
    invoke-interface/range {v23 .. v23}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isLast()Z

    move-result v14

    .line 253
    .local v14, "remoteSideClosed":Z
    invoke-interface/range {v23 .. v23}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isUnidirectional()Z

    move-result v6

    .line 254
    .local v6, "localSideClosed":Z
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1, v13, v14, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->acceptStream(IBZZ)Z

    move-result v27

    if-nez v27, :cond_a

    .line 255
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->REFUSED_STREAM:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 259
    .end local v6    # "localSideClosed":Z
    .end local v13    # "priority":B
    .end local v14    # "remoteSideClosed":Z
    .end local v23    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .end local v26    # "streamId":I
    :cond_f
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_13

    move-object/from16 v22, v7

    .line 268
    check-cast v22, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    .line 269
    .local v22, "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    invoke-interface/range {v22 .. v22}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->getStreamId()I

    move-result v26

    .line 272
    .restart local v26    # "streamId":I
    invoke-interface/range {v22 .. v22}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->isInvalid()Z

    move-result v27

    if-nez v27, :cond_10

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v27

    if-nez v27, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isRemoteSideClosed(I)Z

    move-result v27

    if-eqz v27, :cond_11

    .line 275
    :cond_10
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->INVALID_STREAM:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 280
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->hasReceivedReply(I)Z

    move-result v27

    if-eqz v27, :cond_12

    .line 281
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->STREAM_IN_USE:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 285
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->receivedReply(I)V

    .line 288
    invoke-interface/range {v22 .. v22}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->isLast()Z

    move-result v27

    if-eqz v27, :cond_a

    .line 289
    const/16 v27, 0x1

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V

    goto/16 :goto_2

    .line 292
    .end local v22    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    .end local v26    # "streamId":I
    :cond_13
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_14

    move-object/from16 v20, v7

    .line 303
    check-cast v20, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    .line 304
    .local v20, "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-interface/range {v20 .. v20}, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;->getStreamId()I

    move-result v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v27

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->removeStream(ILorg/jboss/netty/channel/ChannelFuture;)V

    goto/16 :goto_2

    .line 306
    .end local v20    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_14
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_18

    move-object/from16 v21, v7

    .line 308
    check-cast v21, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;

    .line 310
    .local v21, "spdySettingsFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;
    const/16 v27, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getValue(I)I

    move-result v16

    .line 311
    .local v16, "settingsMinorVersion":I
    if-ltz v16, :cond_15

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->minorVersion:I

    move/from16 v27, v0

    move/from16 v0, v16

    move/from16 v1, v27

    if-eq v0, v1, :cond_15

    .line 313
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v28

    sget-object v29, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move-object/from16 v3, v28

    move-object/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueSessionError(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    goto/16 :goto_0

    .line 317
    :cond_15
    const/16 v27, 0x4

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getValue(I)I

    move-result v8

    .line 319
    .local v8, "newConcurrentStreams":I
    if-ltz v8, :cond_16

    .line 320
    move-object/from16 v0, p0

    iput v8, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->remoteConcurrentStreams:I

    .line 326
    :cond_16
    const/16 v27, 0x7

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->isPersisted(I)Z

    move-result v27

    if-eqz v27, :cond_17

    .line 327
    const/16 v27, 0x7

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->removeValue(I)V

    .line 329
    :cond_17
    const/16 v27, 0x7

    const/16 v28, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v27

    move/from16 v2, v28

    invoke-interface {v0, v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->setPersistValue(IZ)V

    .line 331
    const/16 v27, 0x7

    move-object/from16 v0, v21

    move/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;->getValue(I)I

    move-result v9

    .line 333
    .local v9, "newInitialWindowSize":I
    if-ltz v9, :cond_a

    .line 334
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->updateInitialSendWindowSize(I)V

    goto/16 :goto_2

    .line 337
    .end local v8    # "newConcurrentStreams":I
    .end local v9    # "newInitialWindowSize":I
    .end local v16    # "settingsMinorVersion":I
    .end local v21    # "spdySettingsFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;
    :cond_18
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_1a

    move-object/from16 v19, v7

    .line 348
    check-cast v19, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;

    .line 350
    .local v19, "spdyPingFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;
    invoke-interface/range {v19 .. v19}, Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;->getId()I

    move-result v27

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->isRemoteInitiatedId(I)Z

    move-result v27

    if-eqz v27, :cond_19

    .line 351
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v28

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    move-object/from16 v2, v19

    move-object/from16 v3, v28

    invoke-static {v0, v1, v2, v3}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto/16 :goto_0

    .line 356
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->pings:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v27

    if-eqz v27, :cond_0

    .line 359
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->pings:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    goto/16 :goto_2

    .line 361
    .end local v19    # "spdyPingFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyPingFrame;
    :cond_1a
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_1b

    .line 363
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->receivedGoAwayFrame:Z

    goto/16 :goto_2

    .line 365
    :cond_1b
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_1e

    move-object/from16 v18, v7

    .line 367
    check-cast v18, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .line 368
    .local v18, "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->getStreamId()I

    move-result v26

    .line 371
    .restart local v26    # "streamId":I
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isInvalid()Z

    move-result v27

    if-eqz v27, :cond_1c

    .line 372
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 376
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isRemoteSideClosed(I)Z

    move-result v27

    if-eqz v27, :cond_1d

    .line 377
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->INVALID_STREAM:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 382
    :cond_1d
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isLast()Z

    move-result v27

    if-eqz v27, :cond_a

    .line 383
    const/16 v27, 0x1

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v28

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->halfCloseStream(IZLorg/jboss/netty/channel/ChannelFuture;)V

    goto/16 :goto_2

    .line 386
    .end local v18    # "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .end local v26    # "streamId":I
    :cond_1e
    instance-of v0, v7, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;

    move/from16 v27, v0

    if-eqz v27, :cond_a

    move-object/from16 v24, v7

    .line 398
    check-cast v24, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;

    .line 399
    .restart local v24    # "spdyWindowUpdateFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;->getStreamId()I

    move-result v26

    .line 400
    .restart local v26    # "streamId":I
    invoke-interface/range {v24 .. v24}, Lorg/jboss/netty/handler/codec/spdy/SpdyWindowUpdateFrame;->getDeltaWindowSize()I

    move-result v5

    .line 403
    .restart local v5    # "deltaWindowSize":I
    if-eqz v26, :cond_1f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->isLocalSideClosed(I)Z

    move-result v27

    if-nez v27, :cond_0

    .line 408
    :cond_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->spdySession:Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->getSendWindowSize(I)I

    move-result v27

    const v28, 0x7fffffff

    sub-int v28, v28, v5

    move/from16 v0, v27

    move/from16 v1, v28

    if-le v0, v1, :cond_21

    .line 409
    if-nez v26, :cond_20

    .line 410
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v27

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v28

    sget-object v29, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move-object/from16 v3, v28

    move-object/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueSessionError(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    goto/16 :goto_0

    .line 412
    :cond_20
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v27

    sget-object v28, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->FLOW_CONTROL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move/from16 v3, v26

    move-object/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->issueStreamError(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    goto/16 :goto_0

    .line 417
    :cond_21
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v26

    invoke-direct {v0, v1, v2, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->updateSendWindowSize(Lorg/jboss/netty/channel/ChannelHandlerContext;II)V

    goto/16 :goto_0
.end method

.method public setSessionReceiveWindowSize(I)V
    .locals 2
    .param p1, "sessionReceiveWindowSize"    # I

    .prologue
    .line 86
    if-gez p1, :cond_0

    .line 87
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sessionReceiveWindowSize"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySessionHandler;->initialSessionReceiveWindowSize:I

    .line 96
    return-void
.end method
