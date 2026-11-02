.class public Lcom/disney/id/android/DIDSessionConfigUtils;
.super Ljava/lang/Object;
.source "DIDSessionConfigUtils.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/disney/id/android/DIDSessionConfigUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/disney/id/android/DIDSessionConfigUtils;->$assertionsDisabled:Z

    .line 24
    const-class v0, Lcom/disney/id/android/DIDSessionConfigUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionConfigUtils;->TAG:Ljava/lang/String;

    return-void

    .line 23
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getApplicationMetaData(Landroid/content/Context;)Landroid/os/Bundle;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 72
    .local v1, "applicationContext":Landroid/content/Context;
    if-eqz v1, :cond_0

    .line 74
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 76
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    :goto_0
    return-object v2

    .line 77
    :catch_0
    move-exception v2

    .line 79
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static getRawEnvironments()Ljava/lang/String;
    .locals 7

    .prologue
    .line 48
    const-class v5, Lcom/disney/id/android/DIDSessionConfigUtils;

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    const-string v6, "res/raw/did_environments.json"

    invoke-virtual {v5, v6}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 49
    .local v4, "stream":Ljava/io/InputStream;
    sget-boolean v5, Lcom/disney/id/android/DIDSessionConfigUtils;->$assertionsDisabled:Z

    if-nez v5, :cond_0

    if-nez v4, :cond_0

    new-instance v5, Ljava/lang/AssertionError;

    const-string v6, "The file containing environment information should exist in the project!"

    invoke-direct {v5, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .local v0, "builder":Ljava/lang/StringBuilder;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .local v3, "reader":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "currentLine":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 61
    .end local v1    # "currentLine":Ljava/lang/String;
    :catchall_0
    move-exception v5

    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    throw v5
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 63
    .end local v3    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    .line 64
    .local v2, "e":Ljava/io/IOException;
    sget-object v5, Lcom/disney/id/android/DIDSessionConfigUtils;->TAG:Ljava/lang/String;

    invoke-static {v5}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Problems reading environment configuration from resources."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .end local v2    # "e":Ljava/io/IOException;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 61
    .restart local v1    # "currentLine":Ljava/lang/String;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :cond_1
    :try_start_3
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1
.end method

.method public static loadEnvironments()Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/disney/id/android/EnvironmentInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 30
    .local v1, "environments":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/disney/id/android/EnvironmentInformation;>;"
    const/4 v5, 0x0

    .line 32
    .local v5, "parsedEnvironments":Lorg/json/JSONArray;
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfigUtils;->getRawEnvironments()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v7, "environments"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 36
    :goto_0
    sget-boolean v6, Lcom/disney/id/android/DIDSessionConfigUtils;->$assertionsDisabled:Z

    if-nez v6, :cond_0

    if-nez v5, :cond_0

    new-instance v6, Ljava/lang/AssertionError;

    const-string v7, "Bad environment config file. Did you recently change did_environments.json?"

    invoke-direct {v6, v7}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6

    .line 33
    :catch_0
    move-exception v0

    .line 34
    .local v0, "e":Lorg/json/JSONException;
    sget-object v6, Lcom/disney/id/android/DIDSessionConfigUtils;->TAG:Ljava/lang/String;

    invoke-static {v6}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "Something went wrong parsing the environment configurations"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 38
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 39
    .local v4, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_1

    .line 40
    new-instance v3, Lcom/disney/id/android/EnvironmentInformation;

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v3, v6}, Lcom/disney/id/android/EnvironmentInformation;-><init>(Lorg/json/JSONObject;)V

    .line 41
    .local v3, "information":Lcom/disney/id/android/EnvironmentInformation;
    invoke-virtual {v3}, Lcom/disney/id/android/EnvironmentInformation;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 44
    .end local v3    # "information":Lcom/disney/id/android/EnvironmentInformation;
    :cond_1
    return-object v1
.end method
