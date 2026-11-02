.class public Lorg/jboss/netty/util/HashedWheelTimer;
.super Ljava/lang/Object;
.source "HashedWheelTimer.java"

# interfaces
.implements Lorg/jboss/netty/util/Timer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/util/HashedWheelTimer$1;,
        Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;,
        Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;,
        Lorg/jboss/netty/util/HashedWheelTimer$Worker;
    }
.end annotation


# static fields
.field public static final WORKER_STATE_INIT:I = 0x0

.field public static final WORKER_STATE_SHUTDOWN:I = 0x2

.field public static final WORKER_STATE_STARTED:I = 0x1

.field private static final WORKER_STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lorg/jboss/netty/util/HashedWheelTimer;",
            ">;"
        }
    .end annotation
.end field

.field private static final id:Ljava/util/concurrent/atomic/AtomicInteger;

.field static final logger:Lorg/jboss/netty/logging/InternalLogger;

.field private static final misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;


# instance fields
.field private final mask:I

.field private volatile startTime:J

.field private final startTimeInitialized:Ljava/util/concurrent/CountDownLatch;

.field private final tickDuration:J

.field private final timeouts:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;",
            ">;"
        }
    .end annotation
.end field

.field private final wheel:[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

.field private final worker:Lorg/jboss/netty/util/HashedWheelTimer$Worker;

.field private volatile workerState:I

.field private final workerThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 81
    const-class v0, Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->id:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 85
    new-instance v0, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    const-class v1, Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-direct {v0, v1}, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    .line 88
    const-class v0, Lorg/jboss/netty/util/HashedWheelTimer;

    const-string v1, "workerState"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->WORKER_STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 113
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 114
    return-void
.end method

.method public constructor <init>(JLjava/util/concurrent/TimeUnit;)V
    .locals 1
    .param p1, "tickDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 125
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;)V

    .line 126
    return-void
.end method

.method public constructor <init>(JLjava/util/concurrent/TimeUnit;I)V
    .locals 7
    .param p1, "tickDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "ticksPerWheel"    # I

    .prologue
    .line 137
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v1

    move-object v0, p0

    move-wide v2, p1

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;I)V

    .line 138
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;)V
    .locals 3
    .param p1, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;

    .prologue
    .line 149
    const-wide/16 v0, 0x64

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;)V

    .line 150
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;)V
    .locals 6
    .param p1, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
    .param p2, "tickDuration"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 163
    const/16 v5, 0x200

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;I)V

    .line 164
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;JLjava/util/concurrent/TimeUnit;I)V
    .locals 8
    .param p1, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
    .param p2, "tickDuration"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "ticksPerWheel"    # I

    .prologue
    .line 179
    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p1

    move-wide v4, p2

    move-object v6, p4

    move v7, p5

    invoke-direct/range {v1 .. v7}, Lorg/jboss/netty/util/HashedWheelTimer;-><init>(Ljava/util/concurrent/ThreadFactory;Lorg/jboss/netty/util/ThreadNameDeterminer;JLjava/util/concurrent/TimeUnit;I)V

    .line 180
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;Lorg/jboss/netty/util/ThreadNameDeterminer;JLjava/util/concurrent/TimeUnit;I)V
    .locals 9
    .param p1, "threadFactory"    # Ljava/util/concurrent/ThreadFactory;
    .param p2, "determiner"    # Lorg/jboss/netty/util/ThreadNameDeterminer;
    .param p3, "tickDuration"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "ticksPerWheel"    # I

    .prologue
    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Lorg/jboss/netty/util/HashedWheelTimer$Worker;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/jboss/netty/util/HashedWheelTimer$Worker;-><init>(Lorg/jboss/netty/util/HashedWheelTimer;Lorg/jboss/netty/util/HashedWheelTimer$1;)V

    iput-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->worker:Lorg/jboss/netty/util/HashedWheelTimer$Worker;

    .line 97
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->workerState:I

    .line 103
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->startTimeInitialized:Ljava/util/concurrent/CountDownLatch;

    .line 104
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->timeouts:Ljava/util/Queue;

    .line 198
    if-nez p1, :cond_0

    .line 199
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "threadFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 201
    :cond_0
    if-nez p5, :cond_1

    .line 202
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "unit"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 204
    :cond_1
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-gtz v0, :cond_2

    .line 205
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "tickDuration must be greater than 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 208
    :cond_2
    if-gtz p6, :cond_3

    .line 209
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ticksPerWheel must be greater than 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_3
    invoke-static {p6}, Lorg/jboss/netty/util/HashedWheelTimer;->createWheel(I)[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->wheel:[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    .line 215
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->wheel:[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->mask:I

    .line 218
    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->tickDuration:J

    .line 221
    iget-wide v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->tickDuration:J

    const-wide v2, 0x7fffffffffffffffL

    iget-object v4, p0, Lorg/jboss/netty/util/HashedWheelTimer;->wheel:[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    array-length v4, v4

    int-to-long v4, v4

    div-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-ltz v0, :cond_4

    .line 222
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "tickDuration: %d (expected: 0 < tickDuration in nanos < %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-wide v4, 0x7fffffffffffffffL

    iget-object v6, p0, Lorg/jboss/netty/util/HashedWheelTimer;->wheel:[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    array-length v6, v6

    int-to-long v6, v6

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_4
    new-instance v0, Lorg/jboss/netty/util/ThreadRenamingRunnable;

    iget-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer;->worker:Lorg/jboss/netty/util/HashedWheelTimer$Worker;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Hashed wheel timer #"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lorg/jboss/netty/util/HashedWheelTimer;->id:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Lorg/jboss/netty/util/ThreadRenamingRunnable;-><init>(Ljava/lang/Runnable;Ljava/lang/String;Lorg/jboss/netty/util/ThreadNameDeterminer;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->workerThread:Ljava/lang/Thread;

    .line 232
    sget-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;->increase()V

    .line 233
    return-void
.end method

.method static synthetic access$200(Lorg/jboss/netty/util/HashedWheelTimer;)J
    .locals 2
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;

    .prologue
    .line 79
    iget-wide v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->startTime:J

    return-wide v0
.end method

.method static synthetic access$202(Lorg/jboss/netty/util/HashedWheelTimer;J)J
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;
    .param p1, "x1"    # J

    .prologue
    .line 79
    iput-wide p1, p0, Lorg/jboss/netty/util/HashedWheelTimer;->startTime:J

    return-wide p1
.end method

.method static synthetic access$300(Lorg/jboss/netty/util/HashedWheelTimer;)Ljava/util/concurrent/CountDownLatch;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->startTimeInitialized:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jboss/netty/util/HashedWheelTimer;)[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->wheel:[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jboss/netty/util/HashedWheelTimer;)I
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;

    .prologue
    .line 79
    iget v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->mask:I

    return v0
.end method

.method static synthetic access$600()Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .locals 1

    .prologue
    .line 79
    sget-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->WORKER_STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-object v0
.end method

.method static synthetic access$700(Lorg/jboss/netty/util/HashedWheelTimer;)Ljava/util/Queue;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->timeouts:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic access$900(Lorg/jboss/netty/util/HashedWheelTimer;)J
    .locals 2
    .param p0, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer;

    .prologue
    .line 79
    iget-wide v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->tickDuration:J

    return-wide v0
.end method

.method private static createWheel(I)[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    .locals 5
    .param p0, "ticksPerWheel"    # I

    .prologue
    .line 237
    if-gtz p0, :cond_0

    .line 238
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ticksPerWheel must be greater than 0: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 241
    :cond_0
    const/high16 v2, 0x40000000    # 2.0f

    if-le p0, v2, :cond_1

    .line 242
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ticksPerWheel may not be greater than 2^30: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 246
    :cond_1
    invoke-static {p0}, Lorg/jboss/netty/util/HashedWheelTimer;->normalizeTicksPerWheel(I)I

    move-result p0

    .line 247
    new-array v1, p0, [Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    .line 248
    .local v1, "wheel":[Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 249
    new-instance v2, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;-><init>(Lorg/jboss/netty/util/HashedWheelTimer$1;)V

    aput-object v2, v1, v0

    .line 248
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    :cond_2
    return-object v1
.end method

.method private static normalizeTicksPerWheel(I)I
    .locals 1
    .param p0, "ticksPerWheel"    # I

    .prologue
    .line 255
    const/4 v0, 0x1

    .line 256
    .local v0, "normalizedTicksPerWheel":I
    :goto_0
    if-ge v0, p0, :cond_0

    .line 257
    shl-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 259
    :cond_0
    return v0
.end method


# virtual methods
.method public newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;
    .locals 8
    .param p1, "task"    # Lorg/jboss/netty/util/TimerTask;
    .param p2, "delay"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 331
    if-nez p1, :cond_0

    .line 332
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "task"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 334
    :cond_0
    if-nez p4, :cond_1

    .line 335
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "unit"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 337
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/util/HashedWheelTimer;->start()V

    .line 341
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v6

    add-long/2addr v4, v6

    iget-wide v6, p0, Lorg/jboss/netty/util/HashedWheelTimer;->startTime:J

    sub-long v0, v4, v6

    .line 342
    .local v0, "deadline":J
    new-instance v2, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    invoke-direct {v2, p0, p1, v0, v1}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;-><init>(Lorg/jboss/netty/util/HashedWheelTimer;Lorg/jboss/netty/util/TimerTask;J)V

    .line 343
    .local v2, "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    iget-object v3, p0, Lorg/jboss/netty/util/HashedWheelTimer;->timeouts:Ljava/util/Queue;

    invoke-interface {v3, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 344
    return-object v2
.end method

.method public start()V
    .locals 4

    .prologue
    .line 270
    sget-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->WORKER_STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->get(Ljava/lang/Object;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 281
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Invalid WorkerState"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 272
    :pswitch_0
    sget-object v0, Lorg/jboss/netty/util/HashedWheelTimer;->WORKER_STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->workerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 285
    :cond_0
    :goto_0
    :pswitch_1
    iget-wide v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->startTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 287
    :try_start_0
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer;->startTimeInitialized:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 288
    :catch_0
    move-exception v0

    goto :goto_0

    .line 279
    :pswitch_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cannot be started once stopped"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_1
    return-void

    .line 270
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public stop()Ljava/util/Set;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/jboss/netty/util/Timeout;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    .line 295
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/util/HashedWheelTimer;->workerThread:Ljava/lang/Thread;

    if-ne v2, v3, :cond_0

    .line 296
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v4, Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".stop() cannot be called from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lorg/jboss/netty/util/TimerTask;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 302
    :cond_0
    sget-object v2, Lorg/jboss/netty/util/HashedWheelTimer;->WORKER_STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    const/4 v3, 0x1

    invoke-virtual {v2, p0, v3, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v2

    if-nez v2, :cond_1

    .line 304
    sget-object v2, Lorg/jboss/netty/util/HashedWheelTimer;->WORKER_STATE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v2, p0, v4}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->set(Ljava/lang/Object;I)V

    .line 306
    sget-object v2, Lorg/jboss/netty/util/HashedWheelTimer;->misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;->decrease()V

    .line 308
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    .line 327
    :goto_0
    return-object v2

    .line 311
    :cond_1
    const/4 v1, 0x0

    .line 312
    .local v1, "interrupted":Z
    :goto_1
    iget-object v2, p0, Lorg/jboss/netty/util/HashedWheelTimer;->workerThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 313
    iget-object v2, p0, Lorg/jboss/netty/util/HashedWheelTimer;->workerThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 315
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/util/HashedWheelTimer;->workerThread:Ljava/lang/Thread;

    const-wide/16 v4, 0x64

    invoke-virtual {v2, v4, v5}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 316
    :catch_0
    move-exception v0

    .line 317
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v1, 0x1

    .line 318
    goto :goto_1

    .line 321
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    if-eqz v1, :cond_3

    .line 322
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 325
    :cond_3
    sget-object v2, Lorg/jboss/netty/util/HashedWheelTimer;->misuseDetector:Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;

    invoke-virtual {v2}, Lorg/jboss/netty/util/internal/SharedResourceMisuseDetector;->decrease()V

    .line 327
    iget-object v2, p0, Lorg/jboss/netty/util/HashedWheelTimer;->worker:Lorg/jboss/netty/util/HashedWheelTimer$Worker;

    invoke-virtual {v2}, Lorg/jboss/netty/util/HashedWheelTimer$Worker;->unprocessedTimeouts()Ljava/util/Set;

    move-result-object v2

    goto :goto_0
.end method
