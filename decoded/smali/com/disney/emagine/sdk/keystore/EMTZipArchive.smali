.class public Lcom/disney/emagine/sdk/keystore/EMTZipArchive;
.super Ljava/lang/Object;
.source "EMTZipArchive.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x4000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static unzip(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 13
    .param p0, "zipFile"    # Ljava/lang/String;
    .param p1, "location"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    const/4 v7, 0x0

    .line 27
    .local v7, "result":Z
    const/16 v10, 0x4000

    new-array v0, v10, [B

    .line 31
    .local v0, "buffer":[B
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-nez v10, :cond_0

    .line 35
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 38
    :cond_0
    new-instance v9, Ljava/util/zip/ZipInputStream;

    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v10}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 40
    .local v9, "zin":Ljava/util/zip/ZipInputStream;
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v8

    .line 42
    .local v8, "ze":Ljava/util/zip/ZipEntry;
    :goto_0
    if-eqz v8, :cond_2

    .line 43
    invoke-virtual {v8}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    .line 44
    .local v3, "fileName":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 46
    .local v6, "newFile":Ljava/io/File;
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "file to unzip = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 49
    new-instance v10, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 51
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 53
    .local v4, "fos":Ljava/io/FileOutputStream;
    :goto_1
    invoke-virtual {v9, v0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v5

    .local v5, "len":I
    if-lez v5, :cond_1

    .line 54
    const/4 v10, 0x0

    invoke-virtual {v4, v0, v10, v5}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 64
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "fileName":Ljava/lang/String;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "len":I
    .end local v6    # "newFile":Ljava/io/File;
    .end local v8    # "ze":Ljava/util/zip/ZipEntry;
    .end local v9    # "zin":Ljava/util/zip/ZipInputStream;
    :catch_0
    move-exception v1

    .line 65
    .local v1, "ex":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 67
    .end local v1    # "ex":Ljava/io/IOException;
    :goto_2
    return v7

    .line 57
    .restart local v2    # "f":Ljava/io/File;
    .restart local v3    # "fileName":Ljava/lang/String;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "len":I
    .restart local v6    # "newFile":Ljava/io/File;
    .restart local v8    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v9    # "zin":Ljava/util/zip/ZipInputStream;
    :cond_1
    :try_start_1
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 58
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v8

    .line 59
    goto :goto_0

    .line 61
    .end local v3    # "fileName":Ljava/lang/String;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "len":I
    .end local v6    # "newFile":Ljava/io/File;
    :cond_2
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 62
    invoke-virtual {v9}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 63
    const/4 v7, 0x1

    goto :goto_2
.end method
