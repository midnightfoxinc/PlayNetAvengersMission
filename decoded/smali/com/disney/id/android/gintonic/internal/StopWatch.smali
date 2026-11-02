.class public Lcom/disney/id/android/gintonic/internal/StopWatch;
.super Ljava/lang/Object;
.source "StopWatch.java"


# instance fields
.field private elapsedTime:J

.field private endTime:J

.field private startTime:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method private reset()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 22
    iput-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->startTime:J

    .line 23
    iput-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->endTime:J

    .line 24
    iput-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->elapsedTime:J

    .line 25
    return-void
.end method


# virtual methods
.method public getTotalTimeMillis()J
    .locals 6

    .prologue
    const-wide/16 v0, 0x0

    .line 42
    iget-wide v2, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->elapsedTime:J

    cmp-long v2, v2, v0

    if-eqz v2, :cond_0

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v2, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->endTime:J

    iget-wide v4, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->startTime:J

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    :cond_0
    return-wide v0
.end method

.method public start()V
    .locals 2

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/disney/id/android/gintonic/internal/StopWatch;->reset()V

    .line 29
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->startTime:J

    .line 30
    return-void
.end method

.method public stop()V
    .locals 4

    .prologue
    .line 33
    iget-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->startTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 34
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->endTime:J

    .line 35
    iget-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->endTime:J

    iget-wide v2, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->startTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/disney/id/android/gintonic/internal/StopWatch;->elapsedTime:J

    .line 39
    :goto_0
    return-void

    .line 37
    :cond_0
    invoke-direct {p0}, Lcom/disney/id/android/gintonic/internal/StopWatch;->reset()V

    goto :goto_0
.end method
