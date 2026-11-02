.class public Lcom/disneymobile/mocha/support/BacklogManager;
.super Ljava/lang/Object;
.source "BacklogManager.java"


# static fields
.field private static API_KEY:Ljava/lang/String; = null

.field private static API_SIG:Ljava/lang/String; = null

.field private static APP_LOCALE:Ljava/lang/String; = null

.field private static APP_VERSION:Ljava/lang/String; = null

.field private static BI_TAG:Ljava/lang/String; = null

.field private static BUNDLE_ID:Ljava/lang/String; = null

.field private static DATA:Ljava/lang/String; = null

.field private static DMO_LIB_VERSION:Ljava/lang/String; = null

.field private static IS_NEW_USER:Ljava/lang/String; = null

.field private static MACHINE:Ljava/lang/String; = null

.field private static METHOD:Ljava/lang/String; = null

.field private static MODEL:Ljava/lang/String; = null

.field private static ONLINE_FLAG:Ljava/lang/String; = null

.field private static OS_TYPE:Ljava/lang/String; = null

.field private static OS_VERSION:Ljava/lang/String; = null

.field private static SESSION_HASH:Ljava/lang/String; = null

.field private static SOURCE:Ljava/lang/String; = null

.field private static SUB_TYPE:Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "DMOAnalytics-BacklogManager"

.field private static TIMESTAMP:Ljava/lang/String;

.field private static fileNumCounter:I

.field private static folderNumCounter:I

.field private static inMemBacklog:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static magicQNumber:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "model"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->MODEL:Ljava/lang/String;

    .line 22
    const-string v0, "machine"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->MACHINE:Ljava/lang/String;

    .line 23
    const-string v0, "os_version"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->OS_VERSION:Ljava/lang/String;

    .line 24
    const-string v0, "os_type"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->OS_TYPE:Ljava/lang/String;

    .line 25
    const-string v0, "app_version"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->APP_VERSION:Ljava/lang/String;

    .line 26
    const-string v0, "DMOLibVersion"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->DMO_LIB_VERSION:Ljava/lang/String;

    .line 27
    const-string v0, "app_locale"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->APP_LOCALE:Ljava/lang/String;

    .line 28
    const-string v0, "tag"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->BI_TAG:Ljava/lang/String;

    .line 29
    const-string v0, "is_new_user"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->IS_NEW_USER:Ljava/lang/String;

    .line 30
    const-string v0, "timestamp"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->TIMESTAMP:Ljava/lang/String;

    .line 31
    const-string v0, "onlineflag"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->ONLINE_FLAG:Ljava/lang/String;

    .line 32
    const-string v0, "api_key"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->API_KEY:Ljava/lang/String;

    .line 33
    const-string v0, "api_sig"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->API_SIG:Ljava/lang/String;

    .line 34
    const-string v0, "method"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->METHOD:Ljava/lang/String;

    .line 35
    const-string v0, "bundle_id"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->BUNDLE_ID:Ljava/lang/String;

    .line 37
    const-string v0, "session_hash"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->SESSION_HASH:Ljava/lang/String;

    .line 38
    const-string v0, "data"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->DATA:Ljava/lang/String;

    .line 39
    const-string v0, "source"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->SOURCE:Ljava/lang/String;

    .line 40
    const-string v0, "subtype"

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->SUB_TYPE:Ljava/lang/String;

    .line 42
    const/16 v0, 0x271

    sput v0, Lcom/disneymobile/mocha/support/BacklogManager;->magicQNumber:I

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/disneymobile/mocha/support/BacklogManager;->inMemBacklog:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cleanupEmptyBacklogFolders(Ljava/io/File;)V
    .locals 5
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 212
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 214
    .local v0, "files":[Ljava/io/File;
    array-length v3, v0

    const/4 v4, 0x1

    if-ge v3, v4, :cond_0

    .line 215
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 218
    :cond_0
    if-eqz v0, :cond_2

    .line 219
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_2

    .line 220
    aget-object v1, v0, v2

    .line 221
    .local v1, "folder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 222
    invoke-static {v1}, Lcom/disneymobile/mocha/support/BacklogManager;->cleanupEmptyBacklogFolders(Ljava/io/File;)V

    .line 219
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 226
    .end local v1    # "folder":Ljava/io/File;
    .end local v2    # "i":I
    :cond_2
    return-void
.end method

.method private static countFiles(Ljava/lang/String;)V
    .locals 5
    .param p0, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 283
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 284
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 286
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_1

    .line 287
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    .line 288
    aget-object v1, v2, v3

    .line 289
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 290
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/disneymobile/mocha/support/BacklogManager;->countFiles(Ljava/lang/String;)V

    .line 287
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 292
    :cond_0
    sget v4, Lcom/disneymobile/mocha/support/BacklogManager;->fileNumCounter:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/disneymobile/mocha/support/BacklogManager;->fileNumCounter:I

    goto :goto_1

    .line 296
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method public static countFilesInAnalyticsDir()I
    .locals 4

    .prologue
    .line 331
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 332
    .local v1, "context":Landroid/content/Context;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/analytics"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 333
    .local v0, "analyticsDir":Ljava/lang/String;
    invoke-static {v0}, Lcom/disneymobile/mocha/support/BacklogManager;->countFilesInDir(Ljava/lang/String;)I

    move-result v2

    return v2
.end method

.method public static countFilesInDir(Ljava/lang/String;)I
    .locals 1
    .param p0, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 275
    const/4 v0, 0x0

    sput v0, Lcom/disneymobile/mocha/support/BacklogManager;->fileNumCounter:I

    .line 277
    invoke-static {p0}, Lcom/disneymobile/mocha/support/BacklogManager;->countFiles(Ljava/lang/String;)V

    .line 279
    sget v0, Lcom/disneymobile/mocha/support/BacklogManager;->fileNumCounter:I

    return v0
.end method

.method private static countFolders(Ljava/lang/String;)V
    .locals 5
    .param p0, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 313
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 314
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 316
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_1

    .line 317
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    .line 318
    aget-object v1, v2, v3

    .line 319
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 320
    sget v4, Lcom/disneymobile/mocha/support/BacklogManager;->folderNumCounter:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lcom/disneymobile/mocha/support/BacklogManager;->folderNumCounter:I

    .line 321
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/disneymobile/mocha/support/BacklogManager;->countFolders(Ljava/lang/String;)V

    .line 317
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 325
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method public static countFoldersInAnalyticsDir()I
    .locals 4

    .prologue
    .line 340
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 341
    .local v1, "context":Landroid/content/Context;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/analytics"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, "analyticsDir":Ljava/lang/String;
    invoke-static {v0}, Lcom/disneymobile/mocha/support/BacklogManager;->countFoldersInDir(Ljava/lang/String;)I

    move-result v2

    return v2
.end method

.method public static countFoldersInDir(Ljava/lang/String;)I
    .locals 1
    .param p0, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 305
    const/4 v0, 0x0

    sput v0, Lcom/disneymobile/mocha/support/BacklogManager;->folderNumCounter:I

    .line 307
    invoke-static {p0}, Lcom/disneymobile/mocha/support/BacklogManager;->countFolders(Ljava/lang/String;)V

    .line 309
    sget v0, Lcom/disneymobile/mocha/support/BacklogManager;->folderNumCounter:I

    return v0
.end method

.method public static debugQMsg(Ljava/util/List;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 715
    .local p0, "queue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const-string v1, ""

    .line 717
    .local v1, "msg":Ljava/lang/String;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    .line 719
    .local v6, "size":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 720
    .local v5, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 721
    .local v2, "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 722
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/disneymobile/network/DMOBackendResponse;

    .line 724
    .local v4, "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {v4}, Lcom/disneymobile/network/DMOBackendResponse;->_params()Ljava/util/HashMap;

    move-result-object v3

    .line 725
    .local v3, "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "method"

    invoke-virtual {v3, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 726
    .local v0, "method":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ","

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 729
    .end local v0    # "method":Ljava/lang/String;
    .end local v3    # "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", Events: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 731
    return-object v1
.end method

.method public static deleteFilesInDir(Ljava/lang/String;)V
    .locals 5
    .param p0, "dirPath"    # Ljava/lang/String;

    .prologue
    .line 360
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 361
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 363
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_1

    .line 364
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    .line 365
    aget-object v1, v2, v3

    .line 366
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 367
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/disneymobile/mocha/support/BacklogManager;->deleteFilesInDir(Ljava/lang/String;)V

    .line 364
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 369
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 373
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "i":I
    :cond_1
    return-void
.end method

.method public static emptyAnalyticsDir()V
    .locals 4

    .prologue
    .line 350
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 351
    .local v1, "context":Landroid/content/Context;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/analytics"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 352
    .local v0, "analyticsDir":Ljava/lang/String;
    invoke-static {v0}, Lcom/disneymobile/mocha/support/BacklogManager;->deleteFilesInDir(Ljava/lang/String;)V

    .line 353
    return-void
.end method

.method public static getBacklogFile(Landroid/content/Context;)Ljava/io/File;
    .locals 20
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 123
    new-instance v14, Ljava/text/SimpleDateFormat;

    const-string v17, "yyyy-MM-dd-HH"

    move-object/from16 v0, v17

    invoke-direct {v14, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 124
    .local v14, "sdfDate":Ljava/text/SimpleDateFormat;
    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    .line 125
    .local v11, "now":Ljava/util/Date;
    invoke-virtual {v14, v11}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v15

    .line 127
    .local v15, "strDate":Ljava/lang/String;
    const-string v17, "-"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 128
    .local v16, "timeStampTokens":[Ljava/lang/String;
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    const/16 v18, 0x4

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_0

    .line 129
    const/4 v2, 0x0

    .line 175
    :goto_0
    return-object v2

    .line 132
    :cond_0
    new-instance v9, Ljava/io/File;

    const/16 v17, 0x0

    aget-object v17, v16, v17

    move-object/from16 v0, v17

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 133
    .local v9, "dirYear":Ljava/io/File;
    new-instance v7, Ljava/io/File;

    const/16 v17, 0x1

    aget-object v17, v16, v17

    move-object/from16 v0, v17

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 134
    .local v7, "dirMonth":Ljava/io/File;
    new-instance v5, Ljava/io/File;

    const/16 v17, 0x2

    aget-object v17, v16, v17

    move-object/from16 v0, v17

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 135
    .local v5, "dirDay":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    const/16 v17, 0x3

    aget-object v17, v16, v17

    move-object/from16 v0, v17

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 137
    .local v6, "dirHour":Ljava/io/File;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/analytics/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 140
    .local v8, "dirPath":Ljava/lang/String;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->getUnixTimeStamp()J

    move-result-wide v18

    invoke-virtual/range {v17 .. v19}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ".backlog"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 143
    .local v4, "backlogFilePath":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 144
    .local v3, "backlogFileDir":Ljava/io/File;
    const/4 v2, 0x0

    .line 146
    .local v2, "backlogFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v17

    if-nez v17, :cond_1

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 147
    :cond_1
    new-instance v2, Ljava/io/File;

    .end local v2    # "backlogFile":Ljava/io/File;
    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 149
    .restart local v2    # "backlogFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v17

    if-nez v17, :cond_2

    .line 151
    :try_start_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 152
    :catch_0
    move-exception v10

    .line 153
    .local v10, "e":Ljava/io/IOException;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Failed to create backlog file: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 158
    .end local v10    # "e":Ljava/io/IOException;
    :cond_2
    new-instance v13, Ljava/util/Random;

    invoke-direct {v13}, Ljava/util/Random;-><init>()V

    .line 159
    .local v13, "randomNumberGen":Ljava/util/Random;
    const v17, 0xf4240

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v12

    .line 160
    .local v12, "randomInt":I
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->getUnixTimeStamp()J

    move-result-wide v18

    invoke-virtual/range {v17 .. v19}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "_"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ".backlog"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 163
    new-instance v2, Ljava/io/File;

    .end local v2    # "backlogFile":Ljava/io/File;
    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 165
    .restart local v2    # "backlogFile":Ljava/io/File;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 166
    :catch_1
    move-exception v10

    .line 167
    .restart local v10    # "e":Ljava/io/IOException;
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Failed to create backlog file: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 172
    .end local v10    # "e":Ljava/io/IOException;
    .end local v12    # "randomInt":I
    .end local v13    # "randomNumberGen":Ljava/util/Random;
    :cond_3
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Failed to create backlog directory: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private static getBacklogTrackingInfo(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 9
    .param p0, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 438
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 440
    .local v6, "trackingInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->MODEL:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 441
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->MODEL:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->MODEL:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    :cond_0
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->MACHINE:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 445
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->MACHINE:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->MACHINE:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    :cond_1
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->OS_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 449
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->OS_VERSION:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->OS_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    :cond_2
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->OS_TYPE:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 453
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->OS_TYPE:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->OS_TYPE:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    :cond_3
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->APP_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 457
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->APP_VERSION:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->APP_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    :cond_4
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->DMO_LIB_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 461
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->DMO_LIB_VERSION:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->DMO_LIB_VERSION:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    :cond_5
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->APP_LOCALE:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 465
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->APP_LOCALE:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->APP_LOCALE:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    :cond_6
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->BI_TAG:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 469
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->BI_TAG:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->BI_TAG:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    :cond_7
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->IS_NEW_USER:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 473
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->IS_NEW_USER:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->IS_NEW_USER:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    :cond_8
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->TIMESTAMP:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 477
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->TIMESTAMP:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->TIMESTAMP:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    :cond_9
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->ONLINE_FLAG:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 481
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->ONLINE_FLAG:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->ONLINE_FLAG:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    :cond_a
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->API_KEY:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 485
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->API_KEY:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->API_KEY:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    :cond_b
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->API_SIG:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 489
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->API_SIG:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->API_SIG:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    :cond_c
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->METHOD:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 493
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->METHOD:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->METHOD:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    :cond_d
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->BUNDLE_ID:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 497
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->BUNDLE_ID:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->BUNDLE_ID:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    :cond_e
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->SESSION_HASH:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 505
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->SESSION_HASH:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->SESSION_HASH:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    :cond_f
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->DATA:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 509
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->DATA:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->DATA:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    :cond_10
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->SOURCE:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 513
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->SOURCE:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->SOURCE:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    :cond_11
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->SUB_TYPE:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 517
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->SUB_TYPE:Ljava/lang/String;

    sget-object v8, Lcom/disneymobile/mocha/support/BacklogManager;->SUB_TYPE:Ljava/lang/String;

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    :cond_12
    sget-object v3, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    .line 521
    .local v3, "gida":Ljava/lang/String;
    const/4 v2, 0x0

    .line 523
    .local v2, "checkIsLatAgain":Z
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_16

    .line 524
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 526
    .local v4, "gidaValue":Ljava/lang/String;
    sget-object v7, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->defaultGida:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getGIDA()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_15

    .line 527
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getGIDA()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    const/4 v2, 0x1

    .line 555
    .end local v4    # "gidaValue":Ljava/lang/String;
    :cond_13
    :goto_0
    sget-object v5, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    .line 556
    .local v5, "isLat":Ljava/lang/String;
    if-eqz v2, :cond_1a

    .line 557
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getIsLat()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    :cond_14
    :goto_1
    const-string v7, "isbacklog"

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    return-object v6

    .line 530
    .end local v5    # "isLat":Ljava/lang/String;
    .restart local v4    # "gidaValue":Ljava/lang/String;
    :cond_15
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 534
    .end local v4    # "gidaValue":Ljava/lang/String;
    :cond_16
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getGIDA()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_17

    .line 535
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getGIDA()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v3, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 539
    :cond_17
    sget-object v0, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ANID:Ljava/lang/String;

    .line 540
    .local v0, "anID":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 542
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 543
    .local v1, "anIDValue":Ljava/lang/String;
    const-string v7, ""

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_18

    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_19

    :cond_18
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getAnID()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_19

    .line 545
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getAnID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 547
    :cond_19
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_13

    .line 549
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 558
    .end local v0    # "anID":Ljava/lang/String;
    .end local v1    # "anIDValue":Ljava/lang/String;
    .restart local v5    # "isLat":Ljava/lang/String;
    :cond_1a
    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1b

    .line 559
    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 562
    :cond_1b
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getIsLat()Ljava/lang/Integer;

    move-result-object v7

    if-eqz v7, :cond_14

    .line 563
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->getIsLat()Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public static getInMemBacklogRequests()Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disneymobile/mocha/support/BacklogRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v9, "inMemoryBacklogReqs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/disneymobile/mocha/support/BacklogRequest;>;"
    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->loadOneBacklogQ()V

    .line 66
    sget-object v13, Lcom/disneymobile/mocha/support/BacklogManager;->inMemBacklog:Ljava/util/HashMap;

    invoke-virtual {v13}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 68
    .local v0, "backlog":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 69
    .local v2, "backlogFileName":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 70
    .local v10, "jsonArrayStr":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x1

    if-ge v13, v14, :cond_1

    .line 71
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Bad backlog data. File: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", content: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 76
    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v10}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 77
    .local v1, "backlogData":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v7, v13, :cond_0

    .line 78
    invoke-virtual {v1, v7}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 81
    .local v4, "backloggedReqParams":Lorg/json/JSONObject;
    const-string v13, "method"

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    const-string v13, "method"

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 85
    .local v11, "methodName":Ljava/lang/String;
    :goto_2
    const/4 v5, 0x0

    .line 86
    .local v5, "data":Ljava/lang/Object;
    invoke-static {v4}, Lcom/disneymobile/mocha/support/BacklogManager;->getBacklogTrackingInfo(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v12

    .line 94
    .local v12, "trackingInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v13, "data"

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 95
    const-string v13, "data"

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "data":Ljava/lang/Object;
    check-cast v5, Ljava/lang/String;

    .line 98
    :cond_2
    new-instance v3, Lcom/disneymobile/mocha/support/BacklogRequest;

    invoke-direct {v3}, Lcom/disneymobile/mocha/support/BacklogRequest;-><init>()V

    .line 99
    .local v3, "backlogRequest":Lcom/disneymobile/mocha/support/BacklogRequest;
    invoke-virtual {v3, v11}, Lcom/disneymobile/mocha/support/BacklogRequest;->setMethodName(Ljava/lang/String;)V

    .line 100
    invoke-virtual {v3, v5}, Lcom/disneymobile/mocha/support/BacklogRequest;->setData(Ljava/lang/Object;)V

    .line 101
    invoke-virtual {v3, v12}, Lcom/disneymobile/mocha/support/BacklogRequest;->setTrackingInfo(Ljava/util/HashMap;)V

    .line 103
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 81
    .end local v3    # "backlogRequest":Lcom/disneymobile/mocha/support/BacklogRequest;
    .end local v11    # "methodName":Ljava/lang/String;
    .end local v12    # "trackingInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3
    const-string v11, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 105
    .end local v1    # "backlogData":Lorg/json/JSONArray;
    .end local v4    # "backloggedReqParams":Lorg/json/JSONObject;
    .end local v7    # "i":I
    :catch_0
    move-exception v6

    .line 106
    .local v6, "e":Lorg/json/JSONException;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Failed to fetch serialized backlog data. "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v6}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 112
    .end local v0    # "backlog":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "backlogFileName":Ljava/lang/String;
    .end local v6    # "e":Lorg/json/JSONException;
    .end local v10    # "jsonArrayStr":Ljava/lang/String;
    :cond_4
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    sput-object v13, Lcom/disneymobile/mocha/support/BacklogManager;->inMemBacklog:Ljava/util/HashMap;

    .line 113
    return-object v9
.end method

.method public static getMagicQNumber()I
    .locals 1

    .prologue
    .line 51
    sget v0, Lcom/disneymobile/mocha/support/BacklogManager;->magicQNumber:I

    return v0
.end method

.method private static getStartAppEventTrackingInfo(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 11
    .param p0, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 581
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 583
    .local v9, "trackingInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v10, "model"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    const-string v10, "model"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 585
    .local v5, "model":Ljava/lang/String;
    :goto_0
    const-string v10, "app_locale"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    const-string v10, "app_locale"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 587
    .local v0, "appLocale":Ljava/lang/String;
    :goto_1
    const-string v10, "tag"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "tag"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 589
    .local v8, "tag":Ljava/lang/String;
    :goto_2
    const-string v10, "app_version"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    const-string v10, "app_version"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 591
    .local v1, "appVersion":Ljava/lang/String;
    :goto_3
    const-string v10, "machine"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    const-string v10, "machine"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 593
    .local v4, "machine":Ljava/lang/String;
    :goto_4
    const-string v10, "os_type"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    const-string v10, "os_type"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 595
    .local v6, "osType":Ljava/lang/String;
    :goto_5
    const-string v10, "os_version"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    const-string v10, "os_version"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 597
    .local v7, "osVersion":Ljava/lang/String;
    :goto_6
    const-string v10, "is_new_user"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    const-string v10, "is_new_user"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 599
    .local v2, "isNewUser":Ljava/lang/String;
    :goto_7
    const-string v10, "DMOLibVersion"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_8

    const-string v10, "DMOLibVersion"

    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 602
    .local v3, "libVersion":Ljava/lang/String;
    :goto_8
    const-string v10, "model"

    invoke-virtual {v9, v10, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 603
    const-string v10, "app_locale"

    invoke-virtual {v9, v10, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 604
    const-string v10, "tag"

    invoke-virtual {v9, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 605
    const-string v10, "app_version"

    invoke-virtual {v9, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 606
    const-string v10, "machine"

    invoke-virtual {v9, v10, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 607
    const-string v10, "os_type"

    invoke-virtual {v9, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    const-string v10, "os_version"

    invoke-virtual {v9, v10, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 609
    const-string v10, "is_new_user"

    invoke-virtual {v9, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 610
    const-string v10, "DMOLibVersion"

    invoke-virtual {v9, v10, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    return-object v9

    .line 583
    .end local v0    # "appLocale":Ljava/lang/String;
    .end local v1    # "appVersion":Ljava/lang/String;
    .end local v2    # "isNewUser":Ljava/lang/String;
    .end local v3    # "libVersion":Ljava/lang/String;
    .end local v4    # "machine":Ljava/lang/String;
    .end local v5    # "model":Ljava/lang/String;
    .end local v6    # "osType":Ljava/lang/String;
    .end local v7    # "osVersion":Ljava/lang/String;
    .end local v8    # "tag":Ljava/lang/String;
    :cond_0
    const-string v5, ""

    goto/16 :goto_0

    .line 585
    .restart local v5    # "model":Ljava/lang/String;
    :cond_1
    const-string v0, ""

    goto/16 :goto_1

    .line 587
    .restart local v0    # "appLocale":Ljava/lang/String;
    :cond_2
    const-string v8, ""

    goto/16 :goto_2

    .line 589
    .restart local v8    # "tag":Ljava/lang/String;
    :cond_3
    const-string v1, ""

    goto/16 :goto_3

    .line 591
    .restart local v1    # "appVersion":Ljava/lang/String;
    :cond_4
    const-string v4, ""

    goto :goto_4

    .line 593
    .restart local v4    # "machine":Ljava/lang/String;
    :cond_5
    const-string v6, ""

    goto :goto_5

    .line 595
    .restart local v6    # "osType":Ljava/lang/String;
    :cond_6
    const-string v7, ""

    goto :goto_6

    .line 597
    .restart local v7    # "osVersion":Ljava/lang/String;
    :cond_7
    const-string v2, ""

    goto :goto_7

    .line 599
    .restart local v2    # "isNewUser":Ljava/lang/String;
    :cond_8
    const-string v3, ""

    goto :goto_8
.end method

.method public static getUnixTimeStamp()J
    .locals 6

    .prologue
    .line 183
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long v0, v2, v4

    .line 184
    .local v0, "now":J
    return-wide v0
.end method

.method private static loadBacklogFile(Ljava/io/File;)V
    .locals 12
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 233
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 235
    .local v3, "files":[Ljava/io/File;
    invoke-static {v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 237
    move-object v0, v3

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_3

    aget-object v2, v0, v4

    .line 239
    .local v2, "fileEntry":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 240
    invoke-static {v2}, Lcom/disneymobile/mocha/support/BacklogManager;->loadBacklogFile(Ljava/io/File;)V

    .line 237
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 243
    :cond_1
    :try_start_0
    invoke-static {v2}, Lcom/disneymobile/mocha/support/BacklogManager;->readQFromBacklog(Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    .line 245
    .local v6, "serializedEventsParams":Ljava/lang/String;
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->inMemBacklog:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->size()I

    move-result v7

    const/4 v10, 0x1

    if-ge v7, v10, :cond_0

    .line 246
    sget-object v7, Lcom/disneymobile/mocha/support/BacklogManager;->inMemBacklog:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_2

    .line 250
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 254
    :cond_2
    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->getUnixTimeStamp()J

    move-result-wide v8

    .line 255
    .local v8, "timeStamp":J
    invoke-static {}, Lcom/disneymobile/mocha/NSUserDefaults;->backlogSettings()Lcom/disneymobile/mocha/NSUserDefaults;

    move-result-object v7

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const-string v11, "lastReadOn"

    invoke-virtual {v7, v10, v11}, Lcom/disneymobile/mocha/NSUserDefaults;->setLongForKey(Ljava/lang/Long;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 259
    .end local v6    # "serializedEventsParams":Ljava/lang/String;
    .end local v8    # "timeStamp":J
    :catch_0
    move-exception v1

    .line 260
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 261
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 262
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 266
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "fileEntry":Ljava/io/File;
    :cond_3
    return-void
.end method

.method public static loadOneBacklogQ()V
    .locals 6

    .prologue
    .line 193
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 195
    .local v2, "context":Landroid/content/Context;
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 196
    .local v1, "baseDir":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/analytics"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 199
    .local v0, "analyticsDir":Ljava/io/File;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 200
    invoke-static {v0}, Lcom/disneymobile/mocha/support/BacklogManager;->loadBacklogFile(Ljava/io/File;)V

    .line 201
    invoke-static {v0}, Lcom/disneymobile/mocha/support/BacklogManager;->cleanupEmptyBacklogFolders(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    :cond_0
    :goto_0
    return-void

    .line 203
    :catch_0
    move-exception v3

    .line 204
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static logd(Ljava/lang/String;)V
    .locals 3
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 735
    const-string v0, "DMOAnalytics-BacklogManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Debug Message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    return-void
.end method

.method private static loge(Ljava/lang/String;)V
    .locals 3
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 739
    const-string v0, "DMOAnalytics-BacklogManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    return-void
.end method

.method public static readQFromBacklog(Ljava/io/File;)Ljava/lang/String;
    .locals 12
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 666
    move-object v1, p0

    .line 669
    .local v1, "backlogFile":Ljava/io/File;
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9}, Ljava/lang/String;-><init>()V

    .line 671
    .local v9, "serializedJsonArray":Ljava/lang/String;
    const/4 v5, 0x0

    .line 672
    .local v5, "fInStream":Ljava/io/FileInputStream;
    const/4 v2, 0x0

    .line 673
    .local v2, "bufferedInStream":Ljava/io/BufferedInputStream;
    const/4 v7, 0x0

    .line 676
    .local v7, "objInputStream":Ljava/io/ObjectInputStream;
    :try_start_0
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 678
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .local v6, "fInStream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 679
    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .local v3, "bufferedInStream":Ljava/io/BufferedInputStream;
    :try_start_2
    new-instance v8, Ljava/io/ObjectInputStream;

    invoke-direct {v8, v3}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 681
    .end local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    .local v8, "objInputStream":Ljava/io/ObjectInputStream;
    :try_start_3
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljava/lang/String;

    move-object v9, v0
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_9
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 698
    if-eqz v8, :cond_0

    .line 699
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->close()V

    .line 702
    :cond_0
    if-eqz v3, :cond_1

    .line 703
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    .line 706
    :cond_1
    if-eqz v6, :cond_e

    .line 707
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V

    move-object v7, v8

    .end local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .line 711
    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    :cond_2
    :goto_0
    return-object v9

    .line 682
    :catch_0
    move-exception v4

    .line 683
    .local v4, "e":Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_4
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Deleting not found File: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Exception "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    .line 686
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 698
    if-eqz v7, :cond_3

    .line 699
    invoke-virtual {v7}, Ljava/io/ObjectInputStream;->close()V

    .line 702
    :cond_3
    if-eqz v2, :cond_4

    .line 703
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 706
    :cond_4
    if-eqz v5, :cond_2

    .line 707
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    goto :goto_0

    .line 687
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v4

    .line 688
    .local v4, "e":Ljava/lang/IllegalArgumentException;
    :goto_2
    :try_start_5
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Deleting file with bad fata: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Exception: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    .line 690
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 698
    if-eqz v7, :cond_5

    .line 699
    invoke-virtual {v7}, Ljava/io/ObjectInputStream;->close()V

    .line 702
    :cond_5
    if-eqz v2, :cond_6

    .line 703
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 706
    :cond_6
    if-eqz v5, :cond_2

    .line 707
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    goto :goto_0

    .line 691
    .end local v4    # "e":Ljava/lang/IllegalArgumentException;
    :catch_2
    move-exception v4

    .line 692
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    :goto_3
    :try_start_6
    invoke-virtual {v4}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    .line 693
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 698
    if-eqz v7, :cond_7

    .line 699
    invoke-virtual {v7}, Ljava/io/ObjectInputStream;->close()V

    .line 702
    :cond_7
    if-eqz v2, :cond_8

    .line 703
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 706
    :cond_8
    if-eqz v5, :cond_2

    .line 707
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    goto/16 :goto_0

    .line 694
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    :catch_3
    move-exception v4

    .line 695
    .local v4, "e":Ljava/lang/Exception;
    :goto_4
    :try_start_7
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Exception caught: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    .line 696
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 698
    if-eqz v7, :cond_9

    .line 699
    invoke-virtual {v7}, Ljava/io/ObjectInputStream;->close()V

    .line 702
    :cond_9
    if-eqz v2, :cond_a

    .line 703
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 706
    :cond_a
    if-eqz v5, :cond_2

    .line 707
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    goto/16 :goto_0

    .line 698
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    :goto_5
    if-eqz v7, :cond_b

    .line 699
    invoke-virtual {v7}, Ljava/io/ObjectInputStream;->close()V

    .line 702
    :cond_b
    if-eqz v2, :cond_c

    .line 703
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 706
    :cond_c
    if-eqz v5, :cond_d

    .line 707
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    :cond_d
    throw v10

    .line 698
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v10

    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_5

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catchall_2
    move-exception v10

    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_5

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .end local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    :catchall_3
    move-exception v10

    move-object v7, v8

    .end local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_5

    .line 694
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_4
    move-exception v4

    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_4

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_5
    move-exception v4

    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_4

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .end local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    :catch_6
    move-exception v4

    move-object v7, v8

    .end local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_4

    .line 691
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_7
    move-exception v4

    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_8
    move-exception v4

    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .end local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    :catch_9
    move-exception v4

    move-object v7, v8

    .end local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto :goto_3

    .line 687
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_a
    move-exception v4

    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto/16 :goto_2

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_b
    move-exception v4

    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto/16 :goto_2

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .end local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    :catch_c
    move-exception v4

    move-object v7, v8

    .end local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto/16 :goto_2

    .line 682
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_d
    move-exception v4

    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto/16 :goto_1

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    :catch_e
    move-exception v4

    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto/16 :goto_1

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .end local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    :catch_f
    move-exception v4

    move-object v7, v8

    .end local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto/16 :goto_1

    .end local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .end local v5    # "fInStream":Ljava/io/FileInputStream;
    .end local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    :cond_e
    move-object v7, v8

    .end local v8    # "objInputStream":Ljava/io/ObjectInputStream;
    .restart local v7    # "objInputStream":Ljava/io/ObjectInputStream;
    move-object v2, v3

    .end local v3    # "bufferedInStream":Ljava/io/BufferedInputStream;
    .restart local v2    # "bufferedInStream":Ljava/io/BufferedInputStream;
    move-object v5, v6

    .end local v6    # "fInStream":Ljava/io/FileInputStream;
    .restart local v5    # "fInStream":Ljava/io/FileInputStream;
    goto/16 :goto_0
.end method

.method public static setMagicNumber(I)V
    .locals 0
    .param p0, "magicNumber"    # I

    .prologue
    .line 47
    sput p0, Lcom/disneymobile/mocha/support/BacklogManager;->magicQNumber:I

    .line 48
    return-void
.end method

.method public static splitNPersistQs(Ljava/util/ArrayList;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 381
    .local p0, "mOutboundQueue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x1

    if-ge v9, v10, :cond_0

    .line 428
    :goto_0
    return-void

    .line 390
    :cond_0
    const/4 v0, 0x0

    .line 391
    .local v0, "counter":I
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 393
    .local v4, "jsonArray":Lorg/json/JSONArray;
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 394
    .local v6, "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 395
    invoke-static {}, Lcom/disneymobile/mocha/support/BacklogManager;->getMagicQNumber()I

    move-result v9

    if-ge v0, v9, :cond_2

    .line 396
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/disneymobile/network/DMOBackendResponse;

    .line 398
    .local v8, "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    invoke-virtual {v8}, Lcom/disneymobile/network/DMOBackendResponse;->_params()Ljava/util/HashMap;

    move-result-object v7

    .line 408
    .local v7, "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 410
    .local v5, "jsonObj":Lorg/json/JSONObject;
    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 411
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 425
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    .end local v5    # "jsonObj":Lorg/json/JSONObject;
    .end local v6    # "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    .end local v7    # "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    :catch_0
    move-exception v1

    .line 426
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 414
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "jsonArray":Lorg/json/JSONArray;
    .restart local v5    # "jsonObj":Lorg/json/JSONObject;
    .restart local v6    # "queueIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    .restart local v7    # "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v8    # "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    :cond_1
    :try_start_1
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 415
    add-int/lit8 v0, v0, 0x1

    .line 416
    goto :goto_1

    .line 418
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "jsonObj":Lorg/json/JSONObject;
    .end local v7    # "queuedParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "queuedResponse":Lcom/disneymobile/network/DMOBackendResponse;
    :cond_2
    invoke-static {v4}, Lcom/disneymobile/mocha/support/BacklogManager;->writeQToBacklog(Lorg/json/JSONArray;)Ljava/io/File;

    .line 419
    new-instance v4, Lorg/json/JSONArray;

    .end local v4    # "jsonArray":Lorg/json/JSONArray;
    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 420
    .restart local v4    # "jsonArray":Lorg/json/JSONArray;
    const/4 v0, 0x0

    goto :goto_1

    .line 424
    :cond_3
    invoke-static {v4}, Lcom/disneymobile/mocha/support/BacklogManager;->writeQToBacklog(Lorg/json/JSONArray;)Ljava/io/File;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static writeQToBacklog(Lorg/json/JSONArray;)Ljava/io/File;
    .locals 9
    .param p0, "queuedParams"    # Lorg/json/JSONArray;

    .prologue
    .line 621
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v7

    const/4 v8, 0x1

    if-ge v7, v8, :cond_1

    .line 622
    const/4 v0, 0x0

    .line 654
    :cond_0
    :goto_0
    return-object v0

    .line 625
    :cond_1
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 627
    .local v1, "context":Landroid/content/Context;
    invoke-static {v1}, Lcom/disneymobile/mocha/support/BacklogManager;->getBacklogFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 629
    .local v0, "backlogFile":Ljava/io/File;
    const/4 v3, 0x0

    .line 630
    .local v3, "foutStream":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 633
    .local v5, "objOutStream":Ljava/io/ObjectOutputStream;
    :try_start_0
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 634
    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .local v4, "foutStream":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v6, Ljava/io/ObjectOutputStream;

    invoke-direct {v6, v4}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 635
    .end local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    .local v6, "objOutStream":Ljava/io/ObjectOutputStream;
    :try_start_2
    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 642
    if-eqz v6, :cond_2

    .line 643
    :try_start_3
    invoke-virtual {v6}, Ljava/io/ObjectOutputStream;->close()V

    .line 646
    :cond_2
    if-eqz v4, :cond_3

    .line 647
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    :cond_3
    move-object v5, v6

    .end local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    move-object v3, v4

    .line 651
    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 649
    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .end local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    :catch_0
    move-exception v2

    .line 650
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    move-object v5, v6

    .end local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    move-object v3, v4

    .line 652
    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 636
    .end local v2    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 637
    .local v2, "e":Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 642
    if-eqz v5, :cond_4

    .line 643
    :try_start_5
    invoke-virtual {v5}, Ljava/io/ObjectOutputStream;->close()V

    .line 646
    :cond_4
    if-eqz v3, :cond_0

    .line 647
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_0

    .line 649
    :catch_2
    move-exception v2

    .line 650
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 638
    .end local v2    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v2

    .line 639
    .restart local v2    # "e":Ljava/io/IOException;
    :goto_2
    :try_start_6
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 642
    if-eqz v5, :cond_5

    .line 643
    :try_start_7
    invoke-virtual {v5}, Ljava/io/ObjectOutputStream;->close()V

    .line 646
    :cond_5
    if-eqz v3, :cond_0

    .line 647
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_0

    .line 649
    :catch_4
    move-exception v2

    .line 650
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 641
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 642
    :goto_3
    if-eqz v5, :cond_6

    .line 643
    :try_start_8
    invoke-virtual {v5}, Ljava/io/ObjectOutputStream;->close()V

    .line 646
    :cond_6
    if-eqz v3, :cond_7

    .line 647
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 651
    :cond_7
    :goto_4
    throw v7

    .line 649
    :catch_5
    move-exception v2

    .line 650
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/disneymobile/mocha/support/BacklogManager;->loge(Ljava/lang/String;)V

    goto :goto_4

    .line 641
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v4    # "foutStream":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v7

    move-object v3, v4

    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_3

    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .end local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    :catchall_2
    move-exception v7

    move-object v5, v6

    .end local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    move-object v3, v4

    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 638
    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v4    # "foutStream":Ljava/io/FileOutputStream;
    :catch_6
    move-exception v2

    move-object v3, v4

    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_2

    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .end local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    :catch_7
    move-exception v2

    move-object v5, v6

    .end local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    move-object v3, v4

    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 636
    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v4    # "foutStream":Ljava/io/FileOutputStream;
    :catch_8
    move-exception v2

    move-object v3, v4

    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v3    # "foutStream":Ljava/io/FileOutputStream;
    .end local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    :catch_9
    move-exception v2

    move-object v5, v6

    .end local v6    # "objOutStream":Ljava/io/ObjectOutputStream;
    .restart local v5    # "objOutStream":Ljava/io/ObjectOutputStream;
    move-object v3, v4

    .end local v4    # "foutStream":Ljava/io/FileOutputStream;
    .restart local v3    # "foutStream":Ljava/io/FileOutputStream;
    goto :goto_1
.end method
