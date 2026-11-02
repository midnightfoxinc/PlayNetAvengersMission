.class public Lcom/disney/id/android/localdata/DIDLocalData;
.super Ljava/lang/Object;
.source "DIDLocalData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;
    }
.end annotation


# static fields
.field private static final CALLBACK:Ljava/lang/String; = "callback"

.field private static final DATA:Ljava/lang/String; = "data"

.field private static final KEYS:Ljava/lang/String; = "keys"


# instance fields
.field private callback:Ljava/lang/String;

.field private data:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 12
    .param p1, "jsonAsString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 28
    .local v3, "json":Lorg/json/JSONObject;
    const-string v10, "callback"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 30
    :try_start_1
    const-string v10, "callback"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/disney/id/android/localdata/DIDLocalData;->callback:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 37
    :cond_0
    :try_start_2
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    iput-object v10, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    .line 38
    const-string v10, "keys"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_1

    const-string v10, "keys"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 39
    .local v8, "keysObject":Ljava/lang/Object;
    :goto_0
    instance-of v10, v8, Lorg/json/JSONObject;

    if-eqz v10, :cond_3

    .line 40
    move-object v0, v8

    check-cast v0, Lorg/json/JSONObject;

    move-object v7, v0

    .line 41
    .local v7, "keysJSON":Lorg/json/JSONObject;
    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v6

    .line 42
    .local v6, "keysIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 43
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 44
    .local v5, "key":Ljava/lang/String;
    iget-object v11, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    invoke-virtual {v7, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, ""

    :goto_2
    invoke-virtual {v11, v5, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 54
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "keysIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v7    # "keysJSON":Lorg/json/JSONObject;
    .end local v8    # "keysObject":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 55
    .local v1, "e":Lorg/json/JSONException;
    new-instance v10, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;

    invoke-virtual {v1}, Lorg/json/JSONException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, p0, v11}, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;-><init>(Lcom/disney/id/android/localdata/DIDLocalData;Ljava/lang/String;)V

    throw v10

    .line 24
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v3    # "json":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    .line 25
    .local v1, "e":Ljava/lang/Exception;
    new-instance v10, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;

    invoke-direct {v10, p0}, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;-><init>(Lcom/disney/id/android/localdata/DIDLocalData;)V

    throw v10

    .line 31
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "json":Lorg/json/JSONObject;
    :catch_2
    move-exception v1

    .line 32
    .restart local v1    # "e":Ljava/lang/Exception;
    new-instance v10, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;

    invoke-direct {v10, p0}, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;-><init>(Lcom/disney/id/android/localdata/DIDLocalData;)V

    throw v10

    .line 38
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_3
    const-string v10, "data"

    invoke-virtual {v3, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    goto :goto_0

    .line 44
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v6    # "keysIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v7    # "keysJSON":Lorg/json/JSONObject;
    .restart local v8    # "keysObject":Ljava/lang/Object;
    :cond_2
    invoke-virtual {v7, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_2

    .line 46
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "keysIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v7    # "keysJSON":Lorg/json/JSONObject;
    :cond_3
    instance-of v10, v8, Lorg/json/JSONArray;

    if-eqz v10, :cond_4

    .line 47
    move-object v0, v8

    check-cast v0, Lorg/json/JSONArray;

    move-object v7, v0

    .line 48
    .local v7, "keysJSON":Lorg/json/JSONArray;
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    .line 49
    .local v9, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    if-ge v2, v9, :cond_4

    .line 50
    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 51
    .local v4, "k":Ljava/lang/String;
    iget-object v10, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    const-string v11, ""

    invoke-virtual {v10, v4, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 49
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 57
    .end local v2    # "i":I
    .end local v4    # "k":Ljava/lang/String;
    .end local v7    # "keysJSON":Lorg/json/JSONArray;
    .end local v9    # "length":I
    :cond_4
    return-void
.end method


# virtual methods
.method public formatResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/disney/id/android/localdata/DIDLocalData;->hasData()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 93
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCallback()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disney/id/android/localdata/DIDLocalData;->callback:Ljava/lang/String;

    return-object v0
.end method

.method public getData()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    return-object v0
.end method

.method public hasCallback()Z
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/id/android/localdata/DIDLocalData;->callback:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasData()Z
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "jsonAsString"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-static {p2}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    :goto_0
    return-void

    .line 72
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 73
    .local v0, "jsonValue":Lorg/json/JSONObject;
    iget-object v1, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 75
    .end local v0    # "jsonValue":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 77
    :try_start_1
    iget-object v1, p0, Lcom/disney/id/android/localdata/DIDLocalData;->data:Lorg/json/JSONObject;

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 78
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/disney/id/android/localdata/DIDLocalData;->formatResponse()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
