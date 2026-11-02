.class public Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;
.super Ljava/lang/Object;
.source "EMTAcceptCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;


# instance fields
.field private delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

.field private deviceId:J

.field private fileName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;Ljava/lang/String;J)V
    .locals 3
    .param p1, "del"    # Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;
    .param p2, "fn"    # Ljava/lang/String;
    .param p3, "id"    # J

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->deviceId:J

    .line 31
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    .line 32
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    .line 33
    iput-wide p3, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->deviceId:J

    .line 34
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 83
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;Z[B)V
    .locals 12
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "data"    # [B

    .prologue
    .line 44
    const/4 v5, 0x1

    if-ne p2, v5, :cond_0

    .line 46
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    invoke-interface {v5}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v5

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    invoke-interface {v6}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->TAG()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "EMTAcceptCompletion: File transfer complete: [%s]  Received %d bytes"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    array-length v11, p3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    invoke-interface {v5, v6}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->isAnalyticsFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 49
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    iget-wide v8, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->deviceId:J

    invoke-interface {v5, v6, v8, v9, p3}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->handleAnalyticsFile(Ljava/lang/String;J[B)V

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 51
    :cond_1
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    invoke-interface {v5, v6}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->isPackagesPresentFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 53
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    iget-wide v8, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->deviceId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7, p3}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->handlePackagesPresentFile(Ljava/lang/String;Ljava/lang/String;[B)V

    goto :goto_0

    .line 55
    :cond_2
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    invoke-interface {v5, v6}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->isPlayerDataFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 57
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->delegate:Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    iget-wide v8, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->deviceId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7, p3}, Lcom/disney/emagine/sdk/delegate/EMTControllerDelegate;->handlePlayerDataFile(Ljava/lang/String;Ljava/lang/String;[B)V

    goto :goto_0

    .line 61
    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/INBOX/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->deviceId:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "relativePath":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->cacheDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "tempDirectory":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 64
    .local v2, "receiveDirectory":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 66
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_4

    .line 68
    invoke-static {v3, v4}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectoryAtFilePath(Ljava/lang/String;Ljava/lang/String;)Z

    .line 72
    :cond_4
    :try_start_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTAcceptCompletion;->fileName:Ljava/lang/String;

    invoke-static {p3, v2, v5}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 73
    :catch_0
    move-exception v1

    .line 75
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
