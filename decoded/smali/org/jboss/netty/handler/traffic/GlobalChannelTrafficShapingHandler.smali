.class public Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;
.super Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
.source "GlobalChannelTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;,
        Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    }
.end annotation

.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field private static final DEFAULT_ACCELERATION:F = -0.1f

.field private static final DEFAULT_DEVIATION:F = 0.1f

.field private static final DEFAULT_SLOWDOWN:F = 0.4f

.field private static final MAX_DEVIATION:F = 0.4f

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private volatile accelerationFactor:F

.field final channelQueues:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;",
            ">;"
        }
    .end annotation
.end field

.field private final cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private volatile maxDeviation:F

.field maxGlobalWriteSize:J

.field private final queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

.field private volatile readChannelLimit:J

.field private volatile readDeviationActive:Z

.field private volatile slowDownFactor:F

.field private volatile writeChannelLimit:J

.field private volatile writeDeviationActive:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 89
    const-class v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;)V
    .locals 2
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 359
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;)V

    .line 94
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 360
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 361
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;J)V
    .locals 3
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "checkInterval"    # J

    .prologue
    .line 349
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;J)V

    .line 94
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 350
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 351
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 3
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "writeChannelLimit"    # J
    .param p9, "readChannelLimit"    # J

    .prologue
    .line 333
    invoke-direct/range {p0 .. p6}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJ)V

    .line 94
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 334
    iput-wide p7, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 335
    iput-wide p9, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 336
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 337
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJJ)V
    .locals 13
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "writeChannelLimit"    # J
    .param p9, "readChannelLimit"    # J
    .param p11, "checkInterval"    # J

    .prologue
    .line 312
    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-wide/from16 v6, p3

    move-wide/from16 v8, p5

    move-wide/from16 v10, p11

    invoke-direct/range {v3 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJ)V

    .line 94
    new-instance v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v2, 0x19000000

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 313
    move-wide/from16 v0, p7

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 314
    move-wide/from16 v0, p9

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 315
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 316
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJJJ)V
    .locals 15
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "writeChannelLimit"    # J
    .param p9, "readChannelLimit"    # J
    .param p11, "checkInterval"    # J
    .param p13, "maxTime"    # J

    .prologue
    .line 288
    move-object v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-wide/from16 v6, p3

    move-wide/from16 v8, p5

    move-wide/from16 v10, p11

    move-wide/from16 v12, p13

    invoke-direct/range {v3 .. v13}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 94
    new-instance v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v2, 0x19000000

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 289
    move-wide/from16 v0, p7

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 290
    move-wide/from16 v0, p9

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 291
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 292
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 264
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;)V

    .line 94
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 265
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 266
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;J)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "checkInterval"    # J

    .prologue
    .line 253
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;J)V

    .line 94
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 254
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 255
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeGlobalLimit"    # J
    .param p4, "readGlobalLimit"    # J
    .param p6, "writeChannelLimit"    # J
    .param p8, "readChannelLimit"    # J

    .prologue
    .line 237
    invoke-direct/range {p0 .. p5}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJ)V

    .line 94
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v0, 0x19000000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 238
    iput-wide p6, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 239
    iput-wide p8, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 240
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 241
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJJJ)V
    .locals 10
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeGlobalLimit"    # J
    .param p4, "readGlobalLimit"    # J
    .param p6, "writeChannelLimit"    # J
    .param p8, "readChannelLimit"    # J
    .param p10, "checkInterval"    # J

    .prologue
    .line 214
    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    move-wide v6, p4

    move-wide/from16 v8, p10

    invoke-direct/range {v2 .. v9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJJ)V

    .line 94
    new-instance v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v2, 0x19000000

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 215
    move-wide/from16 v0, p6

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 216
    move-wide/from16 v0, p8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 217
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 218
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJJJJ)V
    .locals 12
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeGlobalLimit"    # J
    .param p4, "readGlobalLimit"    # J
    .param p6, "writeChannelLimit"    # J
    .param p8, "readChannelLimit"    # J
    .param p10, "checkInterval"    # J
    .param p12, "maxTime"    # J

    .prologue
    .line 187
    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    move-wide/from16 v6, p4

    move-wide/from16 v8, p10

    move-wide/from16 v10, p12

    invoke-direct/range {v2 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 94
    new-instance v2, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v2}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    .line 99
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 109
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 115
    const-wide/32 v2, 0x19000000

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 188
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V

    .line 189
    move-wide/from16 v0, p6

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 190
    move-wide/from16 v0, p8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 191
    return-void
.end method

.method static synthetic access$100(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;J)V
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;
    .param p1, "x1"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x2"    # Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .param p3, "x3"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 88
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->sendAllValid(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;J)V

    return-void
.end method

.method private computeBalancedWait(FFJ)J
    .locals 5
    .param p1, "maxLocal"    # F
    .param p2, "maxGlobal"    # F
    .param p3, "wait"    # J

    .prologue
    .line 446
    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-nez v1, :cond_0

    move-wide v2, p3

    .line 464
    :goto_0
    return-wide v2

    .line 450
    :cond_0
    div-float v0, p1, p2

    .line 452
    .local v0, "ratio":F
    iget v1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxDeviation:F

    cmpl-float v1, v0, v1

    if-lez v1, :cond_3

    .line 453
    const/high16 v1, 0x3f800000    # 1.0f

    iget v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxDeviation:F

    sub-float/2addr v1, v2

    cmpg-float v1, v0, v1

    if-gez v1, :cond_1

    move-wide v2, p3

    .line 454
    goto :goto_0

    .line 456
    :cond_1
    iget v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->slowDownFactor:F

    .line 457
    const-wide/16 v2, 0xa

    cmp-long v1, p3, v2

    if-gez v1, :cond_2

    .line 458
    const-wide/16 p3, 0xa

    .line 464
    :cond_2
    :goto_1
    long-to-float v1, p3

    mul-float/2addr v1, v0

    float-to-long v2, v1

    goto :goto_0

    .line 462
    :cond_3
    iget v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->accelerationFactor:F

    goto :goto_1
.end method

.method private computeDeviationCumulativeBytes()V
    .locals 18

    .prologue
    .line 412
    const-wide/16 v6, 0x0

    .line 413
    .local v6, "maxWrittenBytes":J
    const-wide/16 v4, 0x0

    .line 414
    .local v4, "maxReadBytes":J
    const-wide v10, 0x7fffffffffffffffL

    .line 415
    .local v10, "minWrittenBytes":J
    const-wide v8, 0x7fffffffffffffffL

    .line 416
    .local v8, "minReadBytes":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v13}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 417
    .local v12, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    iget-object v13, v12, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v13}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->getCumulativeWrittenBytes()J

    move-result-wide v14

    .line 418
    .local v14, "value":J
    cmp-long v13, v6, v14

    if-gez v13, :cond_1

    .line 419
    move-wide v6, v14

    .line 421
    :cond_1
    cmp-long v13, v10, v14

    if-lez v13, :cond_2

    .line 422
    move-wide v10, v14

    .line 424
    :cond_2
    iget-object v13, v12, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v13}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->getCumulativeReadBytes()J

    move-result-wide v14

    .line 425
    cmp-long v13, v4, v14

    if-gez v13, :cond_3

    .line 426
    move-wide v4, v14

    .line 428
    :cond_3
    cmp-long v13, v8, v14

    if-lez v13, :cond_0

    .line 429
    move-wide v8, v14

    goto :goto_0

    .line 432
    .end local v12    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .end local v14    # "value":J
    :cond_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v13}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v13

    const/16 v16, 0x1

    move/from16 v0, v16

    if-le v13, v0, :cond_5

    const/4 v3, 0x1

    .line 433
    .local v3, "multiple":Z
    :goto_1
    if-eqz v3, :cond_6

    const-wide/16 v16, 0x2

    div-long v16, v4, v16

    cmp-long v13, v8, v16

    if-gez v13, :cond_6

    const/4 v13, 0x1

    :goto_2
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readDeviationActive:Z

    .line 434
    if-eqz v3, :cond_7

    const-wide/16 v16, 0x2

    div-long v16, v6, v16

    cmp-long v13, v10, v16

    if-gez v13, :cond_7

    const/4 v13, 0x1

    :goto_3
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeDeviationActive:Z

    .line 435
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v13, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 436
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v13, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 437
    return-void

    .line 432
    .end local v3    # "multiple":Z
    :cond_5
    const/4 v3, 0x0

    goto :goto_1

    .line 433
    .restart local v3    # "multiple":Z
    :cond_6
    const/4 v13, 0x0

    goto :goto_2

    .line 434
    :cond_7
    const/4 v13, 0x0

    goto :goto_3
.end method

.method private getOrSetPerChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .locals 9
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 553
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v6

    .line 554
    .local v6, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 555
    .local v7, "key":Ljava/lang/Integer;
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, v7}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 556
    .local v8, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    if-nez v8, :cond_0

    .line 557
    new-instance v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .end local v8    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    invoke-direct {v8}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;-><init>()V

    .line 558
    .restart local v8    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    .line 560
    new-instance v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;

    const/4 v2, 0x0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ChannelTC"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->checkInterval:J

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/traffic/TrafficCounter;-><init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/util/Timer;Ljava/lang/String;J)V

    iput-object v0, v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .line 562
    const-wide/16 v0, 0x0

    iput-wide v0, v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->queueSize:J

    .line 563
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v0

    iput-wide v0, v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    .line 564
    iget-wide v0, v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    iput-wide v0, v8, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    .line 565
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, v7, v8}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    :cond_0
    return-object v8
.end method

.method private sendAllValid(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;J)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "perChannel"    # Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .param p3, "now"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 852
    monitor-enter p2

    .line 853
    :goto_0
    :try_start_0
    iget-object v1, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 854
    iget-object v1, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;

    .line 855
    .local v0, "newToSend":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;
    iget-wide v4, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;->relativeTimeAction:J

    cmp-long v1, v4, p3

    if-gtz v1, :cond_3

    .line 856
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v1

    if-nez v1, :cond_2

    .line 872
    .end local v0    # "newToSend":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;
    :cond_0
    :goto_1
    iget-object v1, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 873
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->releaseWriteSuspended(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 875
    :cond_1
    monitor-exit p2

    .line 876
    return-void

    .line 860
    .restart local v0    # "newToSend":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;
    :cond_2
    iget-wide v2, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;->size:J

    .line 861
    .local v2, "size":J
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 862
    iget-object v1, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v1, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 863
    iget-wide v4, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->queueSize:J

    sub-long/2addr v4, v2

    iput-wide v4, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->queueSize:J

    .line 864
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v4, v2

    invoke-virtual {v1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 865
    iget-object v1, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {p1, v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 866
    iput-wide p3, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    goto :goto_0

    .line 875
    .end local v0    # "newToSend":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;
    .end local v2    # "size":J
    :catchall_0
    move-exception v1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 868
    .restart local v0    # "newToSend":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;
    :cond_3
    :try_start_1
    iget-object v1, p2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v1, v4, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method


# virtual methods
.method public accelerationFactor()F
    .locals 1

    .prologue
    .line 374
    iget v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->accelerationFactor:F

    return v0
.end method

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
    .line 579
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetCumulativeTime()V

    .line 580
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 581
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 582
    .local v1, "key":Ljava/lang/Integer;
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 583
    .local v2, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    if-eqz v2, :cond_0

    .line 585
    monitor-enter v2

    .line 586
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    iget-wide v4, v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->queueSize:J

    neg-long v4, v4

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 587
    iget-object v3, v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 588
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 590
    :cond_0
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->releaseWriteSuspended(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 591
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->releaseReadSuspended(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 592
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 593
    return-void

    .line 588
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 572
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->getOrSetPerChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 573
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetCumulativeTime()V

    .line 574
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 575
    return-void
.end method

.method public channelTrafficCounters()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jboss/netty/handler/traffic/TrafficCounter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 718
    new-instance v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;

    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;-><init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;)V

    .line 737
    .local v0, "valueCollection":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jboss/netty/handler/traffic/TrafficCounter;>;"
    return-object v0
.end method

.method protected checkWaitReadTime(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)J
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "wait"    # J
    .param p4, "now"    # J

    .prologue
    .line 674
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 675
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 676
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    if-eqz v1, :cond_0

    .line 677
    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    cmp-long v2, p2, v2

    if-lez v2, :cond_0

    add-long v2, p4, p2

    iget-wide v4, v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    sub-long/2addr v2, v4

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 678
    iget-wide p2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    .line 681
    :cond_0
    return-wide p2
.end method

.method public configureChannel(JJ)V
    .locals 5
    .param p1, "newWriteLimit"    # J
    .param p3, "newReadLimit"    # J

    .prologue
    .line 500
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 501
    iput-wide p3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 502
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    .line 503
    .local v2, "now":J
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 504
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    iget-object v4, v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    goto :goto_0

    .line 506
    .end local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    :cond_0
    return-void
.end method

.method createGlobalTrafficCounter(Lorg/jboss/netty/util/Timer;)V
    .locals 6
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 150
    const v1, 0x3dcccccd    # 0.1f

    const v2, 0x3ecccccd    # 0.4f

    const v3, -0x42333333    # -0.1f

    invoke-virtual {p0, v1, v2, v3}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->setMaxDeviation(FFF)V

    .line 151
    if-nez p1, :cond_0

    .line 152
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Timer must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 154
    :cond_0
    new-instance v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;

    const-string v3, "GlobalChannelTC"

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->checkInterval:J

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficCounter;-><init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/util/Timer;Ljava/lang/String;J)V

    .line 155
    .local v0, "tc":Lorg/jboss/netty/handler/traffic/TrafficCounter;
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->setTrafficCounter(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    .line 156
    invoke-virtual {v0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->start()V

    .line 157
    return-void
.end method

.method protected doAccounting(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V
    .locals 0
    .param p1, "counter"    # Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .prologue
    .line 441
    invoke-direct {p0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->computeDeviationCumulativeBytes()V

    .line 442
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->doAccounting(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    .line 443
    return-void
.end method

.method public getMaxGlobalWriteSize()J
    .locals 2

    .prologue
    .line 471
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    return-wide v0
.end method

.method public getReadChannelLimit()J
    .locals 2

    .prologue
    .line 530
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    return-wide v0
.end method

.method public getWriteChannelLimit()J
    .locals 2

    .prologue
    .line 512
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    return-wide v0
.end method

.method protected informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "now"    # J

    .prologue
    .line 686
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 687
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 688
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    if-eqz v1, :cond_0

    .line 689
    iput-wide p2, v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastReadTimestamp:J

    .line 691
    :cond_0
    return-void
.end method

.method public maxDeviation()F
    .locals 1

    .prologue
    .line 367
    iget v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxDeviation:F

    return v0
.end method

.method protected maximumCumulativeReadBytes()J
    .locals 2

    .prologue
    .line 710
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method protected maximumCumulativeWrittenBytes()J
    .locals 2

    .prologue
    .line 706
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 22
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 598
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v10

    .line 600
    .local v10, "now":J
    :try_start_0
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->checkAttachment(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    move-result-object v18

    .line 601
    .local v18, "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->calculateSize(Ljava/lang/Object;)J

    move-result-wide v4

    .line 602
    .local v4, "size":J
    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_9

    .line 605
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->getReadLimit()J

    move-result-wide v6

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    invoke-virtual/range {v3 .. v11}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readTimeToWait(JJJJ)J

    move-result-wide v20

    .line 606
    .local v20, "waitGlobal":J
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 607
    .local v12, "key":Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v12}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 608
    .local v13, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    const-wide/16 v8, 0x0

    .line 609
    .local v8, "wait":J
    if-eqz v13, :cond_2

    .line 610
    iget-object v3, v13, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    .end local v8    # "wait":J
    invoke-virtual/range {v3 .. v11}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readTimeToWait(JJJJ)J

    move-result-wide v8

    .line 611
    .restart local v8    # "wait":J
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readDeviationActive:Z

    if-eqz v3, :cond_2

    .line 613
    const-wide/16 v16, 0x0

    .line 614
    .local v16, "maxLocalRead":J
    iget-object v3, v13, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->getCumulativeReadBytes()J

    move-result-wide v16

    .line 615
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 616
    .local v14, "maxGlobalRead":J
    const-wide/16 v6, 0x0

    cmp-long v3, v16, v6

    if-gtz v3, :cond_0

    .line 617
    const-wide/16 v16, 0x0

    .line 619
    :cond_0
    cmp-long v3, v14, v16

    if-gez v3, :cond_1

    .line 620
    move-wide/from16 v14, v16

    .line 622
    :cond_1
    move-wide/from16 v0, v16

    long-to-float v3, v0

    long-to-float v6, v14

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v6, v8, v9}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->computeBalancedWait(FFJ)J

    move-result-wide v8

    .line 625
    .end local v14    # "maxGlobalRead":J
    .end local v16    # "maxLocalRead":J
    :cond_2
    cmp-long v3, v8, v20

    if-gez v3, :cond_3

    .line 626
    move-wide/from16 v8, v20

    :cond_3
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    .line 628
    invoke-virtual/range {v6 .. v11}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->checkWaitReadTime(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)J

    move-result-wide v8

    .line 629
    const-wide/16 v6, 0xa

    cmp-long v3, v8, v6

    if-ltz v3, :cond_9

    .line 631
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_4

    .line 666
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10, v11}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    .line 668
    .end local v8    # "wait":J
    .end local v12    # "key":Ljava/lang/Integer;
    .end local v13    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .end local v20    # "waitGlobal":J
    :goto_0
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 670
    return-void

    .line 634
    .restart local v8    # "wait":J
    .restart local v12    # "key":Ljava/lang/Integer;
    .restart local v13    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .restart local v20    # "waitGlobal":J
    :cond_4
    :try_start_1
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    .line 635
    .local v2, "channel":Lorg/jboss/netty/channel/Channel;
    if-eqz v2, :cond_9

    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 637
    sget-object v3, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 638
    sget-object v3, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Read suspend: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v18

    iget-boolean v7, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 641
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    if-nez v3, :cond_6

    .line 644
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 666
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10, v11}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto :goto_0

    .line 647
    :cond_6
    :try_start_2
    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v3

    if-eqz v3, :cond_9

    move-object/from16 v0, v18

    iget-boolean v3, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    if-nez v3, :cond_9

    .line 648
    const/4 v3, 0x1

    move-object/from16 v0, v18

    iput-boolean v3, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    .line 649
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    .line 650
    sget-object v3, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 651
    sget-object v3, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Suspend final status => "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v18

    iget-boolean v7, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 656
    :cond_7
    move-object/from16 v0, v18

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->reopenReadTimerTask:Lorg/jboss/netty/util/TimerTask;

    if-nez v3, :cond_8

    .line 657
    new-instance v3, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v3, v0, v1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;-><init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    move-object/from16 v0, v18

    iput-object v3, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->reopenReadTimerTask:Lorg/jboss/netty/util/TimerTask;

    .line 659
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    move-object/from16 v0, v18

    iget-object v6, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->reopenReadTimerTask:Lorg/jboss/netty/util/TimerTask;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v6, v8, v9, v7}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->timeout:Lorg/jboss/netty/util/Timeout;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 666
    .end local v2    # "channel":Lorg/jboss/netty/channel/Channel;
    .end local v8    # "wait":J
    .end local v12    # "key":Ljava/lang/Integer;
    .end local v13    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .end local v20    # "waitGlobal":J
    :cond_9
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10, v11}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto/16 :goto_0

    .end local v4    # "size":J
    .end local v18    # "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    :catchall_0
    move-exception v3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v10, v11}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    .line 668
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 666
    throw v3
.end method

.method public queuesSize()J
    .locals 2

    .prologue
    .line 492
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public final release()V
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->stop()V

    .line 549
    return-void
.end method

.method public setMaxDeviation(FFF)V
    .locals 3
    .param p1, "maxDeviation"    # F
    .param p2, "slowDownFactor"    # F
    .param p3, "accelerationFactor"    # F

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 396
    const v0, 0x3ecccccd    # 0.4f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 397
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxDeviation must be <= 0.4"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 399
    :cond_0
    cmpg-float v0, p2, v1

    if-gez v0, :cond_1

    .line 400
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "slowDownFactor must be >= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 402
    :cond_1
    cmpl-float v0, p3, v1

    if-lez v0, :cond_2

    .line 403
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "accelerationFactor must be <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 405
    :cond_2
    iput p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxDeviation:F

    .line 406
    add-float v0, v2, p3

    iput v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->accelerationFactor:F

    .line 407
    add-float v0, v2, p2

    iput v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->slowDownFactor:F

    .line 408
    return-void
.end method

.method public setMaxGlobalWriteSize(J)V
    .locals 1
    .param p1, "maxGlobalWriteSize"    # J

    .prologue
    .line 485
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    .line 486
    return-void
.end method

.method public setReadChannelLimit(J)V
    .locals 5
    .param p1, "readLimit"    # J

    .prologue
    .line 537
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    .line 538
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    .line 539
    .local v2, "now":J
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 540
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    iget-object v4, v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    goto :goto_0

    .line 542
    .end local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    :cond_0
    return-void
.end method

.method public setWriteChannelLimit(J)V
    .locals 5
    .param p1, "writeLimit"    # J

    .prologue
    .line 519
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    .line 520
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    .line 521
    .local v2, "now":J
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 522
    .local v1, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    iget-object v4, v1, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    goto :goto_0

    .line 524
    .end local v1    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    :cond_0
    return-void
.end method

.method public slowDownFactor()F
    .locals 1

    .prologue
    .line 381
    iget v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->slowDownFactor:F

    return v0
.end method

.method protected submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V
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
    .line 784
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v10

    .line 785
    .local v10, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-virtual {v10}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    .line 786
    .local v14, "key":Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v14}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 787
    .local v15, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    if-nez v15, :cond_0

    .line 790
    invoke-direct/range {p0 .. p1}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->getOrSetPerChannel(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    move-result-object v15

    .line 793
    :cond_0
    move-wide/from16 v12, p5

    .line 794
    .local v12, "delay":J
    const/4 v11, 0x0

    .line 796
    .local v11, "globalSizeExceeded":Z
    monitor-enter v15

    .line 797
    const-wide/16 v4, 0x0

    cmp-long v3, p5, v4

    if-nez v3, :cond_2

    :try_start_0
    iget-object v3, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 798
    invoke-interface {v10}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_1

    .line 800
    monitor-exit v15

    .line 847
    :goto_0
    return-void

    .line 802
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 803
    iget-object v3, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 804
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 805
    move-wide/from16 v0, p7

    iput-wide v0, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    .line 806
    monitor-exit v15

    goto :goto_0

    .line 836
    :catchall_0
    move-exception v3

    monitor-exit v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 808
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    cmp-long v3, v12, v4

    if-lez v3, :cond_3

    add-long v4, p7, v12

    iget-wide v0, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    move-wide/from16 v16, v0

    sub-long v4, v4, v16

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    move-wide/from16 v16, v0

    cmp-long v3, v4, v16

    if-lez v3, :cond_3

    .line 809
    move-object/from16 v0, p0

    iget-wide v12, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    .line 811
    :cond_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    if-nez v3, :cond_5

    .line 813
    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V

    .line 814
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_4

    .line 816
    monitor-exit v15

    goto :goto_0

    .line 818
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 819
    iget-object v3, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 820
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 821
    move-wide/from16 v0, p7

    iput-wide v0, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->lastWriteTimestamp:J

    .line 822
    monitor-exit v15

    goto :goto_0

    .line 824
    :cond_5
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_6

    .line 826
    monitor-exit v15

    goto :goto_0

    .line 828
    :cond_6
    new-instance v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;

    add-long v3, v12, p7

    const/4 v8, 0x0

    move-object/from16 v5, p2

    move-wide/from16 v6, p3

    invoke-direct/range {v2 .. v8}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;-><init>(JLorg/jboss/netty/channel/MessageEvent;JLorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;)V

    .line 829
    .local v2, "newToSend":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;
    iget-object v3, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->messagesQueue:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 830
    iget-wide v4, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->queueSize:J

    add-long v4, v4, p3

    iput-wide v4, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->queueSize:J

    .line 831
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    move-wide/from16 v0, p3

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 832
    iget-wide v8, v15, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->queueSize:J

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-wide v6, v12

    invoke-virtual/range {v4 .. v9}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->checkWriteSuspend(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)V

    .line 833
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->queuesSize:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxGlobalWriteSize:J

    move-wide/from16 v16, v0

    cmp-long v3, v4, v16

    if-lez v3, :cond_7

    .line 834
    const/4 v11, 0x1

    .line 836
    :cond_7
    monitor-exit v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 837
    if-eqz v11, :cond_8

    .line 838
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->setWritable(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 840
    :cond_8
    iget-wide v8, v2, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;->relativeTimeAction:J

    .line 841
    .local v8, "futureNow":J
    move-object v7, v15

    .line 842
    .local v7, "forSchedule":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v4, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v9}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;-><init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;J)V

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v12, v13, v5}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    goto/16 :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 880
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x154

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-super {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Write Channel Limit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Read Channel Limit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->readChannelLimit:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method userDefinedWritabilityIndex()I
    .locals 1

    .prologue
    .line 161
    const/4 v0, 0x3

    return v0
.end method

.method public writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 30
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 743
    const-wide/16 v20, 0x0

    .line 744
    .local v20, "wait":J
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->calculateSize(Ljava/lang/Object;)J

    move-result-wide v6

    .line 745
    .local v6, "size":J
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v12

    .line 747
    .local v12, "now":J
    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-lez v5, :cond_5

    .line 749
    :try_start_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->getWriteLimit()J

    move-result-wide v8

    move-object/from16 v0, p0

    iget-wide v10, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    invoke-virtual/range {v5 .. v13}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writeTimeToWait(JJJJ)J

    move-result-wide v28

    .line 750
    .local v28, "waitGlobal":J
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 751
    .local v4, "key":Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, v4}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    .line 752
    .local v14, "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    if-eqz v14, :cond_2

    .line 753
    iget-object v5, v14, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeChannelLimit:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->maxTime:J

    invoke-virtual/range {v5 .. v13}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writeTimeToWait(JJJJ)J

    move-result-wide v20

    .line 754
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->writeDeviationActive:Z

    if-eqz v5, :cond_2

    .line 756
    const-wide/16 v26, 0x0

    .line 757
    .local v26, "maxLocalWrite":J
    iget-object v5, v14, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v5}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->getCumulativeWrittenBytes()J

    move-result-wide v26

    .line 758
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v24

    .line 759
    .local v24, "maxGlobalWrite":J
    const-wide/16 v8, 0x0

    cmp-long v5, v26, v8

    if-gtz v5, :cond_0

    .line 760
    const-wide/16 v26, 0x0

    .line 762
    :cond_0
    cmp-long v5, v24, v26

    if-gez v5, :cond_1

    .line 763
    move-wide/from16 v24, v26

    .line 765
    :cond_1
    move-wide/from16 v0, v26

    long-to-float v5, v0

    move-wide/from16 v0, v24

    long-to-float v8, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-direct {v0, v5, v8, v1, v2}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->computeBalancedWait(FFJ)J

    move-result-wide v20

    .line 768
    .end local v24    # "maxGlobalWrite":J
    .end local v26    # "maxLocalWrite":J
    :cond_2
    cmp-long v5, v20, v28

    if-gez v5, :cond_3

    .line 769
    move-wide/from16 v20, v28

    .line 771
    :cond_3
    const-wide/16 v8, 0xa

    cmp-long v5, v20, v8

    if-ltz v5, :cond_4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-eqz v5, :cond_5

    .line 772
    :cond_4
    const-wide/16 v20, 0x0

    .end local v4    # "key":Ljava/lang/Integer;
    .end local v14    # "perChannel":Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;
    .end local v28    # "waitGlobal":J
    :cond_5
    move-object/from16 v15, p0

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-wide/from16 v18, v6

    move-wide/from16 v22, v12

    .line 777
    invoke-virtual/range {v15 .. v23}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V

    .line 779
    return-void

    .line 777
    :catchall_0
    move-exception v5

    move-object/from16 v15, p0

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-wide/from16 v18, v6

    move-wide/from16 v22, v12

    invoke-virtual/range {v15 .. v23}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V

    throw v5
.end method
