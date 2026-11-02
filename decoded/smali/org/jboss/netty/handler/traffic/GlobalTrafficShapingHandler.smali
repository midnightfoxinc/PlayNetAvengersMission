.class public Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;
.super Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
.source "GlobalTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;,
        Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    }
.end annotation

.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# instance fields
.field private final channelQueues:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;",
            ">;"
        }
    .end annotation
.end field

.field maxGlobalWriteSize:J

.field private queuesSize:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;)V
    .locals 2
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 169
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 170
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 171
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;J)V
    .locals 3
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "checkInterval"    # J

    .prologue
    .line 163
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;J)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 164
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 165
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJ)V
    .locals 3
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J

    .prologue
    .line 157
    invoke-direct/range {p0 .. p6}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJ)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 158
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 159
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJ)V
    .locals 3
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "checkInterval"    # J

    .prologue
    .line 142
    invoke-direct/range {p0 .. p8}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJ)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 144
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 145
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 3
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "checkInterval"    # J
    .param p9, "maxTime"    # J

    .prologue
    .line 150
    invoke-direct/range {p0 .. p10}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 152
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 153
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 135
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 136
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 137
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;J)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "checkInterval"    # J

    .prologue
    .line 130
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;J)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 131
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 132
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJ)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J

    .prologue
    .line 125
    invoke-direct/range {p0 .. p5}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJ)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 126
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 127
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJ)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J
    .param p6, "checkInterval"    # J

    .prologue
    .line 113
    invoke-direct/range {p0 .. p7}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJJ)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 114
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 115
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J
    .param p6, "checkInterval"    # J
    .param p8, "maxTime"    # J

    .prologue
    .line 119
    invoke-direct/range {p0 .. p9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 78
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 89
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 120
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->createGlobalTrafficCounter()V

    .line 121
    return-void
.end method

.method static synthetic access$200(Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;J)V
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;
    .param p1, "x1"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x2"    # Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    .param p3, "x3"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 77
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->sendAllValid(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;J)V

    return-void
.end method

.method private declared-synchronized getOrSetPerChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 197
    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 198
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    .line 199
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    if-nez v1, :cond_0

    .line 200
    new-instance v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    .end local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;-><init>(Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$1;)V

    .line 201
    .restart local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    .line 202
    iput-object p1, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 203
    const-wide/16 v2, 0x0

    iput-wide v2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->queueSize:J

    .line 204
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    iput-wide v2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    .line 205
    iget-wide v2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    iput-wide v2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    .line 206
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0, v1}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 208
    :cond_0
    monitor-exit p0

    return-object v1

    .line 197
    .end local v0    # "key":Ljava/lang/Integer;
    .end local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private sendAllValid(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;J)V
    .locals 9
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "perChannel"    # Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    .param p3, "now"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 310
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 311
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v4

    if-nez v4, :cond_0

    .line 340
    :goto_0
    return-void

    .line 315
    :cond_0
    monitor-enter p2

    .line 316
    :goto_1
    :try_start_0
    iget-object v4, p2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 317
    iget-object v4, p2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;

    .line 318
    .local v1, "newToSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    iget-wide v4, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;->relativeTimeAction:J

    cmp-long v4, v4, p3

    if-gtz v4, :cond_5

    .line 319
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v4

    if-nez v4, :cond_3

    .line 336
    .end local v1    # "newToSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    :cond_1
    :goto_2
    iget-object v4, p2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 337
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->releaseWriteSuspended(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 339
    :cond_2
    monitor-exit p2

    goto :goto_0

    :catchall_0
    move-exception v4

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 323
    .restart local v1    # "newToSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    :cond_3
    :try_start_1
    iget-wide v2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;->size:J

    .line 324
    .local v2, "size":J
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v4, :cond_4

    .line 325
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 327
    :cond_4
    iget-wide v4, p2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->queueSize:J

    sub-long/2addr v4, v2

    iput-wide v4, p2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->queueSize:J

    .line 328
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v6, v2

    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 329
    iget-object v4, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {p1, v4}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 330
    iput-wide p3, p2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    goto :goto_1

    .line 332
    .end local v2    # "size":J
    :cond_5
    iget-object v4, p2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method


# virtual methods
.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 352
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 353
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    .line 354
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    if-eqz v1, :cond_0

    .line 355
    monitor-enter v1

    .line 356
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    iget-wide v4, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->queueSize:J

    neg-long v4, v4

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 357
    iget-object v2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 358
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 361
    return-void

    .line 358
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 345
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->getOrSetPerChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    .line 346
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 347
    return-void
.end method

.method checkWaitReadTime(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)J
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "wait"    # J
    .param p4, "now"    # J

    .prologue
    .line 225
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 226
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    .line 227
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    if-eqz v1, :cond_0

    .line 228
    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxTime:J

    cmp-long v2, p2, v2

    if-lez v2, :cond_0

    add-long v2, p4, p2

    iget-wide v4, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    sub-long/2addr v2, v4

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 229
    iget-wide p2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxTime:J

    .line 232
    :cond_0
    return-wide p2
.end method

.method createGlobalTrafficCounter()V
    .locals 6

    .prologue
    .line 103
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    if-eqz v1, :cond_0

    .line 104
    new-instance v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    const-string v3, "GlobalTC"

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->checkInterval:J

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/traffic/TrafficCounter;-><init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/util/Timer;Ljava/lang/String;J)V

    .line 106
    .local v0, "tc":Lorg/jboss/netty/handler/traffic/TrafficCounter;
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->setTrafficCounter(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    .line 107
    invoke-virtual {v0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->start()V

    .line 109
    .end local v0    # "tc":Lorg/jboss/netty/handler/traffic/TrafficCounter;
    :cond_0
    return-void
.end method

.method public getMaxGlobalWriteSize()J
    .locals 2

    .prologue
    .line 177
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    return-wide v0
.end method

.method informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "now"    # J

    .prologue
    .line 236
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 237
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    .line 238
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    if-eqz v1, :cond_0

    .line 239
    iput-wide p2, v1, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    .line 241
    :cond_0
    return-void
.end method

.method public queuesSize()J
    .locals 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public releaseExternalResources()V
    .locals 8

    .prologue
    .line 365
    iget-object v5, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    .line 366
    .local v3, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    if-eqz v3, :cond_0

    iget-object v5, v3, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-eqz v5, :cond_0

    iget-object v5, v3, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 367
    iget-object v5, v3, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v5}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 368
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    monitor-enter v3

    .line 369
    :try_start_0
    iget-object v5, v3, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;

    .line 370
    .local v4, "toSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v5

    if-nez v5, :cond_2

    .line 376
    .end local v4    # "toSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    :cond_1
    iget-object v5, v3, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 377
    monitor-exit v3

    goto :goto_0

    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v5

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 374
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "toSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    :cond_2
    :try_start_1
    iget-object v5, v3, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v6, v4, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v5, v6}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 380
    .end local v0    # "channel":Lorg/jboss/netty/channel/Channel;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    .end local v4    # "toSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    :cond_3
    iget-object v5, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 381
    iget-object v5, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v6, 0x0

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 382
    invoke-super {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->releaseExternalResources()V

    .line 383
    return-void
.end method

.method public setMaxGlobalWriteSize(J)V
    .locals 1
    .param p1, "maxGlobalWriteSize"    # J

    .prologue
    .line 186
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 187
    return-void
.end method

.method submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V
    .locals 19
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .param p3, "size"    # J
    .param p5, "writedelay"    # J
    .param p7, "now"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 247
    invoke-direct/range {p0 .. p1}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->getOrSetPerChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;

    move-result-object v14

    .line 250
    .local v14, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    const/4 v11, 0x0

    .line 251
    .local v11, "globalSizeExceeded":Z
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v10

    .line 252
    .local v10, "channel":Lorg/jboss/netty/channel/Channel;
    monitor-enter v14

    .line 253
    const-wide/16 v4, 0x0

    cmp-long v3, p5, v4

    if-nez v3, :cond_2

    :try_start_0
    iget-object v3, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 254
    invoke-interface {v10}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_0

    .line 256
    monitor-exit v14

    .line 306
    :goto_0
    return-void

    .line 258
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v3, :cond_1

    .line 259
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 261
    :cond_1
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 262
    move-wide/from16 v0, p7

    iput-wide v0, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    .line 263
    monitor-exit v14

    goto :goto_0

    .line 295
    :catchall_0
    move-exception v3

    monitor-exit v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 265
    :cond_2
    move-wide/from16 v12, p5

    .line 266
    .local v12, "delay":J
    :try_start_1
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxTime:J

    cmp-long v3, v12, v4

    if-lez v3, :cond_3

    add-long v4, p7, v12

    iget-wide v0, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    move-wide/from16 v16, v0

    sub-long v4, v4, v16

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxTime:J

    move-wide/from16 v16, v0

    cmp-long v3, v4, v16

    if-lez v3, :cond_3

    .line 267
    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxTime:J

    .line 269
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    if-nez v3, :cond_6

    .line 271
    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V

    .line 272
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_4

    .line 274
    monitor-exit v14

    goto :goto_0

    .line 276
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v3, :cond_5

    .line 277
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 279
    :cond_5
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 280
    move-wide/from16 v0, p7

    iput-wide v0, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    .line 281
    monitor-exit v14

    goto :goto_0

    .line 283
    :cond_6
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_7

    .line 285
    monitor-exit v14

    goto :goto_0

    .line 287
    :cond_7
    new-instance v2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;

    add-long v3, v12, p7

    const/4 v8, 0x0

    move-object/from16 v5, p2

    move-wide/from16 v6, p3

    invoke-direct/range {v2 .. v8}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;-><init>(JLorg/jboss/netty/channel/MessageEvent;JLorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$1;)V

    .line 288
    .local v2, "newToSend":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;
    iget-object v3, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    iget-wide v4, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->queueSize:J

    add-long v4, v4, p3

    iput-wide v4, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->queueSize:J

    .line 290
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 291
    iget-wide v8, v14, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;->queueSize:J

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-wide v6, v12

    invoke-virtual/range {v4 .. v9}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->checkWriteSuspend(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)V

    .line 292
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->maxGlobalWriteSize:J

    move-wide/from16 v16, v0

    cmp-long v3, v4, v16

    if-lez v3, :cond_8

    .line 293
    const/4 v11, 0x1

    .line 295
    :cond_8
    monitor-exit v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 296
    if-eqz v11, :cond_9

    .line 297
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->setWritable(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 299
    :cond_9
    iget-wide v8, v2, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;->relativeTimeAction:J

    .line 300
    .local v8, "futureNow":J
    move-object v7, v14

    .line 301
    .local v7, "forSchedule":Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v4, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$1;

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v9}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$1;-><init>(Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;J)V

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v12, v13, v5}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    goto/16 :goto_0
.end method
