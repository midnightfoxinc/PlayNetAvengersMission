.class public final Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
.super Ljava/lang/Object;
.source "DefaultChannelPool.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$1;,
        Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;,
        Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;,
        Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;",
            ">;"
        }
    .end annotation
.end field

.field private final cleanerPeriod:J

.field private final isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final maxConnectionTTL:I

.field private final maxConnectionTTLDisabled:Z

.field private final maxIdleTime:J

.field private final maxIdleTimeDisabled:Z

.field private final nettyTimer:Lorg/jboss/netty/util/Timer;

.field private final partitions:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;",
            ">;>;"
        }
    .end annotation
.end field

.field private final sslConnectionPoolEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(JIZLorg/jboss/netty/util/Timer;)V
    .locals 9
    .param p1, "maxIdleTime"    # J
    .param p3, "maxConnectionTTL"    # I
    .param p4, "sslConnectionPoolEnabled"    # Z
    .param p5, "nettyTimer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    const-wide v4, 0x7fffffffffffffffL

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    .line 47
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 69
    iput-boolean p4, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->sslConnectionPoolEnabled:Z

    .line 70
    iput-wide p1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxIdleTime:J

    .line 71
    iput p3, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxConnectionTTL:I

    .line 72
    if-gtz p3, :cond_2

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxConnectionTTLDisabled:Z

    .line 73
    iput-object p5, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->nettyTimer:Lorg/jboss/netty/util/Timer;

    .line 74
    const-wide/16 v6, 0x0

    cmp-long v0, p1, v6

    if-gtz v0, :cond_3

    :goto_1
    iput-boolean v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxIdleTimeDisabled:Z

    .line 76
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxConnectionTTLDisabled:Z

    if-eqz v0, :cond_4

    move-wide v0, v4

    :goto_2
    iget-boolean v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxIdleTimeDisabled:Z

    if-eqz v2, :cond_5

    :goto_3
    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->cleanerPeriod:J

    .line 79
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxConnectionTTLDisabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxIdleTimeDisabled:Z

    if-nez v0, :cond_1

    .line 80
    :cond_0
    new-instance v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;-><init>(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$1;)V

    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->scheduleNewIdleChannelDetector(Lorg/jboss/netty/util/TimerTask;)V

    .line 81
    :cond_1
    return-void

    :cond_2
    move v0, v2

    .line 72
    goto :goto_0

    :cond_3
    move v1, v2

    .line 74
    goto :goto_1

    .line 76
    :cond_4
    int-to-long v0, p3

    goto :goto_2

    :cond_5
    move-wide v4, p1

    goto :goto_3
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lorg/jboss/netty/util/Timer;)V
    .locals 7
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p2, "hashedWheelTimer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 58
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getPooledConnectionIdleTimeout()I

    move-result v0

    int-to-long v2, v0

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getConnectionTTL()I

    move-result v4

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAllowPoolingSslConnections()Z

    move-result v5

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;-><init>(JIZLorg/jboss/netty/util/Timer;)V

    .line 62
    return-void
.end method

.method static synthetic access$100(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxIdleTimeDisabled:Z

    return v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)J
    .locals 2
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    .prologue
    .line 42
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxIdleTime:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lorg/jboss/netty/channel/Channel;J)Z
    .locals 2
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
    .param p1, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "x2"    # J

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isTTLExpired(Lorg/jboss/netty/channel/Channel;J)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->LOGGER:Lorg/slf4j/Logger;

    return-object v0
.end method

.method static synthetic access$500(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lorg/jboss/netty/channel/Channel;)V
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
    .param p1, "x1"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->close(Lorg/jboss/netty/channel/Channel;)V

    return-void
.end method

.method static synthetic access$600(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$700(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$800(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$900(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lorg/jboss/netty/util/TimerTask;)V
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
    .param p1, "x1"    # Lorg/jboss/netty/util/TimerTask;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->scheduleNewIdleChannelDetector(Lorg/jboss/netty/util/TimerTask;)V

    return-void
.end method

.method private close(Lorg/jboss/netty/channel/Channel;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 306
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->setDiscard(Lorg/jboss/netty/channel/Channel;)V

    .line 307
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 309
    return-void
.end method

.method private flushPartition(Ljava/lang/String;Ljava/util/concurrent/ConcurrentLinkedQueue;)V
    .locals 3
    .param p1, "partitionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 312
    .local p2, "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    if-eqz p2, :cond_0

    .line 313
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    invoke-virtual {p2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    .line 315
    .local v1, "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    iget-object v2, v1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-direct {p0, v2}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->close(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0

    .line 317
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    :cond_0
    return-void
.end method

.method private getPartition(Ljava/lang/String;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 3
    .param p1, "partitionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 233
    .local v1, "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    if-nez v1, :cond_0

    .line 235
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 236
    .local v0, "newPartition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 237
    .restart local v1    # "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    if-nez v1, :cond_0

    .line 238
    move-object v1, v0

    .line 240
    .end local v0    # "newPartition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :cond_0
    return-object v1
.end method

.method private isTTLExpired(Lorg/jboss/netty/channel/Channel;J)Z
    .locals 6
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "now"    # J

    .prologue
    const/4 v1, 0x0

    .line 121
    iget-boolean v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxConnectionTTLDisabled:Z

    if-eqz v2, :cond_1

    .line 125
    :cond_0
    :goto_0
    return v1

    .line 124
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;

    .line 125
    .local v0, "creation":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;
    if-eqz v0, :cond_0

    iget-wide v2, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;->creationTime:J

    sub-long v2, p2, v2

    iget v4, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->maxConnectionTTL:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private scheduleNewIdleChannelDetector(Lorg/jboss/netty/util/TimerTask;)V
    .locals 4
    .param p1, "task"    # Lorg/jboss/netty/util/TimerTask;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->nettyTimer:Lorg/jboss/netty/util/Timer;

    iget-wide v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->cleanerPeriod:J

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p1, v2, v3, v1}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    .line 85
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 6

    .prologue
    .line 292
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 302
    :goto_0
    return-void

    .line 295
    :cond_0
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 296
    .local v3, "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    .line 297
    .local v2, "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    iget-object v4, v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-direct {p0, v4}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->close(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_1

    .line 300
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    .end local v3    # "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :cond_2
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 301
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    goto :goto_0
.end method

.method public flushPartition(Ljava/lang/String;)V
    .locals 1
    .param p1, "partitionId"    # Ljava/lang/String;

    .prologue
    .line 321
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->flushPartition(Ljava/lang/String;Ljava/util/concurrent/ConcurrentLinkedQueue;)V

    .line 322
    return-void
.end method

.method public flushPartitions(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;)V
    .locals 4
    .param p1, "selector"    # Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;

    .prologue
    .line 327
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 328
    .local v2, "partitionsEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 329
    .local v1, "partitionId":Ljava/lang/String;
    invoke-interface {p1, v1}, Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;->select(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 330
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {p0, v1, v3}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->flushPartition(Ljava/lang/String;Ljava/util/concurrent/ConcurrentLinkedQueue;)V

    goto :goto_0

    .line 332
    .end local v1    # "partitionId":Ljava/lang/String;
    .end local v2    # "partitionsEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;>;"
    :cond_1
    return-void
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public offer(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)Z
    .locals 6
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "partition"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 244
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->sslConnectionPoolEnabled:Z

    if-nez v1, :cond_1

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v1

    const-class v4, Lorg/jboss/netty/handler/ssl/SslHandler;

    invoke-interface {v1, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 256
    :cond_0
    :goto_0
    return v0

    .line 247
    :cond_1
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v2

    .line 249
    .local v2, "now":J
    invoke-direct {p0, p1, v2, v3}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isTTLExpired(Lorg/jboss/netty/channel/Channel;J)Z

    move-result v1

    if-nez v1, :cond_0

    .line 252
    invoke-direct {p0, p2}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->getPartition(Ljava/lang/String;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v1

    new-instance v4, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    invoke-direct {v4, p1, v2, v3}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;-><init>(Lorg/jboss/netty/channel/Channel;J)V

    invoke-virtual {v1, v4}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    move-result v0

    .line 253
    .local v0, "added":Z
    if-eqz v0, :cond_0

    .line 254
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;

    invoke-direct {v5, v2, v3, p2}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;-><init>(JLjava/lang/String;)V

    invoke-virtual {v1, v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public poll(Ljava/lang/String;)Lorg/jboss/netty/channel/Channel;
    .locals 4
    .param p1, "partitionId"    # Ljava/lang/String;

    .prologue
    .line 261
    const/4 v0, 0x0

    .line 262
    .local v0, "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 263
    .local v1, "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    if-eqz v1, :cond_1

    .line 264
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 265
    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    check-cast v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    .line 267
    .restart local v0    # "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    if-nez v0, :cond_2

    .line 276
    :cond_1
    if-eqz v0, :cond_3

    iget-object v2, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    :goto_1
    return-object v2

    .line 270
    :cond_2
    iget-object v2, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 271
    const/4 v0, 0x0

    .line 272
    sget-object v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Channel not connected or not opened, probably remotely closed!"

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    goto :goto_0

    .line 276
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public removeAll(Lorg/jboss/netty/channel/Channel;)Z
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 281
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->channelId2Creation:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;

    .line 282
    .local v0, "creation":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->partitions:Ljava/util/concurrent/ConcurrentHashMap;

    iget-object v2, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$ChannelCreation;->partition:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
