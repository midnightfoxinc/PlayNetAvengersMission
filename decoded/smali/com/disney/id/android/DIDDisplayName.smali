.class public final Lcom/disney/id/android/DIDDisplayName;
.super Ljava/lang/Object;
.source "DIDDisplayName.java"

# interfaces
.implements Lcom/disney/id/android/constants/DIDDisplayNameConst;


# static fields
.field private static final DETAILS_KEY:Ljava/lang/String; = "details"

.field private static final RAW_KEY:Ljava/lang/String; = "raw"

.field private static final RESULT_KEY:Ljava/lang/String; = "result"


# instance fields
.field private final displayName:Lorg/json/JSONObject;

.field private final guest:Lorg/json/JSONObject;


# direct methods
.method protected constructor <init>(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "guest"    # Lorg/json/JSONObject;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    .line 21
    invoke-virtual {p0}, Lcom/disney/id/android/DIDDisplayName;->getDisplayNameJSON()Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    .line 22
    return-void
.end method


# virtual methods
.method public displayNameCreated()Z
    .locals 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    .line 44
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    const-string v1, "displayNameCreated"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    const-string v1, "displayNameCreated"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 50
    :goto_0
    return v0

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "displayNameCreated"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getBoolean(Lorg/json/JSONObject;Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 50
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public displayNameEnabled()Z
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "enabled"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getBoolean(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "displayName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayNameJSON()Lorg/json/JSONObject;
    .locals 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    const-string v1, "displayName"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    const-string v1, "displayName"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 34
    :goto_0
    return-object v0

    .line 32
    :catch_0
    move-exception v0

    .line 34
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getGenerationPrefix()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "generationPrefix"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModeratedStatusDate()J
    .locals 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "moderatedStatusDate"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->toUnixTime(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "namespace"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProposedDisplayName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "proposedDisplayName"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProposedStatus()Ljava/lang/String;
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "proposedStatus"

    invoke-static {v0, v1}, Lcom/disney/id/android/DIDUtils;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRawResultDetails()Lorg/json/JSONArray;
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 75
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->displayName:Lorg/json/JSONObject;

    const-string v1, "raw"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "result"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "details"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 80
    :goto_0
    return-object v0

    .line 78
    :catch_0
    move-exception v0

    .line 80
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasDisplayName()Z
    .locals 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/DIDDisplayName;->guest:Lorg/json/JSONObject;

    const-string v1, "displayName"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
