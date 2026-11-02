.class Lcom/disney/id/android/log/CircularLoggingRequestQueue;
.super Ljava/lang/Object;
.source "CircularLoggingRequestQueue.java"

# interfaces
.implements Lcom/disney/id/android/log/LoggingListener;


# static fields
.field static final FILE_POINTER_STORAGE_NAME:Ljava/lang/String; = "filePointerStorage"

.field static final MAXIMUM_NUMBER_OF_REQUESTS:I = 0x100

.field static final NEXT_FILE_TO_WRITE_POINTER:Ljava/lang/String; = "currentFile"

.field static final OLDEST_FILE_POINTER:Ljava/lang/String; = "oldestFile"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private context:Landroid/content/Context;

.field private filePointerStorage:Landroid/content/SharedPreferences;

.field private loggingFilePrefix:Ljava/lang/String;

.field private requests:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "loggingFilePrefix"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const-string v0, "_"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .end local p2    # "loggingFilePrefix":Ljava/lang/String;
    :goto_0
    iput-object p2, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->loggingFilePrefix:Ljava/lang/String;

    .line 36
    iput-object p1, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->context:Landroid/content/Context;

    .line 37
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    .line 38
    const-string v0, "filePointerStorage"

    invoke-virtual {p1, v0, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->filePointerStorage:Landroid/content/SharedPreferences;

    .line 39
    iget-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    new-instance v1, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;

    iget-object v2, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->loggingFilePrefix:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->getAllStoredRequests()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Queue;->addAll(Ljava/util/Collection;)Z

    .line 40
    iget-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->filePointerStorage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "oldestFile"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "currentFile"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 48
    :cond_0
    return-void

    .line 35
    .restart local p2    # "loggingFilePrefix":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method private isQueueFull()Z
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private nextSafePosition(I)I
    .locals 1
    .param p1, "current"    # I

    .prologue
    .line 109
    add-int/lit8 v0, p1, 0x1

    rem-int/lit16 v0, v0, 0x100

    return v0
.end method

.method private removeOldestRequest()V
    .locals 4

    .prologue
    .line 99
    iget-object v1, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    .line 100
    iget-object v1, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->filePointerStorage:Landroid/content/SharedPreferences;

    const-string v2, "oldestFile"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 101
    .local v0, "oldestFilePointer":I
    iget-object v1, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->context:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->loggingFilePrefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 102
    iget-object v1, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->filePointerStorage:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "oldestFile"

    invoke-direct {p0, v0}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->nextSafePosition(I)I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 106
    return-void
.end method


# virtual methods
.method add(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "request"    # Lorg/json/JSONObject;

    .prologue
    const/4 v6, 0x0

    .line 51
    invoke-direct {p0}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->isQueueFull()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 52
    invoke-direct {p0}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->removeOldestRequest()V

    .line 55
    :cond_0
    iget-object v4, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->filePointerStorage:Landroid/content/SharedPreferences;

    const-string v5, "currentFile"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 56
    .local v2, "newestFilePointer":I
    iget-object v4, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->filePointerStorage:Landroid/content/SharedPreferences;

    const-string v5, "oldestFile"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 58
    .local v3, "oldestFilePointer":I
    :try_start_0
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    iget-object v5, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->context:Landroid/content/Context;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->loggingFilePrefix:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .local v1, "fileWriter":Ljava/io/BufferedWriter;
    :try_start_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 68
    .end local v1    # "fileWriter":Ljava/io/BufferedWriter;
    :goto_0
    iget-object v4, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->filePointerStorage:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "currentFile"

    invoke-direct {p0, v2}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->nextSafePosition(I)I

    move-result v6

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 73
    iget-object v4, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    invoke-interface {v4, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 74
    return-void

    .line 62
    .restart local v1    # "fileWriter":Ljava/io/BufferedWriter;
    :catchall_0
    move-exception v4

    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V

    throw v4
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 64
    .end local v1    # "fileWriter":Ljava/io/BufferedWriter;
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/io/IOException;
    sget-object v4, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->TAG:Ljava/lang/String;

    const-string v5, "An issue occurred writing to the circular file buffer. This shouldn\'t happen!"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public loggingAttemptSuccessful()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->removeOldestRequest()V

    .line 91
    return-void
.end method

.method public loggingAttemptUnexpectedFailure()V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->removeOldestRequest()V

    .line 96
    return-void
.end method

.method peek()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    return-object v0
.end method

.method size()I
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/disney/id/android/log/CircularLoggingRequestQueue;->requests:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    return v0
.end method
