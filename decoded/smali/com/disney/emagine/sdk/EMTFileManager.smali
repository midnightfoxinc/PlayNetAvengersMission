.class public Lcom/disney/emagine/sdk/EMTFileManager;
.super Ljava/lang/Object;
.source "EMTFileManager.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/emagine/sdk/EMTFileManager;

.field private static mConsole:Lcom/disney/emagine/sdk/EMTConsole;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lcom/disney/emagine/sdk/EMTFileManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTFileManager;->TAG:Ljava/lang/String;

    .line 34
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/EMTFileManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public static bytesFromFile(Ljava/lang/String;)[B
    .locals 6
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    .line 266
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 267
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int v3, v4

    .line 269
    .local v3, "fileLength":I
    if-nez v3, :cond_0

    .line 271
    const/4 v0, 0x0

    .line 285
    :goto_0
    return-object v0

    .line 274
    :cond_0
    new-array v0, v3, [B

    .line 278
    .local v0, "data":[B
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v4, v0}, Ljava/io/FileInputStream;->read([B)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 280
    :catch_0
    move-exception v1

    .line 282
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static bytesFromFileInputStream(Ljava/io/InputStream;)[B
    .locals 7
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v4, 0x0

    .line 236
    if-nez p0, :cond_0

    .line 261
    :goto_0
    return-object v4

    .line 241
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 244
    .local v0, "buffer":Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x4000

    new-array v1, v5, [B

    .line 248
    .local v1, "data":[B
    :goto_1
    const/4 v5, 0x0

    :try_start_0
    array-length v6, v1

    invoke-virtual {p0, v1, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .local v3, "nRead":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_1

    .line 250
    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 256
    .end local v3    # "nRead":I
    :catch_0
    move-exception v2

    .line 258
    .local v2, "e":Ljava/io/IOException;
    goto :goto_0

    .line 253
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "nRead":I
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 254
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    goto :goto_0
.end method

.method public static cacheDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 61
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/app/EmagineApplication;->getCacheDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static contentsOfCacheDirectory()[Ljava/io/File;
    .locals 2

    .prologue
    .line 92
    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->cacheDirectory()Ljava/io/File;

    move-result-object v0

    .line 94
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public static createCacheFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 85
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/disney/emagine/sdk/EMTFileManager;->cacheDirectory()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 87
    .local v0, "file":Ljava/io/File;
    return-object v0
.end method

.method private static createDirectory(Ljava/io/File;)Z
    .locals 7
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 135
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_0

    .line 137
    sget-object v2, Lcom/disney/emagine/sdk/EMTFileManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/EMTFileManager;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Create directory error: Attempt to create directory %s failed."

    new-array v1, v1, [Ljava/lang/Object;

    .line 138
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v1, v0

    .line 137
    invoke-static {v4, v5, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    :goto_0
    return v0

    .line 146
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_1

    .line 150
    sget-object v1, Lcom/disney/emagine/sdk/EMTFileManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/EMTFileManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "directory exists, but is not a directory: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 155
    :cond_1
    sget-object v0, Lcom/disney/emagine/sdk/EMTFileManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v2, Lcom/disney/emagine/sdk/EMTFileManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "directory created (or already exists): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    .line 157
    goto :goto_0
.end method

.method public static createDirectoryAtFilePath(Ljava/lang/String;)Z
    .locals 1
    .param p0, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectoryAtFilePath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static createDirectoryAtFilePath(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0, "directoryName"    # Ljava/lang/String;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 116
    move-object v1, p1

    .line 118
    .local v1, "filePathAndDirectory":Ljava/lang/String;
    if-eqz p0, :cond_0

    .line 120
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 123
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 125
    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectory(Ljava/io/File;)Z

    move-result v2

    return v2
.end method

.method public static deleteContentsOfDirectory(Ljava/io/File;)V
    .locals 4
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 99
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 100
    .local v1, "deletionQueue":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/io/File;>;"
    invoke-virtual {v1, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 102
    :goto_0
    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 103
    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 104
    .local v2, "toDelete":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 105
    .local v0, "children":[Ljava/io/File;
    if-eqz v0, :cond_0

    array-length v3, v0

    if-nez v3, :cond_1

    .line 106
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 108
    :cond_1
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 109
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_0

    .line 112
    .end local v0    # "children":[Ljava/io/File;
    .end local v2    # "toDelete":Ljava/io/File;
    :cond_2
    return-void
.end method

.method public static documentsDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 55
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/emagine/app/EmagineApplication;->getFilesDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static fileExistsAtPath(Ljava/lang/String;)Z
    .locals 2
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    .line 66
    if-nez p0, :cond_0

    .line 68
    const/4 v1, 0x0

    .line 73
    :goto_0
    return v1

    .line 71
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 73
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    goto :goto_0
.end method

.method public static getFileWithName(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 78
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 80
    .local v0, "file":Ljava/io/File;
    return-object v0
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/EMTFileManager;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/disney/emagine/sdk/EMTFileManager;->instance:Lcom/disney/emagine/sdk/EMTFileManager;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lcom/disney/emagine/sdk/EMTFileManager;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/EMTFileManager;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/EMTFileManager;->instance:Lcom/disney/emagine/sdk/EMTFileManager;

    .line 47
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/EMTFileManager;->instance:Lcom/disney/emagine/sdk/EMTFileManager;

    return-object v0
.end method

.method public static utf8StringFromBytes([B)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B

    .prologue
    .line 205
    const/4 v1, 0x0

    .line 207
    .local v1, "utf8String":Ljava/lang/String;
    if-nez p0, :cond_0

    move-object v2, v1

    .line 221
    .end local v1    # "utf8String":Ljava/lang/String;
    .local v2, "utf8String":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 214
    .end local v2    # "utf8String":Ljava/lang/String;
    .restart local v1    # "utf8String":Ljava/lang/String;
    :cond_0
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "utf8String":Ljava/lang/String;
    .restart local v2    # "utf8String":Ljava/lang/String;
    move-object v1, v2

    .end local v2    # "utf8String":Ljava/lang/String;
    .restart local v1    # "utf8String":Ljava/lang/String;
    :goto_1
    move-object v2, v1

    .line 221
    .end local v1    # "utf8String":Ljava/lang/String;
    .restart local v2    # "utf8String":Ljava/lang/String;
    goto :goto_0

    .line 216
    .end local v2    # "utf8String":Ljava/lang/String;
    .restart local v1    # "utf8String":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 218
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1
.end method

.method public static utf8StringFromString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 226
    if-nez p0, :cond_0

    .line 228
    const/4 v0, 0x0

    .line 231
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTFileManager;->utf8StringFromBytes([B)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static writeToFile([BLjava/lang/String;)V
    .locals 5
    .param p0, "data"    # [B
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 163
    const/4 v1, 0x0

    .line 166
    .local v1, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .local v2, "out":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {v2, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 177
    if-eqz v2, :cond_2

    .line 179
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v1, v2

    .line 186
    .end local v2    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 180
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "out":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v3

    move-object v1, v2

    .line 182
    .end local v2    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 169
    :catch_1
    move-exception v0

    .line 171
    .local v0, "e":Ljava/io/FileNotFoundException;
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 177
    if-eqz v1, :cond_0

    .line 179
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 180
    :catch_2
    move-exception v3

    goto :goto_0

    .line 173
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_3
    move-exception v0

    .line 175
    .local v0, "e":Ljava/io/IOException;
    :goto_2
    :try_start_5
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 177
    if-eqz v1, :cond_0

    .line 179
    :try_start_6
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_0

    .line 180
    :catch_4
    move-exception v3

    goto :goto_0

    .line 177
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_3
    if-eqz v1, :cond_1

    .line 179
    :try_start_7
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 182
    :cond_1
    :goto_4
    throw v3

    .line 180
    :catch_5
    move-exception v4

    goto :goto_4

    .line 177
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 173
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "out":Ljava/io/FileOutputStream;
    :catch_6
    move-exception v0

    move-object v1, v2

    .end local v2    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 169
    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "out":Ljava/io/FileOutputStream;
    :catch_7
    move-exception v0

    move-object v1, v2

    .end local v2    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v1    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "out":Ljava/io/FileOutputStream;
    :cond_2
    move-object v1, v2

    .end local v2    # "out":Ljava/io/FileOutputStream;
    .restart local v1    # "out":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method public static writeToFile([BLjava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p0, "data"    # [B
    .param p1, "dirPath"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 193
    .local v0, "file":Ljava/io/File;
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTFileManager;->createDirectory(Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 195
    sget-object v2, Lcom/disney/emagine/sdk/EMTFileManager;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/EMTFileManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Create directory error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "Attempt to create directory %s failed."

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "could not create directory "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 199
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 200
    .local v1, "filePath":Ljava/lang/String;
    invoke-static {p0, v1}, Lcom/disney/emagine/sdk/EMTFileManager;->writeToFile([BLjava/lang/String;)V

    .line 201
    return-void
.end method
