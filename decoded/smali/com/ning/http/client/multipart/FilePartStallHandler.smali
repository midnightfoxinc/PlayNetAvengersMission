.class public Lcom/ning/http/client/multipart/FilePartStallHandler;
.super Ljava/util/TimerTask;
.source "FilePartStallHandler.java"


# instance fields
.field private _failed:Z

.field private _timer:Ljava/util/Timer;

.field private _waitTime:J

.field private _written:Z


# direct methods
.method public constructor <init>(JLcom/ning/http/client/multipart/AbstractFilePart;)V
    .locals 1
    .param p1, "waitTime"    # J
    .param p3, "filePart"    # Lcom/ning/http/client/multipart/AbstractFilePart;

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 23
    iput-wide p1, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_waitTime:J

    .line 24
    iput-boolean v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_failed:Z

    .line 25
    iput-boolean v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_written:Z

    .line 26
    return-void
.end method


# virtual methods
.method public completed()V
    .locals 4

    .prologue
    .line 29
    iget-wide v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_waitTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 32
    :cond_0
    return-void
.end method

.method public isFailed()Z
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_failed:Z

    return v0
.end method

.method public run()V
    .locals 1

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_written:Z

    if-nez v0, :cond_0

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_failed:Z

    .line 41
    iget-object v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 43
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_written:Z

    .line 44
    return-void
.end method

.method public start()V
    .locals 6

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_waitTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 48
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_timer:Ljava/util/Timer;

    .line 49
    iget-object v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_timer:Ljava/util/Timer;

    iget-wide v2, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_waitTime:J

    iget-wide v4, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_waitTime:J

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 51
    :cond_0
    return-void
.end method

.method public writeHappened()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/multipart/FilePartStallHandler;->_written:Z

    .line 55
    return-void
.end method
