.class public Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;
.super Ljava/lang/Object;
.source "PropertiesBasedResumableProcessor.java"

# interfaces
.implements Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;


# static fields
.field private static final TMP:Ljava/io/File;

.field private static final log:Lorg/slf4j/Logger;

.field private static final storeName:Ljava/lang/String; = "ResumableAsyncHandler.properties"


# instance fields
.field private final properties:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 33
    const-class v0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->log:Lorg/slf4j/Logger;

    .line 34
    new-instance v0, Ljava/io/File;

    const-string v1, "java.io.tmpdir"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ahc"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->TMP:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method private static append(Ljava/util/Map$Entry;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v0, 0x3d

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public load()Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    const/4 v2, 0x0

    .line 89
    .local v2, "scan":Ljava/util/Scanner;
    :try_start_0
    new-instance v3, Ljava/util/Scanner;

    new-instance v5, Ljava/io/File;

    sget-object v6, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->TMP:Ljava/io/File;

    const-string v7, "ResumableAsyncHandler.properties"

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v6}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Ljava/util/Scanner;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .end local v2    # "scan":Ljava/util/Scanner;
    .local v3, "scan":Ljava/util/Scanner;
    :try_start_1
    const-string v5, "[=\n]"

    invoke-virtual {v3, v5}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 94
    :goto_0
    invoke-virtual {v3}, Ljava/util/Scanner;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 95
    invoke-virtual {v3}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 96
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 97
    .local v4, "value":Ljava/lang/String;
    iget-object v5, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v1, v6}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 100
    .end local v1    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object v2, v3

    .line 101
    .end local v3    # "scan":Ljava/util/Scanner;
    .local v0, "ex":Ljava/io/FileNotFoundException;
    .restart local v2    # "scan":Ljava/util/Scanner;
    :goto_1
    :try_start_2
    sget-object v5, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->log:Lorg/slf4j/Logger;

    const-string v6, "Missing {}"

    const-string v7, "ResumableAsyncHandler.properties"

    invoke-interface {v5, v6, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    if-eqz v2, :cond_0

    .line 107
    invoke-virtual {v2}, Ljava/util/Scanner;->close()V

    .line 109
    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    :cond_0
    :goto_2
    iget-object v5, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v5

    .line 99
    .end local v2    # "scan":Ljava/util/Scanner;
    .restart local v3    # "scan":Ljava/util/Scanner;
    :cond_1
    :try_start_3
    sget-object v5, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->log:Lorg/slf4j/Logger;

    const-string v6, "Loading previous download state {}"

    iget-object v7, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 106
    if-eqz v3, :cond_3

    .line 107
    invoke-virtual {v3}, Ljava/util/Scanner;->close()V

    move-object v2, v3

    .end local v3    # "scan":Ljava/util/Scanner;
    .restart local v2    # "scan":Ljava/util/Scanner;
    goto :goto_2

    .line 102
    :catch_1
    move-exception v0

    .line 104
    .local v0, "ex":Ljava/lang/Throwable;
    :goto_3
    :try_start_4
    sget-object v5, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->log:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 106
    if-eqz v2, :cond_0

    .line 107
    invoke-virtual {v2}, Ljava/util/Scanner;->close()V

    goto :goto_2

    .line 106
    .end local v0    # "ex":Ljava/lang/Throwable;
    :catchall_0
    move-exception v5

    :goto_4
    if-eqz v2, :cond_2

    .line 107
    invoke-virtual {v2}, Ljava/util/Scanner;->close()V

    :cond_2
    throw v5

    .line 106
    .end local v2    # "scan":Ljava/util/Scanner;
    .restart local v3    # "scan":Ljava/util/Scanner;
    :catchall_1
    move-exception v5

    move-object v2, v3

    .end local v3    # "scan":Ljava/util/Scanner;
    .restart local v2    # "scan":Ljava/util/Scanner;
    goto :goto_4

    .line 102
    .end local v2    # "scan":Ljava/util/Scanner;
    .restart local v3    # "scan":Ljava/util/Scanner;
    :catch_2
    move-exception v0

    move-object v2, v3

    .end local v3    # "scan":Ljava/util/Scanner;
    .restart local v2    # "scan":Ljava/util/Scanner;
    goto :goto_3

    .line 100
    :catch_3
    move-exception v0

    goto :goto_1

    .end local v2    # "scan":Ljava/util/Scanner;
    .restart local v3    # "scan":Ljava/util/Scanner;
    :cond_3
    move-object v2, v3

    .end local v3    # "scan":Ljava/util/Scanner;
    .restart local v2    # "scan":Ljava/util/Scanner;
    goto :goto_2
.end method

.method public put(Ljava/lang/String;J)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "transferredBytes"    # J

    .prologue
    .line 40
    iget-object v0, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 45
    if-eqz p1, :cond_0

    .line 46
    iget-object v0, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    :cond_0
    return-void
.end method

.method public save(Ljava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    sget-object v6, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->log:Lorg/slf4j/Logger;

    const-string v7, "Saving current download state {}"

    iget-object v8, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v8}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    const/4 v4, 0x0

    .line 56
    .local v4, "os":Ljava/io/FileOutputStream;
    :try_start_0
    sget-object v6, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->TMP:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    sget-object v6, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->TMP:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v6

    if-nez v6, :cond_1

    .line 57
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to create directory: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->TMP:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    :try_start_1
    sget-object v6, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->log:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    if-eqz v4, :cond_0

    .line 77
    invoke-static {v4}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 79
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_0
    :goto_1
    return-void

    .line 59
    :cond_1
    :try_start_2
    new-instance v2, Ljava/io/File;

    sget-object v6, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->TMP:Ljava/io/File;

    const-string v7, "ResumableAsyncHandler.properties"

    invoke-direct {v2, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 60
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    move-result v6

    if-nez v6, :cond_3

    .line 61
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to create temp file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    .end local v2    # "f":Ljava/io/File;
    :catchall_0
    move-exception v6

    :goto_2
    if-eqz v4, :cond_2

    .line 77
    invoke-static {v4}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    :cond_2
    throw v6

    .line 63
    .restart local v2    # "f":Ljava/io/File;
    :cond_3
    :try_start_3
    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v6

    if-nez v6, :cond_4

    .line 64
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 67
    :cond_4
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 69
    .end local v4    # "os":Ljava/io/FileOutputStream;
    .local v5, "os":Ljava/io/FileOutputStream;
    :try_start_4
    iget-object v6, p0, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->properties:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v6}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 70
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-static {v1}, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;->append(Ljava/util/Map$Entry;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v6, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/FileOutputStream;->write([B)V

    goto :goto_3

    .line 73
    .end local v1    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v0

    move-object v4, v5

    .end local v5    # "os":Ljava/io/FileOutputStream;
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 72
    .end local v4    # "os":Ljava/io/FileOutputStream;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "os":Ljava/io/FileOutputStream;
    :cond_5
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 76
    if-eqz v5, :cond_6

    .line 77
    invoke-static {v5}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    move-object v4, v5

    .end local v5    # "os":Ljava/io/FileOutputStream;
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 76
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "os":Ljava/io/FileOutputStream;
    .restart local v5    # "os":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "os":Ljava/io/FileOutputStream;
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    goto :goto_2

    .end local v4    # "os":Ljava/io/FileOutputStream;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "os":Ljava/io/FileOutputStream;
    :cond_6
    move-object v4, v5

    .end local v5    # "os":Ljava/io/FileOutputStream;
    .restart local v4    # "os":Ljava/io/FileOutputStream;
    goto :goto_1
.end method
