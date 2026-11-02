.class public Lcom/disneymobile/mocha/NSTimer;
.super Ljava/lang/Object;
.source "NSTimer.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final intervalS:D

.field private paused:Z

.field private repeats:Z

.field private final selector:Lcom/disneymobile/mocha/support/Selector;

.field private final target:Ljava/lang/Object;


# direct methods
.method public constructor <init>(DLjava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Z)V
    .locals 3
    .param p1, "intervalS"    # D
    .param p3, "target"    # Ljava/lang/Object;
    .param p4, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p5, "userInfo"    # Ljava/lang/Object;
    .param p6, "repeats"    # Z

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-wide p1, p0, Lcom/disneymobile/mocha/NSTimer;->intervalS:D

    .line 23
    iput-object p3, p0, Lcom/disneymobile/mocha/NSTimer;->target:Ljava/lang/Object;

    .line 24
    iput-object p4, p0, Lcom/disneymobile/mocha/NSTimer;->selector:Lcom/disneymobile/mocha/support/Selector;

    .line 25
    iput-boolean p6, p0, Lcom/disneymobile/mocha/NSTimer;->repeats:Z

    .line 26
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSTimer;->handler:Landroid/os/Handler;

    .line 28
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSTimer;->schedule()V

    .line 29
    return-void
.end method

.method private schedule()V
    .locals 6

    .prologue
    .line 39
    iget-object v0, p0, Lcom/disneymobile/mocha/NSTimer;->handler:Landroid/os/Handler;

    iget-wide v2, p0, Lcom/disneymobile/mocha/NSTimer;->intervalS:D

    const-wide v4, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, v4

    double-to-long v2, v2

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 40
    return-void
.end method

.method public static scheduledTimerWithTimeIntervalTargetSelectorUserInfoAndRepeats(DLjava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Z)Lcom/disneymobile/mocha/NSTimer;
    .locals 8
    .param p0, "intervalS"    # D
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p4, "userInfo"    # Ljava/lang/Object;
    .param p5, "repeats"    # Z

    .prologue
    .line 18
    new-instance v1, Lcom/disneymobile/mocha/NSTimer;

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/disneymobile/mocha/NSTimer;-><init>(DLjava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Z)V

    return-object v1
.end method


# virtual methods
.method public invalidate()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disneymobile/mocha/NSTimer;->repeats:Z

    .line 44
    iget-object v0, p0, Lcom/disneymobile/mocha/NSTimer;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 45
    return-void
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disneymobile/mocha/NSTimer;->paused:Z

    .line 49
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disneymobile/mocha/NSTimer;->paused:Z

    .line 53
    return-void
.end method

.method public run()V
    .locals 5

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/disneymobile/mocha/NSTimer;->paused:Z

    if-nez v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/disneymobile/mocha/NSTimer;->selector:Lcom/disneymobile/mocha/support/Selector;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/disneymobile/mocha/NSTimer;->target:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/disneymobile/mocha/support/Selector;->invokeWithOptionalParametersWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    :cond_0
    iget-boolean v0, p0, Lcom/disneymobile/mocha/NSTimer;->repeats:Z

    if-eqz v0, :cond_1

    .line 35
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSTimer;->schedule()V

    .line 36
    :cond_1
    return-void
.end method
