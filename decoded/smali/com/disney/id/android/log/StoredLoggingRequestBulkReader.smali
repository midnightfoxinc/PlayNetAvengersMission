.class Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;
.super Ljava/lang/Object;
.source "StoredLoggingRequestBulkReader.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private context:Landroid/content/Context;

.field private filePointerStorage:Landroid/content/SharedPreferences;

.field private loggingFilePrefix:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "loggingFilePrefix"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->loggingFilePrefix:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->context:Landroid/content/Context;

    .line 32
    const-string v0, "filePointerStorage"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->filePointerStorage:Landroid/content/SharedPreferences;

    .line 33
    return-void
.end method

.method private getRawJSON(I)Ljava/lang/String;
    .locals 8
    .param p1, "fileMarker"    # I

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .local v0, "builder":Ljava/lang/StringBuilder;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    iget-object v5, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->context:Landroid/content/Context;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->loggingFilePrefix:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 68
    .local v3, "reader":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "currentLine":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 72
    .end local v1    # "currentLine":Ljava/lang/String;
    :catchall_0
    move-exception v4

    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    throw v4
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 74
    .end local v3    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    .line 75
    .local v2, "e":Ljava/io/FileNotFoundException;
    sget-object v4, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->loggingFilePrefix:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " was not found. This shouldn\'t happen!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 72
    .restart local v1    # "currentLine":Ljava/lang/String;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :cond_0
    :try_start_3
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 76
    .end local v1    # "currentLine":Ljava/lang/String;
    .end local v3    # "reader":Ljava/io/BufferedReader;
    :catch_1
    move-exception v2

    .line 77
    .local v2, "e":Ljava/io/IOException;
    sget-object v4, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error reading "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->loggingFilePrefix:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". This shouldn\'t happen!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method getAllStoredRequests()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 36
    iget-object v7, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->filePointerStorage:Landroid/content/SharedPreferences;

    const-string v8, "oldestFile"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 37
    .local v3, "oldestFilePointer":I
    iget-object v7, p0, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->filePointerStorage:Landroid/content/SharedPreferences;

    const-string v8, "currentFile"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 40
    .local v0, "currentFilePointer":I
    new-instance v6, Ljava/util/ArrayList;

    sub-int v7, v0, v3

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 45
    .local v6, "requests":Ljava/util/List;, "Ljava/util/List<Lorg/json/JSONObject;>;"
    move v2, v3

    .local v2, "i":I
    :goto_0
    if-eq v2, v0, :cond_1

    .line 46
    const/4 v4, 0x0

    .line 48
    .local v4, "request":Lorg/json/JSONObject;
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {p0, v2}, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->getRawJSON(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4    # "request":Lorg/json/JSONObject;
    .local v5, "request":Lorg/json/JSONObject;
    move-object v4, v5

    .line 53
    .end local v5    # "request":Lorg/json/JSONObject;
    .restart local v4    # "request":Lorg/json/JSONObject;
    :goto_1
    if-eqz v4, :cond_0

    .line 54
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    :cond_0
    add-int/lit8 v7, v2, 0x1

    rem-int/lit16 v2, v7, 0x100

    goto :goto_0

    .line 49
    :catch_0
    move-exception v1

    .line 50
    .local v1, "e":Lorg/json/JSONException;
    sget-object v7, Lcom/disney/id/android/log/StoredLoggingRequestBulkReader;->TAG:Ljava/lang/String;

    const-string v8, "We should have never stored a null request."

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 58
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v4    # "request":Lorg/json/JSONObject;
    :cond_1
    return-object v6
.end method
