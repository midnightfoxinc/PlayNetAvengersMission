.class public Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;
.super Ljava/lang/Object;
.source "EMTTransferCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTTransferDelegate;


# instance fields
.field completion:Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;

.field delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

.field fileData:[B

.field startTime:J

.field transferredBytes:J


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;[BJJLcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;)V
    .locals 3
    .param p1, "del"    # Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;
    .param p2, "fd"    # [B
    .param p3, "st"    # J
    .param p5, "tb"    # J
    .param p7, "cBlock"    # Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;

    .prologue
    const-wide/16 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-wide v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->startTime:J

    .line 23
    iput-wide v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->transferredBytes:J

    .line 29
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    .line 30
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->fileData:[B

    .line 31
    iput-wide p3, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->startTime:J

    .line 32
    iput-wide p5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->transferredBytes:J

    .line 33
    iput-object p7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;

    .line 34
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 80
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;ZI)V
    .locals 10
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "offset"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 39
    iget-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->startTime:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-nez v1, :cond_0

    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->startTime:J

    .line 43
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    iget-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->startTime:J

    invoke-interface {v1, v4, v5}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->setStartTime(J)V

    .line 46
    :cond_0
    iget-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->transferredBytes:J

    int-to-long v6, p3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->transferredBytes:J

    .line 47
    iget-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->transferredBytes:J

    long-to-double v4, v4

    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->fileData:[B

    array-length v1, v1

    int-to-double v6, v1

    div-double/2addr v4, v6

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    mul-double v2, v4, v6

    .line 49
    .local v2, "percent":D
    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 51
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    const-string v4, "File Transfer Error"

    invoke-interface {v1, p1, v4}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->showErrorWithTitle(Lcom/disney/emagine/sdk/apple/NSError;Ljava/lang/String;)V

    .line 52
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1, p1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->setError(Lcom/disney/emagine/sdk/apple/NSError;)V

    .line 54
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v4}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v4

    const-string v5, "File Transfer Error"

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    :cond_1
    :goto_0
    return-void

    .line 56
    :cond_2
    if-nez p2, :cond_3

    .line 58
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v4}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v4

    const-string v5, "File transfer: %.2f%%"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 60
    :cond_3
    if-eqz p2, :cond_1

    .line 62
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v4}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Finished transfer"

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->startTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-float v0, v4

    .line 66
    .local v0, "elapsedTime":F
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v1}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    iget-object v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    invoke-interface {v4}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->TAG()Ljava/lang/String;

    move-result-object v4

    const-string v5, "EMTTransferCompletion: File transfer complete. Sent %d bytes in %f seconds. %.2f bytes per sec."

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->fileData:[B

    array-length v7, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v6, v9

    const/4 v7, 0x2

    iget-object v8, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->fileData:[B

    array-length v8, v8

    int-to-float v8, v8

    div-float/2addr v8, v0

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;

    iget-wide v4, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->transferredBytes:J

    invoke-interface {v1, v4, v5}, Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;->setTransferredBytes(J)V

    .line 69
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;

    if-eqz v1, :cond_1

    .line 71
    iget-object v1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferCompletion;->completion:Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/completion/EMTFirmwareCompletion;->run()V

    goto/16 :goto_0
.end method
