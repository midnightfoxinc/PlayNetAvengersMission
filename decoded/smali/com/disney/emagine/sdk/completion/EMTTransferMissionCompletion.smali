.class public Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;
.super Ljava/lang/Object;
.source "EMTTransferMissionCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;


# instance fields
.field completion:Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

.field delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

.field fileData:[B

.field startTime:J


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;[BJLcom/disney/emagine/sdk/completion/EMTOffsetCompletion;)V
    .locals 3
    .param p1, "del"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .param p2, "fd"    # [B
    .param p3, "st"    # J
    .param p5, "cBlock"    # Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->startTime:J

    .line 27
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .line 28
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->fileData:[B

    .line 29
    iput-wide p3, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->startTime:J

    .line 30
    iput-object p5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    .line 31
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 81
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V
    .locals 7
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "offset"    # I

    .prologue
    .line 35
    iget-wide v2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->startTime:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->startTime:J

    .line 39
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iget-wide v2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->startTime:J

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->setStartTime(J)V

    .line 42
    :cond_0
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->code()I

    move-result v1

    const/16 v2, 0x9

    if-eq v1, v2, :cond_3

    .line 44
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    if-eqz v1, :cond_1

    .line 45
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 47
    :cond_1
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File Transfer Error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/disney/emagine/sdk/apple/NSError;->localizedDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    :cond_2
    :goto_0
    return-void

    .line 49
    :cond_3
    if-nez p2, :cond_4

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    if-eqz v1, :cond_4

    .line 51
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    invoke-virtual {v1, p3}, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->run(I)V

    goto :goto_0

    .line 53
    :cond_4
    if-eqz p2, :cond_2

    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->startTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    long-to-float v0, v2

    .line 57
    .local v0, "elapsedTime":F
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG()Ljava/lang/String;

    move-result-object v2

    const-string v3, "EMTTransferMissionCompletion: File transfer complete. Sent %d bytes in %f seconds. %.2f bytes per sec."

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->fileData:[B

    array-length v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->fileData:[B

    array-length v6, v6

    int-to-float v6, v6

    div-float/2addr v6, v0

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->itemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->setItemCount(I)V

    .line 61
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    if-eqz v1, :cond_5

    .line 63
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    invoke-virtual {v1, p3}, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;->run(I)V

    .line 66
    :cond_5
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->itemCount()I

    move-result v1

    if-nez v1, :cond_6

    .line 68
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->clearCache()V

    .line 72
    :cond_6
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    if-eqz v1, :cond_7

    .line 73
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    iget-object v1, v1, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 74
    :cond_7
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;->delegate:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Semaphore release"

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
