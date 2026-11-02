.class public abstract Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
.super Lorg/jboss/netty/channel/SimpleChannelHandler;
.source "AbstractTrafficShapingHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;,
        Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;,
        Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    }
.end annotation


# static fields
.field static final CHANNEL_DEFAULT_USER_DEFINED_WRITABILITY_INDEX:I = 0x1

.field public static final DEFAULT_CHECK_INTERVAL:J = 0x3e8L

.field static final DEFAULT_MAX_SIZE:J = 0x400000L

.field public static final DEFAULT_MAX_TIME:J = 0x3a98L

.field static final GLOBALCHANNEL_DEFAULT_USER_DEFINED_WRITABILITY_INDEX:I = 0x3

.field static final GLOBAL_DEFAULT_USER_DEFINED_WRITABILITY_INDEX:I = 0x2

.field static final MINIMAL_WAIT:J = 0xaL

.field static logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field protected volatile checkInterval:J

.field final index:I

.field protected volatile maxTime:J

.field volatile maxWriteDelay:J

.field volatile maxWriteSize:J

.field private objectSizeEstimator:Lorg/jboss/netty/util/ObjectSizeEstimator;

.field private volatile readLimit:J

.field final release:Ljava/util/concurrent/atomic/AtomicBoolean;

.field volatile timeout:Lorg/jboss/netty/util/Timeout;

.field protected timer:Lorg/jboss/netty/util/Timer;

.field protected trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

.field private volatile writeLimit:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const-class v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;)V
    .locals 12
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    const-wide/16 v10, 0x3a98

    const-wide/16 v8, 0x3e8

    const-wide/16 v4, 0x0

    .line 327
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    iput-wide v8, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    iput-wide v10, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 328
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v6, v4

    .line 329
    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 331
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;J)V
    .locals 13
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "checkInterval"    # J

    .prologue
    .line 363
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 364
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 365
    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v10, 0x3a98

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide/from16 v8, p3

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 366
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJ)V
    .locals 13
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J

    .prologue
    .line 295
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 296
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 297
    const-wide/16 v8, 0x3e8

    const-wide/16 v10, 0x3a98

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide/from16 v4, p3

    move-wide/from16 v6, p5

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 299
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJ)V
    .locals 13
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "checkInterval"    # J

    .prologue
    .line 254
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 255
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 256
    const-wide/16 v10, 0x3a98

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide/from16 v4, p3

    move-wide/from16 v6, p5

    move-wide/from16 v8, p7

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 257
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 3
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "checkInterval"    # J
    .param p9, "maxTime"    # J

    .prologue
    .line 412
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 413
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 414
    invoke-direct/range {p0 .. p10}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 415
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/Timer;)V
    .locals 12
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    const-wide/16 v10, 0x3a98

    const-wide/16 v8, 0x3e8

    const-wide/16 v4, 0x0

    .line 309
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    iput-wide v8, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    iput-wide v10, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 310
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 311
    new-instance v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;

    invoke-direct {v2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;-><init>()V

    move-object v1, p0

    move-object v3, p1

    move-wide v6, v4

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 313
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/Timer;J)V
    .locals 12
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "checkInterval"    # J

    .prologue
    const-wide/16 v10, 0x3a98

    const-wide/16 v4, 0x0

    .line 343
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    iput-wide v10, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 344
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 345
    new-instance v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;

    invoke-direct {v2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;-><init>()V

    move-object v1, p0

    move-object v3, p1

    move-wide v6, v4

    move-wide v8, p2

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 346
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/Timer;JJ)V
    .locals 12
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J

    .prologue
    .line 272
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 273
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 274
    new-instance v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;

    invoke-direct {v2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;-><init>()V

    const-wide/16 v8, 0x3e8

    const-wide/16 v10, 0x3a98

    move-object v1, p0

    move-object v3, p1

    move-wide v4, p2

    move-wide/from16 v6, p4

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 276
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/Timer;JJJ)V
    .locals 12
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J
    .param p6, "checkInterval"    # J

    .prologue
    .line 229
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 230
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 231
    new-instance v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;

    invoke-direct {v2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;-><init>()V

    const-wide/16 v10, 0x3a98

    move-object v1, p0

    move-object v3, p1

    move-wide v4, p2

    move-wide/from16 v6, p4

    move-wide/from16 v8, p6

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 233
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 12
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J
    .param p6, "checkInterval"    # J
    .param p8, "maxTime"    # J

    .prologue
    .line 385
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelHandler;-><init>()V

    .line 123
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 128
    const-wide/16 v0, 0x3a98

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 133
    const-wide/16 v0, 0xfa0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 138
    const-wide/32 v0, 0x400000

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 145
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 386
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->userDefinedWritabilityIndex()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    .line 387
    new-instance v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;

    invoke-direct {v2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;-><init>()V

    move-object v1, p0

    move-object v3, p1

    move-wide v4, p2

    move-wide/from16 v6, p4

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    invoke-direct/range {v1 .. v11}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 389
    return-void
.end method

.method static checkAttachment(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    .locals 1
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 826
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getAttachment()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    .line 827
    .local v0, "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    if-nez v0, :cond_0

    .line 828
    new-instance v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    .end local v0    # "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    invoke-direct {v0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;-><init>()V

    .line 829
    .restart local v0    # "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    invoke-interface {p0, v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->setAttachment(Ljava/lang/Object;)V

    .line 831
    :cond_0
    return-object v0
.end method

.method private init(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 3
    .param p1, "newObjectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "newTimer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "newWriteLimit"    # J
    .param p5, "newReadLimit"    # J
    .param p7, "newCheckInterval"    # J
    .param p9, "newMaxTime"    # J

    .prologue
    .line 195
    const-wide/16 v0, 0x0

    cmp-long v0, p9, v0

    if-gtz v0, :cond_0

    .line 196
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxTime must be positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->objectSizeEstimator:Lorg/jboss/netty/util/ObjectSizeEstimator;

    .line 199
    iput-object p2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    .line 200
    iput-wide p3, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->writeLimit:J

    .line 201
    iput-wide p5, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->readLimit:J

    .line 202
    iput-wide p7, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 203
    iput-wide p9, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 205
    return-void
.end method


# virtual methods
.method protected calculateSize(Ljava/lang/Object;)J
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 842
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->objectSizeEstimator:Lorg/jboss/netty/util/ObjectSizeEstimator;

    invoke-interface {v2, p1}, Lorg/jboss/netty/util/ObjectSizeEstimator;->estimateSize(Ljava/lang/Object;)I

    move-result v2

    int-to-long v0, v2

    .line 844
    .local v0, "size":J
    return-wide v0
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
    .line 836
    invoke-static {p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkAttachment(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    .line 837
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->setWritable(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 838
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelHandler;->channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 839
    return-void
.end method

.method checkWaitReadTime(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)J
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "wait"    # J
    .param p4, "now"    # J

    .prologue
    .line 730
    return-wide p2
.end method

.method checkWriteSuspend(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "delay"    # J
    .param p4, "queueSize"    # J

    .prologue
    .line 794
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    cmp-long v0, p4, v0

    if-gtz v0, :cond_0

    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    .line 795
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->setWritable(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 797
    :cond_1
    return-void
.end method

.method public configure(J)V
    .locals 1
    .param p1, "newCheckInterval"    # J

    .prologue
    .line 463
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->setCheckInterval(J)V

    .line 464
    return-void
.end method

.method public configure(JJ)V
    .locals 5
    .param p1, "newWriteLimit"    # J
    .param p3, "newReadLimit"    # J

    .prologue
    .line 452
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->writeLimit:J

    .line 453
    iput-wide p3, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->readLimit:J

    .line 454
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_0

    .line 455
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    .line 457
    :cond_0
    return-void
.end method

.method public configure(JJJ)V
    .locals 1
    .param p1, "newWriteLimit"    # J
    .param p3, "newReadLimit"    # J
    .param p5, "newCheckInterval"    # J

    .prologue
    .line 434
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->configure(JJ)V

    .line 435
    invoke-virtual {p0, p5, p6}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->configure(J)V

    .line 436
    return-void
.end method

.method protected doAccounting(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V
    .locals 0
    .param p1, "counter"    # Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .prologue
    .line 609
    return-void
.end method

.method public getCheckInterval()J
    .locals 2

    .prologue
    .line 516
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    return-wide v0
.end method

.method public getMaxTimeWait()J
    .locals 2

    .prologue
    .line 533
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    return-wide v0
.end method

.method public getMaxWriteDelay()J
    .locals 2

    .prologue
    .line 558
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    return-wide v0
.end method

.method public getMaxWriteSize()J
    .locals 2

    .prologue
    .line 582
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    return-wide v0
.end method

.method public getReadLimit()J
    .locals 2

    .prologue
    .line 493
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->readLimit:J

    return-wide v0
.end method

.method public getTrafficCounter()Lorg/jboss/netty/handler/traffic/TrafficCounter;
    .locals 1

    .prologue
    .line 811
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    return-object v0
.end method

.method public getWriteLimit()J
    .locals 2

    .prologue
    .line 470
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->writeLimit:J

    return-wide v0
.end method

.method informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "now"    # J

    .prologue
    .line 739
    return-void
.end method

.method protected internalSubmitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 768
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 769
    return-void
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 11
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 671
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v8

    .line 673
    .local v8, "now":J
    :try_start_0
    invoke-static {p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkAttachment(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    move-result-object v10

    .line 674
    .local v10, "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->calculateSize(Ljava/lang/Object;)J

    move-result-wide v2

    .line 675
    .local v2, "size":J
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_5

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v1, :cond_5

    .line 677
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->readLimit:J

    iget-wide v6, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    invoke-virtual/range {v1 .. v9}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readTimeToWait(JJJJ)J

    move-result-wide v6

    .local v6, "wait":J
    move-object v4, p0

    move-object v5, p1

    .line 678
    invoke-virtual/range {v4 .. v9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkWaitReadTime(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)J

    move-result-wide v6

    .line 679
    const-wide/16 v4, 0xa

    cmp-long v1, v6, v4

    if-ltz v1, :cond_5

    .line 681
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 716
    invoke-virtual {p0, p1, v8, v9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    .line 718
    .end local v6    # "wait":J
    :goto_0
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 720
    return-void

    .line 684
    .restart local v6    # "wait":J
    :cond_0
    :try_start_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 685
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    if-eqz v0, :cond_5

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 687
    sget-object v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 688
    sget-object v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Read suspend: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, v10, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 691
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    if-nez v1, :cond_2

    .line 694
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 716
    invoke-virtual {p0, p1, v8, v9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto :goto_0

    .line 697
    :cond_2
    :try_start_2
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-boolean v1, v10, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    if-nez v1, :cond_5

    .line 698
    const/4 v1, 0x1

    iput-boolean v1, v10, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    .line 699
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    .line 700
    sget-object v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 701
    sget-object v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Suspend final status => "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, v10, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 706
    :cond_3
    iget-object v1, v10, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->reopenReadTimerTask:Lorg/jboss/netty/util/TimerTask;

    if-nez v1, :cond_4

    .line 707
    new-instance v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;

    invoke-direct {v1, p0, p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;-><init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    iput-object v1, v10, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->reopenReadTimerTask:Lorg/jboss/netty/util/TimerTask;

    .line 709
    :cond_4
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v4, v10, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->reopenReadTimerTask:Lorg/jboss/netty/util/TimerTask;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v4, v6, v7, v5}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->timeout:Lorg/jboss/netty/util/Timeout;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 716
    .end local v0    # "channel":Lorg/jboss/netty/channel/Channel;
    .end local v6    # "wait":J
    :cond_5
    invoke-virtual {p0, p1, v8, v9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto/16 :goto_0

    .end local v2    # "size":J
    .end local v10    # "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    :catchall_0
    move-exception v1

    invoke-virtual {p0, p1, v8, v9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->informReadOperation(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    .line 718
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 716
    throw v1
.end method

.method public releaseExternalResources()V
    .locals 2

    .prologue
    .line 815
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_0

    .line 816
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->stop()V

    .line 818
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 819
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->timeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v0, :cond_1

    .line 820
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->timeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 823
    :cond_1
    return-void
.end method

.method releaseReadSuspended(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 663
    invoke-static {p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkAttachment(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    move-result-object v0

    .line 664
    .local v0, "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    .line 665
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    .line 666
    return-void
.end method

.method releaseWriteSuspended(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 803
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->setWritable(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V

    .line 804
    return-void
.end method

.method public setCheckInterval(J)V
    .locals 5
    .param p1, "newCheckInterval"    # J

    .prologue
    .line 523
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    .line 524
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_0

    .line 525
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->configure(J)V

    .line 527
    :cond_0
    return-void
.end method

.method public setMaxTimeWait(J)V
    .locals 3
    .param p1, "maxTime"    # J

    .prologue
    .line 548
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 549
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxTime must be positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 551
    :cond_0
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    .line 552
    return-void
.end method

.method public setMaxWriteDelay(J)V
    .locals 3
    .param p1, "maxWriteDelay"    # J

    .prologue
    .line 572
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 573
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxWriteDelay must be positive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 575
    :cond_0
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    .line 576
    return-void
.end method

.method public setMaxWriteSize(J)V
    .locals 1
    .param p1, "maxWriteSize"    # J

    .prologue
    .line 597
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    .line 598
    return-void
.end method

.method public setReadLimit(J)V
    .locals 5
    .param p1, "readLimit"    # J

    .prologue
    .line 506
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->readLimit:J

    .line 507
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_0

    .line 508
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    .line 510
    :cond_0
    return-void
.end method

.method setTrafficCounter(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V
    .locals 0
    .param p1, "newTrafficCounter"    # Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .prologue
    .line 211
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .line 212
    return-void
.end method

.method setWritable(Lorg/jboss/netty/channel/ChannelHandlerContext;Z)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "writable"    # Z

    .prologue
    .line 781
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 782
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 783
    iget v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    invoke-interface {v0, v1, p2}, Lorg/jboss/netty/channel/Channel;->setUserDefinedWritability(IZ)V

    .line 785
    :cond_0
    return-void
.end method

.method public setWriteLimit(J)V
    .locals 5
    .param p1, "writeLimit"    # J

    .prologue
    .line 483
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->writeLimit:J

    .line 484
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_0

    .line 485
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    .line 487
    :cond_0
    return-void
.end method

.method protected submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;J)V
    .locals 11
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .param p3, "delay"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 774
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->calculateSize(Ljava/lang/Object;)J

    move-result-wide v4

    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v8

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v6, p3

    invoke-virtual/range {v1 .. v9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V

    .line 775
    return-void
.end method

.method abstract submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 849
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x122

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "TrafficShaping with Write Limit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->writeLimit:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Read Limit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->readLimit:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " CheckInterval: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkInterval:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " maxDelay: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteDelay:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " maxSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxWriteSize:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " and Counter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 856
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v1, :cond_0

    .line 857
    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 861
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 859
    :cond_0
    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method userDefinedWritabilityIndex()I
    .locals 1

    .prologue
    .line 183
    instance-of v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    if-eqz v0, :cond_0

    .line 184
    const/4 v0, 0x3

    .line 188
    :goto_0
    return v0

    .line 185
    :cond_0
    instance-of v0, p0, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;

    if-eqz v0, :cond_1

    .line 186
    const/4 v0, 0x2

    goto :goto_0

    .line 188
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public writeRequested(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 22
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 744
    const-wide/16 v18, 0x0

    .line 745
    .local v18, "wait":J
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->calculateSize(Ljava/lang/Object;)J

    move-result-wide v4

    .line 746
    .local v4, "size":J
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v10

    .line 747
    .local v10, "now":J
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    .line 749
    .local v2, "channel":Lorg/jboss/netty/channel/Channel;
    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_2

    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v3, :cond_2

    .line 751
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->writeLimit:J

    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->maxTime:J

    invoke-virtual/range {v3 .. v11}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writeTimeToWait(JJJJ)J

    move-result-wide v18

    .line 752
    sget-object v3, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 753
    sget-object v3, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Write suspend: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, v18

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Lorg/jboss/netty/channel/Channel;->isWritable()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget v7, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->index:I

    invoke-interface {v2, v7}, Lorg/jboss/netty/channel/Channel;->getUserDefinedWritability(I)Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 756
    :cond_0
    const-wide/16 v6, 0xa

    cmp-long v3, v18, v6

    if-ltz v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_2

    .line 757
    :cond_1
    const-wide/16 v18, 0x0

    :cond_2
    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object/from16 v15, p2

    move-wide/from16 v16, v4

    move-wide/from16 v20, v10

    .line 762
    invoke-virtual/range {v13 .. v21}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V

    .line 764
    return-void

    .line 762
    :catchall_0
    move-exception v3

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object/from16 v15, p2

    move-wide/from16 v16, v4

    move-wide/from16 v20, v10

    invoke-virtual/range {v13 .. v21}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V

    throw v3
.end method
