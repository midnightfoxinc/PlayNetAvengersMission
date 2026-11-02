.class public Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;
.super Ljava/lang/Object;
.source "EMTTransferAnalyticsCompletion.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/disney/emagine/sdk/delegate/EMTAcceptCompletionDelegate;


# instance fields
.field private delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field private deviceId:I

.field private fileName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/String;I)V
    .locals 1
    .param p1, "del"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p2, "fn"    # Ljava/lang/String;
    .param p3, "id"    # I

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->deviceId:I

    .line 29
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 30
    iput-object p2, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

    .line 31
    iput p3, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->deviceId:I

    .line 32
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 84
    return-void
.end method

.method public run(Lcom/disney/emagine/sdk/apple/NSError;Z[B)V
    .locals 12
    .param p1, "error"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "finished"    # Z
    .param p3, "data"    # [B

    .prologue
    .line 36
    if-eqz p2, :cond_0

    .line 38
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

    if-nez v5, :cond_1

    .line 40
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v5

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error: There is no filename defined for requestedFileTransfer."

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 45
    :cond_1
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->console()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v5

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->TAG()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "EMTTransferAnalytics: File transfer complete: [%s]  Received %d bytes"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

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
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/INBOX/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->deviceId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 48
    .local v3, "relativePath":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->cacheDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 49
    .local v4, "tempDirectory":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, "receiveDirectory":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 52
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 54
    invoke-static {v3, v4}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectoryAtFilePath(Ljava/lang/String;Ljava/lang/String;)Z

    .line 57
    :cond_2
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->isAnalyticsFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 59
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

    iget v7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->deviceId:I

    int-to-long v8, v7

    invoke-virtual {v5, v6, v8, v9, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->handleAnalyticsFile(Ljava/lang/String;J[B)V

    goto :goto_0

    .line 61
    :cond_3
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->isPlayerDataFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 63
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget-object v6, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

    iget v7, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->deviceId:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7, p3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->handlePlayerDataFile(Ljava/lang/String;Ljava/lang/String;[B)V

    goto/16 :goto_0

    .line 68
    :cond_4
    :try_start_0
    iget-object v5, p0, Lcom/disney/emagine/sdk/completion/EMTTransferAnalyticsCompletion;->fileName:Ljava/lang/String;

    invoke-static {p3, v2, v5}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 69
    :catch_0
    move-exception v1

    .line 71
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0
.end method
