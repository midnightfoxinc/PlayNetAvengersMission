.class public Lcom/disneymobile/mocha/NSFileManager;
.super Ljava/lang/Object;
.source "NSFileManager.java"


# static fields
.field private static defaultManager:Lcom/disneymobile/mocha/NSFileManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    new-instance v0, Lcom/disneymobile/mocha/NSFileManager;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSFileManager;-><init>()V

    sput-object v0, Lcom/disneymobile/mocha/NSFileManager;->defaultManager:Lcom/disneymobile/mocha/NSFileManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static defaultManager()Lcom/disneymobile/mocha/NSFileManager;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/disneymobile/mocha/NSFileManager;->defaultManager:Lcom/disneymobile/mocha/NSFileManager;

    return-object v0
.end method

.method private moveItemAtPathToPath(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1
    .param p1, "srcPath"    # Ljava/io/File;
    .param p2, "dstPath"    # Ljava/lang/String;

    .prologue
    .line 138
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public contentsOfDirectoryAtPathAndError(Ljava/lang/String;Lcom/disneymobile/mocha/support/Out;)[Ljava/lang/String;
    .locals 12
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p2, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 107
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 108
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    .line 109
    .local v4, "fileExists":Z
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v6

    .line 111
    .local v6, "isDirectory":Z
    if-eqz v4, :cond_0

    if-eqz v6, :cond_0

    .line 112
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v7

    .line 113
    .local v7, "listFiles":[Ljava/io/File;
    array-length v1, v7

    .line 114
    .local v1, "count":I
    new-array v0, v1, [Ljava/lang/String;

    .line 116
    .local v0, "contents":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v8, v7

    if-ge v5, v8, :cond_2

    .line 117
    aget-object v8, v7, v5

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v0, v5

    .line 116
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 122
    .end local v0    # "contents":[Ljava/lang/String;
    .end local v1    # "count":I
    .end local v5    # "i":I
    .end local v7    # "listFiles":[Ljava/io/File;
    :cond_0
    if-eqz v4, :cond_3

    .line 123
    if-eqz p2, :cond_1

    .line 124
    const-string v8, "kMochaDomain"

    const/16 v9, -0x7d3

    invoke-static {v8, v9, v11}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v2

    .line 125
    .local v2, "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p2, v2}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 127
    .end local v2    # "error":Lcom/disneymobile/mocha/NSError;
    :cond_1
    new-array v0, v10, [Ljava/lang/String;

    .line 133
    :cond_2
    :goto_1
    return-object v0

    .line 129
    :cond_3
    if-eqz p2, :cond_4

    .line 130
    const-string v8, "kMochaDomain"

    const/16 v9, -0x7d2

    invoke-static {v8, v9, v11}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v2

    .line 131
    .restart local v2    # "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p2, v2}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 133
    .end local v2    # "error":Lcom/disneymobile/mocha/NSError;
    :cond_4
    new-array v0, v10, [Ljava/lang/String;

    goto :goto_1
.end method

.method public copyItemAtPathToPathAndError(Ljava/lang/String;Ljava/lang/String;Lcom/disneymobile/mocha/support/Out;)Z
    .locals 9
    .param p1, "fromPath"    # Ljava/lang/String;
    .param p2, "toPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 82
    .local p3, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v1, 0x0

    .line 83
    .local v1, "fromStream":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 84
    .local v5, "toStream":Ljava/io/OutputStream;
    const/4 v3, 0x1

    .line 87
    .local v3, "success":Z
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    .end local v1    # "fromStream":Ljava/io/InputStream;
    .local v2, "fromStream":Ljava/io/InputStream;
    :try_start_1
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 89
    .local v4, "toFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    .line 90
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 92
    .end local v5    # "toStream":Ljava/io/OutputStream;
    .local v6, "toStream":Ljava/io/OutputStream;
    :try_start_2
    invoke-static {v2, v6}, Lcom/disneymobile/mocha/support/StreamUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_8
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 99
    if-eqz v2, :cond_0

    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 100
    :cond_0
    :goto_0
    if-eqz v6, :cond_6

    :try_start_4
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    move-object v5, v6

    .end local v6    # "toStream":Ljava/io/OutputStream;
    .restart local v5    # "toStream":Ljava/io/OutputStream;
    move-object v1, v2

    .line 103
    .end local v2    # "fromStream":Ljava/io/InputStream;
    .end local v4    # "toFile":Ljava/io/File;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    :cond_1
    :goto_1
    return v3

    .line 100
    .end local v1    # "fromStream":Ljava/io/InputStream;
    .end local v5    # "toStream":Ljava/io/OutputStream;
    .restart local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v4    # "toFile":Ljava/io/File;
    .restart local v6    # "toStream":Ljava/io/OutputStream;
    :catch_0
    move-exception v7

    move-object v5, v6

    .end local v6    # "toStream":Ljava/io/OutputStream;
    .restart local v5    # "toStream":Ljava/io/OutputStream;
    move-object v1, v2

    .end local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    goto :goto_1

    .line 93
    .end local v4    # "toFile":Ljava/io/File;
    :catch_1
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/IOException;
    :goto_2
    if-eqz p3, :cond_2

    .line 95
    :try_start_5
    invoke-static {v0}, Lcom/disneymobile/mocha/NSError;->errorWithException(Ljava/lang/Exception;)Lcom/disneymobile/mocha/NSError;

    move-result-object v7

    invoke-virtual {p3, v7}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 97
    :cond_2
    const/4 v3, 0x0

    .line 99
    if-eqz v1, :cond_3

    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 100
    :cond_3
    :goto_3
    if-eqz v5, :cond_1

    :try_start_7
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_1

    :catch_2
    move-exception v7

    goto :goto_1

    .line 99
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    :goto_4
    if-eqz v1, :cond_4

    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 100
    :cond_4
    :goto_5
    if-eqz v5, :cond_5

    :try_start_9
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    :cond_5
    :goto_6
    throw v7

    .line 99
    .end local v1    # "fromStream":Ljava/io/InputStream;
    .end local v5    # "toStream":Ljava/io/OutputStream;
    .restart local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v4    # "toFile":Ljava/io/File;
    .restart local v6    # "toStream":Ljava/io/OutputStream;
    :catch_3
    move-exception v7

    goto :goto_0

    .end local v2    # "fromStream":Ljava/io/InputStream;
    .end local v4    # "toFile":Ljava/io/File;
    .end local v6    # "toStream":Ljava/io/OutputStream;
    .restart local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    .restart local v5    # "toStream":Ljava/io/OutputStream;
    :catch_4
    move-exception v7

    goto :goto_3

    .end local v0    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v8

    goto :goto_5

    .line 100
    :catch_6
    move-exception v8

    goto :goto_6

    .line 99
    .end local v1    # "fromStream":Ljava/io/InputStream;
    .restart local v2    # "fromStream":Ljava/io/InputStream;
    :catchall_1
    move-exception v7

    move-object v1, v2

    .end local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    goto :goto_4

    .end local v1    # "fromStream":Ljava/io/InputStream;
    .end local v5    # "toStream":Ljava/io/OutputStream;
    .restart local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v4    # "toFile":Ljava/io/File;
    .restart local v6    # "toStream":Ljava/io/OutputStream;
    :catchall_2
    move-exception v7

    move-object v5, v6

    .end local v6    # "toStream":Ljava/io/OutputStream;
    .restart local v5    # "toStream":Ljava/io/OutputStream;
    move-object v1, v2

    .end local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    goto :goto_4

    .line 93
    .end local v1    # "fromStream":Ljava/io/InputStream;
    .end local v4    # "toFile":Ljava/io/File;
    .restart local v2    # "fromStream":Ljava/io/InputStream;
    :catch_7
    move-exception v0

    move-object v1, v2

    .end local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    goto :goto_2

    .end local v1    # "fromStream":Ljava/io/InputStream;
    .end local v5    # "toStream":Ljava/io/OutputStream;
    .restart local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v4    # "toFile":Ljava/io/File;
    .restart local v6    # "toStream":Ljava/io/OutputStream;
    :catch_8
    move-exception v0

    move-object v5, v6

    .end local v6    # "toStream":Ljava/io/OutputStream;
    .restart local v5    # "toStream":Ljava/io/OutputStream;
    move-object v1, v2

    .end local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    goto :goto_2

    .end local v1    # "fromStream":Ljava/io/InputStream;
    .end local v5    # "toStream":Ljava/io/OutputStream;
    .restart local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v6    # "toStream":Ljava/io/OutputStream;
    :cond_6
    move-object v5, v6

    .end local v6    # "toStream":Ljava/io/OutputStream;
    .restart local v5    # "toStream":Ljava/io/OutputStream;
    move-object v1, v2

    .end local v2    # "fromStream":Ljava/io/InputStream;
    .restart local v1    # "fromStream":Ljava/io/InputStream;
    goto :goto_1
.end method

.method public createDirectoryAtPath(Ljava/lang/String;)Z
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    return v0
.end method

.method public fileExistsAtPath(Ljava/lang/String;)Z
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 23
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public fileExistsAtPathAndIsDirectory(Ljava/lang/String;)Z
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 35
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 37
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public moveItemAtPathToPath(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "srcPath"    # Ljava/lang/String;
    .param p2, "dstPath"    # Ljava/lang/String;

    .prologue
    .line 27
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/disneymobile/mocha/NSFileManager;->moveItemAtPathToPath(Ljava/io/File;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public removeItemAtPathAndError(Ljava/lang/String;Lcom/disneymobile/mocha/support/Out;)Z
    .locals 13
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v12, 0x0

    .line 41
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    .line 43
    .local v3, "fileExists":Z
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v6

    .line 44
    .local v6, "isDirectory":Z
    move v9, v3

    .line 46
    .local v9, "success":Z
    if-eqz v3, :cond_1

    if-eqz v6, :cond_1

    .line 47
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    .line 49
    .local v8, "listFiles":[Ljava/io/File;
    move-object v0, v8

    .local v0, "arr$":[Ljava/io/File;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v7, :cond_1

    aget-object v4, v0, v5

    .line 50
    .local v4, "fileRef":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v10

    if-nez v10, :cond_3

    .line 51
    if-eqz p2, :cond_0

    .line 52
    const-string v10, "kMochaDomain"

    const/16 v11, -0x7d0

    invoke-static {v10, v11, v12}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 53
    .local v1, "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p2, v1}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 56
    .end local v1    # "error":Lcom/disneymobile/mocha/NSError;
    :cond_0
    const/4 v9, 0x0

    .line 63
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v4    # "fileRef":Ljava/io/File;
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .end local v8    # "listFiles":[Ljava/io/File;
    :cond_1
    if-eqz v3, :cond_4

    if-eqz v9, :cond_4

    .line 64
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v9

    .line 65
    if-nez v9, :cond_2

    .line 66
    if-eqz p2, :cond_2

    .line 67
    const-string v10, "kMochaDomain"

    const/16 v11, -0x7d1

    invoke-static {v10, v11, v12}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 68
    .restart local v1    # "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p2, v1}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 78
    .end local v1    # "error":Lcom/disneymobile/mocha/NSError;
    :cond_2
    :goto_1
    return v9

    .line 49
    .restart local v0    # "arr$":[Ljava/io/File;
    .restart local v4    # "fileRef":Ljava/io/File;
    .restart local v5    # "i$":I
    .restart local v7    # "len$":I
    .restart local v8    # "listFiles":[Ljava/io/File;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 72
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v4    # "fileRef":Ljava/io/File;
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .end local v8    # "listFiles":[Ljava/io/File;
    :cond_4
    if-eqz p2, :cond_2

    .line 73
    const-string v10, "kMochaDomain"

    const/16 v11, -0x7d2

    invoke-static {v10, v11, v12}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 74
    .restart local v1    # "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p2, v1}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    goto :goto_1
.end method
