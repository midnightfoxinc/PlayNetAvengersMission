.class public abstract Lcom/disney/id/android/external/DIDExternalData;
.super Ljava/lang/Object;
.source "DIDExternalData.java"


# static fields
.field public static final ACCOUNT_NAME_KEY:Ljava/lang/String; = "accountName"

.field public static final EMAIL_KEY:Ljava/lang/String; = "email"

.field public static final EXTERNAL_DISPLAY_NAME:Ljava/lang/String; = "externalDisplayName"

.field public static final EXTERNAL_ID_KEY:Ljava/lang/String; = "externalId"

.field public static final EXTERNAL_TOKEN_KEY:Ljava/lang/String; = "externalToken"

.field public static final NAMESPACE_KEY:Ljava/lang/String; = "namespace"

.field public static final USER_PROFILE_KEY:Ljava/lang/String; = "userProfile"


# instance fields
.field private externalId:Ljava/lang/String;

.field private externalToken:Ljava/lang/String;

.field private namespace:Ljava/lang/String;

.field private profile:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->namespace:Ljava/lang/String;

    .line 12
    iput-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->externalId:Ljava/lang/String;

    .line 13
    iput-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->externalToken:Ljava/lang/String;

    .line 26
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    .line 27
    return-void
.end method

.method private getProfileData(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 139
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 142
    :goto_0
    return-object v0

    .line 140
    :catch_0
    move-exception v0

    .line 142
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAccountName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    const-string v0, "accountName"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDateOfBirth()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    const-string v0, "dateOfBirth"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    const-string v0, "displayName"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    const-string v0, "email"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExternalId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->externalId:Ljava/lang/String;

    return-object v0
.end method

.method public getExternalToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->externalToken:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    const-string v0, "firstName"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGender()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    const-string v0, "gender"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLanguagePreference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    const-string v0, "languagePreference"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    const-string v0, "lastName"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLoginInput()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 201
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 203
    .local v1, "params":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "namespace"

    invoke-virtual {p0}, Lcom/disney/id/android/external/DIDExternalData;->getNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 204
    const-string v2, "externalId"

    invoke-virtual {p0}, Lcom/disney/id/android/external/DIDExternalData;->getExternalId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 205
    const-string v2, "externalToken"

    invoke-virtual {p0}, Lcom/disney/id/android/external/DIDExternalData;->getExternalToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 206
    invoke-virtual {p0}, Lcom/disney/id/android/external/DIDExternalData;->getEmail()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 207
    const-string v2, "email"

    invoke-virtual {p0}, Lcom/disney/id/android/external/DIDExternalData;->getEmail()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .end local v1    # "params":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-object v1

    .line 208
    .restart local v1    # "params":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 209
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getMiddleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    const-string v0, "middleName"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->namespace:Ljava/lang/String;

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 158
    const-string v0, "prefix"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProfileJSON()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getProfileString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 197
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 174
    const-string v0, "suffix"

    invoke-direct {p0, v0}, Lcom/disney/id/android/external/DIDExternalData;->getProfileData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parseSocialData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 31
    return-void
.end method

.method public setAccountName(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 61
    const-string v0, "accountName"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public setDateOfBirth(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 69
    const-string v0, "dateOfBirth"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 93
    const-string v0, "displayName"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 65
    const-string v0, "email"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public setExternalId(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/disney/id/android/external/DIDExternalData;->externalId:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setExternalToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/disney/id/android/external/DIDExternalData;->externalToken:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setFirstName(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 77
    const-string v0, "firstName"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method public setGender(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 97
    const-string v0, "gender"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public setLanguagePreference(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 101
    const-string v0, "languagePreference"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 85
    const-string v0, "lastName"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public setMiddleName(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 81
    const-string v0, "middleName"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public setNamespace(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/disney/id/android/external/DIDExternalData;->namespace:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 73
    const-string v0, "prefix"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method protected setProfileData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    .line 56
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public setProfileJSON(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "value"    # Lorg/json/JSONObject;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/disney/id/android/external/DIDExternalData;->profile:Lorg/json/JSONObject;

    .line 106
    return-void
.end method

.method public setProfileString(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 109
    if-eqz p1, :cond_0

    .line 111
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileJSON(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0, v1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileJSON(Lorg/json/JSONObject;)V

    goto :goto_0
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 89
    const-string v0, "suffix"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/external/DIDExternalData;->setProfileData(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    return-void
.end method
