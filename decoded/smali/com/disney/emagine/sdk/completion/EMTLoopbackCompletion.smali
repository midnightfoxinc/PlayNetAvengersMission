.class public Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;
.super Ljava/lang/Object;
.source "EMTLoopbackCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field dataLen:I

.field delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

.field loop:I

.field startTime:J


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;JII)V
    .locals 4
    .param p1, "del"    # Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;
    .param p2, "st"    # J
    .param p4, "lp"    # I
    .param p5, "len"    # I

    .prologue
    const/4 v2, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->startTime:J

    .line 23
    iput v2, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->loop:I

    .line 24
    iput v2, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->dataLen:I

    .line 29
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    .line 30
    iput-wide p2, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->startTime:J

    .line 31
    iput p4, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->loop:I

    .line 32
    iput p5, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->dataLen:I

    .line 33
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 47
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 8
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->startTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    long-to-float v0, v2

    .line 40
    .local v0, "elapsedTime":F
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    invoke-interface {v2}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->TAG()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "loop: %d: %d bytes in %f seconds"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->loop:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget v7, p0, Lcom/disney/emagine/sdk/completion/EMTLoopbackCompletion;->dataLen:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    return-void
.end method
