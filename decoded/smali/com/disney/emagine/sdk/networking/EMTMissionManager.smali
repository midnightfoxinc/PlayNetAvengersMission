.class public Lcom/disney/emagine/sdk/networking/EMTMissionManager;
.super Ljava/lang/Object;
.source "EMTMissionManager.java"

# interfaces
.implements Lcom/disney/emagine/sdk/delegate/EMTTransferCompletionDelegate;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/networking/EMTMissionManager;


# instance fields
.field private averageVelocity:J

.field private cacheSeparator:Ljava/lang/String;

.field public currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

.field public directoryContents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private itemCount:I

.field private lastMeasuredTime:J

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private manifestItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private missionSizeFloat:D

.field private networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field private previousPercent:I

.field public semaphore:Ljava/util/concurrent/Semaphore;

.field private startTime:J

.field private transferredBytes:J

.field private zipFilePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const-class v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->$assertionsDisabled:Z

    .line 66
    const-class v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    return-void

    .line 62
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->itemCount:I

    .line 76
    iput-wide v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->startTime:J

    .line 77
    iput-wide v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->transferredBytes:J

    .line 78
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->missionSizeFloat:D

    .line 79
    iput v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->previousPercent:I

    .line 80
    iput-wide v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->averageVelocity:J

    .line 81
    iput-wide v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->lastMeasuredTime:J

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->zipFilePath:Ljava/lang/String;

    .line 84
    const-string v0, "xxyyzz"

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->cacheSeparator:Ljava/lang/String;

    .line 89
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems:Ljava/util/ArrayList;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    .line 92
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sharedInstance()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    .line 93
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 94
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/emagine/sdk/networking/EMTMissionManager;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/networking/EMTMissionManager;
    .locals 1

    .prologue
    .line 98
    sget-object v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->instance:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    if-nez v0, :cond_0

    .line 100
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->instance:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    .line 103
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->instance:Lcom/disney/emagine/sdk/networking/EMTMissionManager;

    return-object v0
.end method


# virtual methods
.method public TAG()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1526
    sget-object v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public addLineToConsole(Ljava/lang/String;)V
    .locals 2
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 1622
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1623
    return-void
.end method

.method public averageVelocity()J
    .locals 2

    .prologue
    .line 1591
    iget-wide v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->averageVelocity:J

    return-wide v0
.end method

.method public cacheDirectory()Ljava/lang/String;
    .locals 3

    .prologue
    .line 129
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/emagine/app/EmagineApplication;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 131
    .local v0, "cache":Ljava/io/File;
    if-nez v0, :cond_0

    .line 133
    const/4 v1, 0x0

    .line 138
    :goto_0
    return-object v1

    .line 136
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 138
    .local v1, "root":Ljava/lang/String;
    goto :goto_0
.end method

.method public calculateCompressedFileSize(Ljava/lang/String;)I
    .locals 6
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 488
    const/4 v3, 0x0

    .line 490
    .local v3, "size":I
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->isFileCompressible(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 492
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTFileManager;->bytesFromFile(Ljava/lang/String;)[B

    move-result-object v2

    .line 493
    .local v2, "fileData":[B
    invoke-static {v2}, Lcom/disney/emagine/sdk/zip/EMTCompressor;->compressSource([B)[B

    move-result-object v0

    .line 495
    .local v0, "compressedContents":[B
    array-length v3, v0

    .line 507
    .end local v0    # "compressedContents":[B
    .end local v2    # "fileData":[B
    :cond_0
    :goto_0
    return v3

    .line 499
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 501
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 503
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int v3, v4

    goto :goto_0
.end method

.method public calculateFileSize(Ljava/lang/String;)I
    .locals 4
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 512
    const/4 v1, 0x0

    .line 514
    .local v1, "size":I
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 516
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 518
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v1, v2

    .line 521
    :cond_0
    return v1
.end method

.method public calculateMissionSizeFromManifest(Ljava/util/HashMap;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 1070
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .line 1072
    .local v2, "sizeInBytes":I
    const-string v3, "files"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1074
    .local v1, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 1076
    .local v0, "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "s"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v2, v3

    .line 1077
    goto :goto_0

    .line 1079
    .end local v0    # "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return v2
.end method

.method public checkStringContainsString(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "mainString"    # Ljava/lang/String;
    .param p2, "subString"    # Ljava/lang/String;

    .prologue
    .line 148
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public clearCache()V
    .locals 5

    .prologue
    .line 555
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->cacheDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 557
    .local v2, "tempDir":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->cacheSeparator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 559
    .local v0, "destPath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 561
    .local v1, "root":Ljava/io/File;
    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTFileManager;->deleteContentsOfDirectory(Ljava/io/File;)V

    .line 562
    return-void
.end method

.method public console()Lcom/disney/emagine/sdk/EMTConsole;
    .locals 1

    .prologue
    .line 1507
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v0
.end method

.method public currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;
    .locals 1

    .prologue
    .line 1631
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->currentDevice:Lcom/disney/emagine/sdk/ble/EMTDevice;

    return-object v0
.end method

.method public directoryContents()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1606
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    return-object v0
.end method

.method public documentsDirectory()Ljava/lang/String;
    .locals 3

    .prologue
    .line 115
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/emagine/app/EmagineApplication;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 117
    .local v0, "docs":Ljava/io/File;
    if-nez v0, :cond_0

    .line 119
    const/4 v1, 0x0

    .line 124
    :goto_0
    return-object v1

    .line 122
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "root":Ljava/lang/String;
    goto :goto_0
.end method

.method public download(Ljava/lang/String;Ljava/lang/String;[BLcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;)V
    .locals 19
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "sha1"    # [B
    .param p4, "success"    # Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;

    .prologue
    .line 290
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v14

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".zip"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->zipFilePath:Ljava/lang/String;

    .line 291
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->zipFilePath:Ljava/lang/String;

    invoke-static {v13}, Lcom/disney/emagine/sdk/EMTFileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v13

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 292
    .local v6, "fileExists":Ljava/lang/Boolean;
    const/4 v13, 0x1

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 294
    .local v4, "downloadFromCloud":Ljava/lang/Boolean;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v15, "download path: [%s]"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->zipFilePath:Ljava/lang/String;

    move-object/from16 v18, v0

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-eqz v13, :cond_1

    if-eqz p3, :cond_1

    move-object/from16 v0, p3

    array-length v13, v0

    const/16 v14, 0x14

    if-ne v13, v14, :cond_1

    .line 298
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->zipFilePath:Ljava/lang/String;

    invoke-static {v13}, Lcom/disney/emagine/sdk/EMTFileManager;->bytesFromFile(Ljava/lang/String;)[B

    move-result-object v12

    .line 300
    .local v12, "zipData":[B
    if-eqz v12, :cond_1

    .line 302
    const/4 v9, 0x0

    .line 303
    .local v9, "md":Ljava/security/MessageDigest;
    const/4 v10, 0x0

    .line 307
    .local v10, "mdBytes":[B
    :try_start_0
    const-string v13, "SHA1"

    invoke-static {v13}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v9

    .line 309
    invoke-virtual {v9, v12}, Ljava/security/MessageDigest;->update([B)V

    .line 311
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 318
    :goto_0
    if-eqz v10, :cond_0

    const/16 v13, 0x14

    move-object/from16 v0, p3

    invoke-static {v10, v0, v13}, Lcom/disney/emagine/sdk/EMTData;->isEqual([B[BI)Z

    move-result v13

    if-nez v13, :cond_4

    :cond_0
    const/4 v13, 0x1

    :goto_1
    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 322
    .end local v9    # "md":Ljava/security/MessageDigest;
    .end local v10    # "mdBytes":[B
    .end local v12    # "zipData":[B
    :cond_1
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    if-nez v13, :cond_5

    .line 324
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_3

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 326
    .local v3, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v14, "name"

    invoke-virtual {v3, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_2

    .line 328
    const-string v13, "path"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->zipFilePath:Ljava/lang/String;

    invoke-virtual {v3, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;->run(Ljava/util/HashMap;)V

    .line 396
    .end local v3    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3
    :goto_2
    return-void

    .line 313
    .restart local v9    # "md":Ljava/security/MessageDigest;
    .restart local v10    # "mdBytes":[B
    .restart local v12    # "zipData":[B
    :catch_0
    move-exception v5

    .line 315
    .local v5, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v5}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0

    .line 318
    .end local v5    # "e":Ljava/security/NoSuchAlgorithmException;
    :cond_4
    const/4 v13, 0x0

    goto :goto_1

    .line 338
    .end local v9    # "md":Ljava/security/MessageDigest;
    .end local v10    # "mdBytes":[B
    .end local v12    # "zipData":[B
    :cond_5
    move-object/from16 v11, p1

    .line 340
    .local v11, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v14, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v15, "download url: [%s]"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v11, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    new-instance v8, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v8}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 344
    .local v8, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v13

    invoke-virtual {v13, v8}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 346
    new-instance v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p4

    invoke-direct {v7, v0, v1, v2}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$2;-><init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/Runnable;Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;)V

    .line 394
    .local v7, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->zipFilePath:Ljava/lang/String;

    iput-object v13, v7, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 395
    new-instance v13, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    const/4 v14, 0x0

    invoke-direct {v13, v14}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    const/4 v14, 0x0

    invoke-virtual {v8}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v15

    invoke-virtual {v13, v11, v14, v15, v7}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    goto :goto_2
.end method

.method public fileCountFromManifest(Ljava/util/HashMap;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 1036
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 1038
    .local v0, "count":I
    const-string v2, "files"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1040
    .local v1, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1041
    return v0
.end method

.method public fileSizeFromManifest(Ljava/util/HashMap;Ljava/lang/String;)I
    .locals 7
    .param p2, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1048
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, 0x0

    .line 1050
    .local v3, "sizeInBytes":I
    const-string v4, "files"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 1052
    .local v1, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 1054
    .local v0, "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "f"

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1056
    .local v2, "path":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1058
    const-string v4, "s"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 1064
    .end local v0    # "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "path":Ljava/lang/String;
    :cond_1
    return v3
.end method

.method public generateManifest(Ljava/util/HashMap;S)Ljava/util/HashMap;
    .locals 16
    .param p2, "deviceType"    # S
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;S)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 809
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p2, :cond_0

    .line 811
    const/16 p2, 0x835

    .line 814
    :cond_0
    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 815
    .local v4, "deviceTypeString":Ljava/lang/String;
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 816
    .local v10, "manifestResult":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v11, 0x0

    .line 817
    .local v11, "manifestType":Ljava/lang/String;
    const/4 v7, 0x0

    .line 818
    .local v7, "fileSetsAudio":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v8, 0x0

    .line 819
    .local v8, "fileSetsCode":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v6, 0x0

    .line 823
    .local v6, "error":Z
    :try_start_0
    const-string v12, "id"

    const-string v13, "experienceId"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 824
    const-string v12, "name"

    const-string v13, "name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 825
    const-string v12, "description"

    const-string v13, "description"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    const-string v12, "version"

    const-string v13, "version"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 827
    const-string v12, "hash"

    const-string v13, "hash"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    const-string v12, "url"

    const-string v13, "restUrl"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 830
    const-string v12, "type"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    move-object v0, v12

    check-cast v0, Ljava/lang/String;

    move-object v11, v0

    .line 831
    const-string v12, "fileSetsAudio"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    move-object v0, v12

    check-cast v0, Ljava/util/HashMap;

    move-object v7, v0

    .line 832
    const-string v12, "fileSetsCode"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    move-object v0, v12

    check-cast v0, Ljava/util/HashMap;

    move-object v8, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 841
    :goto_0
    if-nez v6, :cond_1

    const-string v12, "id"

    invoke-virtual {v10, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_1

    const-string v12, "url"

    invoke-virtual {v10, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_1

    if-nez v11, :cond_2

    .line 843
    :cond_1
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v14, "Error: the manifest item is empty"

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 845
    const/4 v10, 0x0

    .line 865
    .end local v10    # "manifestResult":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_1
    return-object v10

    .line 834
    .restart local v10    # "manifestResult":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v5

    .line 836
    .local v5, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v13, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error trying to set the manifest. Exception = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v5}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 838
    const/4 v6, 0x1

    goto :goto_0

    .line 848
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_2
    const/4 v1, 0x0

    .line 850
    .local v1, "contentType":I
    const-string v12, "FIRMWARE"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 852
    const/4 v1, 0x1

    .line 855
    :cond_3
    const-string v12, "type"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 857
    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 858
    .local v2, "deviceFileSetsAudio":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 859
    .local v9, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 861
    .local v3, "deviceFileSetsCode":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 863
    const-string v12, "files"

    invoke-virtual {v10, v12, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public getCachedPackages(I)V
    .locals 24
    .param p1, "deviceId"    # I

    .prologue
    .line 1337
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v14

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    .line 1338
    .local v10, "path":Ljava/lang/String;
    const-string v14, "%s/%d"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v10, v15, v16

    const/16 v16, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1340
    .local v3, "cacheDirectory":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1342
    .local v2, "cache":Ljava/io/File;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1344
    .local v6, "packageDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 1346
    .local v5, "listOfFiles":[Ljava/io/File;
    if-eqz v5, :cond_3

    array-length v14, v5

    if-lez v14, :cond_3

    .line 1348
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    const/4 v14, 0x0

    move v15, v14

    :goto_0
    move/from16 v0, v17

    if-ge v15, v0, :cond_3

    aget-object v7, v16, v15

    .line 1350
    .local v7, "packageDir":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v14

    if-eqz v14, :cond_2

    .line 1352
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    .line 1353
    .local v8, "packageName":Ljava/lang/String;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1355
    .local v9, "packageVersions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v18

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v19, v0

    const/4 v14, 0x0

    :goto_1
    move/from16 v0, v19

    if-ge v14, v0, :cond_1

    aget-object v13, v18, v14

    .line 1357
    .local v13, "versionDir":Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->isDirectory()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 1360
    :try_start_0
    invoke-virtual {v13}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    .line 1361
    .local v12, "version":Ljava/lang/Integer;
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1355
    .end local v12    # "version":Ljava/lang/Integer;
    :cond_0
    :goto_2
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 1363
    :catch_0
    move-exception v4

    .line 1365
    .local v4, "e":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    move-object/from16 v20, v0

    sget-object v21, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Non-Integer directory found in package dir: ["

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "]"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1366
    invoke-virtual {v4}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_2

    .line 1373
    .end local v4    # "e":Ljava/lang/NumberFormatException;
    .end local v13    # "versionDir":Ljava/io/File;
    :cond_1
    invoke-virtual {v6, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1348
    .end local v8    # "packageName":Ljava/lang/String;
    .end local v9    # "packageVersions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_2
    add-int/lit8 v14, v15, 0x1

    move v15, v14

    goto :goto_0

    .line 1381
    .end local v7    # "packageDir":Ljava/io/File;
    :cond_3
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1383
    .local v1, "appResponse":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v14, "payload"

    invoke-virtual {v1, v14, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1384
    const-string v14, "from"

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v1, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1386
    invoke-static {v1}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 1388
    .local v11, "responseJson":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v14

    const/16 v15, 0x20

    invoke-virtual {v14, v15, v11}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1389
    return-void
.end method

.method public getContentMetadata(Ljava/lang/String;ILcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;)V
    .locals 8
    .param p1, "experienceId"    # Ljava/lang/String;
    .param p2, "deviceId"    # I
    .param p3, "success"    # Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 159
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v3, v3, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->accessToken:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 161
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v5, "Need to login before you can get the manifest"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    :goto_0
    return-void

    .line 166
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v4, v4, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/runtimeorchestrator/v1/experience/getContentMetadata/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 168
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Calling "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 172
    .local v1, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 174
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 175
    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 177
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;

    invoke-direct {v0, p0, p3, p1, p3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$1;-><init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/Runnable;Ljava/lang/String;Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;)V

    .line 285
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v3, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v3, v7}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v3, v2, v7, v4, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    goto :goto_0
.end method

.method public getEntitlements(ISLcom/disney/emagine/sdk/completion/EMTManifestSuccess;)V
    .locals 8
    .param p1, "deviceId"    # I
    .param p2, "deviceType"    # S
    .param p3, "success"    # Lcom/disney/emagine/sdk/completion/EMTManifestSuccess;

    .prologue
    const/4 v7, 0x0

    .line 400
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v4, v4, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/runtimeorchestrator/v1/heartbeat/entitlements"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 402
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "download content url: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 406
    .local v1, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 408
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 409
    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 411
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;

    invoke-direct {v0, p0, p3, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$3;-><init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/Runnable;SLcom/disney/emagine/sdk/completion/EMTManifestSuccess;)V

    .line 468
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v3, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v3, v7}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v3, v2, v7, v4, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 469
    return-void
.end method

.method public getFilePathForManifest(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 871
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestFileName(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v2

    .line 872
    .local v2, "filename":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v5

    invoke-virtual {v5}, Lcom/disney/emagine/app/EmagineApplication;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 873
    .local v3, "myDir":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 874
    .local v4, "root":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 876
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 878
    const-string v5, "manifests"

    invoke-static {v5, v4}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectoryAtFilePath(Ljava/lang/String;Ljava/lang/String;)Z

    .line 881
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/manifest/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 883
    .local v1, "fileNameWithPath":Ljava/lang/String;
    return-object v1
.end method

.method public getFilesFromManifest(Ljava/util/HashMap;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 889
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "files"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 890
    .local v2, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 892
    .local v1, "fileList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 894
    .local v0, "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "f"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 897
    .end local v0    # "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-object v1
.end method

.method public isFileCompressible(Ljava/lang/String;)Z
    .locals 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 473
    const/4 v0, 0x1

    .line 476
    .local v0, "compressible":Z
    const-string v1, "ply"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "fwp"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 478
    :cond_0
    const/4 v0, 0x0

    .line 480
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Compression disabled for path "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    :cond_1
    return v0
.end method

.method public itemCount()I
    .locals 1

    .prologue
    .line 1517
    iget v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->itemCount:I

    return v0
.end method

.method public lastMeasuredTime()J
    .locals 2

    .prologue
    .line 1601
    iget-wide v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->lastMeasuredTime:J

    return-wide v0
.end method

.method public listSavedManifests()Ljava/util/ArrayList;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v11, -0x1

    .line 995
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->documentsDirectory()Ljava/lang/String;

    move-result-object v8

    .line 996
    .local v8, "root":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/manifests"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 997
    .local v5, "manifestPath":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->recursiveFilesFromDirectory(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 999
    .local v3, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1001
    .local v4, "filesOut":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 1003
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1006
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 1008
    .local v6, "path":Ljava/lang/String;
    const/16 v10, 0x2f

    invoke-virtual {v6, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    .line 1009
    .local v7, "pathIndex":I
    const/16 v10, 0x2e

    invoke-virtual {v6, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 1011
    .local v0, "extIndex":I
    if-ne v7, v11, :cond_2

    .line 1013
    const/4 v7, 0x0

    .line 1020
    :goto_1
    if-ne v0, v11, :cond_1

    .line 1022
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    .line 1025
    :cond_1
    invoke-virtual {v6, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 1027
    .local v2, "fileComponent":Ljava/lang/String;
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1017
    .end local v2    # "fileComponent":Ljava/lang/String;
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1031
    .end local v0    # "extIndex":I
    .end local v1    # "file":Ljava/io/File;
    .end local v6    # "path":Ljava/lang/String;
    .end local v7    # "pathIndex":I
    :cond_3
    return-object v4
.end method

.method public login(Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;)V
    .locals 3
    .param p1, "success"    # Lcom/disney/emagine/sdk/completion/EMTLoginSuccess;

    .prologue
    .line 109
    new-instance v0, Lcom/disney/emagine/sdk/apple/NSAssert;

    const/4 v1, 0x0

    const-string v2, "This feature is no longer supported through this API."

    invoke-direct {v0, v1, v2}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 110
    return-void
.end method

.method public manifestFileName(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 957
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "id"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".manifest"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public manifestItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method public missionSizeFloat()D
    .locals 2

    .prologue
    .line 1571
    iget-wide v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->missionSizeFloat:D

    return-wide v0
.end method

.method public networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .locals 1

    .prologue
    .line 153
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->sharedInstance()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v0

    return-object v0
.end method

.method public previousPercent()I
    .locals 1

    .prologue
    .line 1581
    iget v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->previousPercent:I

    return v0
.end method

.method public readManifestFromFile(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 12
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 962
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v8

    invoke-virtual {v8}, Lcom/disney/emagine/app/EmagineApplication;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 963
    .local v1, "docs":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 965
    .local v7, "root":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/manifests/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".manifest"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 967
    .local v6, "manifestPath":Ljava/lang/String;
    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTFileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 969
    iget-object v8, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Error: file does not exist for path = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 990
    :cond_0
    :goto_0
    return-object v5

    .line 973
    :cond_1
    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTFileManager;->bytesFromFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 974
    .local v0, "data":[B
    sget-boolean v8, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->$assertionsDisabled:Z

    if-nez v8, :cond_2

    if-nez v0, :cond_2

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 976
    :cond_2
    const/4 v3, 0x0

    .line 978
    .local v3, "jsonString":Ljava/lang/String;
    :try_start_0
    new-instance v4, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v4, v0, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "jsonString":Ljava/lang/String;
    .local v4, "jsonString":Ljava/lang/String;
    move-object v3, v4

    .line 983
    .end local v4    # "jsonString":Ljava/lang/String;
    .restart local v3    # "jsonString":Ljava/lang/String;
    :goto_1
    if-eqz v3, :cond_0

    .line 988
    invoke-static {v3}, Lcom/disney/emagine/sdk/json/EMTJson;->hashMapFromJsonString(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v5

    .line 990
    .local v5, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    goto :goto_0

    .line 979
    .end local v5    # "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v2

    .line 981
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1
.end method

.method public receivePackageMetadata(Ljava/util/HashMap;ILjava/lang/String;I)V
    .locals 20
    .param p2, "deviceId"    # I
    .param p3, "packageId"    # Ljava/lang/String;
    .param p4, "version"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;I",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 1138
    .local p1, "metaData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 1140
    .local v9, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "hmac-key"

    const-string v4, "hmac-key"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1141
    const-string v4, "hmac-sha1"

    const-string v1, "hmac-sha1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v1, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    invoke-virtual {v9, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1144
    const-string v1, "manifest"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v1, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v12

    .line 1146
    .local v12, "manifestData":[B
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v17

    .line 1147
    .local v17, "path":Ljava/lang/String;
    const-string v1, "%s.pmp"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p3, v4, v5

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 1148
    .local v11, "fileNameWithSuffix":Ljava/lang/String;
    const-string v1, "%s/%d/%s/%d"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v17, v4, v5

    const/4 v5, 0x1

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    aput-object p3, v4, v5

    const/4 v5, 0x3

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1149
    .local v7, "cacheDirectory":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1150
    .local v13, "manifestPath":Ljava/lang/String;
    const-string v1, "%s.pmp"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p3, v4, v5

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 1151
    .local v8, "destinationPath":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ".meta"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1152
    .local v14, "metaPath":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "/"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ".zip"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1168
    .local v3, "zipPath":Ljava/lang/String;
    const-string v1, "manifestPath"

    invoke-virtual {v9, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1169
    const-string v1, "destinationPath"

    invoke-virtual {v9, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1170
    const-string v1, "manifestData"

    invoke-virtual {v9, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1171
    const-string v1, "zipPath"

    invoke-virtual {v9, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1173
    invoke-static {v7}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectoryAtFilePath(Ljava/lang/String;)Z

    .line 1174
    invoke-static {v12, v13}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;)V

    .line 1176
    const-string v1, "manifest-path"

    invoke-virtual {v9, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1179
    const-string v1, "packageKey"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/HashMap;

    .line 1182
    .local v16, "packageKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    const-string v4, "packageIV"

    const-string v1, "packageIV"

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v9, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1183
    const-string v4, "packageKey"

    const-string v1, "packageKey"

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v9, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1184
    const-string v4, "packageSHA1"

    const-string v1, "packageSHA1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v9, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1185
    const-string v1, "files"

    const-string v4, "contentFiles"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1194
    array-length v1, v12

    if-nez v1, :cond_0

    .line 1196
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v5, "Error: Manifest for %s length is zero"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v18, 0x0

    aput-object p3, v6, v18

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1232
    :goto_0
    return-void

    .line 1187
    :catch_0
    move-exception v10

    .line 1189
    .local v10, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v5, "Warning: Entry missing from backend package or manifest.\nPackage Key: %s\nmetaData: %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v18, 0x0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v6, v18

    const/16 v18, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v6, v18

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1190
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 1200
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v1, "downloadUrl"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/String;

    if-nez v1, :cond_1

    .line 1202
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v5, "download url is NULL for: [%s].  This is a backend problem in archimedes, slack Reza."

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v18, 0x0

    aput-object p3, v6, v18

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1206
    :cond_1
    const-string v1, "downloadUrl"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1209
    .local v2, "zipUrlString":Ljava/lang/String;
    :try_start_1
    const-string v1, "packageSHA1"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v4

    move-object/from16 v1, p0

    move-object/from16 v5, p3

    move/from16 v6, p4

    invoke-virtual/range {v1 .. v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->receivePackageZipFromUrl(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1216
    :goto_1
    const-string v1, "id"

    move-object/from16 v0, p3

    invoke-virtual {v9, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1217
    const-string v1, "name"

    move-object/from16 v0, p3

    invoke-virtual {v9, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1218
    const-string v1, "path"

    invoke-virtual {v9, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1219
    const-string v1, "version"

    new-instance v4, Ljava/lang/Integer;

    move/from16 v0, p4

    invoke-direct {v4, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v9, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1222
    :try_start_2
    new-instance v15, Ljava/io/ObjectOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v15, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1223
    .local v15, "oos":Ljava/io/ObjectOutputStream;
    invoke-virtual {v15, v9}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1224
    invoke-virtual {v15}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1231
    .end local v15    # "oos":Ljava/io/ObjectOutputStream;
    :goto_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 1211
    :catch_1
    move-exception v10

    .line 1213
    .restart local v10    # "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to open package zip URL : ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1226
    .end local v10    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v10

    .line 1228
    .restart local v10    # "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to write package metadata to filesystem : ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public receivePackageToMobile(ILjava/lang/String;I)V
    .locals 9
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    const/4 v3, 0x0

    .line 1104
    const-string v1, "https://%s/runtimeorchestrator/v1/entitlement/content/metadata/%d/%s/%d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    iget-object v5, v5, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->rtoHost:Ljava/lang/String;

    aput-object v5, v2, v4

    const/4 v4, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x2

    aput-object p2, v2, v4

    const/4 v4, 0x3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 1105
    .local v8, "urlString":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "receivePackageToMobile: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1107
    new-instance v7, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v7}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 1109
    .local v7, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v1

    invoke-virtual {v1, v7}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 1111
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;

    move-object v1, p0

    move v2, p1

    move v4, p1

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$4;-><init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;ILjava/lang/Runnable;ILjava/lang/String;I)V

    .line 1133
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v1, v3}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    invoke-virtual {v7}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v8, v3, v2, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 1134
    return-void
.end method

.method public receivePackageZipFromUrl(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;I)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "zipPath"    # Ljava/lang/String;
    .param p3, "sha1"    # [B
    .param p4, "packageId"    # Ljava/lang/String;
    .param p5, "version"    # I

    .prologue
    const/4 v6, 0x0

    .line 1236
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "download content url: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 1238
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;-><init>()V

    .line 1240
    .local v1, "httpHeaders":Lcom/disney/emagine/sdk/networking/EMTRestHeaders;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->networkClient()Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;->setAuthHeaders(Lcom/disney/emagine/sdk/networking/EMTRestHeaders;)V

    .line 1242
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;

    invoke-direct {v0, p0, p4, p5, p3}, Lcom/disney/emagine/sdk/networking/EMTMissionManager$5;-><init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/String;I[B)V

    .line 1331
    .local v0, "handler":Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    iput-object p2, v0, Lcom/disney/emagine/sdk/networking/EMTRestHandler;->docPath:Ljava/lang/String;

    .line 1332
    new-instance v2, Lcom/disney/emagine/sdk/networking/EMTRestClient;

    invoke-direct {v2, v6}, Lcom/disney/emagine/sdk/networking/EMTRestClient;-><init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/networking/EMTRestHeaders;->headers()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v2, p1, v6, v3, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 1333
    return-void
.end method

.method public recursiveFilesFromDirectory(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6
    .param p1, "directoryPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 566
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 567
    .local v1, "files":[Ljava/io/File;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 569
    .local v2, "filesOut":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    array-length v4, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v0, v1, v3

    .line 572
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isHidden()Z

    move-result v5

    if-nez v5, :cond_0

    .line 574
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->recursiveFilesFromDirectory(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 577
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isHidden()Z

    move-result v5

    if-nez v5, :cond_1

    .line 579
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 569
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 583
    .end local v0    # "file":Ljava/io/File;
    :cond_2
    return-object v2
.end method

.method public removeAllCachedPackages(I)V
    .locals 18
    .param p1, "deviceId"    # I

    .prologue
    .line 1402
    const/4 v8, 0x1

    .line 1406
    .local v8, "status":I
    :try_start_0
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 1407
    .local v6, "path":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    const-string v11, "%s/%d"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v6, v12, v13

    const/4 v13, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v1, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1409
    .local v1, "cacheDirectory":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v11

    if-nez v11, :cond_0

    .line 1451
    const-string v11, "{\"success\":%d,\"from\":%d}"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1453
    .local v7, "responseJson":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v11

    const/16 v12, 0x22

    invoke-virtual {v11, v12, v7}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1455
    :goto_0
    return-void

    .line 1413
    .end local v7    # "responseJson":Ljava/lang/String;
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 1414
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1451
    const-string v11, "{\"success\":%d,\"from\":%d}"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1453
    .restart local v7    # "responseJson":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v11

    const/16 v12, 0x22

    invoke-virtual {v11, v12, v7}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 1418
    .end local v7    # "responseJson":Ljava/lang/String;
    :cond_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .line 1419
    .local v3, "files":[Ljava/io/File;
    if-nez v3, :cond_2

    .line 1451
    const-string v11, "{\"success\":%d,\"from\":%d}"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1453
    .restart local v7    # "responseJson":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v11

    const/16 v12, 0x22

    invoke-virtual {v11, v12, v7}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto :goto_0

    .line 1423
    .end local v7    # "responseJson":Ljava/lang/String;
    :cond_2
    :try_start_3
    array-length v14, v3

    const/4 v11, 0x0

    move v13, v11

    :goto_1
    if-ge v13, v14, :cond_6

    aget-object v4, v3, v13

    .line 1425
    .local v4, "packageDirectory":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 1427
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 1423
    :goto_2
    add-int/lit8 v11, v13, 0x1

    move v13, v11

    goto :goto_1

    .line 1431
    :cond_3
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 1433
    .local v5, "packageDirectoryFiles":[Ljava/io/File;
    if-eqz v5, :cond_5

    .line 1434
    array-length v15, v5

    const/4 v11, 0x0

    move v12, v11

    :goto_3
    if-ge v12, v15, :cond_5

    aget-object v9, v5, v12

    .line 1436
    .local v9, "versionDirectory":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v10

    .line 1437
    .local v10, "versionDirectoryFiles":[Ljava/io/File;
    if-eqz v10, :cond_4

    .line 1438
    invoke-virtual {v9}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    const/4 v11, 0x0

    :goto_4
    move/from16 v0, v17

    if-ge v11, v0, :cond_4

    aget-object v2, v16, v11

    .line 1440
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 1438
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 1443
    .end local v2    # "file":Ljava/io/File;
    :cond_4
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 1434
    add-int/lit8 v11, v12, 0x1

    move v12, v11

    goto :goto_3

    .line 1447
    .end local v9    # "versionDirectory":Ljava/io/File;
    .end local v10    # "versionDirectoryFiles":[Ljava/io/File;
    :cond_5
    invoke-virtual {v4}, Ljava/io/File;->delete()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 1451
    .end local v1    # "cacheDirectory":Ljava/io/File;
    .end local v3    # "files":[Ljava/io/File;
    .end local v4    # "packageDirectory":Ljava/io/File;
    .end local v5    # "packageDirectoryFiles":[Ljava/io/File;
    .end local v6    # "path":Ljava/lang/String;
    :catchall_0
    move-exception v11

    const-string v12, "{\"success\":%d,\"from\":%d}"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1453
    .restart local v7    # "responseJson":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v12

    const/16 v13, 0x22

    invoke-virtual {v12, v13, v7}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 1454
    throw v11

    .line 1451
    .end local v7    # "responseJson":Ljava/lang/String;
    .restart local v1    # "cacheDirectory":Ljava/io/File;
    .restart local v3    # "files":[Ljava/io/File;
    .restart local v6    # "path":Ljava/lang/String;
    :cond_6
    const-string v11, "{\"success\":%d,\"from\":%d}"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1453
    .restart local v7    # "responseJson":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v11

    const/16 v12, 0x22

    invoke-virtual {v11, v12, v7}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0
.end method

.method public saveManifestToPath(Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 14
    .param p2, "filePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 902
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v8, 0x0

    .line 904
    .local v8, "result":Z
    invoke-static {p1}, Lcom/disney/emagine/sdk/json/EMTJson;->bytesFromJavaObject(Ljava/lang/Object;)[B

    move-result-object v1

    .line 905
    .local v1, "data":[B
    const/4 v7, 0x0

    .line 907
    .local v7, "manifestPath":Ljava/lang/String;
    if-nez p2, :cond_1

    .line 909
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v10

    invoke-virtual {v10}, Lcom/disney/emagine/app/EmagineApplication;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 910
    .local v2, "docs":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    .line 911
    .local v9, "root":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestFileName(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v5

    .line 912
    .local v5, "fileName":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/manifests/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 913
    iget-object v10, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v11, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Saving manifest = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 922
    .end local v2    # "docs":Ljava/io/File;
    .end local v5    # "fileName":Ljava/lang/String;
    .end local v9    # "root":Ljava/lang/String;
    :goto_0
    :try_start_0
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 924
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 925
    .local v0, "createdDirectories":Z
    if-nez v0, :cond_0

    .line 927
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 929
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 933
    :cond_0
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z

    .line 935
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 937
    .local v6, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v6, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 938
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 939
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 941
    const/4 v8, 0x1

    .line 952
    .end local v0    # "createdDirectories":Z
    .end local v4    # "file":Ljava/io/File;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    :goto_1
    return v8

    .line 916
    :cond_1
    move-object/from16 v7, p2

    goto :goto_0

    .line 943
    :catch_0
    move-exception v3

    .line 945
    .local v3, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 947
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v3

    .line 949
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public sendFile(Ljava/lang/String;IILjava/lang/String;Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;)V
    .locals 14
    .param p1, "fileSourcePath"    # Ljava/lang/String;
    .param p2, "version"    # I
    .param p3, "deviceId"    # I
    .param p4, "path"    # Ljava/lang/String;
    .param p5, "completion"    # Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    .prologue
    .line 527
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTFileManager;->bytesFromFile(Ljava/lang/String;)[B

    move-result-object v5

    .line 529
    .local v5, "fileData":[B
    array-length v3, v5

    if-nez v3, :cond_1

    .line 531
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v6, "Error: File %s length is zero"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    :cond_0
    :goto_0
    return-void

    .line 536
    :cond_1
    const/4 v12, 0x1

    .line 539
    .local v12, "compressionEnabled":Z
    const-string v3, ".ply"

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, ".fwp"

    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 541
    :cond_2
    const/4 v12, 0x0

    .line 543
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Compression disabled for path "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    :cond_3
    iget-object v3, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v6, "Beginning file transfer to %s with version= %d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p4, v7, v8

    const/4 v8, 0x1

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 548
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v2

    .line 549
    .local v2, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v2, :cond_0

    .line 550
    move/from16 v0, p3

    int-to-long v10, v0

    new-instance v3, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;

    iget-wide v6, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->startTime:J

    move-object v4, p0

    move-object/from16 v8, p5

    invoke-direct/range {v3 .. v8}, Lcom/disney/emagine/sdk/completion/EMTTransferMissionCompletion;-><init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;[BJLcom/disney/emagine/sdk/completion/EMTOffsetCompletion;)V

    move-object v6, v2

    move-object/from16 v7, p4

    move-object v8, v5

    move/from16 v9, p2

    move-object v13, v3

    invoke-virtual/range {v6 .. v13}, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferFile(Ljava/lang/String;[BIJZLcom/disney/emagine/sdk/delegate/EMTTransferDelegate;)V

    goto :goto_0
.end method

.method public sendMission(Ljava/util/HashMap;ILcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;)V
    .locals 34
    .param p2, "deviceId"    # I
    .param p3, "completion"    # Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;I",
            "Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;",
            ")V"
        }
    .end annotation

    .prologue
    .line 621
    .local p1, "mission":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "path"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 622
    .local v22, "missionPath":Ljava/lang/String;
    if-nez v22, :cond_0

    .line 802
    :goto_0
    return-void

    .line 627
    :cond_0
    const-string v26, "xxyyzz"

    .line 629
    .local v26, "separator":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->cacheDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v29

    .line 631
    .local v29, "tempDir":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 633
    .local v13, "destPath":Ljava/lang/String;
    new-instance v25, Ljava/io/File;

    move-object/from16 v0, v25

    invoke-direct {v0, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 634
    .local v25, "root":Ljava/io/File;
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->clearCache()V

    .line 636
    move-object/from16 v0, v26

    move-object/from16 v1, v29

    invoke-static {v0, v1}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectoryAtFilePath(Ljava/lang/String;Ljava/lang/String;)Z

    .line 638
    new-instance v27, Ljava/util/ArrayList;

    const/16 v4, 0xa

    move-object/from16 v0, v27

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 639
    .local v27, "srcComponents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v20, Ljava/io/File;

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v20, "missionFile":Ljava/io/File;
    :goto_1
    if-eqz v20, :cond_1

    .line 641
    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 639
    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v20

    goto :goto_1

    .line 643
    :cond_1
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v7, 0x4

    if-ge v4, v7, :cond_2

    .line 645
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Found illegal mission path: "

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v30, "path"

    move-object/from16 v0, p1

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 649
    :cond_2
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%s/%s/%s/%s"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/16 v30, 0x0

    const/16 v31, 0x3

    .line 651
    move-object/from16 v0, v27

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v31

    aput-object v31, v9, v30

    const/16 v30, 0x1

    const/16 v31, 0x2

    .line 652
    move-object/from16 v0, v27

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v31

    aput-object v31, v9, v30

    const/16 v30, 0x2

    const/16 v31, 0x1

    .line 653
    move-object/from16 v0, v27

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v31

    aput-object v31, v9, v30

    const/16 v30, 0x3

    const/16 v31, 0x0

    .line 654
    move-object/from16 v0, v27

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v31

    aput-object v31, v9, v30

    .line 649
    invoke-static {v4, v7, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 656
    .local v10, "basePath":Ljava/lang/String;
    const/16 v28, 0x0

    .line 660
    .local v28, "status":Z
    :try_start_0
    move-object/from16 v0, v22

    invoke-static {v0, v13}, Lcom/disney/emagine/sdk/keystore/EMTZipArchive;->unzip(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v28

    .line 668
    :goto_2
    if-nez v28, :cond_4

    .line 670
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v9, "Failed to unzip the mission."

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 674
    :try_start_1
    new-instance v4, Ljava/io/File;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v23

    .line 675
    .local v23, "pathToDelete":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    move-object/from16 v0, v23

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v24

    .line 677
    .local v24, "result":Z
    const/4 v4, 0x1

    move/from16 v0, v24

    if-ne v0, v4, :cond_3

    .line 678
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Deleted unzippable mission: "

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 682
    .end local v23    # "pathToDelete":Ljava/lang/String;
    .end local v24    # "result":Z
    :catch_0
    move-exception v15

    .line 684
    .local v15, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Failure to find mission zip: "

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 662
    .end local v15    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v15

    .line 664
    .restart local v15    # "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Failed to unzip mission ["

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v30, "] to ["

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v30, "]"

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 665
    invoke-virtual {v15}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 680
    .end local v15    # "e":Ljava/io/IOException;
    .restart local v23    # "pathToDelete":Ljava/lang/String;
    .restart local v24    # "result":Z
    :cond_3
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Failed to delete unzippable mission: "

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 690
    .end local v23    # "pathToDelete":Ljava/lang/String;
    .end local v24    # "result":Z
    :cond_4
    invoke-virtual/range {p0 .. p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestFileName(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v19

    .line 692
    .local v19, "manifestFileName":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->recursiveFilesFromDirectory(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    .line 694
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual/range {p0 .. p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->fileCountFromManifest(Ljava/util/HashMap;)I

    move-result v7

    if-eq v4, v7, :cond_5

    .line 696
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v9, "Package file count = [%d] does not match manifest file count = [%d]."

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    move-object/from16 v32, v0

    .line 697
    invoke-virtual/range {v32 .. v32}, Ljava/util/ArrayList;->size()I

    move-result v32

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    const/16 v31, 0x1

    invoke-virtual/range {p0 .. p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->fileCountFromManifest(Ljava/util/HashMap;)I

    move-result v32

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    .line 696
    move-object/from16 v0, v30

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 702
    :cond_5
    const/4 v12, 0x0

    .line 704
    .local v12, "calculatedMissionSize":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/io/File;

    .line 706
    .local v17, "file":Ljava/io/File;
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->calculateFileSize(Ljava/lang/String;)I

    move-result v7

    add-int/2addr v12, v7

    .line 707
    goto :goto_3

    .line 709
    .end local v17    # "file":Ljava/io/File;
    :cond_6
    invoke-virtual/range {p0 .. p1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->calculateMissionSizeFromManifest(Ljava/util/HashMap;)I

    move-result v21

    .line 710
    .local v21, "missionManifestSize":I
    move/from16 v0, v21

    if-eq v12, v0, :cond_7

    .line 712
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v9, "Error, the manifest expected = [%d], calculated = [%d]."

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    const/16 v31, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v30

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 714
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 716
    .local v14, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "payload"

    const-string v7, "name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v14, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 717
    const-string v4, "id"

    const/4 v7, 0x4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v14, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 719
    invoke-static {v14}, Lcom/disney/emagine/sdk/json/EMTJson;->jsonStringFromJavaObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 721
    .local v18, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v4

    const/16 v7, 0x12

    move-object/from16 v0, v18

    invoke-virtual {v4, v7, v0}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 726
    .end local v14    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v18    # "jsonString":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v9, "Mission size = %d in bytes."

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v30

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 727
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    const-string v9, "directoryContents ====== %s"

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    move-object/from16 v32, v0

    aput-object v32, v30, v31

    move-object/from16 v0, v30

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 729
    const-wide/16 v30, 0x0

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->startTime:J

    .line 730
    const-wide/16 v30, 0x0

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->transferredBytes:J

    .line 732
    const/4 v11, 0x0

    .line 734
    .local v11, "calculatedCompressedMissionSize":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/io/File;

    .line 736
    .restart local v17    # "file":Ljava/io/File;
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->calculateCompressedFileSize(Ljava/lang/String;)I

    move-result v7

    add-int/2addr v11, v7

    .line 737
    goto :goto_4

    .line 739
    .end local v17    # "file":Ljava/io/File;
    :cond_8
    int-to-double v0, v11

    move-wide/from16 v30, v0

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->missionSizeFloat:D

    .line 740
    const-wide/16 v30, 0x8d8

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->averageVelocity:J

    .line 741
    const-wide/16 v30, 0x0

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->lastMeasuredTime:J

    .line 742
    new-instance v4, Ljava/util/concurrent/Semaphore;

    const/4 v7, 0x1

    invoke-direct {v4, v7}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 744
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->itemCount:I

    .line 746
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG()Ljava/lang/String;

    move-result-object v7

    const-string v9, "Initial count = %d"

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->itemCount:I

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v30

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 748
    const/16 v16, 0x0

    .line 750
    .local v16, "error":Lcom/disney/emagine/sdk/apple/NSError;
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->startTime()J

    move-result-wide v30

    const-wide/16 v32, 0x0

    cmp-long v4, v30, v32

    if-nez v4, :cond_9

    .line 752
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v30

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->startTime:J

    .line 755
    :cond_9
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->directoryContents:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v30

    :goto_5
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/io/File;

    .line 757
    .restart local v17    # "file":Ljava/io/File;
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v4

    const-string v7, "Package Transfer"

    invoke-virtual {v4, v7}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_b

    .line 759
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG()Ljava/lang/String;

    move-result-object v7

    const-string v9, "Error: No longer is mission state, exiting"

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 795
    .end local v17    # "file":Ljava/io/File;
    :cond_a
    :goto_6
    :try_start_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3

    .line 801
    :goto_7
    const/4 v4, 0x0

    const/4 v7, 0x1

    const/16 v9, 0x64

    const/16 v30, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v30

    invoke-interface {v0, v4, v7, v9, v1}, Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZII)V

    goto/16 :goto_0

    .line 763
    .restart local v17    # "file":Ljava/io/File;
    :cond_b
    if-eqz v16, :cond_c

    .line 765
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG()Ljava/lang/String;

    move-result-object v7

    const-string v9, "Error for transfering file = %s"

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v30

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v7, v9}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 767
    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-interface {v0, v1, v4, v7, v9}, Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;->run(Lcom/disney/emagine/sdk/apple/NSError;ZII)V

    goto :goto_6

    .line 772
    :cond_c
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 774
    .local v5, "dirPath":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v5, v1}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->splicePathWithDirectory(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 776
    .local v8, "path":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    move-wide/from16 v0, v32

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->lastMeasuredTime:J

    .line 780
    :try_start_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 782
    const/4 v4, 0x1

    invoke-virtual {v8, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->versionFromManifest(Ljava/util/HashMap;Ljava/lang/String;)I

    move-result v6

    .line 785
    .local v6, "version":I
    new-instance v9, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, p3

    invoke-direct {v9, v0, v1, v2}, Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;-><init>(Lcom/disney/emagine/sdk/networking/EMTMissionManager;Ljava/lang/String;Lcom/disney/emagine/sdk/delegate/EMTManifestCompletionDelegate;)V

    move-object/from16 v4, p0

    move/from16 v7, p2

    invoke-virtual/range {v4 .. v9}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->sendFile(Ljava/lang/String;IILjava/lang/String;Lcom/disney/emagine/sdk/completion/EMTOffsetCompletion;)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_5

    .line 787
    .end local v6    # "version":I
    :catch_2
    move-exception v15

    .line 789
    .local v15, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v15}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_5

    .line 796
    .end local v5    # "dirPath":Ljava/lang/String;
    .end local v8    # "path":Ljava/lang/String;
    .end local v15    # "e":Ljava/lang/InterruptedException;
    .end local v17    # "file":Ljava/io/File;
    :catch_3
    move-exception v15

    .line 798
    .restart local v15    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v15}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_7
.end method

.method public sendPackageToToy(ILjava/lang/String;I)V
    .locals 4
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 1460
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1462
    .local v1, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "device_id"

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1463
    const-string v2, "version"

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1464
    const-string v2, "packageId"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1466
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v2

    const-string v3, "Send Package"

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireOrQueueEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v0

    .line 1467
    .local v0, "error":Lcom/disney/emagine/sdk/apple/NSError;
    return-void
.end method

.method public sendPackageToToyStart(ILjava/lang/String;I)V
    .locals 21
    .param p1, "deviceId"    # I
    .param p2, "packageId"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 1471
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->documentsDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v18

    .line 1472
    .local v18, "path":Ljava/lang/String;
    const-string v5, "%s.pmp"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 1473
    .local v14, "fileNameWithSuffix":Ljava/lang/String;
    const-string v5, "%s/%d/%s/%d"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v18, v6, v7

    const/4 v7, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    aput-object p2, v6, v7

    const/4 v7, 0x3

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 1474
    .local v10, "cacheDirectory":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 1475
    .local v15, "manifestPath":Ljava/lang/String;
    const-string v5, "%s.pmp"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1476
    .local v3, "destinationPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".meta"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 1477
    .local v16, "metaPath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".zip"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 1479
    .local v19, "zipPath":Ljava/lang/String;
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 1482
    .local v11, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    new-instance v17, Ljava/io/ObjectInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    move-object/from16 v0, v16

    invoke-direct {v5, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-direct {v0, v5}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1483
    .local v17, "ois":Ljava/io/ObjectInputStream;
    invoke-virtual/range {v17 .. v17}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/util/HashMap;

    move-object v11, v0

    .line 1484
    invoke-virtual/range {v17 .. v17}, Ljava/io/ObjectInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1493
    const-string v5, "manifestData"

    invoke-virtual {v11, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    move-object v4, v5

    check-cast v4, [B

    .line 1494
    .local v4, "manifestData":[B
    const-string v5, "id"

    move-object/from16 v0, p2

    invoke-virtual {v11, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1495
    const-string v5, "name"

    move-object/from16 v0, p2

    invoke-virtual {v11, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1496
    const-string v5, "version"

    new-instance v6, Ljava/lang/Integer;

    move/from16 v0, p3

    invoke-direct {v6, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v11, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1497
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->manifestItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1499
    invoke-virtual/range {p0 .. p0}, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v2

    .line 1500
    .local v2, "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v2, :cond_0

    .line 1501
    move/from16 v0, p1

    int-to-long v6, v0

    const/4 v8, 0x0

    new-instance v9, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;

    new-instance v5, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;

    .line 1502
    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sharedInstance()Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, p1

    invoke-direct {v5, v0, v1}, Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;-><init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V

    invoke-direct {v9, v5, v11}, Lcom/disney/emagine/sdk/completion/EMTTransferMetadataCompletion;-><init>(Lcom/disney/emagine/sdk/completion/EMTTransferManifestSuccess;Ljava/util/HashMap;)V

    move/from16 v5, p3

    .line 1501
    invoke-virtual/range {v2 .. v9}, Lcom/disney/emagine/sdk/ble/EMTDevice;->transferFile(Ljava/lang/String;[BIJZLcom/disney/emagine/sdk/delegate/EMTTransferDelegate;)V

    .line 1503
    .end local v2    # "curDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    .end local v4    # "manifestData":[B
    .end local v17    # "ois":Ljava/io/ObjectInputStream;
    :cond_0
    :goto_0
    return-void

    .line 1486
    :catch_0
    move-exception v12

    .line 1488
    .local v12, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v6, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to read package metadata from filesystem : ["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/EMTConsole;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 1489
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v5

    const-string v6, "Send Mission Done"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireOrQueueEvent(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    move-result-object v13

    .line 1490
    .local v13, "error":Lcom/disney/emagine/sdk/apple/NSError;
    goto :goto_0
.end method

.method public sendUpdateFirmware()V
    .locals 0

    .prologue
    .line 1640
    return-void
.end method

.method public setAverageVelocity(J)V
    .locals 1
    .param p1, "av"    # J

    .prologue
    .line 1586
    iput-wide p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->averageVelocity:J

    .line 1587
    return-void
.end method

.method public setError(Lcom/disney/emagine/sdk/apple/NSError;)V
    .locals 0
    .param p1, "err"    # Lcom/disney/emagine/sdk/apple/NSError;

    .prologue
    .line 1534
    return-void
.end method

.method public setItemCount(I)V
    .locals 0
    .param p1, "ic"    # I

    .prologue
    .line 1512
    iput p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->itemCount:I

    .line 1513
    return-void
.end method

.method public setLastMeasuredTime(J)V
    .locals 1
    .param p1, "lt"    # J

    .prologue
    .line 1596
    iput-wide p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->lastMeasuredTime:J

    .line 1597
    return-void
.end method

.method public setMissionSizeFloat(D)V
    .locals 1
    .param p1, "ms"    # D

    .prologue
    .line 1566
    iput-wide p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->missionSizeFloat:D

    .line 1567
    return-void
.end method

.method public setPreviousPercent(I)V
    .locals 0
    .param p1, "pp"    # I

    .prologue
    .line 1576
    iput p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->previousPercent:I

    .line 1577
    return-void
.end method

.method public setStartTime(J)V
    .locals 1
    .param p1, "st"    # J

    .prologue
    .line 1542
    iput-wide p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->startTime:J

    .line 1543
    return-void
.end method

.method public setTransferredBytes(J)V
    .locals 1
    .param p1, "tb"    # J

    .prologue
    .line 1556
    iput-wide p1, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->transferredBytes:J

    .line 1557
    return-void
.end method

.method public showErrorWithTitle(Lcom/disney/emagine/sdk/apple/NSError;Ljava/lang/String;)V
    .locals 0
    .param p1, "err"    # Lcom/disney/emagine/sdk/apple/NSError;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 1614
    return-void
.end method

.method public splicePathWithDirectory(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "directory"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 588
    const-string v7, "/"

    invoke-virtual {p1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 589
    .local v1, "comps":[Ljava/lang/String;
    array-length v2, v1

    .line 590
    .local v2, "count":I
    new-instance v6, Lcom/disney/emagine/sdk/apple/NSRange;

    invoke-direct {v6, v8, v8}, Lcom/disney/emagine/sdk/apple/NSRange;-><init>(II)V

    .line 591
    .local v6, "range":Lcom/disney/emagine/sdk/apple/NSRange;
    const/4 v3, 0x0

    .line 593
    .local v3, "found":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_0

    .line 595
    aget-object v0, v1, v4

    .line 597
    .local v0, "comp":Ljava/lang/String;
    invoke-virtual {v0, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_1

    .line 599
    add-int/lit8 v7, v4, 0x1

    int-to-long v8, v7

    iput-wide v8, v6, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    .line 600
    int-to-long v8, v2

    iput-wide v8, v6, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    .line 601
    const/4 v3, 0x1

    .line 606
    .end local v0    # "comp":Ljava/lang/String;
    :cond_0
    const-string v5, ""

    .line 608
    .local v5, "newPath":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 610
    iget-wide v8, v6, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    long-to-int v4, v8

    :goto_1
    int-to-long v8, v4

    iget-wide v10, v6, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    cmp-long v7, v8, v10

    if-gez v7, :cond_2

    .line 612
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v1, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 610
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 593
    .end local v5    # "newPath":Ljava/lang/String;
    .restart local v0    # "comp":Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 616
    .end local v0    # "comp":Ljava/lang/String;
    .restart local v5    # "newPath":Ljava/lang/String;
    :cond_2
    return-object v5
.end method

.method public startTime()J
    .locals 2

    .prologue
    .line 1547
    iget-wide v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->startTime:J

    return-wide v0
.end method

.method public transferredBytes()J
    .locals 2

    .prologue
    .line 1561
    iget-wide v0, p0, Lcom/disney/emagine/sdk/networking/EMTMissionManager;->transferredBytes:J

    return-wide v0
.end method

.method public versionFromManifest(Ljava/util/HashMap;Ljava/lang/String;)I
    .locals 6
    .param p2, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 1085
    .local p1, "manifest":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, 0x0

    .line 1087
    .local v3, "version":I
    const-string v4, "files"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 1089
    .local v2, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .local v0, "entry":Ljava/lang/Object;
    move-object v1, v0

    .line 1091
    check-cast v1, Ljava/util/HashMap;

    .line 1092
    .local v1, "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "f"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_0

    .line 1094
    const-string v4, "v"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 1099
    .end local v0    # "entry":Ljava/lang/Object;
    .end local v1    # "file":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return v3
.end method
