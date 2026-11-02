.class final Lorg/jboss/netty/handler/codec/spdy/SpdySession;
.super Ljava/lang/Object;
.source "SpdySession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;,
        Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    }
.end annotation


# static fields
.field private static final STREAM_CLOSED:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;


# instance fields
.field private final activeLocalStreams:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final activeRemoteStreams:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final activeStreams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;",
            ">;"
        }
    .end annotation
.end field

.field private final receiveWindowSize:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final sendWindowSize:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final streamComparator:Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 32
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->STREAM_CLOSED:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "sendWindowSize"    # I
    .param p2, "receiveWindowSize"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeLocalStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeRemoteStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 36
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    .line 37
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;

    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdySession;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->streamComparator:Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;

    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->sendWindowSize:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->receiveWindowSize:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lorg/jboss/netty/handler/codec/spdy/SpdySession;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/codec/spdy/SpdySession;

    .prologue
    .line 30
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    return-object v0
.end method

.method private removeActiveStream(IZ)Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    .locals 3
    .param p1, "streamId"    # I
    .param p2, "remote"    # Z

    .prologue
    .line 87
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 88
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    .line 89
    if-eqz p2, :cond_1

    .line 90
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeRemoteStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 95
    :cond_0
    :goto_0
    return-object v0

    .line 92
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeLocalStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    goto :goto_0
.end method


# virtual methods
.method acceptStream(IBZZIIZ)V
    .locals 9
    .param p1, "streamId"    # I
    .param p2, "priority"    # B
    .param p3, "remoteSideClosed"    # Z
    .param p4, "localSideClosed"    # Z
    .param p5, "sendWindowSize"    # I
    .param p6, "receiveWindowSize"    # I
    .param p7, "remote"    # Z

    .prologue
    .line 72
    if-eqz p3, :cond_0

    if-nez p4, :cond_1

    .line 73
    :cond_0
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;-><init>(BZZII)V

    invoke-interface {v7, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 76
    .local v6, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-nez v6, :cond_1

    .line 77
    if-eqz p7, :cond_2

    .line 78
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeRemoteStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 84
    .end local v6    # "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    :cond_1
    :goto_0
    return-void

    .line 80
    .restart local v6    # "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    :cond_2
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeLocalStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    goto :goto_0
.end method

.method activeStreams()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    new-instance v0, Ljava/util/TreeMap;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->streamComparator:Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamComparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 65
    .local v0, "streams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;>;"
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 66
    return-object v0
.end method

.method closeLocalSide(IZ)V
    .locals 3
    .param p1, "streamId"    # I
    .param p2, "remote"    # Z

    .prologue
    .line 130
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 131
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    .line 132
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->closeLocalSide()V

    .line 133
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->isRemoteSideClosed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->removeActiveStream(IZ)Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 137
    :cond_0
    return-void
.end method

.method closeRemoteSide(IZ)V
    .locals 3
    .param p1, "streamId"    # I
    .param p2, "remote"    # Z

    .prologue
    .line 115
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 116
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    .line 117
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->closeRemoteSide()V

    .line 118
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->isLocalSideClosed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->removeActiveStream(IZ)Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 122
    :cond_0
    return-void
.end method

.method getPendingWrite(I)Lorg/jboss/netty/channel/MessageEvent;
    .locals 7
    .param p1, "streamId"    # I

    .prologue
    const/4 v4, 0x0

    .line 216
    if-nez p1, :cond_2

    .line 217
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 218
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 219
    .local v3, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->getSendWindowSize()I

    move-result v5

    if-lez v5, :cond_0

    .line 220
    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->getPendingWrite()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v1

    .line 221
    .local v1, "evt":Lorg/jboss/netty/channel/MessageEvent;
    if-eqz v1, :cond_0

    move-object v4, v1

    .line 230
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;>;"
    .end local v1    # "evt":Lorg/jboss/netty/channel/MessageEvent;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    :cond_1
    :goto_0
    return-object v4

    .line 229
    :cond_2
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 230
    .restart local v3    # "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->getPendingWrite()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v4

    goto :goto_0
.end method

.method getReceiveWindowSizeLowerBound(I)I
    .locals 4
    .param p1, "streamId"    # I

    .prologue
    const/4 v1, 0x0

    .line 187
    if-nez p1, :cond_1

    .line 192
    :cond_0
    :goto_0
    return v1

    .line 191
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 192
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->getReceiveWindowSizeLowerBound()I

    move-result v1

    goto :goto_0
.end method

.method getSendWindowSize(I)I
    .locals 3
    .param p1, "streamId"    # I

    .prologue
    .line 157
    if-nez p1, :cond_0

    .line 158
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->sendWindowSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    .line 162
    :goto_0
    return v1

    .line 161
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 162
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->getSendWindowSize()I

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method

.method hasReceivedReply(I)Z
    .locals 3
    .param p1, "streamId"    # I

    .prologue
    .line 145
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 146
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->hasReceivedReply()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isActiveStream(I)Z
    .locals 2
    .param p1, "streamId"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method isLocalSideClosed(I)Z
    .locals 3
    .param p1, "streamId"    # I

    .prologue
    .line 125
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 126
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->isLocalSideClosed()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isRemoteSideClosed(I)Z
    .locals 3
    .param p1, "streamId"    # I

    .prologue
    .line 110
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 111
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->isRemoteSideClosed()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method noActiveStreams()Z
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method numActiveStreams(Z)I
    .locals 1
    .param p1, "remote"    # Z

    .prologue
    .line 47
    if-eqz p1, :cond_0

    .line 48
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeRemoteStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 50
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeLocalStreams:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    goto :goto_0
.end method

.method putPendingWrite(ILorg/jboss/netty/channel/MessageEvent;)Z
    .locals 3
    .param p1, "streamId"    # I
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 211
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 212
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->putPendingWrite(Lorg/jboss/netty/channel/MessageEvent;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method receivedReply(I)V
    .locals 3
    .param p1, "streamId"    # I

    .prologue
    .line 150
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 151
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    .line 152
    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->receivedReply()V

    .line 154
    :cond_0
    return-void
.end method

.method removePendingWrite(I)Lorg/jboss/netty/channel/MessageEvent;
    .locals 3
    .param p1, "streamId"    # I

    .prologue
    .line 234
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 235
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->removePendingWrite()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method removeStream(IZ)V
    .locals 4
    .param p1, "streamId"    # I
    .param p2, "remote"    # Z

    .prologue
    .line 99
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->removeActiveStream(IZ)Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    move-result-object v1

    .line 100
    .local v1, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v1, :cond_0

    .line 101
    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->removePendingWrite()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v0

    .line 102
    .local v0, "e":Lorg/jboss/netty/channel/MessageEvent;
    :goto_0
    if-eqz v0, :cond_0

    .line 103
    invoke-interface {v0}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    sget-object v3, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->STREAM_CLOSED:Lorg/jboss/netty/handler/codec/spdy/SpdyProtocolException;

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 104
    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->removePendingWrite()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v0

    goto :goto_0

    .line 107
    .end local v0    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_0
    return-void
.end method

.method updateAllReceiveWindowSizes(I)V
    .locals 3
    .param p1, "deltaWindowSize"    # I

    .prologue
    .line 202
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 203
    .local v1, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->updateReceiveWindowSize(I)I

    .line 204
    if-gez p1, :cond_0

    .line 205
    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->setReceiveWindowSizeLowerBound(I)V

    goto :goto_0

    .line 208
    .end local v1    # "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    :cond_1
    return-void
.end method

.method updateAllSendWindowSizes(I)V
    .locals 3
    .param p1, "deltaWindowSize"    # I

    .prologue
    .line 196
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 197
    .local v1, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->updateSendWindowSize(I)I

    goto :goto_0

    .line 199
    .end local v1    # "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    :cond_0
    return-void
.end method

.method updateReceiveWindowSize(II)I
    .locals 3
    .param p1, "streamId"    # I
    .param p2, "deltaWindowSize"    # I

    .prologue
    .line 175
    if-nez p1, :cond_0

    .line 176
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->receiveWindowSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v1

    .line 183
    :goto_0
    return v1

    .line 179
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 180
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-lez p2, :cond_1

    .line 181
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->setReceiveWindowSizeLowerBound(I)V

    .line 183
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->updateReceiveWindowSize(I)I

    move-result v1

    goto :goto_0

    :cond_2
    const/4 v1, -0x1

    goto :goto_0
.end method

.method updateSendWindowSize(II)I
    .locals 3
    .param p1, "streamId"    # I
    .param p2, "deltaWindowSize"    # I

    .prologue
    .line 166
    if-nez p1, :cond_0

    .line 167
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->sendWindowSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v1

    .line 171
    :goto_0
    return v1

    .line 170
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/SpdySession;->activeStreams:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;

    .line 171
    .local v0, "state":Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;
    if-eqz v0, :cond_1

    invoke-virtual {v0, p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySession$StreamState;->updateSendWindowSize(I)I

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method
