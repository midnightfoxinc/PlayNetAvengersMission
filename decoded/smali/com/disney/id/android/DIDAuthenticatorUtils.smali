.class public Lcom/disney/id/android/DIDAuthenticatorUtils;
.super Ljava/lang/Object;
.source "DIDAuthenticatorUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAuthenticatorData()Lcom/disney/id/android/localdata/DIDLocalData;
    .locals 4

    .prologue
    .line 13
    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->createRawAuthenticatorData()Ljava/lang/String;

    move-result-object v2

    .line 14
    .local v2, "rawAuthenticatorData":Ljava/lang/String;
    const/4 v0, 0x0

    .line 16
    .local v0, "authenticatorData":Lcom/disney/id/android/localdata/DIDLocalData;
    :try_start_0
    new-instance v1, Lcom/disney/id/android/localdata/DIDLocalData;

    invoke-direct {v1, v2}, Lcom/disney/id/android/localdata/DIDLocalData;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "authenticatorData":Lcom/disney/id/android/localdata/DIDLocalData;
    .local v1, "authenticatorData":Lcom/disney/id/android/localdata/DIDLocalData;
    move-object v0, v1

    .line 19
    .end local v1    # "authenticatorData":Lcom/disney/id/android/localdata/DIDLocalData;
    .restart local v0    # "authenticatorData":Lcom/disney/id/android/localdata/DIDLocalData;
    :goto_0
    return-object v0

    .line 17
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static createAuthenticatorRetrievalKey()Lcom/disney/id/android/localdata/DIDLocalData;
    .locals 3

    .prologue
    .line 37
    const/4 v0, 0x0

    .line 40
    .local v0, "authenticatorRetrievalKey":Lcom/disney/id/android/localdata/DIDLocalData;
    :try_start_0
    new-instance v1, Lcom/disney/id/android/localdata/DIDLocalData;

    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->createRawAuthenticatorRetrievalKey()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/disney/id/android/localdata/DIDLocalData;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "authenticatorRetrievalKey":Lcom/disney/id/android/localdata/DIDLocalData;
    .local v1, "authenticatorRetrievalKey":Lcom/disney/id/android/localdata/DIDLocalData;
    move-object v0, v1

    .line 43
    .end local v1    # "authenticatorRetrievalKey":Lcom/disney/id/android/localdata/DIDLocalData;
    .restart local v0    # "authenticatorRetrievalKey":Lcom/disney/id/android/localdata/DIDLocalData;
    :goto_0
    return-object v0

    .line 41
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private static createRawAuthenticatorData()Ljava/lang/String;
    .locals 5

    .prologue
    .line 23
    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->retrieveAuthenticatorKey()Ljava/lang/String;

    move-result-object v1

    .line 24
    .local v1, "authenticatorStorageKey":Ljava/lang/String;
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDToken;->getAuthenticator()Ljava/lang/String;

    move-result-object v2

    .line 26
    .local v2, "authenticatorValue":Ljava/lang/String;
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 27
    .local v3, "keysJSON":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 29
    .local v0, "authenticatorJSON":Lorg/json/JSONObject;
    :try_start_0
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    const-string v4, "keys"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 31
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private static createRawAuthenticatorRetrievalKey()Ljava/lang/String;
    .locals 4

    .prologue
    .line 47
    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->retrieveAuthenticatorKey()Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "rawAuthenticatorKey":Ljava/lang/String;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 50
    .local v1, "keysJSON":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 52
    .local v0, "authenticatorJSON":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    const-string v3, "keys"

    invoke-virtual {v1, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 54
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static retrieveAuthenticatorKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".auth"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
