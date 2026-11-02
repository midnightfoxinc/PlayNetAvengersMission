.class public Lorg/jboss/netty/handler/traffic/TrafficCounter;
.super Ljava/lang/Object;
.source "TrafficCounter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;
    }
.end annotation


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field final checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private final currentReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private final currentWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field private lastCumulativeTime:J

.field private volatile lastReadBytes:J

.field private lastReadThroughput:J

.field private volatile lastReadingTime:J

.field final lastTime:Ljava/util/concurrent/atomic/AtomicLong;

.field private lastWriteThroughput:J

.field private volatile lastWritingTime:J

.field private volatile lastWrittenBytes:J

.field volatile monitorActive:Z

.field final name:Ljava/lang/String;

.field private readingTime:J

.field private realWriteThroughput:J

.field private final realWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

.field volatile timeout:Lorg/jboss/netty/util/Timeout;

.field final timer:Lorg/jboss/netty/util/Timer;

.field timerTask:Lorg/jboss/netty/util/TimerTask;

.field final trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

.field private writingTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/util/Timer;Ljava/lang/String;J)V
    .locals 4
    .param p1, "trafficShapingHandler"    # Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "checkInterval"    # J

    .prologue
    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 54
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 69
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 74
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 94
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 119
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 129
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x3e8

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    .line 267
    if-nez p1, :cond_0

    .line 268
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "TrafficShapingHandler must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    .line 271
    iput-object p2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timer:Lorg/jboss/netty/util/Timer;

    .line 272
    iput-object p3, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->name:Ljava/lang/String;

    .line 274
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastCumulativeTime:J

    .line 275
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    .line 276
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readingTime:J

    .line 277
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWritingTime:J

    .line 278
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadingTime:J

    .line 279
    invoke-virtual {p0, p4, p5}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->configure(J)V

    .line 280
    return-void
.end method

.method public static final milliSecondFromNano()J
    .locals 4

    .prologue
    .line 43
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method bytesRealWriteFlowControl(J)V
    .locals 1
    .param p1, "write"    # J

    .prologue
    .line 331
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 332
    return-void
.end method

.method bytesRecvFlowControl(J)V
    .locals 1
    .param p1, "recv"    # J

    .prologue
    .line 307
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 308
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 309
    return-void
.end method

.method bytesWriteFlowControl(J)V
    .locals 1
    .param p1, "write"    # J

    .prologue
    .line 318
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 319
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 320
    return-void
.end method

.method public configure(J)V
    .locals 7
    .param p1, "newcheckInterval"    # J

    .prologue
    const-wide/16 v4, 0xa

    .line 287
    div-long v2, p1, v4

    mul-long v0, v2, v4

    .line 288
    .local v0, "newInterval":J
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v2

    cmp-long v2, v2, v0

    if-eqz v2, :cond_0

    .line 289
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    .line 290
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->stop()V

    .line 292
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 298
    :cond_0
    :goto_0
    return-void

    .line 295
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->start()V

    goto :goto_0
.end method

.method public getCheckInterval()J
    .locals 2

    .prologue
    .line 339
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCumulativeReadBytes()J
    .locals 2

    .prologue
    .line 402
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCumulativeWrittenBytes()J
    .locals 2

    .prologue
    .line 395
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentReadBytes()J
    .locals 2

    .prologue
    .line 374
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentWrittenBytes()J
    .locals 2

    .prologue
    .line 381
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastCumulativeTime()J
    .locals 2

    .prologue
    .line 410
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastCumulativeTime:J

    return-wide v0
.end method

.method public getLastReadBytes()J
    .locals 2

    .prologue
    .line 360
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadBytes:J

    return-wide v0
.end method

.method public getLastReadThroughput()J
    .locals 2

    .prologue
    .line 346
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadThroughput:J

    return-wide v0
.end method

.method public getLastTime()J
    .locals 2

    .prologue
    .line 388
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastWriteThroughput()J
    .locals 2

    .prologue
    .line 353
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWriteThroughput:J

    return-wide v0
.end method

.method public getLastWrittenBytes()J
    .locals 2

    .prologue
    .line 367
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWrittenBytes:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 591
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRealWriteThroughput()J
    .locals 2

    .prologue
    .line 424
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWriteThroughput:J

    return-wide v0
.end method

.method public getRealWrittenBytes()Ljava/util/concurrent/atomic/AtomicLong;
    .locals 1

    .prologue
    .line 417
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method public readTimeToWait(JJJ)J
    .locals 11
    .param p1, "size"    # J
    .param p3, "limitTraffic"    # J
    .param p5, "maxTime"    # J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 451
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-wide/from16 v6, p5

    invoke-virtual/range {v1 .. v9}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readTimeToWait(JJJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public readTimeToWait(JJJJ)J
    .locals 27
    .param p1, "size"    # J
    .param p3, "limitTraffic"    # J
    .param p5, "maxTime"    # J
    .param p7, "now"    # J

    .prologue
    .line 468
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRecvFlowControl(J)V

    .line 469
    const-wide/16 v22, 0x0

    cmp-long v22, p1, v22

    if-eqz v22, :cond_0

    const-wide/16 v22, 0x0

    cmp-long v22, p3, v22

    if-nez v22, :cond_1

    .line 470
    :cond_0
    const-wide/16 v20, 0x0

    .line 509
    :goto_0
    return-wide v20

    .line 472
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 473
    .local v8, "lastTimeCheck":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v18

    .line 474
    .local v18, "sum":J
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readingTime:J

    .line 475
    .local v14, "localReadingTime":J
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadBytes:J

    .line 476
    .local v6, "lastRB":J
    sub-long v4, p7, v8

    .line 477
    .local v4, "interval":J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadingTime:J

    move-wide/from16 v22, v0

    sub-long v22, v22, v8

    const-wide/16 v24, 0x0

    invoke-static/range {v22 .. v25}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v16

    .line 478
    .local v16, "pastDelay":J
    const-wide/16 v22, 0xa

    cmp-long v22, v4, v22

    if-lez v22, :cond_5

    .line 480
    const-wide/16 v22, 0x3e8

    mul-long v22, v22, v18

    div-long v22, v22, p3

    sub-long v22, v22, v4

    add-long v22, v22, v16

    const-wide/16 v24, 0xa

    div-long v22, v22, v24

    const-wide/16 v24, 0xa

    mul-long v20, v22, v24

    .line 481
    .local v20, "time":J
    const-wide/16 v22, 0xa

    cmp-long v22, v20, v22

    if-lez v22, :cond_4

    .line 482
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface/range {v22 .. v22}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v22

    if-eqz v22, :cond_2

    .line 483
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Time: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v22 .. v23}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 485
    :cond_2
    cmp-long v22, v20, p5

    if-lez v22, :cond_3

    add-long v22, p7, v20

    sub-long v22, v22, v14

    cmp-long v22, v22, p5

    if-lez v22, :cond_3

    .line 486
    move-wide/from16 v20, p5

    .line 488
    :cond_3
    add-long v22, p7, v20

    move-wide/from16 v0, v22

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readingTime:J

    goto/16 :goto_0

    .line 491
    :cond_4
    move-wide/from16 v0, p7

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readingTime:J

    .line 492
    const-wide/16 v20, 0x0

    goto/16 :goto_0

    .line 495
    .end local v20    # "time":J
    :cond_5
    add-long v12, v18, v6

    .line 496
    .local v12, "lastsum":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v22

    add-long v10, v4, v22

    .line 497
    .local v10, "lastinterval":J
    const-wide/16 v22, 0x3e8

    mul-long v22, v22, v12

    div-long v22, v22, p3

    sub-long v22, v22, v10

    add-long v22, v22, v16

    const-wide/16 v24, 0xa

    div-long v22, v22, v24

    const-wide/16 v24, 0xa

    mul-long v20, v22, v24

    .line 498
    .restart local v20    # "time":J
    const-wide/16 v22, 0xa

    cmp-long v22, v20, v22

    if-lez v22, :cond_8

    .line 499
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface/range {v22 .. v22}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v22

    if-eqz v22, :cond_6

    .line 500
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Time: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v22 .. v23}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 502
    :cond_6
    cmp-long v22, v20, p5

    if-lez v22, :cond_7

    add-long v22, p7, v20

    sub-long v22, v22, v14

    cmp-long v22, v22, p5

    if-lez v22, :cond_7

    .line 503
    move-wide/from16 v20, p5

    .line 505
    :cond_7
    add-long v22, p7, v20

    move-wide/from16 v0, v22

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readingTime:J

    goto/16 :goto_0

    .line 508
    :cond_8
    move-wide/from16 v0, p7

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readingTime:J

    .line 509
    const-wide/16 v20, 0x0

    goto/16 :goto_0
.end method

.method resetAccounting(J)V
    .locals 9
    .param p1, "newLastTime"    # J

    .prologue
    const-wide/16 v6, 0x3e8

    const-wide/16 v4, 0x0

    .line 237
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v2

    sub-long v0, p1, v2

    .line 238
    .local v0, "interval":J
    cmp-long v2, v0, v4

    if-nez v2, :cond_0

    .line 251
    :goto_0
    return-void

    .line 242
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadBytes:J

    .line 243
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWrittenBytes:J

    .line 244
    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadBytes:J

    mul-long/2addr v2, v6

    div-long/2addr v2, v0

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadThroughput:J

    .line 246
    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWrittenBytes:J

    mul-long/2addr v2, v6

    div-long/2addr v2, v0

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWriteThroughput:J

    .line 248
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v2

    mul-long/2addr v2, v6

    div-long/2addr v2, v0

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWriteThroughput:J

    .line 249
    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWritingTime:J

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWritingTime:J

    .line 250
    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadingTime:J

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->readingTime:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadingTime:J

    goto :goto_0
.end method

.method public resetCumulativeTime()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 432
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastCumulativeTime:J

    .line 433
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 434
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->cumulativeWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 435
    return-void
.end method

.method public start()V
    .locals 5

    .prologue
    .line 203
    iget-boolean v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->monitorActive:Z

    if-eqz v0, :cond_1

    .line 214
    :cond_0
    :goto_0
    return-void

    .line 206
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 208
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timer:Lorg/jboss/netty/util/Timer;

    if-eqz v0, :cond_0

    .line 209
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->monitorActive:Z

    .line 210
    new-instance v0, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    invoke-direct {v0, v1, p0}, Lorg/jboss/netty/handler/traffic/TrafficCounter$TrafficMonitoringTask;-><init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timerTask:Lorg/jboss/netty/util/TimerTask;

    .line 211
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timer:Lorg/jboss/netty/util/Timer;

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timerTask:Lorg/jboss/netty/util/TimerTask;

    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3, v4}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 220
    iget-boolean v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->monitorActive:Z

    if-nez v0, :cond_1

    .line 231
    :cond_0
    :goto_0
    return-void

    .line 223
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->monitorActive:Z

    .line 224
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->resetAccounting(J)V

    .line 225
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    if-eqz v0, :cond_2

    .line 226
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->trafficShapingHandler:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    invoke-virtual {v0, p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->doAccounting(Lorg/jboss/netty/handler/traffic/TrafficCounter;)V

    .line 228
    :cond_2
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->timeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    const/16 v4, 0xa

    .line 599
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xa5

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Monitor "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Current Speed Read: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastReadThroughput:J

    shr-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " KB/s, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Asked Write: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWriteThroughput:J

    shr-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " KB/s, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Real Write: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWriteThroughput:J

    shr-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " KB/s, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Current Read: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentReadBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    shr-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " KB, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Current asked Write: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    shr-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " KB, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Current real Write: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->realWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    shr-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " KB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeTimeToWait(JJJ)J
    .locals 11
    .param p1, "size"    # J
    .param p3, "limitTraffic"    # J
    .param p5, "maxTime"    # J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 526
    invoke-static {}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->milliSecondFromNano()J

    move-result-wide v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-wide/from16 v6, p5

    invoke-virtual/range {v1 .. v9}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writeTimeToWait(JJJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public writeTimeToWait(JJJJ)J
    .locals 27
    .param p1, "size"    # J
    .param p3, "limitTraffic"    # J
    .param p5, "maxTime"    # J
    .param p7, "now"    # J

    .prologue
    .line 543
    invoke-virtual/range {p0 .. p2}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesWriteFlowControl(J)V

    .line 544
    const-wide/16 v22, 0x0

    cmp-long v22, p1, v22

    if-eqz v22, :cond_0

    const-wide/16 v22, 0x0

    cmp-long v22, p3, v22

    if-nez v22, :cond_1

    .line 545
    :cond_0
    const-wide/16 v20, 0x0

    .line 584
    :goto_0
    return-wide v20

    .line 547
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastTime:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    .line 548
    .local v6, "lastTimeCheck":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->currentWrittenBytes:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v18

    .line 549
    .local v18, "sum":J
    move-object/from16 v0, p0

    iget-wide v8, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWrittenBytes:J

    .line 550
    .local v8, "lastWB":J
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    .line 551
    .local v14, "localWritingTime":J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->lastWritingTime:J

    move-wide/from16 v22, v0

    sub-long v22, v22, v6

    const-wide/16 v24, 0x0

    invoke-static/range {v22 .. v25}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v16

    .line 552
    .local v16, "pastDelay":J
    sub-long v4, p7, v6

    .line 553
    .local v4, "interval":J
    const-wide/16 v22, 0xa

    cmp-long v22, v4, v22

    if-lez v22, :cond_5

    .line 555
    const-wide/16 v22, 0x3e8

    mul-long v22, v22, v18

    div-long v22, v22, p3

    sub-long v22, v22, v4

    add-long v22, v22, v16

    const-wide/16 v24, 0xa

    div-long v22, v22, v24

    const-wide/16 v24, 0xa

    mul-long v20, v22, v24

    .line 556
    .local v20, "time":J
    const-wide/16 v22, 0xa

    cmp-long v22, v20, v22

    if-lez v22, :cond_4

    .line 557
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface/range {v22 .. v22}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v22

    if-eqz v22, :cond_2

    .line 558
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Time: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v22 .. v23}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 560
    :cond_2
    cmp-long v22, v20, p5

    if-lez v22, :cond_3

    add-long v22, p7, v20

    sub-long v22, v22, v14

    cmp-long v22, v22, p5

    if-lez v22, :cond_3

    .line 561
    move-wide/from16 v20, p5

    .line 563
    :cond_3
    add-long v22, p7, v20

    move-wide/from16 v0, v22

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    goto/16 :goto_0

    .line 566
    :cond_4
    move-wide/from16 v0, p7

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    .line 567
    const-wide/16 v20, 0x0

    goto/16 :goto_0

    .line 570
    .end local v20    # "time":J
    :cond_5
    add-long v12, v18, v8

    .line 571
    .local v12, "lastsum":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;->checkInterval:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v22

    add-long v10, v4, v22

    .line 572
    .local v10, "lastinterval":J
    const-wide/16 v22, 0x3e8

    mul-long v22, v22, v12

    div-long v22, v22, p3

    sub-long v22, v22, v10

    add-long v22, v22, v16

    const-wide/16 v24, 0xa

    div-long v22, v22, v24

    const-wide/16 v24, 0xa

    mul-long v20, v22, v24

    .line 573
    .restart local v20    # "time":J
    const-wide/16 v22, 0xa

    cmp-long v22, v20, v22

    if-lez v22, :cond_8

    .line 574
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface/range {v22 .. v22}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v22

    if-eqz v22, :cond_6

    .line 575
    sget-object v22, Lorg/jboss/netty/handler/traffic/TrafficCounter;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Time: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ":"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v22 .. v23}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 577
    :cond_6
    cmp-long v22, v20, p5

    if-lez v22, :cond_7

    add-long v22, p7, v20

    sub-long v22, v22, v14

    cmp-long v22, v22, p5

    if-lez v22, :cond_7

    .line 578
    move-wide/from16 v20, p5

    .line 580
    :cond_7
    add-long v22, p7, v20

    move-wide/from16 v0, v22

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    goto/16 :goto_0

    .line 583
    :cond_8
    move-wide/from16 v0, p7

    invoke-static {v14, v15, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v22

    move-wide/from16 v0, v22

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/traffic/TrafficCounter;->writingTime:J

    .line 584
    const-wide/16 v20, 0x0

    goto/16 :goto_0
.end method
